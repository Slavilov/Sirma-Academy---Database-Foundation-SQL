IF OBJECT_ID('ArchivedSubscriptions','U') IS NULL
BEGIN
    CREATE TABLE ArchivedSubscriptions (
        SubscriptionID INT PRIMARY KEY,
        TypeName VARCHAR(50),
        MonthlyFee DECIMAL(10,2),
        ArchivedAt DATETIME2 DEFAULT SYSUTCDATETIME()
    );
END

-- Move
INSERT INTO ArchivedSubscriptions (SubscriptionID, TypeName, MonthlyFee)
SELECT s.SubscriptionID, s.TypeName, s.MonthlyFee
FROM Subscriptions s
LEFT JOIN MemberSubscriptions ms ON ms.SubscriptionID = s.SubscriptionID
WHERE ms.SubscriptionID IS NULL
  AND NOT EXISTS (
        SELECT 1
        FROM ArchivedSubscriptions a
        WHERE a.SubscriptionID = s.SubscriptionID
  );

-- Delete
DELETE FROM Subscriptions
WHERE SubscriptionID IN (
    SELECT s.SubscriptionID
    FROM Subscriptions s
    LEFT JOIN MemberSubscriptions ms ON ms.SubscriptionID = s.SubscriptionID
    WHERE ms.SubscriptionID IS NULL
);
