using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ScriptEngine.Machine;
using System.Reflection;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Values;

namespace osi
{
    public static class FindHelper
    {
        public static ArrayImpl FindBetweenOptimized(
            string input,
            string fragment1 = null,
            string fragment2 = null,
            bool excludeFragments = true,
            bool noOverlap = true)
        {
            // Если оба фрагмента не заданы — возвращаем пустой массив
            if (fragment1 == null && fragment2 == null)
            {
                return new ArrayImpl();
            }

            var result = new ArrayImpl();
            var positions1 = fragment1 != null ? FindAllPositions(input, fragment1) : new List<int>();
            var positions2 = fragment2 != null ? FindAllPositions(input, fragment2) : new List<int>();

            // Случай 1: задан только фрагмент1
            if (fragment1 != null && fragment2 == null)
            {
                foreach (var pos in positions1)
                {
                    string extracted = excludeFragments
                        ? input.Substring(pos + fragment1.Length)
                        : input.Substring(pos);
                    result.Add(ValueFactory.Create(extracted));
                }
            }
            // Случай 2: задан только фрагмент2
            else if (fragment1 == null && fragment2 != null)
            {
                foreach (var pos in positions2)
                {
                    string extracted = excludeFragments
                        ? input.Substring(0, pos)
                        : input.Substring(0, pos + fragment2.Length);
                    result.Add(ValueFactory.Create(extracted));
                }
            }
            // Случай 3: заданы оба фрагмента
            else if (fragment1 != null && fragment2 != null)
            {
                foreach (var pos1 in positions1)
                {
                    // Ищем все fragment2, которые идут после fragment1
                    var validPos2 = positions2.FindAll(pos2 => pos2 > pos1);

                    foreach (var pos2 in validPos2)
                    {
                        // Проверяем условие отсутствия наложения
                        if (noOverlap && HasOverlap(input, pos1, pos2, fragment2))
                            continue;

                        string extracted = BuildResultSubstring(
                            input, pos1, pos2, fragment1, fragment2, excludeFragments);
                        result.Add(ValueFactory.Create(extracted));
                    }
                }
            }

            return result;
        }

        // Вспомогательная функция: находит все позиции вхождения фрагмента в строке
        private static List<int> FindAllPositions(string input, string fragment)
        {
            var positions = new List<int>();
            int startIndex = 0;
            int pos;

            while ((pos = input.IndexOf(fragment, startIndex, StringComparison.Ordinal)) >= 0)
            {
                positions.Add(pos);
                startIndex = pos + 1;
            }

            return positions;
        }

        // Проверка на наложение: есть ли в интервале другое вхождение fragment2
        private static bool HasOverlap(string input, int start, int end, string fragment2)
        {
            int fragmentLength = fragment2.Length;
            // Ищем вхождение fragment2 внутри интервала (start, end)
            for (int i = start + 1; i <= end - fragmentLength; i++)
            {
                if (input.Substring(i, fragmentLength) == fragment2)
                    return true;
            }
            return false;
        }

        // Формирует финальную подстроку по индексам
        private static string BuildResultSubstring(
            string input, int pos1, int pos2, string fragment1, string fragment2, bool excludeFragments)
        {
            if (excludeFragments)
            {
                int start = pos1 + fragment1.Length;
                int length = pos2 - start;
                return input.Substring(start, length);
            }
            else
            {
                return input.Substring(pos1, pos2 - pos1 + fragment2.Length);
            }
        }
    }

    public static class Utils
    {
        public static Hashtable hashtable = new Hashtable();
        public static Dictionary<decimal, ArrayList> shortcutDictionary = new Dictionary<decimal, ArrayList>();
        public static long lastEventTime = DateTime.UtcNow.Ticks / TimeSpan.TicksPerMillisecond;
        public static bool noMouseEvent = false;
        public static int lastMeX = -1;
        public static int lastMeY = -1;
        public static int minCols;
        public static int minRows;
        public static IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
        public static string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
        public static string pathLog = Path.Combine(Utils.pathStartupScript, "logtui.txt");
        public static string nameStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Source")).AsString();

        //ScriptEngine.Machine.Values.NullValue NullValue1;
        //ScriptEngine.Machine.Values.BooleanValue BooleanValue1;
        //ScriptEngine.Machine.Values.DateValue DateValue1;
        //ScriptEngine.Machine.Values.NumberValue NumberValue1;
        //ScriptEngine.Machine.Values.StringValue StringValue1;

