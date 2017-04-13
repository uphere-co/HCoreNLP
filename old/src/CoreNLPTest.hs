{-# LANGUAGE MagicHash #-}
{-# LANGUAGE ScopedTypeVariables #-}

import Java

data {-# CLASS "edu.stanford.nlp.simple.Document" #-} Document =
  Document (Object# Document)
  deriving Class

data {-# CLASS "edu.stanford.nlp.simple.Sentence" #-} Sentence =
  Sentence (Object# Sentence)
  deriving Class
  
foreign import java unsafe "@new" newDocument :: String -> Java c Document

foreign import java unsafe sentences :: Java Document (List Sentence)

main :: IO ()
main = do
  putStrLn "hello"
  java $ do
    doc <- newDocument "add your text here! It can contain multiple sentences."
    ss :: [Sentence] <- fromJava <$> doc <.> sentences
    io $ print (length ss)
    return ()
  
  
