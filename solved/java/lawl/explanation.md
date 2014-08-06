Sure, the way this works is by abusing a behaviour only found in eclipse's compiler, at least as far as I'm aware. Eclipse will always try to compile your project, even if it contains errors. In this case the Syntax error of calling `g()("al")` is in a method that is never actually called, namely `gWillMagicallyBeInvoked`. By setting this method to `public` we can make sure the compiler can not optimize it out. I'm having trouble finding exact documentation on how eclipse handles these cases, so this [Stackoverflow answer by Jon Skeet](http://stackoverflow.com/a/7590454) will have to do.

> You can use Eclipse. Its internal compiler is - at least in some cases - able to keep going with the rest of the build, even when some classes don't compile fully. It will even produce class files for the broken classes if possible, generating methods which throw an exception as soon as they're called.

So eclipse will still compile this, probably because it's an error in a method that's never called. What it will do though, it will replace the faulty code with code that throws exceptions with the error message it encountered when trying to compile this.

So if we compile

    public static void gWillMagicallyBeInvoked() {
        System.out.println(g()("al"));
    }

What will end up in our Main class is actually something like

    public static void gWillMagicallyBeInvoked() {
        throw new Exception("Syntax error at ...");
    }

If we add more `()` chains, eclipse is nice enough to add more exceptions in the method body (Or maybe it just add's the additional errors to the String of only one exception, I haven't checked with a decompiler). So `g()()()("al")` becomes something like

    public static void gWillMagicallyBeInvoked() {
        throw new Exception("Syntax error at ...");
        throw new Exception("Syntax error at ...");
        throw new Exception("Syntax error at ...");
    }

Thus (badly hidden at the end of the File) we can just read our own compiled `.class` file and count the number of times we find the String `Syntax error` to determine the number of `()` calls that were used. Of course, it will also count any other syntax error, but who would try to compile broken code and then complain that it doesn't work, right?

I have not been able to find a way to enable that sort of behaviour using `javac`.
