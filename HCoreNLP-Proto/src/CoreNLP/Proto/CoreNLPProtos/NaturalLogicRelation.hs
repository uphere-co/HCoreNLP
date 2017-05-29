{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.NaturalLogicRelation (NaturalLogicRelation(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data NaturalLogicRelation = EQUIVALENCE
                          | FORWARD_ENTAILMENT
                          | REVERSE_ENTAILMENT
                          | NEGATION
                          | ALTERNATION
                          | COVER
                          | INDEPENDENCE
                          deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                    Prelude'.Generic)

instance P'.Mergeable NaturalLogicRelation

instance Prelude'.Bounded NaturalLogicRelation where
  minBound = EQUIVALENCE
  maxBound = INDEPENDENCE

instance P'.Default NaturalLogicRelation where
  defaultValue = EQUIVALENCE

toMaybe'Enum :: Prelude'.Int -> P'.Maybe NaturalLogicRelation
toMaybe'Enum 0 = Prelude'.Just EQUIVALENCE
toMaybe'Enum 1 = Prelude'.Just FORWARD_ENTAILMENT
toMaybe'Enum 2 = Prelude'.Just REVERSE_ENTAILMENT
toMaybe'Enum 3 = Prelude'.Just NEGATION
toMaybe'Enum 4 = Prelude'.Just ALTERNATION
toMaybe'Enum 5 = Prelude'.Just COVER
toMaybe'Enum 6 = Prelude'.Just INDEPENDENCE
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum NaturalLogicRelation where
  fromEnum EQUIVALENCE = 0
  fromEnum FORWARD_ENTAILMENT = 1
  fromEnum REVERSE_ENTAILMENT = 2
  fromEnum NEGATION = 3
  fromEnum ALTERNATION = 4
  fromEnum COVER = 5
  fromEnum INDEPENDENCE = 6
  toEnum
   = P'.fromMaybe
      (Prelude'.error "hprotoc generated code: toEnum failure for type CoreNLP.Proto.CoreNLPProtos.NaturalLogicRelation")
      . toMaybe'Enum
  succ EQUIVALENCE = FORWARD_ENTAILMENT
  succ FORWARD_ENTAILMENT = REVERSE_ENTAILMENT
  succ REVERSE_ENTAILMENT = NEGATION
  succ NEGATION = ALTERNATION
  succ ALTERNATION = COVER
  succ COVER = INDEPENDENCE
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type CoreNLP.Proto.CoreNLPProtos.NaturalLogicRelation"
  pred FORWARD_ENTAILMENT = EQUIVALENCE
  pred REVERSE_ENTAILMENT = FORWARD_ENTAILMENT
  pred NEGATION = REVERSE_ENTAILMENT
  pred ALTERNATION = NEGATION
  pred COVER = ALTERNATION
  pred INDEPENDENCE = COVER
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type CoreNLP.Proto.CoreNLPProtos.NaturalLogicRelation"

instance P'.Wire NaturalLogicRelation where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB NaturalLogicRelation

instance P'.MessageAPI msg' (msg' -> NaturalLogicRelation) NaturalLogicRelation where
  getVal m' f' = f' m'

instance P'.ReflectEnum NaturalLogicRelation where
  reflectEnum
   = [(0, "EQUIVALENCE", EQUIVALENCE), (1, "FORWARD_ENTAILMENT", FORWARD_ENTAILMENT), (2, "REVERSE_ENTAILMENT", REVERSE_ENTAILMENT),
      (3, "NEGATION", NEGATION), (4, "ALTERNATION", ALTERNATION), (5, "COVER", COVER), (6, "INDEPENDENCE", INDEPENDENCE)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".edu.stanford.nlp.pipeline.NaturalLogicRelation") ["CoreNLP", "Proto"] ["CoreNLPProtos"]
        "NaturalLogicRelation")
      ["CoreNLP", "Proto", "CoreNLPProtos", "NaturalLogicRelation.hs"]
      [(0, "EQUIVALENCE"), (1, "FORWARD_ENTAILMENT"), (2, "REVERSE_ENTAILMENT"), (3, "NEGATION"), (4, "ALTERNATION"), (5, "COVER"),
       (6, "INDEPENDENCE")]

instance P'.TextType NaturalLogicRelation where
  tellT = P'.tellShow
  getT = P'.getRead