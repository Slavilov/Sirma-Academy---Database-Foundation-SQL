SELECT CONCAT(e.FirstName, N' ', e.LastName) AS FullName,
       e.JobTitle,
       o.Country
FROM dbo.Employees e
JOIN dbo.Offices   o ON o.OfficeID = e.OfficeID
WHERE o.Country = N'Bulgaria'
ORDER BY FullName;
