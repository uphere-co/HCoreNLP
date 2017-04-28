{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.CorefChain.CorefMention (CorefMention(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data CorefMention = CorefMention{mentionID :: !(P'.Maybe P'.Int32), mentionType :: !(P'.Maybe P'.Utf8),
                                 number :: !(P'.Maybe P'.Utf8), gender :: !(P'.Maybe P'.Utf8), animacy :: !(P'.Maybe P'.Utf8),
                                 beginIndex :: !(P'.Maybe P'.Word32), endIndex :: !(P'.Maybe P'.Word32),
                                 headIndex :: !(P'.Maybe P'.Word32), sentenceIndex :: !(P'.Maybe P'.Word32),
                                 position :: !(P'.Maybe P'.Word32)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable CorefMention where
  mergeAppend (CorefMention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10) (CorefMention y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10)
   = CorefMention (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)

instance P'.Default CorefMention where
  defaultValue
   = CorefMention P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire CorefMention where
  wireSize ft' self'@(CorefMention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 13 x'9
             + P'.wireSizeOpt 1 13 x'10)
  wirePut ft' self'@(CorefMention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 5 x'1
             P'.wirePutOpt 18 9 x'2
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 34 9 x'4
             P'.wirePutOpt 42 9 x'5
             P'.wirePutOpt 48 13 x'6
             P'.wirePutOpt 56 13 x'7
             P'.wirePutOpt 72 13 x'8
             P'.wirePutOpt 80 13 x'9
             P'.wirePutOpt 88 13 x'10
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{mentionID = Prelude'.Just new'Field}) (P'.wireGet 5)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{mentionType = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{number = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{gender = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{animacy = Prelude'.Just new'Field}) (P'.wireGet 9)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{beginIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{endIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{headIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{sentenceIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{position = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CorefMention) CorefMention where
  getVal m' f' = f' m'

instance P'.GPB CorefMention

instance P'.ReflectDescriptor CorefMention where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 48, 56, 72, 80, 88])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\",MName \"CorefChain\"], baseName = MName \"CorefMention\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"CorefChain\",\"CorefMention.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.mentionID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"mentionID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.mentionType\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"mentionType\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.number\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"number\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.gender\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"gender\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.animacy\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"animacy\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.beginIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"beginIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.endIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"endIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.headIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"headIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.sentenceIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"sentenceIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention.position\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\",MName \"CorefMention\"], baseName' = FName \"position\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType CorefMention where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CorefMention where
  textPut msg
   = do
       P'.tellT "mentionID" (mentionID msg)
       P'.tellT "mentionType" (mentionType msg)
       P'.tellT "number" (number msg)
       P'.tellT "gender" (gender msg)
       P'.tellT "animacy" (animacy msg)
       P'.tellT "beginIndex" (beginIndex msg)
       P'.tellT "endIndex" (endIndex msg)
       P'.tellT "headIndex" (headIndex msg)
       P'.tellT "sentenceIndex" (sentenceIndex msg)
       P'.tellT "position" (position msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'mentionID, parse'mentionType, parse'number, parse'gender, parse'animacy, parse'beginIndex, parse'endIndex,
                   parse'headIndex, parse'sentenceIndex, parse'position])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'mentionID
         = P'.try
            (do
               v <- P'.getT "mentionID"
               Prelude'.return (\ o -> o{mentionID = v}))
        parse'mentionType
         = P'.try
            (do
               v <- P'.getT "mentionType"
               Prelude'.return (\ o -> o{mentionType = v}))
        parse'number
         = P'.try
            (do
               v <- P'.getT "number"
               Prelude'.return (\ o -> o{number = v}))
        parse'gender
         = P'.try
            (do
               v <- P'.getT "gender"
               Prelude'.return (\ o -> o{gender = v}))
        parse'animacy
         = P'.try
            (do
               v <- P'.getT "animacy"
               Prelude'.return (\ o -> o{animacy = v}))
        parse'beginIndex
         = P'.try
            (do
               v <- P'.getT "beginIndex"
               Prelude'.return (\ o -> o{beginIndex = v}))
        parse'endIndex
         = P'.try
            (do
               v <- P'.getT "endIndex"
               Prelude'.return (\ o -> o{endIndex = v}))
        parse'headIndex
         = P'.try
            (do
               v <- P'.getT "headIndex"
               Prelude'.return (\ o -> o{headIndex = v}))
        parse'sentenceIndex
         = P'.try
            (do
               v <- P'.getT "sentenceIndex"
               Prelude'.return (\ o -> o{sentenceIndex = v}))
        parse'position
         = P'.try
            (do
               v <- P'.getT "position"
               Prelude'.return (\ o -> o{position = v}))