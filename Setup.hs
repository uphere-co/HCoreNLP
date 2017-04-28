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

addClasspath jarpath = do
  mocpath <- lookupEnv "CLASSPATH"
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
  let jarpath' = bdir </> "HCoreNLPProto.jar"
  jarpath <- canonicalizePath jarpath'
  let javafiles = filter (\x->takeExtensions x == ".java") $ extraSrcFiles (localPkgDescr lbi)
  let p = proc "javac" javafiles
  putStrLn $ "compiling " ++ show javafiles
  (excode,sout,serr) <- readCreateProcessWithExitCode p ""
  print excode  
  let p2 = proc "jar" ["cf", jarpath, "-C", "javasrc", "ai"]
  putStrLn "creating jar"
  (excode',_,_) <- readCreateProcessWithExitCode p2 ""
  print excode'
  addClasspath jarpath
  cnts <- getDirectoryContents bdir
  print cnts
  return()
  
