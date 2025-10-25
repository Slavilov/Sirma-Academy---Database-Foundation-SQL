SELECT  c.CustomerName,
        cat.CategoryName,
        CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS AmountSpent
FROM Orders o
JOIN Customers c     ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
JOIN Categories cat  ON cat.CategoryID = p.CategoryID
GROUP BY c.CustomerName, cat.CategoryName
ORDER BY c.CustomerName, AmountSpent DESC;
