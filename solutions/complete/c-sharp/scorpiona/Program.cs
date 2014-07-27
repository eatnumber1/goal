using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Reflection;

namespace goal
{
    class Program
    {
        static void Main()
        {
            GCHandle? handle = null;
            try
            {
                var str = string.Intern(EnumerateInternedStrings(Assembly.GetExecutingAssembly()).Single(a => a == "al"));

                handle = GCHandle.Alloc(str, GCHandleType.Pinned);
                var pStr = handle.Value.AddrOfPinnedObject();
                var alsh = Marshal.ReadInt32(pStr);
                Marshal.WriteInt32(pStr, alsh + 0x3000E);
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

        static IEnumerable<string> EnumerateInternedStrings(Assembly assembly)
        {
            var metaDataReader = new MetaDataReader(assembly.Location);
            return metaDataReader.EnumerateUserStrings().Where(x => string.IsInterned(x) != null);
        }
    }
}
