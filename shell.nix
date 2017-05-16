{ pkgs ? import <nixpkgs> {}
, nlp-types
, textview
, uphere-nix-overlay
}:

with pkgs;

let
  inline-java-src = fetchgit {
    url = "git://github.com/wavewave/inline-java.git";
    rev = "593cdf3a02a866c6822539c0e89adc8ed913a9ba";
    sha256 = "1xngx5i7gpg4h33w6iznrphd1ji0f8dmf5lb5awsnxp72kszvqi5";
  };
  
  corenlp = srcOnly {
    name = "corenlp-20161031";
    src = fetchzip {
      url = "http://nlp.stanford.edu/software/stanford-corenlp-full-2016-10-31.zip";
      sha256 = "0lm4rhvhfi54y01ad40g3v9qdw5qk5982fqfa465x2s9g7fxknmv";
    };
  };
  corenlp_models = fetchurl {
    url = "http://nlp.stanford.edu/software/stanford-english-corenlp-2016-10-31-models.jar";
    sha256 = "1jl86fgqcbrhmp000id705wx131j4zcmm70q7pprgj5zyjp32zxm";
  };

  config1 = import (uphere-nix-overlay + "/nix/haskell-modules/configuration-ghc-8.0.x.nix") { inherit pkgs; };
  config2 =
    self: super: {
      "nlp-types" = self.callPackage (import nlp-types) {};
      "textview" = self.callPackage (import textview) {};

      "lens-labels" = self.callPackage
        ({ mkDerivation, base, ghc-prim, stdenv }:
          mkDerivation {
            pname = "lens-labels";
            version = "0.1.0.1";
            #src = ./.;
            libraryHaskellDepends = [ base ghc-prim ];
            homepage = "https://github.com/google/proto-lens";
            description = "Integration of lenses with OverloadedLabels";
            license = stdenv.lib.licenses.bsd3;
          }) {};
          
      "proto-lens" = self.callPackage
        ({ mkDerivation, attoparsec, base, bytestring, containers
          , data-default-class, lens-family, parsec, pretty, stdenv, text
          , transformers, void
          }:
          mkDerivation {
            pname = "proto-lens";
            version = "0.2.0.1";
            #src = ./.;
            libraryHaskellDepends = [
              attoparsec base bytestring containers data-default-class
              lens-family parsec pretty text transformers void
            ];
            homepage = "https://github.com/google/proto-lens";
            description = "A lens-based implementation of protocol buffers in Haskell";
            license = stdenv.lib.licenses.bsd3;
          }) {};
          
      "proto-lens-descriptors" = self.callPackage
        ({ mkDerivation, base, bytestring, containers, data-default-class
          , lens-family, lens-labels, proto-lens, stdenv, text
          }:
          mkDerivation {
            pname = "proto-lens-descriptors";
            version = "0.2.0.1";
            #src = ./.;
            libraryHaskellDepends = [
              base bytestring containers data-default-class lens-family
              lens-labels proto-lens text
            ];
            description = "Protocol buffers for describing the definitions of messages";
            license = stdenv.lib.licenses.bsd3;
          }) {};


      "proto-lens-protoc" = self.callPackage
      ({ mkDerivation, base, bytestring, Cabal, containers
       , data-default-class, directory, filepath, haskell-src-exts
        , lens-family, lens-labels, process, proto-lens
        , proto-lens-descriptors, stdenv, text
        }:
        mkDerivation {
          pname = "proto-lens-protoc";
          version = "0.2.0.1";
          #src = ;
          isLibrary = true;
          isExecutable = true;
          libraryHaskellDepends = [
            base bytestring Cabal containers data-default-class directory
            filepath haskell-src-exts lens-family lens-labels process
            proto-lens proto-lens-descriptors text
          ];
          executableHaskellDepends = [
            base bytestring containers data-default-class filepath
            haskell-src-exts lens-family proto-lens proto-lens-descriptors text
          ];
          description = "Protocol buffer compiler for the proto-lens library";
          license = stdenv.lib.licenses.bsd3;
        }) {};

      "haskell-src-exts" = self.callPackage
        ({ mkDerivation, array, base, containers, cpphs, directory, filepath
          , ghc-prim, happy, mtl, pretty, pretty-show, smallcheck, stdenv
          , syb, tasty, tasty-golden, tasty-smallcheck
          }:
          mkDerivation {
            pname = "haskell-src-exts";
            version = "1.17.1";
            #src = ./.;
            libraryHaskellDepends = [ array base cpphs ghc-prim pretty ];
            libraryToolDepends = [ happy ];
            testHaskellDepends = [
              base containers directory filepath mtl pretty-show smallcheck syb
              tasty tasty-golden tasty-smallcheck
            ];
            homepage = "https://github.com/haskell-suite/haskell-src-exts";
            description = "Manipulating Haskell source: abstract syntax, lexer, parser, and pretty-printer";
            license = stdenv.lib.licenses.bsd3;
            doCheck = false;
          }) {};
  
      hlint = haskell.lib.overrideCabal super.hlint (drv: {
        version = "1.9.35";
        sha256 = "12ksgnlp14c9xkz6zzwnkivzs4ch0lv93h1fw4p8d83pvkd8jqjy";
      });
      "inline-java" = self.callPackage
        ({ mkDerivation, base, binary, bytestring, Cabal, containers
         , directory, distributed-closure, filepath, ghc-heap-view, hspec
         , inline-c, jni, jvm, language-java, process, singletons, stdenv
         , syb, template-haskell, temporary, text, thread-local-storage
         , vector
         , jdk
         }:
         mkDerivation {
           pname = "inline-java";
           version = "0.6.2";
           src = "${inline-java-src}";
           libraryHaskellDepends = [
             base binary bytestring Cabal containers directory
             distributed-closure filepath ghc-heap-view inline-c jni jvm
             language-java process singletons syb template-haskell temporary
             text thread-local-storage vector
           ];
           testHaskellDepends = [
             base bytestring hspec jni jvm singletons text
           ];
           buildDepends = [ jdk ];
           homepage = "http://github.com/tweag/inline-java#readme";
           description = "Java interop via inline Java code in Haskell modules";
           license = stdenv.lib.licenses.bsd3;
         }) { jdk = pkgs.jdk; };

      "jvm" = self.callPackage
        ({ mkDerivation, base, bytestring, distributed-closure, hspec, jni
         , singletons, stdenv, text, vector
         , jdk
         }:
         mkDerivation {
           pname = "jvm";
           version = "0.2.0";
           src = "${inline-java-src}/jvm";
           libraryHaskellDepends = [
             base bytestring distributed-closure jni singletons text vector
           ];
           testHaskellDepends = [ base bytestring hspec text ];
           buildDepends = [ jdk ];           
           #doCheck = false;
           homepage = "http://github.com/tweag/inline-java/tree/master/jvm#readme";
           description = "Call JVM methods from Haskell";
           license = stdenv.lib.licenses.bsd3;
         }) { jdk = pkgs.jdk; };

      "jni" = self.callPackage
        ({ mkDerivation, base, bytestring, choice, containers, inline-c
         , singletons, thread-local-storage
         , cpphs, jdk
         }:
         mkDerivation {
           pname = "jni";
           src = "${inline-java-src}/jni";
           version = "0.3.0";
           libraryHaskellDepends = [
             base bytestring choice containers inline-c singletons thread-local-storage
           ];
           setupHaskellDepends = [ cpphs ];
           configureFlags = ["--extra-lib-dirs=${jdk.jre}/lib/openjdk/jre/lib/amd64/server"]; 
           librarySystemDepends = [ jdk ];
           homepage = "https://github.com/tweag/inline-java/tree/master/jni#readme";
           description = "Complete JNI raw bindings";
           license = stdenv.lib.licenses.bsd3;
           hydraPlatforms = stdenv.lib.platforms.none;
         }) {jdk = pkgs.jdk;};
  };

  myhaskellpkgs = haskell.packages.ghc802.override {
    overrides = self: super: config1 self super // config2 self super;
  }; 

  hsenv = myhaskellpkgs.ghcWithPackages (p: with p; [
            inline-java
            aeson
            attoparsec
            cabal-install
            data-default
            haskeline
            hprotoc
            lens
            monad-loops
            proto-lens
            proto-lens-protoc
            protocol-buffers
            template-haskell
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
    CLASSPATH="${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar";
  '';
}

