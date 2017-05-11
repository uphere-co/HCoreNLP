{ mkDerivation, aeson, attoparsec, base, bytestring, data-default
, inline-java, jni, jvm, lens, stdenv, text, transformers
, protocol-buffers, protocol-buffers-descriptor
, jdk
, corenlp, corenlp_models
, autoencode
}:
mkDerivation {
  pname = "HCoreNLP";
  version = "0.1.0.0";
  src = ./.;
  preBuild = ''
    export CLASSPATH=${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar
    echo $CLASSPATH
  '';
  libraryHaskellDepends = [
    aeson attoparsec autoencode base bytestring data-default inline-java jni jvm
    lens text transformers protocol-buffers protocol-buffers-descriptor
  ];
  buildDepends = [ jdk ];
  license = "unknown";
  doHaddock = false;
  passthru = {
    CLASSPATH="${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar";
  };
}
