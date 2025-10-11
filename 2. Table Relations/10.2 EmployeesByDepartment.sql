SELECT CONCAT(e.FirstName, N' ', e.LastName) AS FullName,
       d.DepartmentName
FROM dbo.Employees e
LEFT JOIN dbo.Departments d ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, FullName;
