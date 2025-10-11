SELECT d.DepartmentName,
       AVG(e.Salary) AS AvgSalary
FROM dbo.Departments d
JOIN dbo.Employees   e ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AvgSalary DESC;
