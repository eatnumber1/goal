# g()('al')

`g()('al')` is a challenge whereby you need to write in as many languages as
possible code which enables the code `g()('al')` to return the string "goal",
the code `g()()('al')` to return the string "gooal", the code `g()()()('al')`
return the string "goooal", etc.

`g()('al')` is the creation of [acruikshank] who originally posed it as a
[functional programming challenge][carbonfive-challenge]. Extensive stubbornness
and misinterpretation led to its current form.

## Rules
1.   __You are encouraged to break the rules, cleverly.__
2.   When executed, the solution must print "goal" with sufficient o's to
     demonstrate the program's functionality.
11.  The code `g()('al')` must appear in the source.
  1.   `g()('al')` must not be a string literal.
  2.   `'al'` must be a string, or your language's equivalent thereof. You may
       use your language's standard method of creating a string (e.x. C should
       use `"`, ruby may use either `"` or `'`).
  12.  `g()('al')` must be a valid [rvalue] if applicable in your language.
7.   `g()('al')` may not print the string. If returning a string cannot be done
     in your language, you should submit rationale as to why this is impossible
     for a solution which prints a string to be accepted.
642. You must be able to insert an arbitrary number of `()` calls without
     modification to your solution. Therefore solutions like
     [this][c-limited-calls] are incorrect.
14. `g('al')` must return `"gal"`.

If you have a solution that is close, but does not meet these rules, submit it
anyway. A close and interesting solution is better than no solution.

### Previous Solutions
The more exciting solutions are original, not applying techniques that have
already been discovered. The following broadly applicable techniques have
already been discovered:

 * [Self-modifying code][c-self-modify]
 * [Aborting early][sh-abort-early]
 * [Human language][eng-soln]

## Languages

|               | Solved                 | Incomplete            | Improbable              |
|:-------------:|:----------------------:|:---------------------:|:-----------------------:|
| Brainfuck     |                        | [&bull;][bf-soln]     |                         |
| C             | [&bull;][c-soln]       |                       |                         |
| C#            | [&bull;][cs-soln]      |                       |                         |
| C++           | [&bull;][c++-soln]     |                       |                         |
| Clojure       | [&bull;][clojure-soln] |                       |                         |
| Common Lisp   | [&bull;][clisp-soln]   |                       |                         |
| D             | [&bull;][d-soln]       |                       |                         |
| English       | [&bull;][eng-soln]     |                       |                         |
| Go            | [&bull;][go-soln]      |                       |                         |
| Groovy        | [&bull;][groovy-soln]  |                       |                         |
| Haskell       | [&bull;][hs-soln]      |                       |                         |
| Java          |                        |                       | [&bull;][java-non-soln] |
| JavaScript    | [&bull;][js-soln]      |                       |                         |
| Julia         | [&bull;][jl-soln]      |                       |                         |
| Lua           | [&bull;][lua-soln]     |                       |                         |
| Nimrod        | [&bull;][nim-soln]     |                       |                         |
| OCaml         | [&bull;][ocaml-soln]   |                       |                         |
| Objective-J   | [&bull;][obj-j-soln]   |                       |                         |
| PHP           |                        |                       | [&bull;][php-non-soln]  |
| Perl          | [&bull;][perl-soln]    |                       |                         |
| Perl 6        | [&bull;][perl6-soln]   |                       |                         |
| Python        | [&bull;][py-soln]      |                       |                         |
| R             | [&bull;][r-soln]       |                       |                         |
| Regexp        |                        | [&bull;][regexp-soln] |                         |
| Ruby          | [&bull;][rb-soln]      |                       |                         |
| Scala         | [&bull;][scala-soln]   |                       |                         |
| Scheme        | [&bull;][scm-soln]     |                       |                         |
| Sed           | [&bull;][sed-soln]     |                       |                         |
| Shell         |                        | [&bull;][sh-soln]     |                         |
| ZSH           | [&bull;][zsh-soln]     |                       |                         |

Help out, add some more languages!

## g()('lf')
Lets play [golf]! Submit a pull-request with a shorter solution for an already
solved language and you can get the title of shortest, as shown in that
language's [README][c-sharp-readme].

Note: I'm not done making READMEs for all the languages yet. Don't let that stop
you!

## Editor's Picks
These are some of the editor's favorite submissions:

 * C [solution][c-ed-pick] by [tolmasky]
 * C++ [solution][c++-ed-pick] by [derrickturk]
 * Haskell [solution][hs-ed-pick] by [capicue] with an [explanation][hs-explain]
 * Nimrod [solution][nim-ed-pick] by [dom96]
 * Perl [solution][perl-ed-pick] by [worr] with an [explanation][perl-explain]
 * SH incomplete [solution][sh-ed-pick] by [csandreasen]
 * ZSH [solution][zsh-ed-pick] by [o11c] with an [explanation][zsh-explain]

