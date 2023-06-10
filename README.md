# Прошел курсы повышения квалификации
## В Дальневосточном федеральном университете:
* по специальности "Специалист-SQL"
* в репозитории "education_certificates" расположенно свидетельство о повышении квалификации
#

# Конспект:
##  Курс Расширенные возможности: SQL на Stepik  
### В этом репозитории я документирую этапы прохождения кура и решаемые мной задачи.
## Курс состоит из трех разделов:
1. <a href="https://github.com/kolesnikovvitaliy/SQL_trainer_advanced/tree/main/1_Основы_SQL_расширенные_возможности">Основы SQL, расширенные возможности</a>
2. <a href="#">Запросы SQL к связанным таблицам</a>
3. <a href="#">Расширенные возможности SQL</a>
#
#### Для скачивания репозитория вам потребуется:
1. Создать каталог для скачивания:
   ```bash
   mkdir course_sql
    ```
2. Перейти в каталог course_sql:
   ```bash
   cd course_sql
    ```
3. Клонировать репозиторий себе на локальный компьютер:
   ```bash
   git clone https://github.com/kolesnikovvitaliy/SQL_trainer_advanced.git
    ```
4. Перейти в каталог SQL_trainer_advanced:
   ```bash
   cd SQL_trainer_advanced
    ```
Репозиторий в стадии наполнения

# ПРИМЕРЫ РЕШЕННЫХ ЗАДАЧЬ:
* Отменить или перенести заказ в соответсвии с датой изменения условий выполнения услуг
```SQL
WITH
get_first_date(service_booking_id, first_date)
AS(
SELECT service_booking_id,
CASE
    WHEN WEEKDAY(service_start_date) = 1 THEN service_start_date
    WHEN WEEKDAY(service_start_date) = 0 THEN date_add(service_start_date, interval (WEEKDAY(service_start_date)+1) DAY)
    WHEN WEEKDAY(service_start_date) > 0 THEN date_sub(service_start_date, interval (WEEKDAY(service_start_date)-1) DAY)
END as first_date
FROM service_booking
),
get_second_date(service_booking_id, second_date)
AS(
SELECT service_booking_id, (date_add(first_date, interval 7 DAY)) as second_date
FROM service_booking
JOIN get_first_date USING(service_booking_id)
),
get_end_date(service_booking_id, new_date)
AS(
       SELECT service_booking_id,
CASE 
    WHEN (first_date between check_in_date and check_out_date) and (second_date between check_in_date and check_out_date) 
        THEN IF(DATEDIFF(service_start_date,first_date) < DATEDIFF(second_date,service_start_date),first_date,second_date) 
    WHEN second_date between check_in_date and check_out_date
        THEN second_date
    WHEN first_date between check_in_date and check_out_date
        THEN first_date
    ELSE "-"
END as new_date
from service_booking
JOIN get_first_date USING (service_booking_id)
JOIN get_second_date USING(service_booking_id)
JOIN room_booking USING (room_booking_id)
)
SELECT room_name as Номер, guest_name as Гость, service_start_date as Старая_дата, new_date as Новая_дата,
CASE 
    WHEN service_start_date != new_date THEN "Перенести"
    WHEN new_date = "-" THEN "Отменить"
    ELSE service_start_date
END as Действие
from room_booking
JOIN service_booking USING(room_booking_id)
JOIN get_end_date USING(service_booking_id)
JOIN room USING (room_id)
JOIN guest USING (guest_id)
JOIN service USING (service_id)
WHERE service_id = 5 AND status_id = 1

ORDER BY 5 DESC, 4, 1
LIMIT 10
 ```
 * Итоговый счет клиенту при выселении из гостинници, с учетом всех услуг и расходов
  ```SQL
  WITH get_result_concat_1(room_booking_id, result_room, result_room_price)
AS(
   SELECT room_booking_id, CONCAT(type_room_name, " ", room_name, " " ,check_in_date, "/", check_out_date) as result_room,
((DATEDIFF(check_out_date, check_in_date)+1)*price) as result_price
from room_booking
JOIN room USING (room_id)
JOIN type_room USING(type_room_id)
WHERE guest_id = 10 and  check_in_date = '2020-11-04'
),
get_result_concat_2(result_service, result_service_price)
AS(
   SELECT CONCAT(service_name, " ", GROUP_CONCAT(service_start_date ORDER BY 1 separator ',' )) as result_service ,  sum(price) as result_service_price
FROM service_booking
JOIN service USING(service_id)
WHERE room_booking_id = (select room_booking_id from get_result_concat_1)
GROUP BY service_name
),
concat_all(result_all, result_all_price)
AS(
    SELECT result_room, result_room_price
FROM get_result_concat_1
UNION
SELECT result_service, result_service_price
FROM get_result_concat_2
)
SELECT result_all as Вид_платежа, result_all_price as Сумма
FROM concat_all 
UNION
SELECT "Итого", sum(result_all_price)
FROM concat_all
   ```
* Создать таблицу и чек с депозитом, внесенным клиентом на счет гостиници и результатом "Доплатить" или "Вернуть " при выселении.
```SQL
CREATE TABLE bill AS
WITH get_id (_id)
AS(
    SELECT room_booking_id 
FROM room_booking
JOIN guest USING (guest_id)
JOIN room USING (room_id)
WHERE guest_name = 'Астахов И.И.' and room_name = 'С-0206' and check_in_date = '2021-01-13'
),
get_service_id (s_id, price)
AS(
    SELECT CONCAT(service_name, ' ', GROUP_CONCAT(service_start_date ORDER BY service_start_date)),
    sum(price)
    FROM service_booking
    JOIN service USING (service_id)
     WHERE room_booking_id=(select _id from get_id)
    GROUP BY service_id
    ORDER BY 1
)
SELECT 
   GROUP_CONCAT(guest_name,' ',room_name,' ',check_in_date,'/', check_out_date) AS Вид_платежа,
   15000.00 AS Сумма
FROM room_booking
JOIN guest USING (guest_id)
JOIN room USING (room_id)
WHERE room_booking_id=(select _id from get_id)
UNION
SELECT *
FROM get_service_id
UNION
SELECT 
   CASE 
   WHEN sum(price) > 15000.00 THEN 'Доплатить'
   WHEN sum(price) < 15000.00 THEN 'Вернуть'
   ELSE 'Итого'
   END,sum(price)-15000.00
   FROM get_service_id
  ```