using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

namespace osi
{
    [ContextClass ("ОсиАргументы", "OsiEventArgs")]
    public class OsiEventArgs : AutoContext<OsiEventArgs>
    {
        private IValue parameter;

        public OsiEventArgs()
        {
        }
        
        [ContextProperty("Параметр", "Parameter")]
        public IValue Parameter
        {
            get { return parameter; }
            set { parameter = value; }
        }
        
    }
}
