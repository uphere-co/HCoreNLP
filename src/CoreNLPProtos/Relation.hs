{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Relation (Relation(..), argName, arg, signature, objectID, extentStart, extentEnd, type', subtype) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLPProtos.Entity as CoreNLPProtos (Entity)

data Relation = Relation{_argName :: !(P'.Seq P'.Utf8), _arg :: !(P'.Seq CoreNLPProtos.Entity), _signature :: !(P'.Maybe P'.Utf8),
                         _objectID :: !(P'.Maybe P'.Utf8), _extentStart :: !(P'.Maybe P'.Word32),
                         _extentEnd :: !(P'.Maybe P'.Word32), _type' :: !(P'.Maybe P'.Utf8), _subtype :: !(P'.Maybe P'.Utf8)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Relation

instance P'.Mergeable Relation where
  mergeAppend (Relation x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8) (Relation y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8)
   = Relation (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)

instance P'.Default Relation where
  defaultValue
   = Relation P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue

instance P'.Wire Relation where
  wireSize ft' self'@(Relation x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeRep 1 9 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 9 x'7
             + P'.wireSizeOpt 1 9 x'8)
  wirePut ft' self'@(Relation x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'4
             P'.wirePutOpt 16 13 x'5
             P'.wirePutOpt 24 13 x'6
             P'.wirePutOpt 34 9 x'7
             P'.wirePutOpt 42 9 x'8
             P'.wirePutRep 50 9 x'1
             P'.wirePutRep 58 11 x'2
             P'.wirePutOpt 66 9 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_argName = P'.append (_argName old'Self) new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_arg = P'.append (_arg old'Self) new'Field}) (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_signature = Prelude'.Just new'Field}) (P'.wireGet 9)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_objectID = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_extentStart = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_extentEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_subtype = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Relation) Relation where
  getVal m' f' = f' m'

instance P'.GPB Relation

instance P'.ReflectDescriptor Relation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 34, 42, 50, 58, 66])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Relation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Relation\"}, descFilePath = [\"CoreNLPProtos\",\"Relation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.argName\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"argName\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.arg\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"arg\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Entity\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Entity\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.signature\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"signature\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.objectID\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"objectID\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.extentStart\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"extentStart\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.extentEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"extentEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.type\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.subtype\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"subtype\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Relation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Relation where
  textPut msg
   = do
       P'.tellT "argName" (_argName msg)
       P'.tellT "arg" (_arg msg)
       P'.tellT "signature" (_signature msg)
       P'.tellT "objectID" (_objectID msg)
       P'.tellT "extentStart" (_extentStart msg)
       P'.tellT "extentEnd" (_extentEnd msg)
       P'.tellT "type" (_type' msg)
       P'.tellT "subtype" (_subtype msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_argName, parse'_arg, parse'_signature, parse'_objectID, parse'_extentStart, parse'_extentEnd,
                   parse'_type', parse'_subtype])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_argName
         = P'.try
            (do
               v <- P'.getT "argName"
               Prelude'.return (\ o -> o{_argName = P'.append (_argName o) v}))
        parse'_arg
         = P'.try
            (do
               v <- P'.getT "arg"
               Prelude'.return (\ o -> o{_arg = P'.append (_arg o) v}))
        parse'_signature
         = P'.try
            (do
               v <- P'.getT "signature"
               Prelude'.return (\ o -> o{_signature = v}))
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