{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.RelationTriple
       (RelationTriple(..), subject, relation, object, confidence, subjectTokens, relationTokens, objectTokens, tree, istmod,
        prefixBe, suffixBe, suffixOf)
       where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph as CoreNLPProtos (DependencyGraph)
import qualified CoreNLP.Proto.CoreNLPProtos.TokenLocation as CoreNLPProtos (TokenLocation)

data RelationTriple = RelationTriple{_subject :: !(P'.Maybe P'.Utf8), _relation :: !(P'.Maybe P'.Utf8),
                                     _object :: !(P'.Maybe P'.Utf8), _confidence :: !(P'.Maybe P'.Double),
                                     _subjectTokens :: !(P'.Seq CoreNLPProtos.TokenLocation),
                                     _relationTokens :: !(P'.Seq CoreNLPProtos.TokenLocation),
                                     _objectTokens :: !(P'.Seq CoreNLPProtos.TokenLocation),
                                     _tree :: !(P'.Maybe CoreNLPProtos.DependencyGraph), _istmod :: !(P'.Maybe P'.Bool),
                                     _prefixBe :: !(P'.Maybe P'.Bool), _suffixBe :: !(P'.Maybe P'.Bool),
                                     _suffixOf :: !(P'.Maybe P'.Bool)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''RelationTriple

instance P'.Mergeable RelationTriple where
  mergeAppend (RelationTriple x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   (RelationTriple y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12)
   = RelationTriple (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)

instance P'.Default RelationTriple where
  defaultValue
   = RelationTriple P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire RelationTriple where
  wireSize ft' self'@(RelationTriple x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 1 x'4 +
             P'.wireSizeRep 1 11 x'5
             + P'.wireSizeRep 1 11 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 8 x'9
             + P'.wireSizeOpt 1 8 x'10
             + P'.wireSizeOpt 1 8 x'11
             + P'.wireSizeOpt 1 8 x'12)
  wirePut ft' self'@(RelationTriple x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
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
             P'.wirePutOpt 18 9 x'2
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 33 1 x'4
             P'.wirePutOpt 66 11 x'8
             P'.wirePutOpt 72 8 x'9
             P'.wirePutOpt 80 8 x'10
             P'.wirePutOpt 88 8 x'11
             P'.wirePutOpt 96 8 x'12
             P'.wirePutRep 106 11 x'5
             P'.wirePutRep 114 11 x'6
             P'.wirePutRep 122 11 x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_subject = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_relation = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_object = Prelude'.Just new'Field}) (P'.wireGet 9)
             33 -> Prelude'.fmap (\ !new'Field -> old'Self{_confidence = Prelude'.Just new'Field}) (P'.wireGet 1)
             106 -> Prelude'.fmap (\ !new'Field -> old'Self{_subjectTokens = P'.append (_subjectTokens old'Self) new'Field})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap (\ !new'Field -> old'Self{_relationTokens = P'.append (_relationTokens old'Self) new'Field})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap (\ !new'Field -> old'Self{_objectTokens = P'.append (_objectTokens old'Self) new'Field})
                     (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_tree = P'.mergeAppend (_tree old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_istmod = Prelude'.Just new'Field}) (P'.wireGet 8)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_prefixBe = Prelude'.Just new'Field}) (P'.wireGet 8)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_suffixBe = Prelude'.Just new'Field}) (P'.wireGet 8)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_suffixOf = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> RelationTriple) RelationTriple where
  getVal m' f' = f' m'

instance P'.GPB RelationTriple

instance P'.ReflectDescriptor RelationTriple where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 33, 66, 72, 80, 88, 96, 106, 114, 122])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.RelationTriple\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"RelationTriple\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"RelationTriple.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.subject\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"subject\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.relation\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"relation\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.object\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"object\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.confidence\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"confidence\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.subjectTokens\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"subjectTokens\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.TokenLocation\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"TokenLocation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.relationTokens\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"relationTokens\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.TokenLocation\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"TokenLocation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.objectTokens\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"objectTokens\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.TokenLocation\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"TokenLocation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.tree\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"tree\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.istmod\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"istmod\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.prefixBe\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"prefixBe\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.suffixBe\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"suffixBe\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.RelationTriple.suffixOf\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"RelationTriple\"], baseName' = FName \"suffixOf\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType RelationTriple where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg RelationTriple where
  textPut msg
   = do
       P'.tellT "subject" (_subject msg)
       P'.tellT "relation" (_relation msg)
       P'.tellT "object" (_object msg)
       P'.tellT "confidence" (_confidence msg)
       P'.tellT "subjectTokens" (_subjectTokens msg)
       P'.tellT "relationTokens" (_relationTokens msg)
       P'.tellT "objectTokens" (_objectTokens msg)
       P'.tellT "tree" (_tree msg)
       P'.tellT "istmod" (_istmod msg)
       P'.tellT "prefixBe" (_prefixBe msg)
       P'.tellT "suffixBe" (_suffixBe msg)
       P'.tellT "suffixOf" (_suffixOf msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_subject, parse'_relation, parse'_object, parse'_confidence, parse'_subjectTokens, parse'_relationTokens,
                   parse'_objectTokens, parse'_tree, parse'_istmod, parse'_prefixBe, parse'_suffixBe, parse'_suffixOf])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_subject
         = P'.try
            (do
               v <- P'.getT "subject"
               Prelude'.return (\ o -> o{_subject = v}))
        parse'_relation
         = P'.try
            (do
               v <- P'.getT "relation"
               Prelude'.return (\ o -> o{_relation = v}))
        parse'_object
         = P'.try
            (do
               v <- P'.getT "object"
               Prelude'.return (\ o -> o{_object = v}))
        parse'_confidence
         = P'.try
            (do
               v <- P'.getT "confidence"
               Prelude'.return (\ o -> o{_confidence = v}))
        parse'_subjectTokens
         = P'.try
            (do
               v <- P'.getT "subjectTokens"
               Prelude'.return (\ o -> o{_subjectTokens = P'.append (_subjectTokens o) v}))
        parse'_relationTokens
         = P'.try
            (do
               v <- P'.getT "relationTokens"
               Prelude'.return (\ o -> o{_relationTokens = P'.append (_relationTokens o) v}))
        parse'_objectTokens
         = P'.try
            (do
               v <- P'.getT "objectTokens"
               Prelude'.return (\ o -> o{_objectTokens = P'.append (_objectTokens o) v}))
        parse'_tree
         = P'.try
            (do
               v <- P'.getT "tree"
               Prelude'.return (\ o -> o{_tree = v}))
        parse'_istmod
         = P'.try
            (do
               v <- P'.getT "istmod"
               Prelude'.return (\ o -> o{_istmod = v}))
        parse'_prefixBe
         = P'.try
            (do
               v <- P'.getT "prefixBe"
               Prelude'.return (\ o -> o{_prefixBe = v}))
        parse'_suffixBe
         = P'.try
            (do
               v <- P'.getT "suffixBe"
               Prelude'.return (\ o -> o{_suffixBe = v}))
        parse'_suffixOf
         = P'.try
            (do
               v <- P'.getT "suffixOf"
               Prelude'.return (\ o -> o{_suffixOf = v}))