{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.DependencyGraph.Edge (Edge(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified CoreNLP.Proto.CoreNLPProtos.Language as CoreNLPProtos (Language)

data Edge = Edge{source :: !(P'.Word32), target :: !(P'.Word32), dep :: !(P'.Maybe P'.Utf8), isExtra :: !(P'.Maybe P'.Bool),
                 sourceCopy :: !(P'.Maybe P'.Word32), targetCopy :: !(P'.Maybe P'.Word32),
                 language :: !(P'.Maybe CoreNLPProtos.Language)}
          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Edge where
  mergeAppend (Edge x'1 x'2 x'3 x'4 x'5 x'6 x'7) (Edge y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = Edge (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default Edge where
  defaultValue
   = Edge P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      (Prelude'.Just (Prelude'.read "Unknown"))

instance P'.Wire Edge where
  wireSize ft' self'@(Edge x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 13 x'1 + P'.wireSizeReq 1 13 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 8 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 14 x'7)
  wirePut ft' self'@(Edge x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 8 13 x'1
             P'.wirePutReq 16 13 x'2
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 32 8 x'4
             P'.wirePutOpt 40 13 x'5
             P'.wirePutOpt 48 13 x'6
             P'.wirePutOpt 56 14 x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{source = new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{target = new'Field}) (P'.wireGet 13)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{dep = Prelude'.Just new'Field}) (P'.wireGet 9)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{isExtra = Prelude'.Just new'Field}) (P'.wireGet 8)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{sourceCopy = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{targetCopy = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{language = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Edge) Edge where
  getVal m' f' = f' m'

instance P'.GPB Edge

instance P'.ReflectDescriptor Edge where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 16]) (P'.fromDistinctAscList [8, 16, 26, 32, 40, 48, 56])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\",MName \"DependencyGraph\"], baseName = MName \"Edge\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"DependencyGraph\",\"Edge.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge.source\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\",MName \"Edge\"], baseName' = FName \"source\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge.target\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\",MName \"Edge\"], baseName' = FName \"target\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge.dep\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\",MName \"Edge\"], baseName' = FName \"dep\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge.isExtra\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\",MName \"Edge\"], baseName' = FName \"isExtra\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge.sourceCopy\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\",MName \"Edge\"], baseName' = FName \"sourceCopy\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge.targetCopy\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\",MName \"Edge\"], baseName' = FName \"targetCopy\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge.language\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\",MName \"Edge\"], baseName' = FName \"language\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Language\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Language\"}), hsRawDefault = Just \"Unknown\", hsDefault = Just (HsDef'Enum \"Unknown\")}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Edge where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Edge where
  textPut msg
   = do
       P'.tellT "source" (source msg)
       P'.tellT "target" (target msg)
       P'.tellT "dep" (dep msg)
       P'.tellT "isExtra" (isExtra msg)
       P'.tellT "sourceCopy" (sourceCopy msg)
       P'.tellT "targetCopy" (targetCopy msg)
       P'.tellT "language" (language msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'source, parse'target, parse'dep, parse'isExtra, parse'sourceCopy, parse'targetCopy, parse'language])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{source = v}))
        parse'target
         = P'.try
            (do
               v <- P'.getT "target"
               Prelude'.return (\ o -> o{target = v}))
        parse'dep
         = P'.try
            (do
               v <- P'.getT "dep"
               Prelude'.return (\ o -> o{dep = v}))
        parse'isExtra
         = P'.try
            (do
               v <- P'.getT "isExtra"
               Prelude'.return (\ o -> o{isExtra = v}))
        parse'sourceCopy
         = P'.try
            (do
               v <- P'.getT "sourceCopy"
               Prelude'.return (\ o -> o{sourceCopy = v}))
        parse'targetCopy
         = P'.try
            (do
               v <- P'.getT "targetCopy"
               Prelude'.return (\ o -> o{targetCopy = v}))
        parse'language
         = P'.try
            (do
               v <- P'.getT "language"
               Prelude'.return (\ o -> o{language = v}))