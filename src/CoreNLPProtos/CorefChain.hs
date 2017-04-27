{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.CorefChain (CorefChain(..), chainID, mention, representative) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLPProtos.CorefChain.CorefMention as CoreNLPProtos.CorefChain (CorefMention)

data CorefChain = CorefChain{_chainID :: !(P'.Int32), _mention :: !(P'.Seq CoreNLPProtos.CorefChain.CorefMention),
                             _representative :: !(P'.Word32)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''CorefChain

instance P'.Mergeable CorefChain where
  mergeAppend (CorefChain x'1 x'2 x'3) (CorefChain y'1 y'2 y'3)
   = CorefChain (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default CorefChain where
  defaultValue = CorefChain P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire CorefChain where
  wireSize ft' self'@(CorefChain x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 5 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeReq 1 13 x'3)
  wirePut ft' self'@(CorefChain x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 8 5 x'1
             P'.wirePutRep 18 11 x'2
             P'.wirePutReq 24 13 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_chainID = new'Field}) (P'.wireGet 5)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_mention = P'.append (_mention old'Self) new'Field}) (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_representative = new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CorefChain) CorefChain where
  getVal m' f' = f' m'

instance P'.GPB CorefChain

instance P'.ReflectDescriptor CorefChain where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 24]) (P'.fromDistinctAscList [8, 18, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.CorefChain\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"CorefChain\"}, descFilePath = [\"CoreNLPProtos\",\"CorefChain.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.chainID\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\"], baseName' = FName \"chainID\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.mention\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\"], baseName' = FName \"mention\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.CorefChain.CorefMention\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\",MName \"CorefChain\"], baseName = MName \"CorefMention\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.CorefChain.representative\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"CorefChain\"], baseName' = FName \"representative\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType CorefChain where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CorefChain where
  textPut msg
   = do
       P'.tellT "chainID" (_chainID msg)
       P'.tellT "mention" (_mention msg)
       P'.tellT "representative" (_representative msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_chainID, parse'_mention, parse'_representative]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_chainID
         = P'.try
            (do
               v <- P'.getT "chainID"
               Prelude'.return (\ o -> o{_chainID = v}))
        parse'_mention
         = P'.try
            (do
               v <- P'.getT "mention"
               Prelude'.return (\ o -> o{_mention = P'.append (_mention o) v}))
        parse'_representative
         = P'.try
            (do
               v <- P'.getT "representative"
               Prelude'.return (\ o -> o{_representative = v}))