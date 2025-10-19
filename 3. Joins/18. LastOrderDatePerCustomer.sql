SELECT  c.CustomerID,
        c.CustomerName,
        MAX(o.OrderDate) AS LastOrderDate
FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY LastOrderDate DESC NULLS LAST, c.CustomerName;
