{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import           Control.Lens
import           Control.Monad                      (join,when)
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import           Data.Default
import           Data.Foldable                      (toList)
import qualified Data.IntMap                as IM
import           Data.Maybe                         (catMaybes,fromMaybe,mapMaybe,listToMaybe)
import           Data.Monoid                        ((<>))
import qualified Data.Sequence              as Seq
import           Data.Text                          (Text)
import qualified Data.Text                  as T
import qualified Data.Text.IO               as TIO
import qualified Data.Text.Lazy             as TL
import qualified Data.Text.Lazy.Builder     as TLB  (toLazyText)
import qualified Data.Text.Lazy.Encoding    as TLE
import qualified Data.Text.Lazy.IO          as TLIO
import           Data.Traversable                   (traverse)
import           Data.Time.Calendar                 (fromGregorian)
import           Language.Java         as J
import           Options.Applicative
import           System.Environment               (getEnv,getArgs)
import           Text.ProtocolBuffers.Basic       (Utf8, utf8)
import           Text.ProtocolBuffers.WireMessage (messageGet)
--
import           NLP.Type.PennTreebankII
import           NLP.Type.UniversalDependencies2.Syntax
import           YAML.Builder
--
import           CoreNLP.Simple
import           CoreNLP.Simple.Convert
import           CoreNLP.Simple.Type
import           CoreNLP.Simple.Type.Simplified
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
import qualified CoreNLP.Proto.CoreNLPProtos.ParseTree as PT
-- import qualified CoreNLP.Proto.HCoreNLPProto.ListTimex as T
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph       as DG
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph.Node  as DN
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph.Edge  as DE




instance MakeYaml Int where
  makeYaml _ x = YPrim (YInteger x)

instance MakeYaml (Int,Int) where
  makeYaml n (x,y) = YLArray Inline [ makeYaml n x, makeYaml n y ] 

instance MakeYaml Sentence where
  makeYaml n s = YObject [ ("index"     , makeYaml n (s^.sent_index))
                         , ("charRange" , makeYaml n (s^.sent_charRange))
                         , ("tokenRange", makeYaml n (s^.sent_tokenRange)) ]
                 
instance MakeYaml Text where
  makeYaml _ txt = YPrim (YString Plain (TL.fromStrict txt))

instance MakeYaml Token where
  makeYaml n t = YObject [ ("range", makeYaml n (t^.token_range))
                         , ("text" , makeYaml n (t^.token_text))
                         , ("pos"  , makeYaml n (T.pack (show (t^.token_pos))))
                         , ("lemma", makeYaml n (t^.token_lemma))
                         ]

instance MakeYaml a => MakeYaml [a] where
  makeYaml n xs = YIArray (map (makeYaml n) xs)

data SentenceTokens = SentenceTokens [Sentence] [Token]

instance MakeYaml SentenceTokens where
  makeYaml n (SentenceTokens ss ts) = YObject [ ("sentences", makeYaml n ss)
                                              , ("tokens", makeYaml n ts) ]



processDoc :: J ('Class "edu.stanford.nlp.pipeline.Annotation")
           -> IO (Either String D.Document) 
processDoc ann = do
  bstr <- serializeDoc ann
  let lbstr = BL.fromStrict bstr
  return $ fmap fst (messageGet lbstr :: Either String (D.Document,BL.ByteString))


data ProgOption = ProgOption { textFile :: FilePath
                             , showDependency :: Bool
                             , tagNER :: Bool
                             } deriving Show

pOptions :: Parser ProgOption
pOptions = ProgOption <$> strOption (long "file" <> short 'f' <> help "Text File")
                      <*> switch (long "dependency" <> short 'd' <> help "Whether to show dependency")
                      <*> switch (long "ner" <> short 'n' <> help "Whether to tag NER")

progOption :: ParserInfo ProgOption 
progOption = info pOptions (fullDesc <> progDesc "Annotate using CoreNLP")

convertC = fromMaybe "" . fmap cutf8

mkConTree p =
  case (Seq.viewl $ PT._child p) of
    Seq.EmptyL   -> error "Error!"
    p' Seq.:< sq -> case (Seq.viewl sq) of
      Seq.EmptyL   -> case (Seq.viewl $ PT._child p') of
        Seq.EmptyL    -> PL (convertC $ PT._value p) (convertC $ PT._value p')
        sq'           -> PN (convertC $ PT._value p) (map mkConTree (toList (PT._child p)))
      sq''         -> PN (convertC $ PT._value p) (map mkConTree (toList (PT._child p)))

main :: IO ()
main = do
  opt <- execParser progOption
  let fp = textFile opt
  txt <- TIO.readFile fp
  clspath <- getEnv "CLASSPATH"
  J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
    let pcfg = def & ( tokenizer .~ True )
                   . ( words2sentences .~ True )
                   . ( postagger .~ True )
                   . ( lemma .~ True )
                   . ( sutime .~ True )
                   . ( depparse .~ showDependency opt )
                   . ( constituency .~ True )
                   . ( ner .~ tagNER opt )
    pp <- prepare pcfg
    let doc = Document txt (fromGregorian 2017 4 17)
    ann <- annotate pp doc
    rdoc <- processDoc ann

    case rdoc of
      Left e -> print e
      Right d -> do
        let sents = d ^.. D.sentence . traverse
        let cpt = mapMaybe S._parseTree sents
        let pt = map mkConTree cpt
        print pt
    {-
    case rdoc of
      Left e -> print e
      Right d -> do
        let sents = d ^.. D.sentence . traverse
        
        -- let sents = toListOf (D.sentence . traverse) d
            Just newsents = mapM (convertSentence d) sents
        mapM_ print newsents
        let Just (toklst :: [Token]) = mapM convertToken . concatMap (toListOf (S.token . traverse)) $ sents
            result = SentenceTokens newsents toklst 
        TLIO.putStrLn $ TLB.toLazyText (buildYaml 0 (makeYaml 0 result))
        when (showDependency opt) $ 
          mapM_ (print . sentToDep) sents
        when (tagNER opt) $
          mapM_ (print . sentToNER) sents
-}
