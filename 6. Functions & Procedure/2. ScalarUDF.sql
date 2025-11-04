IF OBJECT_ID(N'dbo.GetFullYear', N'FN') IS NOT NULL DROP FUNCTION dbo.GetFullYear;
GO
CREATE FUNCTION dbo.GetFullYear (@d DATE)
RETURNS INT
AS
BEGIN
    RETURN YEAR(@d);
END;
GO
-- Test:
-- SELECT dbo.GetFullYear(GETDATE());  -- expected: current year

IF OBJECT_ID(N'dbo.GetAnnualSalary', N'FN') IS NOT NULL DROP FUNCTION dbo.GetAnnualSalary;
GO
CREATE FUNCTION dbo.GetAnnualSalary (@MonthlySalary DECIMAL(18,2))
RETURNS DECIMAL(18,2)
AS
BEGIN
    RETURN (@MonthlySalary * 12.0);
END;
GO
-- Test:
-- SELECT dbo.GetAnnualSalary(5000);   -- expected: 60000

IF OBJECT_ID(N'dbo.IsInStock', N'FN') IS NOT NULL DROP FUNCTION dbo.IsInStock;
GO
CREATE FUNCTION dbo.IsInStock (@ProductId INT)
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT = 0;
    IF EXISTS (SELECT 1 FROM dbo.Products WHERE ProductId = @ProductId AND Stock > 0)
        SET @result = 1;
    RETURN @result;
END;
GO
-- Test:
-- SELECT dbo.IsInStock(1);            -- expected: 1 (TRUE) for Smartphone

IF OBJECT_ID(N'dbo.GetDiscountPrice', N'FN') IS NOT NULL DROP FUNCTION dbo.GetDiscountPrice;
GO
CREATE FUNCTION dbo.GetDiscountPrice
(
    @Price      DECIMAL(18,2),
    @DiscountPc DECIMAL(9,4)   -- e.g., 10 means 10%
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    RETURN CONVERT(DECIMAL(18,2), @Price * (1 - (@DiscountPc/100.0)));
END;
GO
-- Test:
-- SELECT dbo.GetDiscountPrice(699.99, 10);  -- expected: 629.99
