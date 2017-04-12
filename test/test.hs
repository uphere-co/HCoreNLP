{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Data.Int
import Data.Text (Text)
import Language.Java
import Language.Java.Inline

main' :: IO Int32
main' = withJVM [] $ do
    message <- reflect ("Hello World!" :: Text)
    rc <- [java| { System.out.println($message); return 0; } |]
    reify rc

main :: IO Int32
main = withJVM [ "-Djava.class.path=/home/wavewave/repo/workspace/corenlp/stanford-corenlp-full-2016-10-31/stanford-corenlp-3.7.0.jar:/home/wavewave/repo/workspace/corenlp/stanford-corenlp-full-2016-10-31/protobuf.jar"
               ] $ do
    rc <- [java| {
                   //import edu.stanford.nlp.simple.*;
                
                   // edu.stanford.nlp.simple.Document doc = new edu.stanford.nlp.simple.Document("add your sentence here! it can contain multiple sentences");
                   edu.stanford.nlp.simple.Document s = new edu.stanford.nlp.simple.Document("test"); 
                   //Document doc = new Document("add your sentence here! it can contain multiple sentences");
                   
                   return 0;
                 } |]
    reify rc
