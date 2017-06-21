{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module CoreNLP.Simple.Util where

import           Control.Lens
import           Control.Monad                               (join)
import qualified Data.ByteString.Lazy.Char8            as BL
import           Data.Maybe                                  (catMaybes, fromJust)
import           Data.Text                                   (Text)
import qualified Data.Text                             as T
import qualified Data.Text.Lazy                        as TL
import qualified Data.Text.Lazy.Encoding               as TLE
import           Data.Time.Clock                             (getCurrentTime,UTCTime(..))
import           Language.Java                         as J
import           Text.ProtocolBuffers.Basic                  (Utf8,utf8)
import           Text.ProtocolBuffers.WireMessage            (messageGet)
--
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
import           NLP.Type.PennTreebankII
--
import           CoreNLP.Simple
import           CoreNLP.Simple.Convert                      (cutf8)
import           CoreNLP.Simple.Type
import           CoreNLP.Simple.Type.Simplified

-- cutf8' :: Utf8 -> Text
-- cutf8' = TL.toStrict . TLE.decodeUtf8 . utf8 


convertSentence :: D.Document -> S.Sentence -> Maybe Sentence
convertSentence _ s = do
  i <- fromIntegral <$> s^.S.sentenceIndex
  b <- fromIntegral <$> join (firstOf (S.token . traverse . TK.beginChar) s)
  e <- fromIntegral <$> join (lastOf  (S.token . traverse . TK.endChar) s)
  return (Sentence i (b,e) 
            (fromIntegral (s^.S.tokenOffsetBegin),fromIntegral (s^.S.tokenOffsetEnd)))


convertToken :: TK.Token -> Maybe Token
convertToken t = do
  (b',e') <- (,) <$> t^.TK.tokenBeginIndex <*> t^.TK.tokenEndIndex
  let (b,e) = (fromIntegral b',fromIntegral e')
  w <- cutf8 <$> (t^.TK.originalText)
  p <- identifyPOS . cutf8 <$> (t^.TK.pos)
  l <- cutf8 <$> (t^.TK.lemma)
  return (Token (b,e) w p l)


getDoc :: Text -> IO Document
getDoc txt = do
  day <- fmap utctDay getCurrentTime
  return $ Document txt day


getProtoSents :: D.Document -> [S.Sentence]
getProtoSents doc = toListOf (D.sentence . traverse) doc


convertProtoSents :: [S.Sentence] -> D.Document -> [Sentence]
convertProtoSents psents doc =
  let Just newsents = mapM (convertSentence doc) psents
  in newsents


getSents :: D.Document -> [Sentence]
getSents doc = convertProtoSents (getProtoSents doc) doc


convertSenToText :: S.Sentence -> Text
convertSenToText s = let tokens = map (\t -> cutf8 <$> (t^.TK.originalText)) $ getTKTokens s
                     in T.intercalate " " $ catMaybes tokens


convertTokenToText :: TK.Token -> Text
convertTokenToText tk = fromJust (cutf8 <$> (tk^.TK.originalText))


-- | Get tokens from ProtoSents.
getAllTokens :: [S.Sentence] -> [Token]
getAllTokens psents =
  let Just (toklst :: [Token]) = mapM convertToken . concatMap (toListOf (S.token . traverse)) $ psents
  in toklst


getTKTokens :: S.Sentence -> [TK.Token]
getTKTokens psent = 
  let toklst = (toListOf (S.token . traverse)) $ psent
  in toklst


getTokens :: S.Sentence -> Maybe [Token]
getTokens psent =
  let toklst = mapM convertToken . (toListOf (S.token . traverse)) $ psent
  in toklst


getProtoDoc :: J ('Class "edu.stanford.nlp.pipeline.Annotation") -> IO D.Document
getProtoDoc ann = do
  bstr <- serializeDoc ann
  let lbstr = BL.fromStrict bstr
  case (messageGet lbstr :: Either String (D.Document,BL.ByteString)) of
    Left  err     -> error err
    Right (doc,_) -> return doc


