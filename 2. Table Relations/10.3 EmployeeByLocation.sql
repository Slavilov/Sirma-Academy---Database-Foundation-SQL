SELECT CONCAT(e.FirstName, N' ', e.LastName) AS FullName,
       e.JobTitle,
       o.OfficeName
FROM dbo.Employees e
JOIN dbo.Offices   o ON o.OfficeID = e.OfficeID
WHERE o.OfficeName = N'UK Branch'
ORDER BY FullName;
