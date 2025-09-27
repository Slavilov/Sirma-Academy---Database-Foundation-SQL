DECLARE @Department NVARCHAR(100) = N'Engineering';

SELECT DISTINCT
       d.DepartmentName,
       e.EmployeeID,
       e.FirstName,
       e.LastName,
       p.ProjectName,
       ep.Role
FROM dbo.Departments d
JOIN dbo.Employees   e  ON e.DepartmentID = d.DepartmentID
JOIN dbo.EmployeeProjects ep ON ep.EmployeeID = e.EmployeeID
JOIN dbo.Projects    p  ON p.ProjectID = ep.ProjectID
WHERE d.DepartmentName = @Department
ORDER BY e.LastName, e.FirstName, p.ProjectName;
