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

initProps :: IO (J ('Class "java.util.Properties"))
initProps =
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

newPipeline :: J ('Class "java.util.Properties") -> IO (J ('Class "edu.stanford.nlp.pipeline.StanfordCoreNLP"))
newPipeline props = [java| new edu.stanford.nlp.pipeline.StanfordCoreNLP($props) |]

runAnnotator :: J ('Class "java.util.Properties")
             -> J ('Class "edu.stanford.nlp.pipeline.StanfordCoreNLP")
             -> Text
             -> IO B.ByteString
runAnnotator props pipeline otxt = do
  txt <- reflect otxt
  r <- [java|{
               String inputFormat = $props.getProperty("inputFormat", "text");
               String date = $props.getProperty("date");
               String text = $txt;
               edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);

               $pipeline.annotate(annotation);
               edu.stanford.nlp.pipeline.AnnotationOutputter.Options options = edu.stanford.nlp.pipeline.AnnotationOutputter.getOptions($pipeline);
               // java.io.PrintWriter wrtr = new java.io.PrintWriter(System.out) ;
               try {
                 java.io.ByteArrayOutputStream arrayOutputStream = new java.io.ByteArrayOutputStream();
                 java.io.BufferedWriter bufferedWriter = new java.io.BufferedWriter(
                   new java.io.OutputStreamWriter(arrayOutputStream)
                 );

                 $pipeline.jsonPrint(annotation,bufferedWriter);
                 bufferedWriter.flush();
                 bufferedWriter.close();
                 System.out.println(arrayOutputStream.size());
                 return arrayOutputStream.toByteArray();
               }
               catch( java.io.IOException e ) {
                 System.out.println(e);
                 return null; 
               }
             }
       |]
  reify r


main :: IO ()
main = do
    clspath <- getEnv "CLASSPATH"
    let txts = [ "I am a boy.", "You are a girl." ] :: [Text]
    withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      props <- initProps
      pipeline <- newPipeline props
      putStrLn "==========================="
      bstrs <- flip mapM txts $ runAnnotator props pipeline
      mapM_ B.putStrLn bstrs
