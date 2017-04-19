{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TemplateHaskell #-}

module CoreNLP.SUTime.Parser
( TimeTag
, text
, tkns
, bef
, aft
, coffbeg
, coffend
, tkbeg
, tkend
, chld
, timex
, sentidx
, numcomptyp
, numcompval
, normnet
, numtokens
, net
, timetag
) where

import           Control.Applicative
import           Control.Lens
import           Control.Monad.Trans.Class
import           Control.Monad.Trans.State 
import           Data.Attoparsec.Combinator (lookAhead)
import           Data.Attoparsec.Text
import           Data.Default
import           Data.Text                 (Text)
import qualified Data.Text            as T
import           Data.Text.Read       as TR


-- | data type for time tagging from SUText
data TimeTag = TimeTag { _tt_text :: Text
                       , _tt_tkns :: [Text]
                       , _tt_bef :: Text
                       , _tt_aft :: Text
                       , _tt_coffbeg :: Int
                       , _tt_coffend :: Int
                       , _tt_tkbeg :: Int
                       , _tt_tkend :: Int
                       , _tt_chld :: [Text]
                       , _tt_timex :: Text
                       , _tt_sentidx :: Int
                       , _tt_numcomptyp :: Maybe Text
                       , _tt_numcompval :: Maybe Text
                       , _tt_normnet :: Maybe Text
                       , _tt_numtokens :: Maybe [Text]
                       , _tt_net :: Maybe Text
                       }
             deriving Show

makeLensesWith underscoreFields ''TimeTag

instance Default TimeTag where
  def = TimeTag "" [] "" "" 0 0 0 0 [] "" 0 Nothing Nothing Nothing Nothing Nothing


list :: Parser [Text]
list = char '[' *> ((skipSpace *> takeTill (inClass ",]")) `sepBy` (char ',')) --  <* char ']'  


next = test " Text=" <|>
       test " Tokens=" <|>
       test " TokenBegin=" <|>
       test " TokenEnd=" <|>
       test " CharacterOffsetEnd=" <|>
       test " CharacterOffsetBegin=" <|>       
       test " Before=" <|>
       test " After=" <|>
       test " Children=" <|>
       test " Timex=" <|>
       test " SentenceIndex=" <|>
       test " NumericCompositeType=" <|>
       test " NumericCompositeValue=" <|>
       test " NormalizedNamedEntityTag=" <|>
       test " NumerizedTokens=" <|>
       test " NamedEntityTag="
 where test = lookAhead . string 

conv = T.pack

getText = conv <$> manyTill' anyChar next

getKeyText k = string k >> getText

getKeyInt k  = string k >> (either fail (return . fst) . TR.decimal =<< getText )

getKeyList k = string k >> (either fail return . parseOnly list =<< getText)

setvalue l p = lift p >>= \v -> modify (l .~ v)


optpart = do
    setvalue numcomptyp (optional (getKeyText " NumericCompositeType="))
    setvalue net        (optional (getKeyText " NamedEntityTag="))
    setvalue numcompval (optional (getKeyText " NumericCompositeValue="))
    setvalue normnet    (optional (getKeyText " NormalizedNamedEntityTag="))
    setvalue numtokens  (optional (getKeyList " NumerizedTokens="))

-- | parser for TimeTag from short notation output from SUTime TimeAnnotator.    
timetag :: Parser TimeTag
timetag = do
  flip execStateT def $ do
    setvalue text       (getKeyText "[Text=")
    optpart
    -- setvalue numcomptyp (optional (getKeyText " NumericCompositeType="))
    setvalue tkend      (getKeyInt " TokenEnd=")
    optpart
    setvalue tkns       (getKeyList " Tokens=")
    optpart
    -- setvalue net        (optional (getKeyText " NamedEntityTag="))
    setvalue coffend    (getKeyInt " CharacterOffsetEnd=")
    optpart
    setvalue bef        (getKeyText " Before=")
    optpart
    setvalue coffbeg    (getKeyInt " CharacterOffsetBegin=")
    optpart
    setvalue aft        (getKeyText " After=")
    optpart
    -- setvalue numcompval (optional (getKeyText " NumericCompositeValue="))
    -- setvalue normnet    (optional (getKeyText " NormalizedNamedEntityTag="))
    -- setvalue numtokens  (optional (getKeyList " NumerizedTokens="))
    setvalue tkbeg      (getKeyInt " TokenBegin=")
    optpart
    setvalue chld       (getKeyList " Children=")
    optpart
    setvalue timex      (getKeyText " Timex=")
    optpart
    lift $ string " SentenceIndex="  
    setvalue sentidx    (either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string "]"))
  
    
