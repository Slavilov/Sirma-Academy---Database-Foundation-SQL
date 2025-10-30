-- Setup (run once)
IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL DROP TABLE dbo.Accounts;
CREATE TABLE dbo.Accounts (
    AccountID   INT PRIMARY KEY,
    AccountName NVARCHAR(50),
    Balance     DECIMAL(10, 2)
);

-- Example values
INSERT INTO dbo.Accounts (AccountID, AccountName, Balance)
VALUES (1, 'Main Checking', 1500.00);

------------------------------------------
-- Transaction logic:
-- Insert a *new* account and only commit if Balance >= 0
------------------------------------------
DECLARE @NewAccountID   INT = 2;
DECLARE @NewAccountName NVARCHAR(50) = N'Savings';
DECLARE @NewBalance     DECIMAL(10,2) = 200.00; -- try -50.00 to test rollback

BEGIN TRANSACTION;

INSERT INTO dbo.Accounts (AccountID, AccountName, Balance)
VALUES (@NewAccountID, @NewAccountName, @NewBalance);

IF (@NewBalance < 0)
BEGIN
    PRINT 'Balance was negative. Rolling back.';
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Account created successfully.';
END;

SELECT * FROM dbo.Accounts;
