SELECT  e.EmployeeID,
        CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
        COUNT(o.OrderID) AS OrdersHandled,
        MIN(o.OrderDate) AS FirstOrderDate,
        MAX(o.OrderDate) AS LastOrderDate
FROM Employees e
LEFT JOIN Orders o ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY OrdersHandled DESC, EmployeeName;
