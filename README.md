HCoreNLP: Haskell CoreNLP binding using inline-java

```
$ nix-shell shell.nix --argstr uphere-nix-overlay (uphere-nix-overlay) --argstr autoencode (autoencocde) --argstr symbolic (symbolic)
$ cabal sandbox init
$ cabal install
$ cabal exec -- ghc test/callparser.hs
$ ./test/callparser
```

`(uphere-nix-overlay)`, `(autoencode)` and `(symbolic)` mean the corresponding source directories.
