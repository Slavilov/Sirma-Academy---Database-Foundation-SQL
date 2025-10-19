SELECT TOP (5)
       c.Country,
       CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS Revenue
FROM Orders o
JOIN Customers c   ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON od.OrderID = o.OrderID
JOIN Products p     ON p.ProductID = od.ProductID
GROUP BY c.Country
ORDER BY Revenue DESC;
