-- Create a Graduates table with the same structure as Students
IF OBJECT_ID(N'dbo.Graduates', N'U') IS NOT NULL
    DROP TABLE dbo.Graduates;
GO

CREATE TABLE dbo.Graduates
(
    StudentID INT            NOT NULL CONSTRAINT PK_Graduates PRIMARY KEY,
    FirstName VARCHAR(50)    NOT NULL,
    LastName  VARCHAR(50)    NOT NULL,
    Age       INT            NULL,
    Grade     VARCHAR(10)    NULL
);
GO

-- Insert all students with Grade = '12th' into Graduates
INSERT INTO dbo.Graduates (StudentID, FirstName, LastName, Age, Grade)
SELECT StudentID, FirstName, LastName, Age, Grade
FROM dbo.Students
WHERE Grade = '12th';

-- Verify
SELECT * FROM dbo.Graduates;
GO
