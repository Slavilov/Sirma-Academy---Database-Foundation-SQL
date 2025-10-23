WITH avgp AS (SELECT AVG(Price) AS avg_price FROM Products)
SELECT DISTINCT
       c.CustomerName, o.OrderID, p.ProductName
FROM Orders o
JOIN Customers c     ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
CROSS JOIN avgp
WHERE p.Price > avgp.avg_price
ORDER BY c.CustomerName, o.OrderID;
