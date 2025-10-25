SELECT  p.ProductName,
        COUNT(DISTINCT o.CustomerID) AS UniqueCustomers
FROM OrderDetails od
JOIN Products p ON p.ProductID = od.ProductID
JOIN Orders o   ON o.OrderID   = od.OrderID
GROUP BY p.ProductName
ORDER BY UniqueCustomers DESC, p.ProductName;
