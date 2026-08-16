Перем Ф;
Перем Форма_0;
Перем Кнопка1;
// // // Перем Надпись1;
Перем Надпись3;
Перем Надпись4;
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
Перем СвойствоИмяРус;
Перем СвойствоИмяEn;
Перем Использование;
Перем ЗначениеТип;
Перем ЗначениеОписание;
Перем ВыходнойКаталог;
Перем ПолеВыбора3;
Перем СтрКлассов;
Перем Надпись2;
Перем ПолеВыбора4;
Перем ТекстНаследования;
Перем Надпись10;
Перем ПолеВыбора5;
Перем КлассРодителяРус;
Перем КлассРодителяАнгл;
Перем Надпись11;
Перем ПолеВыбора6;
Перем Флажок1;

Перем ПутьКДокументации;
Перем ПутьКОглавлению;
Перем ПутьКСтранице;

Процедура Кн_Нажатие() Экспорт
	М = РазобратьСтроку(ПолеВыбора3.Текст, " ");
	КлассИмяРус = М[0];
	КлассИмяEn = М[1];
	СвойствоИмяРус = СокрЛП(ПолеВвода3.Текст);
	СвойствоИмяEn = СокрЛП(ПолеВвода4.Текст);
	Использование = СокрЛП(ПолеВыбора1.Текст);
	ЗначениеТип = СокрЛП(ПолеВыбора2.Текст);
	ЗначениеОписание = СокрЛП(ПолеВвода5.Текст);
	
	ТекстНаследования = "";
	Если СокрЛП(ПолеВыбора4.Текст) <> "" Тогда
		М4 = РазобратьСтроку(ПолеВыбора4.Текст, " ");
		Если М4.Количество() = 2 Тогда
			ТекстНаследования = " (унаследовано от " + М4[0] + " (" + М4[1] + "))";
		КонецЕсли;
	КонецЕсли;
	
	// Если Флажок1.Помечен Тогда
		// Для А = 0 По ПолеВыбора5.Элементы.Количество - 1 Цикл
			// Эл = ПолеВыбора5.Элементы(А);
			// Сообщить("Эл.Текст = " + Эл.Текст);
			// ПолеВыбора5.Текст = Эл.Текст;
			// Приостановить(500);
			// // Ф.Предупреждение("Завершено " + ПолеВыбора5.Текст, 1, "Завершено");
			// СоздатьСвойство();
		// КонецЦикла;
		// Ф.ОкноСообщений().Показать("Завершено", "Завершено");
	// Иначе
		// СоздатьСвойство();
	// КонецЕсли;
	СоздатьСвойство();
КонецПроцедуры

Процедура НачальноеЗаполнениеФормы()
	ПолеВыбора3.Текст = ""; // Класс
	ПолеВвода3.Текст = ""; // СвойствоИмяРус
	ПолеВвода4.Текст = ""; // СвойствоИмяEn
	ПолеВвода5.Текст = ""; // ЗначениеОписание
	ПолеВыбора1.Текст = ""; // Использование
	ПолеВыбора2.Текст = ""; // ЗначениеТип
	ПолеВыбора4.Текст = "";
	
	ЗаполнитьПолеВыбора3();
	ЗаполнитьПолеВыбора6();
	Флажок1.Помечен = Ложь;
КонецПроцедуры

Процедура ЗаполнитьПолеВыбора6()
	Список = Новый СписокЗначений();
	ВыбранныеФайлы = НайтиФайлы(ПутьКДокументации, "*.html", Истина);
	Для А = 0 По ВыбранныеФайлы.ВГраница() Цикл
		Если СтрНайти(ВыбранныеФайлы[А].Имя, "Properties.html") > 0 Тогда
			// Сообщить("" + ВыбранныеФайлы[А].ПолноеИмя);
			ТекстДок = Новый ТекстовыйДокумент;
			ТекстДок.Прочитать(ВыбранныеФайлы[А].ПолноеИмя);
			Стр = ТекстДок.ПолучитьТекст();
			
			КлассРусАнгл = СтрНайтиМежду(Стр, "<h1 class=dtH1>", "Свойства</h1>", , )[0];
			КлассРусАнгл = СтрЗаменить(КлассРусАнгл, "&nbsp;", " ");
			КлассРусАнгл = СтрЗаменить(КлассРусАнгл, "(", "");
			КлассРусАнгл = СтрЗаменить(КлассРусАнгл, ")", "");
			КлассРусАнгл = СокрЛП(КлассРусАнгл);
			
			М2 = СтрНайтиМежду(Стр, "<tbody>", "</tbody>", , );
			Если М2.Количество() > 0 Тогда
				// Сообщить("" + М2[1]);
				М3 = СтрНайтиМежду(М2[1], "<tr vAlign=top>", "</tr>", Ложь, );
				Для А3 = 0 По М3.ВГраница() Цикл
					// Сообщить("" + М3[А3]);
					М4 = СтрНайтиМежду(М3[А3], "html"">", "</a>", , );
					Если М4.Количество() > 0 Тогда
						Для А4 = 0 По М4.ВГраница() Цикл
							// Сообщить("М4[0] = " + М4[0]);
							ИмяСвойства = М4[0];
							ИмяСвойства = СтрЗаменить(ИмяСвойства, "&nbsp;", " ");
							ИмяСвойства = СтрЗаменить(ИмяСвойства, "(", "");
							ИмяСвойства = СтрЗаменить(ИмяСвойства, ")", "");
							
							Если Список.НайтиПоЗначению(ИмяСвойства) = Неопределено Тогда
								Список.Добавить(ИмяСвойства, КлассРусАнгл);
								// Сообщить("" + ИмяСвойства + " " + КлассРусАнгл);
							КонецЕсли;
						КонецЦикла;
					КонецЕсли;
				КонецЦикла;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	Список.СортироватьПоЗначению();
	Для А = 0 По Список.Количество() - 1 Цикл
		ПолеВыбора6.Элементы.Добавить(Список.Получить(А).Значение + " " + Список.Получить(А).Представление);
	КонецЦикла;
