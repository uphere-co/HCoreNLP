{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Control.Lens
import           Control.Monad                    ((>=>),join)
import           Control.Monad.IO.Class           (liftIO)
import           Control.Monad.Loops              (whileJust_)
import           Control.Monad.Trans.Class        (lift)
import           Data.Aeson
import           Data.Aeson.Types
import qualified Data.Attoparsec.Text       as A
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import           Data.Text                        (Text)
import qualified Data.Text                  as T
import qualified Data.Text.IO               as TIO
import           GHC.Generics
-- import           Language.Java         as J
import           System.Console.Haskeline
import           System.Environment               (getEnv)
--
import           NLP.SyntaxTree.Parser
import           NLP.SyntaxTree.Printer
--
import           CoreNLP
import           CoreNLP.Type

-- this is an orphan instance of MonadException for CoreNLP to be used as a base monad
-- for System.Console.Haskeline.InputT. I didn't put this instance into CoreNLP module
-- since I do not want to pollute the dependency list of HCoreNLP package for some time.
instance MonadException CoreNLP where
  controlIO f = let runio = RunIO (\m -> unCoreNLP m >>= \x -> return (CoreNLP (pure x)))
                in join (CoreNLP (f runio))


main :: IO ()
main = do
    clspath <- getEnv "CLASSPATH"
    runCoreNLP [ B.pack ("-Djava.class.path=" ++ clspath) ] $ 
      runInputT defaultSettings $ do 
        (props,pipeline) <- lift $ initProps >>= \props -> newPipeline props >>= \pipeline -> return (props,pipeline)
        liftIO $ putStrLn "==========================="
        whileJust_  (getInputLine "% ") $ \input -> do
          r <- lift $ do
                    r <- runAnnotator props pipeline (T.pack input)
                    (return . eitherDecode . BL.fromStrict) r
          case r :: Either String CoreNLPResult of
            Left err -> liftIO $ putStrLn err
            Right v -> do
              flip mapM_ (map (view CoreNLP.Type.parse) (v ^. sentences)) $ \txt -> do
                case A.parseOnly penntree txt of
                  Left err -> liftIO $ putStrLn err
                  Right t -> do
                    liftIO $ TIO.putStrLn (pennTreePrint 0 t)
            



