-- Setup tables (adapted from PDF structure)
IF OBJECT_ID('dbo.OrderLog','U') IS NOT NULL DROP TABLE dbo.OrderLog;
CREATE TABLE dbo.OrderLog (
    LogID     INT IDENTITY(1,1) PRIMARY KEY,
    OrderID   INT,
    LogDate   DATETIME DEFAULT GETDATE()
);

-- Drop trigger if re-running:
IF OBJECT_ID('dbo.trg_Orders_AfterInsert','TR') IS NOT NULL
    DROP TRIGGER dbo.trg_Orders_AfterInsert;
GO

CREATE TRIGGER dbo.trg_Orders_AfterInsert
ON dbo.Orders
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.OrderLog (OrderID)
    SELECT i.OrderID
    FROM inserted i;   -- inserted = pseudo-table of newly inserted rows
END;
GO

-- Test insert:
INSERT INTO dbo.Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID)
VALUES (99999, 1, 1, '1997-02-15', 1);

SELECT * FROM dbo.OrderLog WHERE OrderID = 99999;
