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
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.Foldable              as F  (toList)
import           Data.Maybe                       (catMaybes, fromJust)
import qualified Data.Text.IO               as TIO
import           Data.Time.Calendar               (fromGregorian)
import           Language.Java         as J
import           System.Environment               (getEnv,getArgs)
import           Text.ProtocolBuffers.Basic       (Utf8, utf8)
import           Text.ProtocolBuffers.WireMessage (messageGet)
--
import           CoreNLP.Simple
import           CoreNLP.Simple.Type
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
import qualified CoreNLP.Proto.HCoreNLPProto.ListTimex as T

import           Data.Text                        (Text)
import qualified Data.Text                  as T
import qualified Data.Text.Lazy             as TL
import qualified Data.Text.Lazy.Encoding    as TLE

       
main :: IO ()
main = do
    args <- getArgs
    let fp = args !! 0
    txt <- TIO.readFile fp
    clspath <- getEnv "CLASSPATH"
    J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      let pcfg = PPConfig True True True True
      pp <- prepare pcfg
      let doc = Document txt (fromGregorian 2017 4 17) 
      ann <- annotate pp doc
      processDoc ann 
    

processTimex ann = do
  bstr <- serializeTimex ann
  let lbstr = BL.fromStrict bstr
  case (messageGet lbstr :: Either String (T.ListTimex,BL.ByteString)) of
    Left err -> print err
    Right (tmx,lbstr') -> do
      mapM_ print (tmx ^. T.timexes)

cutf8 :: Utf8 -> Text
cutf8 = TL.toStrict . TLE.decodeUtf8 . utf8 


processDoc ann = do
  bstr <- serializeDoc ann
  let lbstr = BL.fromStrict bstr
  case (messageGet lbstr :: Either String (D.Document,BL.ByteString)) of
    Left err -> print err
    Right (doc,lbstr') -> do
      let sents = toListOf (D.sentence . traverse) doc
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

      
    
