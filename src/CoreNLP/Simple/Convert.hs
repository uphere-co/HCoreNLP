{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE OverloadedStrings #-}

module CoreNLP.Simple.Convert where

import           Control.Lens
import           Control.Monad                  (join)
import           Data.Either.Extra              (maybeToEither)
import           Data.Foldable                  (toList)
import           Data.IntMap                    (IntMap)
import qualified Data.IntMap             as IM
import           Data.List                      (foldl')
import           Data.Maybe                     (catMaybes,fromJust,fromMaybe)
import           Data.Monoid                    ((<>))
import qualified Data.Sequence           as Seq
import           Data.Text                      (Text)
import qualified Data.Text               as T
import qualified Data.Text.Lazy          as TL
import qualified Data.Text.Lazy.Encoding as TLE
import           Text.ProtocolBuffers.Basic     (Utf8, utf8)
--
import           NLP.Type.NamedEntity
import           NLP.Type.PennTreebankII
import           NLP.Type.UniversalDependencies2.Syntax
--
import           CoreNLP.Simple.Type.Simplified
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.ParseTree as PT
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

sentToDep :: S.Sentence -> Either String Dependency
sentToDep s = do
  d <- maybeToEither ("no basicDependencies") $ s ^. S.basicDependencies
  let ts = zip [1..] (map (fromMaybe "" . fmap cutf8) (s ^.. S.token . traverse . TK.word))
      m = IM.fromList ts
  convertDep m d     
      
convertDep :: IM.IntMap Text -> DG.DependencyGraph -> Either String Dependency
convertDep m g = Dependency <$> pure (fromIntegral (Seq.index (g^.DG.root) 0))
                            <*> mapM (convertN m) (toList (g^.DG.node))
                            <*> mapM convertE (toList (g^.DG.edge))

convertN :: IM.IntMap Text -> DN.Node -> Either String Node
convertN m n = do
  let k = fromIntegral (n^.DN.index)
  w <- maybeToEither ("token " <> show k) $ IM.lookup k m
  return (k,w)

convertE :: DE.Edge -> Either String Edge
convertE e = do
  let deptxt = fromMaybe "" (fmap cutf8 (e^.DE.dep))
  dep <- parseDepRel =<< (case T.split (== ':') deptxt of [] -> Left "no deptxt" ; x:_ -> Right x)
  return ((fromIntegral (e^.DE.source),fromIntegral (e^.DE.target)), dep )


sentToNER :: S.Sentence -> NERSentence
sentToNER s =
  let tks = toList (s ^. S.token)
      cf = fromMaybe "" . fmap cutf8
      cc x = (fromMaybe (error (show x)) . classify . cf) x
  in NERSentence $ map (\x -> (cf (x^.TK.word),cc (x^.TK.ner))) tks


decodeToPennTree :: PT.ParseTree -> PennTree
decodeToPennTree p =
    case Seq.viewl (p^.PT.child) of
      Seq.EmptyL   -> error "Error!"
      p' Seq.:< sq -> case Seq.viewl sq of
        Seq.EmptyL   -> case Seq.viewl (PT._child p') of
          Seq.EmptyL    -> PL (cf (p^.PT.value), cf (p'^.PT.value))
          _sq'          -> PN (cf (p^.PT.value)) (map decodeToPennTree (toList (p^.PT.child)))
        _sq''        -> PN (cf (p^.PT.value)) (map decodeToPennTree (toList (p^.PT.child)))
  where cf = fromMaybe "" . fmap cutf8


mkLemmaMap :: S.Sentence -> IntMap Text
mkLemmaMap sent = foldl' (\(!acc) (k,v) -> IM.insert k v acc) IM.empty $
                    zip [0..] (catMaybes (sent ^.. S.token . traverse . TK.lemma . to (fmap cutf8)))

lemmatize :: IntMap Text
          -> PennTreeIdxG ChunkTag (POSTag,Text)
          -> PennTreeIdxG ChunkTag (POSTag,(Text,Text))
lemmatize m = bimap id (\(i,(p,x)) -> (i,(p,(x,fromJust (IM.lookup i m)))))
