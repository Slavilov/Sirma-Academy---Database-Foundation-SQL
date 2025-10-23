SELECT  o.OrderID,
        c.CustomerName,
        CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
        COUNT(DISTINCT p.CategoryID) AS DistinctCategories
FROM Orders o
JOIN Customers c     ON c.CustomerID = o.CustomerID
JOIN Employees e     ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
GROUP BY o.OrderID, c.CustomerName, e.FirstName, e.LastName
ORDER BY DistinctCategories DESC, o.OrderID;
