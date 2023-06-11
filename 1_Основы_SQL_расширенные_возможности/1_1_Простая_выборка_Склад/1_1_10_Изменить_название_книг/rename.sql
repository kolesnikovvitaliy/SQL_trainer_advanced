SELECT "Донцова Дарья" AS author,
CONCAT('Евлампия Романова и ', title) AS title, 
ROUND((price * 1.42), 2) as price

FROM book
ORDER BY price DESC;
