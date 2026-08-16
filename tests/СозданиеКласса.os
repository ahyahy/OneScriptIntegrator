Перем Ф;
Перем Кнопка1;
Перем Надпись1;
Перем Надпись2;
Перем Надпись3;
Перем Надпись4;
Перем ПолеВвода1;
Перем ПолеВвода2;
Перем ПолеВвода3;
Перем Форма_0;
Перем ИмяРус;
Перем ИмяEn;
Перем Описание;
Перем ВыходнойКаталог;
Перем ПолеВыбора1;
Перем Флажок1;

Перем ПутьКОглавлению;
Перем ПутьКСтранице;

Процедура Кн1_Нажатие() Экспорт
	ИмяРус = СокрЛП(ПолеВвода1.Текст);
	ИмяEn = СокрЛП(ПолеВвода2.Текст);
	Описание = СокрЛП(ПолеВвода3.Текст);

    СоздатьКласс();
КонецПроцедуры

Процедура ПодготовкаКомпонентов()
    // ВАЖНО: Необходимая процедура для поддержки конструктора — не изменяйте содержимое этой процедуры с помощью редактора кода.
    // osdText = "WzzQmtC+0L3RgdGC0YDRg9C60YLQvtGA0YtdDQrQpNC+0YDQvNCwXzAgPSDQpC7QpNC+0YDQvNCwKCk7DQrQndCw0LTQv9C40YHRjDEgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwyID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDEgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDIgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMyA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAzID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQmtC90L7Qv9C60LAxID0g0KQu0JrQvdC+0L/QutCwKCk7DQrQndCw0LTQv9C40YHRjDQgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0KTQu9Cw0LbQvtC6MSA9INCkLtCk0LvQsNC20L7QuigpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNClvQmtC+0L3RgdGC0YDRg9C60YLQvtGA0Ys+XQ0KWzzQodCy0L7QudGB0YLQstCwXQ0KWzzQpNC+0YDQvNCwXzBdDQrQpNC+0YDQvNCwXzAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDY0MCwgNTAxKTsNCtCk0L7RgNC80LBfMC7Qn9GD0YLRjCA9ICJDOlw0NDRcT25lU2NyaXB0SW50ZWdyYXRvclzQpNCw0LHRgNC40LrQsEh0bWxc0KHQvtC30LTQsNC90LjQtdCa0LvQsNGB0YHQsC5vcyI7DQrQpNC+0YDQvNCwXzAu0KHRgtC40LvRjNCh0LrRgNC40L/RgtCwID0gItCh0YLQuNC70YzQodC60YDQuNC/0YLQsCI7DQrQpNC+0YDQvNCwXzAu0KLQtdC60YHRgiA9ICLQodC+0LfQtNCw0L3QuNC1INC60LvQsNGB0YHQsCDQmNC90YLQtdCz0YDQsNGC0L7RgCI7DQrQpNC+0YDQvNCwXzAu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCk0L7RgNC80LBfMC7QmNC80Y/QntCx0YrQtdC60YLQsNCk0L7RgNC80YvQlNC70Y/QntC00L3QvtCh0LrRgNC40L/RgtCwID0gItCkIjsNClvQpNC+0YDQvNCwXzA+XQ0KWzzQndCw0LTQv9C40YHRjDFdDQrQndCw0LTQv9C40YHRjDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxOCk7DQrQndCw0LTQv9C40YHRjDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAwOw0K0J3QsNC00L/QuNGB0YwxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDI3KTsNCtCd0LDQtNC/0LjRgdGMMS7QotC10LrRgdGCID0gItCY0LzRj9Cg0YPRgSI7DQrQndCw0LTQv9C40YHRjDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDE+XQ0KWzzQndCw0LTQv9C40YHRjDJdDQrQndCw0LTQv9C40YHRjDIu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxOCk7DQrQndCw0LTQv9C40YHRjDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAwOw0K0J3QsNC00L/QuNGB0YwyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDkxKTsNCtCd0LDQtNC/0LjRgdGMMi7QotC10LrRgdGCID0gItCY0LzRj0VuIjsNCtCd0LDQtNC/0LjRgdGMMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMj5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDFdDQrQn9C+0LvQtdCS0LLQvtC00LAxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1NjcsIDIyKTsNCtCf0L7Qu9C10JLQstC+0LTQsDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxOw0K0J/QvtC70LXQktCy0L7QtNCwMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDI2LCA0OCk7DQrQn9C+0LvQtdCS0LLQvtC00LAxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMT5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDJdDQrQn9C+0LvQtdCS0LLQvtC00LAyLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LAyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1NjcsIDIyKTsNCtCf0L7Qu9C10JLQstC+0LTQsDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyOw0K0J/QvtC70LXQktCy0L7QtNCwMi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDI2LCAxMTIpOw0K0J/QvtC70LXQktCy0L7QtNCwMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDI+XQ0KWzzQndCw0LTQv9C40YHRjDNdDQrQndCw0LTQv9C40YHRjDMu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxOSk7DQrQndCw0LTQv9C40YHRjDMu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzOw0K0J3QsNC00L/QuNGB0YwzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDE1Nik7DQrQndCw0LTQv9C40YHRjDMu0KLQtdC60YHRgiA9ICLQntC/0LjRgdCw0L3QuNC1IjsNCtCd0LDQtNC/0LjRgdGMMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMz5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDNdDQrQn9C+0LvQtdCS0LLQvtC00LAzLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDU2NywgODQpOw0K0J/QvtC70LXQktCy0L7QtNCwMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDE3OCk7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMz5dDQpbPNCa0L3QvtC/0LrQsDFdDQrQmtC90L7Qv9C60LAxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQmtC90L7Qv9C60LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDcsIDIzKTsNCtCa0L3QvtC/0LrQsDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0Ow0K0JrQvdC+0L/QutCwMS7QndCw0LbQsNGC0LjQtSA9ICLQmtC9MV/QndCw0LbQsNGC0LjQtSI7DQrQmtC90L7Qv9C60LAxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNDg2LCAzOTUpOw0K0JrQvdC+0L/QutCwMS7QotC10LrRgdGCID0gItCh0L7Qt9C00LDRgtGMINC60LvQsNGB0YEiOw0K0JrQvdC+0L/QutCwMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Ca0L3QvtC/0LrQsDE+XQ0KWzzQndCw0LTQv9C40YHRjDRdDQrQndCw0LTQv9C40YHRjDQu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMNC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMzY4LCAyMyk7DQrQndCw0LTQv9C40YHRjDQu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA1Ow0K0J3QsNC00L/QuNGB0Yw0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDQxOCk7DQrQndCw0LTQv9C40YHRjDQu0KLQtdC60YHRgiA9ICLQktGL0YXQvtC00L3Ri9C1INC00LDQvdC90YvQtSDQsdGD0LTRg9GCINCyINC60LDRgtCw0LvQvtCz0LUgLi5c0J3QvtCy0YvQtUh0bWwiOw0K0J3QsNC00L/QuNGB0Yw0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw0Pl0NCls80KTQu9Cw0LbQvtC6MV0NCtCk0LvQsNC20L7QujEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCk0LvQsNC20L7QujEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDE4MSwgMjQpOw0K0KTQu9Cw0LbQvtC6MS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDc7DQrQpNC70LDQttC+0LoxLtCU0L7RgdGC0YPQv9C90L7RgdGC0YwgPSDQm9C+0LbRjDsNCtCk0LvQsNC20L7QujEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgyNiwgMjc4KTsNCtCk0LvQsNC20L7QujEu0KLQtdC60YHRgiA9ICLQo9C90LDRgdC70LXQtNC+0LLQsNC90L4g0L7RgiI7DQrQpNC70LDQttC+0LoxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0KTQu9Cw0LbQvtC6MT5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMV0NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1NjcsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDg7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCU0L7RgdGC0YPQv9C90L7RgdGC0YwgPSDQm9C+0LbRjDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDI2LCAzMDgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA1Njc7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDE+XQ0KW9Ch0LLQvtC50YHRgtCy0LA+XQ0K";
    ПодключитьВнешнююКомпоненту("C:\444\OneScriptForms\111\OneScriptForms\OneScriptForms\bin\Debug\OneScriptForms.dll");
    Ф = Новый ФормыДляОдноСкрипта();

    Форма_0 = Ф.Форма();
    Форма_0.Отображать = Истина;
    Форма_0.Показать();
    Форма_0.Активизировать();

    Надпись1 = Ф.Надпись();
    Надпись1.Имя = "Надпись1";
    Надпись2 = Ф.Надпись();
    Надпись2.Имя = "Надпись2";
    ПолеВвода1 = Ф.ПолеВвода();
    ПолеВвода1.Имя = "ПолеВвода1";
    ПолеВвода2 = Ф.ПолеВвода();
    ПолеВвода2.Имя = "ПолеВвода2";
    Надпись3 = Ф.Надпись();
    Надпись3.Имя = "Надпись3";
    ПолеВвода3 = Ф.ПолеВвода();
    ПолеВвода3.Имя = "ПолеВвода3";
    Кнопка1 = Ф.Кнопка();
    Кнопка1.Имя = "Кнопка1";
    Надпись4 = Ф.Надпись();
    Надпись4.Имя = "Надпись4";
    Флажок1 = Ф.Флажок();
    Флажок1.Имя = "Флажок1";
    ПолеВыбора1 = Ф.ПолеВыбора();
    ПолеВыбора1.Имя = "ПолеВыбора1";

    Форма_0.Размер = Ф.Размер(640, 501);
    Форма_0.Текст = "Создание класса Интегратор";
    Форма_0.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись1.Родитель = Форма_0;
    Надпись1.Размер = Ф.Размер(100, 18);
    Надпись1.ПорядокОбхода = 0;
    Надпись1.Положение = Ф.Точка(26, 27);
    Надпись1.Текст = "ИмяРус";
    Надпись1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись2.Родитель = Форма_0;
    Надпись2.Размер = Ф.Размер(100, 18);
    Надпись2.ПорядокОбхода = 0;
    Надпись2.Положение = Ф.Точка(26, 91);
    Надпись2.Текст = "ИмяEn";
    Надпись2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода1.Родитель = Форма_0;
    ПолеВвода1.Размер = Ф.Размер(567, 22);
    ПолеВвода1.ПорядокОбхода = 1;
    ПолеВвода1.Положение = Ф.Точка(26, 48);
    ПолеВвода1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода2.Родитель = Форма_0;
    ПолеВвода2.Размер = Ф.Размер(567, 22);
    ПолеВвода2.ПорядокОбхода = 2;
    ПолеВвода2.Положение = Ф.Точка(26, 112);
    ПолеВвода2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись3.Родитель = Форма_0;
    Надпись3.Размер = Ф.Размер(100, 19);
    Надпись3.ПорядокОбхода = 3;
    Надпись3.Положение = Ф.Точка(26, 156);
    Надпись3.Текст = "Описание";
    Надпись3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода3.Родитель = Форма_0;
    ПолеВвода3.Размер = Ф.Размер(567, 84);
    ПолеВвода3.ПорядокОбхода = 2;
    ПолеВвода3.МногострочныйРежим = Истина;
    ПолеВвода3.Положение = Ф.Точка(26, 178);
    ПолеВвода3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка1.Родитель = Форма_0;
    Кнопка1.Размер = Ф.Размер(107, 23);
    Кнопка1.ПорядокОбхода = 4;
    Кнопка1.Нажатие = Ф.Действие(ЭтотОбъект, "Кн1_Нажатие");
    Кнопка1.Положение = Ф.Точка(486, 395);
    Кнопка1.Текст = "Создать класс";
    Кнопка1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись4.Родитель = Форма_0;
    Надпись4.Размер = Ф.Размер(368, 23);
    Надпись4.ПорядокОбхода = 5;
    Надпись4.Положение = Ф.Точка(26, 418);
    Надпись4.Текст = "Выходные данные будут в каталоге ..\НовыеHtml";
    Надпись4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Флажок1.Родитель = Форма_0;
    Флажок1.Размер = Ф.Размер(181, 24);
    Флажок1.ПорядокОбхода = 7;
    Флажок1.Доступность = Ложь;
    Флажок1.Положение = Ф.Точка(26, 278);
    Флажок1.Текст = "Унаследовано от";
    Флажок1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора1.Родитель = Форма_0;
    ПолеВыбора1.Размер = Ф.Размер(567, 24);
    ПолеВыбора1.ПорядокОбхода = 8;
    ПолеВыбора1.ВысотаЭлемента = 16;
    ПолеВыбора1.Доступность = Ложь;
    ПолеВыбора1.Положение = Ф.Точка(26, 308);
    ПолеВыбора1.ШиринаВыпадающегоСписка = 567;
    ПолеВыбора1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

