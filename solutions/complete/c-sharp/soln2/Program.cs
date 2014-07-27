using System;
using System.Linq;

class Program {
    static void Main() {
        Console.WriteLine(g("al"));
        Console.WriteLine(g()("al"));
        Console.WriteLine(g()()("al"));
        Console.WriteLine(g()()()("al"));
        Console.WriteLine("Press any key to continue.");
        Console.ReadKey();
    }

    delegate dynamic Goal(params string[] args);

    static dynamic g(string suffix = null, string prefix = "g") {
        if (suffix == "al") return prefix + suffix;
        return (Goal)(a => g(a.FirstOrDefault(), prefix + "o"));
    }
}
