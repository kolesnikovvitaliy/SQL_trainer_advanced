SELECT author, title, FLOOR(price) as Рубли,
FLOOR((price - floor(price))*100) as Копейки
FROM book
WHERE amount > 11
ORDER BY Рубли DESC, Копейки DESC;
