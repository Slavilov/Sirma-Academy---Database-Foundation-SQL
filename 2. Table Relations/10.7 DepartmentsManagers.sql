SELECT d.DepartmentName,
       CONCAT(m.FirstName, N' ', m.LastName) AS ManagerName
FROM dbo.Departments d
LEFT JOIN dbo.Employees m ON m.EmployeeID = d.ManagerID
ORDER BY d.DepartmentName;
