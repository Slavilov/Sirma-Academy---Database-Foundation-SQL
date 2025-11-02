-- We'll pretend these are two products we want to restock
DECLARE @ProdA INT = 1;
DECLARE @ProdB INT = 2;

BEGIN TRY
    BEGIN TRANSACTION;

    -- 1. Update first product
    UPDATE dbo.Products
    SET Stock = ISNULL(Stock,0) + 10
    WHERE ProductID = @ProdA;

    -- SAVEPOINT here
    SAVE TRANSACTION SaveAfterFirstUpdate;

    -- 2. Update second product
    -- Force an error scenario: e.g. product doesn't exist or illegal value
    UPDATE dbo.Products
    SET Stock = ISNULL(Stock,0) + 20
    WHERE ProductID = @ProdB;

    -- If both good:
    COMMIT TRANSACTION;
    PRINT 'Both product updates committed.';
END TRY
BEGIN CATCH
    PRINT 'Second update failed. Rolling back to savepoint.';
    ROLLBACK TRANSACTION SaveAfterFirstUpdate;

    -- We are STILL inside the outer transaction.
    -- We can commit what succeeded before the savepoint.
    COMMIT TRANSACTION;
    PRINT 'First update kept, second reverted.';
END CATCH;

SELECT ProductID, ProductName, Stock
FROM dbo.Products
WHERE ProductID IN (@ProdA,@ProdB);
