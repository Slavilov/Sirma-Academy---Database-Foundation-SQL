-- Offices table
IF OBJECT_ID(N'dbo.Offices', N'U') IS NOT NULL DROP TABLE dbo.Offices;
CREATE TABLE dbo.Offices
(
    OfficeID   INT IDENTITY(1,1) PRIMARY KEY,
    OfficeName NVARCHAR(100) NOT NULL,
    Country    NVARCHAR(100) NOT NULL
);

INSERT INTO dbo.Offices (OfficeName, Country) VALUES
(N'BG HQ',     N'Bulgaria'),
(N'UK Branch', N'United Kingdom');

-- Add OfficeID to Employees and relate
IF COL_LENGTH('dbo.Employees', 'OfficeID') IS NULL
    ALTER TABLE dbo.Employees ADD OfficeID INT NULL;

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = N'FK_Employees_Offices')
ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Employees_Offices
FOREIGN KEY (OfficeID) REFERENCES dbo.Offices(OfficeID);

-- Simple distribution of employees across offices
UPDATE dbo.Employees SET OfficeID = 1 WHERE DepartmentID IN (1,3);  -- BG
UPDATE dbo.Employees SET OfficeID = 2 WHERE DepartmentID IN (2,4);  -- UK
