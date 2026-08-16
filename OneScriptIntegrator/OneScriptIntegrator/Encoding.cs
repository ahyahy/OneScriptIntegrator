using ScriptEngine.Machine.Contexts;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine;

namespace osi
{
    [ContextClass("ОсиКодировка", "OsiEncoding")]
    public class OsiEncoding : AutoContext<OsiEncoding>
    {
        public System.Text.Encoding Base_obj;

        public OsiEncoding()
        {
            Base_obj = System.Text.Encoding.Default;
        }

        public OsiEncoding(System.Text.Encoding p1)
        {
            Base_obj = p1;
        }

        [ContextProperty("ASCII", "ASCII")]
        public OsiEncoding ASCII
        {
            get { return new OsiEncoding(System.Text.Encoding.ASCII); }
        }

        [ContextProperty("UTF7", "UTF7")]
        public OsiEncoding UTF7
        {
            get { return new OsiEncoding(System.Text.Encoding.UTF7); }
        }

        [ContextProperty("UTF8", "UTF8")]
        public OsiEncoding UTF8
        {
            get { return new OsiEncoding(System.Text.Encoding.UTF8); }
        }

        private string name;
        [ContextProperty("Имя", "Name")]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        [ContextProperty("ИмяWeb", "WebName")]
        public string WebName
        {
            get { return Base_obj.WebName; }
        }

        [ContextProperty("ИмяЗаголовка", "HeaderName")]
        public string HeaderName
        {
            get { return Base_obj.HeaderName; }
        }

        [ContextProperty("ИмяКодировки", "EncodingName")]
        public string EncodingName
        {
            get { return Base_obj.EncodingName; }
        }

        [ContextProperty("ИмяТела", "BodyName")]
        public string BodyName
        {
            get { return Base_obj.BodyName; }
        }

        [ContextProperty("КодоваяСтраница", "WindowsCodePage")]
        public int WindowsCodePage
        {
            get { return Base_obj.WindowsCodePage; }
        }

        [ContextProperty("ОбратнаяUTF16", "BigEndianUnicode")]
        public OsiEncoding BigEndianUnicode
        {
            get { return new OsiEncoding(System.Text.Encoding.BigEndianUnicode); }
        }

        [ContextProperty("ПоУмолчанию", "ByDefault")]
        public OsiEncoding ByDefault
        {
            get { return new OsiEncoding(System.Text.Encoding.Default); }
        }

        [ContextProperty("Юникод", "Unicode")]
        public OsiEncoding Unicode
        {
            get { return new OsiEncoding(System.Text.Encoding.Unicode); }
        }

        [ContextMethod("КоличествоБайтов", "GetByteCount")]
        public int GetByteCount(string p1)
        {
            return Base_obj.GetByteCount(p1);
        }

        [ContextMethod("ПолучитьБайты", "GetBytes")]
        public ArrayImpl GetBytes(string p1)
        {
            ArrayImpl array = new ArrayImpl();
            byte[] Bytes1 = Base_obj.GetBytes(p1);
            for (int i = 0; i < Bytes1.Length; i++)
            {
                array.Add(ValueFactory.Create(Bytes1[i]));
            }
            return array;
        }

        [ContextMethod("ПолучитьКодировку", "GetEncoding")]
        public OsiEncoding GetEncoding(int p1)
        {
            return new OsiEncoding(System.Text.Encoding.GetEncoding(p1));
        }

        [ContextMethod("ПолучитьСтроку", "GetString")]
        public string GetString(ArrayImpl p1)
        {
            byte[] Bytes1 = new byte[checked(p1.Count() + 2)];

            for (int i = 0; i < p1.Count(); i++)
            {
                Bytes1[i] = System.Convert.ToByte(System.Convert.ToInt32(p1.Get(i).ToString()));
            }
            string str1 = Base_obj.GetString(Bytes1);
            if ((BodyName == "utf-16") || (BodyName == "utf-16BE"))
            {
                return Base_obj.GetString(Bytes1).Substring(0, str1.Length - 1);
            }
            else if ((BodyName == "us-ascii") || (BodyName == "utf-7") || (BodyName == "utf-8"))
            {
                return Base_obj.GetString(Bytes1).Substring(0, str1.Length - 2);
            }
            return str1;
        }

        [ContextMethod("Преобразовать", "Convert")]
        public ArrayImpl Convert(OsiEncoding p1, OsiEncoding p2, ArrayImpl p3)
        {
            byte[] Bytes1 = new byte[checked(p3.Count() + 2)];
            for (int i = 0; i < p3.Count(); i++)
            {
                Bytes1[i] = System.Convert.ToByte(p3.Get(i).AsNumber());
            }
            byte[] Array1 = System.Text.Encoding.Convert(p1.Base_obj, p2.Base_obj, Bytes1);
            byte[] objArray = new byte[checked(Array1.Length + 1)];
            for (int i = 0; i < Array1.Length; i++)
            {
                objArray[i] = Array1[i];
            }
            ArrayImpl array = new ArrayImpl();
            int Length1 = objArray.Length - 1;
            if ((p1.BodyName == "utf-16") || (p1.BodyName == "utf-16BE"))
            {
                if ((p2.BodyName == "utf-16") || (p2.BodyName == "utf-16BE"))
                {
                    Length1 = objArray.Length - 3;
                }
                else if ((p2.BodyName == "us-ascii") || (p2.BodyName == "utf-7") || (p2.BodyName == "utf-8"))
                {
                    Length1 = objArray.Length - 2;
                }
            }
            else if ((p1.BodyName == "us-ascii") || (p1.BodyName == "utf-7") || (p1.BodyName == "utf-8"))
            {
                if ((p2.BodyName == "utf-16") || (p2.BodyName == "utf-16BE"))
                {
                    Length1 = objArray.Length - 5;
                }
                else if ((p2.BodyName == "us-ascii") || (p2.BodyName == "utf-7") || (p2.BodyName == "utf-8"))
                {
                    Length1 = objArray.Length - 3;
                }
            }
            for (int i = 0; i < Length1; i++)
            {
                array.Add(ValueFactory.Create(objArray[i]));
            }
            return array;
        }
    }
}