КонецПроцедуры

Процедура НачальноеЗаполнениеФормы()
	ПолеВвода1.Текст = ИмяРус;
	ПолеВвода2.Текст = ИмяEn;
	ПолеВвода3.Текст = Описание;
	ПолеВыбора1.Текст = "";
	
	ЗаполнитьПолеВыбора1();
КонецПроцедуры

Процедура ЗаполнитьПолеВыбора1()
	ПолеВыбора1.Элементы.Добавить("OneScriptIntegrator");
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКОглавлению);
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
			"menu3", 
			"</summary>", 
			, );
	Если М.Количество() > 0 Тогда
		// Сообщить("М[0] = " + М[0]);
		Для А = 0 По М.ВГраница() Цикл
			М2 = СтрНайтиМежду(М[А], "right"">", "</a>", , );
			Если М2.Количество() > 0 Тогда
				// Сообщить("М2[0] = " + М2[0]);
				Для А2 = 0 По М2.ВГраница() Цикл
					СтрКласс = М2[0];
					СтрКласс = СтрЗаменить(СтрКласс, "(", "");
					СтрКласс = СтрЗаменить(СтрКласс, ")", "");
					ПолеВыбора1.Элементы.Добавить(СтрКласс);
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры

Процедура СоздатьКласс()
	// Создадим ".html" для нового класса ===============================================================================
	СтрКласса = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>CCLLAASS Class</title>
	|    <meta charset=""UTF-8"">
	|    <link rel=""stylesheet"" type=""text/css"" href=""mainstyle.css"">
	|    <script defer src=""mobilstyle.js""></script>
	|</head>
	|<body id=bodyID class=dtBODY onclick=""divrightClick(event)"">
	|    <div id=nsbanner>
	|        <div id=bannerrow1>
	|            <table class=bannerparthead cellSpacing=0>
	|                <tbody>
	|                    <tr id=hdr>
	|                        <td class=runninghead></td>
	|                        <td class=product></td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <div id=TitleRow>
	|            <h1 class=dtH1>ККЛЛААСС (CCLLAASS) Класс</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <h4 class=dtH4>Описание</h4>
	|        <p>" + Описание + "</p>
	|        <p></p>
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <p>
	|            <a href=""OSIntegrator." + ИмяEn + "Members.html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Члены</a> | <a href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</a>
	|        </p>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрКласса = СтрЗаменить(СтрКласса, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрКласса = СтрЗаменить(СтрКласса, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + ИмяEn + ".html";
	ТекстДок.УстановитьТекст(СтрКласса);
	ТекстДок.Записать(ИмяФайла);
	
	Приостановить(1000);
	// ============================================================================================
	// Создадим конструктор для нового класса ===============================================================================
	СтрКонструктор = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>CCLLAASS Constructor</title>
	|    <meta charset=""UTF-8"">
	|    <link rel=""stylesheet"" type=""text/css"" href=""mainstyle.css"">
	|    <script defer src=""mobilstyle.js""></script>
	|</head>
	|<body id=bodyID class=dtBODY onclick=""divrightClick(event)"">
	|    <div id=nsbanner>
	|        <div id=bannerrow1>
	|            <table class=bannerparthead cellSpacing=0>
	|                <tbody>
	|                    <tr id=hdr>
	|                        <td class=runninghead></td>
	|                        <td class=product></td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <div id=TitleRow>
	|            <h1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;Конструктор</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <h4 class=dtH4>Синтаксис</h4>
	|        <p>ККЛЛААСС()</p>
	|        <h4 class=dtH4>Параметры</h4>
	|        <dl></dl>
	|        <h4 class=dtH4>Описание</h4>
	|        <p>Создаёт новый экземпляр класса <b>ККЛЛААСС&nbsp;(CCLLAASS)</b>.</p>
	|        <h4 class=dtH4>Примечание</h4>
	|        <p></p>";
	СлучайноеИмя = СтрЗаменить(Прав(ПолучитьИмяВременногоФайла(), 9), ".tmp", "");
	БлокПримеров = "
	|        <h4 class=dtH4>Пример</h4>
	|            <pre class=code>
	|
	|</pre>
	|            <details>
	|                <summary>Полный пример кода</summary>
	|                <pre class=code id=""sample-code-reflection"">
	|<button type=""button"" class=""copy-btn"" data-target-id=""" + СлучайноеИмя + """ style=""font-size:100%;"">Копировать</button>
	|<hr style=""border-color: lightgray;""><div id=""" + СлучайноеИмя + """>
	|
	|</div>
	|</pre>
	|            </details>
	|        <p></p>";
	СтрКонструктор = СтрКонструктор + БлокПримеров;
	СтрКонструктор = СтрКонструктор + "
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <p>
	|            <a href=""OSIntegrator." + ИмяEn + "Members.html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Члены</a> | <a href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</a>
	|        </p>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрКонструктор = СтрЗаменить(СтрКонструктор, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрКонструктор = СтрЗаменить(СтрКонструктор, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + ИмяEn + "Constructor.html";
	ТекстДок.УстановитьТекст(СтрКонструктор);
	ТекстДок.Записать(ИмяФайла);

	// Создадим раздел События для нового класса ===============================================================================
	СтрСобытия = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>CCLLAASS</title>
	|    <meta charset=""UTF-8"">
	|    <link rel=""stylesheet"" type=""text/css"" href=""mainstyle.css"">
	|    <script defer src=""mobilstyle.js""></script>
	|</head>
	|<body id=bodyID class=dtBODY onclick=""divrightClick(event)"">
	|    <div id=nsbanner>
	|        <div id=bannerrow1>
	|            <table class=bannerparthead cellSpacing=0>
	|                <tbody>
	|                    <tr id=hdr>
	|                        <td class=runninghead></td>
	|                        <td class=product></td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <div id=TitleRow>
	|            <h1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;События</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <p></p>
	|        <h4 class=dtH4>События</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><a href=""OSIntegrator.CCLLAASS.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</a></td>
	|                        <td width=""50%"">йййййййййй</td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <p>
	|            <a href=""OSIntegrator." + ИмяEn + "Members.html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Члены</a> | <a href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</a>
	|        </p>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрСобытия = СтрЗаменить(СтрСобытия, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрСобытия = СтрЗаменить(СтрСобытия, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + ИмяEn + "Events.html";
	ТекстДок.УстановитьТекст(СтрСобытия);
	ТекстДок.Записать(ИмяФайла);

	// Создадим раздел Методы для нового класса ===============================================================================
	СтрМетоды = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>CCLLAASS Methods</title>
	|    <meta charset=""UTF-8"">
	|    <link rel=""stylesheet"" type=""text/css"" href=""mainstyle.css"">
	|    <script defer src=""mobilstyle.js""></script>
	|</head>
	|<body id=bodyID class=dtBODY onclick=""divrightClick(event)"">
	|    <div id=nsbanner>
	|        <div id=bannerrow1>
	|            <table class=bannerparthead cellSpacing=0>
	|                <tbody>
	|                    <tr id=hdr>
	|                        <td class=runninghead></td>
	|                        <td class=product></td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <div id=TitleRow>
	|            <h1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;Методы</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <p></p>
	|        <h4 class=dtH4>Методы</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><img src=""pubmethod.gif""></img><a href=""OSIntegrator.CCLLAASS.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</a></td>
	|                        <td width=""50%"">йййййййййй</td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <p>
	|            <a href=""OSIntegrator." + ИмяEn + "Members.html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Члены</a> | <a href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</a>
	|        </p>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрМетоды = СтрЗаменить(СтрМетоды, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрМетоды = СтрЗаменить(СтрМетоды, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + ИмяEn + "Methods.html";
	ТекстДок.УстановитьТекст(СтрМетоды);
	ТекстДок.Записать(ИмяФайла);

	// Создадим раздел Свойства для нового класса ===============================================================================
	СтрСвойства = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>CCLLAASS Properties</title>
	|    <meta charset=""UTF-8"">
	|    <link rel=""stylesheet"" type=""text/css"" href=""mainstyle.css"">
	|    <script defer src=""mobilstyle.js""></script>
	|</head>
	|<body id=bodyID class=dtBODY onclick=""divrightClick(event)"">
	|    <div id=nsbanner>
	|        <div id=bannerrow1>
	|            <table class=bannerparthead cellSpacing=0>
	|                <tbody>
	|                    <tr id=hdr>
	|                        <td class=runninghead></td>
	|                        <td class=product></td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <div id=TitleRow>
	|            <h1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;Свойства</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <p></p>
	|        <h4 class=dtH4>Свойства</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><img src=""pubproperty.gif""></img><a href=""OSIntegrator.CCLLAASS.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</a></td>
	|                        <td width=""50%"">йййййййййй</td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <p>
	|            <a href=""OSIntegrator." + ИмяEn + "Members.html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Члены</a> | <a href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</a>
	|        </p>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрСвойства = СтрЗаменить(СтрСвойства, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрСвойства = СтрЗаменить(СтрСвойства, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + ИмяEn + "Properties.html";
	ТекстДок.УстановитьТекст(СтрСвойства);
	ТекстДок.Записать(ИмяФайла);

	// Создадим раздел Члены для нового класса ===============================================================================
	СтрСвойства = "<!DOCTYPE html>
	|<html>
	|<head>
	|    <title>" + ИмяEn + " Members</title>
	|    <meta content=""text/html; charset=Windows-1252"" http-equiv=""Content-Type"">
	|    <link rel=""stylesheet"" type=""text/css"" href=""mainstyle.css"">
	|	<script defer src=""mobilstyle.js""></script>
	|</head>
	|<body id=bodyID class=dtBODY onclick=""divrightClick(event)"">
	|    <div id=nsbanner>
	|        <div id=bannerrow1>
	|            <table class=bannerparthead cellSpacing=0>
	|                <tbody>
	|                    <tr id=hdr>
	|                        <td class=runninghead></td>
	|                        <td class=product></td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <div id=TitleRow>
	|            <h1 class=dtH1>" + ИмяРус + " (" + ИмяEn + ") Члены </h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <p><a href=""OSIntegrator." + ИмяEn + ".html"">Обзор&nbsp;" + ИмяРус + "&nbsp;(" + ИмяEn + ")</a></p>
	|        <h4 class=dtH4>Конструктор</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><img src=""pubmethod.gif""><a href=""OSIntegrator." + ИмяEn + "Constructor.html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Конструктор</a></td>
	|                        <td width=""50%"">Используйте метод <a href=""OSIntegrator.OneScriptIntegrator." + ИмяEn + ".html"">ИнтеграторОдноСкрипта." + ИмяРус + "&nbsp;(OneScriptIntegrator." + ИмяEn + ")</a> для создания нового экземпляра класса <a href=""OSIntegrator." + ИмяEn + ".html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")</a>.</td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <h4 class=dtH4>Свойства</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><img src=""pubproperty.gif""></img><a href=""OSIntegrator.йййййййййй.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</a></td>
	|                        <td width=""50%"">йййййййййй</td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <h4 class=dtH4>Методы</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><img src=""pubmethod.gif""></img><a href=""OSIntegrator.йййййййййй.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</a></td>
	|                        <td width=""50%"">йййййййййй</td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <p>
	|            <a href=""OSIntegrator." + ИмяEn + ".html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Класс</a> | <a href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</a>
	|        </p>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрСвойства = СтрЗаменить(СтрСвойства, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрСвойства = СтрЗаменить(СтрСвойства, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + ИмяEn + "Members.html";
	ТекстДок.УстановитьТекст(СтрСвойства);
	ТекстДок.Записать(ИмяФайла);
	
	// ============================================================================================
	// Заполнить оглавление в C:\444\OneScriptIntegrator\docs\doc.html
	// Составим вставляемый фрагмент
	Фрагмент = 
	"
	|                <details>
	|                    <summary class=""menu2""><a href=""OSIntegrator/OSIntegrator." + ИмяEn + ".html"" target=""right"">" + ИмяРус + " (" + ИмяEn + ") Класс</a></summary>
	|                        <p class=""konstr""><a href=""OSIntegrator/OSIntegrator." + ИмяEn + "Constructor.html"" target=""right"">Конструктор</a></p>
	|                        <p class=""members""><a href=""OSIntegrator/OSIntegrator." + ИмяEn + "Events.html"" target=""right"">События</a></p>
	|                        <p class=""members""><a href=""OSIntegrator/OSIntegrator." + ИмяEn + "Members.html"" target=""right"">Члены</a></p>
	|                    <details>
	|                        <summary class=""menu3""><a href=""OSIntegrator/OSIntegrator." + ИмяEn + "Properties.html"" target=""right"">Свойства</a></summary>
	|                    </details>
	|                    <details>
	|                        <summary class=""menu3""><a href=""OSIntegrator/OSIntegrator." + ИмяEn + "Methods.html"" target=""right"">Методы</a></summary>
	|                    </details>
	|                </details>
	|                <!-- КлассКонец -->
	|                <!-- КлассНачало -->";
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКОглавлению);
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
			"<summary class=""menu""><a href=""OSIntegrator/OSIntegrator.html"" target=""right"">OneScriptIntegrator</a></summary>", 
			"<!-- КлассНачало -->", 
			Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("===");
		// Сообщить("" + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + Фрагмент;
		ПодстрокаЗамены = СтрЗаменить(ПодстрокаЗамены, "ККЛЛААСС", ИмяРус);
		ПодстрокаЗамены = СтрЗаменить(ПодстрокаЗамены, "CCLLAASS", ИмяEn);
		// Сообщить("===");
		// Сообщить("" + ПодстрокаЗамены);
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
		// Сообщить("===");
		// Сообщить("" + Стр);
		
	КонецЕсли;
	ИмяФайла = ВыходнойКаталог + "\doc.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	Приостановить(2000);
	СортироватьDoc();
	
	// ============================================================================================
	// Добавим класс в таблицу C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.html
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКСтранице + "html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
			"<h3 class=dtH3>Классы</h3>
			|        <div class=tablediv>
			|            <table class=dtTABLE cellSpacing=0>
			|                <tbody>", 
			"                    <tr vAlign=top>", 
			Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|                        <td width=""50%""><a href=""OSIntegrator." + ИмяEn + ".html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")</a></td>
		|                        <td width=""50%"">" + Описание + "</td>
		|                    </tr>
		|                    <tr vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	Приостановить(2000);
	СортироватьOSIntegrator();
	
	// ============================================================================================
	// Добавим метод создания экземпляра класса в оглавление C:\444\OneScriptIntegrator\docs\doc.html
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ВыходнойКаталог + "\doc.html");
	Стр = ТекстДок.ПолучитьТекст();
	// Сообщить("Стр ===");
	// Сообщить("" + Стр);
	М = СтрНайтиМежду(Стр, 
		"<summary class=""menu3""><a href=""OSIntegrator/OSIntegrator.OneScriptIntegratorMethods.html"" target=""right"">Методы</a></summary>", 
		"</details>", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		// Сообщить("" + М[0]);
		ПодстрокаПоиска = М[0];
		М2 = СтрНайтиМежду(М[0], "                        <p", "</p>", Ложь, );
		Для А2 = 0 По М2.ВГраница() Цикл
			// Сообщить("" + М2[А2]);
			М3 = СтрНайтиМежду(М2[А2], "right"">", "</a>", , );
			Если М3.Количество() > 0 Тогда
				// Сообщить("М3[0] = " + М3[0]);
				Список.Добавить(М2[А2], М3[0]);
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;

	Фрагмент1 = "                        <p class=""method""><a href=""OSIntegrator/OSIntegrator.OneScriptIntegrator." + ИмяEn + ".html"" target=""right"">" + ИмяРус + " (" + ИмяEn + ")</a></p>";
	Список.Добавить(Фрагмент1, "" + ИмяРус + " (" + ИмяEn + ") Метод");
	Список.СортироватьПоПредставлению();
	ПодстрокаЗамены = "";
	Для А = 0 По Список.Количество() - 1 Цикл
		// Сообщить("==" + Список.Получить(А).Значение);
		ПодстрокаЗамены = ПодстрокаЗамены + Список.Получить(А).Значение + "
		|";
	КонецЦикла;
	ПодстрокаЗамены = "<summary class=""menu3""><a href=""OSIntegrator/OSIntegrator.OneScriptIntegratorMethods.html"" target=""right"">Методы</a></summary>
	|" + ПодстрокаЗамены + "                    </details>";
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаПоиска);
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаЗамены);
	
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	ИмяФайла = ВыходнойКаталог + "\doc.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	// ============================================================================================
	// Создадим метод создания экземпляра класса OSIntegrator/OSIntegrator.OneScriptIntegrator.Math.html
	СтрМетод = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>CCLLAASS.MMEETTOODD Method</title>
	|    <meta charset=""UTF-8"">
	|    <link rel=""stylesheet"" type=""text/css"" href=""mainstyle.css"">
	|    <script defer src=""mobilstyle.js""></script>
	|</head>
	|<body id=bodyID class=dtBODY onclick=""divrightClick(event)"">
	|    <div id=nsbanner>
	|        <div id=bannerrow1>
	|            <table class=bannerparthead cellSpacing=0>
	|                <tbody>
	|                    <tr id=hdr>
	|                        <td class=runninghead></td>
	|                        <td class=product></td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>
	|        <div id=TitleRow>
	|            <h1 class=dtH1>ККЛЛААСС.ММЕЕТТООДД (CCLLAASS.MMEETTOODD)&nbsp;Метод</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <h4 class=dtH4>Синтаксис</h4>
	|        <p>ММЕЕТТООДД()</p>
	|        <h4 class=dtH4>Параметры</h4>
	|        <dl></dl>
	|        <h4 class=dtH4>Описание</h4>
	|        <p>Создаёт новый экземпляр класса <b>ММЕЕТТООДД&nbsp;(MMEETTOODD)</b>.</p>
	|        <h4 class=dtH4>Примечание</h4>
	|        <p></p>";
	СлучайноеИмя = СтрЗаменить(Прав(ПолучитьИмяВременногоФайла(), 9), ".tmp", "");
	БлокПримеров = "
	|        <h4 class=dtH4>Пример</h4>
	|            <pre class=code>
	|
	|</pre>
	|            <details>
	|                <summary>Полный пример кода</summary>
	|                <pre class=code id=""sample-code-reflection"">
	|<button type=""button"" class=""copy-btn"" data-target-id=""" + СлучайноеИмя + """ style=""font-size:100%;"">Копировать</button>
	|<hr style=""border-color: lightgray;""><div id=""" + СлучайноеИмя + """>
	|
	|</div>
	|</pre>
	|            </details>
	|        <p></p>";
	СтрМетод = СтрМетод + БлокПримеров;
	СтрМетод = СтрМетод + "
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <p>
	|            <a href=""OSIntegrator." + ИмяEn + "Members.html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")&nbsp;Члены</a> | <a href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</a>
	|        </p>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = "ИнтеграторОдноСкрипта";
	СтрМетод = СтрЗаменить(СтрМетод, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = "OneScriptIntegrator";
	СтрМетод = СтрЗаменить(СтрМетод, ПодстрокаПоиска, ПодстрокаЗамены);
	
	ПодстрокаПоиска = "ММЕЕТТООДД";
	ПодстрокаЗамены = ИмяРус;
	СтрМетод = СтрЗаменить(СтрМетод, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "MMEETTOODD";
	ПодстрокаЗамены = ИмяEn;
	СтрМетод = СтрЗаменить(СтрМетод, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator.OneScriptIntegrator." + ИмяEn + ".html";
	ТекстДок.УстановитьТекст(СтрМетод);
	ТекстДок.Записать(ИмяФайла);

	// ============================================================================================
	// Добавим метод в таблицу C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.OneScriptIntegratorMethods.html
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКСтранице + "OneScriptIntegratorMethods.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
			"<h4 class=dtH4>Методы</h4>
			|        <div class=tablediv>
			|            <table class=dtTABLE cellSpacing=0>
			|                <tbody>", 
			"                    <tr vAlign=top>", 
			Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|                        <td width=""50%""><img src=""pubmethod.gif""></img><a href=""OSIntegrator." + ИмяEn + ".html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")</a></td>
		|                        <td width=""50%"">" + Описание + "</td>
		|                    </tr>
		|                    <tr vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator.OneScriptIntegratorMethods.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	Приостановить(2000);
	СортироватьMethods();
	
	// ============================================================================================
	// Добавим метод в таблицу C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.OneScriptIntegratorMembers.html
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКСтранице + "OneScriptIntegratorMembers.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
			"<h4 class=dtH4>Методы</h4>
			|        <div class=tablediv>
			|            <table class=dtTABLE cellSpacing=0>
			|                <tbody>", 
			"                    <tr vAlign=top>", 
			Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|                        <td width=""50%""><img src=""pubmethod.gif""></img><a href=""OSIntegrator." + ИмяEn + ".html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")</a></td>
		|                        <td width=""50%"">" + Описание + "</td>
		|                    </tr>
		|                    <tr vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator.OneScriptIntegratorMembers.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	Приостановить(2000);
	СортироватьOneScriptIntegratorMembers();

	
	ОкноСообщений1 = Ф.ОкноСообщений();
	ОкноСообщений1.Показать("Завершено", "Завершено");
КонецПроцедуры//СоздатьКласс

Процедура СортироватьOneScriptIntegratorMembers()
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ВыходнойКаталог + "\OSIntegrator.OneScriptIntegratorMembers.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<h4 class=dtH4>Методы</h4>
		|        <div class=tablediv>
		|            <table class=dtTABLE cellSpacing=0>
		|                <tbody>", 
		"</tbody>", Ложь, );
	Если М.Количество() > 0 Тогда
		// Сообщить("" + М[0]);
		ПодстрокаПоиска = М[0];
		М2 = СтрНайтиМежду(М[0], "                    <tr vAlign=top>", "</tr>", Ложь, );
		Для А2 = 0 По М2.ВГраница() Цикл
			// Сообщить("----------------------------------");
			// Сообщить("" + М2[А2]);
			М3 = СтрНайтиМежду(М2[А2], "html"">", "</a>", , );
			Если М3.Количество() > 0 Тогда
				// Сообщить("М3[0] = " + М3[0]);
				Список.Добавить(М2[А2], СтрЗаменить(М3[0], "&nbsp;", " "));
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	Список.СортироватьПоПредставлению();
	ПодстрокаЗамены = "";
	Для А = 0 По Список.Количество() - 1 Цикл
		// Сообщить("==" + Список.Получить(А).Значение);
		ПодстрокаЗамены = ПодстрокаЗамены + Список.Получить(А).Значение + "
		|";
	КонецЦикла;
	ПодстрокаЗамены = 
	"<h4 class=dtH4>Методы</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|" + ПодстрокаЗамены + "                </tbody>";
	// Сообщить("=== ПодстрокаПоиска ====================================");
	// Сообщить("" + ПодстрокаПоиска);
	// Сообщить("=== ПодстрокаЗамены ====================================");
	// Сообщить("" + ПодстрокаЗамены);
	
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator.OneScriptIntegratorMembers.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
КонецПроцедуры//СортироватьOneScriptIntegratorMembers

Процедура СортироватьMethods()
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ВыходнойКаталог + "\OSIntegrator.OneScriptIntegratorMethods.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<tbody>", 
		"</tbody>", Ложь, );
	Если М.Количество() > 0 Тогда
		// Сообщить("" + М[1]);
		ПодстрокаПоиска = М[1];
		М2 = СтрНайтиМежду(М[1], "                    <tr vAlign=top>", "</tr>", Ложь, );
		Для А2 = 0 По М2.ВГраница() Цикл
			// Сообщить("" + М2[А2]);
			М3 = СтрНайтиМежду(М2[А2], "html"">", "</a>", , );
			Если М3.Количество() > 0 Тогда
				// Сообщить("М3[0] = " + М3[0]);
				Список.Добавить(М2[А2], СтрЗаменить(М3[0], "&nbsp;", " "));
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	Список.СортироватьПоПредставлению();
	ПодстрокаЗамены = "";
	Для А = 0 По Список.Количество() - 1 Цикл
		// Сообщить("==" + Список.Получить(А).Значение);
		ПодстрокаЗамены = ПодстрокаЗамены + Список.Получить(А).Значение + "
		|";
	КонецЦикла;
	ПодстрокаЗамены = "<tbody>					
	|" + ПодстрокаЗамены + "                </tbody>";
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаПоиска);
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаЗамены);
	
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator.OneScriptIntegratorMethods.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
КонецПроцедуры//СортироватьMethods

Процедура СортироватьOSIntegrator()
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ВыходнойКаталог + "\OSIntegrator.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<tbody>", 
		"</tbody>", Ложь, );
	Если М.Количество() > 0 Тогда
		// Сообщить("" + М[1]);
		ПодстрокаПоиска = М[1];
		М2 = СтрНайтиМежду(М[1], "                    <tr vAlign=top>", "</tr>", Ложь, );
		Для А2 = 0 По М2.ВГраница() Цикл
			// Сообщить("" + М2[А2]);
			М3 = СтрНайтиМежду(М2[А2], "html"">", "</a>", , );
			Если М3.Количество() > 0 Тогда
				// Сообщить("М3[0] = " + М3[0]);
				Список.Добавить(М2[А2], СтрЗаменить(М3[0], "&nbsp;", " "));
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	Список.СортироватьПоПредставлению();
	ПодстрокаЗамены = "";
	Для А = 0 По Список.Количество() - 1 Цикл
		// Сообщить("==" + Список.Получить(А).Значение);
		ПодстрокаЗамены = ПодстрокаЗамены + Список.Получить(А).Значение + "
		|";
	КонецЦикла;
	ПодстрокаЗамены = "<tbody>					
	|" + ПодстрокаЗамены + "                </tbody>";
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаПоиска);
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаЗамены);
	
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
КонецПроцедуры//СортироватьOSIntegrator
	
Процедура СортироватьDoc()
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ВыходнойКаталог + "\doc.html");
	Стр = ТекстДок.ПолучитьТекст();
	// Сообщить("Стр = " + Стр);
	// Сообщить("================================");
	ПодстрокаПоиска = "";
	М = СтрНайтиМежду(Стр, 
		"<!-- КлассНачало -->", 
		"<!-- КлассКонец -->", Ложь, );
	// Сообщить("М.Количество() = " + М.Количество());
	Если М.Количество() > 0 Тогда
		Для А = 0 По М.ВГраница() Цикл
			// Сообщить("М[А] = " + М[А]);
			// Сообщить("================================");
			ПодстрокаПоиска = ПодстрокаПоиска + "
			|                " + СокрП(М[А]);
			М2 = СтрНайтиМежду(М[А], "menu2", "</summary>", , );
			М3 = СтрНайтиМежду(М2[0], "right"">", "</a>", , );
			Список.Добавить(М[А], М3[0]);
		КонецЦикла;
	КонецЕсли;

	Список.СортироватьПоПредставлению();
	ПодстрокаЗамены = "";
	Для А = 0 По Список.Количество() - 1 Цикл
		// Сообщить("==" + Список.Получить(А).Значение);
		ПодстрокаЗамены = ПодстрокаЗамены + "
		|                " + Список.Получить(А).Значение;
	КонецЦикла;
	// Сообщить("=======================================");
	// Сообщить("ПодстрокаПоиска = " + ПодстрокаПоиска);
	// Сообщить("=======================================");
	// Сообщить("ПодстрокаЗамены = " + ПодстрокаЗамены);
	
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	ИмяФайла = ВыходнойКаталог + "\doc.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
КонецПроцедуры//СортироватьDoc

Функция РазобратьСтроку(Строка, Разделитель)
	Стр = СтрЗаменить(Строка,Разделитель,символы.ПС);
	М = Новый Массив;
	Если ПустаяСтрока(Стр) Тогда
		Возврат М;
	КонецЕсли;
	Для Ч = 1 По СтрЧислоСтрок(Стр) Цикл
		М.Добавить(СтрПолучитьСтроку(Стр,Ч));
	КонецЦикла;
	Возврат М;
КонецФункции

Функция СтрНайтиМежду(СтрПараметр, Фрагмент1 = Неопределено, Фрагмент2 = Неопределено, ИсключитьФрагменты = Истина, БезНаложения = Истина)
	//Стр - исходная строка
	//Фрагмент1 - подстрока поиска от которой ведем поиск
	//Фрагмент2 - подстрока поиска до которой ведем поиск
	//ИсключитьФрагменты - не включать Фрагмент1 и Фрагмент2 в результат
	//БезНаложения - в результат не будут включены участки, содержащие другие найденные участки, удовлетворяющие переданным параметрам
	//функция возвращает массив строк
	Стр = СтрПараметр;
	М = Новый Массив;
	Если (Фрагмент1 <> Неопределено) и (Фрагмент2 = Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент1);
		Пока Позиция > 0 Цикл
			М.Добавить(?(ИсключитьФрагменты, Сред(Стр, Позиция + СтрДлина(Фрагмент1)), Сред(Стр, Позиция)));
			Стр = Сред(Стр, Позиция + 1);
			Позиция = Найти(Стр, Фрагмент1);
		КонецЦикла;
	ИначеЕсли (Фрагмент1 = Неопределено) и (Фрагмент2 <> Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент2);
		СуммаПозиций = Позиция;
		Пока Позиция > 0 Цикл
			М.Добавить(?(ИсключитьФрагменты, Сред(Стр, 1, СуммаПозиций - 1), Сред(Стр, 1, СуммаПозиций - 1 + СтрДлина(Фрагмент2))));
			Позиция = Найти(Сред(Стр, СуммаПозиций + 1), Фрагмент2);
			СуммаПозиций = СуммаПозиций + Позиция;
		КонецЦикла;
	ИначеЕсли (Фрагмент1 <> Неопределено) и (Фрагмент2 <> Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент1);
		Пока Позиция > 0 Цикл
			Стр2 = ?(ИсключитьФрагменты, Сред(Стр, Позиция + СтрДлина(Фрагмент1)), Сред(Стр, Позиция));
			Позиция2 = Найти(Стр2, Фрагмент2);
			СуммаПозиций2 = Позиция2;
			Пока Позиция2 > 0 Цикл
				Если БезНаложения Тогда
					Если Найти(Сред(Стр2, 1, СуммаПозиций2 - 1), Фрагмент2) = 0 Тогда
						М.Добавить("" + ?(ИсключитьФрагменты, Сред(Стр2, 1, СуммаПозиций2 - 1), Сред(Стр2, 1, СуммаПозиций2 - 1 + СтрДлина(Фрагмент2))));
					КонецЕсли;
				Иначе
					М.Добавить("" + ?(ИсключитьФрагменты, Сред(Стр2, 1, СуммаПозиций2 - 1), Сред(Стр2, 1, СуммаПозиций2 - 1 + СтрДлина(Фрагмент2))));
				КонецЕсли;
				Позиция2 = Найти(Сред(Стр2, СуммаПозиций2 + 1), Фрагмент2);
				СуммаПозиций2 = СуммаПозиций2 + Позиция2;
			КонецЦикла;
			Стр = Сред(Стр, Позиция + 1);
			Позиция = Найти(Стр, Фрагмент1);
		КонецЦикла;
	КонецЕсли;
	
	Возврат М;
КонецФункции//СтрНайтиМежду

ПодготовкаКомпонентов();

ПутьКСтранице = "C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.";
ПутьКДокументации = "C:\444\OneScriptIntegrator\docs\OSIntegrator\";
ПутьКОглавлению = "C:\444\OneScriptIntegrator\docs\doc.html";
ВыходнойКаталог = "C:\444\OneScriptIntegrator\НовыеHtml";// без слэша в конце

ИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
Описание = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!

НачальноеЗаполнениеФормы();
// ...

Ф.ЗапуститьОбработкуСобытий();
