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
