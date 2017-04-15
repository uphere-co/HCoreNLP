{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}

module CoreNLP where

import           Control.Monad.IO.Class
import           Control.Monad.Trans.Class
import           Control.Monad.Trans.Reader
import qualified Data.ByteString.Char8 as B
import           Data.Text                    (Text)
import           Language.Java         as J hiding (reflect,reify)
import           Language.Java.Inline 
import qualified Language.Java                (reflect,reify)

newtype CoreNLP a = CoreNLP { unCoreNLP :: IO a }
                  deriving (Functor, Applicative, Monad, MonadIO)

runCoreNLP :: [B.ByteString]  -> CoreNLP a -> IO a
runCoreNLP params action = withJVM params (unCoreNLP action) 
  
reflect = liftIO . Language.Java.reflect
reify = liftIO . Language.Java.reify

initProps :: CoreNLP (J ('Class "java.util.Properties"))
initProps =
 CoreNLP 
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

newPipeline :: J ('Class "java.util.Properties") -> CoreNLP (J ('Class "edu.stanford.nlp.pipeline.StanfordCoreNLP"))
newPipeline props = CoreNLP [java| new edu.stanford.nlp.pipeline.StanfordCoreNLP($props) |]

runAnnotator :: J ('Class "java.util.Properties")
             -> J ('Class "edu.stanford.nlp.pipeline.StanfordCoreNLP")
             -> Text
             -> CoreNLP B.ByteString
runAnnotator props pipeline otxt = do
  txt <- reflect otxt
  r <- CoreNLP
       [java|{
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
                 return arrayOutputStream.toByteArray();
               }
               catch( java.io.IOException e ) {
                 System.out.println(e);
                 return null; 
               }
             }
       |]
  reify r


