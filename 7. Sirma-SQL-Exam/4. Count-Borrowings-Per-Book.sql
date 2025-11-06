SELECT b.Title AS Book,
       COUNT(br.BorrowingID) AS [Count]
FROM Books b
LEFT JOIN Borrowings br ON br.BookID = b.BookID
GROUP BY b.Title
ORDER BY b.Title;
