-- Employees -> Departments (1-to-many) with cascades
ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Employees_Departments
FOREIGN KEY (DepartmentID) REFERENCES dbo.Departments(DepartmentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Employees -> Employees (self FK for Manager)
ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Employees_Manager
FOREIGN KEY (ManagerID) REFERENCES dbo.Employees(EmployeeID);

-- Bridge table for Employees <-> Projects (many-to-many)
IF OBJECT_ID(N'dbo.EmployeeProjects', N'U') IS NOT NULL DROP TABLE dbo.EmployeeProjects;
GO
CREATE TABLE dbo.EmployeeProjects
(
    EmployeeID INT NOT NULL,
    ProjectID  INT NOT NULL,
    AssignedAt DATETIME2 NOT NULL CONSTRAINT DF_EmpProj_AssignedAt DEFAULT (SYSUTCDATETIME()),
    Role       NVARCHAR(100) NULL,
    CONSTRAINT PK_EmployeeProjects PRIMARY KEY (EmployeeID, ProjectID),
    CONSTRAINT FK_EmpProj_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_EmpProj_Project  FOREIGN KEY (ProjectID)  REFERENCES dbo.Projects(ProjectID)  ON DELETE CASCADE ON UPDATE CASCADE
);

-- After Employees exists, wire Departments.ManagerID to Employees
ALTER TABLE dbo.Departments
ADD CONSTRAINT FK_Departments_Manager
FOREIGN KEY (ManagerID) REFERENCES dbo.Employees(EmployeeID);
GO
