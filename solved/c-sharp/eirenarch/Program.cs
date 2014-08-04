using System;

namespace Goal
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(g("al"));
            Console.WriteLine(g()("al"));
            Console.WriteLine(g()()("al"));
            Console.WriteLine(g()()()()()()("al"));

        }

        delegate dynamic Goal(string arg = null, string prefix = "g");

        public static dynamic g(string arg = null, string prefix = "g")
        {
            if (arg == null)
            {
                return (Goal)((a, p) => g(a, prefix + "o"));
            }
            else
            {
                return prefix + arg;
            }
        }
      
    }
}
