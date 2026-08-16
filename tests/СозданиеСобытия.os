Перем Ф;
Перем Форма_0;
Перем Кнопка1;
Перем Надпись1;
Перем Надпись2;
Перем Надпись5;
Перем Надпись6;
Перем Надпись7;
Перем Надпись8;
Перем Надпись9;
Перем ПолеВвода3;
Перем ПолеВвода4;
Перем ПолеВвода5;
Перем ПолеВыбора1;
Перем ПолеВыбора2;
Перем КлассИмяРус;
Перем КлассИмяEn;
Перем СобытиеИмяРус;
Перем СобытиеИмяEn;
Перем Использование;
Перем ЗначениеТип;
Перем ЗначениеОписание;
Перем ВыходнойКаталог;
Перем Наследники;
Перем Надпись10;
Перем Кнопка2;
Перем Надпись11;
Перем ПолеВыбора3;

Перем ПутьКДокументации;
Перем ПутьКОглавлению;
Перем ПутьКСтранице;

Процедура Кн_Нажатие() Экспорт
	М = РазобратьСтроку(ПолеВыбора3.Текст, " ");
	КлассИмяРус = М[0];
	КлассИмяEn = М[1];
	КлассИмяEn = СтрЗаменить(КлассИмяEn, "(", "");
	КлассИмяEn = СтрЗаменить(КлассИмяEn, ")", "");
	СобытиеИмяРус = СокрЛП(ПолеВвода3.Текст);
	СобытиеИмяEn = СокрЛП(ПолеВвода4.Текст);
	Использование = СокрЛП(ПолеВыбора1.Текст);
	ЗначениеТип = СокрЛП(ПолеВыбора2.Текст);
	ЗначениеОписание = СокрЛП(ПолеВвода5.Текст);
	
	СоздатьСобытие();
КонецПроцедуры

Процедура НачальноеЗаполнениеФормы()
	ПолеВыбора3.Текст = "";
	ПолеВвода3.Текст = "";
	ПолеВвода4.Текст = "";
	ПолеВвода5.Текст = "";
	ПолеВыбора1.Текст = "Чтение и запись.";
	ПолеВыбора2.Текст = "<a href=""OSIntegrator.Action.html"">Действие&nbsp;(Action)</a>.";
	
	ЗаполнитьПолеВыбораТип();
КонецПроцедуры

Процедура ЗаполнитьПолеВыбораТип()
	Список14 = Новый СписокЗначений();
	Список14 = ДобавитьПеречисления(Список14);

	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКОглавлению);
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
			"menu2", 
			"</summary>", 
			, );
	Если М.Количество() > 0 Тогда
		// Сообщить("М[0] = " + М[0]);
		Для А = 0 По М.ВГраница() Цикл
			М2 = СтрНайтиМежду(М[А], "right"">", "</a>", , );
			Если М2.Количество() > 0 Тогда
				// Сообщить("М2[0] = " + М2[0]);
				Для А2 = 0 По М2.ВГраница() Цикл
					Если Не (М2[0] = "Перечисления") Тогда
						СтрКласс = М2[0];
						СтрКласс = СтрЗаменить(СтрКласс, "(", "");
						СтрКласс = СтрЗаменить(СтрКласс, ")", "");
						// Сообщить("" + М2[0]);
						
						СтрКласс2En = СтрНайтиМежду(М2[0], "(", ")", , )[0];
						Фрагмент33 = "№" + М2[0];
						СтрКласс2Ru = СокрЛП(СтрНайтиМежду(Фрагмент33, "№", " (", , )[0]);
						СтрКласс2 = "<a href=""OSIntegrator." + СтрКласс2En + ".html"">" + СтрКласс2Ru + "&nbsp;(" + СтрКласс2En + ")</a>.";
						Если Список14.НайтиПоЗначению(СтрКласс2) = Неопределено Тогда
							Список14.Добавить(СтрКласс2, СтрКласс2Ru);
						КонецЕсли;
					КонецЕсли;
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
						
	Список14.СортироватьПоПредставлению();
	Для А45 = 0 По Список14.Количество() - 1 Цикл
		ПолеВыбора2.Элементы.Добавить(Список14.Получить(А45).Значение);
	КонецЦикла;
