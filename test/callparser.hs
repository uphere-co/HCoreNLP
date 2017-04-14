{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Control.Monad                ((>=>))
import           Control.Monad.IO.Class       (liftIO)
import           Data.Aeson
import           Data.Aeson.Types
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import           Data.Text                    (Text)
import           GHC.Generics
-- import           Language.Java         as J
import           System.Environment         (getEnv)
-- 
import           CoreNLP
import           CoreNLP.Type

main :: IO ()
main = do
    clspath <- getEnv "CLASSPATH"
    let txts = [ "I am a boy.", "You are a girl." ] :: [Text]
    runCoreNLP [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      props <- initProps
      pipeline <- newPipeline props
      liftIO $ putStrLn "==========================="
       
      jsons <- flip mapM txts (runAnnotator props pipeline >=> return . eitherDecode . BL.fromStrict)
      mapM_ (liftIO . print) (jsons :: [Either String CoreNLPResult])
      
      -- flip mapM_ txts (runAnnotator props pipeline >=> B.putStrLn) 
