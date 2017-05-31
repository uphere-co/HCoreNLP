{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE Rank2Types #-}
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
import           Control.Monad              (replicateM_)
import           Control.Monad.Trans.Class
import           Control.Monad.Trans.State 
import           Data.Attoparsec.Combinator (lookAhead)
import           Data.Attoparsec.Text
import           Data.Default
import           Data.Text                 (Text)
import qualified Data.Text            as T
import           Data.Text.Read       as TR
--


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

next :: Parser Text
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

getText :: Parser Text
getText = T.pack <$> manyTill' anyChar next

getKeyText :: Text -> Parser Text
getKeyText k = (string k <?> T.unpack k) >> getText

getKeyInt :: Text -> Parser Int
getKeyInt k  = (string k <?> T.unpack k) >> (either fail (return . fst) . TR.decimal =<< getText )

getKeyList :: Text -> Parser [Text]
getKeyList k = (string k <?> T.unpack k) >> (either fail return . parseOnly list =<< getText)

setvalue :: (Monad m) => Lens' s a -> m a -> StateT s m ()
setvalue l p = lift p >>= \v -> modify (l .~ v)

setvalue' :: (Monad m) => Lens' s (Maybe a) -> m a -> StateT s m ()
setvalue' l p = lift p >>= \v -> modify (l .~ Just v)


permuted :: StateT TimeTag Parser ()
permuted = do
  choice
    [ setvalue tkend      (getKeyInt " TokenEnd=")
    , setvalue tkns       (getKeyList " Tokens=")
    , setvalue coffend    (getKeyInt " CharacterOffsetEnd=")
    , setvalue bef        (getKeyText " Before=")
    , setvalue coffbeg    (getKeyInt " CharacterOffsetBegin=")
    , setvalue aft        (getKeyText " After=")
    , setvalue tkbeg      (getKeyInt " TokenBegin=")
    , setvalue chld       (getKeyList " Children=")
    , setvalue timex      (getKeyText " Timex=")
    , setvalue' numcomptyp (getKeyText " NumericCompositeType=")
    , setvalue' net        (getKeyText " NamedEntityTag=")
    , setvalue' numcompval (getKeyText " NumericCompositeValue=")
    , setvalue' normnet    (getKeyText " NormalizedNamedEntityTag=")
    , setvalue' numtokens  (getKeyList " NumerizedTokens=")
    ] 

psentidx :: StateT TimeTag Parser ()
psentidx = do
  lift $ string " SentenceIndex="  
  setvalue sentidx    (either fail (return . fst) . TR.decimal . T.pack =<< manyTill' anyChar (string "]"))

-- | parser for TimeTag from short notation output from SUTime TimeAnnotator.    
timetag :: Parser TimeTag
timetag = do
  flip execStateT def $ do
    setvalue text       (getKeyText "[Text=")
    replicateM_ 9 permuted
    ((replicateM_ 5 permuted >> psentidx)
     <|> (replicateM_ 4 permuted >> psentidx)
     <|> (replicateM_ 3 permuted >> psentidx)
     <|> (replicateM_ 2 permuted >> psentidx)
     <|> (permuted >> psentidx)
     <|> psentidx)
    
    
