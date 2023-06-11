## Вывести название книги и ее автора, упорядоченные сначала по возрастанию длины названия книги, затем по фамилии автора в алфавитном порядке.

* Также указать фактическую длину названия книги.
* Последний столбец назвать Длина.

## Структура таблицы

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_8_Сортировать_по_длине_названия_книг/img/cx_5_1.jpg">

## Ответ базы данных должен выглядеть так:

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_8_Сортировать_по_длине_названия_книг/img/res.png">

## РЕШЕНИЕ ЗАДАЧИ:

```SQL
SELECT title, author,
CHAR_LENGTH(title) as Длина
FROM book
ORDER BY Длина, author;
 ```