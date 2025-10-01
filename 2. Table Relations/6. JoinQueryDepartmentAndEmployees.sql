SELECT d.DepartmentName,
       e.EmployeeID,
       e.FirstName,
       e.LastName
FROM dbo.Departments d
LEFT JOIN dbo.Employees e ON e.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName, e.LastName, e.FirstName;
