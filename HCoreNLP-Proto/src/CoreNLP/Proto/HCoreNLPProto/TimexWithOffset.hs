{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.HCoreNLPProto.TimexWithOffset
       (TimexWithOffset(..), timex, characterOffsetBegin, characterOffsetEnd, tokenBegin, toeknEnd) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLP.Proto.CoreNLPProtos.Timex as CoreNLPProtos (Timex)

data TimexWithOffset = TimexWithOffset{_timex :: !(CoreNLPProtos.Timex), _characterOffsetBegin :: !(P'.Int32),
                                       _characterOffsetEnd :: !(P'.Int32), _tokenBegin :: !(P'.Int32), _toeknEnd :: !(P'.Int32)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''TimexWithOffset

instance P'.Mergeable TimexWithOffset where
  mergeAppend (TimexWithOffset x'1 x'2 x'3 x'4 x'5) (TimexWithOffset y'1 y'2 y'3 y'4 y'5)
   = TimexWithOffset (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default TimexWithOffset where
  defaultValue = TimexWithOffset P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire TimexWithOffset where
  wireSize ft' self'@(TimexWithOffset x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 5 x'2 + P'.wireSizeReq 1 5 x'3 + P'.wireSizeReq 1 5 x'4 +
             P'.wireSizeReq 1 5 x'5)
  wirePut ft' self'@(TimexWithOffset x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 11 x'1
             P'.wirePutReq 16 5 x'2
             P'.wirePutReq 24 5 x'3
             P'.wirePutReq 32 5 x'4
             P'.wirePutReq 40 5 x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_timex = P'.mergeAppend (_timex old'Self) (new'Field)}) (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_characterOffsetBegin = new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_characterOffsetEnd = new'Field}) (P'.wireGet 5)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenBegin = new'Field}) (P'.wireGet 5)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_toeknEnd = new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TimexWithOffset) TimexWithOffset where
  getVal m' f' = f' m'

instance P'.GPB TimexWithOffset

instance P'.ReflectDescriptor TimexWithOffset where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16, 24, 32, 40]) (P'.fromDistinctAscList [10, 16, 24, 32, 40])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP.TimexWithOffset\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"HCoreNLPProto\"], baseName = MName \"TimexWithOffset\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"HCoreNLPProto\",\"TimexWithOffset.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.timex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"timex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Timex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Timex\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.characterOffsetBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"characterOffsetBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.characterOffsetEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"characterOffsetEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.tokenBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"tokenBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.toeknEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"toeknEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType TimexWithOffset where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TimexWithOffset where
  textPut msg
   = do
       P'.tellT "timex" (_timex msg)
       P'.tellT "characterOffsetBegin" (_characterOffsetBegin msg)
       P'.tellT "characterOffsetEnd" (_characterOffsetEnd msg)
       P'.tellT "tokenBegin" (_tokenBegin msg)
       P'.tellT "toeknEnd" (_toeknEnd msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_timex, parse'_characterOffsetBegin, parse'_characterOffsetEnd, parse'_tokenBegin, parse'_toeknEnd])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_timex
         = P'.try
            (do
               v <- P'.getT "timex"
               Prelude'.return (\ o -> o{_timex = v}))
        parse'_characterOffsetBegin
         = P'.try
            (do
               v <- P'.getT "characterOffsetBegin"
               Prelude'.return (\ o -> o{_characterOffsetBegin = v}))
        parse'_characterOffsetEnd
         = P'.try
            (do
               v <- P'.getT "characterOffsetEnd"
               Prelude'.return (\ o -> o{_characterOffsetEnd = v}))
        parse'_tokenBegin
         = P'.try
            (do
               v <- P'.getT "tokenBegin"
               Prelude'.return (\ o -> o{_tokenBegin = v}))
        parse'_toeknEnd
         = P'.try
            (do
               v <- P'.getT "toeknEnd"
               Prelude'.return (\ o -> o{_toeknEnd = v}))