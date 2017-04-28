{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Entity (Entity(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Entity = Entity{headStart :: !(P'.Maybe P'.Word32), headEnd :: !(P'.Maybe P'.Word32), mentionType :: !(P'.Maybe P'.Utf8),
                     normalizedName :: !(P'.Maybe P'.Utf8), headTokenIndex :: !(P'.Maybe P'.Word32), corefID :: !(P'.Maybe P'.Utf8),
                     objectID :: !(P'.Maybe P'.Utf8), extentStart :: !(P'.Maybe P'.Word32), extentEnd :: !(P'.Maybe P'.Word32),
                     type' :: !(P'.Maybe P'.Utf8), subtype :: !(P'.Maybe P'.Utf8)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

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
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{headStart = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{headEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{mentionType = Prelude'.Just new'Field}) (P'.wireGet 9)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{normalizedName = Prelude'.Just new'Field}) (P'.wireGet 9)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{headTokenIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{corefID = Prelude'.Just new'Field}) (P'.wireGet 9)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{objectID = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{extentStart = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{extentEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{subtype = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Entity) Entity where
  getVal m' f' = f' m'

instance P'.GPB Entity

instance P'.ReflectDescriptor Entity where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 34, 42, 48, 56, 66, 74, 80, 90])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Entity\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Entity\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Entity.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.headStart\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"headStart\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.headEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"headEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.mentionType\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"mentionType\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.normalizedName\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"normalizedName\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.headTokenIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"headTokenIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.corefID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"corefID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.objectID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"objectID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.extentStart\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"extentStart\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.extentEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"extentEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.type\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Entity.subtype\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Entity\"], baseName' = FName \"subtype\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Entity where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Entity where
  textPut msg
   = do
       P'.tellT "headStart" (headStart msg)
       P'.tellT "headEnd" (headEnd msg)
       P'.tellT "mentionType" (mentionType msg)
       P'.tellT "normalizedName" (normalizedName msg)
       P'.tellT "headTokenIndex" (headTokenIndex msg)
       P'.tellT "corefID" (corefID msg)
       P'.tellT "objectID" (objectID msg)
       P'.tellT "extentStart" (extentStart msg)
       P'.tellT "extentEnd" (extentEnd msg)
       P'.tellT "type" (type' msg)
       P'.tellT "subtype" (subtype msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'headStart, parse'headEnd, parse'mentionType, parse'normalizedName, parse'headTokenIndex, parse'corefID,
                   parse'objectID, parse'extentStart, parse'extentEnd, parse'type', parse'subtype])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'headStart
         = P'.try
            (do
               v <- P'.getT "headStart"
               Prelude'.return (\ o -> o{headStart = v}))
        parse'headEnd
         = P'.try
            (do
               v <- P'.getT "headEnd"
               Prelude'.return (\ o -> o{headEnd = v}))
        parse'mentionType
         = P'.try
            (do
               v <- P'.getT "mentionType"
               Prelude'.return (\ o -> o{mentionType = v}))
        parse'normalizedName
         = P'.try
            (do
               v <- P'.getT "normalizedName"
               Prelude'.return (\ o -> o{normalizedName = v}))
        parse'headTokenIndex
         = P'.try
            (do
               v <- P'.getT "headTokenIndex"
               Prelude'.return (\ o -> o{headTokenIndex = v}))
        parse'corefID
         = P'.try
            (do
               v <- P'.getT "corefID"
               Prelude'.return (\ o -> o{corefID = v}))
        parse'objectID
         = P'.try
            (do
               v <- P'.getT "objectID"
               Prelude'.return (\ o -> o{objectID = v}))
        parse'extentStart
         = P'.try
            (do
               v <- P'.getT "extentStart"
               Prelude'.return (\ o -> o{extentStart = v}))
        parse'extentEnd
         = P'.try
            (do
               v <- P'.getT "extentEnd"
               Prelude'.return (\ o -> o{extentEnd = v}))
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'subtype
         = P'.try
            (do
               v <- P'.getT "subtype"
               Prelude'.return (\ o -> o{subtype = v}))