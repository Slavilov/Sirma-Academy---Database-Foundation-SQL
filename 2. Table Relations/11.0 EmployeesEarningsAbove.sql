WITH avg_cte AS (SELECT AVG(Salary) AS avg_salary FROM dbo.Employees)
SELECT CONCAT(e.FirstName, N' ', e.LastName) AS FullName,
       e.JobTitle,
       e.Salary
FROM dbo.Employees e
CROSS JOIN avg_cte a
WHERE e.Salary > a.avg_salary
ORDER BY e.Salary DESC;
