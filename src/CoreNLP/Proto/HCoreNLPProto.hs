{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.HCoreNLPProto (protoInfo, fileDescriptorProto) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import Text.DescriptorProtos.FileDescriptorProto (FileDescriptorProto)
import Text.ProtocolBuffers.Reflections (ProtoInfo)
import qualified Text.ProtocolBuffers.WireMessage as P' (wireGet,getFromBS)

protoInfo :: ProtoInfo
protoInfo
 = Prelude'.read
    "ProtoInfo {protoMod = ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [], baseName = MName \"HCoreNLPProto\"}, protoFilePath = [\"CoreNLP\",\"Proto\",\"HCoreNLPProto.hs\"], protoSource = \"HCoreNLP.proto\", extensionKeys = fromList [], messages = [DescriptorInfo {descName = ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP.ListTimex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"HCoreNLPProto\"], baseName = MName \"ListTimex\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"HCoreNLPProto\",\"ListTimex.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.ListTimex.timexes\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"ListTimex\"], baseName' = FName \"timexes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Timex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Timex\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}], enums = [], oneofs = [], knownKeyMap = fromList []}"

fileDescriptorProto :: FileDescriptorProto
fileDescriptorProto
 = P'.getFromBS (P'.wireGet 11)
    (P'.pack
      "\157\SOH\n\SO\&HCoreNLP.proto\DC2\DC2ai.uphere.HCoreNLP\SUB\rCoreNLP.proto\">\n\tListTimex\DC21\n\atimexes\CAN\SOH \ETX(\v2 .edu.stanford.nlp.pipeline.TimexB(B\rHCoreNLPProtoH\SOHP\NUL\128\SOH\NUL\136\SOH\NUL\144\SOH\NUL\160\SOH\NUL\184\SOH\NUL\216\SOH\NUL\248\SOH\NUL")