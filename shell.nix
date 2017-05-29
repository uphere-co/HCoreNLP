{ pkgs ? import <nixpkgs> {}
, nlp-types ? <nlp-types>
, textview ? <textview>
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
            directory
            directory-tree
            haskeline
            hprotoc
            lens
            monad-loops
            optparse-applicative
            proto-lens
            proto-lens-protoc
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
    CLASSPATH="${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar";
  '';
}

