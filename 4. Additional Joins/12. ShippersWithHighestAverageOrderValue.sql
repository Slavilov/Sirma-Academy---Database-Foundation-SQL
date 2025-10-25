WITH ot AS (
    SELECT od.OrderID, SUM(od.Quantity * p.Price) AS OrderTotal
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY od.OrderID
)
SELECT  s.ShipperName,
        CAST(AVG(ot.OrderTotal) AS DECIMAL(18,2)) AS AvgOrderValue
FROM Orders o
JOIN Shippers s ON s.ShipperID = o.ShipperID
JOIN ot         ON ot.OrderID   = o.OrderID
GROUP BY s.ShipperName
ORDER BY AvgOrderValue DESC;
