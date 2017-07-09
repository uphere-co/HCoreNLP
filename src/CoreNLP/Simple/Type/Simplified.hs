{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Simple.Type.Simplified where

import           Control.Lens
import           Data.Aeson
import           Data.Binary                  (Binary)
import qualified Data.Graph              as G
import           Data.Text                    (Text)
import           Data.Tree
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

instance ToJSON Sentence where
  toJSON = genericToJSON defaultOptions

instance FromJSON Sentence where
  parseJSON = genericParseJSON defaultOptions

instance Binary Sentence
  

data Token = Token { _token_range :: (Int,Int)
                   , _token_text :: Text
                   , _token_pos :: POSTag
                   , _token_lemma :: Text }
           deriving (Generic, Show)

makeLenses ''Token

instance ToJSON Token where
  toJSON = genericToJSON defaultOptions

instance FromJSON Token where
  parseJSON = genericParseJSON defaultOptions

instance Binary Token


type Node = (Int,Text)

type Edge = ((Int,Int),DependencyRelation)


data Dependency = Dependency Int [Node] [Edge]
                deriving (Show,Eq,Ord,Generic)

instance ToJSON Dependency where
  toJSON = genericToJSON defaultOptions

instance FromJSON Dependency where
  parseJSON = genericParseJSON defaultOptions

instance Binary Dependency


dependencyIndexTree :: Dependency -> Tree G.Vertex
dependencyIndexTree (Dependency root nods edgs0) =
  let bnds = let xs = map fst nods in (minimum xs, maximum xs)
      edgs = map fst edgs0
  in head (G.dfs (G.buildG bnds edgs) [root])



type NERToken = (Text,NamedEntityClass)

newtype NERSentence = NERSentence [NERToken]
                    deriving (Show,Eq)
