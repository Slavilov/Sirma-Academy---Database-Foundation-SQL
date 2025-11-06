SELECT b.Title,
       a.Name   AS Author,
       a.Country
FROM Books b
JOIN Authors a ON a.AuthorID = b.AuthorID
ORDER BY b.Title;
