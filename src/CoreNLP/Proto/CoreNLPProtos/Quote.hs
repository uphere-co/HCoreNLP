{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Quote (Quote(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Quote = Quote{text :: !(P'.Maybe P'.Utf8), begin :: !(P'.Maybe P'.Word32), end :: !(P'.Maybe P'.Word32),
                   sentenceBegin :: !(P'.Maybe P'.Word32), sentenceEnd :: !(P'.Maybe P'.Word32),
                   tokenBegin :: !(P'.Maybe P'.Word32), tokenEnd :: !(P'.Maybe P'.Word32), docid :: !(P'.Maybe P'.Utf8),
                   index :: !(P'.Maybe P'.Word32)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Quote where
  mergeAppend (Quote x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (Quote y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = Quote (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)

instance P'.Default Quote where
  defaultValue
   = Quote P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Quote where
  wireSize ft' self'@(Quote x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 9 x'8
             + P'.wireSizeOpt 1 13 x'9)
  wirePut ft' self'@(Quote x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
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
             P'.wirePutOpt 16 13 x'2
             P'.wirePutOpt 24 13 x'3
             P'.wirePutOpt 40 13 x'4
             P'.wirePutOpt 48 13 x'5
             P'.wirePutOpt 56 13 x'6
             P'.wirePutOpt 64 13 x'7
             P'.wirePutOpt 74 9 x'8
             P'.wirePutOpt 80 13 x'9
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{text = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{begin = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{end = Prelude'.Just new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{sentenceBegin = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{sentenceEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenBegin = Prelude'.Just new'Field}) (P'.wireGet 13)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{docid = Prelude'.Just new'Field}) (P'.wireGet 9)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{index = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Quote) Quote where
  getVal m' f' = f' m'

instance P'.GPB Quote

instance P'.ReflectDescriptor Quote where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 40, 48, 56, 64, 74, 80])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Quote\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Quote\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Quote.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.text\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"text\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.begin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"begin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.end\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"end\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.sentenceBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"sentenceBegin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.sentenceEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"sentenceEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.tokenBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"tokenBegin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.tokenEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"tokenEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.docid\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"docid\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.index\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"index\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Quote where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Quote where
  textPut msg
   = do
       P'.tellT "text" (text msg)
       P'.tellT "begin" (begin msg)
       P'.tellT "end" (end msg)
       P'.tellT "sentenceBegin" (sentenceBegin msg)
       P'.tellT "sentenceEnd" (sentenceEnd msg)
       P'.tellT "tokenBegin" (tokenBegin msg)
       P'.tellT "tokenEnd" (tokenEnd msg)
       P'.tellT "docid" (docid msg)
       P'.tellT "index" (index msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'text, parse'begin, parse'end, parse'sentenceBegin, parse'sentenceEnd, parse'tokenBegin, parse'tokenEnd,
                   parse'docid, parse'index])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'text
         = P'.try
            (do
               v <- P'.getT "text"
               Prelude'.return (\ o -> o{text = v}))
        parse'begin
         = P'.try
            (do
               v <- P'.getT "begin"
               Prelude'.return (\ o -> o{begin = v}))
        parse'end
         = P'.try
            (do
               v <- P'.getT "end"
               Prelude'.return (\ o -> o{end = v}))
        parse'sentenceBegin
         = P'.try
            (do
               v <- P'.getT "sentenceBegin"
               Prelude'.return (\ o -> o{sentenceBegin = v}))
        parse'sentenceEnd
         = P'.try
            (do
               v <- P'.getT "sentenceEnd"
               Prelude'.return (\ o -> o{sentenceEnd = v}))
        parse'tokenBegin
         = P'.try
            (do
               v <- P'.getT "tokenBegin"
               Prelude'.return (\ o -> o{tokenBegin = v}))
        parse'tokenEnd
         = P'.try
            (do
               v <- P'.getT "tokenEnd"
               Prelude'.return (\ o -> o{tokenEnd = v}))
        parse'docid
         = P'.try
            (do
               v <- P'.getT "docid"
               Prelude'.return (\ o -> o{docid = v}))
        parse'index
         = P'.try
            (do
               v <- P'.getT "index"
               Prelude'.return (\ o -> o{index = v}))