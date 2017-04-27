{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}

module CoreNLP.Simple where

import           Control.Monad.IO.Class
import           Control.Monad.Trans.Class
import           Control.Monad.Trans.Reader
import           Data.Int
import qualified Data.ByteString.Char8 as B
import           Data.Text                    (Text)
import           Language.Java         as J hiding (reflect,reify)
import           Language.Java.Inline 
import qualified Language.Java                (reflect,reify)

-- | preparing AnnotationPipeline with SUTime TimeAnnotator
prepare :: IO (J ('Class "edu.stanford.nlp.pipeline.AnnotationPipeline"))
prepare = do
    [java|{
            java.util.Properties props = new java.util.Properties();
            edu.stanford.nlp.pipeline.AnnotationPipeline pipeline = new edu.stanford.nlp.pipeline.AnnotationPipeline();
            pipeline.addAnnotator(new edu.stanford.nlp.pipeline.TokenizerAnnotator(false));
            pipeline.addAnnotator(new edu.stanford.nlp.pipeline.WordsToSentencesAnnotator(true));
            // pipeline.addAnnotator(new edu.stanford.nlp.pipeline.POSTaggerAnnotator(false));
            //pipeline.addAnnotator(new edu.stanford.nlp.time.TimeAnnotator("sutime", props));
            return pipeline;
          }
    |]


annotate :: J ('Class "edu.stanford.nlp.pipeline.AnnotationPipeline") -- ^ annotation pipeline object
          -> Text                                                      -- ^ document
          -> IO (J ('Class "edu.stanford.nlp.pipeline.Annotation")) -- ^ annotation object
annotate pipeline otxt = do
  txt <- Language.Java.reflect otxt
  [java|{
          String text = $txt;
          edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);
          $pipeline.annotate(annotation);
          return annotation;
        }
  |]
  
serialize :: J ('Class "edu.stanford.nlp.pipeline.Annotation") -- ^ annotation object
          -> IO B.ByteString
serialize annotation = do
  r <-
    [java|{
            try {
              java.io.ByteArrayOutputStream arrayOutputStream = new java.io.ByteArrayOutputStream();
              java.io.BufferedWriter bufferedWriter = new java.io.BufferedWriter(
                new java.io.OutputStreamWriter(arrayOutputStream)
              );
              edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer ser = new edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer(false);
              edu.stanford.nlp.pipeline.CoreNLPProtos.Document doc = ser.toProto($annotation);
              System.out.println(doc);
              doc.writeTo(arrayOutputStream); 
              return arrayOutputStream.toByteArray();
            } catch( java.io.IOException e ) {
              return null;
            }
          }
    |]
  Language.Java.reify r

