{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.HCoreNLPProto.ListTimex (ListTimex(..), timexes) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLP.Proto.HCoreNLPProto.TimexWithOffset as HCoreNLPProto (TimexWithOffset)

data ListTimex = ListTimex{_timexes :: !(P'.Seq HCoreNLPProto.TimexWithOffset)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''ListTimex

instance P'.Mergeable ListTimex where
  mergeAppend (ListTimex x'1) (ListTimex y'1) = ListTimex (P'.mergeAppend x'1 y'1)

instance P'.Default ListTimex where
  defaultValue = ListTimex P'.defaultValue

instance P'.Wire ListTimex where
  wireSize ft' self'@(ListTimex x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePut ft' self'@(ListTimex x'1)
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
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_timexes = P'.append (_timexes old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ListTimex) ListTimex where
  getVal m' f' = f' m'

instance P'.GPB ListTimex

instance P'.ReflectDescriptor ListTimex where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP.ListTimex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"HCoreNLPProto\"], baseName = MName \"ListTimex\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"HCoreNLPProto\",\"ListTimex.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.ListTimex.timexes\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"ListTimex\"], baseName' = FName \"timexes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP.TimexWithOffset\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"HCoreNLPProto\"], baseName = MName \"TimexWithOffset\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType ListTimex where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ListTimex where
  textPut msg
   = do
       P'.tellT "timexes" (_timexes msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_timexes]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_timexes
         = P'.try
            (do
               v <- P'.getT "timexes"
               Prelude'.return (\ o -> o{_timexes = P'.append (_timexes o) v}))