import Data.Monoid
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Simple.Build
import Distribution.Simple.Install
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Setup          (CopyFlags(copyDest), fromFlag, toFlag, CopyDest( NoCopyDest))

import System.Directory
import System.Environment
import System.FilePath
import System.IO                (hPutStrLn, stderr)
import System.Process



main = defaultMainWithHooks myConfigHook

myConfigHook = simpleUserHooks
               { confHook = hookfunction
               , buildHook = myBuild <> buildHook simpleUserHooks
               -- , copyHook = myCopy <> copyHook simpleUserHooks
               , postCopy = myPostCopy
               -- , instHook = myInstall <> instHook simpleUserHooks
               , postInst = myPostInst 
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
  -- cnts <- getDirectoryContents bdir
  -- print cnts
  return()


-- we may need both instHook and copyHook
-- 
-- https://github.com/haskell/cabal/issues/1805
--
copyJar pdesc lbi = do
  let copydest = fromFlag (toFlag NoCopyDest)
      installDirs = absoluteInstallDirs pdesc lbi copydest
      ddir =  datadir installDirs
      bdir = buildDir lbi
  jarpath <- canonicalizePath (bdir </> "HCoreNLPProto.jar")
  print jarpath
  print ddir
  createDirectoryIfMissing True ddir
  copyFile jarpath (ddir </> "HCoreNLPProto.jar")

  
myPostCopy _ _ pdesc lbi = copyJar pdesc lbi

myPostInst _ _ pdesc lbi = copyJar pdesc lbi 
