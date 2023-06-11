SELECT author, title, amount, price,
CASE
    WHEN amount >= 5 THEN '50%'
    WHEN amount < 5 
    THEN
        CASE 
            WHEN price >= 700 THEN '20%'
            ELSE '10%'
        END
END as Скидка,
CASE
    WHEN amount >= 5 THEN ROUND(price * 0.5, 2)
    WHEN amount < 5
    THEN 
        CASE 
            WHEN price >= 700 THEN ROUND(price * 0.8, 2)
            ELSE ROUND(price * 0.9, 2)
        END
END as Цена_со_скидкой
FROM book
ORDER BY author, Цена_со_скидкой DESC;