SELECT title, author,
CHAR_LENGTH(title) as Длина
FROM book
ORDER BY Длина, author;
