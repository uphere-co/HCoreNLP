{ pkgs ? import <nixpkgs> {}
, nlp-types ? <nlp-types>
, textview ? <textview>
, wiki-ner ? <wiki-ner>
, uphere-nix-overlay ? <uphere-nix-overlay>
}:

with pkgs;

let
  res_corenlp = import (uphere-nix-overlay + "/nix/linguistic-resources/corenlp.nix") {
    inherit fetchurl fetchzip srcOnly;
  };
  corenlp = res_corenlp.corenlp;
  corenlp_models = res_corenlp.corenlp_models;
  config1 = import (uphere-nix-overlay + "/nix/haskell-modules/configuration-ghc-8.0.x.nix") { inherit pkgs; };
  config2 =
    self: super: {
      "nlp-types" = self.callPackage (import nlp-types) {};
      "textview" = self.callPackage (import textview) {};
      "HCoreNLP-Proto" = self.callPackage ./HCoreNLP-Proto {};  
  };

  myhaskellpkgs = haskell.packages.ghc802.override {
    overrides = self: super: config1 self super // config2 self super;
  }; 

  hsenv = myhaskellpkgs.ghcWithPackages (p: with p; [
            inline-java
            aeson
            attoparsec
            binary
            cabal-install
            data-default
            directory
            directory-tree
            extra
            haskeline
            #hprotoc
            lens
            monad-loops
            optparse-applicative
            protocol-buffers
            template-haskell
            p.HCoreNLP-Proto
            p.nlp-types
            p.textview
            yaml
            yayaml
          ]);

in

stdenv.mkDerivation {
  name = "corenlp-dev";
  buildInputs = [ hsenv jdk protobuf];
  shellHook = ''
    export CLASSPATH="${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar:${hsenv}/share/x86_64-linux-ghc-8.0.2/HCoreNLP-0.1.0.0/HCoreNLPProto.jar";
     PS1="\n\[\033[0;36m\][\u@\h.devel:\w]\$\[\033[0m\] ";
  '';
}

