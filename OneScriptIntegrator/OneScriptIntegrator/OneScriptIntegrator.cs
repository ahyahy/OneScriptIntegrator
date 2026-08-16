using System;
using System.IO;
using System.Text;
using System.Linq;
using System.Collections.Generic;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;
using ScriptEngine.HostedScript.Library;
using System.Collections.Concurrent;

namespace osi
{
    [ContextClass("ИнтеграторОдноСкрипта", "OneScriptIntegrator")]
    public class OneScriptIntegrator : AutoContext<OneScriptIntegrator>
    {
        public static OsiAction EventAction = null;
        public static OsiEventArgs Event = null;
        private static StructureImpl shareStructure = new StructureImpl();
        private static string separator = Path.DirectorySeparatorChar.ToString();
        private static OneScriptIntegrator instance;
        public static bool systemVersionIsMicrosoft = false;
        private static object syncRoot = new Object();
        public static ConcurrentQueue<OsiEventArgs> EventQueue = new ConcurrentQueue<OsiEventArgs>();
        public static bool goOn = true;

        public static OneScriptIntegrator getInstance()
        {
            if (instance == null)
            {
                lock (syncRoot)
                {
                    if (instance == null)
                    {
                        instance = new OneScriptIntegrator();
                    }
                }
            }
            if (System.Environment.OSVersion.VersionString.Contains("Microsoft"))
            {
                systemVersionIsMicrosoft = true;
            }
            return instance;
        }

        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            OneScriptIntegrator inst = getInstance();
            try
            {
                inst.InjectGlobalProperty(shareStructure, "ОбщаяСтруктура", false);
            }
            catch { }
            StartEventProcessing();
            return inst;
        }

        // Обеспечение цикла событий =====================================================================
        public static void StartEventProcessing()
        {
            string startEventProcessing = @"
Процедура ЗапускСобытий(параметр1) Экспорт
    Контекст = Новый Структура();
    Контекст.Вставить(""ИОС"", параметр1);
    Стр = ""
    |Пока ИОС.Продолжать Цикл
    |	ИОС.ПолучитьСобытие().Выполнить();
    |КонецЦикла;
    |"";
    ЗагрузитьСценарийИзСтроки(Стр, Контекст);
КонецПроцедуры

МассивПараметров = Новый Массив(1);
МассивПараметров[0] = ИОС;
Задание = ФоновыеЗадания.Выполнить(ЭтотОбъект, ""ЗапускСобытий"", МассивПараметров);
";
            StructureImpl extContext = new StructureImpl();
            extContext.Insert("ИОС", instance);
            Utils.GlobalContext().LoadScriptFromString(startEventProcessing, extContext);
        }

        [ContextProperty("Продолжать", "GoOn")]
        public bool GoOn
        {
            get { return goOn; }
            set { goOn = value; }
        }

        [ContextProperty("АргументыСобытия", "EventArgs")]
        public OsiEventArgs EventArgs
        {
            get { return Event; }
        }

        [ContextMethod("ПолучитьСобытие", "DoEvents")]
        public DelegateAction DoEvents()
        {
            while (EventQueue.Count == 0)
            {
                System.Threading.Thread.Sleep(7);
            }
            if (EventQueue.TryDequeue(out var item))
            {
                Event = item;
                EventAction = item.EventAction;
            }
            return DelegateAction.Create(item.EventAction.Script, item.EventAction.MethodName);
        }

        [ContextMethod("Выполнить", "Execute")]
        public IValue Execute(OsiAction p1)
        {
            OsiEventArgs eventArgs = new OsiEventArgs()
            {
                Sender = this,
                Parameter = p1.Parameter
            };
            Event = eventArgs;

            ReflectorContext reflector = new ReflectorContext();
            IValue res = ValueFactory.Create();
            try
            {
                res = reflector.CallMethod(p1.Script, p1.MethodName, null);
            }
            catch (Exception ex)
            {
                Utils.Echo("Ошибка метода Выполнить: " + ex.Message);
            }
            return res;
        }

        [ContextMethod("Действие", "Action")]
        public OsiAction Action(IRuntimeContextInstance script, string methodName, IValue param = null)
        {
            return new OsiAction(script, methodName, param);
        }

