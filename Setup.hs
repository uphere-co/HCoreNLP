import Data.Monoid
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Simple.Build
import Distribution.Simple.LocalBuildInfo

import System.Directory
import System.Environment
import System.FilePath
import System.Process


main = defaultMainWithHooks myConfigHook

myConfigHook = simpleUserHooks
               { confHook = hookfunction
               -- , preBuild = myPrebuild <> preBuild simpleUserHooks
               , buildHook = myBuild <> buildHook simpleUserHooks 
               }

hookfunction x@(gpdesc,hbi) cflags = do
  binfo <- confHook simpleUserHooks x cflags
  -- print cflags
  let pdesc = packageDescription gpdesc
  return binfo

setClasspath bdir = do
  mocpath <- lookupEnv "CLASSPATH"
  -- cwd <- getCurrentDirectory
  let jarpath = bdir </> "HCoreNLPProto.jar"
  case mocpath of
    Nothing -> do
      setEnv "CLASSPATH" jarpath
    Just ocpath -> do
      setEnv "CLASSPATH" (ocpath ++ ":" ++ jarpath)
      p <- getEnv "CLASSPATH"
      print p
  return (Nothing,[])

myBuild pdesc lbi hooks bflags = do
  let bdir = buildDir lbi
  -- -emp <- getTemporaryDirectory
  -- print temp
  -- print (dataDir (packageDescription gpdesc))
  
  let javafiles = filter (\x->takeExtensions x == ".java") $ extraSrcFiles (localPkgDescr lbi)
  -- print pdesc
  let p = proc "javac" javafiles
  putStrLn $ "compiling " ++ show javafiles
  (excode,sout,serr) <- readCreateProcessWithExitCode p ""
  putStrLn "==========="
  print excode  
  putStrLn "==========="
  putStrLn sout
  putStrLn "==========="
  putStrLn serr
  putStrLn "==========="
  let p2 = proc "jar" ["cf", bdir </> "HCoreNLPProto.jar", "javasrc/ai"]
  putStrLn "creating jar"
  (excode',_,_) <- readCreateProcessWithExitCode p ""
  print excode'
  setClasspath bdir
  cnts <- getDirectoryContents bdir
  print cnts
  return()
  
