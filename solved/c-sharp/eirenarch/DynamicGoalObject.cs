using System;
using System.Dynamic;

namespace Goal
{
    class DynamicGoalObject
    {
        static void Main(string[] args)
        {
            dynamic g = new Goal();
            Console.WriteLine(g("al"));
            Console.WriteLine(g()("al"));
            Console.WriteLine(g()()("al"));
            Console.WriteLine(g()()()()()()("al"));
        }
    }

    public class Goal : DynamicObject
    {
        public Goal()
        {
            val = "g";
        }

        public Goal(string arg)
        {
            val = arg;
        }

        string val;
        public override bool TryInvoke(InvokeBinder binder, object[] args, out object result)
        {
            if (args.Length > 0)
            {
                result = val + args[0];
            }
            else
            {
                result = new Goal(val + "o");
            }

            return true;
        }
    }
}
