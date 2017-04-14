{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedRecord
{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Type where

import           Control.Lens
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

makeLenses ''Dependency

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

makeLenses ''Relation

instance FromJSON Relation where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 

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

-- makeLensesWith underscoreFields ''Token

makeLensesFor [ ("_token_index"               , "tokenIndex"          )
              , ("_token_word"                , "word"                )
              , ("_token_originalText"        , "originalText"        )
              , ("_token_lemma"               , "lemma"               )
              , ("_token_characterOffsetBegin", "characterOffsetBegin")
              , ("_token_characterOffsetEnd"  , "characterOffsetEnd"  )
              , ("_token_pos"                 , "pos"                 )
              , ("_token_ner"                 , "ner"                 )
              , ("_token_speaker"             , "speaker"             )
              , ("_token_before"              , "before"              )
              , ("_token_after"               , "after"               )
              ] ''Token
                    
instance FromJSON Token where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 7 } 


data Sentence = Sentence { _index :: Int
                         , _parse :: Text
                         , _basicDependencies            :: [Dependency]
                         , _enhancedDependencies         :: [Dependency]
                         , _enhancedPlusPlusDependencies :: [Dependency]
                         , _openie :: [Relation]
                         , _tokens :: [Token]
                         }
              deriving (Show, Eq, Generic)

makeLenses ''Sentence

instance FromJSON Sentence where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 



data CoreNLPResult = CoreNLPResult { _sentences :: [Sentence]
                                   , _corefs :: Value }
                   deriving (Show, Eq, Generic)

makeLenses ''CoreNLPResult

instance FromJSON CoreNLPResult where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 


