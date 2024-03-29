﻿#language: ru

@tree

Функционал: <описание фичи>

Как Менеджер я хочу
создать документ Заказ
чтобы проверить правильность внесения суммы  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: <описание сценария>
//создание
* Открытие формы создание документа
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
Тогда открылось окно 'Заказы товаров'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Заказ (создание)'
И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
И я перехожу к следующему реквизиту
И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения таблицы
Тогда таблица "Товары" содержит строки:
| 'Товар'       | 'Цена' | | 'Количество'  | 'Сумма' |
	| 'Торт' | '*'  || '*'       | '*' |
	И я нажимаю на кнопку "Записать"
	* Номер
	И я запоминаю значение поля с именем "Номер" как "$Номер$"
	* Проведение документа
	И я нажимаю на кнопку с именем "ФормаПровестиИЗакрыть"
И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'|