{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import           Control.Lens
import           Control.Monad                      (when)
import qualified Data.ByteString.Char8 as B
import           Data.Default
import           Data.Maybe                         (mapMaybe)
import           Data.Monoid                        ((<>))
import           Data.Text                          (Text)
import qualified Data.Text                  as T
import qualified Data.Text.IO               as TIO
import qualified Data.Text.Lazy             as TL
import qualified Data.Text.Lazy.Builder     as TLB  (toLazyText)
import qualified Data.Text.Lazy.IO          as TLIO
import           Data.Traversable                   (traverse)
import           Data.Time.Calendar                 (fromGregorian)
import           Language.Java         as J
import           Options.Applicative
import           System.Environment               (getEnv)
--
import           NLP.Printer.PennTreebankII
import           YAML.Builder
--
import           CoreNLP.Simple
import           CoreNLP.Simple.Convert
import           CoreNLP.Simple.Type
import           CoreNLP.Simple.Type.Simplified
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified NLP.Type.NamedEntity    as N 
import           WikiEL                           (loadEMtagger)


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



data ProgOption = ProgOption { textFile :: FilePath
                             , showDependency :: Bool
                             , showConstituency :: Bool
                             , tagNER :: Bool
                             } deriving Show

pOptions :: Parser ProgOption
pOptions = ProgOption <$> strOption (long "file" <> short 'f' <> help "Text File")
                      <*> switch (long "dependency" <> short 'd' <> help "Whether to show dependency parsing result")
                      <*> switch (long "constituency" <> short 'c' <> help "Whether to show constituency parsing result")
                      <*> switch (long "ner" <> short 'n' <> help "Whether to tag NER")

progOption :: ParserInfo ProgOption 
progOption = info pOptions (fullDesc <> progDesc "Annotate using CoreNLP")


runAnnotate :: IO ()
runAnnotate = do
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
                   . ( constituency .~ showConstituency opt )
                   . ( ner .~ tagNER opt )
    pp <- prepare pcfg
    let doc = Document txt (fromGregorian 2017 4 17)
    ann <- annotate pp doc
    rdoc <- protobufDoc ann
    case rdoc of
      Left e -> print e
      Right d -> do
        let sents = d ^.. D.sentence . traverse
            Just newsents = mapM (convertSentence d) sents
            cpt = mapMaybe S._parseTree sents
            pt = map decodeToPennTree cpt       
        mapM_ print newsents
        let Just (toklst :: [Token]) = mapM convertToken . concatMap (toListOf (S.token . traverse)) $ sents
            result = SentenceTokens newsents toklst 
        TLIO.putStrLn $ TLB.toLazyText (buildYaml 0 (makeYaml 0 result))
        when (showDependency opt) $ 
          mapM_ (print . sentToDep) sents
        when (showConstituency opt) $ do
          mapM_ (TIO.putStrLn . prettyPrint 0) pt
          mapM_ print cpt
          mapM_ print (mapMaybe (^.S.annotatedParseTree) sents)
        when (tagNER opt) $
          mapM_ (print . sentToNER) sents


runWikiEL :: IO ()
runWikiEL = do
  emTagger <- loadEMtagger "/data/groups/uphere/wikidata/testset/uid"
                           [(N.Org, "/data/groups/uphere/wikidata/testset/ne.org"),
                            (N.Person, "/data/groups/uphere/wikidata/testset/ne.person")]
  opt <- execParser progOption
  let fp = textFile opt
  txt <- TIO.readFile fp
  clspath <- getEnv "CLASSPATH"
  J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
    let pcfg = def & ( tokenizer .~ True )
                   . ( words2sentences .~ True )
                   . ( postagger .~ True )
                   . ( lemma .~ False )
                   . ( sutime .~ False )
                   . ( depparse .~ False )
                   . ( constituency .~ False )
                   . ( ner .~ True )
    pp <- prepare pcfg
    let doc = Document txt (fromGregorian 2017 4 17)
    ann <- annotate pp doc
    rdoc <- protobufDoc ann
    case rdoc of
      Left e -> print e
      Right d -> do
        let sents = d ^.. D.sentence . traverse
            f (NERSentence tokens) = tokens
            neTokens =  concatMap (f.sentToNER) sents
            linked_mentions = emTagger neTokens
            text = T.unwords (map fst neTokens)
        print text
        mapM_ print linked_mentions 

main :: IO ()
main = runWikiEL
