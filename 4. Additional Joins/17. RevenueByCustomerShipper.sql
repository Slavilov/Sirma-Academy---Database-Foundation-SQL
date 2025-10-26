SELECT  c.CustomerName,
        s.ShipperName,
        CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS Revenue
FROM Orders o
JOIN Customers c     ON c.CustomerID = o.CustomerID
JOIN Shippers s      ON s.ShipperID  = o.ShipperID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
GROUP BY c.CustomerName, s.ShipperName
ORDER BY c.CustomerName, Revenue DESC;
