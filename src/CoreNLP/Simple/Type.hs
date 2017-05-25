{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Simple.Type where

import Control.Lens
import Data.Default
import Data.Text (Text)
import Data.Time.Calendar (Day(..))

data PipelineConfig = PPConfig { _tokenizer       :: Bool
                               , _words2sentences :: Bool
                               , _postagger       :: Bool
                               , _lemma           :: Bool
                               , _sutime          :: Bool
                               , _depparse        :: Bool
                               , _constituency    :: Bool
                               , _ner             :: Bool
                               } deriving (Show,Eq,Ord)

makeLenses ''PipelineConfig

instance Default PipelineConfig where
  def = PPConfig False False False False False False False False

data Document = Document { _doctext :: Text
                         , _docdate :: Day
                         } deriving (Show,Eq,Ord)

makeLenses ''Document
