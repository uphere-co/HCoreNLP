{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.SentenceFragment (SentenceFragment(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data SentenceFragment = SentenceFragment{tokenIndex :: !(P'.Seq P'.Word32), root :: !(P'.Maybe P'.Word32),
                                         assumedTruth :: !(P'.Maybe P'.Bool), score :: !(P'.Maybe P'.Double)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable SentenceFragment where
  mergeAppend (SentenceFragment x'1 x'2 x'3 x'4) (SentenceFragment y'1 y'2 y'3 y'4)
   = SentenceFragment (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default SentenceFragment where
  defaultValue = SentenceFragment P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire SentenceFragment where
  wireSize ft' self'@(SentenceFragment x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 13 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 8 x'3 + P'.wireSizeOpt 1 1 x'4)
  wirePut ft' self'@(SentenceFragment x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 8 13 x'1
             P'.wirePutOpt 16 13 x'2
             P'.wirePutOpt 24 8 x'3
             P'.wirePutOpt 33 1 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenIndex = P'.append (tokenIndex old'Self) new'Field}) (P'.wireGet 13)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenIndex = P'.mergeAppend (tokenIndex old'Self) new'Field})
                    (P'.wireGetPacked 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{root = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{assumedTruth = Prelude'.Just new'Field}) (P'.wireGet 8)
             33 -> Prelude'.fmap (\ !new'Field -> old'Self{score = Prelude'.Just new'Field}) (P'.wireGet 1)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SentenceFragment) SentenceFragment where
  getVal m' f' = f' m'

instance P'.GPB SentenceFragment

instance P'.ReflectDescriptor SentenceFragment where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 10, 16, 24, 33])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.SentenceFragment\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"SentenceFragment\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"SentenceFragment.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.SentenceFragment.tokenIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"SentenceFragment\"], baseName' = FName \"tokenIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Just (WireTag {getWireTag = 8},WireTag {getWireTag = 10}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.SentenceFragment.root\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"SentenceFragment\"], baseName' = FName \"root\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.SentenceFragment.assumedTruth\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"SentenceFragment\"], baseName' = FName \"assumedTruth\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.SentenceFragment.score\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"SentenceFragment\"], baseName' = FName \"score\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType SentenceFragment where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SentenceFragment where
  textPut msg
   = do
       P'.tellT "tokenIndex" (tokenIndex msg)
       P'.tellT "root" (root msg)
       P'.tellT "assumedTruth" (assumedTruth msg)
       P'.tellT "score" (score msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'tokenIndex, parse'root, parse'assumedTruth, parse'score]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'tokenIndex
         = P'.try
            (do
               v <- P'.getT "tokenIndex"
               Prelude'.return (\ o -> o{tokenIndex = P'.append (tokenIndex o) v}))
        parse'root
         = P'.try
            (do
               v <- P'.getT "root"
               Prelude'.return (\ o -> o{root = v}))
        parse'assumedTruth
         = P'.try
            (do
               v <- P'.getT "assumedTruth"
               Prelude'.return (\ o -> o{assumedTruth = v}))
        parse'score
         = P'.try
            (do
               v <- P'.getT "score"
               Prelude'.return (\ o -> o{score = v}))