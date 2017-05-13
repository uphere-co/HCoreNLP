{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Simple.Type.Simplified where

import           Control.Lens
import           Data.Aeson
import           Data.Aeson.Types
import           Data.Text        (Text)
import           GHC.Generics
--
import           NLP.SyntaxTree.Type.PennTreebankII

data Sentence = Sentence { _sent_index      :: Int
                         , _sent_charRange  :: (Int,Int)
                         , _sent_tokenRange :: (Int,Int)
                         } 
              deriving (Generic, Show)

makeLenses ''Sentence

data Token = Token { _token_range :: (Int,Int)
                   , _token_text :: Text
                   , _token_pos :: POSTag
                   , _token_lemma :: Text }
           deriving (Generic, Show)

makeLenses ''Token


{-
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


instance FromJSON Token where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 7 } 



instance FromJSON Sentence where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 6 } 


data CoreNLPResult = CoreNLPResult { _result_sentences :: [Sentence]
                                   , _result_corefs :: Value }
                   deriving (Show, Eq, Generic)

makeLensesWith underscoreFields ''CoreNLPResult

instance FromJSON CoreNLPResult where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 8 } 
-}

instance ToJSON Sentence where
  toJSON = genericToJSON defaultOptions
  
instance ToJSON Token where
  toJSON = genericToJSON defaultOptions
