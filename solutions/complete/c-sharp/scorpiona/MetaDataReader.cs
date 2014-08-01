using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace goal
{
    class MetaDataReader
    {
        readonly IMetaDataImport metaDataImport;

        public MetaDataReader(string location)
        {
            metaDataImport = GetDataImport(location);
        }

        static IMetaDataImport GetDataImport(string location)
        {
            var dispenser = new IMetaDataDispenser();

            var metaDataImportGuid = typeof(IMetaDataImport).GUID;

            object scope;

            var hr = dispenser.OpenScope(location, 0, ref metaDataImportGuid, out scope);
            AssertHresultIsZero(hr);

            return (IMetaDataImport)scope;
        }

        public IEnumerable<string> EnumerateUserStrings()
        {
            return EnumerateUserStringIds().Select(GetUserString);
        }

        string GetUserString(uint id)
        {
            var length = GetUserStringLength(id);

            return GetUserStringContent(id, length);
        }

        uint GetUserStringLength(uint id)
        {
            uint length;

            var hr = metaDataImport.GetUserString(id, null, 0, out length);
            AssertHresultIsZero(hr);

            return length;
        }

        string GetUserStringContent(uint id, uint length)
        {
            var buffer = new char[length];

            var hr = metaDataImport.GetUserString(id, buffer, length, out length);
            AssertHresultIsZero(hr);

            return new string(buffer);
        }

        IEnumerable<uint> EnumerateUserStringIds()
        {
            var hEnum = IntPtr.Zero;
            var buffer = new uint[16];

            try
            {
                uint count;

                do
                {
                    var hr = metaDataImport.EnumUserStrings(ref hEnum, buffer, (uint)buffer.Length, out count);
                    AssertHresultIsZero(hr);

                    for (var i = 0; i < count; i++)
                        yield return buffer[i];
                }
                while (count > 0);
            }
            finally
            {
                metaDataImport.CloseEnum(hEnum);
            }
        }

        static void AssertHresultIsZero(uint hr)
        {
            if (hr != 0)
                Marshal.ThrowExceptionForHR((int)hr);
        }
    }
}
