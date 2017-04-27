{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module CoreNLPProtos.Token
       (Token(..), word, pos, value, category, before, after, originalText, ner, normalizedNER, lemma, beginChar, endChar,
        utterance, speaker, beginIndex, endIndex, tokenBeginIndex, tokenEndIndex, timexValue, hasXmlContext, xmlContext,
        corefClusterID, answer, headWordIndex, operator, polarity, span, sentiment, quotationIndex, conllUFeatures, coarseTag,
        conllUTokenSpan, conllUMisc, conllUSecondaryDeps, wikipediaEntity, gender, trueCase, trueCaseText, chineseChar, chineseSeg)
       where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified CoreNLPProtos.MapIntString as CoreNLPProtos (MapIntString)
import qualified CoreNLPProtos.MapStringString as CoreNLPProtos (MapStringString)
import qualified CoreNLPProtos.Operator as CoreNLPProtos (Operator)
import qualified CoreNLPProtos.Polarity as CoreNLPProtos (Polarity)
import qualified CoreNLPProtos.Span as CoreNLPProtos (Span)
import qualified CoreNLPProtos.Timex as CoreNLPProtos (Timex)

data Token = Token{_word :: !(P'.Maybe P'.Utf8), _pos :: !(P'.Maybe P'.Utf8), _value :: !(P'.Maybe P'.Utf8),
                   _category :: !(P'.Maybe P'.Utf8), _before :: !(P'.Maybe P'.Utf8), _after :: !(P'.Maybe P'.Utf8),
                   _originalText :: !(P'.Maybe P'.Utf8), _ner :: !(P'.Maybe P'.Utf8), _normalizedNER :: !(P'.Maybe P'.Utf8),
                   _lemma :: !(P'.Maybe P'.Utf8), _beginChar :: !(P'.Maybe P'.Word32), _endChar :: !(P'.Maybe P'.Word32),
                   _utterance :: !(P'.Maybe P'.Word32), _speaker :: !(P'.Maybe P'.Utf8), _beginIndex :: !(P'.Maybe P'.Word32),
                   _endIndex :: !(P'.Maybe P'.Word32), _tokenBeginIndex :: !(P'.Maybe P'.Word32),
                   _tokenEndIndex :: !(P'.Maybe P'.Word32), _timexValue :: !(P'.Maybe CoreNLPProtos.Timex),
                   _hasXmlContext :: !(P'.Maybe P'.Bool), _xmlContext :: !(P'.Seq P'.Utf8),
                   _corefClusterID :: !(P'.Maybe P'.Word32), _answer :: !(P'.Maybe P'.Utf8),
                   _headWordIndex :: !(P'.Maybe P'.Word32), _operator :: !(P'.Maybe CoreNLPProtos.Operator),
                   _polarity :: !(P'.Maybe CoreNLPProtos.Polarity), _span :: !(P'.Maybe CoreNLPProtos.Span),
                   _sentiment :: !(P'.Maybe P'.Utf8), _quotationIndex :: !(P'.Maybe P'.Int32),
                   _conllUFeatures :: !(P'.Maybe CoreNLPProtos.MapStringString), _coarseTag :: !(P'.Maybe P'.Utf8),
                   _conllUTokenSpan :: !(P'.Maybe CoreNLPProtos.Span), _conllUMisc :: !(P'.Maybe P'.Utf8),
                   _conllUSecondaryDeps :: !(P'.Maybe CoreNLPProtos.MapIntString), _wikipediaEntity :: !(P'.Maybe P'.Utf8),
                   _gender :: !(P'.Maybe P'.Utf8), _trueCase :: !(P'.Maybe P'.Utf8), _trueCaseText :: !(P'.Maybe P'.Utf8),
                   _chineseChar :: !(P'.Maybe P'.Utf8), _chineseSeg :: !(P'.Maybe P'.Utf8), _ext'field :: !(P'.ExtField)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Token

instance P'.ExtendMessage Token where
  getExtField = _ext'field
  putExtField e'f msg = msg{_ext'field = e'f}
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_word = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_pos = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_value = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_category = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_before = Prelude'.Just new'Field}) (P'.wireGet 9)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_after = Prelude'.Just new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_originalText = Prelude'.Just new'Field}) (P'.wireGet 9)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_ner = Prelude'.Just new'Field}) (P'.wireGet 9)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_normalizedNER = Prelude'.Just new'Field}) (P'.wireGet 9)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_lemma = Prelude'.Just new'Field}) (P'.wireGet 9)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_beginChar = Prelude'.Just new'Field}) (P'.wireGet 13)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_endChar = Prelude'.Just new'Field}) (P'.wireGet 13)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{_utterance = Prelude'.Just new'Field}) (P'.wireGet 13)
             114 -> Prelude'.fmap (\ !new'Field -> old'Self{_speaker = Prelude'.Just new'Field}) (P'.wireGet 9)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_beginIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{_endIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenBeginIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{_tokenEndIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             154 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_timexValue = P'.mergeAppend (_timexValue old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             168 -> Prelude'.fmap (\ !new'Field -> old'Self{_hasXmlContext = Prelude'.Just new'Field}) (P'.wireGet 8)
             178 -> Prelude'.fmap (\ !new'Field -> old'Self{_xmlContext = P'.append (_xmlContext old'Self) new'Field})
                     (P'.wireGet 9)
             184 -> Prelude'.fmap (\ !new'Field -> old'Self{_corefClusterID = Prelude'.Just new'Field}) (P'.wireGet 13)
             194 -> Prelude'.fmap (\ !new'Field -> old'Self{_answer = Prelude'.Just new'Field}) (P'.wireGet 9)
             208 -> Prelude'.fmap (\ !new'Field -> old'Self{_headWordIndex = Prelude'.Just new'Field}) (P'.wireGet 13)
             218 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_operator = P'.mergeAppend (_operator old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             226 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_polarity = P'.mergeAppend (_polarity old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             234 -> Prelude'.fmap (\ !new'Field -> old'Self{_span = P'.mergeAppend (_span old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             242 -> Prelude'.fmap (\ !new'Field -> old'Self{_sentiment = Prelude'.Just new'Field}) (P'.wireGet 9)
             248 -> Prelude'.fmap (\ !new'Field -> old'Self{_quotationIndex = Prelude'.Just new'Field}) (P'.wireGet 5)
             258 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_conllUFeatures = P'.mergeAppend (_conllUFeatures old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             266 -> Prelude'.fmap (\ !new'Field -> old'Self{_coarseTag = Prelude'.Just new'Field}) (P'.wireGet 9)
             274 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_conllUTokenSpan = P'.mergeAppend (_conllUTokenSpan old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             282 -> Prelude'.fmap (\ !new'Field -> old'Self{_conllUMisc = Prelude'.Just new'Field}) (P'.wireGet 9)
             290 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_conllUSecondaryDeps = P'.mergeAppend (_conllUSecondaryDeps old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             298 -> Prelude'.fmap (\ !new'Field -> old'Self{_wikipediaEntity = Prelude'.Just new'Field}) (P'.wireGet 9)
             410 -> Prelude'.fmap (\ !new'Field -> old'Self{_gender = Prelude'.Just new'Field}) (P'.wireGet 9)
             418 -> Prelude'.fmap (\ !new'Field -> old'Self{_trueCase = Prelude'.Just new'Field}) (P'.wireGet 9)
             426 -> Prelude'.fmap (\ !new'Field -> old'Self{_trueCaseText = Prelude'.Just new'Field}) (P'.wireGet 9)
             434 -> Prelude'.fmap (\ !new'Field -> old'Self{_chineseChar = Prelude'.Just new'Field}) (P'.wireGet 9)
             442 -> Prelude'.fmap (\ !new'Field -> old'Self{_chineseSeg = Prelude'.Just new'Field}) (P'.wireGet 9)
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
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Token\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Token\"}, descFilePath = [\"CoreNLPProtos\",\"Token.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.word\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"word\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.pos\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"pos\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.value\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"value\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.category\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"category\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.before\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"before\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.after\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"after\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.originalText\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"originalText\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.ner\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"ner\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.normalizedNER\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"normalizedNER\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.lemma\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"lemma\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.beginChar\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"beginChar\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.endChar\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"endChar\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.utterance\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"utterance\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.speaker\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"speaker\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.beginIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"beginIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.endIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"endIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.tokenBeginIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"tokenBeginIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.tokenEndIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"tokenEndIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.timexValue\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"timexValue\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 154}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Timex\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Timex\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.hasXmlContext\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"hasXmlContext\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 168}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.xmlContext\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"xmlContext\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 178}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.corefClusterID\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"corefClusterID\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 184}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.answer\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"answer\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 194}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.headWordIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"headWordIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 208}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.operator\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"operator\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 218}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Operator\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Operator\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.polarity\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"polarity\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 28}, wireTag = WireTag {getWireTag = 226}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Polarity\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Polarity\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.span\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"span\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 29}, wireTag = WireTag {getWireTag = 234}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Span\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Span\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.sentiment\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"sentiment\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 30}, wireTag = WireTag {getWireTag = 242}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.quotationIndex\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"quotationIndex\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 248}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUFeatures\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUFeatures\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 258}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.MapStringString\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"MapStringString\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.coarseTag\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"coarseTag\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 266}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUTokenSpan\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUTokenSpan\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 34}, wireTag = WireTag {getWireTag = 274}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.Span\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"Span\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUMisc\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUMisc\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 35}, wireTag = WireTag {getWireTag = 282}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.conllUSecondaryDeps\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"conllUSecondaryDeps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 36}, wireTag = WireTag {getWireTag = 290}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".edu.stanford.nlp.pipeline.MapIntString\", haskellPrefix = [], parentModule = [MName \"CoreNLPProtos\"], baseName = MName \"MapIntString\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.wikipediaEntity\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"wikipediaEntity\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 37}, wireTag = WireTag {getWireTag = 298}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.gender\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"gender\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 51}, wireTag = WireTag {getWireTag = 410}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.trueCase\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"trueCase\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 52}, wireTag = WireTag {getWireTag = 418}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.trueCaseText\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"trueCaseText\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 53}, wireTag = WireTag {getWireTag = 426}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.chineseChar\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"chineseChar\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 54}, wireTag = WireTag {getWireTag = 434}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".edu.stanford.nlp.pipeline.Token.chineseSeg\", haskellPrefix' = [], parentModule' = [MName \"CoreNLPProtos\",MName \"Token\"], baseName' = FName \"chineseSeg\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 55}, wireTag = WireTag {getWireTag = 442}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [(FieldId {getFieldId = 100},FieldId {getFieldId = 255})], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True}"

