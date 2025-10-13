WITH lines AS (
    SELECT od.OrderID, CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS OrderTotal
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY od.OrderID
)
SELECT  o.OrderID,
        o.OrderDate,
        c.CustomerName,
        s.ShipperName,
        l.OrderTotal
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN Shippers  s ON s.ShipperID  = o.ShipperID
JOIN lines     l ON l.OrderID     = o.OrderID
ORDER BY o.OrderDate, o.OrderID;
