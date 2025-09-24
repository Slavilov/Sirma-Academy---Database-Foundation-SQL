-- Drop if re-running
IF OBJECT_ID(N'dbo.Departments', N'U') IS NOT NULL DROP TABLE dbo.Departments;
IF OBJECT_ID(N'dbo.Employees',   N'U') IS NOT NULL DROP TABLE dbo.Employees;
IF OBJECT_ID(N'dbo.Projects',    N'U') IS NOT NULL DROP TABLE dbo.Projects;
GO

-- Departments
CREATE TABLE dbo.Departments
(
    DepartmentID   INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL UNIQUE,
    ManagerID      INT NULL   -- FK to Employees (added after Employees exists)
);

-- Employees
CREATE TABLE dbo.Employees
(
    EmployeeID   INT IDENTITY(1,1) PRIMARY KEY,
    FirstName    NVARCHAR(50)  NOT NULL,
    LastName     NVARCHAR(50)  NOT NULL,
    JobTitle     NVARCHAR(100) NOT NULL,
    Email        NVARCHAR(255) NOT NULL UNIQUE,
    Salary       DECIMAL(12,2) NOT NULL CONSTRAINT DF_Employees_Salary DEFAULT (0),
    DepartmentID INT NULL,  -- FK to Departments (1-to-many)
    ManagerID    INT NULL   -- self-reference
);

-- Projects
CREATE TABLE dbo.Projects
(
    ProjectID   INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName NVARCHAR(150) NOT NULL UNIQUE,
    Description NVARCHAR(1000) NULL,
    Deadline    DATE NULL
);
GO
