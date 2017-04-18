{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module CoreNLP.SUTime.Parser where

import           Control.Applicative
import           Data.Attoparsec.Combinator (lookAhead)
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


next = lookAhead (string " Text=") <|>
       lookAhead (string " Tokens=") <|>
       lookAhead (string " TokenBegin=") <|>
       lookAhead (string " TokenEnd=") <|>
       lookAhead (string " CharacterOffsetEnd=") <|>
       lookAhead (string " CharacterOffsetBegin=") <|>       
       lookAhead (string " Before=") <|>
       lookAhead (string " After=") <|>
       lookAhead (string " Children=") <|>
       lookAhead (string " Timex=") <|>
       lookAhead (string " SentenceIndex=")


conv = T.pack

getText = conv <$> manyTill' anyChar next

       
timetag :: Parser TimeTag
timetag = do
  string "[Text="
  tt_txt     <- getText  -- conv <$> manyTill' anyChar next
  string " TokenEnd="
  tt_tkend <- either fail (return . fst) . TR.decimal =<< getText 
  string " Tokens="
  tt_tkns'    <- getText -- conv <$> manyTill' anyChar (string " CharacterOffsetEnd=")
  tt_tkns <- either fail return (parseOnly list tt_tkns')
  string " CharacterOffsetEnd="
  tt_coffend <- either fail (return . fst) . TR.decimal =<< getText -- . conv =<< manyTill' anyChar (string " Before=")
  string " Before="  
  tt_bef     <- getText  -- conv <$> manyTill' anyChar (string " CharacterOffsetBegin=")
  string " CharacterOffsetBegin="  
  tt_coffbeg <- either fail (return . fst) . TR.decimal =<< getText -- . conv =<< manyTill' anyChar (string " After=")
  string " After="
  tt_aft     <- getText -- conv <$> manyTill' anyChar (string " TokenBegin=")
  string " TokenBegin="  
  tt_tkbeg   <- either fail (return . fst) . TR.decimal =<< getText -- . conv =<< manyTill' anyChar (string " Children=")
  string " Children="  
  tt_chld'    <- getText -- conv <$> manyTill' anyChar (string " Timex=")
  tt_chld <- either fail return (parseOnly list tt_chld')
  string " Timex="  
  tt_timex   <- getText -- conv <$> manyTill' anyChar (string " SentenceIndex=")
  string " SentenceIndex="  
  tt_sentidx <- either fail (return . fst) . TR.decimal . conv =<< manyTill' anyChar (string "]")
  
  return TimeTag {..}
    
