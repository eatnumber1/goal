# g()('al')

`g()('al')` is a challenge whereby you need to write in as many languages as
possible code which enables the code `g()('al')` to return the string "goal",
the code `g()()('al')` to return the string "gooal", the code `g()()()('al')`
return the string "goooal", etc.

`g()('al')` is the creation of [acruikshank] who originally posed it as a
[functional programming challenge][carbonfive-challenge]. Extensive stubbornness
and misinterpretation led to its current form.

## Rules
1.   *You are encouraged to break the rules, cleverly.*
2.   When executed, the solution must print "goal" with sufficient o's to
     demonstrate the program's functionality.
11.  The code `g()('al')` must appear in the source.
  1.   `g()('al')` must not be a string literal.
  2.   `'al'` must be a string, or your language's equivalent thereof. You may
       use your language's standard method of creating a string (e.x. C should
       use `"`, ruby may use either `"` or `'`).
7.   `g()('al')` may not print the string. If returning a string cannot be done
     in your language, you should submit rationale as to why this is impossible
     for a solution which prints a string to be accepted.
642. You must be able to insert an arbitrary number of `()` calls without
     modification to your solution. Therefore solutions like
     [this][c-limited-calls] are incorrect.
9.  `g()('al')` must be a valid [rvalue] if applicable in your language.
14. `g('al')` must return `"gal"`.
12.  If you have a solution that is close, but does not meet these rules,
     submit it anyway. A close and interesting solution is better than no
     solution.

### Previous Solutions
The more exciting solutions are original, not applying techniques that have
already been discovered. The following broadly applicable techniques have
already been discovered:

 * [Self-modifying code][c-self-modify]
 * [Aborting early][sh-abort-early]
 * [Human language][eng-soln]

## Languages

|               | Solved                 | Incomplete        | Improbable              |
|:-------------:|:----------------------:|:-----------------:|:-----------------------:|
| Brainfuck     |                        | [&bull;][bf-soln] |                         |
| C             | [&bull;][c-soln]       |                   |                         |
| C#            | [&bull;][cs-soln]      |                   |                         |
| C++           | [&bull;][c++-soln]     |                   |                         |
| Clojure       | [&bull;][clojure-soln] |                   |                         |
| Common Lisp   | [&bull;][clisp-soln]   |                   |                         |
| D             | [&bull;][d-soln]       |                   |                         |
| Go            | [&bull;][go-soln]      |                   |                         |
| Groovy        | [&bull;][groovy-soln]  |                   |                         |
| English       | [&bull;][eng-soln]     |                   |                         |
| Haskell       | [&bull;][hs-soln]      |                   |                         |
| Java          |                        |                   | [&bull;][java-non-soln] |
| JavaScript    | [&bull;][js-soln]      |                   |                         |
| Julia         | [&bull;][jl-soln]      |                   |                         |
| Lua           | [&bull;][lua-soln]     |                   |                         |
| Nimrod        | [&bull;][nim-soln]     |                   |                         |
| Objective-J   | [&bull;][obj-j-soln]   |                   |                         |
| OCaml         | [&bull;][ocaml-soln]   |                   |                         |
| Perl          | [&bull;][perl-soln]    |                   |                         |
| Perl 6        | [&bull;][perl6-soln]   |                   |                         |
| PHP           |                        |                   | [&bull;][php-non-soln]  |
| Python        | [&bull;][py-soln]      |                   |                         |
| R             | [&bull;][r-soln]       |                   |                         |
| Ruby          | [&bull;][rb-soln]      |                   |                         |
| Scala         | [&bull;][scala-soln]   |                   |                         |
| Scheme        | [&bull;][scm-soln]     |                   |                         |
| Sed           | [&bull;][sed-soln]     |                   |                         |
| Shell         |                        | [&bull;][sh-soln] |                         |
| ZSH           | [&bull;][zsh-soln]     |                   |                         |

Help out, add some more languages!

## Editor's Picks
These are some of the editor's favorite submissions:

 * C [solution][c-ed-pick] by [tolmasky]
 * C++ [solution][c++-ed-pick] by [derrickturk]
 * Haskell [solution][hs-ed-pick] by [capicue] with an [explanation][hs-explain]
 * Nimrod [solution][nim-ed-pick] by [dom96]
 * SH incomplete [solution][sh-ed-pick] by [csandreasen]
 * ZSH [solution][zsh-ed-pick] by [o11c] with an [explanation][zsh-explain]

