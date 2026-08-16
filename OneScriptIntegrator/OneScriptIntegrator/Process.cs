using ScriptEngine.Machine.Contexts;
using System;

namespace osi
{
    [ContextClass("ОсиПроцесс", "OsiProcess")]
    public class OsiProcess : AutoContext<OsiProcess>, IDisposable
    {
        public System.Diagnostics.Process Base_obj;
        private OsiProcessStartInfo startInfo;
        private bool _isRunning;

        public OsiProcess()
        {
            Base_obj = new System.Diagnostics.Process();
            Base_obj.EnableRaisingEvents = true;
            Base_obj.OutputDataReceived += Base_obj_OutputDataReceived;
            _isRunning = false;
        }

        public OsiProcess(System.Diagnostics.Process p1)
        {
            Base_obj = p1;
            Base_obj.EnableRaisingEvents = true;
            Base_obj.OutputDataReceived += Base_obj_OutputDataReceived;
            _isRunning = false;
        }

        private void Base_obj_OutputDataReceived(object sender, System.Diagnostics.DataReceivedEventArgs e)
        {
            if (OutputDataReceived != null)
            {
                if (string.IsNullOrEmpty(e.Data))
                {
                    return;
                }

                var args = new OsiEventArgs
                {
                    EventAction = OutputDataReceived,
                    Sender = this,
                    Data = e.Data,
                    Parameter = OutputDataReceived.Parameter,
                };
                OneScriptIntegrator.EventQueue.Enqueue(args);
            }
        }

        [ContextProperty("ВремяНачала", "StartTime")]
        public DateTime StartTime
        {
            get { return Base_obj.StartTime; }
        }

        [ContextProperty("Дескриптор", "Handle")]
        public decimal Handle
        {
            get { return (decimal)Base_obj.Handle; }
        }

        [ContextProperty("ИмяПроцесса", "ProcessName")]
        public string ProcessName
        {
            get { return Base_obj.ProcessName; }
        }

        [ContextProperty("ПриЗакрытии", "Exited")]
        public OsiAction Exited { get; set; }

        [ContextProperty("ПриПолученииДанных", "OutputDataReceived")]
        public OsiAction OutputDataReceived { get; set; }

        [ContextProperty("Закрыт", "HasExited")]
        public bool HasExited
        {
            get { return Base_obj.HasExited; }
        }

        [ContextProperty("Идентификатор", "Id")]
        public int Id
        {
            get { return Base_obj.Id; }
        }

        [ContextProperty("НачальнаяИнформация", "StartInfo")]
        public OsiProcessStartInfo StartInfo
        {
            get
            {
                if (startInfo == null)
                {
                    startInfo = new OsiProcessStartInfo(Base_obj.StartInfo);
                }
                return startInfo;
            }
            set
            {
                startInfo = value;
                Base_obj.StartInfo = value.Base_obj;
            }
        }

        [ContextMethod("Уничтожить", "Kill")]
        public void Kill()
        {
            // Проверяем дважды: вдруг он уже умер сам по себе?
            if (!_isRunning || Base_obj == null) return;

            try
            {
                if (!Base_obj.HasExited)
                {
                    if (Exited != null)
                    {
                        var args = new OsiEventArgs
                        {
                            EventAction = Exited,
                            Sender = this,
                            ExitTime = DateTime.Now,
                            Parameter = Exited.Parameter,
                        };
                        OneScriptIntegrator.EventQueue.Enqueue(args);
                    }

                    Base_obj.Kill(); // Только если точно жив

                    // ВАЖНО: Даем процессу долю секунды, чтобы он корректно закрыл свои дескрипторы
                    Base_obj.WaitForExit(100);
                }
            }
            catch (InvalidOperationException)
            {
                // Процесс уже закрыт кем-то другим или системой. Это нормально.
            }
            finally
            {
                _isRunning = false;
                Dispose(); // Освобождаем ресурсы принудительно
            }
        }

        [ContextMethod("Начать", "Start")]
        public bool Start()
        {
            _isRunning = Base_obj.Start();
            return _isRunning;
        }

        [ContextMethod("НачатьЧтениеВывода", "BeginOutputReadLine")]
        public void BeginOutputReadLine()
        {
            Base_obj.BeginOutputReadLine();
        }

        [ContextMethod("ОтменитьЧтениеВывода", "CancelOutputRead")]
        public void CancelOutputRead()
        {
            Base_obj.CancelOutputRead();
        }

        [ContextMethod("ОжидатьЗакрытия", "WaitForExit")]
        public bool WaitForExit(int milliseconds = -1)
        {
            if (!_isRunning || Base_obj == null)
            {
                return false;
            }
            return Base_obj.WaitForExit(milliseconds);
        }

        public void Dispose()
        {
            Base_obj.Dispose();
        }
    }
}
