{ mkDerivation, aeson, attoparsec, base, bytestring, data-default
, inline-java, jni, jvm, lens, stdenv, text, transformers
, protocol-buffers, protocol-buffers-descriptor
, jdk
, corenlp, corenlp_models
, nlp-types
}:
mkDerivation {
  pname = "HCoreNLP";
  version = "0.1.0.0";
  src = builtins.filterSource
    (path: type: type != "directory" || baseNameOf path != "dist" || baseNameOf path != ".cabal-sandbox")
    ./.;
  preBuild = ''
    export CLASSPATH=${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar
    echo $CLASSPATH
  '';
  libraryHaskellDepends = [
    aeson attoparsec nlp-types base bytestring data-default inline-java jni jvm
    lens text transformers protocol-buffers protocol-buffers-descriptor
  ];
  buildDepends = [ jdk ];
  license = "unknown";
  doHaddock = false;
  passthru = {
    CLASSPATH="${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar";
  };
}
