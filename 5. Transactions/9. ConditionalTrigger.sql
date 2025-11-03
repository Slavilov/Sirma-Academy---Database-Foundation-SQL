-- Setup demo tables
IF OBJECT_ID('dbo.HighValueOrders','U') IS NOT NULL DROP TABLE dbo.HighValueOrders;
IF OBJECT_ID('dbo.Orders_Value','U')      IS NOT NULL DROP TABLE dbo.Orders_Value;

CREATE TABLE dbo.Orders_Value (
    OrderID     INT PRIMARY KEY,
    CustomerID  INT,
    TotalAmount DECIMAL(10, 2)
);

CREATE TABLE dbo.HighValueOrders (
    OrderID      INT PRIMARY KEY,
    CustomerID   INT,
    TotalAmount  DECIMAL(10, 2),
    RecordedDate DATETIME DEFAULT GETDATE()
);

-- Trigger
IF OBJECT_ID('dbo.trg_OrdersValue_AfterInsert','TR') IS NOT NULL
    DROP TRIGGER dbo.trg_OrdersValue_AfterInsert;
GO

CREATE TRIGGER dbo.trg_OrdersValue_AfterInsert
ON dbo.Orders_Value
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.HighValueOrders (OrderID, CustomerID, TotalAmount)
    SELECT i.OrderID, i.CustomerID, i.TotalAmount
    FROM inserted i
    WHERE i.TotalAmount > 1000;  -- only high value
END;
GO

-- Test:
INSERT INTO dbo.Orders_Value (OrderID, CustomerID, TotalAmount)
VALUES (50001, 10,  750.00),    -- should NOT go to HighValueOrders
       (50002, 20, 2500.00);    -- SHOULD go

SELECT * FROM dbo.Orders_Value;
SELECT * FROM dbo.HighValueOrders;
