{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Mention (Mention(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified CoreNLP.Proto.CoreNLPProtos.IndexedWord as CoreNLPProtos (IndexedWord)
import qualified CoreNLP.Proto.CoreNLPProtos.SpeakerInfo as CoreNLPProtos (SpeakerInfo)

data Mention = Mention{mentionID :: !(P'.Maybe P'.Int32), mentionType :: !(P'.Maybe P'.Utf8), number :: !(P'.Maybe P'.Utf8),
                       gender :: !(P'.Maybe P'.Utf8), animacy :: !(P'.Maybe P'.Utf8), person :: !(P'.Maybe P'.Utf8),
                       startIndex :: !(P'.Maybe P'.Word32), endIndex :: !(P'.Maybe P'.Word32), headIndex :: !(P'.Maybe P'.Word32),
                       headString :: !(P'.Maybe P'.Utf8), nerString :: !(P'.Maybe P'.Utf8), originalRef :: !(P'.Maybe P'.Word32),
                       goldCorefClusterID :: !(P'.Maybe P'.Int32), corefClusterID :: !(P'.Maybe P'.Int32),
                       mentionNum :: !(P'.Maybe P'.Word32), sentNum :: !(P'.Maybe P'.Word32), utter :: !(P'.Maybe P'.Word32),
                       paragraph :: !(P'.Maybe P'.Word32), isSubject :: !(P'.Maybe P'.Bool), isDirectObject :: !(P'.Maybe P'.Bool),
                       isIndirectObject :: !(P'.Maybe P'.Bool), isPrepositionObject :: !(P'.Maybe P'.Bool),
                       hasTwin :: !(P'.Maybe P'.Bool), generic :: !(P'.Maybe P'.Bool), isSingleton :: !(P'.Maybe P'.Bool),
                       hasBasicDependency :: !(P'.Maybe P'.Bool), hasEnhancedDepenedncy :: !(P'.Maybe P'.Bool),
                       hasContextParseTree :: !(P'.Maybe P'.Bool), headIndexedWord :: !(P'.Maybe CoreNLPProtos.IndexedWord),
                       dependingVerb :: !(P'.Maybe CoreNLPProtos.IndexedWord), headWord :: !(P'.Maybe CoreNLPProtos.IndexedWord),
                       speakerInfo :: !(P'.Maybe CoreNLPProtos.SpeakerInfo), sentenceWords :: !(P'.Seq CoreNLPProtos.IndexedWord),
                       originalSpan :: !(P'.Seq CoreNLPProtos.IndexedWord), dependents :: !(P'.Seq P'.Utf8),
                       preprocessedTerms :: !(P'.Seq P'.Utf8), appositions :: !(P'.Seq P'.Int32),
                       predicateNominatives :: !(P'.Seq P'.Int32), relativePronouns :: !(P'.Seq P'.Int32),
                       listMembers :: !(P'.Seq P'.Int32), belongToLists :: !(P'.Seq P'.Int32)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Mention where
  mergeAppend
   (Mention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24 x'25 x'26
     x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41)
   (Mention y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24 y'25 y'26
     y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35 y'36 y'37 y'38 y'39 y'40 y'41)
   = Mention (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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
      (P'.mergeAppend x'34 y'34)
      (P'.mergeAppend x'35 y'35)
      (P'.mergeAppend x'36 y'36)
      (P'.mergeAppend x'37 y'37)
      (P'.mergeAppend x'38 y'38)
      (P'.mergeAppend x'39 y'39)
      (P'.mergeAppend x'40 y'40)
      (P'.mergeAppend x'41 y'41)

instance P'.Default Mention where
  defaultValue
   = Mention P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
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
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Mention where
  wireSize ft'
   self'@(Mention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
           x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 13 x'9
             + P'.wireSizeOpt 1 9 x'10
             + P'.wireSizeOpt 1 9 x'11
             + P'.wireSizeOpt 1 13 x'12
             + P'.wireSizeOpt 1 5 x'13
             + P'.wireSizeOpt 1 5 x'14
             + P'.wireSizeOpt 2 13 x'15
             + P'.wireSizeOpt 2 13 x'16
             + P'.wireSizeOpt 2 13 x'17
             + P'.wireSizeOpt 2 13 x'18
             + P'.wireSizeOpt 2 8 x'19
             + P'.wireSizeOpt 2 8 x'20
             + P'.wireSizeOpt 2 8 x'21
             + P'.wireSizeOpt 2 8 x'22
             + P'.wireSizeOpt 2 8 x'23
             + P'.wireSizeOpt 2 8 x'24
             + P'.wireSizeOpt 2 8 x'25
             + P'.wireSizeOpt 2 8 x'26
             + P'.wireSizeOpt 2 8 x'27
             + P'.wireSizeOpt 2 8 x'28
             + P'.wireSizeOpt 2 11 x'29
             + P'.wireSizeOpt 2 11 x'30
             + P'.wireSizeOpt 2 11 x'31
             + P'.wireSizeOpt 2 11 x'32
             + P'.wireSizeRep 2 11 x'33
             + P'.wireSizeRep 2 11 x'34
             + P'.wireSizeRep 2 9 x'35
             + P'.wireSizeRep 2 9 x'36
             + P'.wireSizeRep 2 5 x'37
             + P'.wireSizeRep 2 5 x'38
             + P'.wireSizeRep 2 5 x'39
             + P'.wireSizeRep 2 5 x'40
             + P'.wireSizeRep 2 5 x'41)
  wirePut ft'
   self'@(Mention x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
           x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 5 x'1
             P'.wirePutOpt 18 9 x'2
             P'.wirePutOpt 26 9 x'3
             P'.wirePutOpt 34 9 x'4
             P'.wirePutOpt 42 9 x'5
             P'.wirePutOpt 50 9 x'6
             P'.wirePutOpt 56 13 x'7
             P'.wirePutOpt 72 13 x'8
             P'.wirePutOpt 80 13 x'9
             P'.wirePutOpt 90 9 x'10
             P'.wirePutOpt 98 9 x'11
             P'.wirePutOpt 104 13 x'12
             P'.wirePutOpt 112 5 x'13
             P'.wirePutOpt 120 5 x'14
             P'.wirePutOpt 128 13 x'15
             P'.wirePutOpt 136 13 x'16
             P'.wirePutOpt 144 13 x'17
             P'.wirePutOpt 152 13 x'18
             P'.wirePutOpt 160 8 x'19
             P'.wirePutOpt 168 8 x'20
             P'.wirePutOpt 176 8 x'21
             P'.wirePutOpt 184 8 x'22
             P'.wirePutOpt 192 8 x'23
             P'.wirePutOpt 200 8 x'24
             P'.wirePutOpt 208 8 x'25
             P'.wirePutOpt 216 8 x'26
             P'.wirePutOpt 224 8 x'27
             P'.wirePutOpt 232 8 x'28
             P'.wirePutOpt 242 11 x'29
             P'.wirePutOpt 250 11 x'30
             P'.wirePutOpt 258 11 x'31
             P'.wirePutOpt 266 11 x'32
             P'.wirePutRep 402 11 x'33
             P'.wirePutRep 410 11 x'34
             P'.wirePutRep 418 9 x'35
             P'.wirePutRep 426 9 x'36
             P'.wirePutRep 432 5 x'37
             P'.wirePutRep 440 5 x'38
             P'.wirePutRep 448 5 x'39
             P'.wirePutRep 456 5 x'40
             P'.wirePutRep 464 5 x'41
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{mentionID = Prelude'.Just new'Field}) (P'.wireGet 5)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{mentionType = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{number = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{gender = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{animacy = Prelude'.Just new'Field}) (P'.wireGet 9)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{person = Prelude'.Just new'Field}) (P'.wireGet 9)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{startIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{endIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{headIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{headString = Prelude'.Just new'Field}) (P'.wireGet 9)
             98 -> Prelude'.fmap (\ !new'Field -> old'Self{nerString = Prelude'.Just new'Field}) (P'.wireGet 9)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{originalRef = Prelude'.Just new'Field}) (P'.wireGet 13)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{goldCorefClusterID = Prelude'.Just new'Field}) (P'.wireGet 5)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{corefClusterID = Prelude'.Just new'Field}) (P'.wireGet 5)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{mentionNum = Prelude'.Just new'Field}) (P'.wireGet 13)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{sentNum = Prelude'.Just new'Field}) (P'.wireGet 13)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{utter = Prelude'.Just new'Field}) (P'.wireGet 13)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{paragraph = Prelude'.Just new'Field}) (P'.wireGet 13)
             160 -> Prelude'.fmap (\ !new'Field -> old'Self{isSubject = Prelude'.Just new'Field}) (P'.wireGet 8)
             168 -> Prelude'.fmap (\ !new'Field -> old'Self{isDirectObject = Prelude'.Just new'Field}) (P'.wireGet 8)
             176 -> Prelude'.fmap (\ !new'Field -> old'Self{isIndirectObject = Prelude'.Just new'Field}) (P'.wireGet 8)
             184 -> Prelude'.fmap (\ !new'Field -> old'Self{isPrepositionObject = Prelude'.Just new'Field}) (P'.wireGet 8)
             192 -> Prelude'.fmap (\ !new'Field -> old'Self{hasTwin = Prelude'.Just new'Field}) (P'.wireGet 8)
             200 -> Prelude'.fmap (\ !new'Field -> old'Self{generic = Prelude'.Just new'Field}) (P'.wireGet 8)
             208 -> Prelude'.fmap (\ !new'Field -> old'Self{isSingleton = Prelude'.Just new'Field}) (P'.wireGet 8)
             216 -> Prelude'.fmap (\ !new'Field -> old'Self{hasBasicDependency = Prelude'.Just new'Field}) (P'.wireGet 8)
             224 -> Prelude'.fmap (\ !new'Field -> old'Self{hasEnhancedDepenedncy = Prelude'.Just new'Field}) (P'.wireGet 8)
             232 -> Prelude'.fmap (\ !new'Field -> old'Self{hasContextParseTree = Prelude'.Just new'Field}) (P'.wireGet 8)
             242 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{headIndexedWord = P'.mergeAppend (headIndexedWord old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             250 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{dependingVerb = P'.mergeAppend (dependingVerb old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             258 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{headWord = P'.mergeAppend (headWord old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             266 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{speakerInfo = P'.mergeAppend (speakerInfo old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             402 -> Prelude'.fmap (\ !new'Field -> old'Self{sentenceWords = P'.append (sentenceWords old'Self) new'Field})
                     (P'.wireGet 11)
             410 -> Prelude'.fmap (\ !new'Field -> old'Self{originalSpan = P'.append (originalSpan old'Self) new'Field})
                     (P'.wireGet 11)
             418 -> Prelude'.fmap (\ !new'Field -> old'Self{dependents = P'.append (dependents old'Self) new'Field}) (P'.wireGet 9)
             426 -> Prelude'.fmap (\ !new'Field -> old'Self{preprocessedTerms = P'.append (preprocessedTerms old'Self) new'Field})
                     (P'.wireGet 9)
             432 -> Prelude'.fmap (\ !new'Field -> old'Self{appositions = P'.append (appositions old'Self) new'Field})
                     (P'.wireGet 5)
             434 -> Prelude'.fmap (\ !new'Field -> old'Self{appositions = P'.mergeAppend (appositions old'Self) new'Field})
                     (P'.wireGetPacked 5)
             440 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{predicateNominatives = P'.append (predicateNominatives old'Self) new'Field})
                     (P'.wireGet 5)
             442 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{predicateNominatives = P'.mergeAppend (predicateNominatives old'Self) new'Field})
                     (P'.wireGetPacked 5)
             448 -> Prelude'.fmap (\ !new'Field -> old'Self{relativePronouns = P'.append (relativePronouns old'Self) new'Field})
                     (P'.wireGet 5)
             450 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{relativePronouns = P'.mergeAppend (relativePronouns old'Self) new'Field})
                     (P'.wireGetPacked 5)
             456 -> Prelude'.fmap (\ !new'Field -> old'Self{listMembers = P'.append (listMembers old'Self) new'Field})
                     (P'.wireGet 5)
             458 -> Prelude'.fmap (\ !new'Field -> old'Self{listMembers = P'.mergeAppend (listMembers old'Self) new'Field})
                     (P'.wireGetPacked 5)
             464 -> Prelude'.fmap (\ !new'Field -> old'Self{belongToLists = P'.append (belongToLists old'Self) new'Field})
                     (P'.wireGet 5)
             466 -> Prelude'.fmap (\ !new'Field -> old'Self{belongToLists = P'.mergeAppend (belongToLists old'Self) new'Field})
                     (P'.wireGetPacked 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Mention) Mention where
  getVal m' f' = f' m'

instance P'.GPB Mention

instance P'.ReflectDescriptor Mention where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList
        [8, 18, 26, 34, 42, 50, 56, 72, 80, 90, 98, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224,
         232, 242, 250, 258, 266, 402, 410, 418, 426, 432, 434, 440, 442, 448, 450, 456, 458, 464, 466])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Mention\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Mention\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Mention.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.mentionID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"mentionID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.mentionType\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"mentionType\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.number\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"number\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.gender\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"gender\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.animacy\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"animacy\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.person\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"person\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.startIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"startIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.endIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"endIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.headIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"headIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.headString\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"headString\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.nerString\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"nerString\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.originalRef\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"originalRef\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.goldCorefClusterID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"goldCorefClusterID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.corefClusterID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"corefClusterID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.mentionNum\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"mentionNum\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.sentNum\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"sentNum\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.utter\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"utter\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.paragraph\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"paragraph\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.isSubject\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"isSubject\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 160}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.isDirectObject\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"isDirectObject\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 168}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.isIndirectObject\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"isIndirectObject\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 176}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.isPrepositionObject\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"isPrepositionObject\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 184}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.hasTwin\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"hasTwin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 192}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.generic\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"generic\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 25}, wireTag = WireTag {getWireTag = 200}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.isSingleton\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"isSingleton\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 208}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.hasBasicDependency\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"hasBasicDependency\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 216}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.hasEnhancedDepenedncy\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"hasEnhancedDepenedncy\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 28}, wireTag = WireTag {getWireTag = 224}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.hasContextParseTree\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"hasContextParseTree\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 29}, wireTag = WireTag {getWireTag = 232}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.headIndexedWord\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"headIndexedWord\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 30}, wireTag = WireTag {getWireTag = 242}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.IndexedWord\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"IndexedWord\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.dependingVerb\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"dependingVerb\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 250}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.IndexedWord\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"IndexedWord\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.headWord\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"headWord\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 258}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.IndexedWord\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"IndexedWord\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.speakerInfo\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"speakerInfo\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 266}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.SpeakerInfo\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"SpeakerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.sentenceWords\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"sentenceWords\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 50}, wireTag = WireTag {getWireTag = 402}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.IndexedWord\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"IndexedWord\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.originalSpan\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"originalSpan\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 51}, wireTag = WireTag {getWireTag = 410}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.IndexedWord\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"IndexedWord\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.dependents\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"dependents\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 52}, wireTag = WireTag {getWireTag = 418}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.preprocessedTerms\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"preprocessedTerms\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 53}, wireTag = WireTag {getWireTag = 426}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.appositions\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"appositions\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 54}, wireTag = WireTag {getWireTag = 432}, packedTag = Just (WireTag {getWireTag = 432},WireTag {getWireTag = 434}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.predicateNominatives\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"predicateNominatives\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 55}, wireTag = WireTag {getWireTag = 440}, packedTag = Just (WireTag {getWireTag = 440},WireTag {getWireTag = 442}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.relativePronouns\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"relativePronouns\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 56}, wireTag = WireTag {getWireTag = 448}, packedTag = Just (WireTag {getWireTag = 448},WireTag {getWireTag = 450}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.listMembers\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"listMembers\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 57}, wireTag = WireTag {getWireTag = 456}, packedTag = Just (WireTag {getWireTag = 456},WireTag {getWireTag = 458}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Mention.belongToLists\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Mention\"], baseName' = FName \"belongToLists\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 58}, wireTag = WireTag {getWireTag = 464}, packedTag = Just (WireTag {getWireTag = 464},WireTag {getWireTag = 466}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Mention where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Mention where
  textPut msg
   = do
       P'.tellT "mentionID" (mentionID msg)
       P'.tellT "mentionType" (mentionType msg)
       P'.tellT "number" (number msg)
       P'.tellT "gender" (gender msg)
       P'.tellT "animacy" (animacy msg)
       P'.tellT "person" (person msg)
       P'.tellT "startIndex" (startIndex msg)
       P'.tellT "endIndex" (endIndex msg)
       P'.tellT "headIndex" (headIndex msg)
       P'.tellT "headString" (headString msg)
       P'.tellT "nerString" (nerString msg)
       P'.tellT "originalRef" (originalRef msg)
       P'.tellT "goldCorefClusterID" (goldCorefClusterID msg)
       P'.tellT "corefClusterID" (corefClusterID msg)
       P'.tellT "mentionNum" (mentionNum msg)
       P'.tellT "sentNum" (sentNum msg)
       P'.tellT "utter" (utter msg)
       P'.tellT "paragraph" (paragraph msg)
       P'.tellT "isSubject" (isSubject msg)
       P'.tellT "isDirectObject" (isDirectObject msg)
       P'.tellT "isIndirectObject" (isIndirectObject msg)
       P'.tellT "isPrepositionObject" (isPrepositionObject msg)
       P'.tellT "hasTwin" (hasTwin msg)
       P'.tellT "generic" (generic msg)
       P'.tellT "isSingleton" (isSingleton msg)
       P'.tellT "hasBasicDependency" (hasBasicDependency msg)
       P'.tellT "hasEnhancedDepenedncy" (hasEnhancedDepenedncy msg)
       P'.tellT "hasContextParseTree" (hasContextParseTree msg)
       P'.tellT "headIndexedWord" (headIndexedWord msg)
       P'.tellT "dependingVerb" (dependingVerb msg)
       P'.tellT "headWord" (headWord msg)
       P'.tellT "speakerInfo" (speakerInfo msg)
       P'.tellT "sentenceWords" (sentenceWords msg)
       P'.tellT "originalSpan" (originalSpan msg)
       P'.tellT "dependents" (dependents msg)
       P'.tellT "preprocessedTerms" (preprocessedTerms msg)
       P'.tellT "appositions" (appositions msg)
       P'.tellT "predicateNominatives" (predicateNominatives msg)
       P'.tellT "relativePronouns" (relativePronouns msg)
       P'.tellT "listMembers" (listMembers msg)
       P'.tellT "belongToLists" (belongToLists msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'mentionID, parse'mentionType, parse'number, parse'gender, parse'animacy, parse'person, parse'startIndex,
                   parse'endIndex, parse'headIndex, parse'headString, parse'nerString, parse'originalRef, parse'goldCorefClusterID,
                   parse'corefClusterID, parse'mentionNum, parse'sentNum, parse'utter, parse'paragraph, parse'isSubject,
                   parse'isDirectObject, parse'isIndirectObject, parse'isPrepositionObject, parse'hasTwin, parse'generic,
                   parse'isSingleton, parse'hasBasicDependency, parse'hasEnhancedDepenedncy, parse'hasContextParseTree,
                   parse'headIndexedWord, parse'dependingVerb, parse'headWord, parse'speakerInfo, parse'sentenceWords,
                   parse'originalSpan, parse'dependents, parse'preprocessedTerms, parse'appositions, parse'predicateNominatives,
                   parse'relativePronouns, parse'listMembers, parse'belongToLists])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'mentionID
         = P'.try
            (do
               v <- P'.getT "mentionID"
               Prelude'.return (\ o -> o{mentionID = v}))
        parse'mentionType
         = P'.try
            (do
               v <- P'.getT "mentionType"
               Prelude'.return (\ o -> o{mentionType = v}))
        parse'number
         = P'.try
            (do
               v <- P'.getT "number"
               Prelude'.return (\ o -> o{number = v}))
        parse'gender
         = P'.try
            (do
               v <- P'.getT "gender"
               Prelude'.return (\ o -> o{gender = v}))
        parse'animacy
         = P'.try
            (do
               v <- P'.getT "animacy"
               Prelude'.return (\ o -> o{animacy = v}))
        parse'person
         = P'.try
            (do
               v <- P'.getT "person"
               Prelude'.return (\ o -> o{person = v}))
        parse'startIndex
         = P'.try
            (do
               v <- P'.getT "startIndex"
               Prelude'.return (\ o -> o{startIndex = v}))
        parse'endIndex
         = P'.try
            (do
               v <- P'.getT "endIndex"
               Prelude'.return (\ o -> o{endIndex = v}))
        parse'headIndex
         = P'.try
            (do
               v <- P'.getT "headIndex"
               Prelude'.return (\ o -> o{headIndex = v}))
        parse'headString
         = P'.try
            (do
               v <- P'.getT "headString"
               Prelude'.return (\ o -> o{headString = v}))
        parse'nerString
         = P'.try
            (do
               v <- P'.getT "nerString"
               Prelude'.return (\ o -> o{nerString = v}))
        parse'originalRef
         = P'.try
            (do
               v <- P'.getT "originalRef"
               Prelude'.return (\ o -> o{originalRef = v}))
        parse'goldCorefClusterID
         = P'.try
            (do
               v <- P'.getT "goldCorefClusterID"
               Prelude'.return (\ o -> o{goldCorefClusterID = v}))
        parse'corefClusterID
         = P'.try
            (do
               v <- P'.getT "corefClusterID"
               Prelude'.return (\ o -> o{corefClusterID = v}))
        parse'mentionNum
         = P'.try
            (do
               v <- P'.getT "mentionNum"
               Prelude'.return (\ o -> o{mentionNum = v}))
        parse'sentNum
         = P'.try
            (do
               v <- P'.getT "sentNum"
               Prelude'.return (\ o -> o{sentNum = v}))
        parse'utter
         = P'.try
            (do
               v <- P'.getT "utter"
               Prelude'.return (\ o -> o{utter = v}))
        parse'paragraph
         = P'.try
            (do
               v <- P'.getT "paragraph"
               Prelude'.return (\ o -> o{paragraph = v}))
        parse'isSubject
         = P'.try
            (do
               v <- P'.getT "isSubject"
               Prelude'.return (\ o -> o{isSubject = v}))
        parse'isDirectObject
         = P'.try
            (do
               v <- P'.getT "isDirectObject"
               Prelude'.return (\ o -> o{isDirectObject = v}))
        parse'isIndirectObject
         = P'.try
            (do
               v <- P'.getT "isIndirectObject"
               Prelude'.return (\ o -> o{isIndirectObject = v}))
        parse'isPrepositionObject
         = P'.try
            (do
               v <- P'.getT "isPrepositionObject"
               Prelude'.return (\ o -> o{isPrepositionObject = v}))
        parse'hasTwin
         = P'.try
            (do
               v <- P'.getT "hasTwin"
               Prelude'.return (\ o -> o{hasTwin = v}))
        parse'generic
         = P'.try
            (do
               v <- P'.getT "generic"
               Prelude'.return (\ o -> o{generic = v}))
        parse'isSingleton
         = P'.try
            (do
               v <- P'.getT "isSingleton"
               Prelude'.return (\ o -> o{isSingleton = v}))
        parse'hasBasicDependency
         = P'.try
            (do
               v <- P'.getT "hasBasicDependency"
               Prelude'.return (\ o -> o{hasBasicDependency = v}))
        parse'hasEnhancedDepenedncy
         = P'.try
            (do
               v <- P'.getT "hasEnhancedDepenedncy"
               Prelude'.return (\ o -> o{hasEnhancedDepenedncy = v}))
        parse'hasContextParseTree
         = P'.try
            (do
               v <- P'.getT "hasContextParseTree"
               Prelude'.return (\ o -> o{hasContextParseTree = v}))
        parse'headIndexedWord
         = P'.try
            (do
               v <- P'.getT "headIndexedWord"
               Prelude'.return (\ o -> o{headIndexedWord = v}))
        parse'dependingVerb
         = P'.try
            (do
               v <- P'.getT "dependingVerb"
               Prelude'.return (\ o -> o{dependingVerb = v}))
        parse'headWord
         = P'.try
            (do
               v <- P'.getT "headWord"
               Prelude'.return (\ o -> o{headWord = v}))
        parse'speakerInfo
         = P'.try
            (do
               v <- P'.getT "speakerInfo"
               Prelude'.return (\ o -> o{speakerInfo = v}))
        parse'sentenceWords
         = P'.try
            (do
               v <- P'.getT "sentenceWords"
               Prelude'.return (\ o -> o{sentenceWords = P'.append (sentenceWords o) v}))
        parse'originalSpan
         = P'.try
            (do
               v <- P'.getT "originalSpan"
               Prelude'.return (\ o -> o{originalSpan = P'.append (originalSpan o) v}))
        parse'dependents
         = P'.try
            (do
               v <- P'.getT "dependents"
               Prelude'.return (\ o -> o{dependents = P'.append (dependents o) v}))
        parse'preprocessedTerms
         = P'.try
            (do
               v <- P'.getT "preprocessedTerms"
               Prelude'.return (\ o -> o{preprocessedTerms = P'.append (preprocessedTerms o) v}))
        parse'appositions
         = P'.try
            (do
               v <- P'.getT "appositions"
               Prelude'.return (\ o -> o{appositions = P'.append (appositions o) v}))
        parse'predicateNominatives
         = P'.try
            (do
               v <- P'.getT "predicateNominatives"
               Prelude'.return (\ o -> o{predicateNominatives = P'.append (predicateNominatives o) v}))
        parse'relativePronouns
         = P'.try
            (do
               v <- P'.getT "relativePronouns"
               Prelude'.return (\ o -> o{relativePronouns = P'.append (relativePronouns o) v}))
        parse'listMembers
         = P'.try
            (do
               v <- P'.getT "listMembers"
               Prelude'.return (\ o -> o{listMembers = P'.append (listMembers o) v}))
        parse'belongToLists
         = P'.try
            (do
               v <- P'.getT "belongToLists"
               Prelude'.return (\ o -> o{belongToLists = P'.append (belongToLists o) v}))