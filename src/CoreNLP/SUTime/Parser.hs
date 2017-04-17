{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module CoreNLP.SUTime.Parser where

import           Control.Applicative
import           Data.Attoparsec.Text
import           Data.Text                 (Text)
import qualified Data.Text            as T

{- 
obracket = A.char '['

cbracket = A.char ']'

keyvalue = do
  k <- A.takeWhile (/= '=')
  A.char '='
  v <- ((bracket (A.skipWhile (/= ']'))   >> return Nothing) <|>
        (A.char ' ' >> return Nothing) <|>
        (Just <$> A.takeWhile (A.notInClass "[]")))
  return (k,v)

bracket p = obracket *> p <* cbracket
  
line = bracket (A.many1 (A.skipSpace >> keyvalue))
       -- >> A.skipSpace
-}
{- 
item []                   = return []
item ((k1,p1):[])         = do A.string k1
                               A.char '='
                               r <- p1
                               A.skipWhile (==']')
                               A.char ']'
                               return r
item ((k1,p1):(k2,p2):[]) = error "error"
-}

data TimeTag = TimeTag { tt_txt :: Text
                       , tt_tkend :: Text
                       , tt_tkns :: Text
                       , tt_coffend :: Text
                       , tt_bef :: Text
                       , tt_coffbeg :: Text
                       , tt_aft :: Text
                       , tt_tkbeg :: Text
                       , tt_chld :: Text
                       , tt_timex :: Text
                       , tt_sentidx :: Text }
             deriving Show

timetag :: Parser TimeTag
timetag = do
  string "[Text="
  tt_txt     <- conv <$> manyTill' anyChar (string " TokenEnd=")
  tt_tkend   <- conv <$> manyTill' anyChar (string " Tokens=")
  tt_tkns    <- conv <$> manyTill' anyChar (string " CharacterOffsetEnd=")
  tt_coffend <- conv <$> manyTill' anyChar (string " Before=")
  tt_bef     <- conv <$> manyTill' anyChar (string " CharacterOffsetBegin=")
  tt_coffbeg <- conv <$> manyTill' anyChar (string " After=")
  tt_aft     <- conv <$> manyTill' anyChar (string " TokenBegin=")
  tt_tkbeg   <- conv <$> manyTill' anyChar (string " Children=")
  tt_chld    <- conv <$> manyTill' anyChar (string " Timex=")
  tt_timex   <- conv <$> manyTill' anyChar (string " SentenceIndex=")
  tt_sentidx <- conv <$> manyTill' anyChar (string "]")
  return TimeTag {..}
 where conv = T.pack
    
  {-
  A.string key1
  A.char '='
  str <- A.manyTill A.anyChar (A.string key2)
  return (T.pack str)

-}
