{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Simple where

import           Control.Exception
import           Control.Lens
import           Control.Monad
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy  as BL
import qualified Data.Text             as T
import           Data.Time.Calendar           (showGregorian)
import           Foreign.JNI.Types
import           Language.Haskell.TH.Syntax
import           Language.Java         as J hiding (reflect,reify)
import           Language.Java.Inline
import qualified Language.Java                (reflect,reify)
import           Text.ProtocolBuffers.WireMessage (messageGet)
--
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import           CoreNLP.Simple.Type
import           TemplateTest


-- | preparing AnnotationPipeline with SUTime TimeAnnotator
prepare :: PipelineConfig -> IO (J ('Class "edu.stanford.nlp.pipeline.AnnotationPipeline"))
prepare p = do
    $(getCurrentDir >> getCompileEnv "CLASSPATH" >> return (AppE (VarE (mkName "return")) (ConE (mkName "()"))))

    ptkn <- Language.Java.reflect (p^.tokenizer)
    pw2s <- Language.Java.reflect (p^.words2sentences)
    ppos <- Language.Java.reflect (p^.postagger)
    plemma <- Language.Java.reflect (p^.lemma)
    ptim <- Language.Java.reflect (p^.sutime)
    pdepparse <- Language.Java.reflect (p^.depparse)
    pconstituency <- Language.Java.reflect (p^.constituency)
    pner <- Language.Java.reflect (p^.ner)
    [java|{
            edu.stanford.nlp.pipeline.AnnotationPipeline pipeline = new edu.stanford.nlp.pipeline.AnnotationPipeline();
            if($ptkn) {
              pipeline.addAnnotator(new edu.stanford.nlp.pipeline.TokenizerAnnotator());
            }
            if($pw2s) {
              pipeline.addAnnotator(new edu.stanford.nlp.pipeline.WordsToSentencesAnnotator());
            }
            if($ppos) {
              pipeline.addAnnotator(new edu.stanford.nlp.pipeline.POSTaggerAnnotator());
            }
            if($plemma) {
              pipeline.addAnnotator(new edu.stanford.nlp.pipeline.MorphaAnnotator());
            }
            if($pdepparse) {
              java.util.Properties props = new java.util.Properties();
              //props.setProperty("parse.keepPunct","true");

              edu.stanford.nlp.pipeline.DependencyParseAnnotator dpann =
                new edu.stanford.nlp.pipeline.DependencyParseAnnotator(props);
              pipeline.addAnnotator(dpann);
            }
            if($pconstituency) {
              pipeline.addAnnotator(new edu.stanford.nlp.pipeline.ParserAnnotator(true,500));
            }
            if($pner) {
              try {
                pipeline.addAnnotator(new edu.stanford.nlp.pipeline.NERCombinerAnnotator());
              }
              catch ( java.io.IOException ex ) {
                System.out.println(ex.toString());
              }
              catch ( java.lang.ClassNotFoundException ex ) {
                System.out.println(ex.toString());
              }
            }
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
  r <- [java|{ try {
                 String text = $txt;
                 edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);
                 annotation.set(edu.stanford.nlp.ling.CoreAnnotations.DocDateAnnotation.class, $timetxt);

                 $pipeline.annotate(annotation);
                 return annotation;
               }
               catch (RuntimeException e) {
                 return null;

               }
             }
       |]
  when (r == Foreign.JNI.Types.jnull) $ ioError (userError "annotate fail")
  return r


serialize :: J ('Class "com.google.protobuf.MessageLite") -> IO B.ByteString
serialize obj = do
  Language.Java.reify =<<
    [java|{
            try {
              java.io.ByteArrayOutputStream arrayOutputStream = new java.io.ByteArrayOutputStream();
              $obj.writeTo(arrayOutputStream);
              return arrayOutputStream.toByteArray();
            } catch( java.io.IOException e ) {
              return null;
            }
          }
    |]


serializeDoc :: J ('Class "edu.stanford.nlp.pipeline.Annotation") -- ^ annotation object
          -> IO B.ByteString
serializeDoc annotation = do
  r <-
    [java|{
            edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer ser = new edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer(false);
            edu.stanford.nlp.pipeline.CoreNLPProtos.Document doc = ser.toProto($annotation);
            return doc;
          }
    |]
  serialize r

protobufDoc :: J ('Class "edu.stanford.nlp.pipeline.Annotation")
           -> IO (Either String D.Document)
protobufDoc ann  = do
  bstr <- serializeDoc ann
  let lbstr = BL.fromStrict bstr
  return $ fmap fst (messageGet lbstr :: Either String (D.Document,BL.ByteString))


serializeTimex :: J ('Class "edu.stanford.nlp.pipeline.Annotation") -- ^ annotation object
          -> IO B.ByteString
serializeTimex annotation = do
  r <-
    [java|{
            edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer ser = new edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer(false);
            java.util.List<edu.stanford.nlp.util.CoreMap> timexAnnsAll = $annotation.get(edu.stanford.nlp.time.TimeAnnotations.TimexAnnotations.class);

            ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.Builder listTimexBuilder =
              ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.newBuilder();

            for (edu.stanford.nlp.util.CoreMap cm : timexAnnsAll) {
              ai.uphere.HCoreNLP.HCoreNLPProto.TimexWithOffset.Builder tmxoffset =
                ai.uphere.HCoreNLP.HCoreNLPProto.TimexWithOffset.newBuilder();
              edu.stanford.nlp.time.Timex timex = cm.get(edu.stanford.nlp.time.TimeAnnotations.TimexAnnotation.class);
              edu.stanford.nlp.pipeline.CoreNLPProtos.Timex tmx = ser.toProto(timex);
              int b  = cm.get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetBeginAnnotation.class);
              int e  = cm.get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetEndAnnotation.class);
              int tb = cm.get(edu.stanford.nlp.ling.CoreAnnotations.TokenBeginAnnotation.class);
              int te = cm.get(edu.stanford.nlp.ling.CoreAnnotations.TokenEndAnnotation.class);
              tmxoffset
                .setTimex(tmx)
                .setCharacterOffsetBegin(b)
                .setCharacterOffsetEnd(e)
                .setTokenBegin(tb)
                .setTokenEnd(te)
                ;
              listTimexBuilder.addTimexes(tmxoffset.build());

            }
            return (listTimexBuilder.build());
          }
    |]
  serialize r
