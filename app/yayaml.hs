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
import           Control.Monad.Trans.Class        (lift)
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
import           Language.Java              as J
import           System.Console.Haskeline
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
--
import           YAML.Builder


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
      return (newsents,toklst)

main :: IO ()
main = do
  
  -- args <- getArgs
  -- let fp = args !! 0
  -- txt <- TIO.readFile fp
  
  clspath <- getEnv "CLASSPATH"
  J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
    let pcfg = PPConfig True True True True True
    pp <- prepare pcfg


    ret <- runInputT defaultSettings myaction
    let txt = T.pack (fromJust ret)
    let doc = Document txt (fromGregorian 2017 4 17) 
    ann <- annotate pp doc
    (r1, r2) <- processDoc ann
    print $ zip (map _token_lemma r2) (map _token_pos r2)
    -- print r2
    {-
    let jr1 = encode r1
        jr2 = encode r2
    putStrLn (TL.unpack (TLE.decodeUtf8 $ BL.fromStrict jr1))
    putStrLn (TL.unpack (TLE.decodeUtf8 $ BL.fromStrict jr2))
    -}

  putStrLn "Program is finished!"


myaction :: InputT IO (Maybe String)
myaction = do
  str <- getInputLine "Input Sentence : "
  lift (print str)
  return str

{-
data POSTag = CC    --  Coordinating conjunction
            | CD    --  Cardinal number
            | DT    --  Determiner
            | EX    --  Existential there
            | FW    --  Foreign word
            | IN    --  Preposition or subordinating conjunction
            | JJ    --  Adjective
            | JJR   --  Adjective, comparative
            | JJS   --  Adjective, superlative
            | LS    --  List item marker
            | MD    --  Modal
            | NN    --  Noun, singular or mass
            | NNS   --  Noun, plural
            | NNP   --  Proper noun, singular
            | NNPS  --  Proper noun, plural
            | PDT   --  Predeterminer
            | POS   --  Possessive ending
            | PRP   --  Personal pronoun
            | PRP'  --  Possessive pronoun
            | RB    --  Adverb
            | RBR   --  Adverb, comparative
            | RBS   --  Adverb, superlative
            | RP    --  Particle
            | SYM   --  Symbol
            | TO    --  to
            | UH    --  Interjection
            | VB    --  Verb, base form
            | VBD   --  Verb, past tense
            | VBG   --  Verb, gerund or present participle
            | VBN   --  Verb, past participle
            | VBP   --  Verb, non-3rd person singular present
            | VBZ   --  Verb, 3rd person singular present
            | WDT   --  Wh-determiner
            | WP    --  Wh-pronoun
            | WP'   --  Possessive wh-pronoun
            | WRB   --  Wh-adverb
-}
