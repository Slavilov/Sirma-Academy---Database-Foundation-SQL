IF OBJECT_ID('fn_GetSubscriptionFee','FN') IS NOT NULL DROP FUNCTION fn_GetSubscriptionFee;
GO
CREATE FUNCTION fn_GetSubscriptionFee(@SubscriptionID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @fee DECIMAL(10,2);
    SELECT @fee = MonthlyFee
    FROM Subscriptions
    WHERE SubscriptionID = @SubscriptionID;
    RETURN @fee;
END
GO
