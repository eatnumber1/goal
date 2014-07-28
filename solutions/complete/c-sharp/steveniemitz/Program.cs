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
        /// <summary>
        /// Why does this work?  What is it doing?
        /// 
        /// Good questions!  This whole thing relies on a (fairly old) bug in the 
        /// CLR's handling of BeginInvoke/EndInvoke, specifically when invoking through
        /// a __TransparentProxy.  For a more detailed explanation, 
        /// see here: http://www.steveniemitz.com/Blog/post/Fun-with-NET-remoting-Building-a-RealProxy-implementation.aspx
        /// 
        /// What's happening?
        /// In the static method g(...) we create a new proxy for IGoal (there's no real 
        /// implementation of IGoal, but it doesn't matter here), and return a delegate to
        /// its g(...) method (which again, doesn't actually have an implementation anywhere).
        /// 
        /// When invoked, the CLR sees the call is on a __TransparentProxy and delivers
        /// the call to GoalProxy.Invoke.  The code path with no parameters (al = null)
        /// simply keeps track of how many times it was called and returns the same delegate,
        /// however, the code path where a string is passed in works some magic to return a 
        /// string instead of a Goal delegate.  Console.WriteLine then calls .ToString() 
        /// on (what it thinks is) the delegate object, but actually is calling it on an 
        /// instance of the string instead.  If you look, the return type of g is always 
        /// a Goal delegate, we're just breaking the CLR's type safety here and returning a 
        /// different type at the end.
        /// 
        /// How does it work?
        /// The non-null case in Invoke flips a flag on Message that tells the runtime it's a
        /// BeginInvoke call (instead of a normal Invoke call).  The bug is that in this code
        /// path, the return type is never checked.  The CLR is assuming you're always returning
        /// an IAsyncResult, but in reality you can return anything.  This allows us to smuggle
        /// a string out of the call.
        /// 
        /// Bug is here starting on line 520:
        /// http://referencesource.microsoft.com/#mscorlib/system/runtime/remoting/realproxy.cs#520
        /// </summary>
        static void Main(string[] args)
        {
            Console.WriteLine(g("al"));
            Console.WriteLine(g()("al"));
            Console.WriteLine(g()()()("al"));
            Console.WriteLine(g()()()()()()("al"));
        }
        
        private delegate Goal Goal(string al = null);

        private static Goal g(string al = null)
        {
            return (((IGoal)(new GoalProxy().GetTransparentProxy())).g)(al);
        }

        private interface IGoal
        {
            Goal g(string al = null);
        }       

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

                string arg = (string)mcm.Args[0];
                if (arg != null)
                {
                    var field = msg.GetType().GetField("_flags", BindingFlags.NonPublic | BindingFlags.Instance);
                    var oldFlags = (int)field.GetValue(msg);
                    field.SetValue(msg, oldFlags | 1);

                    var retStr = "g" + new string('o', _n) + arg;

                    return new ReturnMessage(retStr, null, 0, null, mcm);
                }
                else
                {
                    _n++;
                    return new ReturnMessage(new Goal(((IGoal)(this.GetTransparentProxy())).g), null, 0, null, mcm);
                }
            }
        }
    }
}
