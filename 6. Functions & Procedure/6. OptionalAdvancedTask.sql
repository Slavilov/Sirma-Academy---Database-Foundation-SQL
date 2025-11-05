IF OBJECT_ID(N'dbo.GetEmployeeAndDepartmentInfo', N'P') IS NOT NULL DROP PROCEDURE dbo.GetEmployeeAndDepartmentInfo;
GO
CREATE PROCEDURE dbo.GetEmployeeAndDepartmentInfo
AS
BEGIN
    SET NOCOUNT ON;

    -- 1st result set: all employees
    SELECT e.EmployeeId, e.Name, e.DateOfBirth, e.DepartmentId, e.Salary
    FROM dbo.Employees e
    ORDER BY e.EmployeeId;

    -- 2nd result set: all departments
    SELECT d.DepartmentId, d.DepartmentName
    FROM dbo.Departments d
    ORDER BY d.DepartmentId;
END;
GO
-- EXEC dbo.GetEmployeeAndDepartmentInfo;
