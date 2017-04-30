{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.DependencyGraph (DependencyGraph(..), node, edge, root) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph.Edge as CoreNLPProtos.DependencyGraph (Edge)
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph.Node as CoreNLPProtos.DependencyGraph (Node)

data DependencyGraph = DependencyGraph{_node :: !(P'.Seq CoreNLPProtos.DependencyGraph.Node),
                                       _edge :: !(P'.Seq CoreNLPProtos.DependencyGraph.Edge), _root :: !(P'.Seq P'.Word32)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''DependencyGraph

instance P'.Mergeable DependencyGraph where
  mergeAppend (DependencyGraph x'1 x'2 x'3) (DependencyGraph y'1 y'2 y'3)
   = DependencyGraph (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default DependencyGraph where
  defaultValue = DependencyGraph P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire DependencyGraph where
  wireSize ft' self'@(DependencyGraph x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizePacked 1 13 x'3)
  wirePut ft' self'@(DependencyGraph x'1 x'2 x'3)
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
             P'.wirePutRep 18 11 x'2
             P'.wirePutPacked 26 13 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_node = P'.append (_node old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_edge = P'.append (_edge old'Self) new'Field}) (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_root = P'.append (_root old'Self) new'Field}) (P'.wireGet 13)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_root = P'.mergeAppend (_root old'Self) new'Field}) (P'.wireGetPacked 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DependencyGraph) DependencyGraph where
  getVal m' f' = f' m'

instance P'.GPB DependencyGraph

instance P'.ReflectDescriptor DependencyGraph where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 24, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"DependencyGraph.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.node\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\"], baseName' = FName \"node\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Node\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\",MName \"DependencyGraph\"], baseName = MName \"Node\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.edge\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\"], baseName' = FName \"edge\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.Edge\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\",MName \"DependencyGraph\"], baseName = MName \"Edge\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.DependencyGraph.root\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"DependencyGraph\"], baseName' = FName \"root\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Just (WireTag {getWireTag = 24},WireTag {getWireTag = 26}), wireTagLength = 1, isPacked = True, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType DependencyGraph where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DependencyGraph where
  textPut msg
   = do
       P'.tellT "node" (_node msg)
       P'.tellT "edge" (_edge msg)
       P'.tellT "root" (_root msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_node, parse'_edge, parse'_root]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_node
         = P'.try
            (do
               v <- P'.getT "node"
               Prelude'.return (\ o -> o{_node = P'.append (_node o) v}))
        parse'_edge
         = P'.try
            (do
               v <- P'.getT "edge"
               Prelude'.return (\ o -> o{_edge = P'.append (_edge o) v}))
        parse'_root
         = P'.try
            (do
               v <- P'.getT "root"
               Prelude'.return (\ o -> o{_root = P'.append (_root o) v}))