{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Simple.Type.Simplified where

import           Control.Lens
import           Data.Aeson
import           Data.Text        (Text)
import           GHC.Generics
--
import           NLP.Type.NamedEntity
import           NLP.Type.PennTreebankII
import           NLP.Type.UniversalDependencies2.Syntax

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

instance ToJSON Sentence where
  toJSON = genericToJSON defaultOptions
  
instance ToJSON Token where
  toJSON = genericToJSON defaultOptions


type Node = (Int,Text)

type Edge = ((Int,Int),DependencyRelation)


data Dependency = Dependency [Node] [Edge]
                deriving (Show,Eq,Ord)


type NERToken = (Text,NamedEntityClass)

newtype NERSentence = NERSentence [NERToken]
                    deriving (Show,Eq)
