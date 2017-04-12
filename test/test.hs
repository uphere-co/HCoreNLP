{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import qualified Data.ByteString.Char8 as B
import           Data.Int
import           Data.Text                  (Text)
import           Language.Java
import           Language.Java.Inline
import           System.Environment         (getEnv)

main' :: IO Int32
main' = withJVM [] $ do
    message <- reflect ("Hello World!" :: Text)
    rc <- [java| { System.out.println($message); return 0; } |]
    reify rc

main :: IO Int32
main = do
    clspath <- getEnv "CLASSPATH"
    withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      rc <- [java|
              {
                edu.stanford.nlp.simple.Document doc = new edu.stanford.nlp.simple.Document("add your sentence here! it can contain multiple sentences");
                return 0;
              }
            |]
      reify rc
