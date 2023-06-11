## Вывести авторов, названия книг и их цену в двух столбцах - Рубли и Копейки,  для тех книг, количество которых больше 11. 

* Информацию отсортировать по сначала по убыванию рублей, затем убыванию копеек. 
* Получить ЧИСЛОВЫЕ значения рублей и копеек, используя функцию округления в меньшую сторону FLOOR().

## Структура таблицы

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_7_Рубли_копейки_больше_11_шт/img/cx_5_1.jpg">

## Ответ базы данных должен выглядеть так:

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_7_Рубли_копейки_больше_11_шт/img/res.png">

## РЕШЕНИЕ ЗАДАЧИ:

```SQL
SELECT author, title, FLOOR(price) as Рубли,
FLOOR((price - floor(price))*100) as Копейки
FROM book
WHERE amount > 11
ORDER BY Рубли DESC, Копейки DESC;
 ```