SELECT  o.OrderID,
        c.CustomerName,
        CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
        s.ShipperName,
        CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS TotalPrice
FROM Orders o
JOIN Customers c    ON c.CustomerID = o.CustomerID
JOIN Employees e    ON e.EmployeeID = o.EmployeeID
JOIN Shippers s     ON s.ShipperID  = o.ShipperID
JOIN OrderDetails od ON od.OrderID  = o.OrderID
JOIN Products p      ON p.ProductID = od.ProductID
GROUP BY o.OrderID, c.CustomerName, e.FirstName, e.LastName, s.ShipperName
ORDER BY o.OrderID;
