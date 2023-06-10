## Вывести фамилию и инициалы соискателей, претендующих на должность, название которой заканчивается на русскую букву "р". 
* Для каждого соискателя указать их должность и дату рождения. 
* Информацию отсортировать сначала по должности в алфавитном порядке, затем по возрастанию даты рождения.



## Структура таблицы

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_2_Простая_выборка_Резюме/1_2_3_Русская_буква_р_в_названиии/img/resume.png">

## Ответ базы данных должен выглядеть так:

<img align="center" alt="sumit" src="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/blob/main/1_Основы_SQL_расширенные_возможности/1_2_Простая_выборка_Резюме/1_2_3_Русская_буква_р_в_названиии/img/res.png">

## РЕШЕНИЕ ЗАДАЧИ:

```SQL
SELECT DISTINCT applicant, position, date_birth
FROM resume 
WHERE position LIKE '%р'
order by position, date_birth asc;
 ```