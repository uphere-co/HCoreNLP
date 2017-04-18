{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module CoreNLP.SUTime.Parser
( TimeTag(..)
, timetag
) where

import           Control.Applicative
import           Data.Attoparsec.Combinator (lookAhead)
import           Data.Attoparsec.Text
import           Data.Text                 (Text)
import qualified Data.Text            as T
import           Data.Text.Read       as TR


-- | data type for time tagging from SUText
data TimeTag = TimeTag { tt_txt :: Text
                       , tt_tkns :: [Text]
                       , tt_bef :: Text
                       , tt_aft :: Text
                       , tt_coffbeg :: Int
                       , tt_coffend :: Int
                       , tt_tkbeg :: Int
                       , tt_tkend :: Int
                       , tt_chld :: [Text]
                       , tt_timex :: Text
                       , tt_sentidx :: Int
                       , tt_numcomptyp :: Maybe Text
                       , tt_numcompval :: Maybe Text
                       , tt_normNET :: Maybe Text
                       , tt_numtokens :: Maybe [Text]
                       , tt_NET :: Maybe Text
                       }
             deriving Show


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

getKeyInt k =  string k >> (either fail (return . fst) . TR.decimal =<< getText )

getKeyList k = string k >> (either fail return . parseOnly list =<< getText)

-- | parser for TimeTag from short notation output from SUTime TimeAnnotator.    
timetag :: Parser TimeTag
timetag = do
  tt_txt     <- getKeyText "[Text="
  tt_numcomptyp <- optional (getKeyText " NumericCompositeType=")
  tt_tkend   <- getKeyInt " TokenEnd="
  tt_tkns    <- getKeyList " Tokens="
  tt_NET     <- optional (getKeyText " NamedEntityTag=")
  tt_coffend <- getKeyInt " CharacterOffsetEnd="
  tt_bef     <- getKeyText " Before="
  tt_coffbeg <- getKeyInt " CharacterOffsetBegin="  
  tt_aft     <- getKeyText " After="
  tt_numcompval <- optional (getKeyText " NumericCompositeValue=")
  tt_normNET    <- optional (getKeyText " NormalizedNamedEntityTag=")
  tt_numtokens  <- optional (getKeyList " NumerizedTokens=")  
  tt_tkbeg   <- getKeyInt " TokenBegin="
  tt_chld    <- getKeyList " Children="
  tt_timex   <- getKeyText " Timex="
  string " SentenceIndex="  
  tt_sentidx <- either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string "]")
  return TimeTag {..}
    
