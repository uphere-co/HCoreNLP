{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Control.Applicative
import           Control.Lens
import           Control.Monad                    ((>=>),join,void)
import           Control.Monad.IO.Class           (liftIO)
import           Control.Monad.Loops              (whileJust_)
import           Control.Monad.Trans.Class        (lift)
import           Control.Monad.Trans.Either
import           Data.Aeson
import           Data.Aeson.Types
import qualified Data.Attoparsec.Text       as A
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import           Data.Maybe                       (isJust)
import           Data.Monoid
import           Data.Text                        (Text)
import qualified Data.Text                  as T
import qualified Data.Text.IO               as TIO
import           GHC.Generics
import           Language.Java         as J
import           System.Console.Haskeline
import           System.Environment               (getEnv,getArgs)
import           Text.Printf
import           Text.ProtocolBuffers.WireMessage (messageGet)
--
import           NLP.SyntaxTree.Parser
import           NLP.SyntaxTree.Printer
import           Type
import           Util.Doc
import           View
--
import           CoreNLP
import           CoreNLP.Simple
import           CoreNLP.Type
import qualified CoreNLPProtos.Document

  
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
      print (messageGet lbstr :: Either String (CoreNLPProtos.Document.Document,BL.ByteString))
      return ()

    
