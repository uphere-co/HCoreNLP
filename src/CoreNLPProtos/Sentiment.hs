{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Sentiment (Sentiment(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Sentiment = STRONG_NEGATIVE
               | WEAK_NEGATIVE
               | NEUTRAL
               | WEAK_POSITIVE
               | STRONG_POSITIVE
               deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                         Prelude'.Generic)

instance P'.Mergeable Sentiment

instance Prelude'.Bounded Sentiment where
  minBound = STRONG_NEGATIVE
  maxBound = STRONG_POSITIVE

instance P'.Default Sentiment where
  defaultValue = STRONG_NEGATIVE

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Sentiment
toMaybe'Enum 0 = Prelude'.Just STRONG_NEGATIVE
toMaybe'Enum 1 = Prelude'.Just WEAK_NEGATIVE
toMaybe'Enum 2 = Prelude'.Just NEUTRAL
toMaybe'Enum 3 = Prelude'.Just WEAK_POSITIVE
toMaybe'Enum 4 = Prelude'.Just STRONG_POSITIVE
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Sentiment where
  fromEnum STRONG_NEGATIVE = 0
  fromEnum WEAK_NEGATIVE = 1
  fromEnum NEUTRAL = 2
  fromEnum WEAK_POSITIVE = 3
  fromEnum STRONG_POSITIVE = 4
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type CoreNLPProtos.Sentiment") . toMaybe'Enum
  succ STRONG_NEGATIVE = WEAK_NEGATIVE
  succ WEAK_NEGATIVE = NEUTRAL
  succ NEUTRAL = WEAK_POSITIVE
  succ WEAK_POSITIVE = STRONG_POSITIVE
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type CoreNLPProtos.Sentiment"
  pred WEAK_NEGATIVE = STRONG_NEGATIVE
  pred NEUTRAL = WEAK_NEGATIVE
  pred WEAK_POSITIVE = NEUTRAL
  pred STRONG_POSITIVE = WEAK_POSITIVE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type CoreNLPProtos.Sentiment"

instance P'.Wire Sentiment where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Sentiment

instance P'.MessageAPI msg' (msg' -> Sentiment) Sentiment where
  getVal m' f' = f' m'

instance P'.ReflectEnum Sentiment where
  reflectEnum
   = [(0, "STRONG_NEGATIVE", STRONG_NEGATIVE), (1, "WEAK_NEGATIVE", WEAK_NEGATIVE), (2, "NEUTRAL", NEUTRAL),
      (3, "WEAK_POSITIVE", WEAK_POSITIVE), (4, "STRONG_POSITIVE", STRONG_POSITIVE)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".edu.stanford.nlp.pipeline.Sentiment") [] ["CoreNLPProtos"] "Sentiment")
      ["CoreNLPProtos", "Sentiment.hs"]
      [(0, "STRONG_NEGATIVE"), (1, "WEAK_NEGATIVE"), (2, "NEUTRAL"), (3, "WEAK_POSITIVE"), (4, "STRONG_POSITIVE")]

instance P'.TextType Sentiment where
  tellT = P'.tellShow
  getT = P'.getRead