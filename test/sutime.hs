{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

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
import           Data.Text                        (Text)
import qualified Data.Text                  as T
import qualified Data.Text.IO               as TIO
import           GHC.Generics
import           Language.Java         as J
import           System.Console.Haskeline
import           System.Environment               (getEnv)
--
import           NLP.SyntaxTree.Parser
import           NLP.SyntaxTree.Printer
--
import           CoreNLP
import           CoreNLP.SUTime
import           CoreNLP.Type



main :: IO ()
main = do
    clspath <- getEnv "CLASSPATH"
    let txt = "Starting next week, Wal-Mart shoppers will receive a discount on 10,000 online-only items if they elect to pick up their orders in-store. Come June, the service will be available on more than 1 million items. The discounts will vary based on the item's size and price."
    J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      pp <- prepare
      r <- annotateTime pp txt "2017-04-17"
      TIO.putStrLn r