КонецПроцедуры

Функция ДобавитьПеречисления(СписокДляПеречислений)
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКОглавлению);
	Стр56 = ТекстДок.ПолучитьТекст();
	М56 = СтрНайтиМежду(Стр56, 
			"Enumeration.html"" target=""right"">", 
			"</a>", 
			, );
	Если М56.Количество() > 0 Тогда
		// Сообщить("М56[0] = " + М56[0]);
		Для А57 = 0 По М56.ВГраница() Цикл
			СтрПеречисл = М56[А57];
			// Сообщить("СтрПеречисл = " + СтрПеречисл);
			
			СтрКласс2En = СтрНайтиМежду(СтрПеречисл, "(", ")", , )[0];
			Фрагмент33 = "№" + СтрПеречисл;
			СтрКласс2Ru = СокрЛП(СтрНайтиМежду(Фрагмент33, "№", " (", , )[0]);
			СтрКласс2 = "<a href=""OSIntegrator." + СтрКласс2En + "Enumeration.html"">" + СтрКласс2Ru + "&nbsp;(" + СтрКласс2En + ")</a>.";
			Если СписокДляПеречислений.НайтиПоЗначению(СтрКласс2) = Неопределено Тогда
				СписокДляПеречислений.Добавить(СтрКласс2, СтрКласс2Ru);
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	Возврат СписокДляПеречислений;
КонецФункции

Процедура СоздатьСобытие()
	Стр = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>EEVVEENNTT Event</title>
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
	|            <h1 class=dtH1>ККЛЛААСС.ССООББЫЫТТИИЕЕ&nbsp;(CCLLAASS.EEVVEENNTT)&nbsp;Событие</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <h4 class=dtH4>Использование</h4>
	|        <p>" + Использование + "</p>
	|        <h4 class=dtH4>Значение</h4>
	|        <p>Тип: " + ЗначениеТип + "</p>
	|        <p>" + ЗначениеОписание + "</p>
	|        <h4 class=dtH4>Примечание</h4>
	|        <p></p>
	|        <h4 class=dtH4>Аргументы события</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><img src=""pubproperty.gif""></img><a href=""OSTGui.EventArgs.Sender.html"">Отправитель&nbsp;(Sender)</a></td>
	|                        <td width=""50%"">Возвращает источник (объект) последнего события.</td>
	|                    </tr>
	|                    <tr vAlign=top>
	|                        <td width=""50%""><img src=""pubproperty.gif""></img><a href=""OSTGui.EventArgs.Parameter.html"">Параметр&nbsp;(Parameter)</a></td>
	|                        <td width=""50%"">Возвращает объект, заданный при установке обработчика события, для передачи в обработчик события.</td>
	|                    </tr>
	|                </tbody>
	|            </table>
	|        </div>";
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
	
	ЭтоБазовыйКласс = Ложь;
	ИмяФайлаКласса = ПутьКСтранице + КлассИмяEn + ".html";
	ТекстДокКласс = Новый ТекстовыйДокумент;
	ТекстДокКласс.Прочитать(ИмяФайлаКласса);
	СтрКласс = ТекстДокКласс.ПолучитьТекст();
	М6 = СтрНайтиМежду(СтрКласс, "<h4 class=dtH4>Описание</h4>", "<h4 class=dtH4>Иерархия</h4>", , );
	Если М6.Количество() > 0 Тогда
		// Сообщить("Описание = " + М6[0]);
		Описание = М6[0];
		М7 = СтрНайтиМежду(Описание, "<p>", "</p>", , );
		Если М7.Количество() > 0 Тогда
			// Сообщить("Лев(М7[0], 13) = " + Лев(М7[0], 13));
			Если Лев(М7[0], 13) = "Базовый класс" Тогда
				ЭтоБазовыйКласс = Истина;
			КонецЕсли;
		КонецЕсли;
	КонецЕсли;
	Если ЭтоБазовыйКласс Тогда
	Иначе
		Стр = Стр + БлокПримеров;
	КонецЕсли;
	Стр = Стр + "
	|        <h4 class=dtH4>Смотрите также</h4>
	|        <A href=""OSIntegrator." + КлассИмяEn + ".html"">" + КлассИмяРус + "&nbsp;(" + КлассИмяEn + ")&nbsp;Класс</A> | <A href=""OSIntegrator.html"">Библиотека&nbsp;OneScriptIntegrator</A>
	|    </div>
	|</body>
	|</html>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = КлассИмяРус;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	
	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = КлассИмяEn;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "ССООББЫЫТТИИЕЕ";
	ПодстрокаЗамены = СобытиеИмяРус;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "EEVVEENNTT";
	ПодстрокаЗамены = СобытиеИмяEn;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "." + СобытиеИмяEn + ".html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	// ====================================================================================
	// Изменим C:\444\OneScriptGameForms\docs\OSGForms\OSGForms.КЛАССEvents.html 
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКСтранице + КлассИмяEn + "Events.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<h4 class=dtH4>События</h4>
		|        <div class=tablediv>
		|            <table class=dtTABLE cellSpacing=0>
		|                <tbody>", 
		"<tr vAlign=top>", 
		Ложь, );
	// Сообщить("М[0] = " + М[0]);
	ПодстрокаПоиска = М[0];
	ПодстрокаЗамены = М[0] + "
	|                        <td width=""50%""><a href=""OSIntegrator." + КлассИмяEn + "." + СобытиеИмяEn + ".html"">" + СобытиеИмяРус + "&nbsp;(" + СобытиеИмяEn + ")</a></td>
	|                        <td width=""50%"">" + ЗначениеОписание + "</td>
	|                    </tr>
	|                    <tr vAlign=top>";
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Events.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	Приостановить(2000);
	Сортировать_Events();
	
	ОкноСообщений1 = Ф.ОкноСообщений();
	Ф.ОкноСообщений().Показать("Завершено", "Завершено");
