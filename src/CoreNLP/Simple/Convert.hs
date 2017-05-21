{-# LANGUAGE OverloadedStrings #-}

module CoreNLP.Simple.Convert where

import           Control.Lens
import           Control.Monad                  (join)
import           Data.Foldable                  (toList)
import qualified Data.IntMap             as IM
import           Data.Maybe                     (fromMaybe,listToMaybe)
import           Data.Text                      (Text)
import qualified Data.Text               as T
import qualified Data.Text.Lazy          as TL
import qualified Data.Text.Lazy.Encoding as TLE
import           Text.ProtocolBuffers.Basic     (Utf8, utf8)
--
import           NLP.Type.PennTreebankII
import           NLP.Type.UniversalDependencies2.Syntax
--
import           CoreNLP.Simple.Type.Simplified
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph       as DG
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph.Node  as DN
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph.Edge  as DE

cutf8 :: Utf8 -> Text
cutf8 = TL.toStrict . TLE.decodeUtf8 . utf8 

convertSentence :: D.Document -> S.Sentence -> Maybe Sentence
convertSentence _d s = do
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

sentToDep :: S.Sentence -> Maybe Dependency
sentToDep s = do
  d <- s ^. S.basicDependencies
  let ts = zip [1..] (map (fromMaybe "" . fmap cutf8) (s ^.. S.token . traverse . TK.word))
      m = IM.fromList ts
  convertDep m d     
      
convertDep :: IM.IntMap Text -> DG.DependencyGraph -> Maybe Dependency
convertDep m g = Dependency <$> mapM (convertN m) (toList (g^.DG.node))
                            <*> mapM (convertE m) (toList (g^.DG.edge))

convertN :: IM.IntMap Text -> DN.Node -> Maybe Node
convertN m n = do
  let k = fromIntegral (n^.DN.index)
  w <- IM.lookup k m
  return (k,w)
  
convertE :: IM.IntMap Text -> DE.Edge -> Maybe Edge
convertE m e = do
  let deptxt = fromMaybe "" (fmap cutf8 (e^.DE.dep))
  dep <- parseDepRel =<< listToMaybe (T.split (== ':') deptxt)
   -- dep = maybe (Left deptxt) Right mdep
  return ((fromIntegral (e^.DE.source),fromIntegral (e^.DE.target)), dep )


