{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.ParseTree (ParseTree(..), child, value, yieldBeginIndex, yieldEndIndex, score, sentiment) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLPProtos.Sentiment as CoreNLPProtos (Sentiment)

data ParseTree = ParseTree{_child :: !(P'.Seq ParseTree), _value :: !(P'.Maybe P'.Utf8), _yieldBeginIndex :: !(P'.Maybe P'.Word32),
                           _yieldEndIndex :: !(P'.Maybe P'.Word32), _score :: !(P'.Maybe P'.Double),
                           _sentiment :: !(P'.Maybe CoreNLPProtos.Sentiment)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''ParseTree

instance P'.Mergeable ParseTree where
  mergeAppend (ParseTree x'1 x'2 x'3 x'4 x'5 x'6) (ParseTree y'1 y'2 y'3 y'4 y'5 y'6)
   = ParseTree (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default ParseTree where
  defaultValue = ParseTree P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire ParseTree where
  wireSize ft' self'@(ParseTree x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 1 x'5
             + P'.wireSizeOpt 1 14 x'6)
  wirePut ft' self'@(ParseTree x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 10 11 x'1
             P'.wirePutOpt 18 9 x'2
             P'.wirePutOpt 24 13 x'3
             P'.wirePutOpt 32 13 x'4
             P'.wirePutOpt 41 1 x'5
             P'.wirePutOpt 48 14 x'6
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_child = P'.append (_child old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_value = Prelude'.Just new'Field}) (P'.wireGet 9)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_yieldBeginIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_yieldEndIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             41 -> Prelude'.fmap (\ !new'Field -> old'Self{_score = Prelude'.Just new'Field}) (P'.wireGet 1)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentiment = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ParseTree) ParseTree where
  getVal m' f' = f' m'

instance P'.GPB ParseTree

instance P'.ReflectDescriptor ParseTree where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 24, 32, 41, 48])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.ParseTree\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"ParseTree\"}, descFilePath = [\"CoreNLPProtos\",\"ParseTree.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.ParseTree.child\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"ParseTree\"], baseName' = FName \"child\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.ParseTree\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"ParseTree\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.ParseTree.value\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"ParseTree\"], baseName' = FName \"value\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.ParseTree.yieldBeginIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"ParseTree\"], baseName' = FName \"yieldBeginIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.ParseTree.yieldEndIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"ParseTree\"], baseName' = FName \"yieldEndIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.ParseTree.score\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"ParseTree\"], baseName' = FName \"score\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 41}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.ParseTree.sentiment\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"ParseTree\"], baseName' = FName \"sentiment\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Sentiment\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Sentiment\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ParseTree where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ParseTree where
  textPut msg
   = do
       P'.tellT "child" (_child msg)
       P'.tellT "value" (_value msg)
       P'.tellT "yieldBeginIndex" (_yieldBeginIndex msg)
       P'.tellT "yieldEndIndex" (_yieldEndIndex msg)
       P'.tellT "score" (_score msg)
       P'.tellT "sentiment" (_sentiment msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_child, parse'_value, parse'_yieldBeginIndex, parse'_yieldEndIndex, parse'_score, parse'_sentiment])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_child
         = P'.try
            (do
               v <- P'.getT "child"
               Prelude'.return (\ o -> o{_child = P'.append (_child o) v}))
        parse'_value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{_value = v}))
        parse'_yieldBeginIndex
         = P'.try
            (do
               v <- P'.getT "yieldBeginIndex"
               Prelude'.return (\ o -> o{_yieldBeginIndex = v}))
        parse'_yieldEndIndex
         = P'.try
            (do
               v <- P'.getT "yieldEndIndex"
               Prelude'.return (\ o -> o{_yieldEndIndex = v}))
        parse'_score
         = P'.try
            (do
               v <- P'.getT "score"
               Prelude'.return (\ o -> o{_score = v}))
        parse'_sentiment
         = P'.try
            (do
               v <- P'.getT "sentiment"
               Prelude'.return (\ o -> o{_sentiment = v}))