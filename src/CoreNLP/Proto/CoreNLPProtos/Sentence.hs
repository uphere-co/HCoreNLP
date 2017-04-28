{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Sentence (Sentence(..)) where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified CoreNLP.Proto.CoreNLPProtos.DependencyGraph as CoreNLPProtos (DependencyGraph)
import qualified CoreNLP.Proto.CoreNLPProtos.Entity as CoreNLPProtos (Entity)
import qualified CoreNLP.Proto.CoreNLPProtos.Mention as CoreNLPProtos (Mention)
import qualified CoreNLP.Proto.CoreNLPProtos.NERMention as CoreNLPProtos (NERMention)
import qualified CoreNLP.Proto.CoreNLPProtos.ParseTree as CoreNLPProtos (ParseTree)
import qualified CoreNLP.Proto.CoreNLPProtos.Relation as CoreNLPProtos (Relation)
import qualified CoreNLP.Proto.CoreNLPProtos.RelationTriple as CoreNLPProtos (RelationTriple)
import qualified CoreNLP.Proto.CoreNLPProtos.SentenceFragment as CoreNLPProtos (SentenceFragment)
import qualified CoreNLP.Proto.CoreNLPProtos.Token as CoreNLPProtos (Token)

data Sentence = Sentence{token :: !(P'.Seq CoreNLPProtos.Token), tokenOffsetBegin :: !(P'.Word32), tokenOffsetEnd :: !(P'.Word32),
                         sentenceIndex :: !(P'.Maybe P'.Word32), characterOffsetBegin :: !(P'.Maybe P'.Word32),
                         characterOffsetEnd :: !(P'.Maybe P'.Word32), parseTree :: !(P'.Maybe CoreNLPProtos.ParseTree),
                         binarizedParseTree :: !(P'.Maybe CoreNLPProtos.ParseTree),
                         annotatedParseTree :: !(P'.Maybe CoreNLPProtos.ParseTree), sentiment :: !(P'.Maybe P'.Utf8),
                         kBestParseTrees :: !(P'.Seq CoreNLPProtos.ParseTree),
                         basicDependencies :: !(P'.Maybe CoreNLPProtos.DependencyGraph),
                         collapsedDependencies :: !(P'.Maybe CoreNLPProtos.DependencyGraph),
                         collapsedCCProcessedDependencies :: !(P'.Maybe CoreNLPProtos.DependencyGraph),
                         alternativeDependencies :: !(P'.Maybe CoreNLPProtos.DependencyGraph),
                         openieTriple :: !(P'.Seq CoreNLPProtos.RelationTriple),
                         kbpTriple :: !(P'.Seq CoreNLPProtos.RelationTriple),
                         entailedSentence :: !(P'.Seq CoreNLPProtos.SentenceFragment),
                         entailedClause :: !(P'.Seq CoreNLPProtos.SentenceFragment),
                         enhancedDependencies :: !(P'.Maybe CoreNLPProtos.DependencyGraph),
                         enhancedPlusPlusDependencies :: !(P'.Maybe CoreNLPProtos.DependencyGraph),
                         character :: !(P'.Seq CoreNLPProtos.Token), paragraph :: !(P'.Maybe P'.Word32),
                         text :: !(P'.Maybe P'.Utf8), hasRelationAnnotations :: !(P'.Maybe P'.Bool),
                         entity :: !(P'.Seq CoreNLPProtos.Entity), relation :: !(P'.Seq CoreNLPProtos.Relation),
                         hasNumerizedTokensAnnotation :: !(P'.Maybe P'.Bool), mentions :: !(P'.Seq CoreNLPProtos.NERMention),
                         mentionsForCoref :: !(P'.Seq CoreNLPProtos.Mention), hasCorefMentionsAnnotation :: !(P'.Maybe P'.Bool),
                         sentenceID :: !(P'.Maybe P'.Utf8), ext'field :: !(P'.ExtField)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ExtendMessage Sentence where
  getExtField = ext'field
  putExtField e'f msg = msg{ext'field = e'f}
  validExtRanges msg = P'.extRanges (P'.reflectDescriptorInfo msg)

instance P'.Mergeable Sentence where
  mergeAppend
   (Sentence x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24 x'25
     x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33)
   (Sentence y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24 y'25
     y'26 y'27 y'28 y'29 y'30 y'31 y'32 y'33)
   = Sentence (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
      (P'.mergeAppend x'17 y'17)
      (P'.mergeAppend x'18 y'18)
      (P'.mergeAppend x'19 y'19)
      (P'.mergeAppend x'20 y'20)
      (P'.mergeAppend x'21 y'21)
      (P'.mergeAppend x'22 y'22)
      (P'.mergeAppend x'23 y'23)
      (P'.mergeAppend x'24 y'24)
      (P'.mergeAppend x'25 y'25)
      (P'.mergeAppend x'26 y'26)
      (P'.mergeAppend x'27 y'27)
      (P'.mergeAppend x'28 y'28)
      (P'.mergeAppend x'29 y'29)
      (P'.mergeAppend x'30 y'30)
      (P'.mergeAppend x'31 y'31)
      (P'.mergeAppend x'32 y'32)
      (P'.mergeAppend x'33 y'33)

instance P'.Default Sentence where
  defaultValue
   = Sentence P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Sentence where
  wireSize ft'
   self'@(Sentence x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
           x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeReq 1 13 x'2 + P'.wireSizeReq 1 13 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 2 11 x'8
             + P'.wireSizeOpt 2 11 x'9
             + P'.wireSizeOpt 2 9 x'10
             + P'.wireSizeRep 2 11 x'11
             + P'.wireSizeOpt 1 11 x'12
             + P'.wireSizeOpt 1 11 x'13
             + P'.wireSizeOpt 1 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeRep 1 11 x'16
             + P'.wireSizeRep 2 11 x'17
             + P'.wireSizeRep 1 11 x'18
             + P'.wireSizeRep 2 11 x'19
             + P'.wireSizeOpt 2 11 x'20
             + P'.wireSizeOpt 2 11 x'21
             + P'.wireSizeRep 2 11 x'22
             + P'.wireSizeOpt 1 13 x'23
             + P'.wireSizeOpt 1 9 x'24
             + P'.wireSizeOpt 2 8 x'25
             + P'.wireSizeRep 2 11 x'26
             + P'.wireSizeRep 2 11 x'27
             + P'.wireSizeOpt 2 8 x'28
             + P'.wireSizeRep 2 11 x'29
             + P'.wireSizeRep 2 11 x'30
             + P'.wireSizeOpt 2 8 x'31
             + P'.wireSizeOpt 2 9 x'32
             + P'.wireSizeExtField x'33)
  wirePut ft'
   self'@(Sentence x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
           x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33)
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
             P'.wirePutReq 16 13 x'2
             P'.wirePutReq 24 13 x'3
             P'.wirePutOpt 32 13 x'4
             P'.wirePutOpt 40 13 x'5
             P'.wirePutOpt 48 13 x'6
             P'.wirePutOpt 58 11 x'7
             P'.wirePutOpt 66 11 x'12
             P'.wirePutOpt 74 11 x'13
             P'.wirePutOpt 82 11 x'14
             P'.wirePutOpt 88 13 x'23
             P'.wirePutOpt 98 9 x'24
             P'.wirePutOpt 106 11 x'15
             P'.wirePutRep 114 11 x'16
             P'.wirePutRep 122 11 x'18
             P'.wirePutRep 130 11 x'17
             P'.wirePutOpt 138 11 x'20
             P'.wirePutOpt 146 11 x'21
             P'.wirePutRep 154 11 x'22
             P'.wirePutOpt 250 11 x'8
             P'.wirePutOpt 258 11 x'9
             P'.wirePutOpt 266 9 x'10
             P'.wirePutRep 274 11 x'11
             P'.wirePutRep 282 11 x'19
             P'.wirePutOpt 408 8 x'25
             P'.wirePutRep 418 11 x'26
             P'.wirePutRep 426 11 x'27
             P'.wirePutOpt 432 8 x'28
             P'.wirePutRep 442 11 x'29
             P'.wirePutRep 450 11 x'30
             P'.wirePutOpt 456 8 x'31
             P'.wirePutOpt 466 9 x'32
             P'.wirePutExtField x'33
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{token = P'.append (token old'Self) new'Field}) (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenOffsetBegin = new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenOffsetEnd = new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{sentenceIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{characterOffsetBegin = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{characterOffsetEnd = Prelude'.Just new'Field}) (P'.wireGet 13)
             58 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{parseTree = P'.mergeAppend (parseTree old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             250 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{binarizedParseTree = P'.mergeAppend (binarizedParseTree old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             258 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{annotatedParseTree = P'.mergeAppend (annotatedParseTree old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             266 -> Prelude'.fmap (\ !new'Field -> old'Self{sentiment = Prelude'.Just new'Field}) (P'.wireGet 9)
             274 -> Prelude'.fmap (\ !new'Field -> old'Self{kBestParseTrees = P'.append (kBestParseTrees old'Self) new'Field})
                     (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{basicDependencies = P'.mergeAppend (basicDependencies old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{collapsedDependencies = P'.mergeAppend (collapsedDependencies old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{collapsedCCProcessedDependencies =
                                P'.mergeAppend (collapsedCCProcessedDependencies old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{alternativeDependencies =
                                 P'.mergeAppend (alternativeDependencies old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap (\ !new'Field -> old'Self{openieTriple = P'.append (openieTriple old'Self) new'Field})
                     (P'.wireGet 11)
             130 -> Prelude'.fmap (\ !new'Field -> old'Self{kbpTriple = P'.append (kbpTriple old'Self) new'Field}) (P'.wireGet 11)
             122 -> Prelude'.fmap (\ !new'Field -> old'Self{entailedSentence = P'.append (entailedSentence old'Self) new'Field})
                     (P'.wireGet 11)
             282 -> Prelude'.fmap (\ !new'Field -> old'Self{entailedClause = P'.append (entailedClause old'Self) new'Field})
                     (P'.wireGet 11)
             138 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{enhancedDependencies = P'.mergeAppend (enhancedDependencies old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             146 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{enhancedPlusPlusDependencies =
                                 P'.mergeAppend (enhancedPlusPlusDependencies old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             154 -> Prelude'.fmap (\ !new'Field -> old'Self{character = P'.append (character old'Self) new'Field}) (P'.wireGet 11)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{paragraph = Prelude'.Just new'Field}) (P'.wireGet 13)
             98 -> Prelude'.fmap (\ !new'Field -> old'Self{text = Prelude'.Just new'Field}) (P'.wireGet 9)
             408 -> Prelude'.fmap (\ !new'Field -> old'Self{hasRelationAnnotations = Prelude'.Just new'Field}) (P'.wireGet 8)
             418 -> Prelude'.fmap (\ !new'Field -> old'Self{entity = P'.append (entity old'Self) new'Field}) (P'.wireGet 11)
             426 -> Prelude'.fmap (\ !new'Field -> old'Self{relation = P'.append (relation old'Self) new'Field}) (P'.wireGet 11)
             432 -> Prelude'.fmap (\ !new'Field -> old'Self{hasNumerizedTokensAnnotation = Prelude'.Just new'Field}) (P'.wireGet 8)
             442 -> Prelude'.fmap (\ !new'Field -> old'Self{mentions = P'.append (mentions old'Self) new'Field}) (P'.wireGet 11)
             450 -> Prelude'.fmap (\ !new'Field -> old'Self{mentionsForCoref = P'.append (mentionsForCoref old'Self) new'Field})
                     (P'.wireGet 11)
             456 -> Prelude'.fmap (\ !new'Field -> old'Self{hasCorefMentionsAnnotation = Prelude'.Just new'Field}) (P'.wireGet 8)
             466 -> Prelude'.fmap (\ !new'Field -> old'Self{sentenceID = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in
                   if Prelude'.or [100 <= field'Number && field'Number <= 255] then P'.loadExtension field'Number wire'Type old'Self
                    else P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Sentence) Sentence where
  getVal m' f' = f' m'

instance P'.GPB Sentence

instance P'.ReflectDescriptor Sentence where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [16, 24])
      (P'.fromDistinctAscList
        [10, 16, 24, 32, 40, 48, 58, 66, 74, 82, 88, 98, 106, 114, 122, 130, 138, 146, 154, 250, 258, 266, 274, 282, 408, 418, 426,
         432, 442, 450, 456, 466])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Sentence\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Sentence\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Sentence.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.token\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"token\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.tokenOffsetBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"tokenOffsetBegin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.tokenOffsetEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"tokenOffsetEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.sentenceIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"sentenceIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.characterOffsetBegin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"characterOffsetBegin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.characterOffsetEnd\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"characterOffsetEnd\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.parseTree\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"parseTree\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.ParseTree\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"ParseTree\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.binarizedParseTree\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"binarizedParseTree\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 250}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.ParseTree\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"ParseTree\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.annotatedParseTree\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"annotatedParseTree\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 258}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.ParseTree\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"ParseTree\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.sentiment\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"sentiment\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 266}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.kBestParseTrees\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"kBestParseTrees\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 34}, wireTag = WireTag {getWireTag = 274}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.ParseTree\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"ParseTree\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.basicDependencies\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"basicDependencies\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.collapsedDependencies\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"collapsedDependencies\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.collapsedCCProcessedDependencies\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"collapsedCCProcessedDependencies\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.alternativeDependencies\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"alternativeDependencies\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.openieTriple\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"openieTriple\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.RelationTriple\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"RelationTriple\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.kbpTriple\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"kbpTriple\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.RelationTriple\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"RelationTriple\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.entailedSentence\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"entailedSentence\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.SentenceFragment\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"SentenceFragment\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.entailedClause\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"entailedClause\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 35}, wireTag = WireTag {getWireTag = 282}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.SentenceFragment\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"SentenceFragment\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.enhancedDependencies\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"enhancedDependencies\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 138}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.enhancedPlusPlusDependencies\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"enhancedPlusPlusDependencies\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 146}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.DependencyGraph\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"DependencyGraph\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.character\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"character\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 154}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.paragraph\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"paragraph\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.text\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"text\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.hasRelationAnnotations\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"hasRelationAnnotations\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 51}, wireTag = WireTag {getWireTag = 408}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.entity\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"entity\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 52}, wireTag = WireTag {getWireTag = 418}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Entity\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Entity\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.relation\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"relation\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 53}, wireTag = WireTag {getWireTag = 426}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Relation\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Relation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.hasNumerizedTokensAnnotation\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"hasNumerizedTokensAnnotation\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 54}, wireTag = WireTag {getWireTag = 432}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.mentions\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"mentions\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 55}, wireTag = WireTag {getWireTag = 442}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.NERMention\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"NERMention\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.mentionsForCoref\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"mentionsForCoref\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 56}, wireTag = WireTag {getWireTag = 450}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Mention\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Mention\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.hasCorefMentionsAnnotation\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"hasCorefMentionsAnnotation\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 57}, wireTag = WireTag {getWireTag = 456}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Sentence.sentenceID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Sentence\"], baseName' = FName \"sentenceID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 58}, wireTag = WireTag {getWireTag = 466}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [(FieldId {getFieldId = 100},FieldId {getFieldId = 255})], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Sentence where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Sentence where
  textPut msg
   = do
       P'.tellT "token" (token msg)
       P'.tellT "tokenOffsetBegin" (tokenOffsetBegin msg)
       P'.tellT "tokenOffsetEnd" (tokenOffsetEnd msg)
       P'.tellT "sentenceIndex" (sentenceIndex msg)
       P'.tellT "characterOffsetBegin" (characterOffsetBegin msg)
       P'.tellT "characterOffsetEnd" (characterOffsetEnd msg)
       P'.tellT "parseTree" (parseTree msg)
       P'.tellT "binarizedParseTree" (binarizedParseTree msg)
       P'.tellT "annotatedParseTree" (annotatedParseTree msg)
       P'.tellT "sentiment" (sentiment msg)
       P'.tellT "kBestParseTrees" (kBestParseTrees msg)
       P'.tellT "basicDependencies" (basicDependencies msg)
       P'.tellT "collapsedDependencies" (collapsedDependencies msg)
       P'.tellT "collapsedCCProcessedDependencies" (collapsedCCProcessedDependencies msg)
       P'.tellT "alternativeDependencies" (alternativeDependencies msg)
       P'.tellT "openieTriple" (openieTriple msg)
       P'.tellT "kbpTriple" (kbpTriple msg)
       P'.tellT "entailedSentence" (entailedSentence msg)
       P'.tellT "entailedClause" (entailedClause msg)
       P'.tellT "enhancedDependencies" (enhancedDependencies msg)
       P'.tellT "enhancedPlusPlusDependencies" (enhancedPlusPlusDependencies msg)
       P'.tellT "character" (character msg)
       P'.tellT "paragraph" (paragraph msg)
       P'.tellT "text" (text msg)
       P'.tellT "hasRelationAnnotations" (hasRelationAnnotations msg)
       P'.tellT "entity" (entity msg)
       P'.tellT "relation" (relation msg)
       P'.tellT "hasNumerizedTokensAnnotation" (hasNumerizedTokensAnnotation msg)
       P'.tellT "mentions" (mentions msg)
       P'.tellT "mentionsForCoref" (mentionsForCoref msg)
       P'.tellT "hasCorefMentionsAnnotation" (hasCorefMentionsAnnotation msg)
       P'.tellT "sentenceID" (sentenceID msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'token, parse'tokenOffsetBegin, parse'tokenOffsetEnd, parse'sentenceIndex, parse'characterOffsetBegin,
                   parse'characterOffsetEnd, parse'parseTree, parse'binarizedParseTree, parse'annotatedParseTree, parse'sentiment,
                   parse'kBestParseTrees, parse'basicDependencies, parse'collapsedDependencies,
                   parse'collapsedCCProcessedDependencies, parse'alternativeDependencies, parse'openieTriple, parse'kbpTriple,
                   parse'entailedSentence, parse'entailedClause, parse'enhancedDependencies, parse'enhancedPlusPlusDependencies,
                   parse'character, parse'paragraph, parse'text, parse'hasRelationAnnotations, parse'entity, parse'relation,
                   parse'hasNumerizedTokensAnnotation, parse'mentions, parse'mentionsForCoref, parse'hasCorefMentionsAnnotation,
                   parse'sentenceID])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'token
         = P'.try
            (do
               v <- P'.getT "token"
               Prelude'.return (\ o -> o{token = P'.append (token o) v}))
        parse'tokenOffsetBegin
         = P'.try
            (do
               v <- P'.getT "tokenOffsetBegin"
               Prelude'.return (\ o -> o{tokenOffsetBegin = v}))
        parse'tokenOffsetEnd
         = P'.try
            (do
               v <- P'.getT "tokenOffsetEnd"
               Prelude'.return (\ o -> o{tokenOffsetEnd = v}))
        parse'sentenceIndex
         = P'.try
            (do
               v <- P'.getT "sentenceIndex"
               Prelude'.return (\ o -> o{sentenceIndex = v}))
        parse'characterOffsetBegin
         = P'.try
            (do
               v <- P'.getT "characterOffsetBegin"
               Prelude'.return (\ o -> o{characterOffsetBegin = v}))
        parse'characterOffsetEnd
         = P'.try
            (do
               v <- P'.getT "characterOffsetEnd"
               Prelude'.return (\ o -> o{characterOffsetEnd = v}))
        parse'parseTree
         = P'.try
            (do
               v <- P'.getT "parseTree"
               Prelude'.return (\ o -> o{parseTree = v}))
        parse'binarizedParseTree
         = P'.try
            (do
               v <- P'.getT "binarizedParseTree"
               Prelude'.return (\ o -> o{binarizedParseTree = v}))
        parse'annotatedParseTree
         = P'.try
            (do
               v <- P'.getT "annotatedParseTree"
               Prelude'.return (\ o -> o{annotatedParseTree = v}))
        parse'sentiment
         = P'.try
            (do
               v <- P'.getT "sentiment"
               Prelude'.return (\ o -> o{sentiment = v}))
        parse'kBestParseTrees
         = P'.try
            (do
               v <- P'.getT "kBestParseTrees"
               Prelude'.return (\ o -> o{kBestParseTrees = P'.append (kBestParseTrees o) v}))
        parse'basicDependencies
         = P'.try
            (do
               v <- P'.getT "basicDependencies"
               Prelude'.return (\ o -> o{basicDependencies = v}))
        parse'collapsedDependencies
         = P'.try
            (do
               v <- P'.getT "collapsedDependencies"
               Prelude'.return (\ o -> o{collapsedDependencies = v}))
        parse'collapsedCCProcessedDependencies
         = P'.try
            (do
               v <- P'.getT "collapsedCCProcessedDependencies"
               Prelude'.return (\ o -> o{collapsedCCProcessedDependencies = v}))
        parse'alternativeDependencies
         = P'.try
            (do
               v <- P'.getT "alternativeDependencies"
               Prelude'.return (\ o -> o{alternativeDependencies = v}))
        parse'openieTriple
         = P'.try
            (do
               v <- P'.getT "openieTriple"
               Prelude'.return (\ o -> o{openieTriple = P'.append (openieTriple o) v}))
        parse'kbpTriple
         = P'.try
            (do
               v <- P'.getT "kbpTriple"
               Prelude'.return (\ o -> o{kbpTriple = P'.append (kbpTriple o) v}))
        parse'entailedSentence
         = P'.try
            (do
               v <- P'.getT "entailedSentence"
               Prelude'.return (\ o -> o{entailedSentence = P'.append (entailedSentence o) v}))
        parse'entailedClause
         = P'.try
            (do
               v <- P'.getT "entailedClause"
               Prelude'.return (\ o -> o{entailedClause = P'.append (entailedClause o) v}))
        parse'enhancedDependencies
         = P'.try
            (do
               v <- P'.getT "enhancedDependencies"
               Prelude'.return (\ o -> o{enhancedDependencies = v}))
        parse'enhancedPlusPlusDependencies
         = P'.try
            (do
               v <- P'.getT "enhancedPlusPlusDependencies"
               Prelude'.return (\ o -> o{enhancedPlusPlusDependencies = v}))
        parse'character
         = P'.try
            (do
               v <- P'.getT "character"
               Prelude'.return (\ o -> o{character = P'.append (character o) v}))
        parse'paragraph
         = P'.try
            (do
               v <- P'.getT "paragraph"
               Prelude'.return (\ o -> o{paragraph = v}))
        parse'text
         = P'.try
            (do
               v <- P'.getT "text"
               Prelude'.return (\ o -> o{text = v}))
        parse'hasRelationAnnotations
         = P'.try
            (do
               v <- P'.getT "hasRelationAnnotations"
               Prelude'.return (\ o -> o{hasRelationAnnotations = v}))
        parse'entity
         = P'.try
            (do
               v <- P'.getT "entity"
               Prelude'.return (\ o -> o{entity = P'.append (entity o) v}))
        parse'relation
         = P'.try
            (do
               v <- P'.getT "relation"
               Prelude'.return (\ o -> o{relation = P'.append (relation o) v}))
        parse'hasNumerizedTokensAnnotation
         = P'.try
            (do
               v <- P'.getT "hasNumerizedTokensAnnotation"
               Prelude'.return (\ o -> o{hasNumerizedTokensAnnotation = v}))
        parse'mentions
         = P'.try
            (do
               v <- P'.getT "mentions"
               Prelude'.return (\ o -> o{mentions = P'.append (mentions o) v}))
        parse'mentionsForCoref
         = P'.try
            (do
               v <- P'.getT "mentionsForCoref"
               Prelude'.return (\ o -> o{mentionsForCoref = P'.append (mentionsForCoref o) v}))
        parse'hasCorefMentionsAnnotation
         = P'.try
            (do
               v <- P'.getT "hasCorefMentionsAnnotation"
               Prelude'.return (\ o -> o{hasCorefMentionsAnnotation = v}))
        parse'sentenceID
         = P'.try
            (do
               v <- P'.getT "sentenceID"
               Prelude'.return (\ o -> o{sentenceID = v}))