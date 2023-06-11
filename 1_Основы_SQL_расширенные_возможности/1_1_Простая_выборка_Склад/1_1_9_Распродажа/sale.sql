SELECT
   'Распродажа' AS Категория, title Книга, author Автор, amount Количество,
CASE
    WHEN amount > 0 AND amount <=4 THEN
    ROUND((price/2),2)
END AS Цена
  
FROM book
WHERE amount > 0 AND amount <= 4
ORDER BY Цена DESC, Книга;
