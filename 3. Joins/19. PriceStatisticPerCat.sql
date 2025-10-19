SELECT  cat.CategoryName,
        COUNT(*) AS ProductsCount,
        MIN(p.Price) AS MinPrice,
        AVG(p.Price) AS AvgPrice,
        MAX(p.Price) AS MaxPrice
FROM Products p
JOIN Categories cat ON cat.CategoryID = p.CategoryID
GROUP BY cat.CategoryName
ORDER BY cat.CategoryName;
