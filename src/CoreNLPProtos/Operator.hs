{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Operator
       (Operator(..), name, quantifierSpanBegin, quantifierSpanEnd, subjectSpanBegin, subjectSpanEnd, objectSpanBegin,
        objectSpanEnd)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Operator = Operator{_name :: !(P'.Utf8), _quantifierSpanBegin :: !(P'.Int32), _quantifierSpanEnd :: !(P'.Int32),
                         _subjectSpanBegin :: !(P'.Int32), _subjectSpanEnd :: !(P'.Int32), _objectSpanBegin :: !(P'.Int32),
                         _objectSpanEnd :: !(P'.Int32)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Operator

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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_quantifierSpanBegin = new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_quantifierSpanEnd = new'Field}) (P'.wireGet 5)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_subjectSpanBegin = new'Field}) (P'.wireGet 5)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_subjectSpanEnd = new'Field}) (P'.wireGet 5)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_objectSpanBegin = new'Field}) (P'.wireGet 5)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_objectSpanEnd = new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Operator) Operator where
  getVal m' f' = f' m'

instance P'.GPB Operator

instance P'.ReflectDescriptor Operator where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16, 24, 32, 40, 48, 56]) (P'.fromDistinctAscList [10, 16, 24, 32, 40, 48, 56])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Operator\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Operator\"}, descFilePath = [\"CoreNLPProtos\",\"Operator.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.name\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.quantifierSpanBegin\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"quantifierSpanBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.quantifierSpanEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"quantifierSpanEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.subjectSpanBegin\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"subjectSpanBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.subjectSpanEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"subjectSpanEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.objectSpanBegin\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"objectSpanBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Operator.objectSpanEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Operator\"], baseName' = FName \"objectSpanEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Operator where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Operator where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
       P'.tellT "quantifierSpanBegin" (_quantifierSpanBegin msg)
       P'.tellT "quantifierSpanEnd" (_quantifierSpanEnd msg)
       P'.tellT "subjectSpanBegin" (_subjectSpanBegin msg)
       P'.tellT "subjectSpanEnd" (_subjectSpanEnd msg)
       P'.tellT "objectSpanBegin" (_objectSpanBegin msg)
       P'.tellT "objectSpanEnd" (_objectSpanEnd msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_name, parse'_quantifierSpanBegin, parse'_quantifierSpanEnd, parse'_subjectSpanBegin,
                   parse'_subjectSpanEnd, parse'_objectSpanBegin, parse'_objectSpanEnd])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_quantifierSpanBegin
         = P'.try
            (do
               v <- P'.getT "quantifierSpanBegin"
               Prelude'.return (\ o -> o{_quantifierSpanBegin = v}))
        parse'_quantifierSpanEnd
         = P'.try
            (do
               v <- P'.getT "quantifierSpanEnd"
               Prelude'.return (\ o -> o{_quantifierSpanEnd = v}))
        parse'_subjectSpanBegin
         = P'.try
            (do
               v <- P'.getT "subjectSpanBegin"
               Prelude'.return (\ o -> o{_subjectSpanBegin = v}))
        parse'_subjectSpanEnd
         = P'.try
            (do
               v <- P'.getT "subjectSpanEnd"
               Prelude'.return (\ o -> o{_subjectSpanEnd = v}))
        parse'_objectSpanBegin
         = P'.try
            (do
               v <- P'.getT "objectSpanBegin"
               Prelude'.return (\ o -> o{_objectSpanBegin = v}))
        parse'_objectSpanEnd
         = P'.try
            (do
               v <- P'.getT "objectSpanEnd"
               Prelude'.return (\ o -> o{_objectSpanEnd = v}))