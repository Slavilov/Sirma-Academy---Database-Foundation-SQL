SELECT  s.ShipperName,
        p.ProductName,
        SUM(od.Quantity) AS TotalQty
FROM Orders o
JOIN Shippers s      ON s.ShipperID  = o.ShipperID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
JOIN Categories cat  ON cat.CategoryID = p.CategoryID
WHERE cat.CategoryName = N'Beverages'
GROUP BY s.ShipperName, p.ProductName
ORDER BY s.ShipperName, p.ProductName;
