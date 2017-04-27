{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Quote (Quote(..), text, begin, end, sentenceBegin, sentenceEnd, tokenBegin, tokenEnd, docid, index) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Quote = Quote{_text :: !(P'.Maybe P'.Utf8), _begin :: !(P'.Maybe P'.Word32), _end :: !(P'.Maybe P'.Word32),
                   _sentenceBegin :: !(P'.Maybe P'.Word32), _sentenceEnd :: !(P'.Maybe P'.Word32),
                   _tokenBegin :: !(P'.Maybe P'.Word32), _tokenEnd :: !(P'.Maybe P'.Word32), _docid :: !(P'.Maybe P'.Utf8),
                   _index :: !(P'.Maybe P'.Word32)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Quote

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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_text = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_begin = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_end = Prelude'.Just new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentenceBegin = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentenceEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenBegin = Prelude'.Just new'Field}) (P'.wireGet 13)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_docid = Prelude'.Just new'Field}) (P'.wireGet 9)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_index = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Quote) Quote where
  getVal m' f' = f' m'

instance P'.GPB Quote

instance P'.ReflectDescriptor Quote where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 40, 48, 56, 64, 74, 80])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Quote\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Quote\"}, descFilePath = [\"CoreNLPProtos\",\"Quote.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.text\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"text\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.begin\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"begin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.end\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"end\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.sentenceBegin\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"sentenceBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.sentenceEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"sentenceEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.tokenBegin\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"tokenBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.tokenEnd\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"tokenEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.docid\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"docid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Quote.index\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Quote\"], baseName' = FName \"index\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Quote where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Quote where
  textPut msg
   = do
       P'.tellT "text" (_text msg)
       P'.tellT "begin" (_begin msg)
       P'.tellT "end" (_end msg)
       P'.tellT "sentenceBegin" (_sentenceBegin msg)
       P'.tellT "sentenceEnd" (_sentenceEnd msg)
       P'.tellT "tokenBegin" (_tokenBegin msg)
       P'.tellT "tokenEnd" (_tokenEnd msg)
       P'.tellT "docid" (_docid msg)
       P'.tellT "index" (_index msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_text, parse'_begin, parse'_end, parse'_sentenceBegin, parse'_sentenceEnd, parse'_tokenBegin,
                   parse'_tokenEnd, parse'_docid, parse'_index])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_text
         = P'.try
            (do
               v <- P'.getT "text"
               Prelude'.return (\ o -> o{_text = v}))
        parse'_begin
         = P'.try
            (do
               v <- P'.getT "begin"
               Prelude'.return (\ o -> o{_begin = v}))
        parse'_end
         = P'.try
            (do
               v <- P'.getT "end"
               Prelude'.return (\ o -> o{_end = v}))
        parse'_sentenceBegin
         = P'.try
            (do
               v <- P'.getT "sentenceBegin"
               Prelude'.return (\ o -> o{_sentenceBegin = v}))
        parse'_sentenceEnd
         = P'.try
            (do
               v <- P'.getT "sentenceEnd"
               Prelude'.return (\ o -> o{_sentenceEnd = v}))
        parse'_tokenBegin
         = P'.try
            (do
               v <- P'.getT "tokenBegin"
               Prelude'.return (\ o -> o{_tokenBegin = v}))
        parse'_tokenEnd
         = P'.try
            (do
               v <- P'.getT "tokenEnd"
               Prelude'.return (\ o -> o{_tokenEnd = v}))
        parse'_docid
         = P'.try
            (do
               v <- P'.getT "docid"
               Prelude'.return (\ o -> o{_docid = v}))
        parse'_index
         = P'.try
            (do
               v <- P'.getT "index"
               Prelude'.return (\ o -> o{_index = v}))