        //ScriptEngine.Machine.Values.GenericValue GenericValue1;
        //ScriptEngine.Machine.Values.TypeTypeValue TypeTypeValue1;
        //ScriptEngine.Machine.Values.UndefinedValue UndefinedValue1;
        public static bool IsString(IValue value) => value?.SystemType.Name == "Строка";
        public static bool IsNumber(IValue value) => value?.SystemType.Name == "Число";
        public static bool IsBoolean(IValue value) => value?.SystemType.Name == "Булево";
        public static bool IsDateTime(IValue value) => value?.SystemType.Name == "Дата";
        public static bool IsType<T>(IValue value) => value?.GetType() == typeof(T);
        public static bool IsType<T>(object value) => value?.GetType() == typeof(T);

        public static short[] ArrayToShort(ArrayImpl array)
        {
            int count = array.Count();
            short[] result = new short[count];
            for (int i = 0; i < count; i++)
            {
                // Получаем элемент массива
                IValue element = array.Get(i);

                // Преобразуем в число и затем в short
                decimal numberValue = element.AsNumber();
                result[i] = (short)numberValue;
            }
            return result;
        }

        public static ArrayImpl ShortToArray(short[] shortArray)
        {
            ArrayImpl array = new ArrayImpl();
            foreach (short value in shortArray)
            {
                // Добавляем short значение в массив OneScript
                array.Add(ValueFactory.Create((decimal)value));
            }
            return array;
        }

        public static string[] ArrayToString(ArrayImpl array)
        {
            int count = array.Count();
            string[] result = new string[count];
            for (int i = 0; i < count; i++)
            {
                string element = array.Get(i).AsString();
                result[i] = element;
            }
            return result;
        }

        public static ArrayImpl StringToArray(string[] stringArray)
        {
            ArrayImpl array = new ArrayImpl();
            foreach (string value in stringArray)
            {
                array.Add(ValueFactory.Create(value));
            }
            return array;
        }

        public static ArrayImpl ListToArray(List<IValue> listValue)
        {
            ArrayImpl array = new ArrayImpl();
            IValue[] valueArray = listValue.ToArray();
            foreach (var value in valueArray)
            {
                array.Add(value);
            }
            return array;
        }

        public static ArrayImpl ListToArray(List<string> listString)
        {
            ArrayImpl array = new ArrayImpl();
            string[] stringArray = listString.ToArray();
            foreach (var value in stringArray)
            {
                array.Add(ValueFactory.Create(value));
            }
            return array;
        }

        public static List<string> ArrayToList(ArrayImpl array)
        {
            int count = array.Count();
            List<string> result = new List<string>();
            for (int i = 0; i < count; i++)
            {
                string element = array.Get(i).AsString();
                result.Add(element);
            }
            return result;
        }

        public static int[] ArrayToInt32(ArrayImpl array)
        {
            int count = array.Count();
            int[] result = new int[count];
            for (int i = 0; i < count; i++)
            {
                IValue element = array.Get(i);
                result[i] = ToInt32(element);
            }
            return result;
        }

        public static ArrayImpl IntToArray(int[] intArray)
        {
            ArrayImpl array = new ArrayImpl();
            foreach (int value in intArray)
            {
                array.Add(ValueFactory.Create(value));
            }
            return array;
        }

        public static ArrayImpl FloatToArray(float[] floatArray)
        {
            ArrayImpl array = new ArrayImpl();
            foreach (float value in floatArray)
            {
                array.Add(ValueFactory.Create(ToDecimal(value)));
            }
            return array;
        }

        public static float[] ArrayToFloat(ArrayImpl array)
        {
            int count = array.Count();
            float[] result = new float[count];
            for (int i = 0; i < count; i++)
            {
                IValue element = array.Get(i);
                result[i] = ToFloat(element);
            }
            return result;
        }

        public static byte[] ArrayToByte(ArrayImpl array)
        {
            int count = array.Count();
            byte[] result = new byte[count];
            for (int i = 0; i < count; i++)
            {
                IValue element = array.Get(i);
                decimal numberValue = element.AsNumber();
                result[i] = (byte)numberValue;
            }
            return result;
        }