## Editor's Note
This got A LOT more popular than I expected. At the moment, there are 37 pull
requests that I need to look at. Please be patient as it may take me a few days
to get through them all.

It would be super helpful if people wanted to help out by:

1. Running other's submissions and confirming that they work correctly.
3. Checking that they follow all the rules.
4. Calling out particularly clever solutions.

Just leave a comment on the pull request with your findings and I'll see it.
Thanks!

[//]: # (Solution URLs)
[bf-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/brainfuck
[c++-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/c++
[c-soln]:       https://github.com/eatnumber1/goal/tree/master/solutions/complete/c
[clisp-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/common-lisp
[clojure-soln]: https://github.com/eatnumber1/goal/tree/master/solutions/complete/clojure
[cs-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/c-sharp
[d-soln]:       https://github.com/eatnumber1/goal/tree/master/solutions/complete/d
[eng-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/english-spoken
[go-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/go
[groovy-soln]:  https://github.com/eatnumber1/goal/tree/master/solutions/complete/groovy
[hs-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/haskell
[jl-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/julia
[js-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/javascript
[lua-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/lua
[nim-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/nimrod
[obj-j-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/objective-j
[ocaml-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/ocaml
[perl-soln]:    https://github.com/eatnumber1/goal/tree/master/solutions/complete/perl
[perl6-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/perl6
[py-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/python
[r-soln]:       https://github.com/eatnumber1/goal/tree/master/solutions/complete/r
[regexp-soln]:  https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/regexp
[rb-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/ruby
[scala-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/scala
[scm-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/scheme
[sed-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/sed
[sh-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/shell
[zsh-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/zsh

[//]: # (Bad solution URLs)
[c-limited-calls]: https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/c/crawford
[c-self-modify]:   https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/c/tolmasky
[sh-abort-early]:  https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/shell/csandreasen/goal.sh

[//]: # (Non-solution URLs)
[java-non-soln]: https://github.com/eatnumber1/goal/tree/master/non-solutions/java
[php-non-soln]:  https://github.com/eatnumber1/goal/tree/master/non-solutions/php

[//]: # (Editor's pick URLs)
[c++-ed-pick]:  https://github.com/eatnumber1/goal/blob/master/solutions/complete/c%2B%2B/derrickturk/goal.cpp
[c-ed-pick]:    https://github.com/eatnumber1/goal/blob/master/solutions/complete/c/tolmasky/goal.c
[hs-ed-pick]:   https://github.com/eatnumber1/goal/blob/master/solutions/complete/haskell/capicue/goal.hs
[nim-ed-pick]:  https://github.com/eatnumber1/goal/blob/master/solutions/complete/nimrod/dom96/goal.nim
[perl-ed-pick]: https://github.com/eatnumber1/goal/blob/master/solutions/complete/perl/worr/goal.pl
[sh-ed-pick]:   https://github.com/eatnumber1/goal/blob/master/solutions/incomplete/shell/csandreasen/goal.sh
[zsh-ed-pick]:  https://github.com/eatnumber1/goal/blob/master/solutions/complete/zsh/o11c/goal.zsh

[//]: # (Solution explanation URLs)
[hs-explain]:   https://github.com/eatnumber1/goal/issues/99
[zsh-explain]:  https://github.com/eatnumber1/goal/pull/69#issuecomment-50285290
[perl-explain]: https://github.com/eatnumber1/goal/blob/master/solutions/complete/perl/worr/README.md

[//]: # (User URLs)
[acruikshank]: https://github.com/acruikshank
[capicue]:     https://github.com/capicue
[csandreasen]: https://github.com/csandreasen
[derrickturk]: https://github.com/derrickturk
[dom96]:       https://github.com/dom96
[o11c]:        https://github.com/o11c
[tolmasky]:    https://github.com/tolmasky
[worr]:        https://github.com/worr

[//]: # (Other URLs)
[carbonfive-challenge]: https://github.com/carbonfive/functional-programming-weekly-challenge/tree/master/Week002
[golf]:                 http://en.wikipedia.org/wiki/Code_golf
[rvalue]:               http://en.wikipedia.org/wiki/Value_(computer_science)#lrvalue
[c-sharp-readme]:       https://github.com/eatnumber1/goal/blob/master/solutions/complete/c-sharp/README.md

[//]: # ( vim: set et ts=4 sw=4 sts=4 tw=80: )
