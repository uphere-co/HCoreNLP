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
    let otxt = "add your sentence here! it can contain multiple sentences" :: Text
    withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      txt <- reflect otxt 
      rc <- [java|
              {
                edu.stanford.nlp.simple.Document doc = new edu.stanford.nlp.simple.Document($txt);
                for(edu.stanford.nlp.simple.Sentence sent : doc.sentences() ) {
                  System.out.println("The second word of the sentence '" + sent + "' is " + sent.word(1));
                }
                return 0;
              }
            |]
      reify rc
