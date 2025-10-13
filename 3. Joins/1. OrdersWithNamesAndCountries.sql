SELECT o.OrderID, o.OrderDate, c.CustomerName, c.Country
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;