        // =====================================================================
        [ContextMethod("ОжидатьФайл", "WaitFile")]
        public bool WaitFile(string path, int timeoutMs = 10000)
        {
            int start = Environment.TickCount;
            while (true)
            {
                if (File.Exists(path))
                {
                    try
                    {
                        var len = new System.IO.FileInfo(path).Length;
                        if (len > 0) return true; // файл есть и не пустой
                    }
                    catch
                    {
                        // файл есть, но временно недоступен — продолжаем ждать
                    }
                }
                if (timeoutMs > 0 && (Environment.TickCount - start) >= timeoutMs)
                {
                    return false;
                }
                Utils.GlobalContext().Sleep(100);
            }
        }

        [ContextMethod("ОжидатьКаталог", "WaitDirectory")]
        public bool WaitDirectory(string path, int timeoutMs = 10000)
        {
            int start = Environment.TickCount;
            while (!Directory.Exists(path))
            {
                if (timeoutMs > 0 && (Environment.TickCount - start) >= timeoutMs)
                {
                    return false;
                }
                Utils.GlobalContext().Sleep(100);
            }
            return true;
        }

        [ContextMethod("Таймер", "Timer")]
        public OsiTimer Timer()
        {
            return new OsiTimer();
        }

        [ContextMethod("ОдноразовыйТаймер", "OneOffTimer")]
        public void OneOffTimer(OsiAction action, int delay)
        {
            OsiTimer timer = new OsiTimer();
            timer.OnTickEvent = action;
            timer.Delay = delay;
            timer.StartOneOff();
        }

        [ContextMethod("НаблюдательФайловойСистемы", "FileSystemWatcher")]
        public OsiFileSystemWatcher FileSystemWatcher()
        {
            return new OsiFileSystemWatcher();
        }

        [ContextProperty("ФильтрыУведомления", "NotifyFilters")]
        public OsiNotifyFilters NotifyFilters
        {
            get { return new OsiNotifyFilters(); }
        }

        [ContextProperty("ТипыИзмененийНаблюдателя", "WatcherChangeTypes")]
        public OsiWatcherChangeTypes WatcherChangeTypes
        {
            get { return new OsiWatcherChangeTypes(); }
        }

        [ContextMethod("ДобавитьВесьТекст", "AppendAllText")]
        public void AppendAllText(string p1, string p2)
        {
            Utils.AppendAllText(p1, p2);
        }

        [ContextMethod("ЗаписатьВесьТекст", "WriteAllText")]
        public void WriteAllText(string p1, string p2)
        {
            Utils.WriteAllText(p1, p2);
        }

        [ContextMethod("НайтиМежду", "ParseBetween")]
        public string ParseBetween2(string p1, string p2 = null, string p3 = null)
        {
            return ParseBetween(p1, p2, p3);
        }

