SELECT  sup.SupplierName,
        CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
        CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS Revenue
FROM Orders o
JOIN Employees e     ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
JOIN Suppliers sup   ON sup.SupplierID = p.SupplierID
GROUP BY sup.SupplierName, e.FirstName, e.LastName
ORDER BY sup.SupplierName, Revenue DESC;
