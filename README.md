# g()('al')

`g()('al')` is a challenge whereby you need to write in as many languages as
possible code which enables the code `g()('al')` to return the string "goal",
the code `g()()('al')` to return the string "gooal", the code `g()()()('al')`
return the string "goooal", etc.

## Rules
1.   You are encouraged to break the rules, cleverly.
2.   When executed, the solution must print "goal" with sufficient o's to
     demonstrate the program's functionality.
6.   The program must not [modify itself][c-soln1].
11.  The code `g()('al')` must appear in the source.
  1.   `g()('al')` must not be a string
  2.   `'al'` must be a string, or your language's equivalent thereof. You may use
       your language's standard method of creating a string (e.x. C should use
       `"`, ruby may use either `"` or `'`).
7.   `g()('al')` may not print the string. If returning a string cannot be done
     in your language, you should submit rationale as to why this is impossible
     for a solution which prints a string to be accepted.
642. You must be able to insert an infinite number of `()` calls without
     modification to your solution. Therefore solutions like [this][c-soln3] are
     incorrect.

## Languages

|               | Solved              | Likely Possible | Likely Impossible | Impossible              |
|:-------------:|:-------------------:|:---------------:|:-----------------:|:-----------------------:|
| C             | [&bull;][c-soln1]   |                 |                   |                         |
| C++           | [&bull;][c++-soln1] |                 |                   |                         |
| Go            |                     |                 | &bull;            |                         |
| Haskell       | [&bull;][hs-soln1]  |                 |                   |                         |
| Java          |                     |                 |                   | [&bull;][java-nonsoln1] |
| JavaScript    | [&bull;][js-soln1]  |                 |                   |                         |
| Perl          |                     |                 | &bull;            |                         |
| Python        | [&bull;][py-soln1]  |                 |                   |                         |
| Ruby          |                     |                 |                   | [&bull;][rb-nonsoln1]   |
| SH            |                     |                 | &bull;            |                         |
| BASH          |                     |                 | &bull;            |                         |
| ZSH           |                     |                 | &bull;            |                         |

Help out, add some more languages!

[c-soln1]: https://github.com/eatnumber1/goal/tree/master/solutions/complete/c/soln1
[c-soln3]: https://github.com/eatnumber1/goal/tree/master/solutions/incomplete/c/soln3
[c++-soln1]: https://github.com/eatnumber1/goal/tree/master/solutions/complete/c++/soln1
[hs-soln1]: https://github.com/eatnumber1/goal/tree/master/solutions/complete/haskell/soln1
[js-soln1]: https://github.com/eatnumber1/goal/tree/master/solutions/complete/javascript/soln1
[py-soln1]: https://github.com/eatnumber1/goal/tree/master/solutions/complete/python/soln1
[rb-nonsoln1]: https://github.com/eatnumber1/goal/tree/master/non-solutions/ruby/nonsoln1
[java-nonsoln1]: https://github.com/eatnumber1/goal/tree/master/non-solutions/java/nonsoln1
