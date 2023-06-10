# Снизить цены книг, которые стоят больше 400 рублей, на 20%. 
* Вывести автора, название, цену, количество книг, рассчитанную скидку (столбец sale_20) и цену книги со скидкой (price_sale).  
* Результаты округлить до двух знаков после запятой. 
* Для тех книг, на которые скидка не действует, в последних двух столбцах вывести символ  "-".  
* Отсортировать информацию сначала по фамилии автора, а потом по названию книги.

## Структура таблицы:

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_3_Уценка_больше_400/img/cx_5_1.jpg">

## Ответ базы данных должен выглядеть так:

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_1_Простая_выборка_Склад/1_1_3_Уценка_больше_400/img/res.png">

## РЕШЕНИЕ ЗАДАЧИ:

```SQL
SELECT author, title, price, amount,
    CASE
        WHEN price > 400 THEN ROUND((price - (price * 0.80)), 2)
        ELSE '-'    
    END as sale_20,
    CASE
        WHEN price > 400 THEN ROUND((price * 0.80), 2)
        ELSE '-'    
    END as price_sale
FROM book
ORDER BY author, title;
 ```