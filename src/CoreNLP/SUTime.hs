{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}

module CoreNLP.SUTime where

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
            pipeline.addAnnotator(new edu.stanford.nlp.pipeline.POSTaggerAnnotator(false));
            pipeline.addAnnotator(new edu.stanford.nlp.time.TimeAnnotator("sutime", props));
            return pipeline;
          }
    |]
  
-- | With prepared AnnotationPipeline, it takes text and document time as arguments
--   and then answers time annotation in shorter string format. 
annotateTime :: J ('Class "edu.stanford.nlp.pipeline.AnnotationPipeline") -- ^ annotation pipeline object
             -> Text                                                      -- ^ document
             -> Text                                                      -- ^ time set to the document, such as "2017-04-17"
             -> IO Text                                                   -- ^ result short string
annotateTime pipeline otxt otimetxt = do
  txt <- Language.Java.reflect otxt
  timetxt <- Language.Java.reflect otimetxt
  r <- 
    [java|{
            String text = $txt;
            edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);
            annotation.set(edu.stanford.nlp.ling.CoreAnnotations.DocDateAnnotation.class, $timetxt);
            $pipeline.annotate(annotation);


            edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer ser = new edu.stanford.nlp.pipeline.ProtobufAnnotationSerializer(false);

            //edu.stanford.nlp.pipeline.CoreNLPProtos.Document doc = ser.toProto(annotation);
            //System.out.println(doc);




            java.util.List<edu.stanford.nlp.util.CoreMap> timexAnnsAll = annotation.get(edu.stanford.nlp.time.TimeAnnotations.TimexAnnotations.class);
            StringBuilder stringBuilder = new StringBuilder();

            for (edu.stanford.nlp.util.CoreMap cm : timexAnnsAll) {
              edu.stanford.nlp.pipeline.CoreNLPProtos.Sentence sent = ser.toProto(cm);
              System.out.println(sent);

              edu.stanford.nlp.time.Timex timex = cm.get(edu.stanford.nlp.time.TimeAnnotations.TimexAnnotation.class);
              edu.stanford.nlp.pipeline.CoreNLPProtos.Timex tmx = ser.toProto(timex);
              System.out.println(tmx);
              

              // java.util.List<>

              Integer b = cm.get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetBeginAnnotation.class);
              Integer e = cm.get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetEndAnnotation.class);
              System.out.println(b);
              System.out.println(e);


              java.util.List<edu.stanford.nlp.ling.CoreLabel> tokens = cm.get(edu.stanford.nlp.ling.CoreAnnotations.TokensAnnotation.class);
              for(edu.stanford.nlp.ling.CoreLabel token : tokens ) {
                edu.stanford.nlp.pipeline.CoreNLPProtos.Token tkn = ser.toProto(token);
                System.out.println(tkn);
              
              }
              
              stringBuilder.append(cm.toShorterString());
              stringBuilder.append("\n");
            }
            String finalString = stringBuilder.toString();
            return finalString; 
          }
    |]
  Language.Java.reify r