КонецПроцедуры//СоздатьСобытие

Процедура Сортировать_Events()
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Events.html");
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
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Events.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
КонецПроцедуры//Сортировать_Events

Процедура ПодготовкаКомпонентов()
    // ВАЖНО: Необходимая процедура для поддержки конструктора — не изменяйте содержимое этой процедуры с помощью редактора кода.
    // osdText = "WzzQmtC+0L3RgdGC0YDRg9C60YLQvtGA0YtdDQrQpNC+0YDQvNCwXzAgPSDQpC7QpNC+0YDQvNCwKCk7DQrQmtC90L7Qv9C60LAxID0g0KQu0JrQvdC+0L/QutCwKCk7DQrQndCw0LTQv9C40YHRjDIgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0Yw1ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMNiA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAzID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQn9C+0LvQtdCS0LLQvtC00LA0ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQndCw0LTQv9C40YHRjDcgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCd0LDQtNC/0LjRgdGMOCA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIgPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J3QsNC00L/QuNGB0Yw5ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDUgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMyA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDExID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNClvQmtC+0L3RgdGC0YDRg9C60YLQvtGA0Ys+XQ0KWzzQodCy0L7QudGB0YLQstCwXQ0KWzzQpNC+0YDQvNCwXzBdDQrQpNC+0YDQvNCwXzAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDY0OSwgNDMwKTsNCtCk0L7RgNC80LBfMC7Qn9GD0YLRjCA9ICJDOlw0NDRcT25lU2NyaXB0SW50ZWdyYXRvclzQpNCw0LHRgNC40LrQsEh0bWxc0KHQvtC30LTQsNC90LjQtdCh0L7QsdGL0YLQuNGPLm9zIjsNCtCk0L7RgNC80LBfMC7QodGC0LjQu9GM0KHQutGA0LjQv9GC0LAgPSAi0KHRgtC40LvRjNCh0LrRgNC40L/RgtCwIjsNCtCk0L7RgNC80LBfMC7QotC10LrRgdGCID0gItCh0L7Qt9C00LDQvdC40LUg0YHQvtCx0YvRgtC40Y8iOw0K0KTQvtGA0LzQsF8wLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQpNC+0YDQvNCwXzAu0JjQvNGP0J7QsdGK0LXQutGC0LDQpNC+0YDQvNGL0JTQu9GP0J7QtNC90L7QodC60YDQuNC/0YLQsCA9ICLQpCI7DQpb0KTQvtGA0LzQsF8wPl0NCls80JrQvdC+0L/QutCwMV0NCtCa0L3QvtC/0LrQsDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCa0L3QvtC/0LrQsDEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEyNywgMjMpOw0K0JrQvdC+0L/QutCwMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDA7DQrQmtC90L7Qv9C60LAxLtCd0LDQttCw0YLQuNC1ID0gItCa0L1f0J3QsNC20LDRgtC40LUiOw0K0JrQvdC+0L/QutCwMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDQ3MCwgMzQ1KTsNCtCa0L3QvtC/0LrQsDEu0KLQtdC60YHRgiA9ICLQodC+0LfQtNCw0YLRjCDRgdC+0LHRi9GC0LjQtSI7DQrQmtC90L7Qv9C60LAxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0JrQvdC+0L/QutCwMT5dDQpbPNCd0LDQtNC/0LjRgdGMMl0NCtCd0LDQtNC/0LjRgdGMMi7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0YwyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg0MzMsIDMwKTsNCtCd0LDQtNC/0LjRgdGMMi7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI7DQrQndCw0LTQv9C40YHRjDIu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgMzQ4KTsNCtCd0LDQtNC/0LjRgdGMMi7QotC10LrRgdGCID0gItCS0YvRhdC+0LTQvdGL0LUg0LTQsNC90L3Ri9C1INCx0YPQtNGD0YIg0LIg0LrQsNGC0LDQu9C+0LPQtSAuLlzQndC+0LLRi9C1SHRtbCI7DQrQndCw0LTQv9C40YHRjDIu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDI+XQ0KWzzQndCw0LTQv9C40YHRjDVdDQrQndCw0LTQv9C40YHRjDUu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMNS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTQyLCAxNyk7DQrQndCw0LTQv9C40YHRjDUu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA3Ow0K0J3QsNC00L/QuNGB0Yw1LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDgxKTsNCtCd0LDQtNC/0LjRgdGMNS7QotC10LrRgdGCID0gItCh0L7QsdGL0YLQuNC10JjQvNGP0KDRg9GBIjsNCtCd0LDQtNC/0LjRgdGMNS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNT5dDQpbPNCd0LDQtNC/0LjRgdGMNl0NCtCd0LDQtNC/0LjRgdGMNi7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw2LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMjUsIDE2KTsNCtCd0LDQtNC/0LjRgdGMNi7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDg7DQrQndCw0LTQv9C40YHRjDYu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMTksIDgyKTsNCtCd0LDQtNC/0LjRgdGMNi7QotC10LrRgdGCID0gItCh0L7QsdGL0YLQuNC10JjQvNGPRW4iOw0K0J3QsNC00L/QuNGB0Yw2LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw2Pl0NCls80J/QvtC70LXQktCy0L7QtNCwM10NCtCf0L7Qu9C10JLQstC+0LTQsDMu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDk7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTcsIDEwMSk7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMz5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDRdDQrQn9C+0LvQtdCS0LLQvtC00LA0LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LA0LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyOTYsIDIyKTsNCtCf0L7Qu9C10JLQstC+0LTQsDQu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxMDsNCtCf0L7Qu9C10JLQstC+0LTQsDQu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMTksIDEwMSk7DQrQn9C+0LvQtdCS0LLQvtC00LA0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwND5dDQpbPNCd0LDQtNC/0LjRgdGMN10NCtCd0LDQtNC/0LjRgdGMNy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw3LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNTcsIDE4KTsNCtCd0LDQtNC/0LjRgdGMNy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDExOw0K0J3QsNC00L/QuNGB0Yw3LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDEyNCk7DQrQndCw0LTQv9C40YHRjDcu0KLQtdC60YHRgiA9ICLQmNGB0L/QvtC70YzQt9C+0LLQsNC90LjQtSI7DQrQndCw0LTQv9C40YHRjDcu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDc+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDFdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk1LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxMjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgMTQ1KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QotC10LrRgdGCID0gItCi0L7Qu9GM0LrQviDQt9Cw0L/QuNGB0YwuIjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk1Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC+0LvRjNC60L4g0LfQsNC/0LjRgdGMLiIsICLQotC+0LvRjNC60L4g0LfQsNC/0LjRgdGMLiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0L7Qu9GM0LrQviDRh9GC0LXQvdC40LUuIiwgItCi0L7Qu9GM0LrQviDRh9GC0LXQvdC40LUuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KfRgtC10L3QuNC1INC4INC30LDQv9C40YHRjC4iLCAi0KfRgtC10L3QuNC1INC4INC30LDQv9C40YHRjC4iKSk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LAxPl0NCls80J3QsNC00L/QuNGB0Yw4XQ0K0J3QsNC00L/QuNGB0Yw4LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDgu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEzMiwgMTcpOw0K0J3QsNC00L/QuNGB0Yw4LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTM7DQrQndCw0LTQv9C40YHRjDgu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNywgMTc4KTsNCtCd0LDQtNC/0LjRgdGMOC7QotC10LrRgdGCID0gItCX0L3QsNGH0LXQvdC40LXQotC40L8iOw0K0J3QsNC00L/QuNGB0Yw4LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw4Pl0NCls80J/QvtC70LXQktGL0LHQvtGA0LAyXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDU5NywgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTQ7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDE5OCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KLQtdC60YHRgiA9ICLQkdGD0LvQtdCy0L4uIjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gNTk3Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQkdGD0LvQtdCy0L4uIiwgItCR0YPQu9C10LLQvi4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQodGC0YDQvtC60LAuIiwgItCh0YLRgNC+0LrQsC4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQp9C40YHQu9C+LiIsICLQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0J/RgNC+0LjQt9Cy0L7Qu9GM0L3Ri9C5LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDI+XQ0KWzzQndCw0LTQv9C40YHRjDldDQrQndCw0LTQv9C40YHRjDku0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMOS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTU4LCAxOCk7DQrQndCw0LTQv9C40YHRjDku0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxNTsNCtCd0LDQtNC/0LjRgdGMOS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE3LCAyMzEpOw0K0J3QsNC00L/QuNGB0Yw5LtCi0LXQutGB0YIgPSAi0JfQvdCw0YfQtdC90LjQtdCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0Yw5LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw5Pl0NCls80J/QvtC70LXQktCy0L7QtNCwNV0NCtCf0L7Qu9C10JLQstC+0LTQsDUu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLQstC+0LTQsDUu0JzQvdC+0LPQvtGB0YLRgNC+0YfQvdGL0LnQoNC10LbQuNC8ID0g0JjRgdGC0LjQvdCwOw0K0J/QvtC70LXQktCy0L7QtNCwNS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNTk3LCA4Nyk7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTY7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDI1Mik7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwNT5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwM10NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyOTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDIxOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCA0Mik7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDI5NjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMz5dDQpbPNCd0LDQtNC/0LjRgdGMMTFdDQrQndCw0LTQv9C40YHRjDExLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDExLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNTMsIDE2KTsNCtCd0LDQtNC/0LjRgdGMMTEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyMjsNCtCd0LDQtNC/0LjRgdGMMTEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgMjMpOw0K0J3QsNC00L/QuNGB0YwxMS7QotC10LrRgdGCID0gItCa0LvQsNGB0YEiOw0K0J3QsNC00L/QuNGB0YwxMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMTE+XQ0KW9Ch0LLQvtC50YHRgtCy0LA+XQ0K";
    ПодключитьВнешнююКомпоненту("C:\444\OneScriptForms\111\OneScriptForms\OneScriptForms\bin\Debug\OneScriptForms.dll");
    Ф = Новый ФормыДляОдноСкрипта();

    Форма_0 = Ф.Форма();
    Форма_0.Отображать = Истина;
    Форма_0.Показать();
    Форма_0.Активизировать();

    Кнопка1 = Ф.Кнопка();
    Кнопка1.Имя = "Кнопка1";
    Надпись2 = Ф.Надпись();
    Надпись2.Имя = "Надпись2";
    Надпись5 = Ф.Надпись();
    Надпись5.Имя = "Надпись5";
    Надпись6 = Ф.Надпись();
    Надпись6.Имя = "Надпись6";
    ПолеВвода3 = Ф.ПолеВвода();
    ПолеВвода3.Имя = "ПолеВвода3";
    ПолеВвода4 = Ф.ПолеВвода();
    ПолеВвода4.Имя = "ПолеВвода4";
    Надпись7 = Ф.Надпись();
    Надпись7.Имя = "Надпись7";
    ПолеВыбора1 = Ф.ПолеВыбора();
    ПолеВыбора1.Имя = "ПолеВыбора1";
    Надпись8 = Ф.Надпись();
    Надпись8.Имя = "Надпись8";
    ПолеВыбора2 = Ф.ПолеВыбора();
    ПолеВыбора2.Имя = "ПолеВыбора2";
    Надпись9 = Ф.Надпись();
    Надпись9.Имя = "Надпись9";
    ПолеВвода5 = Ф.ПолеВвода();
    ПолеВвода5.Имя = "ПолеВвода5";
    ПолеВыбора3 = Ф.ПолеВыбора();
    ПолеВыбора3.Имя = "ПолеВыбора3";
    Надпись11 = Ф.Надпись();
    Надпись11.Имя = "Надпись11";

    Форма_0.Размер = Ф.Размер(649, 430);
    Форма_0.Текст = "Создание события";
    Форма_0.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка1.Родитель = Форма_0;
    Кнопка1.Размер = Ф.Размер(127, 23);
    Кнопка1.ПорядокОбхода = 0;
    Кнопка1.Нажатие = Ф.Действие(ЭтотОбъект, "Кн_Нажатие");
    Кнопка1.Положение = Ф.Точка(470, 345);
    Кнопка1.Текст = "Создать событие";
    Кнопка1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись2.Родитель = Форма_0;
    Надпись2.Размер = Ф.Размер(433, 30);
    Надпись2.ПорядокОбхода = 2;
    Надпись2.Положение = Ф.Точка(19, 348);
    Надпись2.Текст = "Выходные данные будут в каталоге ..\НовыеHtml";
    Надпись2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись5.Родитель = Форма_0;
    Надпись5.Размер = Ф.Размер(142, 17);
    Надпись5.ПорядокОбхода = 7;
    Надпись5.Положение = Ф.Точка(18, 81);
    Надпись5.Текст = "СобытиеИмяРус";
    Надпись5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись6.Родитель = Форма_0;
    Надпись6.Размер = Ф.Размер(125, 16);
    Надпись6.ПорядокОбхода = 8;
    Надпись6.Положение = Ф.Точка(319, 82);
    Надпись6.Текст = "СобытиеИмяEn";
    Надпись6.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода3.Родитель = Форма_0;
    ПолеВвода3.Размер = Ф.Размер(296, 22);
    ПолеВвода3.ПорядокОбхода = 9;
    ПолеВвода3.Положение = Ф.Точка(17, 101);
    ПолеВвода3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода4.Родитель = Форма_0;
    ПолеВвода4.Размер = Ф.Размер(296, 22);
    ПолеВвода4.ПорядокОбхода = 10;
    ПолеВвода4.Положение = Ф.Точка(319, 101);
    ПолеВвода4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись7.Родитель = Форма_0;
    Надпись7.Размер = Ф.Размер(157, 18);
    Надпись7.ПорядокОбхода = 11;
    Надпись7.Положение = Ф.Точка(18, 124);
    Надпись7.Текст = "Использование";
    Надпись7.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора1.Родитель = Форма_0;
    ПолеВыбора1.Размер = Ф.Размер(295, 24);
    ПолеВыбора1.ПорядокОбхода = 12;
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Только запись.", "Только запись."));
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Только чтение.", "Только чтение."));
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Чтение и запись.", "Чтение и запись."));
    ПолеВыбора1.ВысотаЭлемента = 16;
    ПолеВыбора1.Положение = Ф.Точка(18, 145);
    ПолеВыбора1.Текст = "Только запись.";
    ПолеВыбора1.ШиринаВыпадающегоСписка = 295;
    ПолеВыбора1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись8.Родитель = Форма_0;
    Надпись8.Размер = Ф.Размер(132, 17);
    Надпись8.ПорядокОбхода = 13;
    Надпись8.Положение = Ф.Точка(17, 178);
    Надпись8.Текст = "ЗначениеТип";
    Надпись8.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора2.Родитель = Форма_0;
    ПолеВыбора2.Размер = Ф.Размер(597, 24);
    ПолеВыбора2.ПорядокОбхода = 14;
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Булево.", "Булево."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Строка.", "Строка."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Число.", "Число."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Произвольный.", "Произвольный."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора2.ВысотаЭлемента = 16;
    ПолеВыбора2.Положение = Ф.Точка(18, 198);
    ПолеВыбора2.Текст = "Булево.";
    ПолеВыбора2.ШиринаВыпадающегоСписка = 597;
    ПолеВыбора2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись9.Родитель = Форма_0;
    Надпись9.Размер = Ф.Размер(158, 18);
    Надпись9.ПорядокОбхода = 15;
    Надпись9.Положение = Ф.Точка(17, 231);
    Надпись9.Текст = "ЗначениеОписание";
    Надпись9.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода5.Родитель = Форма_0;
    ПолеВвода5.Размер = Ф.Размер(597, 87);
    ПолеВвода5.ПорядокОбхода = 16;
    ПолеВвода5.МногострочныйРежим = Истина;
    ПолеВвода5.Положение = Ф.Точка(18, 252);
    ПолеВвода5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора3.Родитель = Форма_0;
    ПолеВыбора3.Размер = Ф.Размер(295, 24);
    ПолеВыбора3.ПорядокОбхода = 21;
    ПолеВыбора3.ВысотаЭлемента = 16;
    ПолеВыбора3.Положение = Ф.Точка(18, 42);
    ПолеВыбора3.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись11.Родитель = Форма_0;
    Надпись11.Размер = Ф.Размер(153, 16);
    Надпись11.ПорядокОбхода = 22;
    Надпись11.Положение = Ф.Точка(19, 23);
    Надпись11.Текст = "Класс";
    Надпись11.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

КонецПроцедуры

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

Процедура ПолучитьКлассы()
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКОглавлению);
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, "menu2", "</summary>", , );
	Если М.Количество() > 0 Тогда
		Для А = 0 По М.ВГраница() Цикл
			СтрЗаголовка= М[А];
			М2 = СтрНайтиМежду(СтрЗаголовка, "right"">", "</a>", , );
			// Сообщить("М2[0] = " + М2[0]);
			ПолеВыбора3.Элементы.Добавить(М2[0]);
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры

ПодготовкаКомпонентов();

ПутьКСтранице = "C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.";
ПутьКДокументации = "C:\444\OneScriptIntegrator\docs\OSIntegrator\";
ПутьКОглавлению = "C:\444\OneScriptIntegrator\docs\doc.html";
ВыходнойКаталог = "C:\444\OneScriptIntegrator\НовыеHtml";// без слэша в конце

КлассИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
КлассИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
СобытиеИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
СобытиеИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
Использование = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ЗначениеТип = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ЗначениеОписание = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!

ПолучитьКлассы();

НачальноеЗаполнениеФормы();

Ф.ЗапуститьОбработкуСобытий();