КонецПроцедуры

Процедура ЗаполнитьПолеВыбора3()
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
						ПолеВыбора3.Элементы.Добавить(СтрКласс);
						ПолеВыбора4.Элементы.Добавить(СтрКласс);
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

Процедура СоздатьСвойство()
	Стр = "<!DOCTYPE html>
	|<html lang=""ru"">
	|<head>
	|    <title>SVOJSTVO Property</title>
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
	|            <h1 class=dtH1>ККЛЛААСС.ССВВООЙЙССТТВВОО&nbsp;(CCLLAASS.SVOJSTVO)&nbsp;Свойство</h1>
	|        </div>
	|    </div>
	|    <div id=nstext>
	|        <h4 class=dtH4>Использование</h4>
	|        <p>" + Использование + "</p>
	|        <h4 class=dtH4>Значение</h4>
	|        <p>Тип: " + ЗначениеТип + "</p>
	|        <p>" + ЗначениеОписание + "</p>
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
	Если КлассИмяEn = "" Тогда
		ПодстрокаПоиска = "ККЛЛААСС.";
		ПодстрокаЗамены = КлассИмяРус;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
		
		ПодстрокаПоиска = "CCLLAASS.";
		ПодстрокаЗамены = КлассИмяEn;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	Иначе
		ПодстрокаПоиска = "ККЛЛААСС";
		ПодстрокаЗамены = КлассИмяРус;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
		
		ПодстрокаПоиска = "CCLLAASS";
		ПодстрокаЗамены = КлассИмяEn;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;

	ПодстрокаПоиска = "ССВВООЙЙССТТВВОО";
	ПодстрокаЗамены = СвойствоИмяРус;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "SVOJSTVO";
	ПодстрокаЗамены = СвойствоИмяEn;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "." + СвойствоИмяEn + ".html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);

	// ====================================================================================
	// Изменим C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.КЛАССProperties.html 
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКСтранице + КлассИмяEn + "Properties.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<h4 class=dtH4>Свойства</h4>
		|        <div class=tablediv>
		|            <table class=dtTABLE cellSpacing=0>
		|                <tbody>", 
		"<tr vAlign=top>", 
		Ложь, );
	// Сообщить("М[0] = " + М[0]);
	ПодстрокаПоиска = М[0];
	ПодстрокаЗамены = М[0] + "
	|                        <td width=""50%""><img src=""pubproperty.gif""></img><a href=""OSIntegrator." + КлассИмяEn + "." + СвойствоИмяEn + ".html"">" + СвойствоИмяРус + "&nbsp;(" + СвойствоИмяEn + ")</a>" + ТекстНаследования + "</td>
	|                        <td width=""50%"">" + ЗначениеОписание + "</td>
	|                    </tr>
	|                    <tr vAlign=top>";
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Properties.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	Приостановить(1000);
	Сортировать_Properties();
	
	// ====================================================================================
	// Изменим C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.КЛАССMembers.html
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКСтранице + КлассИмяEn + "Members.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<h4 class=dtH4>Свойства</h4>
		|        <div class=tablediv>
		|            <table class=dtTABLE cellSpacing=0>
		|                <tbody>", 
		"<tr vAlign=top>", 
		Ложь, );
	// Сообщить("М[0] = " + М[0]);
	ПодстрокаПоиска = М[0];
	ПодстрокаЗамены = М[0] + "
	|                        <td width=""50%""><img src=""pubproperty.gif""></img><a href=""OSIntegrator." + КлассИмяEn + "." + СвойствоИмяEn + ".html"">" + СвойствоИмяРус + "&nbsp;(" + СвойствоИмяEn + ")</a>" + ТекстНаследования + "</td>
	|                        <td width=""50%"">" + ЗначениеОписание + "</td>
	|                    </tr>
	|                    <tr vAlign=top>";
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Members.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	Приостановить(2000);
	Сортировать_Members();
	
	// ====================================================================================
	// Изменим C:\444\OneScriptIntegrator\docs\doc.html
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ПутьКОглавлению);
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<summary class=""menu3""><a href=""OSIntegrator/OSIntegrator." + КлассИмяEn + "Properties.html"" target=""right"">Свойства</a></summary>", 
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

	Фрагмент1 = "                        <p class=""prop""><a href=""OSIntegrator/OSIntegrator." + КлассИмяEn + "." + СвойствоИмяEn + ".html"" target=""right"">" + СвойствоИмяРус + " (" + СвойствоИмяEn + ")</a></p>";
	Список.Добавить(Фрагмент1, "" + СвойствоИмяРус + " (" + СвойствоИмяEn + ") Метод");
	Список.СортироватьПоПредставлению();
	ПодстрокаЗамены = "";
	Для А = 0 По Список.Количество() - 1 Цикл
		// Сообщить("==" + Список.Получить(А).Значение);
		ПодстрокаЗамены = ПодстрокаЗамены + Список.Получить(А).Значение + "
		|";
	КонецЦикла;
	ПодстрокаЗамены = "<summary class=""menu3""><a href=""OSIntegrator/OSIntegrator." + КлассИмяEn + "Properties.html"" target=""right"">Свойства</a></summary>
	|" + ПодстрокаЗамены + "                    </details>";
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаПоиска);
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаЗамены);
	
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	ИмяФайла = ВыходнойКаталог + "\doc.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	Приостановить(1000);
	
	
	
	// ОткудаПереносим1 = ИмяФайла;
	// КудаПереносим1 = ПутьКСтранице + КлассИмяEn + "." + СвойствоИмяEn + ".html";
	// ОткудаПереносим2 = ИмяФайла;
	// КудаПереносим2 = ПутьКСтранице + КлассИмяEn + "Properties.html";
	// ОкноСообщений1 = Ф.ОкноСообщений();
	// Если Флажок1.Помечен Тогда
		// КопироватьФайл(ОткудаПереносим1, КудаПереносим1);
		// Приостановить(500);
		// КопироватьФайл(ОткудаПереносим2, КудаПереносим2);
		// Приостановить(500);
		// УдалитьФайлы(ВыходнойКаталог, "*.html");  
		// Ф.Предупреждение("Завершено " + КлассИмяРус + "." + СвойствоИмяРус, 1, "Завершено");
	// Иначе
		// Ф.ОкноСообщений().Показать("Завершено", "Завершено");
	// КонецЕсли;
	Ф.ОкноСообщений().Показать("Завершено", "Завершено");
	
	ЗавершитьРаботу(0);
