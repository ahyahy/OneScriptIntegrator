using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

namespace osi
{
    [ContextClass ("ОсиДействие", "OsiAction")]
    public class OsiAction : AutoContext<OsiAction>
    {
        public OsiAction(IRuntimeContextInstance script, string methodName, IValue param = null)
        {
            Script = script;
            MethodName = methodName;
            Parameter = param;
        }

        public OsiAction()
        {
        }

        [ContextProperty("ИмяМетода", "MethodName")]
        public string MethodName { get; set; }
        
        [ContextProperty("Параметр", "Parameter")]
        public IValue Parameter { get; set; }
        
        [ContextProperty("Сценарий", "Script")]
        public IRuntimeContextInstance Script { get; set; }
        
    }
}
