{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Entity
       (Entity(..), headStart, headEnd, mentionType, normalizedName, headTokenIndex, corefID, objectID, extentStart, extentEnd,
        type', subtype)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Entity = Entity{_headStart :: !(P'.Maybe P'.Word32), _headEnd :: !(P'.Maybe P'.Word32), _mentionType :: !(P'.Maybe P'.Utf8),
                     _normalizedName :: !(P'.Maybe P'.Utf8), _headTokenIndex :: !(P'.Maybe P'.Word32),
                     _corefID :: !(P'.Maybe P'.Utf8), _objectID :: !(P'.Maybe P'.Utf8), _extentStart :: !(P'.Maybe P'.Word32),
                     _extentEnd :: !(P'.Maybe P'.Word32), _type' :: !(P'.Maybe P'.Utf8), _subtype :: !(P'.Maybe P'.Utf8)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Entity

instance P'.Mergeable Entity where
  mergeAppend (Entity x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11) (Entity y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11)
   = Entity (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)

instance P'.Default Entity where
  defaultValue
   = Entity P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Entity where
  wireSize ft' self'@(Entity x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeOpt 1 9 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 13 x'9
             + P'.wireSizeOpt 1 9 x'10
             + P'.wireSizeOpt 1 9 x'11)
  wirePut ft' self'@(Entity x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'7
             P'.wirePutOpt 16 13 x'8
             P'.wirePutOpt 24 13 x'9
             P'.wirePutOpt 34 9 x'10
             P'.wirePutOpt 42 9 x'11
             P'.wirePutOpt 48 13 x'1
             P'.wirePutOpt 56 13 x'2
             P'.wirePutOpt 66 9 x'3
             P'.wirePutOpt 74 9 x'4
             P'.wirePutOpt 80 13 x'5
             P'.wirePutOpt 90 9 x'6
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_headStart = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_headEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_mentionType = Prelude'.Just new'Field}) (P'.wireGet 9)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_normalizedName = Prelude'.Just new'Field}) (P'.wireGet 9)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_headTokenIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{_corefID = Prelude'.Just new'Field}) (P'.wireGet 9)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_objectID = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_extentStart = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_extentEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_subtype = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Entity) Entity where
  getVal m' f' = f' m'

instance P'.GPB Entity

instance P'.ReflectDescriptor Entity where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 34, 42, 48, 56, 66, 74, 80, 90])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Entity\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Entity\"}, descFilePath = [\"CoreNLPProtos\",\"Entity.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.headStart\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"headStart\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.headEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"headEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.mentionType\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"mentionType\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.normalizedName\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"normalizedName\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.headTokenIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"headTokenIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.corefID\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"corefID\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.objectID\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"objectID\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.extentStart\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"extentStart\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.extentEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"extentEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.type\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.subtype\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"subtype\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Entity where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Entity where
  textPut msg
   = do
       P'.tellT "headStart" (_headStart msg)
       P'.tellT "headEnd" (_headEnd msg)
       P'.tellT "mentionType" (_mentionType msg)
       P'.tellT "normalizedName" (_normalizedName msg)
       P'.tellT "headTokenIndex" (_headTokenIndex msg)
       P'.tellT "corefID" (_corefID msg)
       P'.tellT "objectID" (_objectID msg)
       P'.tellT "extentStart" (_extentStart msg)
       P'.tellT "extentEnd" (_extentEnd msg)
       P'.tellT "type" (_type' msg)
       P'.tellT "subtype" (_subtype msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_headStart, parse'_headEnd, parse'_mentionType, parse'_normalizedName, parse'_headTokenIndex,
                   parse'_corefID, parse'_objectID, parse'_extentStart, parse'_extentEnd, parse'_type', parse'_subtype])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_headStart
         = P'.try
            (do
               v <- P'.getT "headStart"
               Prelude'.return (\ o -> o{_headStart = v}))
        parse'_headEnd
         = P'.try
            (do
               v <- P'.getT "headEnd"
               Prelude'.return (\ o -> o{_headEnd = v}))
        parse'_mentionType
         = P'.try
            (do
               v <- P'.getT "mentionType"
               Prelude'.return (\ o -> o{_mentionType = v}))
        parse'_normalizedName
         = P'.try
            (do
               v <- P'.getT "normalizedName"
               Prelude'.return (\ o -> o{_normalizedName = v}))
        parse'_headTokenIndex
         = P'.try
            (do
               v <- P'.getT "headTokenIndex"
               Prelude'.return (\ o -> o{_headTokenIndex = v}))
        parse'_corefID
         = P'.try
            (do
               v <- P'.getT "corefID"
               Prelude'.return (\ o -> o{_corefID = v}))
        parse'_objectID
         = P'.try
            (do
               v <- P'.getT "objectID"
               Prelude'.return (\ o -> o{_objectID = v}))
        parse'_extentStart
         = P'.try
            (do
               v <- P'.getT "extentStart"
               Prelude'.return (\ o -> o{_extentStart = v}))
        parse'_extentEnd
         = P'.try
            (do
               v <- P'.getT "extentEnd"
               Prelude'.return (\ o -> o{_extentEnd = v}))
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_subtype
         = P'.try
            (do
               v <- P'.getT "subtype"
               Prelude'.return (\ o -> o{_subtype = v}))