instance P'.TextType Token where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Token where
  textPut msg
   = do
       P'.tellT "word" (_word msg)
       P'.tellT "pos" (_pos msg)
       P'.tellT "value" (_value msg)
       P'.tellT "category" (_category msg)
       P'.tellT "before" (_before msg)
       P'.tellT "after" (_after msg)
       P'.tellT "originalText" (_originalText msg)
       P'.tellT "ner" (_ner msg)
       P'.tellT "normalizedNER" (_normalizedNER msg)
       P'.tellT "lemma" (_lemma msg)
       P'.tellT "beginChar" (_beginChar msg)
       P'.tellT "endChar" (_endChar msg)
       P'.tellT "utterance" (_utterance msg)
       P'.tellT "speaker" (_speaker msg)
       P'.tellT "beginIndex" (_beginIndex msg)
       P'.tellT "endIndex" (_endIndex msg)
       P'.tellT "tokenBeginIndex" (_tokenBeginIndex msg)
       P'.tellT "tokenEndIndex" (_tokenEndIndex msg)
       P'.tellT "timexValue" (_timexValue msg)
       P'.tellT "hasXmlContext" (_hasXmlContext msg)
       P'.tellT "xmlContext" (_xmlContext msg)
       P'.tellT "corefClusterID" (_corefClusterID msg)
       P'.tellT "answer" (_answer msg)
       P'.tellT "headWordIndex" (_headWordIndex msg)
       P'.tellT "operator" (_operator msg)
       P'.tellT "polarity" (_polarity msg)
       P'.tellT "span" (_span msg)
       P'.tellT "sentiment" (_sentiment msg)
       P'.tellT "quotationIndex" (_quotationIndex msg)
       P'.tellT "conllUFeatures" (_conllUFeatures msg)
       P'.tellT "coarseTag" (_coarseTag msg)
       P'.tellT "conllUTokenSpan" (_conllUTokenSpan msg)
       P'.tellT "conllUMisc" (_conllUMisc msg)
       P'.tellT "conllUSecondaryDeps" (_conllUSecondaryDeps msg)
       P'.tellT "wikipediaEntity" (_wikipediaEntity msg)
       P'.tellT "gender" (_gender msg)
       P'.tellT "trueCase" (_trueCase msg)
       P'.tellT "trueCaseText" (_trueCaseText msg)
       P'.tellT "chineseChar" (_chineseChar msg)
       P'.tellT "chineseSeg" (_chineseSeg msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_word, parse'_pos, parse'_value, parse'_category, parse'_before, parse'_after, parse'_originalText,
                   parse'_ner, parse'_normalizedNER, parse'_lemma, parse'_beginChar, parse'_endChar, parse'_utterance,
                   parse'_speaker, parse'_beginIndex, parse'_endIndex, parse'_tokenBeginIndex, parse'_tokenEndIndex,
                   parse'_timexValue, parse'_hasXmlContext, parse'_xmlContext, parse'_corefClusterID, parse'_answer,
                   parse'_headWordIndex, parse'_operator, parse'_polarity, parse'_span, parse'_sentiment, parse'_quotationIndex,
                   parse'_conllUFeatures, parse'_coarseTag, parse'_conllUTokenSpan, parse'_conllUMisc, parse'_conllUSecondaryDeps,
                   parse'_wikipediaEntity, parse'_gender, parse'_trueCase, parse'_trueCaseText, parse'_chineseChar,
                   parse'_chineseSeg])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_word
         = P'.try
            (do
               v <- P'.getT "word"
               Prelude'.return (\ o -> o{_word = v}))
        parse'_pos
         = P'.try
            (do
               v <- P'.getT "pos"
               Prelude'.return (\ o -> o{_pos = v}))
        parse'_value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{_value = v}))
        parse'_category
         = P'.try
            (do
               v <- P'.getT "category"
               Prelude'.return (\ o -> o{_category = v}))
        parse'_before
         = P'.try
            (do
               v <- P'.getT "before"
               Prelude'.return (\ o -> o{_before = v}))
        parse'_after
         = P'.try
            (do
               v <- P'.getT "after"
               Prelude'.return (\ o -> o{_after = v}))
        parse'_originalText
         = P'.try
            (do
               v <- P'.getT "originalText"
               Prelude'.return (\ o -> o{_originalText = v}))
        parse'_ner
         = P'.try
            (do
               v <- P'.getT "ner"
               Prelude'.return (\ o -> o{_ner = v}))
        parse'_normalizedNER
         = P'.try
            (do
               v <- P'.getT "normalizedNER"
               Prelude'.return (\ o -> o{_normalizedNER = v}))
        parse'_lemma
         = P'.try
            (do
               v <- P'.getT "lemma"
               Prelude'.return (\ o -> o{_lemma = v}))
        parse'_beginChar
         = P'.try
            (do
               v <- P'.getT "beginChar"
               Prelude'.return (\ o -> o{_beginChar = v}))
        parse'_endChar
         = P'.try
            (do
               v <- P'.getT "endChar"
               Prelude'.return (\ o -> o{_endChar = v}))
        parse'_utterance
         = P'.try
            (do
               v <- P'.getT "utterance"
               Prelude'.return (\ o -> o{_utterance = v}))
        parse'_speaker
         = P'.try
            (do
               v <- P'.getT "speaker"
               Prelude'.return (\ o -> o{_speaker = v}))
        parse'_beginIndex
         = P'.try
            (do
               v <- P'.getT "beginIndex"
               Prelude'.return (\ o -> o{_beginIndex = v}))
        parse'_endIndex
         = P'.try
            (do
               v <- P'.getT "endIndex"
               Prelude'.return (\ o -> o{_endIndex = v}))
        parse'_tokenBeginIndex
         = P'.try
            (do
               v <- P'.getT "tokenBeginIndex"
               Prelude'.return (\ o -> o{_tokenBeginIndex = v}))
        parse'_tokenEndIndex
         = P'.try
            (do
               v <- P'.getT "tokenEndIndex"
               Prelude'.return (\ o -> o{_tokenEndIndex = v}))
        parse'_timexValue
         = P'.try
            (do
               v <- P'.getT "timexValue"
               Prelude'.return (\ o -> o{_timexValue = v}))
        parse'_hasXmlContext
         = P'.try
            (do
               v <- P'.getT "hasXmlContext"
               Prelude'.return (\ o -> o{_hasXmlContext = v}))
        parse'_xmlContext
         = P'.try
            (do
               v <- P'.getT "xmlContext"
               Prelude'.return (\ o -> o{_xmlContext = P'.append (_xmlContext o) v}))
        parse'_corefClusterID
         = P'.try
            (do
               v <- P'.getT "corefClusterID"
               Prelude'.return (\ o -> o{_corefClusterID = v}))
        parse'_answer
         = P'.try
            (do
               v <- P'.getT "answer"
               Prelude'.return (\ o -> o{_answer = v}))
        parse'_headWordIndex
         = P'.try
            (do
               v <- P'.getT "headWordIndex"
               Prelude'.return (\ o -> o{_headWordIndex = v}))
        parse'_operator
         = P'.try
            (do
               v <- P'.getT "operator"
               Prelude'.return (\ o -> o{_operator = v}))
        parse'_polarity
         = P'.try
            (do
               v <- P'.getT "polarity"
               Prelude'.return (\ o -> o{_polarity = v}))
        parse'_span
         = P'.try
            (do
               v <- P'.getT "span"
               Prelude'.return (\ o -> o{_span = v}))
        parse'_sentiment
         = P'.try
            (do
               v <- P'.getT "sentiment"
               Prelude'.return (\ o -> o{_sentiment = v}))
        parse'_quotationIndex
         = P'.try
            (do
               v <- P'.getT "quotationIndex"
               Prelude'.return (\ o -> o{_quotationIndex = v}))
        parse'_conllUFeatures
         = P'.try
            (do
               v <- P'.getT "conllUFeatures"
               Prelude'.return (\ o -> o{_conllUFeatures = v}))
        parse'_coarseTag
         = P'.try
            (do
               v <- P'.getT "coarseTag"
               Prelude'.return (\ o -> o{_coarseTag = v}))
        parse'_conllUTokenSpan
         = P'.try
            (do
               v <- P'.getT "conllUTokenSpan"
               Prelude'.return (\ o -> o{_conllUTokenSpan = v}))
        parse'_conllUMisc
         = P'.try
            (do
               v <- P'.getT "conllUMisc"
               Prelude'.return (\ o -> o{_conllUMisc = v}))
        parse'_conllUSecondaryDeps
         = P'.try
            (do
               v <- P'.getT "conllUSecondaryDeps"
               Prelude'.return (\ o -> o{_conllUSecondaryDeps = v}))
        parse'_wikipediaEntity
         = P'.try
            (do
               v <- P'.getT "wikipediaEntity"
               Prelude'.return (\ o -> o{_wikipediaEntity = v}))
        parse'_gender
         = P'.try
            (do
               v <- P'.getT "gender"
               Prelude'.return (\ o -> o{_gender = v}))
        parse'_trueCase
         = P'.try
            (do
               v <- P'.getT "trueCase"
               Prelude'.return (\ o -> o{_trueCase = v}))
        parse'_trueCaseText
         = P'.try
            (do
               v <- P'.getT "trueCaseText"
               Prelude'.return (\ o -> o{_trueCaseText = v}))
        parse'_chineseChar
         = P'.try
            (do
               v <- P'.getT "chineseChar"
               Prelude'.return (\ o -> o{_chineseChar = v}))
        parse'_chineseSeg
         = P'.try
            (do
               v <- P'.getT "chineseSeg"
               Prelude'.return (\ o -> o{_chineseSeg = v}))