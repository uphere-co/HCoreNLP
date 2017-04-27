{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Control.Lens
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.Foldable              as F  (toList)
import qualified Data.Text.IO               as TIO
import           Language.Java         as J
import           System.Environment               (getEnv,getArgs)
import           Text.ProtocolBuffers.WireMessage (messageGet)
--
import           CoreNLP.Simple
import qualified CoreNLPProtos.Document as D
import qualified CoreNLPProtos.Sentence as S

  
main :: IO ()
main = do
    args <- getArgs
    let fp = args !! 0
    txt <- TIO.readFile fp
    clspath <- getEnv "CLASSPATH"
    J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      pp <- prepare
      ann <- annotate pp txt
      bstr <- serialize ann
      let lbstr = BL.fromStrict bstr
      case (messageGet lbstr :: Either String (D.Document,BL.ByteString)) of
        Left err -> print err
        Right (doc,_) -> do
          mapM_ print . zip ([1..] :: [Int]) . F.toList . fmap (^. S.token) $ (doc ^. D.sentence)
      return ()

    
