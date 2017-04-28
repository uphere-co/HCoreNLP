{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Operator (Operator(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Operator = Operator{name :: !(P'.Utf8), quantifierSpanBegin :: !(P'.Int32), quantifierSpanEnd :: !(P'.Int32),
                         subjectSpanBegin :: !(P'.Int32), subjectSpanEnd :: !(P'.Int32), objectSpanBegin :: !(P'.Int32),
                         objectSpanEnd :: !(P'.Int32)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Operator where
  mergeAppend (Operator x'1 x'2 x'3 x'4 x'5 x'6 x'7) (Operator y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = Operator (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default Operator where
  defaultValue
   = Operator P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Operator where
  wireSize ft' self'@(Operator x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 5 x'2 + P'.wireSizeReq 1 5 x'3 + P'.wireSizeReq 1 5 x'4 +
             P'.wireSizeReq 1 5 x'5
             + P'.wireSizeReq 1 5 x'6
             + P'.wireSizeReq 1 5 x'7)
  wirePut ft' self'@(Operator x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 9 x'1
             P'.wirePutReq 16 5 x'2
             P'.wirePutReq 24 5 x'3
             P'.wirePutReq 32 5 x'4
             P'.wirePutReq 40 5 x'5
             P'.wirePutReq 48 5 x'6
             P'.wirePutReq 56 5 x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{name = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{quantifierSpanBegin = new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{quantifierSpanEnd = new'Field}) (P'.wireGet 5)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{subjectSpanBegin = new'Field}) (P'.wireGet 5)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{subjectSpanEnd = new'Field}) (P'.wireGet 5)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{objectSpanBegin = new'Field}) (P'.wireGet 5)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{objectSpanEnd = new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Operator) Operator where
  getVal m' f' = f' m'

instance P'.GPB Operator

instance P'.ReflectDescriptor Operator where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16, 24, 32, 40, 48, 56]) (P'.fromDistinctAscList [10, 16, 24, 32, 40, 48, 56])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Operator\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Operator\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Operator.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.name\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"name\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.quantifierSpanBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"quantifierSpanBegin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.quantifierSpanEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"quantifierSpanEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.subjectSpanBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"subjectSpanBegin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.subjectSpanEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"subjectSpanEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.objectSpanBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"objectSpanBegin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.objectSpanEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"objectSpanEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Operator where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Operator where
  textPut msg
   = do
       P'.tellT "name" (name msg)
       P'.tellT "quantifierSpanBegin" (quantifierSpanBegin msg)
       P'.tellT "quantifierSpanEnd" (quantifierSpanEnd msg)
       P'.tellT "subjectSpanBegin" (subjectSpanBegin msg)
       P'.tellT "subjectSpanEnd" (subjectSpanEnd msg)
       P'.tellT "objectSpanBegin" (objectSpanBegin msg)
       P'.tellT "objectSpanEnd" (objectSpanEnd msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'name, parse'quantifierSpanBegin, parse'quantifierSpanEnd, parse'subjectSpanBegin, parse'subjectSpanEnd,
                   parse'objectSpanBegin, parse'objectSpanEnd])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{name = v}))
        parse'quantifierSpanBegin
         = P'.try
            (do
               v <- P'.getT "quantifierSpanBegin"
               Prelude'.return (\ o -> o{quantifierSpanBegin = v}))
        parse'quantifierSpanEnd
         = P'.try
            (do
               v <- P'.getT "quantifierSpanEnd"
               Prelude'.return (\ o -> o{quantifierSpanEnd = v}))
        parse'subjectSpanBegin
         = P'.try
            (do
               v <- P'.getT "subjectSpanBegin"
               Prelude'.return (\ o -> o{subjectSpanBegin = v}))
        parse'subjectSpanEnd
         = P'.try
            (do
               v <- P'.getT "subjectSpanEnd"
               Prelude'.return (\ o -> o{subjectSpanEnd = v}))
        parse'objectSpanBegin
         = P'.try
            (do
               v <- P'.getT "objectSpanBegin"
               Prelude'.return (\ o -> o{objectSpanBegin = v}))
        parse'objectSpanEnd
         = P'.try
            (do
               v <- P'.getT "objectSpanEnd"
               Prelude'.return (\ o -> o{objectSpanEnd = v}))