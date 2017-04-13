To test this. First you need to change paths in `../shell.nix` 

```
$ nix-shell ../shell.nix
$ ghc test.hs
$ ./test
The second word of the sentence 'add your sentence here!' is your
The second word of the sentence 'it can contain multiple sentences' is can
```


CoreNLP example
```
$ ghc callparser.hs
$ ./callparser
$ ./callparser | tee log.txt
Adding annotator tokenize
No tokenizer type provided. Defaulting to PTBTokenizer.
Adding annotator ssplit
Adding annotator pos
Loading POS tagger from edu/stanford/nlp/models/pos-tagger/english-left3words/english-left3words-distsim.tagger ... done [1.1 sec].
Adding annotator lemma
Adding annotator ner
Loading classifier from edu/stanford/nlp/models/ner/english.all.3class.distsim.crf.ser.gz ... done [2.1 sec].
Loading classifier from edu/stanford/nlp/models/ner/english.muc.7class.distsim.crf.ser.gz ... done [0.9 sec].
Loading classifier from edu/stanford/nlp/models/ner/english.conll.4class.distsim.crf.ser.gz ... done [1.2 sec].
Adding annotator parse
Loading parser from serialized file edu/stanford/nlp/models/srparser/englishSR.ser.gz ... done [14.8 sec].
Adding annotator depparse
Loading depparse model file: edu/stanford/nlp/models/parser/nndep/english_UD.gz ...
PreComputed 99996, Elapsed Time: 20.19 (s)
Initializing dependency parser ... done [27.1 sec].
Adding annotator mention
Using mention detector type: dependency
Adding annotator coref
Loading coref model edu/stanford/nlp/models/coref/statistical/ranking_model.ser.gz ... done [1.1 sec].
Adding annotator natlog
Adding annotator openie
Loading clause splitter from edu/stanford/nlp/models/naturalli/clauseSearcherModel.ser.gz ... done [0.0048 seconds]
===========================
Text: I am a boy.
{
  "sentences": [
    {
      "index": 0,
      "parse": "(ROOT\n  (S\n    (NP (PRP I))\n    (VP (VBP am)\n      (NP (DT a) (NN boy)))\n    (. .)))",
      "basicDependencies": [
        {
          "dep": "ROOT",
          "governor": 0,
          "governorGloss": "ROOT",
          "dependent": 4,
          "dependentGloss": "boy"
        },
        {
          "dep": "nsubj",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 1,
          "dependentGloss": "I"
        },
        {
          "dep": "cop",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 2,
          "dependentGloss": "am"
        },
        {
          "dep": "det",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 3,
          "dependentGloss": "a"
        },
        {
          "dep": "punct",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 5,
          "dependentGloss": "."
        }
      ],
      "enhancedDependencies": [
        {
          "dep": "ROOT",
          "governor": 0,
          "governorGloss": "ROOT",
          "dependent": 4,
          "dependentGloss": "boy"
        },
        {
          "dep": "nsubj",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 1,
          "dependentGloss": "I"
        },
        {
          "dep": "cop",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 2,
          "dependentGloss": "am"
        },
        {
          "dep": "det",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 3,
          "dependentGloss": "a"
        },
        {
          "dep": "punct",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 5,
          "dependentGloss": "."
        }
      ],
      "enhancedPlusPlusDependencies": [
        {
          "dep": "ROOT",
          "governor": 0,
          "governorGloss": "ROOT",
          "dependent": 4,
          "dependentGloss": "boy"
        },
        {
          "dep": "nsubj",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 1,
          "dependentGloss": "I"
        },
        {
          "dep": "cop",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 2,
          "dependentGloss": "am"
        },
        {
          "dep": "det",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 3,
          "dependentGloss": "a"
        },
        {
          "dep": "punct",
          "governor": 4,
          "governorGloss": "boy",
          "dependent": 5,
          "dependentGloss": "."
        }
      ],
      "openie": [
        {
          "subject": "I",
          "subjectSpan": [0, 1],
          "relation": "am",
          "relationSpan": [1, 2],
          "object": "boy",
          "objectSpan": [3, 4]
        }
      ],
      "tokens": [
        {
          "index": 1,
          "word": "I",
          "originalText": "I",
          "lemma": "I",
          "characterOffsetBegin": 0,
          "characterOffsetEnd": 1,
          "pos": "PRP",
          "ner": "O",
          "speaker": "PER0",
          "before": "",
          "after": " "
        },
        {
          "index": 2,
          "word": "am",
          "originalText": "am",
          "lemma": "be",
          "characterOffsetBegin": 2,
          "characterOffsetEnd": 4,
          "pos": "VBP",
          "ner": "O",
          "speaker": "PER0",
          "before": " ",
          "after": " "
        },
        {
          "index": 3,
          "word": "a",
          "originalText": "a",
          "lemma": "a",
          "characterOffsetBegin": 5,
          "characterOffsetEnd": 6,
          "pos": "DT",
          "ner": "O",
          "speaker": "PER0",
          "before": " ",
          "after": " "
        },
        {
          "index": 4,
          "word": "boy",
          "originalText": "boy",
          "lemma": "boy",
          "characterOffsetBegin": 7,
          "characterOffsetEnd": 10,
          "pos": "NN",
          "ner": "O",
          "speaker": "PER0",
          "before": " ",
          "after": ""
        },
        {
          "index": 5,
          "word": ".",
          "originalText": ".",
          "lemma": ".",
          "characterOffsetBegin": 10,
          "characterOffsetEnd": 11,
          "pos": ".",
          "ner": "O",
          "speaker": "PER0",
          "before": "",
          "after": ""
        }
      ]
    }
  ],
  "corefs": {
  }
}
---------------------------
Text: You are a girl.
{
  "sentences": [
    {
      "index": 0,
      "parse": "(ROOT\n  (S\n    (NP (PRP You))\n    (VP (VBP are)\n      (NP (DT a) (NN girl)))\n    (. .)))",
      "basicDependencies": [
        {
          "dep": "ROOT",
          "governor": 0,
          "governorGloss": "ROOT",
          "dependent": 4,
          "dependentGloss": "girl"
        },
        {
          "dep": "nsubj",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 1,
          "dependentGloss": "You"
        },
        {
          "dep": "cop",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 2,
          "dependentGloss": "are"
        },
        {
          "dep": "det",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 3,
          "dependentGloss": "a"
        },
        {
          "dep": "punct",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 5,
          "dependentGloss": "."
        }
      ],
      "enhancedDependencies": [
        {
          "dep": "ROOT",
          "governor": 0,
          "governorGloss": "ROOT",
          "dependent": 4,
          "dependentGloss": "girl"
        },
        {
          "dep": "nsubj",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 1,
          "dependentGloss": "You"
        },
        {
          "dep": "cop",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 2,
          "dependentGloss": "are"
        },
        {
          "dep": "det",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 3,
          "dependentGloss": "a"
        },
        {
          "dep": "punct",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 5,
          "dependentGloss": "."
        }
      ],
      "enhancedPlusPlusDependencies": [
        {
          "dep": "ROOT",
          "governor": 0,
          "governorGloss": "ROOT",
          "dependent": 4,
          "dependentGloss": "girl"
        },
        {
          "dep": "nsubj",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 1,
          "dependentGloss": "You"
        },
        {
          "dep": "cop",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 2,
          "dependentGloss": "are"
        },
        {
          "dep": "det",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 3,
          "dependentGloss": "a"
        },
        {
          "dep": "punct",
          "governor": 4,
          "governorGloss": "girl",
          "dependent": 5,
          "dependentGloss": "."
        }
      ],
      "openie": [
        {
          "subject": "You",
          "subjectSpan": [0, 1],
          "relation": "are",
          "relationSpan": [1, 2],
          "object": "girl",
          "objectSpan": [3, 4]
        }
      ],
      "tokens": [
        {
          "index": 1,
          "word": "You",
          "originalText": "You",
          "lemma": "you",
          "characterOffsetBegin": 0,
          "characterOffsetEnd": 3,
          "pos": "PRP",
          "ner": "O",
          "speaker": "PER0",
          "before": "",
          "after": " "
        },
        {
          "index": 2,
          "word": "are",
          "originalText": "are",
          "lemma": "be",
          "characterOffsetBegin": 4,
          "characterOffsetEnd": 7,
          "pos": "VBP",
          "ner": "O",
          "speaker": "PER0",
          "before": " ",
          "after": " "
        },
        {
          "index": 3,
          "word": "a",
          "originalText": "a",
          "lemma": "a",
          "characterOffsetBegin": 8,
          "characterOffsetEnd": 9,
          "pos": "DT",
          "ner": "O",
          "speaker": "PER0",
          "before": " ",
          "after": " "
        },
        {
          "index": 4,
          "word": "girl",
          "originalText": "girl",
          "lemma": "girl",
          "characterOffsetBegin": 10,
          "characterOffsetEnd": 14,
          "pos": "NN",
          "ner": "O",
          "speaker": "PER0",
          "before": " ",
          "after": ""
        },
        {
          "index": 5,
          "word": ".",
          "originalText": ".",
          "lemma": ".",
          "characterOffsetBegin": 14,
          "characterOffsetEnd": 15,
          "pos": ".",
          "ner": "O",
          "speaker": "PER0",
          "before": "",
          "after": ""
        }
      ]
    }
  ],
  "corefs": {
  }
}
---------------------------
```
