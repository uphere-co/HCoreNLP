{ mkDerivation, base, lens, protocol-buffers
, protocol-buffers-descriptor, stdenv
}:
mkDerivation {
  pname = "HCoreNLP-Proto";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base lens protocol-buffers protocol-buffers-descriptor
  ];
  doHaddock = false;
  license = stdenv.lib.licenses.unfree;
}
