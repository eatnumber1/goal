using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Remoting.Proxies;
using System.Text;

namespace gooooal
{
    class Program
    {
        static void Main(string[] args)
        {
            var g = GetPumped();

            Console.WriteLine(g("al"));
            Console.WriteLine(g()("al"));
            Console.WriteLine(g()()()("al"));
            Console.WriteLine(g()()()()()()("al"));
        }

        private interface IGoal
        {
            Goal g(string al = null);
        }

        private delegate Goal Goal(string al = null);

        private class GoalProxy : RealProxy
        {
            public GoalProxy()
                : base(typeof(IGoal))
            {
            }

            private int _n = 0;

            public override IMessage Invoke(IMessage msg)
            {
                var mcm = (IMethodCallMessage)msg;

                if ((string)mcm.Args[0] == "al")
                {
                    var field = msg.GetType().GetField("_flags", BindingFlags.NonPublic | BindingFlags.Instance);
                    var oldFlags = (int)field.GetValue(msg);
                    field.SetValue(msg, oldFlags | 1);

                    var retStr = "g" + new string('o', _n) + "al";

                    return new ReturnMessage(retStr, null, 0, null, mcm);
                }
                else
                {
                    _n++;
                    return new ReturnMessage(new Goal(((IGoal)(this.GetTransparentProxy())).g), null, 0, null, mcm);
                }
            }

            public override string ToString()
            {
                return base.ToString();
            }
        }
        
        static Goal GetPumped()
        {
            return ((IGoal)(new GoalProxy().GetTransparentProxy())).g;
        }
    }
}
