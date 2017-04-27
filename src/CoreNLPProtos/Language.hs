{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Language (Language(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Language = Unknown
              | Any
              | Arabic
              | Chinese
              | English
              | German
              | French
              | Hebrew
              | Spanish
              | UniversalEnglish
              | UniversalChinese
              deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Language

instance Prelude'.Bounded Language where
  minBound = Unknown
  maxBound = UniversalChinese

instance P'.Default Language where
  defaultValue = Unknown

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Language
toMaybe'Enum 0 = Prelude'.Just Unknown
toMaybe'Enum 1 = Prelude'.Just Any
toMaybe'Enum 2 = Prelude'.Just Arabic
toMaybe'Enum 3 = Prelude'.Just Chinese
toMaybe'Enum 4 = Prelude'.Just English
toMaybe'Enum 5 = Prelude'.Just German
toMaybe'Enum 6 = Prelude'.Just French
toMaybe'Enum 7 = Prelude'.Just Hebrew
toMaybe'Enum 8 = Prelude'.Just Spanish
toMaybe'Enum 9 = Prelude'.Just UniversalEnglish
toMaybe'Enum 10 = Prelude'.Just UniversalChinese
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Language where
  fromEnum Unknown = 0
  fromEnum Any = 1
  fromEnum Arabic = 2
  fromEnum Chinese = 3
  fromEnum English = 4
  fromEnum German = 5
  fromEnum French = 6
  fromEnum Hebrew = 7
  fromEnum Spanish = 8
  fromEnum UniversalEnglish = 9
  fromEnum UniversalChinese = 10
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type CoreNLPProtos.Language") . toMaybe'Enum
  succ Unknown = Any
  succ Any = Arabic
  succ Arabic = Chinese
  succ Chinese = English
  succ English = German
  succ German = French
  succ French = Hebrew
  succ Hebrew = Spanish
  succ Spanish = UniversalEnglish
  succ UniversalEnglish = UniversalChinese
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type CoreNLPProtos.Language"
  pred Any = Unknown
  pred Arabic = Any
  pred Chinese = Arabic
  pred English = Chinese
  pred German = English
  pred French = German
  pred Hebrew = French
  pred Spanish = Hebrew
  pred UniversalEnglish = Spanish
  pred UniversalChinese = UniversalEnglish
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type CoreNLPProtos.Language"

instance P'.Wire Language where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Language

instance P'.MessageAPI msg' (msg' -> Language) Language where
  getVal m' f' = f' m'

instance P'.ReflectEnum Language where
  reflectEnum
   = [(0, "Unknown", Unknown), (1, "Any", Any), (2, "Arabic", Arabic), (3, "Chinese", Chinese), (4, "English", English),
      (5, "German", German), (6, "French", French), (7, "Hebrew", Hebrew), (8, "Spanish", Spanish),
      (9, "UniversalEnglish", UniversalEnglish), (10, "UniversalChinese", UniversalChinese)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".edu.stanford.nlp.pipeline.Language") [] ["CoreNLPProtos"] "Language")
      ["CoreNLPProtos", "Language.hs"]
      [(0, "Unknown"), (1, "Any"), (2, "Arabic"), (3, "Chinese"), (4, "English"), (5, "German"), (6, "French"), (7, "Hebrew"),
       (8, "Spanish"), (9, "UniversalEnglish"), (10, "UniversalChinese")]

instance P'.TextType Language where
  tellT = P'.tellShow
  getT = P'.getRead