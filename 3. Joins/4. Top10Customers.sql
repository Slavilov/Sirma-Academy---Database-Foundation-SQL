WITH order_totals AS (
    SELECT od.OrderID, SUM(od.Quantity * p.Price) AS order_total
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY od.OrderID
)
SELECT TOP (10)
       c.CustomerID,
        c.CustomerName,
        SUM(ot.order_total) AS TotalRevenue
FROM Orders o
JOIN order_totals ot ON ot.OrderID = o.OrderID
JOIN Customers c     ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalRevenue DESC, c.CustomerName;
