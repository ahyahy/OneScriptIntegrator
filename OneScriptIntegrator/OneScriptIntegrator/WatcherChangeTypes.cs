using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections;
using System.Collections.Generic;

namespace osi
{
    [ContextClass("ОсиТипыИзмененийНаблюдателя", "OsiWatcherChangeTypes")]
    public class OsiWatcherChangeTypes : AutoContext<OsiWatcherChangeTypes>, ICollectionContext, IEnumerable<IValue>
    {
        private List<IValue> _list;

        public int Count()
        {
            return _list.Count;
        }

        public CollectionEnumerator GetManagedIterator()
        {
            return new CollectionEnumerator(this);
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return ((IEnumerable<IValue>)_list).GetEnumerator();
        }

        IEnumerator<IValue> IEnumerable<IValue>.GetEnumerator()
        {
            foreach (var item in _list)
            {
                yield return (item as IValue);
            }
        }

        [ContextProperty("Количество", "Count")]
        public int CountProp
        {
            get { return _list.Count; }
        }

        [ContextMethod("Получить", "Get")]
        public IValue Get(int index)
        {
            return _list[index];
        }

        [ContextMethod("Имя")]
        public string NameRu(decimal p1)
        {
            return namesRu.TryGetValue(p1, out string name) ? name : p1.ToString();
        }

        [ContextMethod("Name")]
        public string NameEn(decimal p1)
        {
            return namesEn.TryGetValue(p1, out string name) ? name : p1.ToString();
        }

        private static readonly Dictionary<decimal, string> namesRu = new Dictionary<decimal, string>
        {
            {15, "Все"},
            {4, "Изменение"},
            {8, "Переименование"},
            {1, "Создание"},
            {2, "Удаление"},
        };

        private static readonly Dictionary<decimal, string> namesEn = new Dictionary<decimal, string>
        {
            {15, "All"},
            {4, "Changed"},
            {8, "Renamed"},
            {1, "Created"},
            {2, "Deleted"},
        };

        public OsiWatcherChangeTypes()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(All));
            _list.Add(ValueFactory.Create(Changed));
            _list.Add(ValueFactory.Create(Created));
            _list.Add(ValueFactory.Create(Deleted));
            _list.Add(ValueFactory.Create(Renamed));
        }

        [ContextProperty("Все", "All")]
        public int All
        {
            get { return 15; }
        }

        [ContextProperty("Изменение", "Changed")]
        public int Changed
        {
            get { return 4; }
        }

        [ContextProperty("Переименование", "Renamed")]
        public int Renamed
        {
            get { return 8; }
        }

        [ContextProperty("Создание", "Created")]
        public int Created
        {
            get { return 1; }
        }

        [ContextProperty("Удаление", "Deleted")]
        public int Deleted
        {
            get { return 2; }
        }
    }
}
