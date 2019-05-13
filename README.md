# Dictionary/Thesaurus
Write a program to provide dictionary and thesaurus functionality. The dictionary should consist of unique words where each word has exactly one meaning. Each word may have any number of synonyms.

## Methods
+ Add a word and its meaning to the dictionary.
+ Add a synonym to a word in the dictionary. Both the synonym and the word should already be present in the dictionary.
+ Look up the meaning of a word from the dictionary.
+ Look up the synonyms of a word from the dictionary.
+ In addition, synonyms should be considered both commutative and transitive

### For clarity:
+ commutative: associations are reversible; if cold is a synonym of chilly, then chilly is also a synonym of cold

+ transitive: associations are transferable; if cold is synonymous with chilly and chilly is synonymous with freezing, then cold is synonymous with freezing

## IO Format:
Your program should accept as an argument the path to a file containing input commands, one per line, as described below.  Output should be written to stdout, and only done so on on read operations (lookupWord, lookupSynonyms).

### Input: (operation, parameters)
+ add_word:word1:definition1
+ add_word:word2:definition2
+ add_word:word3:definition3
+ add_synonym:word1:word2
+ add_synonym:word1:word3
+ look_up_word:word1
+ look_up_synonyms:word1

### Output: (to stdout)
+ word1:definition1
+ word1:word2,word3

You can assume that colons will only be used as separators, and will not be spliced into either words or definitions. Be aware that the example above is not the full test suite, but rather an example of the input structure your program should consume. Remember that the emphasis is on the data structure.

## Suggestions:
+ Structure the main functionality which solves the problem as a library.
+ Provide a driver program (main) which performs all I/O and calls your library's API.
+ Design the data structure(s) first.
+ Unit Tests are strongly recommended.

## Setup
Navigate to project directory and run the command:
`bundle install`

To run unit tests, run the command (in project directory):
`bundle exec rspec`

To run main file:
`ruby test.rb`