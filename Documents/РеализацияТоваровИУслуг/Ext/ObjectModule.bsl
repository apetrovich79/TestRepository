﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	Движения.ТоварыНаСкладах.Записывать = Истина;
	Движения.ЗаказыКлиентов.Записывать = Истина; 
	Движения.Продажи.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл  
		
		Движение = Движения.ТоварыНаСкладах.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Склад = ТекСтрокаТовары.Склад;
		Движение.Количество = ТекСтрокаТовары.Количество; 
		
		Движение = Движения.Продажи.Добавить();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Сотрудник = Сотрудник;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
		Движение.Количество = ТекСтрокаТовары.Количество;

	КонецЦикла;
	Для Каждого ТекСтрокаУслуги Из Услуги Цикл  
		
		Движение = Движения.ЗаказыКлиентов.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Клиент = Клиент;
		Движение.ДатаЗаписи = ДатаОказанияУслуги;
		Движение.Количество = ТекСтрокаУслуги.Количество;
		Движение.Сумма = ТекСтрокаУслуги.Сумма;   
		
		Движение = Движения.Продажи.Добавить();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаУслуги.Номенклатура;
		Движение.Сотрудник = Сотрудник;
		Движение.Сумма = ТекСтрокаУслуги.Сумма;
		Движение.Количество = ТекСтрокаУслуги.Количество;

	КонецЦикла;
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаписьКлиента") Тогда
		// Заполнение шапки 
		ДокументОснование = ДанныеЗаполнения;
		АвторДокумента = ДанныеЗаполнения.АвторДокумента;
		ДатаОказанияУслуги = ДанныеЗаполнения.ДатаЗаписи;
		Клиент = ДанныеЗаполнения.Клиент;
		Комментарий = ДанныеЗаполнения.Комментарий;
		Сотрудник = ДанныеЗаполнения.Сотрудник;
		Для Каждого ТекСтрокаУслуги Из ДанныеЗаполнения.Услуги Цикл
			НоваяСтрока = Услуги.Добавить();
			НоваяСтрока.Количество = ТекСтрокаУслуги.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаУслуги.Номенклатура;
			НоваяСтрока.Сумма = ТекСтрокаУслуги.Сумма;
			НоваяСтрока.Цена = ТекСтрокаУслуги.Цена;
		КонецЦикла;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения) 
 		
	
КонецПроцедуры   
		
