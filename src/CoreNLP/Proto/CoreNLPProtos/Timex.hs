{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Timex (Timex(..), value, altValue, text, type', tid, beginPoint, endPoint) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Timex = Timex{_value :: !(P'.Maybe P'.Utf8), _altValue :: !(P'.Maybe P'.Utf8), _text :: !(P'.Maybe P'.Utf8),
                   _type' :: !(P'.Maybe P'.Utf8), _tid :: !(P'.Maybe P'.Utf8), _beginPoint :: !(P'.Maybe P'.Word32),
                   _endPoint :: !(P'.Maybe P'.Word32)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Timex

instance P'.Mergeable Timex where
  mergeAppend (Timex x'1 x'2 x'3 x'4 x'5 x'6 x'7) (Timex y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = Timex (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default Timex where
  defaultValue
   = Timex P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Timex where
  wireSize ft' self'@(Timex x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 13 x'7)
  wirePut ft' self'@(Timex x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'1
             P'.wirePutOpt 18 9 x'2
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 34 9 x'4
             P'.wirePutOpt 42 9 x'5
             P'.wirePutOpt 48 13 x'6
             P'.wirePutOpt 56 13 x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_value = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_altValue = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_text = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_tid = Prelude'.Just new'Field}) (P'.wireGet 9)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_beginPoint = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_endPoint = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Timex) Timex where
  getVal m' f' = f' m'

instance P'.GPB Timex

instance P'.ReflectDescriptor Timex where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 34, 42, 48, 56])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Timex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Timex\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Timex.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Timex.value\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Timex\"], baseName' = FName \"value\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Timex.altValue\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Timex\"], baseName' = FName \"altValue\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Timex.text\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Timex\"], baseName' = FName \"text\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Timex.type\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Timex\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Timex.tid\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Timex\"], baseName' = FName \"tid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Timex.beginPoint\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Timex\"], baseName' = FName \"beginPoint\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Timex.endPoint\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Timex\"], baseName' = FName \"endPoint\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Timex where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Timex where
  textPut msg
   = do
       P'.tellT "value" (_value msg)
       P'.tellT "altValue" (_altValue msg)
       P'.tellT "text" (_text msg)
       P'.tellT "type" (_type' msg)
       P'.tellT "tid" (_tid msg)
       P'.tellT "beginPoint" (_beginPoint msg)
       P'.tellT "endPoint" (_endPoint msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_value, parse'_altValue, parse'_text, parse'_type', parse'_tid, parse'_beginPoint, parse'_endPoint])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{_value = v}))
        parse'_altValue
         = P'.try
            (do
               v <- P'.getT "altValue"
               Prelude'.return (\ o -> o{_altValue = v}))
        parse'_text
         = P'.try
            (do
               v <- P'.getT "text"
               Prelude'.return (\ o -> o{_text = v}))
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_tid
         = P'.try
            (do
               v <- P'.getT "tid"
               Prelude'.return (\ o -> o{_tid = v}))
        parse'_beginPoint
         = P'.try
            (do
               v <- P'.getT "beginPoint"
               Prelude'.return (\ o -> o{_beginPoint = v}))
        parse'_endPoint
         = P'.try
            (do
               v <- P'.getT "endPoint"
               Prelude'.return (\ o -> o{_endPoint = v}))