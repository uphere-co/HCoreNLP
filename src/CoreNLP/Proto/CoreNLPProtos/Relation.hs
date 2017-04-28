{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Relation (Relation(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified CoreNLP.Proto.CoreNLPProtos.Entity as CoreNLPProtos (Entity)

data Relation = Relation{argName :: !(P'.Seq P'.Utf8), arg :: !(P'.Seq CoreNLPProtos.Entity), signature :: !(P'.Maybe P'.Utf8),
                         objectID :: !(P'.Maybe P'.Utf8), extentStart :: !(P'.Maybe P'.Word32), extentEnd :: !(P'.Maybe P'.Word32),
                         type' :: !(P'.Maybe P'.Utf8), subtype :: !(P'.Maybe P'.Utf8)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

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
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{argName = P'.append (argName old'Self) new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{arg = P'.append (arg old'Self) new'Field}) (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{signature = Prelude'.Just new'Field}) (P'.wireGet 9)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{objectID = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{extentStart = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{extentEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{subtype = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Relation) Relation where
  getVal m' f' = f' m'

instance P'.GPB Relation

instance P'.ReflectDescriptor Relation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 34, 42, 50, 58, 66])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Relation\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Relation\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Relation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.argName\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"argName\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.arg\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"arg\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Entity\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Entity\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.signature\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"signature\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.objectID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"objectID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.extentStart\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"extentStart\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.extentEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"extentEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.type\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Relation.subtype\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Relation\"], baseName' = FName \"subtype\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Relation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Relation where
  textPut msg
   = do
       P'.tellT "argName" (argName msg)
       P'.tellT "arg" (arg msg)
       P'.tellT "signature" (signature msg)
       P'.tellT "objectID" (objectID msg)
       P'.tellT "extentStart" (extentStart msg)
       P'.tellT "extentEnd" (extentEnd msg)
       P'.tellT "type" (type' msg)
       P'.tellT "subtype" (subtype msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'argName, parse'arg, parse'signature, parse'objectID, parse'extentStart, parse'extentEnd, parse'type',
                   parse'subtype])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'argName
         = P'.try
            (do
               v <- P'.getT "argName"
               Prelude'.return (\ o -> o{argName = P'.append (argName o) v}))
        parse'arg
         = P'.try
            (do
               v <- P'.getT "arg"
               Prelude'.return (\ o -> o{arg = P'.append (arg o) v}))
        parse'signature
         = P'.try
            (do
               v <- P'.getT "signature"
               Prelude'.return (\ o -> o{signature = v}))
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