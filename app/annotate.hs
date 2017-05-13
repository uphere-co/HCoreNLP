{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Control.Arrow                    ((&&&))
import           Control.Lens
import           Control.Monad                    (join)
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.Foldable              as F  (toList)
import           Data.Maybe                       (catMaybes, fromJust)
import           Data.Text                        (Text)
import qualified Data.Text                  as T
import qualified Data.Text.IO               as TIO
import qualified Data.Text.Lazy             as TL
import qualified Data.Text.Lazy.Encoding    as TLE
import           Data.Time.Calendar               (fromGregorian)
import           Data.Yaml
import           GHC.Generics
import           Language.Java         as J
import           System.Environment               (getEnv,getArgs)
import           Text.ProtocolBuffers.Basic       (Utf8, utf8)
import           Text.ProtocolBuffers.WireMessage (messageGet)
--
import           NLP.SyntaxTree.Type.PennTreebankII
--
import           CoreNLP.Simple
import           CoreNLP.Simple.Type
import           CoreNLP.Simple.Type.Simplified
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
import qualified CoreNLP.Proto.HCoreNLPProto.ListTimex as T


       
    
{- 
processTimex ann = do
  bstr <- serializeTimex ann
  let lbstr = BL.fromStrict bstr
  case (messageGet lbstr :: Either String (T.ListTimex,BL.ByteString)) of
    Left err -> print err
    Right (tmx,lbstr') -> do
      mapM_ print (tmx ^. T.timexes)
-}

cutf8 :: Utf8 -> Text
cutf8 = TL.toStrict . TLE.decodeUtf8 . utf8 

convertSentence :: D.Document -> S.Sentence -> Maybe Sentence
convertSentence d s = do
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

processDoc :: J ('Class "edu.stanford.nlp.pipeline.Annotation") -> IO ([Sentence], [Token])
processDoc ann = do
  bstr <- serializeDoc ann
  let lbstr = BL.fromStrict bstr
  case (messageGet lbstr :: Either String (D.Document,BL.ByteString)) of
    Left err -> print err >> return ([],[])
    Right (doc,lbstr') -> do
      let sents = toListOf (D.sentence . traverse) doc
          Just newsents = mapM (convertSentence doc) sents
      mapM_ print newsents
      let Just (toklst :: [Token]) = mapM convertToken . concatMap (toListOf (S.token . traverse)) $ sents
      
      -- mapM_ print toklst
      return (newsents,toklst)
{- 
      print sents
      putStrLn "show number of tokens per each sentence:"
      print $ map (lengthOf (S.token . traverse)) sents 
      putStrLn "show each token"
      mapM_ print $ zip [1..] $ map (catMaybes . toListOf (S.token . traverse . TK.word)) sents
      putStrLn "show each timex"
      mapM_ print $ zip [1..] $ map (catMaybes . toListOf (S.token . traverse . TK.timexValue)) sents
      putStrLn "show starting point"
      mapM_ print $ zip [1..] $ map (fromJust . fromJust . firstOf (S.token . traverse . TK.beginChar)) sents
      putStrLn "show ending point"
      mapM_ print $ zip [1..] $ map (fromJust . fromJust . lastOf (S.token . traverse . TK.endChar)) sents
      putStrLn "show the pair of (starting,ending)"
       -- let  combine :: Lens' s a -> Lens' s b -> Lens' s (a,b)
       --     combine l1 l2 = lens (\s -> (view l1 s, view l2 s)) (\s (x,y) -> set l1 x (set l2 y s))
      mapM_ print $ zip [1..] $ flip map sents $ \s -> 
        let b = fromJust $ fromJust $ firstOf (S.token . traverse . TK.beginChar) s
            e = fromJust $ fromJust $ lastOf  (S.token . traverse . TK.endChar) s
        in (b,e)
      
      -- print (traverse (D.sentence . S.token) doc)
-}

data TestData = TestData { test :: [TestData2]
                         } deriving (Show, Generic)

data TestData2 = TestData2 { test2 :: String
                           } deriving (Show, Generic)

instance FromJSON TestData
instance FromJSON TestData2



{-
data ESOEvent = ESOEvent { NAF :: NafStructure
                         } deriving (Show, Generic)

data NafStructure = NafStructure { nafHeader :: Header
                                 , raw :: Text
                                 , text :: Text
                                 , terms :: [Term]
                                 , markables :: [Marks]
                                 , deps :: [Dep]
                                 , entities :: [Entity]
                                 , coreferences :: [Cor]
                                 , timeExpressions :: [A]
                                 , srl :: [Srl]
                                 , constituency :: [Con]
                                 , temporalRelations :: [Temp]
                                 , topics :: [Topic]
                                 , factualities :: [Frac]
                                 , xml :: Text
                                 , version :: Text
                                 } deriving (Show, Generic)
  

instance FromJSON ESOEvent
-}


main :: IO ()
main = do
    args <- getArgs
    let fp = args !! 0
    txt <- TIO.readFile fp
    clspath <- getEnv "CLASSPATH"
    J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      let pcfg = PPConfig True True True True True
      pp <- prepare pcfg
      let doc = Document txt (fromGregorian 2017 4 17) 
      ann <- annotate pp doc
      (r1, r2) <- processDoc ann 
      let jr1 = encode r1
          jr2 = encode r2
      print jr1
      print jr2
      -- mapM_ print (r1,r2)

    testfile <- decodeFile "test.yml" :: IO (Maybe TestData)
    print testfile
