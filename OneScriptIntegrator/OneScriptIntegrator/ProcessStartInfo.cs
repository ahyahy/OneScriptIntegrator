using ScriptEngine.Machine.Contexts;

namespace osi
{
    [ContextClass("ОсиИнформацияЗапускаПроцесса", "OsiProcessStartInfo")]
    public class OsiProcessStartInfo : AutoContext<OsiProcessStartInfo>
    {
        public System.Diagnostics.ProcessStartInfo Base_obj;

        public OsiProcessStartInfo(string p1 = null, string p2 = null)
        {
            Base_obj = new System.Diagnostics.ProcessStartInfo(p1, p2);
        }

        public OsiProcessStartInfo(System.Diagnostics.ProcessStartInfo p1)
        {
            Base_obj = p1;
        }

        [ContextProperty("Аргументы", "Arguments")]
        public string Arguments
        {
            get { return Base_obj.Arguments; }
            set { Base_obj.Arguments = value; }
        }

        [ContextProperty("ИмяФайла", "FileName")]
        public string FileName
        {
            get { return Base_obj.FileName; }
            set { Base_obj.FileName = value; }
        }

        [ContextProperty("ИспользоватьОболочку", "UseShellExecute")]
        public bool UseShellExecute
        {
            get { return Base_obj.UseShellExecute; }
            set { Base_obj.UseShellExecute = value; }
        }

        [ContextProperty("КодировкаВыходногоПотока", "StandardOutputEncoding")]
        public OsiEncoding StandardOutputEncoding
        {
            get { return new OsiEncoding(Base_obj.StandardOutputEncoding); }
            set { Base_obj.StandardOutputEncoding = value.Base_obj; }
        }

        [ContextProperty("ПеренаправитьВывод", "RedirectStandardOutput")]
        public bool RedirectStandardOutput
        {
            get { return Base_obj.RedirectStandardOutput; }
            set { Base_obj.RedirectStandardOutput = value; }
        }

        [ContextProperty("РабочийКаталог", "WorkingDirectory")]
        public string WorkingDirectory
        {
            get { return Base_obj.WorkingDirectory; }
            set { Base_obj.WorkingDirectory = value; }
        }

        [ContextProperty("СоздатьБезОкна", "CreateNoWindow")]
        public bool CreateNoWindow
        {
            get { return Base_obj.CreateNoWindow; }
            set { Base_obj.CreateNoWindow = value; }
        }

        [ContextProperty("СтильОкна", "WindowStyle")]
        public int WindowStyle
        {
            get { return (int)Base_obj.WindowStyle; }
            set { Base_obj.WindowStyle = (System.Diagnostics.ProcessWindowStyle)value; }
        }
    }
}
