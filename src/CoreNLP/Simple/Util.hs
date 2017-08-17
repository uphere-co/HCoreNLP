{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module CoreNLP.Simple.Util where

import           Control.Lens
import qualified Data.ByteString.Lazy.Char8            as BL
import           Data.Maybe                                  (catMaybes, fromJust)
import           Data.Text                                   (Text)
import qualified Data.Text                             as T
import           Data.Time.Clock                             (getCurrentTime,UTCTime(..))
import           Language.Java                         as J
import           Text.ProtocolBuffers.WireMessage            (messageGet)
--
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
--
import           CoreNLP.Simple
import           CoreNLP.Simple.Convert                      
import           CoreNLP.Simple.Type
import           CoreNLP.Simple.Type.Simplified


getDoc :: Text -> IO Document
getDoc txt = do
  day <- fmap utctDay getCurrentTime
  return $ Document txt day


getProtoSents :: D.Document -> [S.Sentence]
getProtoSents doc = toListOf (D.sentence . traverse) doc


convertProtoSents :: [S.Sentence] -> D.Document -> [SentenceIndex]
convertProtoSents psents doc =
  let Just newsents = mapM (convertSentence doc) psents
  in newsents


getSents :: D.Document -> [SentenceIndex]
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


