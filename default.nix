{ mkDerivation, aeson, attoparsec, base, binary, bytestring, containers, data-default, extra
, inline-java, jni, jvm, lens, optparse-applicative, stdenv, text, time, transformers
, protocol-buffers, protocol-buffers-descriptor, yayaml
, jdk
, corenlp, corenlp_models
, nlp-types, HCoreNLP-Proto
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
    aeson attoparsec nlp-types base binary bytestring containers data-default extra inline-java jni jvm
    lens text transformers protocol-buffers protocol-buffers-descriptor HCoreNLP-Proto
  ];
  executableHaskellDepends = [
    bytestring containers data-default jvm lens optparse-applicative protocol-buffers text time
    nlp-types yayaml HCoreNLP-Proto
  ];

  buildDepends = [ jdk ];
  license = "unknown";
  doHaddock = false;
  passthru = {
    CLASSPATH="${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar";
  };
}
