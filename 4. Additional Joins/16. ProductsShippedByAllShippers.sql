WITH prod_ship AS (
    SELECT p.ProductID, COUNT(DISTINCT o.ShipperID) AS ShipperCount
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    JOIN Orders o   ON o.OrderID   = od.OrderID
    GROUP BY p.ProductID
),
tot AS (SELECT COUNT(*) AS TotalShippers FROM Shippers)
SELECT p.ProductName
FROM prod_ship ps
CROSS JOIN tot
JOIN Products p ON p.ProductID = ps.ProductID
WHERE ps.ShipperCount = tot.TotalShippers
ORDER BY p.ProductName;
