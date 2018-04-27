{ revision }:

with revision;

let pkgs0 = import nixpkgs { config.allowUnfree = true; };

    pkgs = import pkgs0.path {
                overlays = [ (self: super: {
                               libsvm = import (uphere-nix-overlay + "/nix/cpp-modules/libsvm/default.nix") { inherit (self) stdenv fetchurl; };
                             })
                           ];
              };
in

with pkgs;

let
  res_corenlp = import (uphere-nix-overlay + "/nix/linguistic-resources/corenlp.nix") {
    inherit fetchurl fetchzip srcOnly;
  };
  corenlp = res_corenlp.corenlp;
  corenlp_models = res_corenlp.corenlp_models;

  hsconfig = lib.callPackageWith (pkgs//revision) (uphere-nix-overlay + "/nix/haskell-modules/configuration-semantic-parser-api.nix") {
    inherit corenlp corenlp_models;
    fasttext = null;
    haskellLib = haskell.lib;
  };

  newHaskellPackages = haskellPackages.override { overrides = hsconfig; };

  hsenv = newHaskellPackages.ghcWithPackages (p: with p; [
            alex
            haskell-src-exts
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
            hprotoc
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
    export CLASSPATH="${corenlp_models}:${corenlp}/stanford-corenlp-3.7.0.jar:${corenlp}/protobuf.jar:${corenlp}/joda-time.jar:${corenlp}/jollyday.jar:${hsenv}/share/x86_64-linux-ghc-8.2.2/HCoreNLP-0.1.0.0/HCoreNLPProto.jar";
     PS1="\n\[\033[0;36m\][\u@\h.devel:\w]\$\[\033[0m\] ";
  '';
}
