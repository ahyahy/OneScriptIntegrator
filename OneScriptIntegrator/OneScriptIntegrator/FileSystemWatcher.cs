using System;
using ScriptEngine.Machine.Contexts;

namespace osi
{
    [ContextClass("ОсиНаблюдательФайловойСистемы", "OsiFileSystemWatcher")]
    public class OsiFileSystemWatcher : AutoContext<OsiFileSystemWatcher>, IDisposable
    {
        public System.IO.FileSystemWatcher Base_obj;

        public OsiFileSystemWatcher()
        {
            Base_obj = new System.IO.FileSystemWatcher();
            Base_obj.Renamed += Base_obj_Renamed;
            Base_obj.Deleted += Base_obj_Deleted;
            Base_obj.Created += Base_obj_Created;
            Base_obj.Changed += Base_obj_Changed;
        }

        private void Base_obj_Changed(object sender, System.IO.FileSystemEventArgs e)
        {
            if (Changed != null)
            {
                var args = new OsiEventArgs
                {
                    EventAction = Changed,
                    Sender = this,
                    Parameter = Changed.Parameter,
                    ChangeType = (int)e.ChangeType,
                    FullPath = e.FullPath,
                    ObservableName = e.Name,
                };
                OneScriptIntegrator.EventQueue.Enqueue(args);
            }
        }

        private void Base_obj_Created(object sender, System.IO.FileSystemEventArgs e)
        {
            if (Created != null)
            {
                var args = new OsiEventArgs
                {
                    EventAction = Created,
                    Sender = this,
                    Parameter = Created.Parameter,
                    ChangeType = (int)e.ChangeType,
                    FullPath = e.FullPath,
                    ObservableName = e.Name,
                };
                OneScriptIntegrator.EventQueue.Enqueue(args);
            }
        }

        private void Base_obj_Deleted(object sender, System.IO.FileSystemEventArgs e)
        {
            if (Deleted != null)
            {
                var args = new OsiEventArgs
                {
                    EventAction = Deleted,
                    Sender = this,
                    Parameter = Deleted.Parameter,
                    ChangeType = (int)e.ChangeType,
                    FullPath = e.FullPath,
                    ObservableName = e.Name,
                };
                OneScriptIntegrator.EventQueue.Enqueue(args);
            }
        }

        private void Base_obj_Renamed(object sender, System.IO.RenamedEventArgs e)
        {
            if (Renamed != null)
            {
                var args = new OsiEventArgs
                {
                    EventAction = Renamed,
                    Sender = this,
                    Parameter = Renamed.Parameter,
                    ChangeType = (int)e.ChangeType,
                    FullPath = e.FullPath,
                    ObservableName = e.Name,
                    OldFullPath = e.OldFullPath,
                    OldName = e.OldName,
                };
                OneScriptIntegrator.EventQueue.Enqueue(args);
            }
        }

        [ContextProperty("ВключаяПодкаталоги", "IncludeSubdirectories")]
        public bool IncludeSubdirectories
        {
            get { return Base_obj.IncludeSubdirectories; }
            set { Base_obj.IncludeSubdirectories = value; }
        }

        [ContextProperty("КомпонентДоступен", "EnableRaisingEvents")]
        public bool EnableRaisingEvents
        {
            get { return Base_obj.EnableRaisingEvents; }
            set { Base_obj.EnableRaisingEvents = value; }
        }

        [ContextProperty("ПриИзменении", "Changed")]
        public OsiAction Changed { get; set; }

        [ContextProperty("ПриПереименовании", "Renamed")]
        public OsiAction Renamed { get; set; }

        [ContextProperty("ПриСоздании", "Created")]
        public OsiAction Created { get; set; }

        [ContextProperty("ПриУдалении", "Deleted")]
        public OsiAction Deleted { get; set; }

        [ContextProperty("Путь", "Path")]
        public string Path
        {
            get { return Base_obj.Path; }
            set { Base_obj.Path = value; }
        }

        [ContextProperty("РазмерВнутреннегоБуфера", "InternalBufferSize")]
        public int InternalBufferSize
        {
            get { return Base_obj.InternalBufferSize; }
            set { Base_obj.InternalBufferSize = value; }
        }

        [ContextProperty("Фильтр", "Filter")]
        public string Filter
        {
            get { return Base_obj.Filter; }
            set { Base_obj.Filter = value; }
        }

        [ContextProperty("ФильтрУведомлений", "NotifyFilter")]
        public int NotifyFilter
        {
            get { return (int)Base_obj.NotifyFilter; }
            set { Base_obj.NotifyFilter = (System.IO.NotifyFilters)value; }
        }

        public void Dispose()
        {
            Base_obj.Dispose();
        }
    }
}
