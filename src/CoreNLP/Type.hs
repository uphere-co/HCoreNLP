{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Type where

import           Control.Lens
import           Data.Aeson
import           Data.Aeson.Types
import           Data.Text        (Text)
import           GHC.Generics

data Dependency = Dependency { _dep_dep :: Text
                             , _dep_governor :: Int
                             , _dep_governorGloss :: Text
                             , _dep_dependent :: Int
                             , _dep_dependentGloss :: Text
                             }
                deriving (Show, Eq, Generic)

makeLensesWith underscoreFields ''Dependency

instance FromJSON Dependency where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 5 } 


data Relation = Relation { _rel_subject :: Text
                         , _rel_subjectSpan :: (Int,Int)
                         , _rel_relation :: Text
                         , _rel_relationSpan :: (Int,Int)
                         , _rel_object :: Text
                         , _rel_objectSpan :: (Int,Int)
                         }
              deriving (Show, Eq, Generic)

makeLensesWith underscoreFields ''Relation

instance FromJSON Relation where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 5 } 

data Token = Token { _token_index :: Int
                   , _token_word :: Text
                   , _token_originalText :: Text
                   , _token_lemma :: Text
                   , _token_characterOffsetBegin :: Int
                   , _token_characterOffsetEnd :: Int
                   , _token_pos :: Text
                   , _token_ner :: Text
                   , _token_speaker :: Text
                   , _token_before :: Text
                   , _token_after :: Text
                   }
           deriving (Show, Eq, Generic)

makeLensesWith underscoreFields ''Token

instance FromJSON Token where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 7 } 


data Sentence = Sentence { _sent_index :: Int
                         , _sent_parse :: Text
                         , _sent_basicDependencies            :: [Dependency]
                         , _sent_enhancedDependencies         :: [Dependency]
                         , _sent_enhancedPlusPlusDependencies :: [Dependency]
                         , _sent_openie :: [Relation]
                         , _sent_tokens :: [Token]
                         }
              deriving (Show, Eq, Generic)

makeLensesWith underscoreFields ''Sentence

instance FromJSON Sentence where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 6 } 



data CoreNLPResult = CoreNLPResult { _result_sentences :: [Sentence]
                                   , _result_corefs :: Value }
                   deriving (Show, Eq, Generic)

makeLensesWith underscoreFields ''CoreNLPResult

instance FromJSON CoreNLPResult where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 8 } 

