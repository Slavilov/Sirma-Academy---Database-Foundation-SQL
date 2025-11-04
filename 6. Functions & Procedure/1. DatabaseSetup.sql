IF DB_ID(N'PracticeDB') IS NOT NULL
BEGIN
    ALTER DATABASE PracticeDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PracticeDB;
END;
GO

CREATE DATABASE PracticeDB;
GO
USE PracticeDB;
GO

-- Base tables
CREATE TABLE dbo.Employees (
    EmployeeId   INT IDENTITY(1,1) PRIMARY KEY,
    Name         NVARCHAR(50),
    DateOfBirth  DATE,
    DepartmentId INT,
    Salary       DECIMAL(10,2)
);

CREATE TABLE dbo.Departments (
    DepartmentId   INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

CREATE TABLE dbo.Products (
    ProductId   INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(50),
    CategoryId  INT,
    Price       DECIMAL(10,2),
    Stock       INT
);

CREATE TABLE dbo.Categories (
    CategoryId   INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50)
);

-- Seed data (from exercise sheet)
INSERT INTO dbo.Departments (DepartmentName)
VALUES (N'HR'), (N'IT'), (N'Sales'), (N'Marketing');

INSERT INTO dbo.Employees (Name, DateOfBirth, DepartmentId, Salary)
VALUES
(N'John Doe',   '1990-06-15', 1, 50000),
(N'Jane Smith', '1985-12-22', 2, 70000),
(N'Alice Brown','1992-03-10', 3, 45000),
(N'Bob Johnson','1988-09-05', 4, 55000);

INSERT INTO dbo.Categories (CategoryName)
VALUES (N'Electronics'), (N'Clothing'), (N'Home Appliances');

INSERT INTO dbo.Products (ProductName, CategoryId, Price, Stock)
VALUES
(N'Smartphone',      1,  699.99,  50),
(N'Laptop',          1, 1299.99,  30),
(N'T-Shirt',         2,   19.99, 100),
(N'Vacuum Cleaner',  3,  149.99,  20);
