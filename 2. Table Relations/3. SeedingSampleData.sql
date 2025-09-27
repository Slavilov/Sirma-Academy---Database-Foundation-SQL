-- Departments
INSERT INTO dbo.Departments (DepartmentName) VALUES
(N'Engineering'), (N'Operations'), (N'HR'), (N'Sales');

-- Employees (insert first; set ManagerID in a second step)
INSERT INTO dbo.Employees (FirstName, LastName, JobTitle, Email, Salary, DepartmentID, ManagerID) VALUES
(N'Alice',  N'Brown',   N'Senior Developer',   N'alice.brown@corp.test',  95000, 1, NULL),
(N'Bob',    N'Smith',   N'DevOps Engineer',    N'bob.smith@corp.test',    88000, 2, NULL),
(N'Carol',  N'Jones',   N'HR Specialist',      N'carol.jones@corp.test',  62000, 3, NULL),
(N'Daniel', N'Clark',   N'Account Executive',  N'daniel.clark@corp.test', 70000, 4, NULL),
(N'Eve',    N'Lopez',   N'Engineering Manager',N'eve.lopez@corp.test',   110000, 1, NULL),
(N'Frank',  N'Wright',  N'Junior Developer',   N'frank.wright@corp.test', 60000, 1, NULL),
(N'Grace',  N'Kim',     N'Operations Manager', N'grace.kim@corp.test',   105000, 2, NULL),
(N'Henry',  N'Adams',   N'Sales Manager',      N'henry.adams@corp.test',   99000, 4, NULL);

-- Set Employee.ManagerID
UPDATE dbo.Employees
SET ManagerID = (SELECT EmployeeID FROM dbo.Employees WHERE FirstName=N'Eve' AND LastName=N'Lopez')
WHERE (FirstName=N'Alice' OR FirstName=N'Frank') AND DepartmentID=1;

UPDATE dbo.Employees
SET ManagerID = (SELECT EmployeeID FROM dbo.Employees WHERE FirstName=N'Grace' AND LastName=N'Kim')
WHERE DepartmentID=2;

UPDATE dbo.Employees SET ManagerID = NULL WHERE DepartmentID=3;  -- HR sample: no manager set
UPDATE dbo.Employees
SET ManagerID = (SELECT EmployeeID FROM dbo.Employees WHERE FirstName=N'Henry' AND LastName=N'Adams')
WHERE DepartmentID=4;

-- Assign Department.ManagerID
UPDATE dbo.Departments SET ManagerID = (SELECT EmployeeID FROM dbo.Employees WHERE FirstName=N'Eve'   AND LastName=N'Lopez') WHERE DepartmentName=N'Engineering';
UPDATE dbo.Departments SET ManagerID = (SELECT EmployeeID FROM dbo.Employees WHERE FirstName=N'Grace' AND LastName=N'Kim')   WHERE DepartmentName=N'Operations';
UPDATE dbo.Departments SET ManagerID = (SELECT EmployeeID FROM dbo.Employees WHERE FirstName=N'Carol' AND LastName=N'Jones') WHERE DepartmentName=N'HR';
UPDATE dbo.Departments SET ManagerID = (SELECT EmployeeID FROM dbo.Employees WHERE FirstName=N'Henry' AND LastName=N'Adams') WHERE DepartmentName=N'Sales';

-- Projects
INSERT INTO dbo.Projects (ProjectName, Description, Deadline) VALUES
(N'Project Alpha', N'Greenfield platform build',    '2026-03-31'),
(N'Project Beta',  N'Data pipeline modernization',  '2026-06-30'),
(N'Project Gamma', N'Mobile app redesign',          '2026-09-30');

-- EmployeeProjects assignments
INSERT INTO dbo.EmployeeProjects (EmployeeID, ProjectID, Role)
SELECT e.EmployeeID, p.ProjectID, N'Lead'
FROM dbo.Employees e
JOIN dbo.Projects  p ON p.ProjectName = N'Project Alpha'
WHERE e.FirstName=N'Eve' AND e.LastName=N'Lopez';

INSERT INTO dbo.EmployeeProjects (EmployeeID, ProjectID, Role)
SELECT e.EmployeeID, p.ProjectID, N'Developer'
FROM dbo.Employees e
JOIN dbo.Projects  p ON p.ProjectName = N'Project Alpha'
WHERE e.FirstName IN (N'Alice', N'Frank') AND e.DepartmentID=1;

INSERT INTO dbo.EmployeeProjects (EmployeeID, ProjectID, Role)
SELECT e.EmployeeID, p.ProjectID, N'DevOps'
FROM dbo.Employees e
JOIN dbo.Projects  p ON p.ProjectName = N'Project Beta'
WHERE e.FirstName=N'Bob' AND e.LastName=N'Smith';

INSERT INTO dbo.EmployeeProjects (EmployeeID, ProjectID, Role)
SELECT e.EmployeeID, p.ProjectID, N'QA'
FROM dbo.Employees e
JOIN dbo.Projects  p ON p.ProjectName = N'Project Gamma'
WHERE e.FirstName=N'Carol' AND e.LastName=N'Jones';
