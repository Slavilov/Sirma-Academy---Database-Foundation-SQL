IF OBJECT_ID(N'dbo.GetTopPaidEmployees', N'FN') IS NOT NULL DROP FUNCTION dbo.GetTopPaidEmployees;
GO
CREATE FUNCTION dbo.GetTopPaidEmployees (@DepartmentId INT)
RETURNS @t TABLE
(
    EmployeeId INT,
    Name       NVARCHAR(50),
    Salary     DECIMAL(10,2)
)
AS
BEGIN
    INSERT INTO @t (EmployeeId, Name, Salary)
    SELECT TOP (3) e.EmployeeId, e.Name, e.Salary
    FROM dbo.Employees e
    WHERE e.DepartmentId = @DepartmentId
    ORDER BY e.Salary DESC, e.EmployeeId ASC;
    RETURN;
END;
GO
-- SELECT * FROM dbo.GetTopPaidEmployees(3);

IF OBJECT_ID(N'dbo.GetEmployeeDetails', N'FN') IS NOT NULL DROP FUNCTION dbo.GetEmployeeDetails;
GO
CREATE FUNCTION dbo.GetEmployeeDetails ()
RETURNS @t TABLE
(
    EmployeeId     INT,
    EmployeeName   NVARCHAR(50),
    DepartmentName NVARCHAR(50),
    Salary         DECIMAL(10,2)
)
AS
BEGIN
    INSERT INTO @t (EmployeeId, EmployeeName, DepartmentName, Salary)
    SELECT e.EmployeeId, e.Name, d.DepartmentName, e.Salary
    FROM dbo.Employees e
    LEFT JOIN dbo.Departments d ON d.DepartmentId = e.DepartmentId;
    RETURN;
END;
GO
-- SELECT * FROM dbo.GetEmployeeDetails();

IF OBJECT_ID(N'dbo.GetOutOfStockProducts', N'FN') IS NOT NULL DROP FUNCTION dbo.GetOutOfStockProducts;
GO
CREATE FUNCTION dbo.GetOutOfStockProducts ()
RETURNS @t TABLE
(
    ProductId   INT,
    ProductName NVARCHAR(50),
    Stock       INT
)
AS
BEGIN
    INSERT INTO @t (ProductId, ProductName, Stock)
    SELECT p.ProductId, p.ProductName, p.Stock
    FROM dbo.Products p
    WHERE ISNULL(p.Stock,0) = 0;
    RETURN;
END;
GO
-- SELECT * FROM dbo.GetOutOfStockProducts();

IF OBJECT_ID(N'dbo.GetEmployeesByAgeRange', N'FN') IS NOT NULL DROP FUNCTION dbo.GetEmployeesByAgeRange;
GO
CREATE FUNCTION dbo.GetEmployeesByAgeRange (@MinAge INT, @MaxAge INT)
RETURNS @t TABLE
(
    EmployeeId INT,
    Name       NVARCHAR(50),
    Age        INT
)
AS
BEGIN
    -- Accurate age calculation: subtract 1 if birthday is still ahead this year
    INSERT INTO @t (EmployeeId, Name, Age)
    SELECT e.EmployeeId,
           e.Name,
           DATEDIFF(YEAR, e.DateOfBirth, GETDATE())
           - CASE WHEN DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth)) > CAST(GETDATE() AS DATE) THEN 1 ELSE 0 END AS Age
    FROM dbo.Employees e
    HAVING MIN(
             DATEDIFF(YEAR, e.DateOfBirth, GETDATE())
             - CASE WHEN DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth)) > CAST(GETDATE() AS DATE) THEN 1 ELSE 0 END
           ) BETWEEN @MinAge AND @MaxAge;
    RETURN;
END;
GO
-- Example:
-- SELECT * FROM dbo.GetEmployeesByAgeRange(30, 40);
