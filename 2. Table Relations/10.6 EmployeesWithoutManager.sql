SELECT CONCAT(e.FirstName, N' ', e.LastName) AS FullName,
       e.JobTitle
FROM dbo.Employees e
WHERE e.ManagerID IS NULL
ORDER BY FullName;
