{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module CoreNLP.SUTime.Parser where

import           Control.Applicative
import           Data.Attoparsec.Text
import           Data.Text                 (Text)
import qualified Data.Text            as T
import           Data.Text.Read       as TR

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
                       }
             deriving Show


list :: Parser [Text]
list = char '[' *> ((skipSpace *> takeTill (inClass ",]")) `sepBy` (char ',')) --  <* char ']'  

timetag :: Parser TimeTag
timetag = do
  string "[Text="
  tt_txt     <- conv <$> manyTill' anyChar (string " TokenEnd=")
  tt_tkend <- either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string " Tokens=")
  tt_tkns'    <- conv <$> manyTill' anyChar (string " CharacterOffsetEnd=")
  tt_tkns <- either fail return (parseOnly list tt_tkns')
  tt_coffend <- either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string " Before=")
  tt_bef     <- conv <$> manyTill' anyChar (string " CharacterOffsetBegin=")
  tt_coffbeg <- either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string " After=")
  tt_aft     <- conv <$> manyTill' anyChar (string " TokenBegin=")
  tt_tkbeg   <- either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string " Children=")
  tt_chld'    <- conv <$> manyTill' anyChar (string " Timex=")
  tt_chld <- either fail return (parseOnly list tt_chld')  
  tt_timex   <- conv <$> manyTill' anyChar (string " SentenceIndex=")
  tt_sentidx <- either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string "]")
  
  return TimeTag {..}
 where conv = T.pack
    
