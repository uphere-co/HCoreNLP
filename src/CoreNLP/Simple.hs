{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}

module CoreNLP.Simple where

import           Control.Lens
import           Control.Monad.IO.Class
import           Control.Monad.Trans.Class
import           Control.Monad.Trans.Reader
import qualified Data.ByteString.Char8 as B
import           Data.Int
import           Data.Text                    (Text)
import qualified Data.Text             as T
import           Data.Time.Calendar
import           Language.Haskell.TH.Syntax
import           Language.Java         as J hiding (reflect,reify)
import           Language.Java.Inline 
import qualified Language.Java                (reflect,reify)
--
import qualified CoreNLP.Proto.HCoreNLPProto.ListTimex

import TemplateTest

data PipelineConfig = PPConfig { _tokenizer       :: Bool
                               , _words2sentences :: Bool
                               , _postagger       :: Bool
                               , _sutime          :: Bool
                               } deriving (Show,Eq,Ord)

makeLenses ''PipelineConfig

data Document = Document { _doctext :: Text
                         , _docdate :: Day
                         } deriving (Show,Eq,Ord)

makeLenses ''Document

-- | preparing AnnotationPipeline with SUTime TimeAnnotator
prepare :: PipelineConfig -> IO (J ('Class "edu.stanford.nlp.pipeline.AnnotationPipeline"))
prepare p = do
    $(getCurrentDir >> getCompileEnv "CLASSPATH" >> return (AppE (VarE (mkName "return")) (ConE (mkName "()"))))
  
    ptkn <- Language.Java.reflect (p^.tokenizer)
    pw2s <- Language.Java.reflect (p^.words2sentences)
    ppos <- Language.Java.reflect (p^.postagger)
    ptim <- Language.Java.reflect (p^.sutime)
    [java|{
            edu.stanford.nlp.pipeline.AnnotationPipeline pipeline = new edu.stanford.nlp.pipeline.AnnotationPipeline();
            pipeline.addAnnotator(new edu.stanford.nlp.pipeline.TokenizerAnnotator($ptkn));
            pipeline.addAnnotator(new edu.stanford.nlp.pipeline.WordsToSentencesAnnotator($pw2s));
            pipeline.addAnnotator(new edu.stanford.nlp.pipeline.POSTaggerAnnotator($ppos));
            if($ptim) {
              java.util.Properties props = new java.util.Properties();
              pipeline.addAnnotator(new edu.stanford.nlp.time.TimeAnnotator("sutime", props));
            }
            return pipeline;
          }
    |]


annotate :: J ('Class "edu.stanford.nlp.pipeline.AnnotationPipeline") -- ^ annotation pipeline object
          -> Document                                                 -- ^ document
          -> IO (J ('Class "edu.stanford.nlp.pipeline.Annotation"))   -- ^ annotation object
annotate pipeline doc = do
  txt <- Language.Java.reflect (doc^.doctext)
  timetxt <- Language.Java.reflect (T.pack (showGregorian (doc^.docdate)))
  [java|{
          String text = $txt;
          edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);
          annotation.set(edu.stanford.nlp.ling.CoreAnnotations.DocDateAnnotation.class, $timetxt);
          
          $pipeline.annotate(annotation);
          return annotation;
        }
  |]
  
serializeDoc :: J ('Class "edu.stanford.nlp.pipeline.Annotation") -- ^ annotation object
          -> IO B.ByteString
serializeDoc annotation = do
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

serializeTimex :: J ('Class "edu.stanford.nlp.pipeline.Annotation") -- ^ annotation object
          -> IO B.ByteString
serializeTimex annotation = do
  r <-
    [java|{
            try {
              java.io.ByteArrayOutputStream arrayOutputStream = new java.io.ByteArrayOutputStream();
              java.io.BufferedWriter bufferedWriter = new java.io.BufferedWriter(
                new java.io.OutputStreamWriter(arrayOutputStream)
              );
              edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer ser = new edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer(false);
              java.util.List<edu.stanford.nlp.util.CoreMap> timexAnnsAll = $annotation.get(edu.stanford.nlp.time.TimeAnnotations.TimexAnnotations.class);

              ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.Builder listTimexBuilder =
                ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.newBuilder();

              for (edu.stanford.nlp.util.CoreMap cm : timexAnnsAll) {
                ai.uphere.HCoreNLP.HCoreNLPProto.TimexWithOffset.Builder tmxoffset =
                  ai.uphere.HCoreNLP.HCoreNLPProto.TimexWithOffset.newBuilder();
                edu.stanford.nlp.time.Timex timex = cm.get(edu.stanford.nlp.time.TimeAnnotations.TimexAnnotation.class);
                edu.stanford.nlp.pipeline.CoreNLPProtos.Timex tmx = ser.toProto(timex);
                int b = cm.get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetBeginAnnotation.class);
                int e = cm.get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetEndAnnotation.class);
                tmxoffset
                  .setTimex(tmx)
                  .setCharacterOffsetBegin(b)
                  .setCharacterOffsetEnd(e);
                listTimexBuilder.addTimexes(tmxoffset.build());

              }
              listTimexBuilder.build().writeTo(arrayOutputStream);;
              return arrayOutputStream.toByteArray();
            } catch( java.io.IOException e ) {
              return null;
            }
          }
    |]
  Language.Java.reify r

