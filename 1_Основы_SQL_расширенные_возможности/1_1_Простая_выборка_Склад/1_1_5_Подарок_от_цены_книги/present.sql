SELECT author, title, price,

CASE
    WHEN price >= 500 AND price <= 600 THEN 'ручка'
    WHEN price > 600 AND price <= 700 THEN 'детская раскраска'
    WHEN price > 700 THEN 'гороскоп' 
END AS Подарок
FROM book
WHERE price >= 500
ORDER BY author, title;