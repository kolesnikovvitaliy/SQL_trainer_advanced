SELECT author as Автор, title as Книга, amount as Количество,
    CASE 
        WHEN amount >= 10 THEN 15
        ELSE 0
    END as Скидка,
    CASE 
        WHEN amount >= 10 THEN ROUND(price * 0.85, 2) 
        ELSE price
    END as Новая_цена
FROM book
ORDER BY Автор, Книга;