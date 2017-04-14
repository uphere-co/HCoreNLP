{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module CoreNLP.Type where

import           Data.Aeson
import           Data.Aeson.Types
import           Data.Text        (Text)
import           GHC.Generics

data Dependency = Dependency { _dep :: Text
                             , _governor :: Int
                             , _governorGloss :: Text
                             , _dependent :: Int
                             , _dependentGloss :: Text
                             }
                deriving (Show, Eq, Generic)
                                                 
instance FromJSON Dependency where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 


data Relation = Relation { _subject :: Text
                         , _subjectSpan :: (Int,Int)
                         , _relation :: Text
                         , _relationSpan :: (Int,Int)
                         , _object :: Text
                         , _objectSpan :: (Int,Int)
                         }
              deriving (Show, Eq, Generic)

instance FromJSON Relation where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 

data Token = Token { token_index :: Int
                   , token_word :: Text
                   , token_originalText :: Text
                   , token_lemma :: Text
                   , token_characterOffsetBegin :: Int
                   , token_characterOffsetEnd :: Int
                   , token_pos :: Text
                   , token_ner :: Text
                   , token_speaker :: Text
                   , token_before :: Text
                   , token_after :: Text
                   }
           deriving (Show, Eq, Generic)
                    
instance FromJSON Token where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 6 } 


data Sentence = Sentence { _index :: Int
                         , _parse :: Text
                         , _basicDependencies            :: [Dependency]
                         , _enhancedDependencies         :: [Dependency]
                         , _enhancedPlusPlusDependencies :: [Dependency]
                         , _openie :: [Relation]
                         , _tokens :: [Token]
                         }
              deriving (Show, Eq, Generic)

instance FromJSON Sentence where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 



data CoreNLPResult = CoreNLPResult { _sentences :: [Sentence]
                                   , _corefs :: Value }
                   deriving (Show, Eq, Generic)

instance FromJSON CoreNLPResult where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 


