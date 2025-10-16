SELECT  cat.CategoryID,
        cat.CategoryName,
        CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS CategoryRevenue
FROM OrderDetails od
JOIN Products p   ON p.ProductID = od.ProductID
JOIN Categories cat ON cat.CategoryID = p.CategoryID
GROUP BY cat.CategoryID, cat.CategoryName
ORDER BY CategoryRevenue DESC;
