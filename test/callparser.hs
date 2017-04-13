{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Control.Monad                (void, (>=>))
import           Data.Aeson
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import           Data.Foldable                (forM_)
import           Data.Int
import           Data.Monoid                  ((<>))
import           Data.Text                    (Text)
import qualified Data.Text.IO          as TIO
import           Language.Java         as J
import           Language.Java.Inline
import           System.Environment         (getEnv)
-- 
import           CoreNLP

main :: IO ()
main = do
    clspath <- getEnv "CLASSPATH"
    let txts = [ "I am a boy.", "You are a girl." ] :: [Text]
    withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      props <- initProps
      pipeline <- newPipeline props
      putStrLn "==========================="
      jsons <- flip mapM txts (runAnnotator props pipeline >=> return . decode . BL.fromStrict)
      mapM_ print (jsons :: [Maybe Value])
