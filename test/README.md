To test this. First you need to change paths in `../shell.nix` 

```
$ nix-shell ../shell.nix
$ ghc test.hs
$ ./test
The second word of the sentence 'add your sentence here!' is your
The second word of the sentence 'it can contain multiple sentences' is can
```
