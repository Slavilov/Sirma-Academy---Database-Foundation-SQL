SELECT  CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName
FROM Orders o
JOIN Employees e     ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
GROUP BY e.FirstName, e.LastName
HAVING COUNT(DISTINCT p.CategoryID) > 2
ORDER BY EmployeeName;
