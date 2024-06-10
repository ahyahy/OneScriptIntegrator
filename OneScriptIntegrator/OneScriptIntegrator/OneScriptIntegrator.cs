using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Collections;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;
using System.Runtime.InteropServices;
using ScriptEngine.HostedScript.Library;

namespace osi
{
    [ContextClass("ИнтеграторОдноСкрипта", "OneScriptIntegrator")]
    public class OneScriptIntegrator : AutoContext<OneScriptIntegrator>
    {
        private OsiEventArgs eventArgs;
        private static StructureImpl shareStructure = new StructureImpl();
        private static string separator = Path.DirectorySeparatorChar.ToString();
        private static OneScriptIntegrator instance;
        public static bool systemVersionIsMicrosoft = false;
        private static object syncRoot = new Object();

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
            inst.InjectGlobalProperty(shareStructure, "ОбщаяСтруктура", false);
            return inst;
        }

        [ContextMethod("Действие", "Action")]
        public OsiAction Action(IRuntimeContextInstance script, string methodName, IValue param = null)
        {
            return new OsiAction(script, methodName, param);
        }

        [ContextProperty("АргументыСобытия", "EventArgs")]
        public IValue EventArgs
        {
            get { return eventArgs; }
        }

        [ContextMethod("Выполнить", "Execute")]
        public IValue Execute(OsiAction p1)
        {
            eventArgs = new OsiEventArgs();
            eventArgs.Parameter = p1.Parameter;

            OsiAction Action1 = p1;
            IRuntimeContextInstance script = Action1.Script;
            string method = Action1.MethodName;
            ReflectorContext reflector = new ReflectorContext();
            IValue res = null;
            try
            {
                res = reflector.CallMethod(script, method, null);
            }
            catch { }
            return res;
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
            extContext.Insert("ОбщаяСтуктура", shareStructure);
            scripts.Insert(nameStartupScript, (IValue)p1);

            bool isWin = System.Environment.OSVersion.VersionString.Contains("Microsoft");
            if (isWin)
            {
                if (folderName == @".\") 
                { 
                    string path = @".\Классы\"; 
                    if (Directory.Exists(path)) 
                    { 
                        string[] files = Directory.GetFiles(path, "*.os"); 
                        for (int i1 = 0; i1 < files.Length; i1++) 
                        { 
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        } 
                    } 
                    path = @".\Модули\"; if (Directory.Exists(path)) 
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
                    string path = @"..\Классы\"; 
                    if (Directory.Exists(path)) 
                    { 
                        string[] files = Directory.GetFiles(path, "*.os"); 
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        } 
                    } 
                    path = @"..\Модули\"; 
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
                    string path = @"./Классы/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os"); 
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @"./Модули/"; 
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
                    string path = @"../Классы/"; 
                    if (Directory.Exists(path)) 
                    { 
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++) 
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    } 
                    path = @"../Модули/"; 
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
    }
}
