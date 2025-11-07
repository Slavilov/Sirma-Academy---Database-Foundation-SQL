SELECT a.Name AS Author
FROM Authors a
LEFT JOIN Books b ON b.AuthorID = a.AuthorID
WHERE b.AuthorID IS NULL
ORDER BY a.Name;
