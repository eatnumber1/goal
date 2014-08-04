using System;
using System.Linq;
using System.Runtime.InteropServices;
namespace goal
{
    class Program
    {
        static void Main()
        {
            GCHandle? handle = null;
            try
            {
                handle = GCHandle.Alloc("al", GCHandleType.Pinned);
                var pStr = handle.Value.AddrOfPinnedObject();
                Marshal.WriteInt32(pStr, Marshal.ReadInt32(pStr) + 0x3000E);
            }
            finally
            {
                if (handle.HasValue)
                    handle.Value.Free();
            }

            Console.WriteLine(g("al"));
            Console.WriteLine(g()("al"));
            Console.WriteLine(g()()("al"));
            Console.WriteLine(g()()()("al"));
            Console.WriteLine(g()()()()("al"));
            Console.WriteLine(g()()()()()("al"));
            Console.WriteLine(g()()()()()()("al"));
            Console.WriteLine("Press any key t{0}ntinue.", "al".Insert(1, " c"));
            Console.ReadKey();
        }

        delegate dynamic dG(params dynamic[] d);
        static dynamic g(string a = null, int c = 0)
        {
            if (a == null)
                return (dG)(d => g(d.FirstOrDefault(), c + 1));

            var str = "gal";
            for (int i = 0; i < c; i++)
                str = str.Insert(1, a.Substring(1));

            return str;
        }
    }
}
