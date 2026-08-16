using System;
using System.IO;
using ScriptEngine.Environment;
using ScriptEngine.HostedScript;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine;
using ScriptEngine.Machine.Contexts;
using System.Text;
using System.Reflection;

namespace SharpAndOs
{
    class Program
    {
        static void Main(string[] args)
        {
            // Выдержка из диалога чата:
            //можно ли как-то подключить oscript как встраиваемый язык к существующему проекту на C#? 
            //+Чтобы взял, создал инстанс виртуальной машины,
            //+туда же на месте зарегистрировал свои шарповые классы(естественно, снабженные всеми нужными аттрибутами),
            //+выполнил скрипт из файла/ потока / строки — и прочитал обратно из контекста какой-нибудь объект, и что-то сделал с ним уже в C#.
            //+Может даже прочитал скрипт и вызвал из него функцию как-нибудь позже.
            //Кажется, это реализуется в модуле HostedScript

            // Подготовим сценарии примеров и запишем их рядом с исполняемым файлом.
            string dir = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            string dirKlass = Path.Combine(dir, "Классы");
            Directory.CreateDirectory(dirKlass);
            string pathSum = Path.Combine(dir, "Сумматор.os");
            File.WriteAllText(pathSum, strSum, Encoding.UTF8);
            string pathMultiplier = Path.Combine(dirKlass, "Умножитель.os");
            File.WriteAllText(pathMultiplier, strMultiplier, Encoding.UTF8);

            HostedScriptEngine hostedScript = new HostedScriptEngine();
            hostedScript.CustomConfig = HostedScriptEngine.ConfigFileName;
            // var source = hostedScript.Loader.FromFile(@"C:\111\Стартовый.os"); // Можно скрипт загрузить.
            ICodeSource source = hostedScript.Loader.FromString(""); // Можно из строки загрузить. Хотя бы из пустой.
            // Собственно ради возможности в этом месте загрузить скрипт из строки и создан измененный HostConsole.cs
            Process process = hostedScript.CreateProcess(new HostConsole(), source);
            // process можно и не стартовать, но создать необходимо. Иначе globalContext не получим.
            // А теперь можно получить globalContext.
            SystemGlobalContext globalContext = GlobalsManager.GetGlobalContext<SystemGlobalContext>();


            // Загрузим сценарии примеров.
            string folderName = dirKlass;
            StructureImpl scripts = new StructureImpl(); // Структура с загружаемыми скриптами.
            StructureImpl attachByPath = new StructureImpl(); // Структура с именами файлов загружаемых скриптов.
            if (Directory.Exists(folderName))
            {
                string[] files = Directory.GetFiles(folderName, "*.os");
                for (int i2 = 0; i2 < files.Length; i2++)
                {
                    attachByPath.Insert(Path.GetFileName(files[i2]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i2])));
                }
            }
            foreach (var item in attachByPath)
            {
                IRuntimeContextInstance inst = globalContext.LoadScript(item.Value.AsString());
                scripts.Insert(item.Key.AsString(), (IValue)inst);
                // Сообщим в консоль имя подключаемого скрипта и имя его файла.
                Console.WriteLine("Подключен = " + item.Key.AsString() + " из файла " + item.Value.AsString());
            }

            // Вызовем функцию из подключенного скрипта Умножитель и получим результат.
            int num = scripts.FindProperty("Умножитель");
            IValue val1 = scripts.GetPropValue(num);
            IRuntimeContextInstance script = (IRuntimeContextInstance)val1;
            string method = "Умножить";
            ReflectorContext reflector = new ReflectorContext();
            IValue res = null;
            ArrayImpl param = new ArrayImpl();
            param.Add(ValueFactory.Create(5));
            param.Add(ValueFactory.Create(8));
            try
            {
                res = reflector.CallMethod(script, method, param);
            }
            catch { }
            Console.WriteLine("перемножение = " + res);

            // Получим переменную из скрипта Умножитель
            Console.WriteLine("ЧислоИзУмножителя = " + script.GetPropValue(script.FindProperty("ЧислоИзУмножителя")));

            // Введем глобальное свойство присвоив ему значение нашего класса c# MyClass
            globalContext.EngineInstance.Environment.InjectGlobalProperty(new MyClass(), "МойКласс", false);

            // Подключим скрипт Сумматор
            IRuntimeContextInstance inst2 = globalContext.LoadScript(pathSum);
            scripts.Insert("Сумматор", (IValue)inst2);

            // Вызовем функцию ПеременнаяИзМойКласс из подключенного скрипта Сумматор и получим результат.
            int num2 = scripts.FindProperty("Сумматор");
            IValue val2 = scripts.GetPropValue(num2);
            IRuntimeContextInstance script2 = (IRuntimeContextInstance)val2;
            string method2 = "ПеременнаяИзМойКласс";
            ReflectorContext reflector2 = new ReflectorContext();
            IValue res2 = null;
            try
            {
                res2 = reflector2.CallMethod(script2, method2, null);
            }
            catch { }
            Console.WriteLine("ПеременнаяИзМойКласс = " + res2);

            // Не закрываем консоль.
            Console.ReadKey();
        }

        private static string strSum = @"Перем МояСтрока Экспорт;

Функция Сложить(парам1, парам2) Экспорт
	Возврат парам1 + парам2;
КонецФункции

Функция ПеременнаяИзМойКласс() Экспорт
	Возврат МойКласс.МояСтрока;
КонецФункции

МойКласс.МояСтрока = ""Новое значение для МояСтрока"";
";
        private static string strMultiplier = @"Перем ЧислоИзУмножителя Экспорт;

Функция Умножить(парам1, парам2) Экспорт
	Возврат парам1 * парам2;
КонецФункции

ЧислоИзУмножителя = 36746582367;
";
    }

    class HostConsole : IHostApplication
    {
        private static string separator = Path.DirectorySeparatorChar.ToString();
        private static string currentDirectory = Directory.GetParent(Assembly.GetExecutingAssembly().Location).FullName;
        private static string pathEr = currentDirectory + separator + "error.log";
        private static string prefix = "" + Environment.NewLine + DateTime.Now + Environment.NewLine;

        public void Echo(string text, MessageStatusEnum status = MessageStatusEnum.Ordinary)
        {
            WriteError(text);
        }
        public void ShowExceptionInfo(Exception exc)
        {
            WriteError(exc.Message);
        }
        public bool InputString(out string result, string prompt, int maxLen, bool multiline)
        {
            result = System.Console.ReadLine();
            return true;
        }
        public string[] GetCommandLineArguments()
        {
            return System.Environment.GetCommandLineArgs();
        }
        private static void WriteError(string er)
        {
            try
            {
                File.AppendAllText(pathEr, prefix + er, Encoding.UTF8);
            }
            catch
            {
                File.WriteAllText(pathEr, prefix + er, Encoding.UTF8);
            }
        }
    }

    [ContextClass("МойКласс", "MyClass")]
    public class MyClass : AutoContext<MyClass>
    {
        public MyClass()
        {
            MyString = "Переменная из MyClass";
        }

        [ContextProperty("МояСтрока", "MyString")]
        public string MyString { get; set; }
    }
}
