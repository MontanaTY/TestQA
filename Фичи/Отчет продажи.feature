﻿#language: ru

@tree

Функционал: тестирование отчета Продажи

Как Тестировщик я хочу
протестировать отчет D2001 Продажи 
чтобы проверить корректность отображения возвратов в отчете D2001 Продажи 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
		
Сценарий: загрузка документов и проведение
	И экспорт документов закупок
	И я выполняю код встроенного языка на сервере
	|'Документы.PurchaseOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.PurchaseOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.PurchaseOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.PurchaseInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.PurchaseReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.PurchaseReturn.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

	И экспорт документов реализации и возвратов

//	И экспорт документов продаж
	И я выполняю код встроенного языка на сервере
	|'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|


Сценарий: Проверка отчета D2001 Продажи
	* Открытие и настройка отчета
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormChangeVariant'
		И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
			| 'Параметр' |
			| 'Период'   |
		И в таблице "SettingsComposerSettingsDataParameters" я выбираю текущую строку
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersStartDate' я ввожу текст '01.01.2021  0:00:00'
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersEndDate' я ввожу текст '31.12.2021 23:59:59'
		И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
		И я перехожу к закладке с именем "FilterPage"
		И в таблице "SettingsComposerSettingsFilter" я перехожу к строке:
			| 'Вид сравнения' | 'Значение'                     | 'Поле'                         | 'Применение' | 'Режим отображения' |
			| 'Равно'         | 'ru наименование не заполнено' | 'Вид мультивалютной аналитики' | 'Обычное'    | 'Быстрый доступ'    |
		И в таблице "SettingsComposerSettingsFilter" я устанавливаю флаг с именем 'SettingsComposerSettingsFilterUse'
		И в таблице "SettingsComposerSettingsFilter" я завершаю редактирование строки
		И в таблице "SettingsComposerSettings" я перехожу к строке:
			| 'Структура отчета'   |
			| '<Детальные записи>' |
		И я перехожу к закладке с именем "OutputParametersSettingsOff"
		И в таблице "SettingsComposerSettings" я устанавливаю флаг с именем 'SettingsComposerSettingsUse'
		И в таблице "SettingsComposerSettings" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormEndEdit'
		Тогда открылось окно 'D2001 Продажи'
	* Формирование отчета и сравнение с макетом
		И я нажимаю на кнопку с именем 'FormGenerate'
		И я жду когда в табличном документе "Result" заполнится ячейка "R9C1" в течение 10 секунд		
		И Табличный документ "Result" равен макету "МакетПродажи" по шаблону