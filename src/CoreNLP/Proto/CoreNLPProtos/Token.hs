{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLP.Proto.CoreNLPProtos.Token (Token(..)) where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified CoreNLP.Proto.CoreNLPProtos.MapIntString as CoreNLPProtos (MapIntString)
import qualified CoreNLP.Proto.CoreNLPProtos.MapStringString as CoreNLPProtos (MapStringString)
import qualified CoreNLP.Proto.CoreNLPProtos.Operator as CoreNLPProtos (Operator)
import qualified CoreNLP.Proto.CoreNLPProtos.Polarity as CoreNLPProtos (Polarity)
import qualified CoreNLP.Proto.CoreNLPProtos.Span as CoreNLPProtos (Span)
import qualified CoreNLP.Proto.CoreNLPProtos.Timex as CoreNLPProtos (Timex)

data Token = Token{word :: !(P'.Maybe P'.Utf8), pos :: !(P'.Maybe P'.Utf8), value :: !(P'.Maybe P'.Utf8),
                   category :: !(P'.Maybe P'.Utf8), before :: !(P'.Maybe P'.Utf8), after :: !(P'.Maybe P'.Utf8),
                   originalText :: !(P'.Maybe P'.Utf8), ner :: !(P'.Maybe P'.Utf8), normalizedNER :: !(P'.Maybe P'.Utf8),
                   lemma :: !(P'.Maybe P'.Utf8), beginChar :: !(P'.Maybe P'.Word32), endChar :: !(P'.Maybe P'.Word32),
                   utterance :: !(P'.Maybe P'.Word32), speaker :: !(P'.Maybe P'.Utf8), beginIndex :: !(P'.Maybe P'.Word32),
                   endIndex :: !(P'.Maybe P'.Word32), tokenBeginIndex :: !(P'.Maybe P'.Word32),
                   tokenEndIndex :: !(P'.Maybe P'.Word32), timexValue :: !(P'.Maybe CoreNLPProtos.Timex),
                   hasXmlContext :: !(P'.Maybe P'.Bool), xmlContext :: !(P'.Seq P'.Utf8), corefClusterID :: !(P'.Maybe P'.Word32),
                   answer :: !(P'.Maybe P'.Utf8), headWordIndex :: !(P'.Maybe P'.Word32),
                   operator :: !(P'.Maybe CoreNLPProtos.Operator), polarity :: !(P'.Maybe CoreNLPProtos.Polarity),
                   span :: !(P'.Maybe CoreNLPProtos.Span), sentiment :: !(P'.Maybe P'.Utf8), quotationIndex :: !(P'.Maybe P'.Int32),
                   conllUFeatures :: !(P'.Maybe CoreNLPProtos.MapStringString), coarseTag :: !(P'.Maybe P'.Utf8),
                   conllUTokenSpan :: !(P'.Maybe CoreNLPProtos.Span), conllUMisc :: !(P'.Maybe P'.Utf8),
                   conllUSecondaryDeps :: !(P'.Maybe CoreNLPProtos.MapIntString), wikipediaEntity :: !(P'.Maybe P'.Utf8),
                   gender :: !(P'.Maybe P'.Utf8), trueCase :: !(P'.Maybe P'.Utf8), trueCaseText :: !(P'.Maybe P'.Utf8),
                   chineseChar :: !(P'.Maybe P'.Utf8), chineseSeg :: !(P'.Maybe P'.Utf8), ext'field :: !(P'.ExtField)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ExtendMessage Token where
  getExtField = ext'field
  putExtField e'f msg = msg{ext'field = e'f}
  validExtRanges msg = P'.extRanges (P'.reflectDescriptorInfo msg)

instance P'.Mergeable Token where
  mergeAppend
   (Token x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24 x'25 x'26
     x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41)
   (Token y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24 y'25 y'26
     y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35 y'36 y'37 y'38 y'39 y'40 y'41)
   = Token (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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

instance P'.Default Token where
  defaultValue
   = Token P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
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

instance P'.Wire Token where
  wireSize ft'
   self'@(Token x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24 x'25
           x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeOpt 1 9 x'7
             + P'.wireSizeOpt 1 9 x'8
             + P'.wireSizeOpt 1 9 x'9
             + P'.wireSizeOpt 1 9 x'10
             + P'.wireSizeOpt 1 13 x'11
             + P'.wireSizeOpt 1 13 x'12
             + P'.wireSizeOpt 1 13 x'13
             + P'.wireSizeOpt 1 9 x'14
             + P'.wireSizeOpt 1 13 x'15
             + P'.wireSizeOpt 2 13 x'16
             + P'.wireSizeOpt 2 13 x'17
             + P'.wireSizeOpt 2 13 x'18
             + P'.wireSizeOpt 2 11 x'19
             + P'.wireSizeOpt 2 8 x'20
             + P'.wireSizeRep 2 9 x'21
             + P'.wireSizeOpt 2 13 x'22
             + P'.wireSizeOpt 2 9 x'23
             + P'.wireSizeOpt 2 13 x'24
             + P'.wireSizeOpt 2 11 x'25
             + P'.wireSizeOpt 2 11 x'26
             + P'.wireSizeOpt 2 11 x'27
             + P'.wireSizeOpt 2 9 x'28
             + P'.wireSizeOpt 2 5 x'29
             + P'.wireSizeOpt 2 11 x'30
             + P'.wireSizeOpt 2 9 x'31
             + P'.wireSizeOpt 2 11 x'32
             + P'.wireSizeOpt 2 9 x'33
             + P'.wireSizeOpt 2 11 x'34
             + P'.wireSizeOpt 2 9 x'35
             + P'.wireSizeOpt 2 9 x'36
             + P'.wireSizeOpt 2 9 x'37
             + P'.wireSizeOpt 2 9 x'38
             + P'.wireSizeOpt 2 9 x'39
             + P'.wireSizeOpt 2 9 x'40
             + P'.wireSizeExtField x'41)
  wirePut ft'
   self'@(Token x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24 x'25
           x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41)
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
             P'.wirePutOpt 34 9 x'4
             P'.wirePutOpt 42 9 x'5
             P'.wirePutOpt 50 9 x'6
             P'.wirePutOpt 58 9 x'7
             P'.wirePutOpt 66 9 x'8
             P'.wirePutOpt 74 9 x'9
             P'.wirePutOpt 82 9 x'10
             P'.wirePutOpt 88 13 x'11
             P'.wirePutOpt 96 13 x'12
             P'.wirePutOpt 104 13 x'13
             P'.wirePutOpt 114 9 x'14
             P'.wirePutOpt 120 13 x'15
             P'.wirePutOpt 128 13 x'16
             P'.wirePutOpt 136 13 x'17
             P'.wirePutOpt 144 13 x'18
             P'.wirePutOpt 154 11 x'19
             P'.wirePutOpt 168 8 x'20
             P'.wirePutRep 178 9 x'21
             P'.wirePutOpt 184 13 x'22
             P'.wirePutOpt 194 9 x'23
             P'.wirePutOpt 208 13 x'24
             P'.wirePutOpt 218 11 x'25
             P'.wirePutOpt 226 11 x'26
             P'.wirePutOpt 234 11 x'27
             P'.wirePutOpt 242 9 x'28
             P'.wirePutOpt 248 5 x'29
             P'.wirePutOpt 258 11 x'30
             P'.wirePutOpt 266 9 x'31
             P'.wirePutOpt 274 11 x'32
             P'.wirePutOpt 282 9 x'33
             P'.wirePutOpt 290 11 x'34
             P'.wirePutOpt 298 9 x'35
             P'.wirePutOpt 410 9 x'36
             P'.wirePutOpt 418 9 x'37
             P'.wirePutOpt 426 9 x'38
             P'.wirePutOpt 434 9 x'39
             P'.wirePutOpt 442 9 x'40
             P'.wirePutExtField x'41
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{word = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{pos = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{value = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{category = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{before = Prelude'.Just new'Field}) (P'.wireGet 9)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{after = Prelude'.Just new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{originalText = Prelude'.Just new'Field}) (P'.wireGet 9)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{ner = Prelude'.Just new'Field}) (P'.wireGet 9)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{normalizedNER = Prelude'.Just new'Field}) (P'.wireGet 9)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{lemma = Prelude'.Just new'Field}) (P'.wireGet 9)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{beginChar = Prelude'.Just new'Field}) (P'.wireGet 13)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{endChar = Prelude'.Just new'Field}) (P'.wireGet 13)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{utterance = Prelude'.Just new'Field}) (P'.wireGet 13)
             114 -> Prelude'.fmap (\ !new'Field -> old'Self{speaker = Prelude'.Just new'Field}) (P'.wireGet 9)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{beginIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{endIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenBeginIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{tokenEndIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             154 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{timexValue = P'.mergeAppend (timexValue old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             168 -> Prelude'.fmap (\ !new'Field -> old'Self{hasXmlContext = Prelude'.Just new'Field}) (P'.wireGet 8)
             178 -> Prelude'.fmap (\ !new'Field -> old'Self{xmlContext = P'.append (xmlContext old'Self) new'Field}) (P'.wireGet 9)
             184 -> Prelude'.fmap (\ !new'Field -> old'Self{corefClusterID = Prelude'.Just new'Field}) (P'.wireGet 13)
             194 -> Prelude'.fmap (\ !new'Field -> old'Self{answer = Prelude'.Just new'Field}) (P'.wireGet 9)
             208 -> Prelude'.fmap (\ !new'Field -> old'Self{headWordIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             218 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{operator = P'.mergeAppend (operator old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             226 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{polarity = P'.mergeAppend (polarity old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             234 -> Prelude'.fmap (\ !new'Field -> old'Self{span = P'.mergeAppend (span old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             242 -> Prelude'.fmap (\ !new'Field -> old'Self{sentiment = Prelude'.Just new'Field}) (P'.wireGet 9)
             248 -> Prelude'.fmap (\ !new'Field -> old'Self{quotationIndex = Prelude'.Just new'Field}) (P'.wireGet 5)
             258 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{conllUFeatures = P'.mergeAppend (conllUFeatures old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             266 -> Prelude'.fmap (\ !new'Field -> old'Self{coarseTag = Prelude'.Just new'Field}) (P'.wireGet 9)
             274 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{conllUTokenSpan = P'.mergeAppend (conllUTokenSpan old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             282 -> Prelude'.fmap (\ !new'Field -> old'Self{conllUMisc = Prelude'.Just new'Field}) (P'.wireGet 9)
             290 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{conllUSecondaryDeps = P'.mergeAppend (conllUSecondaryDeps old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             298 -> Prelude'.fmap (\ !new'Field -> old'Self{wikipediaEntity = Prelude'.Just new'Field}) (P'.wireGet 9)
             410 -> Prelude'.fmap (\ !new'Field -> old'Self{gender = Prelude'.Just new'Field}) (P'.wireGet 9)
             418 -> Prelude'.fmap (\ !new'Field -> old'Self{trueCase = Prelude'.Just new'Field}) (P'.wireGet 9)
             426 -> Prelude'.fmap (\ !new'Field -> old'Self{trueCaseText = Prelude'.Just new'Field}) (P'.wireGet 9)
             434 -> Prelude'.fmap (\ !new'Field -> old'Self{chineseChar = Prelude'.Just new'Field}) (P'.wireGet 9)
             442 -> Prelude'.fmap (\ !new'Field -> old'Self{chineseSeg = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in
                   if Prelude'.or [100 <= field'Number && field'Number <= 255] then P'.loadExtension field'Number wire'Type old'Self
                    else P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Token) Token where
  getVal m' f' = f' m'

instance P'.GPB Token

instance P'.ReflectDescriptor Token where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList
        [10, 18, 26, 34, 42, 50, 58, 66, 74, 82, 88, 96, 104, 114, 120, 128, 136, 144, 154, 168, 178, 184, 194, 208, 218, 226, 234,
         242, 248, 258, 266, 274, 282, 290, 298, 410, 418, 426, 434, 442])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}, descFilePath = [\"CoreNLP\",\"Proto\",\"CoreNLPProtos\",\"Token.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.word\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"word\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.pos\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"pos\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.value\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"value\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.category\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"category\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.before\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"before\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.after\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"after\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.originalText\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"originalText\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.ner\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"ner\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.normalizedNER\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"normalizedNER\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.lemma\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"lemma\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.beginChar\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"beginChar\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.endChar\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"endChar\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.utterance\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"utterance\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.speaker\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"speaker\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.beginIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"beginIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.endIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"endIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.tokenBeginIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"tokenBeginIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.tokenEndIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"tokenEndIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.timexValue\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"timexValue\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 154}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Timex\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Timex\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.hasXmlContext\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"hasXmlContext\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 168}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.xmlContext\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"xmlContext\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 178}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.corefClusterID\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"corefClusterID\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 184}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.answer\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"answer\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 194}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.headWordIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"headWordIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 208}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.operator\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"operator\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 218}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Operator\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Operator\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.polarity\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"polarity\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 28}, wireTag = WireTag {getWireTag = 226}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Polarity\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Polarity\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.span\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"span\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 29}, wireTag = WireTag {getWireTag = 234}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Span\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Span\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.sentiment\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"sentiment\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 30}, wireTag = WireTag {getWireTag = 242}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.quotationIndex\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"quotationIndex\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 248}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUFeatures\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUFeatures\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 258}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.MapStringString\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"MapStringString\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.coarseTag\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"coarseTag\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 266}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUTokenSpan\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUTokenSpan\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 34}, wireTag = WireTag {getWireTag = 274}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Span\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Span\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUMisc\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUMisc\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 35}, wireTag = WireTag {getWireTag = 282}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUSecondaryDeps\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUSecondaryDeps\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 36}, wireTag = WireTag {getWireTag = 290}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.MapIntString\", haskellPrefix = [MName \"CoreNLP\",MName \"Proto\"], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"MapIntString\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.wikipediaEntity\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"wikipediaEntity\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 37}, wireTag = WireTag {getWireTag = 298}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.gender\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"gender\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 51}, wireTag = WireTag {getWireTag = 410}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.trueCase\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"trueCase\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 52}, wireTag = WireTag {getWireTag = 418}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.trueCaseText\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"trueCaseText\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 53}, wireTag = WireTag {getWireTag = 426}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.chineseChar\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"chineseChar\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 54}, wireTag = WireTag {getWireTag = 434}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.chineseSeg\", haskellPrefix' = [MName \"CoreNLP\",MName \"Proto\"], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"chineseSeg\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 55}, wireTag = WireTag {getWireTag = 442}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [(FieldId {getFieldId = 100},FieldId {getFieldId = 255})], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Token where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Token where
  textPut msg
   = do
       P'.tellT "word" (word msg)
       P'.tellT "pos" (pos msg)
       P'.tellT "value" (value msg)
       P'.tellT "category" (category msg)
       P'.tellT "before" (before msg)
       P'.tellT "after" (after msg)
       P'.tellT "originalText" (originalText msg)
       P'.tellT "ner" (ner msg)
       P'.tellT "normalizedNER" (normalizedNER msg)
       P'.tellT "lemma" (lemma msg)
       P'.tellT "beginChar" (beginChar msg)
       P'.tellT "endChar" (endChar msg)
       P'.tellT "utterance" (utterance msg)
       P'.tellT "speaker" (speaker msg)
       P'.tellT "beginIndex" (beginIndex msg)
       P'.tellT "endIndex" (endIndex msg)
       P'.tellT "tokenBeginIndex" (tokenBeginIndex msg)
       P'.tellT "tokenEndIndex" (tokenEndIndex msg)
       P'.tellT "timexValue" (timexValue msg)
       P'.tellT "hasXmlContext" (hasXmlContext msg)
       P'.tellT "xmlContext" (xmlContext msg)
       P'.tellT "corefClusterID" (corefClusterID msg)
       P'.tellT "answer" (answer msg)
       P'.tellT "headWordIndex" (headWordIndex msg)
       P'.tellT "operator" (operator msg)
       P'.tellT "polarity" (polarity msg)
       P'.tellT "span" (span msg)
       P'.tellT "sentiment" (sentiment msg)
       P'.tellT "quotationIndex" (quotationIndex msg)
       P'.tellT "conllUFeatures" (conllUFeatures msg)
       P'.tellT "coarseTag" (coarseTag msg)
       P'.tellT "conllUTokenSpan" (conllUTokenSpan msg)
       P'.tellT "conllUMisc" (conllUMisc msg)
       P'.tellT "conllUSecondaryDeps" (conllUSecondaryDeps msg)
       P'.tellT "wikipediaEntity" (wikipediaEntity msg)
       P'.tellT "gender" (gender msg)
       P'.tellT "trueCase" (trueCase msg)
       P'.tellT "trueCaseText" (trueCaseText msg)
       P'.tellT "chineseChar" (chineseChar msg)
       P'.tellT "chineseSeg" (chineseSeg msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'word, parse'pos, parse'value, parse'category, parse'before, parse'after, parse'originalText, parse'ner,
                   parse'normalizedNER, parse'lemma, parse'beginChar, parse'endChar, parse'utterance, parse'speaker,
                   parse'beginIndex, parse'endIndex, parse'tokenBeginIndex, parse'tokenEndIndex, parse'timexValue,
                   parse'hasXmlContext, parse'xmlContext, parse'corefClusterID, parse'answer, parse'headWordIndex, parse'operator,
                   parse'polarity, parse'span, parse'sentiment, parse'quotationIndex, parse'conllUFeatures, parse'coarseTag,
                   parse'conllUTokenSpan, parse'conllUMisc, parse'conllUSecondaryDeps, parse'wikipediaEntity, parse'gender,
                   parse'trueCase, parse'trueCaseText, parse'chineseChar, parse'chineseSeg])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'word
         = P'.try
            (do
               v <- P'.getT "word"
               Prelude'.return (\ o -> o{word = v}))
        parse'pos
         = P'.try
            (do
               v <- P'.getT "pos"
               Prelude'.return (\ o -> o{pos = v}))
        parse'value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{value = v}))
        parse'category
         = P'.try
            (do
               v <- P'.getT "category"
               Prelude'.return (\ o -> o{category = v}))
        parse'before
         = P'.try
            (do
               v <- P'.getT "before"
               Prelude'.return (\ o -> o{before = v}))
        parse'after
         = P'.try
            (do
               v <- P'.getT "after"
               Prelude'.return (\ o -> o{after = v}))
        parse'originalText
         = P'.try
            (do
               v <- P'.getT "originalText"
               Prelude'.return (\ o -> o{originalText = v}))
        parse'ner
         = P'.try
            (do
               v <- P'.getT "ner"
               Prelude'.return (\ o -> o{ner = v}))
        parse'normalizedNER
         = P'.try
            (do
               v <- P'.getT "normalizedNER"
               Prelude'.return (\ o -> o{normalizedNER = v}))
        parse'lemma
         = P'.try
            (do
               v <- P'.getT "lemma"
               Prelude'.return (\ o -> o{lemma = v}))
        parse'beginChar
         = P'.try
            (do
               v <- P'.getT "beginChar"
               Prelude'.return (\ o -> o{beginChar = v}))
        parse'endChar
         = P'.try
            (do
               v <- P'.getT "endChar"
               Prelude'.return (\ o -> o{endChar = v}))
        parse'utterance
         = P'.try
            (do
               v <- P'.getT "utterance"
               Prelude'.return (\ o -> o{utterance = v}))
        parse'speaker
         = P'.try
            (do
               v <- P'.getT "speaker"
               Prelude'.return (\ o -> o{speaker = v}))
        parse'beginIndex
         = P'.try
            (do
               v <- P'.getT "beginIndex"
               Prelude'.return (\ o -> o{beginIndex = v}))
        parse'endIndex
         = P'.try
            (do
               v <- P'.getT "endIndex"
               Prelude'.return (\ o -> o{endIndex = v}))
        parse'tokenBeginIndex
         = P'.try
            (do
               v <- P'.getT "tokenBeginIndex"
               Prelude'.return (\ o -> o{tokenBeginIndex = v}))
        parse'tokenEndIndex
         = P'.try
            (do
               v <- P'.getT "tokenEndIndex"
               Prelude'.return (\ o -> o{tokenEndIndex = v}))
        parse'timexValue
         = P'.try
            (do
               v <- P'.getT "timexValue"
               Prelude'.return (\ o -> o{timexValue = v}))
        parse'hasXmlContext
         = P'.try
            (do
               v <- P'.getT "hasXmlContext"
               Prelude'.return (\ o -> o{hasXmlContext = v}))
        parse'xmlContext
         = P'.try
            (do
               v <- P'.getT "xmlContext"
               Prelude'.return (\ o -> o{xmlContext = P'.append (xmlContext o) v}))
        parse'corefClusterID
         = P'.try
            (do
               v <- P'.getT "corefClusterID"
               Prelude'.return (\ o -> o{corefClusterID = v}))
        parse'answer
         = P'.try
            (do
               v <- P'.getT "answer"
               Prelude'.return (\ o -> o{answer = v}))
        parse'headWordIndex
         = P'.try
            (do
               v <- P'.getT "headWordIndex"
               Prelude'.return (\ o -> o{headWordIndex = v}))
        parse'operator
         = P'.try
            (do
               v <- P'.getT "operator"
               Prelude'.return (\ o -> o{operator = v}))
        parse'polarity
         = P'.try
            (do
               v <- P'.getT "polarity"
               Prelude'.return (\ o -> o{polarity = v}))
        parse'span
         = P'.try
            (do
               v <- P'.getT "span"
               Prelude'.return (\ o -> o{span = v}))
        parse'sentiment
         = P'.try
            (do
               v <- P'.getT "sentiment"
               Prelude'.return (\ o -> o{sentiment = v}))
        parse'quotationIndex
         = P'.try
            (do
               v <- P'.getT "quotationIndex"
               Prelude'.return (\ o -> o{quotationIndex = v}))
        parse'conllUFeatures
         = P'.try
            (do
               v <- P'.getT "conllUFeatures"
               Prelude'.return (\ o -> o{conllUFeatures = v}))
        parse'coarseTag
         = P'.try
            (do
               v <- P'.getT "coarseTag"
               Prelude'.return (\ o -> o{coarseTag = v}))
        parse'conllUTokenSpan
         = P'.try
            (do
               v <- P'.getT "conllUTokenSpan"
               Prelude'.return (\ o -> o{conllUTokenSpan = v}))
        parse'conllUMisc
         = P'.try
            (do
               v <- P'.getT "conllUMisc"
               Prelude'.return (\ o -> o{conllUMisc = v}))
        parse'conllUSecondaryDeps
         = P'.try
            (do
               v <- P'.getT "conllUSecondaryDeps"
               Prelude'.return (\ o -> o{conllUSecondaryDeps = v}))
        parse'wikipediaEntity
         = P'.try
            (do
               v <- P'.getT "wikipediaEntity"
               Prelude'.return (\ o -> o{wikipediaEntity = v}))
        parse'gender
         = P'.try
            (do
               v <- P'.getT "gender"
               Prelude'.return (\ o -> o{gender = v}))
        parse'trueCase
         = P'.try
            (do
               v <- P'.getT "trueCase"
               Prelude'.return (\ o -> o{trueCase = v}))
        parse'trueCaseText
         = P'.try
            (do
               v <- P'.getT "trueCaseText"
               Prelude'.return (\ o -> o{trueCaseText = v}))
        parse'chineseChar
         = P'.try
            (do
               v <- P'.getT "chineseChar"
               Prelude'.return (\ o -> o{chineseChar = v}))
        parse'chineseSeg
         = P'.try
            (do
               v <- P'.getT "chineseSeg"
               Prelude'.return (\ o -> o{chineseSeg = v}))