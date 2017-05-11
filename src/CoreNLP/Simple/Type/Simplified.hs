{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.Simple.Type.Simplified where

import Control.Lens
import Data.Text (Text)
--
import           NLP.SyntaxTree.Type.PennTreebankII

data Sentence = Sentence { _sent_index      :: Int
                         , _sent_charRange  :: (Int,Int)
                         , _sent_tokenRange :: (Int,Int)
                         } 
              deriving (Show)

makeLenses ''Sentence

data Token = Token { _token_range :: (Int,Int)
                   , _token_text :: Text
                   , _token_pos :: POSTag
                   , _token_lemma :: Text }
           deriving (Show)

makeLenses ''Token

