SELECT o.Country,
       SUM(e.Salary) AS TotalSalaries
FROM dbo.Employees e
JOIN dbo.Offices   o ON o.OfficeID = e.OfficeID
GROUP BY o.Country
ORDER BY TotalSalaries DESC;
