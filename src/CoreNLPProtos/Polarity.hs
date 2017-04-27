{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Polarity
       (Polarity(..), projectEquivalence, projectForwardEntailment, projectReverseEntailment, projectNegation, projectAlternation,
        projectCover, projectIndependence)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLPProtos.NaturalLogicRelation as CoreNLPProtos (NaturalLogicRelation)

data Polarity = Polarity{_projectEquivalence :: !(CoreNLPProtos.NaturalLogicRelation),
                         _projectForwardEntailment :: !(CoreNLPProtos.NaturalLogicRelation),
                         _projectReverseEntailment :: !(CoreNLPProtos.NaturalLogicRelation),
                         _projectNegation :: !(CoreNLPProtos.NaturalLogicRelation),
                         _projectAlternation :: !(CoreNLPProtos.NaturalLogicRelation),
                         _projectCover :: !(CoreNLPProtos.NaturalLogicRelation),
                         _projectIndependence :: !(CoreNLPProtos.NaturalLogicRelation)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Polarity

instance P'.Mergeable Polarity where
  mergeAppend (Polarity x'1 x'2 x'3 x'4 x'5 x'6 x'7) (Polarity y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = Polarity (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default Polarity where
  defaultValue
   = Polarity P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Polarity where
  wireSize ft' self'@(Polarity x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeReq 1 14 x'2 + P'.wireSizeReq 1 14 x'3 + P'.wireSizeReq 1 14 x'4 +
             P'.wireSizeReq 1 14 x'5
             + P'.wireSizeReq 1 14 x'6
             + P'.wireSizeReq 1 14 x'7)
  wirePut ft' self'@(Polarity x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 8 14 x'1
             P'.wirePutReq 16 14 x'2
             P'.wirePutReq 24 14 x'3
             P'.wirePutReq 32 14 x'4
             P'.wirePutReq 40 14 x'5
             P'.wirePutReq 48 14 x'6
             P'.wirePutReq 56 14 x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_projectEquivalence = new'Field}) (P'.wireGet 14)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_projectForwardEntailment = new'Field}) (P'.wireGet 14)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_projectReverseEntailment = new'Field}) (P'.wireGet 14)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_projectNegation = new'Field}) (P'.wireGet 14)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_projectAlternation = new'Field}) (P'.wireGet 14)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_projectCover = new'Field}) (P'.wireGet 14)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_projectIndependence = new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Polarity) Polarity where
  getVal m' f' = f' m'

instance P'.GPB Polarity

instance P'.ReflectDescriptor Polarity where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 56]) (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 56])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Polarity\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Polarity\"}, descFilePath = [\"CoreNLPProtos\",\"Polarity.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Polarity.projectEquivalence\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Polarity\"], baseName' = FName \"projectEquivalence\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NaturalLogicRelation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NaturalLogicRelation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Polarity.projectForwardEntailment\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Polarity\"], baseName' = FName \"projectForwardEntailment\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NaturalLogicRelation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NaturalLogicRelation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Polarity.projectReverseEntailment\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Polarity\"], baseName' = FName \"projectReverseEntailment\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NaturalLogicRelation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NaturalLogicRelation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Polarity.projectNegation\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Polarity\"], baseName' = FName \"projectNegation\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NaturalLogicRelation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NaturalLogicRelation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Polarity.projectAlternation\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Polarity\"], baseName' = FName \"projectAlternation\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NaturalLogicRelation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NaturalLogicRelation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Polarity.projectCover\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Polarity\"], baseName' = FName \"projectCover\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NaturalLogicRelation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NaturalLogicRelation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Polarity.projectIndependence\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Polarity\"], baseName' = FName \"projectIndependence\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NaturalLogicRelation\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NaturalLogicRelation\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Polarity where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Polarity where
  textPut msg
   = do
       P'.tellT "projectEquivalence" (_projectEquivalence msg)
       P'.tellT "projectForwardEntailment" (_projectForwardEntailment msg)
       P'.tellT "projectReverseEntailment" (_projectReverseEntailment msg)
       P'.tellT "projectNegation" (_projectNegation msg)
       P'.tellT "projectAlternation" (_projectAlternation msg)
       P'.tellT "projectCover" (_projectCover msg)
       P'.tellT "projectIndependence" (_projectIndependence msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_projectEquivalence, parse'_projectForwardEntailment, parse'_projectReverseEntailment,
                   parse'_projectNegation, parse'_projectAlternation, parse'_projectCover, parse'_projectIndependence])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_projectEquivalence
         = P'.try
            (do
               v <- P'.getT "projectEquivalence"
               Prelude'.return (\ o -> o{_projectEquivalence = v}))
        parse'_projectForwardEntailment
         = P'.try
            (do
               v <- P'.getT "projectForwardEntailment"
               Prelude'.return (\ o -> o{_projectForwardEntailment = v}))
        parse'_projectReverseEntailment
         = P'.try
            (do
               v <- P'.getT "projectReverseEntailment"
               Prelude'.return (\ o -> o{_projectReverseEntailment = v}))
        parse'_projectNegation
         = P'.try
            (do
               v <- P'.getT "projectNegation"
               Prelude'.return (\ o -> o{_projectNegation = v}))
        parse'_projectAlternation
         = P'.try
            (do
               v <- P'.getT "projectAlternation"
               Prelude'.return (\ o -> o{_projectAlternation = v}))
        parse'_projectCover
         = P'.try
            (do
               v <- P'.getT "projectCover"
               Prelude'.return (\ o -> o{_projectCover = v}))
        parse'_projectIndependence
         = P'.try
            (do
               v <- P'.getT "projectIndependence"
               Prelude'.return (\ o -> o{_projectIndependence = v}))