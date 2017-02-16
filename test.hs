{-# LANGUAGE MagicHash #-}

import Java

data {-# CLASS "edu.stanford.nlp.simple.Document" #-} Document =
  Document (Object# Document)
  deriving Class

foreign import java unsafe "@new" newDocument :: Java c Document

main :: IO ()
main = do
  putStrLn "hello"
  java $ do
    doc <- newDocument
    return ()
  
  
