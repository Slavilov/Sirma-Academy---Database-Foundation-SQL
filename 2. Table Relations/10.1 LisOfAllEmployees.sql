SELECT CONCAT(e.FirstName, N' ', e.LastName) AS FullName,
       e.JobTitle,
       e.Salary
FROM dbo.Employees e
ORDER BY FullName;
