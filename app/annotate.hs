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
import           Data.Maybe                         (catMaybes,fromMaybe,listToMaybe)
import           Data.Monoid                        ((<>))
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
import           CoreNLP.Simple.Type
import           CoreNLP.Simple.Type.Simplified
import qualified CoreNLP.Proto.CoreNLPProtos.Document  as D
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence  as S
import qualified CoreNLP.Proto.CoreNLPProtos.Token     as TK
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

processDoc :: J ('Class "edu.stanford.nlp.pipeline.Annotation")
           -> IO (Either String D.Document) 
processDoc ann = do
  bstr <- serializeDoc ann
  let lbstr = BL.fromStrict bstr
  return $ fmap fst (messageGet lbstr :: Either String (D.Document,BL.ByteString))


data ProgOption = ProgOption { textFile :: FilePath
                             , showDependency :: Bool
                             } deriving Show

pOptions :: Parser ProgOption
pOptions = ProgOption <$> strOption (long "file" <> short 'f' <> help "Text File")
                      <*> switch (long "dependency" <> short 'd' <> help "Whether to show dependency")

progOption :: ParserInfo ProgOption 
progOption = info pOptions (fullDesc <> progDesc "Annotate using CoreNLP")


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
    pp <- prepare pcfg
    let doc = Document txt (fromGregorian 2017 4 17) 
    ann <- annotate pp doc
    rdoc <- processDoc ann
    case rdoc of
      Left e -> print e
      Right d -> do
        let sents = toListOf (D.sentence . traverse) d
            Just newsents = mapM (convertSentence d) sents
        mapM_ print newsents
        let Just (toklst :: [Token]) = mapM convertToken . concatMap (toListOf (S.token . traverse)) $ sents
            result = SentenceTokens newsents toklst 
        TLIO.putStrLn $ TLB.toLazyText (buildYaml 0 (makeYaml 0 result))
        when (showDependency opt) $ do
          let sents = d ^. D.sentence
          mapM_ (print . sentToDep) sents

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

