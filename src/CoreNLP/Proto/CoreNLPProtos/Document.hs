{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Document (Document(..)) where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified CoreNLP.Proto.CoreNLPProtos.CorefChain as CoreNLPProtos (CorefChain)
import qualified CoreNLP.Proto.CoreNLPProtos.NERMention as CoreNLPProtos (NERMention)
import qualified CoreNLP.Proto.CoreNLPProtos.Quote as CoreNLPProtos (Quote)
import qualified CoreNLP.Proto.CoreNLPProtos.Sentence as CoreNLPProtos (Sentence)
import qualified CoreNLP.Proto.CoreNLPProtos.Token as CoreNLPProtos (Token)

data Document = Document{text :: !(P'.Utf8), sentence :: !(P'.Seq CoreNLPProtos.Sentence),
                         corefChain :: !(P'.Seq CoreNLPProtos.CorefChain), docID :: !(P'.Maybe P'.Utf8),
                         docDate :: !(P'.Maybe P'.Utf8), calendar :: !(P'.Maybe P'.Word64),
                         sentencelessToken :: !(P'.Seq CoreNLPProtos.Token), character :: !(P'.Seq CoreNLPProtos.Token),
                         quote :: !(P'.Seq CoreNLPProtos.Quote), mentions :: !(P'.Seq CoreNLPProtos.NERMention),
                         ext'field :: !(P'.ExtField)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ExtendMessage Document where
  getExtField = ext'field
  putExtField e'f msg = msg{ext'field = e'f}
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{text = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{sentence = P'.append (sentence old'Self) new'Field}) (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{corefChain = P'.append (corefChain old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{docID = Prelude'.Just new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{docDate = Prelude'.Just new'Field}) (P'.wireGet 9)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{calendar = Prelude'.Just new'Field}) (P'.wireGet 4)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{sentencelessToken = P'.append (sentencelessToken old'Self) new'Field})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{character = P'.append (character old'Self) new'Field}) (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{quote = P'.append (quote old'Self) new'Field}) (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{mentions = P'.append (mentions old'Self) new'Field}) (P'.wireGet 11)
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
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Document\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Document\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Document.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.text\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"text\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.sentence\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"sentence\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Sentence\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Sentence\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.corefChain\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"corefChain\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.CorefChain\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"CorefChain\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.docID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"docID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.docDate\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"docDate\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.calendar\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"calendar\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.sentencelessToken\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"sentencelessToken\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.character\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"character\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.quote\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"quote\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Quote\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Quote\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Document.mentions\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Document\"], baseName' = FName \"mentions\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NERMention\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NERMention\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [(FieldId {getFieldId = 100},FieldId {getFieldId = 255})], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Document where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Document where
  textPut msg
   = do
       P'.tellT "text" (text msg)
       P'.tellT "sentence" (sentence msg)
       P'.tellT "corefChain" (corefChain msg)
       P'.tellT "docID" (docID msg)
       P'.tellT "docDate" (docDate msg)
       P'.tellT "calendar" (calendar msg)
       P'.tellT "sentencelessToken" (sentencelessToken msg)
       P'.tellT "character" (character msg)
       P'.tellT "quote" (quote msg)
       P'.tellT "mentions" (mentions msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'text, parse'sentence, parse'corefChain, parse'docID, parse'docDate, parse'calendar,
                   parse'sentencelessToken, parse'character, parse'quote, parse'mentions])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'text
         = P'.try
            (do
               v <- P'.getT "text"
               Prelude'.return (\ o -> o{text = v}))
        parse'sentence
         = P'.try
            (do
               v <- P'.getT "sentence"
               Prelude'.return (\ o -> o{sentence = P'.append (sentence o) v}))
        parse'corefChain
         = P'.try
            (do
               v <- P'.getT "corefChain"
               Prelude'.return (\ o -> o{corefChain = P'.append (corefChain o) v}))
        parse'docID
         = P'.try
            (do
               v <- P'.getT "docID"
               Prelude'.return (\ o -> o{docID = v}))
        parse'docDate
         = P'.try
            (do
               v <- P'.getT "docDate"
               Prelude'.return (\ o -> o{docDate = v}))
        parse'calendar
         = P'.try
            (do
               v <- P'.getT "calendar"
               Prelude'.return (\ o -> o{calendar = v}))
        parse'sentencelessToken
         = P'.try
            (do
               v <- P'.getT "sentencelessToken"
               Prelude'.return (\ o -> o{sentencelessToken = P'.append (sentencelessToken o) v}))
        parse'character
         = P'.try
            (do
               v <- P'.getT "character"
               Prelude'.return (\ o -> o{character = P'.append (character o) v}))
        parse'quote
         = P'.try
            (do
               v <- P'.getT "quote"
               Prelude'.return (\ o -> o{quote = P'.append (quote o) v}))
        parse'mentions
         = P'.try
            (do
               v <- P'.getT "mentions"
               Prelude'.return (\ o -> o{mentions = P'.append (mentions o) v}))