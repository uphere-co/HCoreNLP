HCoreNLP: Haskell CoreNLP binding using inline-java

We have the following examples in `test` directory:

* callparser: call CoreNLP parser example 
* sutime: Temporal expression tagging example
* proto: decode/encode the CoreNLP result from/to CoreNLP protobuf format 


```
$ nix-shell shell.nix --argstr uphere-nix-overlay (uphere-nix-overlay) --argstr autoencode (autoencocde) --argstr symbolic (symbolic)
$ cabal sandbox init
$ cabal install
$ cabal exec -- ghc test/callparser.hs
$ ./test/callparser
```

`(uphere-nix-overlay)`, `(autoencode)` and `(symbolic)` mean the corresponding source directories.

`sutime` and `proto` can be built in the same way.