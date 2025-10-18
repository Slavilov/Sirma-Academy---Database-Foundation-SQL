SELECT  s.ShipperID,
        s.ShipperName,
        COUNT(*) AS OrdersShipped
FROM Orders o
JOIN Shippers s ON s.ShipperID = o.ShipperID
GROUP BY s.ShipperID, s.ShipperName
ORDER BY OrdersShipped DESC, s.ShipperName;
