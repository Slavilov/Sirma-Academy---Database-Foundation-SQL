-- Add stock column if not present
IF COL_LENGTH('dbo.Products', 'Stock') IS NULL
    ALTER TABLE dbo.Products ADD Stock INT NULL;

-- Let's say we want to reduce stock after shipment:
DECLARE @ProductID INT = 1;
DECLARE @QtyShipped INT = 3;

BEGIN TRY
    BEGIN TRANSACTION;

    -- Example business rule: stock cannot go negative
    IF (SELECT ISNULL(Stock,0) FROM dbo.Products WHERE ProductID = @ProductID) < @QtyShipped
    BEGIN
        RAISERROR('Not enough stock for ProductID %d', 16, 1, @ProductID);
    END

    UPDATE dbo.Products
    SET Stock = Stock - @QtyShipped
    WHERE ProductID = @ProductID;

    COMMIT TRANSACTION;
    PRINT 'Stock update committed.';
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    PRINT 'Error in stock update. Rolled back.';
    PRINT ERROR_MESSAGE();
END CATCH;

SELECT ProductID, ProductName, Stock FROM dbo.Products WHERE ProductID = @ProductID;
