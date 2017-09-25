HCoreNLP: Haskell CoreNLP binding using inline-java

We have the following examples in `test` directory:

* callparser: call CoreNLP parser example 
* sutime: Temporal expression tagging example
* proto: decode/encode the CoreNLP result from/to CoreNLP protobuf format 


```
# Update dependent libraries
[uphere-nix-overlay]$ git pull origin master
[nlp-types]$ git pull origin master
$ nix-shell shell.nix --arg pkgs "import $HOME/repo/srcc/nixpkgs {}" --max-jobs 20 --cores 20
# Or
$ nix-shell shell.nix --argstr uphere-nix-overlay (uphere-nix-overlay) --argstr textview (textview) --argstr nlp-types (nlp-types)
$ cabal sandbox init
$ cabal install
$ export CLASSPATH+=":.cabal-sandbox/share/x86_64-linux-ghc-8.0.2/HCoreNLP-0.1.0.0/HCoreNLPProto.jar"
$ cabal exec -- ghc test/callparser.hs
$ ./test/callparser

#Or Run it with the interpreter
#$ cabal sandbox init
$ cabal install
$ cabal exec -- runhaskell app/annotate.hs
# Extract POS tags only:
$ cabal exec -- runhaskell app/annotate.hs -f input.txt -p
# Compiled one is faster:
$ cabal build annotate
$ ./dist/build/annotate/annotate -f input.txt -p
```

`(uphere-nix-overlay)`, `(textview)` and `(nlp-types)` mean the corresponding source directories.

`sutime` and `proto` can be built in the same way.

CoreNLP data type from Protocol Buffers
---------------------------------------

CoreNLP can serialize its result to protocol buffers data format. We use Haskell protocol-buffers library
for encoding/decoding the CoreNLP results. CoreNLPProtos.* modules are generated from hprotoc which is a
subproject of the protocol-buffers project. The command needed for it was
```
$ hprotoc --lenses CoreNLP.proto
```
