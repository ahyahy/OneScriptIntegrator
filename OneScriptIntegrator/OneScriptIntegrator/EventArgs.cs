using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System;

namespace osi
{
    [ContextClass("ОсиАргументыСобытия", "OsiEventArgs")]
    public class OsiEventArgs : AutoContext<OsiEventArgs>
    {
        public OsiAction EventAction;

        public OsiEventArgs()
        {
        }

        [ContextProperty("Отправитель", "Sender")]
        public IValue Sender { get; set; }

        [ContextProperty("Параметр", "Parameter")]
        public IValue Parameter { get; set; }

        [ContextProperty("ИмяНаблюдаемого", "ObservableName")]
        public string ObservableName { get; set; }

        [ContextProperty("ПолныйПуть", "FullPath")]
        public string FullPath { get; set; }

        [ContextProperty("ТипИзменения", "ChangeType")]
        public int ChangeType { get; set; }

        [ContextProperty("СтароеИмя", "OldName")]
        public string OldName { get; set; }

        [ContextProperty("СтарыйПолныйПуть", "OldFullPath")]
        public string OldFullPath { get; set; }

        [ContextProperty("ВремяЗакрытия", "ExitTime")]
        public DateTime ExitTime { get; set; }

        [ContextProperty("Данные", "Data")]
        public string Data { get; set; }
    }
}
