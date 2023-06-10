## Вывести фамилию и инициалы соискателей, претендующих на должность, название которой содержит слово "менеджер".
* Для каждого соискателя указать их должность. 
* Информацию отсортировать по фамилиям соискателей в алфавитном порядке.

## Структура таблицы

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_2_Простая_выборка_Резюме/1_2_2_Претенденты_на_должность_менеджер/img/resume.png">

## Ответ базы данных должен выглядеть так:

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_2_Простая_выборка_Резюме/1_2_2_Претенденты_на_должность_менеджер/img/res.png">

## РЕШЕНИЕ ЗАДАЧИ:

```SQL
SELECT DISTINCT applicant, position
FROM resume 
WHERE position LIKE '%менеджер%'
order by applicant;
 ```