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

main :: IO Int32
main = do
    clspath <- getEnv "CLASSPATH"
    let otxt = "I am a boy." :: Text
    withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      txt <- reflect otxt 
      rc <- [java|
              {
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
                edu.stanford.nlp.pipeline.StanfordCoreNLP pipeline = new edu.stanford.nlp.pipeline.StanfordCoreNLP(props);

                String inputFormat = props.getProperty("inputFormat", "text");
                String date = props.getProperty("date");
                String text = $txt;
                edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);

                pipeline.annotate(annotation);
                edu.stanford.nlp.pipeline.AnnotationOutputter.Options options = edu.stanford.nlp.pipeline.AnnotationOutputter.getOptions(pipeline);
                java.io.PrintWriter wrtr = new java.io.PrintWriter(System.out) ;
                try { 
                  pipeline.jsonPrint(annotation,wrtr );
                }
                catch( java.io.IOException e ) {
                  System.out.println(e);
                }
                return 0;
              }
            |]
      reify rc
