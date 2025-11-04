IF OBJECT_ID(N'dbo.GetEmployeesByDepartment', N'IF') IS NOT NULL DROP FUNCTION dbo.GetEmployeesByDepartment;
GO
CREATE FUNCTION dbo.GetEmployeesByDepartment (@DepartmentId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT e.EmployeeId, e.Name, e.DepartmentId, e.Salary
    FROM dbo.Employees e
    WHERE e.DepartmentId = @DepartmentId
);
GO
-- SELECT * FROM dbo.GetEmployeesByDepartment(2);

IF OBJECT_ID(N'dbo.GetProductsByCategory', N'IF') IS NOT NULL DROP FUNCTION dbo.GetProductsByCategory;
GO
CREATE FUNCTION dbo.GetProductsByCategory (@CategoryId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT p.ProductId, p.ProductName, p.CategoryId, p.Price, p.Stock
    FROM dbo.Products p
    WHERE p.CategoryId = @CategoryId
);
GO
-- SELECT * FROM dbo.GetProductsByCategory(1);

IF OBJECT_ID(N'dbo.GetAffordableProducts', N'IF') IS NOT NULL DROP FUNCTION dbo.GetAffordableProducts;
GO
CREATE FUNCTION dbo.GetAffordableProducts (@MaxPrice DECIMAL(18,2))
RETURNS TABLE
AS
RETURN
(
    SELECT p.ProductId, p.ProductName, p.Price
    FROM dbo.Products p
    WHERE p.Price < @MaxPrice
);
GO
-- SELECT * FROM dbo.GetAffordableProducts(100);  -- expect T-Shirt

IF OBJECT_ID(N'dbo.GetDepartmentsWithEmployees', N'IF') IS NOT NULL DROP FUNCTION dbo.GetDepartmentsWithEmployees;
GO
CREATE FUNCTION dbo.GetDepartmentsWithEmployees ()
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT d.DepartmentId, d.DepartmentName
    FROM dbo.Departments d
    WHERE EXISTS (SELECT 1 FROM dbo.Employees e WHERE e.DepartmentId = d.DepartmentId)
);
GO
-- SELECT * FROM dbo.GetDepartmentsWithEmployees();
