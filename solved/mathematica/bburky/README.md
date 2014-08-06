This solution uses [`$PreRead`](http://reference.wolfram.com/language/ref/$PreRead.html) which "is applied to the text or box form of every input expression before it is fed to the Wolfram Language" to preprocess input before execution.

Note that this solution must be run like a notebook from the Mathematica GUI. Opening the `.m` file and clicking the "Run Package" button works fine. But crazy things like:

    MathematicaScript -script ./goal.m

will fail with a `Syntax::sntx` error because entire file is parsed as code, not into a notebook of Boxes (which can be preprocessed) like the GUI does.