        public static ArrayImpl ByteToArray(byte[] byteArray)
        {
            ArrayImpl array = new ArrayImpl();
            foreach (byte value in byteArray)
            {
                array.Add(ValueFactory.Create((decimal)value));
            }
            return array;
        }

        public static float ToFloat(object num)
        {
            if (IsType<NumberValue>(num))
            {
                return Convert.ToSingle(((NumberValue)num).AsNumber());
            }
            return Convert.ToSingle(num);
        }

        public static byte ToByte(object num)
        {
            if (IsType<NumberValue>(num))
            {
                return Convert.ToByte(((NumberValue)num).AsNumber());
            }
            return Convert.ToByte(num);
        }

        public static bool ToBoolean(object b)
        {
            if (IsType<BooleanValue>(b))
            {
                return Convert.ToBoolean(((BooleanValue)b).AsBoolean());
            }
            return Convert.ToBoolean(b);
        }

        public static string ToString(object str)
        {
            if (IsType<StringValue>(str))
            {
                return Convert.ToString(((StringValue)str).AsString());
            }
            return Convert.ToString(str);
        }

        public static int ToInt32(object num)
        {
            if (IsType<NumberValue>(num))
            {
                return Convert.ToInt32(((NumberValue)num).AsNumber());
            }
            return Convert.ToInt32(num);
        }

        public static decimal ToDecimal(object num)
        {
            if (IsType<NumberValue>(num))
            {
                return Convert.ToDecimal(((NumberValue)num).AsNumber());
            }
            return Convert.ToDecimal(num);
        }

        public static uint ToUInt32(object num)
        {
            if (IsType<NumberValue>(num))
            {
                return Convert.ToUInt32(((NumberValue)num).AsNumber());
            }
            return Convert.ToUInt32(num);
        }

        public static double ToDouble(object num)
        {
            if (IsType<NumberValue>(num))
            {
                return Convert.ToDouble(((NumberValue)num).AsNumber());
            }
            return Convert.ToDouble(num);
        }

        public static ArrayImpl NamesArray(Type _type)
        {
            ArrayImpl arrayImpl = new ArrayImpl();
            List<string> list = new List<string>();
            Type type = _type;
            PropertyInfo[] myPropertyInfo = type.GetProperties();
            for (int i = 0; i < myPropertyInfo.Length; i++)
            {
                if (myPropertyInfo[i].CustomAttributes.Count() == 1)
                {
                    string NameRu = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetName();
                    string NameEn = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();
                    try
                    {
                        list.Add(NameRu + " " + NameEn + " " + type.GetProperty(NameEn).GetValue(type));
                    }
                    catch { }
                }
            }
            list.Sort();
            for (int i = 0; i < list.Count; i++)
            {
                arrayImpl.Add(ValueFactory.Create(list[i]));
            }
            return arrayImpl;
        }

        public static void Echo(string str)
        {
            GlobalContext().Echo(str);
        }

        public static SystemGlobalContext GlobalContext()
        {
            return GlobalsManager.GetGlobalContext<SystemGlobalContext>();
        }

        public static void WriteToFile(string str)
        {
            using (StreamWriter writer = new StreamWriter(PathLog, true, Encoding.UTF8))
            {
                writer.WriteLineAsync("" + Environment.NewLine + DateTime.Now.ToString() + Environment.NewLine + str);
            }
        }

        public static string TempName
        {
            get { return $"m{Guid.NewGuid():N}"; }
        }

        public static string NameStartupScript
        {
            get { return nameStartupScript; }
        }

        public static string PathLog
        {
            get { return pathLog; }
            set { pathLog = value; }
        }

        public static bool AllNull(params IValue[] values)
        {
            foreach (var value in values)
            {
                if (value != null) return false;
            }
            return true;
        }

        public static bool AllNotNull(params IValue[] values)
        {
            foreach (var value in values)
            {
                if (value == null) return false;
            }
            return true;
        }

        public static bool AllNotNull(params string[] values)
        {
            foreach (var value in values)
            {
                if (value == null) return false;
            }
            return true;
        }

        public static bool AllNotNull(params object[] values)
        {
            foreach (var value in values)
            {
                if (value == null) return false;
            }
            return true;
        }

