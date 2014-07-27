using System;

namespace goal
{
    class go
    {
        static void Main(string[] args)
        {
            Console.WriteLine(g()()("al"));
            Console.WriteLine(g()()()()("al"));
            Console.WriteLine(g("al"));
            Console.WriteLine(g()()()("al"));
        }

        delegate dynamic gd(string al = null);
        static int os = 0;
        static dynamic g(string al = null)
        {
            if (al == null)
            {
                os++;
                return (gd)g;
            }
            else
            {
                var oos = os;
                os = 0;
                return "g" + String.Join("o", new string[1+oos]) + al;
            }
        }
    }
}