КонецПроцедуры//СоздатьСвойство()

Процедура Сортировать_Members()
	// Сортируем C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.КЛАССMembers.html
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	// Сообщить("путь = " + ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Members.html");
	ТекстДок.Прочитать(ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Members.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"<h4 class=dtH4>Свойства</h4>
		|        <div class=tablediv>
		|            <table class=dtTABLE cellSpacing=0>
		|                <tbody>", 
		"</tbody>", Ложь, );
	// Сообщить("М.Количество() = " + М.Количество());
	Если М.Количество() > 0 Тогда
		// Сообщить("" + М[0]);
		ПодстрокаПоиска = М[0];
		М2 = СтрНайтиМежду(М[0], "                    <tr vAlign=top>", "</tr>", Ложь, );
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
	ПодстрокаЗамены = 
	"<h4 class=dtH4>Свойства</h4>
	|        <div class=tablediv>
	|            <table class=dtTABLE cellSpacing=0>
	|                <tbody>					
	|" + ПодстрокаЗамены + "                </tbody>";
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаПоиска);
	// Сообщить("=======================================");
	// Сообщить("" + ПодстрокаЗамены);
	
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Members.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
КонецПроцедуры//Сортировать_Members

Процедура Сортировать_Properties()
	Список = Новый СписокЗначений();
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать(ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Properties.html");
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
	ИмяФайла = ВыходнойКаталог + "\OSIntegrator." + КлассИмяEn + "Properties.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
КонецПроцедуры

Процедура ЗаполнитьПолеВыбора5(Родитель) Экспорт
	ПолеВыбора5.Элементы.Очистить();
	ПолеВыбора5.Текст = "";

	// Сообщить("" + Родитель);
	КлассРодителяРус = СтрРазделить(Родитель, " ")[0];
	КлассРодителяАнгл = СтрРазделить(Родитель, " ")[1];
	ТекстДок = Новый ТекстовыйДокумент;
	ФайлСвойства = ПутьКСтранице + КлассРодителяАнгл + "Properties.html";
	КаталогНаДиске = Новый Файл(ФайлСвойства);
    Если Не (КаталогНаДиске.Существует()) Тогда
		Возврат;
	КонецЕсли;
	ТекстДок.Прочитать(ФайлСвойства);
	СтрТекстДок = ТекстДок.ПолучитьТекст();
	// Сообщить("" + СтрТекстДок);
	М2 = СтрНайтиМежду(СтрТекстДок, 
		"<tbody>", 
		"</tbody>", Ложь, );
	Если М2.Количество() > 0 Тогда
		// Сообщить("" + М2[1]);
		М3 = СтрНайтиМежду(М2[1], "<tr vAlign=top>", "</tr>", Ложь, );
		Для А3 = 0 По М3.ВГраница() Цикл
			// Сообщить("" + М3[А3]);
			М4 = СтрНайтиМежду(М3[А3], "html"">", "</a>", , );
			Если М4.Количество() > 0 Тогда
				Для А4 = 0 По М4.ВГраница() Цикл
					// Сообщить("М4[0] = " + М4[0]);
					ИмяСвойства = М4[0];
					ИмяСвойства = СтрЗаменить(ИмяСвойства, "&nbsp;", " ");
					ИмяСвойства = СтрЗаменить(ИмяСвойства, "(", "");
					ИмяСвойства = СтрЗаменить(ИмяСвойства, ")", "");
					
					Если Не СтрНайти(М3[А3], "(унаследовано") > 0 Тогда
						ПолеВыбора5.Элементы.Добавить(ИмяСвойства);
					КонецЕсли;
					
					
					// ПолеВыбора5.Элементы.Добавить(ИмяСвойства);
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры

Процедура КопироватьСвойство() Экспорт
	СвойствоРус = СтрРазделить(ПолеВыбора6.Текст, " ")[0];
	СвойствоАнгл = СтрРазделить(ПолеВыбора6.Текст, " ")[1];
	КлассСвойстваРус = СтрРазделить(ПолеВыбора6.Текст, " ")[2];
	КлассСвойстваАнгл = СтрРазделить(ПолеВыбора6.Текст, " ")[3];
    // Сообщить("СвойствоРус = " + СвойствоРус);
    // Сообщить("СвойствоАнгл = " + СвойствоАнгл);
    // Сообщить("КлассСвойстваРус = " + КлассРодителяРус);
    // Сообщить("КлассСвойстваАнгл = " + КлассРодителяАнгл);
	
	ТекстДок = Новый ТекстовыйДокумент;
	// OSIntegrator.Action.Script.html
	ФайлСвойство = ПутьКСтранице + КлассСвойстваАнгл + "." + СвойствоАнгл + ".html";
	КаталогНаДиске = Новый Файл(ФайлСвойство);
    Если Не (КаталогНаДиске.Существует()) Тогда
		Возврат;
	КонецЕсли;
	ТекстДок.Прочитать(ФайлСвойство);
	СтрТекстДок = ТекстДок.ПолучитьТекст();
	// Сообщить("СтрТекстДок = " + СтрТекстДок);
	// Использование</h4>
	М = СтрНайтиМежду(СтрТекстДок, "Использование</h4>", "/p>", , );
	Использование = СтрНайтиМежду(М[0], "<p>", "<", , )[0]; // ПолеВыбора1
	ПолеВыбора1.Текст = Использование;
	// Сообщить("Использование = " + Использование);
	
	СвойствоИмяРус = СвойствоРус; // ПолеВвода3
	ПолеВвода3.Текст = СвойствоИмяРус;
	// Сообщить("СвойствоИмяРус = " + СвойствоИмяРус);
	
	СвойствоИмяEn = СвойствоАнгл; // ПолеВвода4
	ПолеВвода4.Текст = СвойствоИмяEn;
	// Сообщить("СвойствоИмяEn = " + СвойствоИмяEn);
	
	М = СтрНайтиМежду(СтрТекстДок, "<h4 class=dtH4>Значение</h4>", "<h4 class=dtH4>Примечание</h4>", , );
	Если М.Количество() > 0 Тогда
		// Сообщить("" + М2[1]);
		М2 = СтрНайтиМежду(М[0], "<p>", "</p>", , );
		Если М2.Количество() > 0 Тогда
			Попытка
				ЗначениеТип = М2[0]; // ПолеВыбора2
				ЗначениеТип = СтрЗаменить(ЗначениеТип, "Тип:", " ");
				ЗначениеТип = СтрЗаменить(ЗначениеТип, " ", "");
				ЗначениеТип = СтрЗаменить(ЗначениеТип, "ahref", "a href");
				ПолеВыбора2.Текст = ЗначениеТип;
				// Сообщить("ЗначениеТип = " + ЗначениеТип);
			Исключение
			КонецПопытки;
			Попытка
				ЗначениеОписание = М2[1]; // ПолеВвода5
				ПолеВвода5.Текст = ЗначениеОписание;
				// Сообщить("ЗначениеОписание = " + ЗначениеОписание);
			Исключение
			КонецПопытки;
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

Процедура КопироватьНаследуемоеСвойство() Экспорт
	СвойствоРус = СтрРазделить(ПолеВыбора5.Текст, " ")[0];
	СвойствоАнгл = СтрРазделить(ПолеВыбора5.Текст, " ")[1];
    // Сообщить("СвойствоРус = " + СвойствоРус);
    // Сообщить("СвойствоАнгл = " + СвойствоАнгл);
    // Сообщить("КлассРодителяРус = " + КлассРодителяРус);
    // Сообщить("КлассРодителяАнгл = " + КлассРодителяАнгл);
	
	ТекстДок = Новый ТекстовыйДокумент;
	// OSIntegrator.Action.Script.html
	ФайлСвойство = ПутьКСтранице + КлассРодителяАнгл + "." + СвойствоАнгл + ".html";
	КаталогНаДиске = Новый Файл(ФайлСвойство);
    Если Не (КаталогНаДиске.Существует()) Тогда
		Возврат;
	КонецЕсли;
	ТекстДок.Прочитать(ФайлСвойство);
	СтрТекстДок = ТекстДок.ПолучитьТекст();
	// Сообщить("СтрТекстДок = " + СтрТекстДок);
	// Использование</h4>
	М = СтрНайтиМежду(СтрТекстДок, "Использование</h4>", "/p>", , );
	Использование = СтрНайтиМежду(М[0], "<p>", "<", , )[0]; // ПолеВыбора1
	ПолеВыбора1.Текст = Использование;
	// Сообщить("Использование = " + Использование);
	
	СвойствоИмяРус = СвойствоРус; // ПолеВвода3
	ПолеВвода3.Текст = СвойствоИмяРус;
	// Сообщить("СвойствоИмяРус = " + СвойствоИмяРус);
	
	СвойствоИмяEn = СвойствоАнгл; // ПолеВвода4
	ПолеВвода4.Текст = СвойствоИмяEn;
	// Сообщить("СвойствоИмяEn = " + СвойствоИмяEn);
	
	М = СтрНайтиМежду(СтрТекстДок, "<h4 class=dtH4>Значение</h4>", "<h4 class=dtH4>Примечание</h4>", , );
	Если М.Количество() > 0 Тогда
		// Сообщить("" + М2[1]);
		М2 = СтрНайтиМежду(М[0], "<p>", "</p>", , );
		Если М2.Количество() > 0 Тогда
			Попытка
				ЗначениеТип = М2[0]; // ПолеВыбора2
				ЗначениеТип = СтрЗаменить(ЗначениеТип, "Тип:", " ");
				ЗначениеТип = СтрЗаменить(ЗначениеТип, " ", "");
				ЗначениеТип = СтрЗаменить(ЗначениеТип, "ahref", "a href");
				ПолеВыбора2.Текст = ЗначениеТип;
				// Сообщить("ЗначениеТип = " + ЗначениеТип);
			Исключение
			КонецПопытки;
			Попытка
				ЗначениеОписание = М2[1]; // ПолеВвода5
				ПолеВвода5.Текст = ЗначениеОписание;
				// Сообщить("ЗначениеОписание = " + ЗначениеОписание);
			Исключение
			КонецПопытки;
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

Процедура ПолеВыбора4_ИндексВыбранногоИзменен() Экспорт
	ЗаполнитьПолеВыбора5(ПолеВыбора4.Текст);
КонецПроцедуры

Процедура ПолеВыбора5_ИндексВыбранногоИзменен() Экспорт
	КопироватьНаследуемоеСвойство();
КонецПроцедуры

Процедура ПолеВыбора6_ИндексВыбранногоИзменен() Экспорт
    КопироватьСвойство();
КонецПроцедуры

Процедура ПодготовкаКомпонентов()
    // ВАЖНО: Необходимая процедура для поддержки конструктора — не изменяйте содержимое этой процедуры с помощью редактора кода.
    // osdText = "WzzQmtC+0L3RgdGC0YDRg9C60YLQvtGA0YtdDQrQpNC+0YDQvNCwXzAgPSDQpC7QpNC+0YDQvNCwKCk7DQrQmtC90L7Qv9C60LAxID0g0KQu0JrQvdC+0L/QutCwKCk7DQrQndCw0LTQv9C40YHRjDIgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwzID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMNSA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDYgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMyA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J/QvtC70LXQktCy0L7QtNCwNCA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J3QsNC00L/QuNGB0Yw3ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMSA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDggPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCd0LDQtNC/0LjRgdGMOSA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LA1ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMgPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J3QsNC00L/QuNGB0YwxID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNCA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDEwID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNSA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDExID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNiA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQpNC70LDQttC+0LoxID0g0KQu0KTQu9Cw0LbQvtC6KCk7DQpb0JrQvtC90YHRgtGA0YPQutGC0L7RgNGLPl0NCls80KHQstC+0LnRgdGC0LLQsF0NCls80KTQvtGA0LzQsF8wXQ0K0KTQvtGA0LzQsF8wLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2NDksIDUwNCk7DQrQpNC+0YDQvNCwXzAu0J/Rg9GC0YwgPSAiQzpcNDQ0XE9uZVNjcmlwdEludGVncmF0b3Jc0KTQsNCx0YDQuNC60LBIdG1sXNCh0L7Qt9C00LDQvdC40LXQodCy0L7QudGB0YLQstCwLm9zIjsNCtCk0L7RgNC80LBfMC7QodGC0LjQu9GM0KHQutGA0LjQv9GC0LAgPSAi0KHRgtC40LvRjNCh0LrRgNC40L/RgtCwIjsNCtCk0L7RgNC80LBfMC7QotC10LrRgdGCID0gItCh0L7Qt9C00LDQvdC40LUg0YHQstC+0LnRgdGC0LLQsCDQmNC90YLQtdCz0YDQsNGC0L7RgCI7DQrQpNC+0YDQvNCwXzAu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCk0L7RgNC80LBfMC7QmNC80Y/QntCx0YrQtdC60YLQsNCk0L7RgNC80YvQlNC70Y/QntC00L3QvtCh0LrRgNC40L/RgtCwID0gItCkIjsNClvQpNC+0YDQvNCwXzA+XQ0KWzzQmtC90L7Qv9C60LAxXQ0K0JrQvdC+0L/QutCwMS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0JrQvdC+0L/QutCwMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTI5LCAyMyk7DQrQmtC90L7Qv9C60LAxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMDsNCtCa0L3QvtC/0LrQsDEu0J3QsNC20LDRgtC40LUgPSAi0JrQvV/QndCw0LbQsNGC0LjQtSI7DQrQmtC90L7Qv9C60LAxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNDg3LCA0MjYpOw0K0JrQvdC+0L/QutCwMS7QotC10LrRgdGCID0gItCh0L7Qt9C00LDRgtGMINGB0LLQvtC50YHRgtCy0L4iOw0K0JrQvdC+0L/QutCwMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Ca0L3QvtC/0LrQsDE+XQ0KWzzQndCw0LTQv9C40YHRjDJdDQrQndCw0LTQv9C40YHRjDIu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMzUyLCAyMyk7DQrQndCw0LTQv9C40YHRjDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyOw0K0J3QsNC00L/QuNGB0YwyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTQsIDQyNik7DQrQndCw0LTQv9C40YHRjDIu0KLQtdC60YHRgiA9ICLQktGL0YXQvtC00L3Ri9C1INC00LDQvdC90YvQtSDQsdGD0LTRg9GCINCyINC60LDRgtCw0LvQvtCz0LUgLi4uXNCd0L7QstGL0LVIdG1sIjsNCtCd0LDQtNC/0LjRgdGMMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMj5dDQpbPNCd0LDQtNC/0LjRgdGMM10NCtCd0LDQtNC/0LjRgdGMMy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0YwzLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDM7DQrQndCw0LTQv9C40YHRjDMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgNyk7DQrQndCw0LTQv9C40YHRjDMu0KLQtdC60YHRgiA9ICLQmtC70LDRgdGBIjsNCtCd0LDQtNC/0LjRgdGMMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMz5dDQpbPNCd0LDQtNC/0LjRgdGMNV0NCtCd0LDQtNC/0LjRgdGMNS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNDUsIDE3KTsNCtCd0LDQtNC/0LjRgdGMNS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDc7DQrQndCw0LTQv9C40YHRjDUu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxMywgMTU1KTsNCtCd0LDQtNC/0LjRgdGMNS7QotC10LrRgdGCID0gItCh0LLQvtC50YHRgtCy0L7QmNC80Y/QoNGD0YEiOw0K0J3QsNC00L/QuNGB0Yw1LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw1Pl0NCls80J3QsNC00L/QuNGB0Yw2XQ0K0J3QsNC00L/QuNGB0Yw2LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDYu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEzNiwgMTYpOw0K0J3QsNC00L/QuNGB0Yw2LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gODsNCtCd0LDQtNC/0LjRgdGMNi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMxNSwgMTU2KTsNCtCd0LDQtNC/0LjRgdGMNi7QotC10LrRgdGCID0gItCh0LLQvtC50YHRgtCy0L7QmNC80Y9FbiI7DQrQndCw0LTQv9C40YHRjDYu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDY+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LAzXQ0K0J/QvtC70LXQktCy0L7QtNCwMy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktCy0L7QtNCwMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyMik7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gOTsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxMywgMTc1KTsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAzPl0NCls80J/QvtC70LXQktCy0L7QtNCwNF0NCtCf0L7Qu9C10JLQstC+0LTQsDQu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLQstC+0LTQsDQu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwNC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDEwOw0K0J/QvtC70LXQktCy0L7QtNCwNC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMxNSwgMTc1KTsNCtCf0L7Qu9C10JLQstC+0LTQsDQu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LA0Pl0NCls80J3QsNC00L/QuNGB0Yw3XQ0K0J3QsNC00L/QuNGB0Yw3LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDcu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDE0NSwgMTgpOw0K0J3QsNC00L/QuNGB0Yw3LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTE7DQrQndCw0LTQv9C40YHRjDcu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNCwgMTk4KTsNCtCd0LDQtNC/0LjRgdGMNy7QotC10LrRgdGCID0gItCY0YHQv9C+0LvRjNC30L7QstCw0L3QuNC1IjsNCtCd0LDQtNC/0LjRgdGMNy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNz5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMV0NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyOTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDEyOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE0LCAyMTkpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCi0LXQutGB0YIgPSAi0KLQvtC70YzQutC+INC30LDQv9C40YHRjC4iOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSAyOTU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0L7Qu9GM0LrQviDQt9Cw0L/QuNGB0YwuIiwgItCi0L7Qu9GM0LrQviDQt9Cw0L/QuNGB0YwuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQvtC70YzQutC+INGH0YLQtdC90LjQtS4iLCAi0KLQvtC70YzQutC+INGH0YLQtdC90LjQtS4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQp9GC0LXQvdC40LUg0Lgg0LfQsNC/0LjRgdGMLiIsICLQp9GC0LXQvdC40LUg0Lgg0LfQsNC/0LjRgdGMLiIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDE+XQ0KWzzQndCw0LTQv9C40YHRjDhdDQrQndCw0LTQv9C40YHRjDgu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMOC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNyk7DQrQndCw0LTQv9C40YHRjDgu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxMzsNCtCd0LDQtNC/0LjRgdGMOC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDEzLCAyNTIpOw0K0J3QsNC00L/QuNGB0Yw4LtCi0LXQutGB0YIgPSAi0JfQvdCw0YfQtdC90LjQtdCi0LjQvyI7DQrQndCw0LTQv9C40YHRjDgu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDg+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDJdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNTk3LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxNDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNCwgMjcyKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QotC10LrRgdGCID0gItCR0YPQu9C10LLQvi4iOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA1OTc7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCR0YPQu9C10LLQvi4iLCAi0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCh0YLRgNC+0LrQsC4iLCAi0KHRgtGA0L7QutCwLiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCn0LjRgdC70L4uIiwgItCn0LjRgdC70L4uIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0J/RgNC+0LjQt9Cy0L7Qu9GM0L3Ri9C5LiIsICLQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIsICLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMj5dDQpbPNCd0LDQtNC/0LjRgdGMOV0NCtCd0LDQtNC/0LjRgdGMOS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw5LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNjQsIDE4KTsNCtCd0LDQtNC/0LjRgdGMOS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDE1Ow0K0J3QsNC00L/QuNGB0Yw5LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTMsIDMwMik7DQrQndCw0LTQv9C40YHRjDku0KLQtdC60YHRgiA9ICLQl9C90LDRh9C10L3QuNC10J7Qv9C40YHQsNC90LjQtSI7DQrQndCw0LTQv9C40YHRjDku0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDk+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LA1XQ0K0J/QvtC70LXQktCy0L7QtNCwNS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktCy0L7QtNCwNS7QnNC90L7Qs9C+0YHRgtGA0L7Rh9C90YvQudCg0LXQttC40LwgPSDQmNGB0YLQuNC90LA7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1OTcsIDg3KTsNCtCf0L7Qu9C10JLQstC+0LTQsDUu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxNjsNCtCf0L7Qu9C10JLQstC+0LTQsDUu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNCwgMzIzKTsNCtCf0L7Qu9C10JLQstC+0LTQsDUu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LA1Pl0NCls80J/QvtC70LXQktGL0LHQvtGA0LAzXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NSwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTc7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDI1KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LAzPl0NCls80J3QsNC00L/QuNGB0YwxXQ0K0J3QsNC00L/QuNGB0YwxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEyMywgMTgpOw0K0J3QsNC00L/QuNGB0YwxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTg7DQrQndCw0LTQv9C40YHRjDEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgyMCwgNTgpOw0K0J3QsNC00L/QuNGB0YwxLtCi0LXQutGB0YIgPSAi0KPQvdCw0YHQu9C10LTQvtCy0LDQvdC+INC+0YIiOw0K0J3QsNC00L/QuNGB0YwxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwxPl0NCls80J/QvtC70LXQktGL0LHQvtGA0LA0XQ0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDM4MSwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCU0L7RgdGC0YPQv9C90L7RgdGC0YwgPSDQm9C+0LbRjDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNC7QmNC90LTQtdC60YHQktGL0LHRgNCw0L3QvdC+0LPQvtCY0LfQvNC10L3QtdC9ID0gItCf0L7Qu9C10JLRi9Cx0L7RgNCwNF/QmNC90LTQtdC60YHQktGL0LHRgNCw0L3QvdC+0LPQvtCY0LfQvNC10L3QtdC9IjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE0OSwgNTUpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA0Njc7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDQ+XQ0KWzzQndCw0LTQv9C40YHRjDEwXQ0K0J3QsNC00L/QuNGB0YwxMC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0YwxMC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTYyLCAyMyk7DQrQndCw0LTQv9C40YHRjDEwLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjA7DQrQndCw0LTQv9C40YHRjDEwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjAsIDg4KTsNCtCd0LDQtNC/0LjRgdGMMTAu0KLQtdC60YHRgiA9ICLQndCw0YHQu9C10LTRg9C10LzQvtC1INGB0LLQvtC50YHRgtCy0L4iOw0K0J3QsNC00L/QuNGB0YwxMC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMTA+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDVdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDUu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNDI4LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDUu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyMTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNS7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDUu0JTQvtGB0YLRg9C/0L3QvtGB0YLRjCA9INCb0L7QttGMOw0K0J/QvtC70LXQktGL0LHQvtGA0LA1LtCY0L3QtNC10LrRgdCS0YvQsdGA0LDQvdC90L7Qs9C+0JjQt9C80LXQvdC10L0gPSAi0J/QvtC70LXQktGL0LHQvtGA0LA1X9CY0L3QtNC10LrRgdCS0YvQsdGA0LDQvdC90L7Qs9C+0JjQt9C80LXQvdC10L0iOw0K0J/QvtC70LXQktGL0LHQvtGA0LA1LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTg4LCA4NSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDUu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDQyODsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwNT5dDQpbPNCd0LDQtNC/0LjRgdGMMTFdDQrQndCw0LTQv9C40YHRjDExLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDExLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNDgsIDIzKTsNCtCd0LDQtNC/0LjRgdGMMTEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyMjsNCtCd0LDQtNC/0LjRgdGMMTEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgyMCwgMTIxKTsNCtCd0LDQtNC/0LjRgdGMMTEu0KLQtdC60YHRgiA9ICLQmtC+0L/QuNGA0YPQtdC80L7QtSDRgdCy0L7QudGB0YLQstC+IjsNCtCd0LDQtNC/0LjRgdGMMTEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDExPl0NCls80J/QvtC70LXQktGL0LHQvtGA0LA2XQ0K0J/QvtC70LXQktGL0LHQvtGA0LA2LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDQ0MiwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA2LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjM7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LA2LtCU0L7RgdGC0YPQv9C90L7RgdGC0YwgPSDQm9C+0LbRjDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNi7QmNC90LTQtdC60YHQktGL0LHRgNCw0L3QvdC+0LPQvtCY0LfQvNC10L3QtdC9ID0gItCf0L7Qu9C10JLRi9Cx0L7RgNCwNl/QmNC90LTQtdC60YHQktGL0LHRgNCw0L3QvdC+0LPQvtCY0LfQvNC10L3QtdC9IjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE3NCwgMTE4KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNi7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gNDQyOw0K0J/QvtC70LXQktGL0LHQvtGA0LA2LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LA2Pl0NCls80KTQu9Cw0LbQvtC6MV0NCtCk0LvQsNC20L7QujEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCk0LvQsNC20L7QujEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDgwLCAyNCk7DQrQpNC70LDQttC+0LoxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjQ7DQrQpNC70LDQttC+0LoxLtCU0L7RgdGC0YPQv9C90L7RgdGC0YwgPSDQm9C+0LbRjDsNCtCk0LvQsNC20L7QujEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg1MzYsIDU1KTsNCtCk0LvQsNC20L7QujEu0KLQtdC60YHRgiA9ICLQkNCy0YLQvtC80LDRgiI7DQrQpNC70LDQttC+0LoxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0KTQu9Cw0LbQvtC6MT5dDQpb0KHQstC+0LnRgdGC0LLQsD5dDQo=";
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
    Надпись3 = Ф.Надпись();
    Надпись3.Имя = "Надпись3";
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
    Надпись1 = Ф.Надпись();
    Надпись1.Имя = "Надпись1";
    ПолеВыбора4 = Ф.ПолеВыбора();
    ПолеВыбора4.Имя = "ПолеВыбора4";
    Надпись10 = Ф.Надпись();
    Надпись10.Имя = "Надпись10";
    ПолеВыбора5 = Ф.ПолеВыбора();
    ПолеВыбора5.Имя = "ПолеВыбора5";
    Надпись11 = Ф.Надпись();
    Надпись11.Имя = "Надпись11";
    ПолеВыбора6 = Ф.ПолеВыбора();
    ПолеВыбора6.Имя = "ПолеВыбора6";
    Флажок1 = Ф.Флажок();
    Флажок1.Имя = "Флажок1";

    Форма_0.Размер = Ф.Размер(649, 504);
    Форма_0.Текст = "Создание свойства Интегратор";
    Форма_0.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка1.Родитель = Форма_0;
    Кнопка1.Размер = Ф.Размер(129, 23);
    Кнопка1.ПорядокОбхода = 0;
    Кнопка1.Нажатие = Ф.Действие(ЭтотОбъект, "Кн_Нажатие");
    Кнопка1.Положение = Ф.Точка(487, 426);
    Кнопка1.Текст = "Создать свойство";
    Кнопка1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись2.Родитель = Форма_0;
    Надпись2.Размер = Ф.Размер(352, 23);
    Надпись2.ПорядокОбхода = 2;
    Надпись2.Положение = Ф.Точка(14, 426);
    Надпись2.Текст = "Выходные данные будут в каталоге ...\НовыеHtml";
    Надпись2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись3.Родитель = Форма_0;
    Надпись3.Размер = Ф.Размер(100, 15);
    Надпись3.ПорядокОбхода = 3;
    Надпись3.Положение = Ф.Точка(18, 7);
    Надпись3.Текст = "Класс";
    Надпись3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись5.Родитель = Форма_0;
    Надпись5.Размер = Ф.Размер(145, 17);
    Надпись5.ПорядокОбхода = 7;
    Надпись5.Положение = Ф.Точка(13, 155);
    Надпись5.Текст = "СвойствоИмяРус";
    Надпись5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись6.Родитель = Форма_0;
    Надпись6.Размер = Ф.Размер(136, 16);
    Надпись6.ПорядокОбхода = 8;
    Надпись6.Положение = Ф.Точка(315, 156);
    Надпись6.Текст = "СвойствоИмяEn";
    Надпись6.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода3.Родитель = Форма_0;
    ПолеВвода3.Размер = Ф.Размер(296, 22);
    ПолеВвода3.ПорядокОбхода = 9;
    ПолеВвода3.Положение = Ф.Точка(13, 175);
    ПолеВвода3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода4.Родитель = Форма_0;
    ПолеВвода4.Размер = Ф.Размер(296, 22);
    ПолеВвода4.ПорядокОбхода = 10;
    ПолеВвода4.Положение = Ф.Точка(315, 175);
    ПолеВвода4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись7.Родитель = Форма_0;
    Надпись7.Размер = Ф.Размер(145, 18);
    Надпись7.ПорядокОбхода = 11;
    Надпись7.Положение = Ф.Точка(14, 198);
    Надпись7.Текст = "Использование";
    Надпись7.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора1.Родитель = Форма_0;
    ПолеВыбора1.Размер = Ф.Размер(295, 24);
    ПолеВыбора1.ПорядокОбхода = 12;
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Только запись.", "Только запись."));
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Только чтение.", "Только чтение."));
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Чтение и запись.", "Чтение и запись."));
    ПолеВыбора1.ВысотаЭлемента = 16;
    ПолеВыбора1.Положение = Ф.Точка(14, 219);
    ПолеВыбора1.Текст = "Только запись.";
    ПолеВыбора1.ШиринаВыпадающегоСписка = 295;
    ПолеВыбора1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись8.Родитель = Форма_0;
    Надпись8.Размер = Ф.Размер(100, 17);
    Надпись8.ПорядокОбхода = 13;
    Надпись8.Положение = Ф.Точка(13, 252);
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
    ПолеВыбора2.Положение = Ф.Точка(14, 272);
    ПолеВыбора2.Текст = "Булево.";
    ПолеВыбора2.ШиринаВыпадающегоСписка = 597;
    ПолеВыбора2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись9.Родитель = Форма_0;
    Надпись9.Размер = Ф.Размер(164, 18);
    Надпись9.ПорядокОбхода = 15;
    Надпись9.Положение = Ф.Точка(13, 302);
    Надпись9.Текст = "ЗначениеОписание";
    Надпись9.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода5.Родитель = Форма_0;
    ПолеВвода5.Размер = Ф.Размер(597, 87);
    ПолеВвода5.ПорядокОбхода = 16;
    ПолеВвода5.МногострочныйРежим = Истина;
    ПолеВвода5.Положение = Ф.Точка(14, 323);
    ПолеВвода5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора3.Родитель = Форма_0;
    ПолеВыбора3.Размер = Ф.Размер(295, 24);
    ПолеВыбора3.ПорядокОбхода = 17;
    ПолеВыбора3.ВысотаЭлемента = 16;
    ПолеВыбора3.Положение = Ф.Точка(19, 25);
    ПолеВыбора3.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись1.Родитель = Форма_0;
    Надпись1.Размер = Ф.Размер(123, 18);
    Надпись1.ПорядокОбхода = 18;
    Надпись1.Положение = Ф.Точка(20, 58);
    Надпись1.Текст = "Унаследовано от";
    Надпись1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора4.Родитель = Форма_0;
    ПолеВыбора4.Размер = Ф.Размер(381, 24);
    ПолеВыбора4.ПорядокОбхода = 19;
    ПолеВыбора4.ВысотаЭлемента = 16;
    ПолеВыбора4.Доступность = Ложь;
    ПолеВыбора4.ИндексВыбранногоИзменен = Ф.Действие(ЭтотОбъект, "ПолеВыбора4_ИндексВыбранногоИзменен");
    ПолеВыбора4.Положение = Ф.Точка(149, 55);
    ПолеВыбора4.ШиринаВыпадающегоСписка = 467;
    ПолеВыбора4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись10.Родитель = Форма_0;
    Надпись10.Размер = Ф.Размер(162, 23);
    Надпись10.ПорядокОбхода = 20;
    Надпись10.Положение = Ф.Точка(20, 88);
    Надпись10.Текст = "Наследуемое свойство";
    Надпись10.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора5.Родитель = Форма_0;
    ПолеВыбора5.Размер = Ф.Размер(428, 24);
    ПолеВыбора5.ПорядокОбхода = 21;
    ПолеВыбора5.ВысотаЭлемента = 16;
    ПолеВыбора5.Доступность = Ложь;
    ПолеВыбора5.ИндексВыбранногоИзменен = Ф.Действие(ЭтотОбъект, "ПолеВыбора5_ИндексВыбранногоИзменен");
    ПолеВыбора5.Положение = Ф.Точка(188, 85);
    ПолеВыбора5.ШиринаВыпадающегоСписка = 428;
    ПолеВыбора5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись11.Родитель = Форма_0;
    Надпись11.Размер = Ф.Размер(148, 23);
    Надпись11.ПорядокОбхода = 22;
    Надпись11.Положение = Ф.Точка(20, 121);
    Надпись11.Текст = "Копируемое свойство";
    Надпись11.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора6.Родитель = Форма_0;
    ПолеВыбора6.Размер = Ф.Размер(442, 24);
    ПолеВыбора6.ПорядокОбхода = 23;
    ПолеВыбора6.ВысотаЭлемента = 16;
    ПолеВыбора6.Доступность = Ложь;
    ПолеВыбора6.ИндексВыбранногоИзменен = Ф.Действие(ЭтотОбъект, "ПолеВыбора6_ИндексВыбранногоИзменен");
    ПолеВыбора6.Положение = Ф.Точка(174, 118);
    ПолеВыбора6.ШиринаВыпадающегоСписка = 442;
    ПолеВыбора6.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Флажок1.Родитель = Форма_0;
    Флажок1.Размер = Ф.Размер(80, 24);
    Флажок1.ПорядокОбхода = 24;
    Флажок1.Доступность = Ложь;
    Флажок1.Положение = Ф.Точка(536, 55);
    Флажок1.Текст = "Автомат";
    Флажок1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

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

ПодготовкаКомпонентов();

ПутьКСтранице = "C:\444\OneScriptIntegrator\docs\OSIntegrator\OSIntegrator.";
ПутьКДокументации = "C:\444\OneScriptIntegrator\docs\OSIntegrator\";
ПутьКОглавлению = "C:\444\OneScriptIntegrator\docs\doc.html";
ВыходнойКаталог = "C:\444\OneScriptIntegrator\НовыеHtml";// без слэша в конце

КлассИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
КлассИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
СвойствоИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
СвойствоИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
Использование = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ЗначениеТип = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ЗначениеОписание = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!

НачальноеЗаполнениеФормы();

Ф.ЗапуститьОбработкуСобытий();
