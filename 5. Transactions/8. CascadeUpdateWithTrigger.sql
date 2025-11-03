-- Setup demo tables
IF OBJECT_ID('dbo.Departments_Cascade','U') IS NOT NULL DROP TABLE dbo.Departments_Cascade;
CREATE TABLE dbo.Departments_Cascade (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

IF OBJECT_ID('dbo.Employees_Cascade','U') IS NOT NULL DROP TABLE dbo.Employees_Cascade;
CREATE TABLE dbo.Employees_Cascade (
    EmployeeID     INT PRIMARY KEY,
    Name           NVARCHAR(50),
    DepartmentID   INT,
    DepartmentName NVARCHAR(50)
);

INSERT INTO dbo.Departments_Cascade (DepartmentID, DepartmentName) VALUES
(1, N'Engineering'),
(2, N'Sales');

INSERT INTO dbo.Employees_Cascade (EmployeeID, Name, DepartmentID, DepartmentName) VALUES
(1, N'Alice', 1, N'Engineering'),
(2, N'Bob',   1, N'Engineering'),
(3, N'Carol', 2, N'Sales');

-- AFTER UPDATE trigger on Departments_Cascade
IF OBJECT_ID('dbo.trg_Departments_Cascade_AfterUpdate','TR') IS NOT NULL
    DROP TRIGGER dbo.trg_Departments_Cascade_AfterUpdate;
GO

CREATE TRIGGER dbo.trg_Departments_Cascade_AfterUpdate
ON dbo.Departments_Cascade
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- For every changed row, sync Employees_Cascade.DepartmentName
    UPDATE e
    SET e.DepartmentName = i.DepartmentName
    FROM dbo.Employees_Cascade e
    JOIN inserted i ON i.DepartmentID = e.DepartmentID;
END;
GO

-- Test: rename "Engineering" -> "Platform Engineering"
UPDATE dbo.Departments_Cascade
SET DepartmentName = N'Platform Engineering'
WHERE DepartmentID = 1;

SELECT * FROM dbo.Departments_Cascade;
SELECT * FROM dbo.Employees_Cascade;
