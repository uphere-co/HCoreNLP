{-# LANGUAGE TemplateHaskell #-}

module TemplateTest where

import Language.Haskell.TH
import System.Directory
import System.Environment (getEnv)

getCurrentDir  :: Q ()
getCurrentDir = runIO (getCurrentDirectory >>= print)

getCompileEnv :: String -> Q ()
getCompileEnv key = runIO (getEnv key >>= print)
