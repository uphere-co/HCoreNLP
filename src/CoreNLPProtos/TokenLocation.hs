{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.TokenLocation (TokenLocation(..), sentenceIndex, tokenIndex) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data TokenLocation = TokenLocation{_sentenceIndex :: !(P'.Maybe P'.Word32), _tokenIndex :: !(P'.Maybe P'.Word32)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''TokenLocation

instance P'.Mergeable TokenLocation where
  mergeAppend (TokenLocation x'1 x'2) (TokenLocation y'1 y'2) = TokenLocation (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default TokenLocation where
  defaultValue = TokenLocation P'.defaultValue P'.defaultValue

instance P'.Wire TokenLocation where
  wireSize ft' self'@(TokenLocation x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 13 x'2)
  wirePut ft' self'@(TokenLocation x'1 x'2)
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
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentenceIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TokenLocation) TokenLocation where
  getVal m' f' = f' m'

instance P'.GPB TokenLocation

instance P'.ReflectDescriptor TokenLocation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.TokenLocation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"TokenLocation\"}, descFilePath = [\"CoreNLPProtos\",\"TokenLocation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.TokenLocation.sentenceIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"TokenLocation\"], baseName' = FName \"sentenceIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.TokenLocation.tokenIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"TokenLocation\"], baseName' = FName \"tokenIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType TokenLocation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TokenLocation where
  textPut msg
   = do
       P'.tellT "sentenceIndex" (_sentenceIndex msg)
       P'.tellT "tokenIndex" (_tokenIndex msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_sentenceIndex, parse'_tokenIndex]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_sentenceIndex
         = P'.try
            (do
               v <- P'.getT "sentenceIndex"
               Prelude'.return (\ o -> o{_sentenceIndex = v}))
        parse'_tokenIndex
         = P'.try
            (do
               v <- P'.getT "tokenIndex"
               Prelude'.return (\ o -> o{_tokenIndex = v}))