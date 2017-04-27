{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.SpeakerInfo (SpeakerInfo(..), speakerName, mentions) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data SpeakerInfo = SpeakerInfo{_speakerName :: !(P'.Maybe P'.Utf8), _mentions :: !(P'.Seq P'.Int32)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''SpeakerInfo

instance P'.Mergeable SpeakerInfo where
  mergeAppend (SpeakerInfo x'1 x'2) (SpeakerInfo y'1 y'2) = SpeakerInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default SpeakerInfo where
  defaultValue = SpeakerInfo P'.defaultValue P'.defaultValue

instance P'.Wire SpeakerInfo where
  wireSize ft' self'@(SpeakerInfo x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeRep 1 5 x'2)
  wirePut ft' self'@(SpeakerInfo x'1 x'2)
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
             P'.wirePutRep 16 5 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_speakerName = Prelude'.Just new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_mentions = P'.append (_mentions old'Self) new'Field}) (P'.wireGet 5)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_mentions = P'.mergeAppend (_mentions old'Self) new'Field})
                    (P'.wireGetPacked 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SpeakerInfo) SpeakerInfo where
  getVal m' f' = f' m'

instance P'.GPB SpeakerInfo

instance P'.ReflectDescriptor SpeakerInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.SpeakerInfo\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"SpeakerInfo\"}, descFilePath = [\"CoreNLPProtos\",\"SpeakerInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.SpeakerInfo.speakerName\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"SpeakerInfo\"], baseName' = FName \"speakerName\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.SpeakerInfo.mentions\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"SpeakerInfo\"], baseName' = FName \"mentions\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Just (WireTag {getWireTag = 16},WireTag {getWireTag = 18}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType SpeakerInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SpeakerInfo where
  textPut msg
   = do
       P'.tellT "speakerName" (_speakerName msg)
       P'.tellT "mentions" (_mentions msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_speakerName, parse'_mentions]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_speakerName
         = P'.try
            (do
               v <- P'.getT "speakerName"
               Prelude'.return (\ o -> o{_speakerName = v}))
        parse'_mentions
         = P'.try
            (do
               v <- P'.getT "mentions"
               Prelude'.return (\ o -> o{_mentions = P'.append (_mentions o) v}))