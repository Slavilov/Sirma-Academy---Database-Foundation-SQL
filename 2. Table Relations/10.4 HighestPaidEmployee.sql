SELECT TOP (1) WITH TIES
       CONCAT(e.FirstName, N' ', e.LastName) AS FullName,
       e.JobTitle,
       e.Salary
FROM dbo.Employees e
ORDER BY e.Salary DESC;
