{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Control.Monad                (void)
import qualified Data.ByteString.Char8 as B
import           Data.Foldable                (forM_)
import           Data.Int
import           Data.Monoid                  ((<>))
import           Data.Text                    (Text)
import qualified Data.Text.IO          as TIO
import           Language.Java         as J
import           Language.Java.Inline
import           System.Environment         (getEnv)

main :: IO ()
main = do
    clspath <- getEnv "CLASSPATH"
    let otxts = [ "I am a boy." 
                , "You are a girl." ] :: [Text]
    -- let otxt = "I am a boy." :: Text
    withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      props :: J ('Class "java.util.Properties") <-
        [java|{
                // omit regexner, it crashed.
                String defaultAnnotators = "tokenize,ssplit,pos,lemma,ner,parse,depparse,mention,coref,natlog,openie";
                String defaultParserPath = "edu/stanford/nlp/models/srparser/englishSR.ser.gz";
                java.util.Properties defaultProps = edu.stanford.nlp.util.PropertiesUtils.asProperties(
                    "annotators", defaultAnnotators,
                    "mention.type", "dep",
                    "coref.mode", "statistical",
                    "coref.language", "en",
                    "inputFormat", "text",
                    "outputFormat", "json",
                    "prettyPrint", "true",
                    "parse.model", defaultParserPath,
                    "parse.binaryTrees", "true",
                    "openie.strip_entailments", "true");
                java.util.Properties props = new java.util.Properties(defaultProps);
                return props;
              }
        |]
      pipeline :: J ('Class "edu.stanford.nlp.pipeline.StanfordCoreNLP") <-
        [java|{ 
                edu.stanford.nlp.pipeline.StanfordCoreNLP pipeline = new edu.stanford.nlp.pipeline.StanfordCoreNLP($props);
                return pipeline;
              }
        |]
      putStrLn "==========================="
      forM_ otxts $ \otxt -> do
        txt <- reflect otxt
        TIO.putStrLn ("Text: " <> otxt)
        void @IO @Int32
          [java|{
                  String inputFormat = $props.getProperty("inputFormat", "text");
                  String date = $props.getProperty("date");
                  String text = $txt;
                  edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);

                  $pipeline.annotate(annotation);
                  edu.stanford.nlp.pipeline.AnnotationOutputter.Options options = edu.stanford.nlp.pipeline.AnnotationOutputter.getOptions($pipeline);
                  java.io.PrintWriter wrtr = new java.io.PrintWriter(System.out) ;
                  try { 
                    $pipeline.jsonPrint(annotation,wrtr );
                  }
                  catch( java.io.IOException e ) {
                    System.out.println(e);
                  }
                  return 0;
                }
          |]
        putStrLn "\n---------------------------"

