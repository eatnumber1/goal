using System;

namespace Goal {
    class Program {
        static void Main(string[] args) {
            Console.WriteLine(g("al"));
            Console.WriteLine(g()("al"));
            Console.WriteLine(g()()()("al"));

            Console.ReadLine();
        }


        static string result = "";
        delegate dynamic gd(string s = "o");

        static dynamic g(string s = "o") {
            if (s == "o") {
                result += s;
                return (gd)g;
            } else {
                string actualResult = "g" + result + "al";
                result = "";
                return actualResult;
            }
        }
    }
}
