using System;
using System.Threading;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

namespace osi
{
    [ContextClass("ОсиТаймер", "OsiTimer")]
    public class OsiTimer : AutoContext<OsiTimer>, IDisposable
    {
        private System.Threading.Timer _timer;
        private bool _isRunning;
        private int _interval;
        private int _delay;

        public OsiTimer()
        {
            _isRunning = false;
            _interval = 1000;
            _delay = 0;
        }

        [ContextProperty("Интервал", "Interval")]
        public int Interval
        {
            get { return _interval; }
            set
            {
                _interval = value;
                if (_isRunning && _timer != null)
                {
                    // Если таймер запущен, меняем интервал на лету
                    _timer.Change(_delay, _interval);
                }
            }
        }

        [ContextProperty("Активен", "Enabled")]
        public bool Enabled
        {
            get { return _isRunning; }
        }

        [ContextProperty("Задержка", "Delay")]
        public int Delay
        {
            get { return _delay; }
            set { _delay = value; }
        }

        [ContextMethod("Начать", "Start")]
        public void Start(OsiAction аction = null, IValue interval = null, IValue delay = null)
        {
            if (Utils.AllNotNull(аction))
            {
                OnTickEvent = аction;
            }
            if (!Utils.AllNotNull(OnTickEvent))
            {
                return;
            }
            if (Utils.AllNotNull(interval))
            {
                _interval = Utils.ToInt32(interval);
            }
            if (Utils.AllNotNull(delay))
            {
                _delay = Utils.ToInt32(delay);
            }
            StartTimer();
        }

        public void StartTimer()
        {
            if (_isRunning)
            {
                return;
            }
            _timer = new System.Threading.Timer(OnTimerTick, null, _delay, _interval);
            _isRunning = true;
        }

        public void StartOneOff()
        {
            if (_isRunning)
            {
                return;
            }
            _timer = new System.Threading.Timer(OnTimerTick, true, _delay, _interval);
            _isRunning = true;
        }

        [ContextMethod("Остановить", "Stop")]
        public void Stop()
        {
            if (!_isRunning || _timer == null)
            {
                return;
            }

            _timer.Change(Timeout.Infinite, Timeout.Infinite);
            _timer.Dispose();
            _timer = null;
            _isRunning = false;
        }

        private void OnTimerTick(object state)
        {
            if (!_isRunning)
            {
                return;
            }

            try
            {
                if (OnTickEvent != null)
                {
                    var args = new OsiEventArgs
                    {
                        EventAction = OnTickEvent,
                        Sender = this,
                        Parameter = OnTickEvent.Parameter,
                    };
                    if (state != null)
                    {
                        if ((bool)state)
                        {
                            Stop();
                        }
                    }
                    OneScriptIntegrator.EventQueue.Enqueue(args);
                }
            }
            catch (Exception ex)
            {
                Utils.Echo($"Ошибка в таймере: {ex.Message}");
            }
        }

        [ContextProperty("ПриСрабатыванииТаймера", "Tick")]
        public OsiAction OnTickEvent { get; set; }

        [ContextProperty("Метка", "Tag")]
        public IValue Tag { get; set; }

        // Очистка ресурсов при удалении.
        public void Dispose()
        {
            Stop();
        }
    }
}
