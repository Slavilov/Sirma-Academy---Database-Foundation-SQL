CREATE DATABASE School;
GO
USE School;
GO

-- Create the Students table
IF OBJECT_ID(N'dbo.Students', N'U') IS NOT NULL
    DROP TABLE dbo.Students;
GO

CREATE TABLE dbo.Students
(
    StudentID INT            NOT NULL CONSTRAINT PK_Students PRIMARY KEY,
    FirstName VARCHAR(50)    NOT NULL,
    LastName  VARCHAR(50)    NOT NULL,
    Age       INT            NULL,
    Grade     VARCHAR(10)    NULL
);
GO
