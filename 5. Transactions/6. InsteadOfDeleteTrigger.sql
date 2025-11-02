-- Demo tables for this exercise
IF OBJECT_ID('dbo.Employees_BlockDelete','U') IS NOT NULL DROP TABLE dbo.Employees_BlockDelete;
CREATE TABLE dbo.Employees_BlockDelete (
    EmployeeID INT PRIMARY KEY,
    Name       NVARCHAR(50),
    Position   NVARCHAR(50)
);

IF OBJECT_ID('dbo.DeletedEmployees','U') IS NOT NULL DROP TABLE dbo.DeletedEmployees;
CREATE TABLE dbo.DeletedEmployees (
    EmployeeID  INT PRIMARY KEY,
    Name        NVARCHAR(50),
    Position    NVARCHAR(50),
    DeletedDate DATETIME DEFAULT GETDATE()
);

INSERT INTO dbo.Employees_BlockDelete (EmployeeID, Name, Position) VALUES
(1, N'Nancy Davolio',   N'Sales Rep'),
(2, N'Andrew Fuller',   N'Vice President'),
(3, N'Janet Leverling', N'Sales Rep');

-- Create trigger
IF OBJECT_ID('dbo.trg_Employees_BlockDelete_InsteadOfDelete','TR') IS NOT NULL
    DROP TRIGGER dbo.trg_Employees_BlockDelete_InsteadOfDelete;
GO

CREATE TRIGGER dbo.trg_Employees_BlockDelete_InsteadOfDelete
ON dbo.Employees_BlockDelete
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Move deleted rows into DeletedEmployees
    INSERT INTO dbo.DeletedEmployees (EmployeeID, Name, Position)
    SELECT d.EmployeeID, d.Name, d.Position
    FROM deleted d;  -- 'deleted' = rows that were targeted for delete

    PRINT 'Deletion prevented. Row archived instead.';
END;
GO

-- Test "delete"
DELETE FROM dbo.Employees_BlockDelete WHERE EmployeeID = 2;

SELECT * FROM dbo.Employees_BlockDelete; -- 2 is still there? Actually no: INSTEAD OF means we never removed it
SELECT * FROM dbo.DeletedEmployees;      -- archived copy