## Editor's Note
This got A LOT more popular than I expected. At the moment, there are 37 pull
requests that I need to look at. Please be patient as it may take me a few days
to get through them all. I'm prioritizing pull requests for new languages above
ones for existing languages.

It would be super helpful if people wanted to help out by:

1. Running other's submissions and confirming that they work correctly.
2. Checking that the submissions aren't too similar to existing solutions.
3. Checking that they follow all the rules.
4. Calling out particularly clever solutions.

Just leave a comment on the pull request with your findings and I'll see it.
Thanks!

[//]: # (Solution URLs)
[c++-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/c++
[cs-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/c-sharp
[c-soln]:       https://github.com/eatnumber1/goal/tree/master/solutions/complete/c
[clojure-soln]: https://github.com/eatnumber1/goal/tree/master/solutions/complete/clojure
[clisp-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/common-lisp
[d-soln]:       https://github.com/eatnumber1/goal/tree/master/solutions/complete/d
[go-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/go
[groovy-soln]:  https://github.com/eatnumber1/goal/tree/master/solutions/complete/groovy
[hs-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/haskell
[js-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/javascript
[jl-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/julia
[lua-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/lua
[nim-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/nimrod
[obj-j-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/objective-j
[perl-soln]:    https://github.com/eatnumber1/goal/tree/master/solutions/complete/perl
[perl6-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/perl6
[py-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/python
[r-soln]:       https://github.com/eatnumber1/goal/tree/master/solutions/complete/r
[scala-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/scala
[scm-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/scheme
[sh-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/shell
[rb-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/complete/ruby
[ocaml-soln]:   https://github.com/eatnumber1/goal/tree/master/solutions/complete/ocaml
[zsh-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/zsh
[bf-soln]:      https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/brainfuck
[sed-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/sed
[eng-soln]:     https://github.com/eatnumber1/goal/tree/master/solutions/complete/english-spoken

[//]: # (Bad solution URLs)
[c-self-modify]:   https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/c/tolmasky
[c-limited-calls]: https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/c/crawford
[sh-abort-early]:  https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/shell/csandreasen/goal.sh

[//]: # (Non-solution URLs)
[java-non-soln]: https://github.com/eatnumber1/goal/tree/master/non-solutions/java
[php-non-soln]:  https://github.com/eatnumber1/goal/tree/master/non-solutions/php

[//]: # (Editor's pick URLs)
[zsh-ed-pick]: https://github.com/eatnumber1/goal/blob/master/solutions/complete/zsh/o11c/goal.zsh
[hs-ed-pick]:  https://github.com/eatnumber1/goal/blob/master/solutions/complete/haskell/capicue/goal.hs
[c-ed-pick]:   https://github.com/eatnumber1/goal/blob/master/solutions/complete/c/tolmasky/goal.c
[sh-ed-pick]:  https://github.com/eatnumber1/goal/blob/master/solutions/incomplete/shell/csandreasen/goal.sh
[c++-ed-pick]: https://github.com/eatnumber1/goal/blob/master/solutions/complete/c%2B%2B/derrickturk/goal.cpp
[nim-ed-pick]: https://github.com/eatnumber1/goal/blob/master/solutions/complete/nimrod/dom96/goal.nim

[//]: # (Solution explanation URLs)
[hs-explain]:  https://github.com/eatnumber1/goal/issues/99
[zsh-explain]: https://github.com/eatnumber1/goal/pull/69#issuecomment-50285290

[//]: # (User URLs)
[o11c]:        https://github.com/o11c
[capicue]:     https://github.com/capicue
[tolmasky]:    https://github.com/tolmasky
[csandreasen]: https://github.com/csandreasen
[derrickturk]: https://github.com/derrickturk
[dom96]:       https://github.com/dom96
[acruikshank]: https://github.com/acruikshank

[//]: # (Other URLs)
[carbonfive-challenge]: https://github.com/carbonfive/functional-programming-weekly-challenge/tree/master/Week002
[rvalue]:               http://en.wikipedia.org/wiki/Value_(computer_science)#lrvalue

[//]: # ( vim: set et ts=4 sw=4 sts=4 tw=80: )
