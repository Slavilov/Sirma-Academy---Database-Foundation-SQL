-- Drop trigger if re-running
IF OBJECT_ID('dbo.trg_Products_BlockNegativePrice','TR') IS NOT NULL
    DROP TRIGGER dbo.trg_Products_BlockNegativePrice;
GO

CREATE TRIGGER dbo.trg_Products_BlockNegativePrice
ON dbo.Products
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check for invalid prices
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Price < 0
    )
    BEGIN
        RAISERROR('Cannot insert product with negative price.', 16, 1);
        ROLLBACK TRANSACTION; -- optional safety
        RETURN;
    END

    -- If OK -> actually insert
    INSERT INTO dbo.Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price, Stock)
    SELECT  i.ProductID, i.ProductName, i.SupplierID, i.CategoryID,
            i.Unit, i.Price, i.Stock
    FROM inserted i;
END;
GO

-- Test:
-- This should fail:
INSERT INTO dbo.Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price, Stock)
VALUES (999, N'Test Bad Price', 1, 1, N'x', -10.00, 100);

-- This should pass:
INSERT INTO dbo.Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price, Stock)
VALUES (1000, N'Test Good Price', 1, 1, N'1 unit', 12.34, 50);
