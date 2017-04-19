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
--
import           NLP.SyntaxTree.Parser
import           NLP.SyntaxTree.Printer
import           Type
import           Util.Doc
import           View
--
import           CoreNLP
import           CoreNLP.SUTime
import           CoreNLP.SUTime.Parser
import           CoreNLP.Type


    -- let txt = "Starting next week, Wal-Mart shoppers will receive a discount on 10,000 online-only items if they elect to pick up their orders in-store. Come June, the service will be available on more than 1 million items. The discounts will vary based on the item's size and price."

formatstr n x = T.pack (printf ("%" ++ show n ++ "s") x)
format x = T.pack (show (x ^. coffbeg)) <> "\t" <> T.pack (show (x ^. coffend)) <> "\t" <> formatstr 20 (x ^. text) <> "\t" <> x ^. timex

  
main :: IO ()
main = do
    args <- getArgs
    let fp = args !! 0
    txt <- TIO.readFile fp
    clspath <- getEnv "CLASSPATH"
    J.withJVM [ B.pack ("-Djava.class.path=" ++ clspath) ] $ do
      pp <- prepare
      r <- annotateTime pp txt "2017-04-17"
      TIO.putStrLn r
      case A.parseOnly (many (timetag <* A.skipSpace)) r of
        Left err -> print err
        Right xs -> do 
          TIO.putStrLn txt
          putStrLn "==========================================================="
          mapM_ (TIO.putStrLn . format) xs
          putStrLn "==========================================================="
          let f ttag = ((), ttag^.coffbeg  + 1, ttag^.coffend)
              tagged = map f xs 
          let ann = (AnnotText . map (\(t,m)->(t,isJust m)) . tagText tagged) txt
              xss = lineSplitAnnot 80 ann
          flip mapM_ xss $ \xs -> mapM_ cutePrintAnnot xs
          {- (print . chunkEveryAt 80 . markPosition .  unAnnotText) ann 
          mapM_ cutePrintAnnot (lineSplitAnnot 80 ann) -}
          
    
