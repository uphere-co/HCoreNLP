{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Document
       (Document(..), text, sentence, corefChain, docID, docDate, calendar, sentencelessToken, character, quote, mentions) where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLPProtos.CorefChain as CoreNLPProtos (CorefChain)
import qualified CoreNLPProtos.NERMention as CoreNLPProtos (NERMention)
import qualified CoreNLPProtos.Quote as CoreNLPProtos (Quote)
import qualified CoreNLPProtos.Sentence as CoreNLPProtos (Sentence)
import qualified CoreNLPProtos.Token as CoreNLPProtos (Token)

data Document = Document{_text :: !(P'.Utf8), _sentence :: !(P'.Seq CoreNLPProtos.Sentence),
                         _corefChain :: !(P'.Seq CoreNLPProtos.CorefChain), _docID :: !(P'.Maybe P'.Utf8),
                         _docDate :: !(P'.Maybe P'.Utf8), _calendar :: !(P'.Maybe P'.Word64),
                         _sentencelessToken :: !(P'.Seq CoreNLPProtos.Token), _character :: !(P'.Seq CoreNLPProtos.Token),
                         _quote :: !(P'.Seq CoreNLPProtos.Quote), _mentions :: !(P'.Seq CoreNLPProtos.NERMention),
                         _ext'field :: !(P'.ExtField)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Document

instance P'.ExtendMessage Document where
  getExtField = _ext'field
  putExtField e'f msg = msg{_ext'field = e'f}
  validExtRanges msg = P'.extRanges (P'.reflectDescriptorInfo msg)

instance P'.Mergeable Document where
  mergeAppend (Document x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11) (Document y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11)
   = Document (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)

instance P'.Default Document where
  defaultValue
   = Document P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Document where
  wireSize ft' self'@(Document x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 4 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeRep 1 11 x'8
             + P'.wireSizeRep 1 11 x'9
             + P'.wireSizeRep 1 11 x'10
             + P'.wireSizeExtField x'11)
  wirePut ft' self'@(Document x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
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
             P'.wirePutRep 18 11 x'2
             P'.wirePutRep 26 11 x'3
             P'.wirePutOpt 34 9 x'4
             P'.wirePutRep 42 11 x'7
             P'.wirePutRep 50 11 x'9
             P'.wirePutOpt 58 9 x'5
             P'.wirePutOpt 64 4 x'6
             P'.wirePutRep 74 11 x'10
             P'.wirePutRep 82 11 x'8
             P'.wirePutExtField x'11
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_text = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentence = P'.append (_sentence old'Self) new'Field}) (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_corefChain = P'.append (_corefChain old'Self) new'Field})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_docID = Prelude'.Just new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_docDate = Prelude'.Just new'Field}) (P'.wireGet 9)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_calendar = Prelude'.Just new'Field}) (P'.wireGet 4)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentencelessToken = P'.append (_sentencelessToken old'Self) new'Field})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_character = P'.append (_character old'Self) new'Field}) (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_quote = P'.append (_quote old'Self) new'Field}) (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_mentions = P'.append (_mentions old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in
                   if Prelude'.or [100 <= field'Number && field'Number <= 255] then P'.loadExtension field'Number wire'Type old'Self
                    else P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Document) Document where
  getVal m' f' = f' m'

instance P'.GPB Document

instance P'.ReflectDescriptor Document where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18, 26, 34, 42, 50, 58, 64, 74, 82])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Document\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Document\"}, descFilePath = [\"CoreNLPProtos\",\"Document.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.text\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"text\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.sentence\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"sentence\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Sentence\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Sentence\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.corefChain\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"corefChain\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.CorefChain\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"CorefChain\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.docID\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"docID\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.docDate\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"docDate\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.calendar\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"calendar\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.sentencelessToken\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"sentencelessToken\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.character\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"character\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.quote\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"quote\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Quote\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Quote\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.mentions\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"mentions\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NERMention\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NERMention\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [(FieldId {getFieldId = 100},FieldId {getFieldId = 255})], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Document where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Document where
  textPut msg
   = do
       P'.tellT "text" (_text msg)
       P'.tellT "sentence" (_sentence msg)
       P'.tellT "corefChain" (_corefChain msg)
       P'.tellT "docID" (_docID msg)
       P'.tellT "docDate" (_docDate msg)
       P'.tellT "calendar" (_calendar msg)
       P'.tellT "sentencelessToken" (_sentencelessToken msg)
       P'.tellT "character" (_character msg)
       P'.tellT "quote" (_quote msg)
       P'.tellT "mentions" (_mentions msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_text, parse'_sentence, parse'_corefChain, parse'_docID, parse'_docDate, parse'_calendar,
                   parse'_sentencelessToken, parse'_character, parse'_quote, parse'_mentions])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_text
         = P'.try
            (do
               v <- P'.getT "text"
               Prelude'.return (\ o -> o{_text = v}))
        parse'_sentence
         = P'.try
            (do
               v <- P'.getT "sentence"
               Prelude'.return (\ o -> o{_sentence = P'.append (_sentence o) v}))
        parse'_corefChain
         = P'.try
            (do
               v <- P'.getT "corefChain"
               Prelude'.return (\ o -> o{_corefChain = P'.append (_corefChain o) v}))
        parse'_docID
         = P'.try
            (do
               v <- P'.getT "docID"
               Prelude'.return (\ o -> o{_docID = v}))
        parse'_docDate
         = P'.try
            (do
               v <- P'.getT "docDate"
               Prelude'.return (\ o -> o{_docDate = v}))
        parse'_calendar
         = P'.try
            (do
               v <- P'.getT "calendar"
               Prelude'.return (\ o -> o{_calendar = v}))
        parse'_sentencelessToken
         = P'.try
            (do
               v <- P'.getT "sentencelessToken"
               Prelude'.return (\ o -> o{_sentencelessToken = P'.append (_sentencelessToken o) v}))
        parse'_character
         = P'.try
            (do
               v <- P'.getT "character"
               Prelude'.return (\ o -> o{_character = P'.append (_character o) v}))
        parse'_quote
         = P'.try
            (do
               v <- P'.getT "quote"
               Prelude'.return (\ o -> o{_quote = P'.append (_quote o) v}))
        parse'_mentions
         = P'.try
            (do
               v <- P'.getT "mentions"
               Prelude'.return (\ o -> o{_mentions = P'.append (_mentions o) v}))