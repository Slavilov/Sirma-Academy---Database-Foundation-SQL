IF OBJECT_ID(N'dbo.UpdateSalary', N'P') IS NOT NULL DROP PROCEDURE dbo.UpdateSalary;
GO
CREATE PROCEDURE dbo.UpdateSalary
    @EmployeeId INT,
    @Percent    DECIMAL(9,4)  -- e.g., 10 = +10%
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.Employees
    SET Salary = CONVERT(DECIMAL(10,2), Salary * (1 + (@Percent/100.0)))
    WHERE EmployeeId = @EmployeeId;

    SELECT EmployeeId, Name, Salary
    FROM dbo.Employees
    WHERE EmployeeId = @EmployeeId;
END;
GO
-- EXEC dbo.UpdateSalary 1, 10;  -- expect John Doe salary 55000

IF OBJECT_ID(N'dbo.AddNewProduct', N'P') IS NOT NULL DROP PROCEDURE dbo.AddNewProduct;
GO
CREATE PROCEDURE dbo.AddNewProduct
    @ProductName NVARCHAR(50),
    @CategoryId  INT,
    @Price       DECIMAL(18,2),
    @Stock       INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Products (ProductName, CategoryId, Price, Stock)
    VALUES (@ProductName, @CategoryId, @Price, @Stock);

    PRINT 'Product added successfully.';
    SELECT SCOPE_IDENTITY() AS NewProductId;
END;
GO
-- EXEC dbo.AddNewProduct N'Smartwatch', 1, 199.99, 100;

IF OBJECT_ID(N'dbo.DeleteLowStockProducts', N'P') IS NOT NULL DROP PROCEDURE dbo.DeleteLowStockProducts;
GO
CREATE PROCEDURE dbo.DeleteLowStockProducts
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.Products
    WHERE ISNULL(Stock,0) < 5;

    PRINT 'Products with low stock deleted.';
END;
GO
-- EXEC dbo.DeleteLowStockProducts;

IF OBJECT_ID(N'dbo.TransferEmployee', N'P') IS NOT NULL DROP PROCEDURE dbo.TransferEmployee;
GO
CREATE PROCEDURE dbo.TransferEmployee
    @EmployeeId   INT,
    @DepartmentId INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.Employees
    SET DepartmentId = @DepartmentId
    WHERE EmployeeId = @EmployeeId;

    SELECT EmployeeId, Name, DepartmentId
    FROM dbo.Employees
    WHERE EmployeeId = @EmployeeId;
END;
GO
-- EXEC dbo.TransferEmployee 4, 2;  -- move Bob Johnson to IT
