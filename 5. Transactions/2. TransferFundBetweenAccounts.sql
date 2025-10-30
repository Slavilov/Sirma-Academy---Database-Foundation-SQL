DECLARE @FromAccountID INT = 1;  -- sender
DECLARE @ToAccountID   INT = 2;  -- receiver
DECLARE @Amount        DECIMAL(10,2) = 500.00;

BEGIN TRANSACTION;

-- 1) Check sender has enough balance
IF (SELECT Balance FROM dbo.Accounts WHERE AccountID = @FromAccountID) < @Amount
BEGIN
    PRINT 'Insufficient funds. Rolling back.';
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    -- 2) Withdraw
    UPDATE dbo.Accounts
    SET Balance = Balance - @Amount
    WHERE AccountID = @FromAccountID;

    -- 3) Deposit
    UPDATE dbo.Accounts
    SET Balance = Balance + @Amount
    WHERE AccountID = @ToAccountID;

    -- 4) Final validation that both rows were touched exactly once
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Transfer failed to update destination account.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        COMMIT TRANSACTION;
        PRINT 'Transfer complete.';
    END
END;

SELECT * FROM dbo.Accounts;