        public static ArrayList StrFindBetween(string p1, string p2 = null, string p3 = null, bool p4 = true, bool p5 = true)
        {
            //p1 - исходная строка
            //p2 - подстрока поиска от которой ведем поиск
            //p3 - подстрока поиска до которой ведем поиск
            //p4 - не включать p2 и p3 в результат
            //p5 - в результат не будут включены участки, содержащие другие найденные участки, удовлетворяющие переданным параметрам
            //функция возвращает массив строк
            string str1 = p1;
            int Position1;
            ArrayList ArrayList1 = new ArrayList();
            if (p2 != null && p3 == null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    ArrayList1.Add(ValueFactory.Create("" + ((p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1))));
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            else if (p2 == null && p3 != null)
            {
                Position1 = str1.IndexOf(p3) + 1;
                int SumPosition1 = Position1;
                while (Position1 > 0)
                {
                    ArrayList1.Add(ValueFactory.Create("" + ((p4) ? str1.Substring(0, SumPosition1 - 1) : str1.Substring(0, SumPosition1 - 1 + p3.Length))));
                    try
                    {
                        Position1 = str1.Substring(SumPosition1 + 1).IndexOf(p3) + 1;
                        SumPosition1 = SumPosition1 + Position1 + 1;
                    }
                    catch
                    {
                        break;
                    }
                }
            }
            else if (p2 != null && p3 != null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    string Стр2;
                    Стр2 = (p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1);
                    int Position2 = Стр2.IndexOf(p3) + 1;
                    int SumPosition2 = Position2;
                    while (Position2 > 0)
                    {
                        if (p5)
                        {
                            if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
                            {
                                ArrayList1.Add(ValueFactory.Create("" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
                            }
                        }
                        else
                        {
                            ArrayList1.Add(ValueFactory.Create("" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
                        }
                        try
                        {
                            Position2 = Стр2.Substring(SumPosition2 + 1).IndexOf(p3) + 1;
                            SumPosition2 = SumPosition2 + Position2 + 1;
                        }
                        catch
                        {
                            break;
                        }
                    }
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            return ArrayList1;
        }

        public static dynamic DefineTypeIValue(dynamic p1)
        {
            if (IsType<StringValue>(p1))
            {
                return p1.AsString();
            }
            else if (IsType<NumberValue>(p1))
            {
                return p1.AsNumber();
            }
            else if (IsType<BooleanValue>(p1))
            {
                return p1.AsBoolean();
            }
            else if (IsType<DateValue>(p1))
            {
                return p1.AsDate();
            }
            else
            {
                return p1;
            }
        }

        public static byte[] StreamToBytes(Stream input)
        {
            var capacity = input.CanSeek ? (int)input.Length : 0;
            using (var output = new MemoryStream(capacity))
            {
                int readLength;
                var buffer = new byte[4096];
                do
                {
                    readLength = input.Read(buffer, 0, buffer.Length);
                    output.Write(buffer, 0, readLength);
                }
                while (readLength != 0);
                return output.ToArray();
            }
        }

        public static void AddToShortcutDictionary(decimal p1, IValue p2)
        {
            if (!shortcutDictionary.ContainsKey(p1))
            {
                ArrayList ArrayList1 = new ArrayList();
                ArrayList1.Add(p2);
                shortcutDictionary.Add(p1, ArrayList1);
            }
            else
            {
                ArrayList ArrayList1 = shortcutDictionary[p1];
                if (!ArrayList1.Contains(p2))
                {
                    ArrayList1.Add(p2);
                }
            }
        }

        public static void RemoveFromShortcutDictionary(decimal p1, IValue p2)
        {
            if (shortcutDictionary.ContainsKey(p1))
            {
                try
                {
                    shortcutDictionary[p1].Remove(p2);
                }
                catch { }
            }
        }

        public static ArrayList GetFromShortcutDictionary(IValue p1)
        {
            ArrayList ArrayList1 = new ArrayList();
            foreach (var item in shortcutDictionary)
            {
                for (int i = 0; i < item.Value.Count; i++)
                {
                    if (item.Value[i] == p1)
                    {
                        ArrayList1.Add(item.Key);
                    }
                }
            }
            return ArrayList1;
        }

        public static dynamic RevertShortcut(dynamic shortcut)
        {
            try
            {
                return shortcutDictionary[shortcut];
            }
            catch
            {
                return null;
            }
        }

        public static void AddToHashtable(dynamic p1, dynamic p2)
        {
            if (!hashtable.ContainsKey(p1))
            {
                hashtable.Add(p1, p2);
            }
            else
            {
                if (!((object)hashtable[p1]).Equals(p2))
                {
                    hashtable[p1] = p2;
                }
            }
        }

        public static dynamic RevertEqualsObj(dynamic initialObject)
        {
            try
            {
                return hashtable[initialObject];
            }
            catch
            {
                return null;
            }
        }

        public static IValue RevertObj(dynamic initialObject)
        {
            // Если initialObject равен null.
            try
            {
                if (initialObject == null)
                {
                    return null;
                }
            }
            catch { }
            // Если initialObject равен null.
            try
            {
                string str_initialObject = initialObject.GetType().ToString();
            }
            catch
            {
                return null;
            }
            // initialObject не равен null
            dynamic Obj1 = null;
            string str1 = initialObject.GetType().ToString();
            // Если initialObject второго уровня и у него есть ссылка на третий уровень.
            try
            {
                Obj1 = initialObject.dll_obj;
            }
            catch { }
            if (Obj1 != null)
            {
                return (IValue)Obj1;
            }
            // Если initialObject с возможными другими типами.
            string str4 = null;
            try
            {
                str4 = initialObject.SystemType.Name;
            }
            catch
            {
                if (str1 == "System.String" ||
                    str1 == "System.Decimal" ||
                    str1 == "System.Int32" ||
                    str1 == "System.Boolean" ||
                    str1 == "System.DateTime")
                {
                    return (IValue)ValueFactory.Create(initialObject);
                }
                else if (str1 == "System.Byte")
                {
                    int vOut = Convert.ToInt32(initialObject);
                    return ValueFactory.Create(vOut);
                }
                else if (str1 == "System.DBNull")
                {
                    string vOut = Convert.ToString(initialObject);
                    return ValueFactory.Create(vOut);
                }
            }
            // Если тип initialObject определяется односкриптом.
            if (str4 == "Неопределено")
            {
                return null;
            }
            if (str4 == "Булево" || str4 == "Дата" || str4 == "Число" || str4 == "Строка")
            {
                return (IValue)initialObject;
            }
            // Если ничего не подходит.
            return (IValue)initialObject;
        }

        public static ArrayImpl SplitString(string p1, string p2)
        {
            ArrayImpl array = new ArrayImpl();
            string str = p1.Replace(p2, Environment.NewLine);
            string[] result = str.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
            for (int i = 0; i < result.Length; i++)
            {
                array.Add(ValueFactory.Create(result[i]));
            }
            return array;
        }

        public static string NewLine
        {
            get { return Environment.NewLine; }
        }

        public static void AppendAllText(string p1, string p2)
        {
            if (!System.IO.File.Exists(p1))
            {
                System.IO.File.Create(p1).Close();
            }
            System.IO.File.AppendAllText(p1, p2, System.Text.Encoding.UTF8);
        }

        public static void WriteAllText(string p1, string p2)
        {
            if (!System.IO.File.Exists(p1))
            {
                System.IO.File.Create(p1).Close();
            }
            System.IO.File.WriteAllText(p1, p2, System.Text.Encoding.UTF8);
        }

        public static bool FilesEqual(string path1, string path2)
        {
            const int BufferSize = 8192; // 8 KB - классический размер буфера

            if (!File.Exists(path1) || !File.Exists(path2))
            {
                return false;
            }

            var info1 = new FileInfo(path1);
            var info2 = new FileInfo(path2);

            if (info1.Length != info2.Length)
            {
                return false;
            }

            using (var fs1 = File.OpenRead(path1))
            using (var fs2 = File.OpenRead(path2))
            {
                byte[] buffer1 = new byte[BufferSize];
                byte[] buffer2 = new byte[BufferSize];

                while (true)
                {
                    int bytesRead1 = fs1.Read(buffer1, 0, BufferSize);
                    int bytesRead2 = fs2.Read(buffer2, 0, BufferSize);

                    // Если прочитали разное количество в конце файла
                    if (bytesRead1 != bytesRead2)
                    {
                        return false;
                    }

                    // Если оба файла закончились
                    if (bytesRead1 == 0)
                    {
                        return true; // Файлы идентичны до конца
                    }

                    // Сравниваем блоки побайтово
                    for (int i = 0; i < bytesRead1; i++)
                    {
                        if (buffer1[i] != buffer2[i])
                        {
                            return false;
                        }
                    }
                }
            }
        }
    }
}
