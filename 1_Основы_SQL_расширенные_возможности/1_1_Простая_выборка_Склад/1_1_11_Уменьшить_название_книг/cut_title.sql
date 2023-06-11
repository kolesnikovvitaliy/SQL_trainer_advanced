SELECT author as Автор, 
IF(CHAR_LENGTH(title) > 15, CONCAT(left(title, 12), '...'), title) AS Книга,
price AS Цена
FROM book
ORDER BY  Книга, author;
