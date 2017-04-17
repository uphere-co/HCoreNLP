{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}

module CoreNLP.SUTime where

import           Control.Monad.IO.Class
import           Control.Monad.Trans.Class
import           Control.Monad.Trans.Reader
import           Data.Int
import qualified Data.ByteString.Char8 as B
import           Data.Text                    (Text)
import           Language.Java         as J hiding (reflect,reify)
import           Language.Java.Inline 
import qualified Language.Java                (reflect,reify)


sutimeMain :: Text -> IO Int32
sutimeMain otxt = do
  txt <- Language.Java.reflect otxt
  [java|{
          java.util.Properties props = new java.util.Properties();
          edu.stanford.nlp.pipeline.AnnotationPipeline pipeline = new edu.stanford.nlp.pipeline.AnnotationPipeline();
          pipeline.addAnnotator(new edu.stanford.nlp.pipeline.TokenizerAnnotator(false));
          pipeline.addAnnotator(new edu.stanford.nlp.pipeline.WordsToSentencesAnnotator(false));
          pipeline.addAnnotator(new edu.stanford.nlp.pipeline.POSTaggerAnnotator(false));
          pipeline.addAnnotator(new edu.stanford.nlp.time.TimeAnnotator("sutime", props));

          String text = $txt;

          edu.stanford.nlp.pipeline.Annotation annotation = new edu.stanford.nlp.pipeline.Annotation(text);
          annotation.set(edu.stanford.nlp.ling.CoreAnnotations.DocDateAnnotation.class, "2017-04-17");
          pipeline.annotate(annotation);
          System.out.println("---------------------");
          System.out.println(annotation.get(edu.stanford.nlp.ling.CoreAnnotations.TextAnnotation.class));
          System.out.println("---------------------");
          java.util.List<edu.stanford.nlp.util.CoreMap> timexAnnsAll = annotation.get(edu.stanford.nlp.time.TimeAnnotations.TimexAnnotations.class);
          for (edu.stanford.nlp.util.CoreMap cm : timexAnnsAll) {
            java.util.List<edu.stanford.nlp.ling.CoreLabel> tokens = cm.get(edu.stanford.nlp.ling.CoreAnnotations.TokensAnnotation.class);
            System.out.println(cm + " [from char offset " +
              tokens.get(0).get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetBeginAnnotation.class) +
              " to " + tokens.get(tokens.size() - 1).get(edu.stanford.nlp.ling.CoreAnnotations.CharacterOffsetEndAnnotation.class) + ']' +
              " --> " + cm.get(edu.stanford.nlp.time.TimeExpression.Annotation.class).getTemporal());
          }
          return 0;
        }
  |]
