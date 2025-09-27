DECLARE @Project NVARCHAR(150) = N'Project Alpha';

SELECT  p.ProjectName,
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.JobTitle,
        ep.Role,
        ep.AssignedAt
FROM dbo.EmployeeProjects ep
JOIN dbo.Employees e ON e.EmployeeID = ep.EmployeeID
JOIN dbo.Projects  p ON p.ProjectID  = ep.ProjectID
WHERE p.ProjectName = @Project
ORDER BY e.LastName, e.FirstName;
