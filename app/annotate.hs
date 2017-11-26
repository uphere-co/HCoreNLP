{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import           Control.Lens
import           Control.Monad                      (when)
import qualified Data.ByteString.Char8      as B
import qualified Data.ByteString.Lazy.Char8 as B.L
import           Data.Default
import           Data.Foldable
import qualified Data.IntMap                as IM
import           Data.Maybe                         (fromJust, mapMaybe)
import           Data.Monoid                        ((<>))
import           Data.Text                          (Text)
import qualified Data.Text                  as T
import qualified Data.Text.IO               as TIO
import qualified Data.Text.Lazy             as TL
import qualified Data.Text.Lazy.Builder     as TLB  (toLazyText)
import qualified Data.Text.Lazy.IO          as TLIO
import           Data.Traversable                   (traverse)
import           Data.Time.Calendar                 (fromGregorian)
import           Language.Java              as J
import           Options.Applicative
import           System.Environment                 (getEnv)
import           Text.ProtocolBuffers.WireMessage   (messageGet)
--
import           NLP.Printer.PennTreebankII
import 	       	 NLP.Type.CoreNLP
import           NLP.Type.PennTreebankII
import           NLP.Type.TagPos
import           YAML.Builder
--
import           CoreNLP.Simple
import           CoreNLP.Simple.Convert
import           CoreNLP.Simple.Type
import           CoreNLP.Simple.Util
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
import qualified CoreNLP.Proto.CoreNLPProtos.Timex           as Tmx
import qualified CoreNLP.Proto.HCoreNLPProto.ListTimex       as Tmx
import qualified CoreNLP.Proto.HCoreNLPProto.TimexWithOffset as Tmx

instance MakeYaml Int where
  makeYaml _ x = YPrim (YInteger x)

instance MakeYaml (Int,Int) where
  makeYaml n (x,y) = YLArray Inline [ makeYaml n x, makeYaml n y ] 

instance MakeYaml SentenceIndex where
  makeYaml n s = YObject [ ("index"     , makeYaml n (s^.sent_index))
                         , ("charRange" , makeYaml n (s^.sent_charRange))
                         , ("tokenRange", makeYaml n (s^.sent_tokenRange)) ]
                 
instance MakeYaml Text where
  makeYaml _ txt = YPrim (YString Plain (TL.fromStrict txt))

instance MakeYaml Token where
  makeYaml n t = YObject [ ("token_range", makeYaml n (t^.token_tok_idx_range))
                         , ("char_range", makeYaml n (t^.token_char_idx_range))                           
                         , ("text" , makeYaml n (t^.token_text))
                         , ("pos"  , makeYaml n (T.pack (show (t^.token_pos))))
                         , ("lemma", makeYaml n (t^.token_lemma))
                         ]

instance MakeYaml a => MakeYaml [a] where
  makeYaml n xs = YIArray (map (makeYaml n) xs)

data SentenceTokens = SentenceTokens [SentenceIndex] [Token]

instance MakeYaml SentenceTokens where
  makeYaml n (SentenceTokens ss ts) = YObject [ ("sentences", makeYaml n ss)
                                              , ("tokens", makeYaml n ts) ]



listTimexToTagPos :: Tmx.ListTimex -> [TagPos TokIdx (Maybe Text)]
listTimexToTagPos tmxs = tmxs^.. Tmx.timexes . traverse . to convert
  where
    fi = fromIntegral
    convert t = TagPos (fi (t^.Tmx.tokenBegin), fi (t^.Tmx.tokenEnd), t^?Tmx.timex . Tmx.value . _Just . to cutf8)


data ProgOption = ProgOption { textFile :: FilePath
                             , showLemma        :: Bool
                             , showDependency   :: Bool
                             , showConstituency :: Bool
                             , tagNER           :: Bool
                             , posOnly          :: Bool
                             , showSUTime       :: Bool
                             } deriving Show

pOptions :: Parser ProgOption
pOptions = ProgOption <$> strOption (long "file" <> short 'f' <> help "Text File")
                      <*> switch    (long "lemma"        <> short 'l' <> help "Whether to show lemma")
                      <*> switch    (long "dependency"   <> short 'd' <> help "Whether to show dependency parsing result")
                      <*> switch    (long "constituency" <> short 'c' <> help "Whether to show constituency parsing result")
                      <*> switch    (long "ner"          <> short 'n' <> help "Whether to tag NER")
                      <*> switch    (long "posonly"      <> short 'p' <> help "POS only")
                      <*> switch    (long "time"         <> short 't' <> help "Time tagging (SUTime)")

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
                   . ( constituency .~ (showConstituency opt || posOnly opt) )
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

            lmap= flip map sents $ \sent -> 
                    let lemmamap = IM.toList (mkLemmaMapFromPSent sent)
                        tkns = map (^.TK.word.to (cutf8.fromJust)) . getTKTokens $ sent
                    in map (\(o,(i,l)) -> (i,(unLemma l,o))) $ zip tkns lemmamap  

        -- mapM_ print newsents
        when (showLemma opt) $
          mapM_ print lmap
              
        -- let Just (toklst :: [Token]) = mapM convertToken . concatMap (toListOf (S.token . traverse)) $ sents
        --     result = SentenceTokens newsents toklst 
        -- TLIO.putStrLn $ TLB.toLazyText (buildYaml 0 (makeYaml 0 result))
        when (showDependency opt) $ do
          let deps = map sentToDep sents
          mapM_ print deps
        when (showConstituency opt) $ do
          mapM_ print pt  -- PennTree print
          -- mapM_ (TIO.putStrLn . prettyPrint 0) pt
          -- mapM_ print cpt
          -- mapM_ print (mapMaybe (^.S.annotatedParseTree) sents)
        when (tagNER opt) $
          mapM_ (print . sentToNER) sents
        when (posOnly opt) $ do
          let tags = concatMap (toList . getADTPennTree) pt
          print tags
        when (showSUTime opt) $ do
          putStrLn  "SUTIME"
          lbstr_sutime <- B.L.fromStrict <$> serializeTimex ann
          case fmap fst (messageGet lbstr_sutime) :: Either String Tmx.ListTimex of
            Left _ -> return ()
            Right tmxs -> do
              print (listTimexToTagPos tmxs)
          

main :: IO ()
main = runAnnotate
