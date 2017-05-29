{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.NERMention
       (NERMention(..), sentenceIndex, tokenStartInSentenceInclusive, tokenEndInSentenceExclusive, ner, normalizedNER, entityType,
        timex, wikipediaEntity)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLP.Proto.CoreNLPProtos.Timex as CoreNLPProtos (Timex)

data NERMention = NERMention{_sentenceIndex :: !(P'.Maybe P'.Word32), _tokenStartInSentenceInclusive :: !(P'.Word32),
                             _tokenEndInSentenceExclusive :: !(P'.Word32), _ner :: !(P'.Utf8),
                             _normalizedNER :: !(P'.Maybe P'.Utf8), _entityType :: !(P'.Maybe P'.Utf8),
                             _timex :: !(P'.Maybe CoreNLPProtos.Timex), _wikipediaEntity :: !(P'.Maybe P'.Utf8)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''NERMention

instance P'.Mergeable NERMention where
  mergeAppend (NERMention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8) (NERMention y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8)
   = NERMention (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)

instance P'.Default NERMention where
  defaultValue
   = NERMention P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue

instance P'.Wire NERMention where
  wireSize ft' self'@(NERMention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeReq 1 13 x'2 + P'.wireSizeReq 1 13 x'3 + P'.wireSizeReq 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 9 x'8)
  wirePut ft' self'@(NERMention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 13 x'1
             P'.wirePutReq 16 13 x'2
             P'.wirePutReq 24 13 x'3
             P'.wirePutReq 34 9 x'4
             P'.wirePutOpt 42 9 x'5
             P'.wirePutOpt 50 9 x'6
             P'.wirePutOpt 58 11 x'7
             P'.wirePutOpt 66 9 x'8
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentenceIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenStartInSentenceInclusive = new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenEndInSentenceExclusive = new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_ner = new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_normalizedNER = Prelude'.Just new'Field}) (P'.wireGet 9)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_entityType = Prelude'.Just new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_timex = P'.mergeAppend (_timex old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_wikipediaEntity = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> NERMention) NERMention where
  getVal m' f' = f' m'

instance P'.GPB NERMention

instance P'.ReflectDescriptor NERMention where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [16, 24, 34]) (P'.fromDistinctAscList [8, 16, 24, 34, 42, 50, 58, 66])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NERMention\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NERMention\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"NERMention.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.sentenceIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"sentenceIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.tokenStartInSentenceInclusive\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"tokenStartInSentenceInclusive\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.tokenEndInSentenceExclusive\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"tokenEndInSentenceExclusive\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.ner\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"ner\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.normalizedNER\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"normalizedNER\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.entityType\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"entityType\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.timex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"timex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Timex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Timex\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.NERMention.wikipediaEntity\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"NERMention\"], baseName' = FName \"wikipediaEntity\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType NERMention where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg NERMention where
  textPut msg
   = do
       P'.tellT "sentenceIndex" (_sentenceIndex msg)
       P'.tellT "tokenStartInSentenceInclusive" (_tokenStartInSentenceInclusive msg)
       P'.tellT "tokenEndInSentenceExclusive" (_tokenEndInSentenceExclusive msg)
       P'.tellT "ner" (_ner msg)
       P'.tellT "normalizedNER" (_normalizedNER msg)
       P'.tellT "entityType" (_entityType msg)
       P'.tellT "timex" (_timex msg)
       P'.tellT "wikipediaEntity" (_wikipediaEntity msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_sentenceIndex, parse'_tokenStartInSentenceInclusive, parse'_tokenEndInSentenceExclusive, parse'_ner,
                   parse'_normalizedNER, parse'_entityType, parse'_timex, parse'_wikipediaEntity])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_sentenceIndex
         = P'.try
            (do
               v <- P'.getT "sentenceIndex"
               Prelude'.return (\ o -> o{_sentenceIndex = v}))
        parse'_tokenStartInSentenceInclusive
         = P'.try
            (do
               v <- P'.getT "tokenStartInSentenceInclusive"
               Prelude'.return (\ o -> o{_tokenStartInSentenceInclusive = v}))
        parse'_tokenEndInSentenceExclusive
         = P'.try
            (do
               v <- P'.getT "tokenEndInSentenceExclusive"
               Prelude'.return (\ o -> o{_tokenEndInSentenceExclusive = v}))
        parse'_ner
         = P'.try
            (do
               v <- P'.getT "ner"
               Prelude'.return (\ o -> o{_ner = v}))
        parse'_normalizedNER
         = P'.try
            (do
               v <- P'.getT "normalizedNER"
               Prelude'.return (\ o -> o{_normalizedNER = v}))
        parse'_entityType
         = P'.try
            (do
               v <- P'.getT "entityType"
               Prelude'.return (\ o -> o{_entityType = v}))
        parse'_timex
         = P'.try
            (do
               v <- P'.getT "timex"
               Prelude'.return (\ o -> o{_timex = v}))
        parse'_wikipediaEntity
         = P'.try
            (do
               v <- P'.getT "wikipediaEntity"
               Prelude'.return (\ o -> o{_wikipediaEntity = v}))