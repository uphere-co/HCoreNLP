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
    "ProtoInfo {protoMod = ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [], baseName = MName \"HCoreNLPProto\"}, protoFilePath = [\"CoreNLP\",\"Proto\",\"HCoreNLPProto.hs\"], protoSource = \"HCoreNLP.proto\", extensionKeys = fromList [], messages = [DescriptorInfo {descName = ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP.TimexWithOffset\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"HCoreNLPProto\"], baseName = MName \"TimexWithOffset\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"HCoreNLPProto\",\"TimexWithOffset.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.timex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"timex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Timex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Timex\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.characterOffsetBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"characterOffsetBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.characterOffsetEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"characterOffsetEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.tokenBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"tokenBegin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.TimexWithOffset.tokenEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"TimexWithOffset\"], baseName' = FName \"tokenEnd\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True},DescriptorInfo {descName = ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP.ListTimex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"HCoreNLPProto\"], baseName = MName \"ListTimex\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"HCoreNLPProto\",\"ListTimex.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".ai.uphere.HCoreNLP.ListTimex.timexes\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"HCoreNLPProto\",MName \"ListTimex\"], baseName' = FName \"timexes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".ai.uphere.HCoreNLP.TimexWithOffset\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"HCoreNLPProto\"], baseName = MName \"TimexWithOffset\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}], enums = [], oneofs = [], knownKeyMap = fromList []}"

fileDescriptorProto :: FileDescriptorProto
fileDescriptorProto
 = P'.getFromBS (P'.wireGet 11)
    (P'.pack
      "\197\STX\n\SO\&HCoreNLP.proto\DC2\DC2ai.uphere.HCoreNLP\SUB\rCoreNLP.proto\"\162\SOH\n\SITimexWithOffset\DC2/\n\ENQtimex\CAN\SOH \STX(\v2 .edu.stanford.nlp.pipeline.Timex\DC2\FS\n\DC4characterOffsetBegin\CAN\STX \STX(\ENQ\DC2\SUB\n\DC2characterOffsetEnd\CAN\ETX \STX(\ENQ\DC2\DC2\n\ntokenBegin\CAN\EOT \STX(\ENQ\DC2\DLE\n\btokenEnd\CAN\ENQ \STX(\ENQ\"A\n\tListTimex\DC24\n\atimexes\CAN\SOH \ETX(\v2#.ai.uphere.HCoreNLP.TimexWithOffsetB(B\rHCoreNLPProtoH\SOHP\NUL\128\SOH\NUL\136\SOH\NUL\144\SOH\NUL\160\SOH\NUL\184\SOH\NUL\216\SOH\NUL\248\SOH\NUL")