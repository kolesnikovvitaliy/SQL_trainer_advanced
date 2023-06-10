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