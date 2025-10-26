-- ALTER TABLE Employees ADD Country NVARCHAR(100);  -- if you choose to add it
SELECT  o.OrderID,
        c.CustomerName,
        CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
        c.Country
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN Employees e ON e.EmployeeID = o.EmployeeID
-- WHERE e.Country = c.Country   -- enable after Employees.Country exists/filled
WHERE 1 = 0; -- placeholder to avoid error until Employees.Country exists
