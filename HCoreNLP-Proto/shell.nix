{ pkgs ? import <nixpkgs> {}
, uphere-nix-overlay ? <uphere-nix-overlay>
}:

with pkgs;

let
  config1 = import (uphere-nix-overlay + "/nix/haskell-modules/configuration-ghc-8.0.x.nix") { inherit pkgs; };
  config2 =
    self: super: {
      
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
            aeson
            attoparsec
            cabal-install
            data-default
            hprotoc
            lens
            monad-loops
            optparse-applicative
            protocol-buffers
            template-haskell
          ]);

in

stdenv.mkDerivation {
  name = "corenlp-dev";
  buildInputs = [ hsenv jdk protobuf];
  shellHook = ''
  '';
}

