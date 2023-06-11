## К информации о книге добавить столбец "категория цены" : 

* если цена меньше 250 - вывести  "низкая";
* если цена в интервале от 250 до 600 включительно - вывести "средняя";
* более 600 - вывести "высокая".
* Вывести автора, название, категорию, стоимость (цена * количество).
* Последние два столбца назватьprice_category и cost . 
* Из выборки исключить книги автора Агату Кристи, а также книги, имеющие названия "Поэмы" и "Стихи".
* Отсортировать сначала по убыванию стоимости, а затем по названию в алфавитном порядке.

## Структура таблицы

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_6_Категория_цены/img/cx_5_1.jpg">

## Ответ базы данных должен выглядеть так:

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_6_Категория_цены/img/res.png">

## РЕШЕНИЕ ЗАДАЧИ:

```SQL
SELECT author, title,
CASE
    WHEN price < 250 THEN 'низкая'
    WHEN price >= 250 AND price <= 600 THEN 'средняя'
    WHEN price > 600 THEN 'высокая' 
END AS price_category,
CASE 
    WHEN price THEN price*amount
END AS cost
FROM book
WHERE author not Like 'Агата Кристи' AND title NOT IN ('Поэмы', 'Стихи')
ORDER BY cost DESC, title;
 ```