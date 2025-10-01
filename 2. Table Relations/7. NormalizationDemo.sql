-- Denormalized input
IF OBJECT_ID(N'dbo.DenormEmpProjects', N'U') IS NOT NULL DROP TABLE dbo.DenormEmpProjects;
CREATE TABLE dbo.DenormEmpProjects
(
    EmployeeID    INT NOT NULL,
    EmployeeName  NVARCHAR(200) NOT NULL,
    ProjectName   NVARCHAR(150) NOT NULL
);

INSERT INTO dbo.DenormEmpProjects (EmployeeID, EmployeeName, ProjectName) VALUES
(1, N'Alice Brown', N'Project Alpha'),
(2, N'Bob Smith',   N'Project Beta'),
(1, N'Alice Brown', N'Project Beta');

-- 3NF schema
IF OBJECT_ID(N'dbo.N_EmployeeProjects', N'U') IS NOT NULL DROP TABLE dbo.N_EmployeeProjects;
IF OBJECT_ID(N'dbo.N_Employees',        N'U') IS NOT NULL DROP TABLE dbo.N_Employees;
IF OBJECT_ID(N'dbo.N_Projects',         N'U') IS NOT NULL DROP TABLE dbo.N_Projects;

CREATE TABLE dbo.N_Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName  NVARCHAR(50) NOT NULL,
    LastName   NVARCHAR(50) NOT NULL
);

CREATE TABLE dbo.N_Projects
(
    ProjectID   INT PRIMARY KEY,
    ProjectName NVARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE dbo.N_EmployeeProjects
(
    EmployeeID INT NOT NULL,
    ProjectID  INT NOT NULL,
    CONSTRAINT PK_N_EmployeeProjects PRIMARY KEY (EmployeeID, ProjectID),
    CONSTRAINT FK_N_Emp  FOREIGN KEY (EmployeeID) REFERENCES dbo.N_Employees(EmployeeID),
    CONSTRAINT FK_N_Proj FOREIGN KEY (ProjectID)  REFERENCES dbo.N_Projects(ProjectID)
);

-- Sample normalized data
INSERT INTO dbo.N_Employees (EmployeeID, FirstName, LastName) VALUES
(1, N'Alice', N'Brown'), (2, N'Bob', N'Smith');

INSERT INTO dbo.N_Projects (ProjectID, ProjectName) VALUES
(10, N'Project Alpha'), (20, N'Project Beta');

INSERT INTO dbo.N_EmployeeProjects (EmployeeID, ProjectID) VALUES
(1,10), (2,20), (1,20);
