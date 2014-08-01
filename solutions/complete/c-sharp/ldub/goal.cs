using System;

namespace Goal {
    class Program {
        static void Main(string[] args) {
            Console.WriteLine(g("al"));
            Console.WriteLine(g()("al"));
            Console.WriteLine(g()()()("al"));

            Console.ReadLine();
        }


        static string os = "";
        delegate dynamic gd(string o = "o");

        static dynamic g(string o = "o") {
            if (o == "o") {
                os += o;
                return (gd)g;
            } else {
                string result = "g" + os + "al";
                os = "";
                return result;
            }
        }
    }
}
