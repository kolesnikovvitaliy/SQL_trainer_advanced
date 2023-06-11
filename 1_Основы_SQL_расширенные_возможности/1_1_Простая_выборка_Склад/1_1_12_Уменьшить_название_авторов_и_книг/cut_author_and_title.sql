SELECT IF(LOCATE(".", author ), SUBSTRING_INDEX(author, " ", 1), SUBSTRING_INDEX(author, " ", -1)) AS Автор, 
IF(CHAR_LENGTH(title) > 15, CONCAT(left(title, 12), '...'), title) AS Книга,
price AS Цена
FROM book
ORDER BY  Книга, Автор;
