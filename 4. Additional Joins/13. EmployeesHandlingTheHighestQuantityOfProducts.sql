SELECT  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
        SUM(od.Quantity) AS TotalQuantity
FROM Employees e
JOIN Orders o       ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON od.OrderID  = o.OrderID
GROUP BY e.FirstName, e.LastName
ORDER BY TotalQuantity DESC, EmployeeName;
