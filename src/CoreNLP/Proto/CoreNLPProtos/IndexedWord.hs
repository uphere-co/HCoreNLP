{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.IndexedWord (IndexedWord(..), sentenceNum, tokenIndex, docID, copyCount) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data IndexedWord = IndexedWord{_sentenceNum :: !(P'.Maybe P'.Word32), _tokenIndex :: !(P'.Maybe P'.Word32),
                               _docID :: !(P'.Maybe P'.Word32), _copyCount :: !(P'.Maybe P'.Word32)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''IndexedWord

instance P'.Mergeable IndexedWord where
  mergeAppend (IndexedWord x'1 x'2 x'3 x'4) (IndexedWord y'1 y'2 y'3 y'4)
   = IndexedWord (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default IndexedWord where
  defaultValue = IndexedWord P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire IndexedWord where
  wireSize ft' self'@(IndexedWord x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 13 x'4)
  wirePut ft' self'@(IndexedWord x'1 x'2 x'3 x'4)
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
             P'.wirePutOpt 16 13 x'2
             P'.wirePutOpt 24 13 x'3
             P'.wirePutOpt 32 13 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentenceNum = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_docID = Prelude'.Just new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_copyCount = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> IndexedWord) IndexedWord where
  getVal m' f' = f' m'

instance P'.GPB IndexedWord

instance P'.ReflectDescriptor IndexedWord where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 32])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.IndexedWord\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"IndexedWord\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"IndexedWord.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.IndexedWord.sentenceNum\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"IndexedWord\"], baseName' = FName \"sentenceNum\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.IndexedWord.tokenIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"IndexedWord\"], baseName' = FName \"tokenIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.IndexedWord.docID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"IndexedWord\"], baseName' = FName \"docID\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.IndexedWord.copyCount\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"IndexedWord\"], baseName' = FName \"copyCount\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType IndexedWord where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg IndexedWord where
  textPut msg
   = do
       P'.tellT "sentenceNum" (_sentenceNum msg)
       P'.tellT "tokenIndex" (_tokenIndex msg)
       P'.tellT "docID" (_docID msg)
       P'.tellT "copyCount" (_copyCount msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_sentenceNum, parse'_tokenIndex, parse'_docID, parse'_copyCount]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_sentenceNum
         = P'.try
            (do
               v <- P'.getT "sentenceNum"
               Prelude'.return (\ o -> o{_sentenceNum = v}))
        parse'_tokenIndex
         = P'.try
            (do
               v <- P'.getT "tokenIndex"
               Prelude'.return (\ o -> o{_tokenIndex = v}))
        parse'_docID
         = P'.try
            (do
               v <- P'.getT "docID"
               Prelude'.return (\ o -> o{_docID = v}))
        parse'_copyCount
         = P'.try
            (do
               v <- P'.getT "copyCount"
               Prelude'.return (\ o -> o{_copyCount = v}))