        public static string ParseBetween(string p1, string p2 = null, string p3 = null)
        {
            //p1 - исходная строка
            //p2 - подстрока поиска от которой ведем поиск
            //p3 - подстрока поиска до которой ведем поиск
            //возвращает строку, ограниченную p2 и p3
            string str1 = p1;
            int Position1;
            if (p2 != null && p3 == null)
            {
                Position1 = str1.IndexOf(p2);
                if (Position1 >= 0)
                {
                    return str1.Substring(Position1 + p2.Length);
                }
            }
            else if (p2 == null && p3 != null)
            {
                Position1 = str1.IndexOf(p3) + 1;
                if (Position1 > 0)
                {
                    return str1.Substring(0, Position1 - 1);
                }
            }
            else if (p2 != null && p3 != null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    string Стр2;
                    Стр2 = str1.Substring(Position1 + p2.Length);
                    int Position2 = Стр2.IndexOf(p3) + 1;
                    int SumPosition2 = Position2;
                    while (Position2 > 0)
                    {
                        if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
                        {
                            return Стр2.Substring(0, SumPosition2 - 1);
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
            return null;
        }

        [ContextProperty("СлучайноеИмя", "TempName")]
        public string TempName
        {
            get { return Utils.TempName; }
        }

        [ContextMethod("Математика", "Math")]
        public OsiMath Math()
        {
            return new OsiMath();
        }

        [ContextMethod("ДвоичныеПредставления", "BinaryRepresentations")]
        public ArrayImpl BinaryRepresentations(int startNumber, int endNumber, bool padWithZeros = true)
        {
            ArrayImpl array = new ArrayImpl();
            if (endNumber <= startNumber)
            {
                return array;
            }

            // Вычисляем необходимую длину битовой строки.
            // Используем p2 - 1, так как цикл идет до p2 (не включая его).
            // Если диапазон включает 0, минимальная длина должна быть хотя бы 1.
            int maxVal = endNumber - 1;
            int bitLength = maxVal > 0 ? Convert.ToString(maxVal, 2).Length : 1;

            for (int i = startNumber; i <= endNumber; i++)
            {
                string binaryStr = Convert.ToString(i, 2);

                // Если флаг padWithZeros истинен, добавляем лидирующие нули.
                if (padWithZeros)
                {
                    binaryStr = binaryStr.PadLeft(bitLength, '0');
                }

                array.Add(ValueFactory.Create(binaryStr));
            }
            return array;
        }

        [ContextMethod("ДвоичныеДанныеВДвоичнуюСтроку", "BinaryDataToBinaryString")]
        public string BinaryDataToZeroOne(string filePath)
        {
            StringBuilder sb = new StringBuilder();
            byte[] data = ReadBinaryFileFast(filePath);
            for (int i = 0; i < data.Length; i++)
            {
                string binaryStr = Convert.ToString(data[i], 2);
                sb.Append(binaryStr);
            }
            string result = sb.ToString();

            return result;
        }

        public static byte[] ReadBinaryFileFast(string filePath)
        {
            using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.Read, 4096, false))
            {
                byte[] buffer = new byte[fs.Length];
                int bytesRead = fs.Read(buffer, 0, buffer.Length);
                if (bytesRead != buffer.Length)
                {
                    throw new IOException("Не удалось прочитать весь файл");
                }
                return buffer;
            }
        }

        [ContextProperty("ОбщаяСтруктура", "ShareStructure")]
        public StructureImpl ShareStructure
        {
            get { return shareStructure; }
        }

        [ContextMethod("ВвестиГлобальноеСвойство", "InjectGlobalProperty")]
        public void InjectGlobalProperty(IValue p1, string p2, bool p3)
        {
            var cfgAccessor = GlobalsManager.GetGlobalContext<SystemGlobalContext>();
            cfgAccessor.EngineInstance.Environment.InjectGlobalProperty(p1, p2, p3);
        }

        [ContextMethod("ДесятичноеИзДвоичнойСтроки", "NumberFromBinaryString")]
        public int NumberFromBinaryString(string binaryString)
        {
            return Convert.ToInt32(binaryString, 2);
        }

        [ContextMethod("РазделитьНаПодстроки", "DivideToSubstrings")]
        public string DivideBase64(string divideString, int length)
        {
            StringBuilder text = new StringBuilder();
            foreach (string chunk in ReadByChunks(divideString, length))
            {
                text.Append("\u0022" + chunk + "\u0022" + " +\n");
            }
            return text.ToString().Remove(text.Length - 3);
        }

        public static IEnumerable<string> ReadByChunks(string input, int chunkSize)
        {
            for (int i = 0; i < input.Length; i += chunkSize)
            {
                string chunk = input.Substring(i, System.Math.Min(chunkSize, input.Length - i));
                yield return chunk;
            }
        }

        [ContextMethod("ЗагрузитьСценарии", "LoadScripts")]
        public StructureImpl LoadScripts(IRuntimeContextInstance p1, string folderName)
        {
            var cfgAccessor = GlobalsManager.GetGlobalContext<SystemGlobalContext>();
            StructureImpl scripts = new StructureImpl();
            StructureImpl attachByPath = new StructureImpl();
            StructureImpl extContext = new StructureImpl();

            IRuntimeContextInstance startupScript = cfgAccessor.StartupScript();
            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Source")).AsString();
            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
            string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, "").Replace(".os", "").Replace(separator, "");
            extContext.Insert(nameStartupScript, ValueFactory.Create(p1));
            extContext.Insert("ОбщаяСтруктура", shareStructure);
            scripts.Insert(nameStartupScript, (IValue)p1);

            string directoryScenario = DirectoryScenario(p1);

            bool isWin = System.Environment.OSVersion.VersionString.Contains("Microsoft");
            if (isWin)
            {
                if (folderName == @".\")
                {
                    string path = directoryScenario + @"\Классы\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = directoryScenario + @"\Модули\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (folderName == @"..\")
                {
                    string path = Path.GetDirectoryName(directoryScenario) + @"\Классы\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = Path.GetDirectoryName(directoryScenario) + @"\Модули\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (!(folderName.Contains(@".\") || folderName.Contains(@"..\")))
                {
                    string[] result2 = folderName.Split(new string[] { ";", "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
                    string path = "";
                    for (int i1 = 0; i1 < result2.Length; i1++)
                    {
                        path = result2[i1].Replace("\u0022", "").Trim();
                        if (Directory.Exists(path))
                        {
                            string[] files = Directory.GetFiles(path, "*.os");
                            for (int i2 = 0; i2 < files.Length; i2++)
                            {
                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i2])));
                            }
                        }
                    }
                }
            }
            else
            {
                if (folderName == @"./")
                {
                    string path = directoryScenario + @"/Классы/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = directoryScenario + @"/Модули/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (folderName == @"../")
                {
                    string path = Path.GetDirectoryName(directoryScenario) + @"/Классы/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = Path.GetDirectoryName(directoryScenario) + @"/Модули/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (!(folderName.Contains(@"./") || folderName.Contains(@"../")))
                {
                    string[] result2 = folderName.Split(new string[]
                    { ";", "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
                    string path = "";
                    for (int i1 = 0; i1 < result2.Length; i1++)
                    {
                        path = result2[i1].Replace("\u0022", "").Trim();
                        if (Directory.Exists(path))
                        {
                            string[] files = Directory.GetFiles(path, "*.os");
                            for (int i2 = 0; i2 < files.Length; i2++)
                            {
                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i2])));
                            }
                        }
                    }
                }
            }
            foreach (var item in attachByPath)
            {
                IRuntimeContextInstance inst = cfgAccessor.LoadScript(item.Value.AsString(), extContext);
                scripts.Insert(item.Key.AsString(), (IValue)inst);
            }
            return scripts;
        }

        [ContextProperty("ИмяПродукта", "ProductName")]
        public string ProductName
        {
            get { return ((AssemblyTitleAttribute)Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyTitleAttribute), false)[0]).Title.ToString(); }
        }

        [ContextMethod("РазобратьСтроку", "DisassembleString")]
        public ArrayImpl DisassembleString(string input, string delimiter)
        {
            if (string.IsNullOrEmpty(input))
            {
                return new ArrayImpl();
            }

            List<string> list = input.Split(new[] { delimiter }, StringSplitOptions.None).ToList();
            ArrayImpl array = new ArrayImpl();
            for (int i = 0; i < list.Count; i++)
            {
                array.Add(ValueFactory.Create(list[i]));
            }
            return array;
        }

        [ContextMethod("СтрНайтиМежду", "StrFindBetween")]
        public ArrayImpl StrFindBetween(string p1, string p2 = null, string p3 = null, bool p4 = true, bool p5 = true)
        {
            ArrayImpl array = FindHelper.FindBetweenOptimized(p1, p2, p3, p4, p5);
            return array;
        }

        [ContextMethod("ПутьСценария", "PathScenario")]
        public string PathScenario(IRuntimeContextInstance p1)
        {
            UserScriptContextInstance scr = (UserScriptContextInstance)p1.GetPropValue(0);
            return scr.Module.ModuleInfo.ModuleName;
        }

        [ContextMethod("КаталогСценария", "DirectoryScenario")]
        public string DirectoryScenario(IRuntimeContextInstance p1)
        {
            UserScriptContextInstance scr = (UserScriptContextInstance)p1.GetPropValue(0);
            return Path.GetDirectoryName(scr.Module.ModuleInfo.ModuleName);
        }

        [ContextMethod("РодительскийКаталог", "ParentDirectory")]
        public string ParentDirectory(string p1)
        {
            return Path.GetDirectoryName(p1);
        }

        [ContextMethod("ПолучитьКодСценария", "GetScriptCode")]
        public string GetScriptCode(UserScriptContextInstance p1)
        {
            UserScriptContextInstance scr = (UserScriptContextInstance)p1.GetPropValue(0);
            return File.ReadAllText(scr.Module.ModuleInfo.ModuleName);
        }

        [ContextMethod("ФайлыРавны", "FilesEqual")]
        public bool FilesEqual(string path1, string path2)
        {
            return Utils.FilesEqual(path1, path2);
        }

        [ContextProperty("Кодировка", "Encoding")]
        public OsiEncoding EncodingProp
        {
            get { return new OsiEncoding(); }
        }

        [ContextMethod("Кодировка", "Encoding")]
        public OsiEncoding Encoding()
        {
            return new OsiEncoding();
        }

        [ContextMethod("ИнформацияЗапускаПроцесса", "ProcessStartInfo")]
        public OsiProcessStartInfo ProcessStartInfo(string p1 = null, string p2 = null)
        {
            return new OsiProcessStartInfo(p1, p2);
        }

        [ContextMethod("Процесс", "Process")]
        public OsiProcess Process()
        {
            return new OsiProcess();
        }

        [ContextProperty("СтильОкнаПроцесса", "ProcessWindowStyle")]
        public OsiProcessWindowStyle ProcessWindowStyle
        {
            get { return new OsiProcessWindowStyle(); }
        }
    }
}
