-- Create a view v_StudentsByGrade that shows FullName and Grade of all students
IF OBJECT_ID(N'dbo.v_StudentsByGrade', N'V') IS NOT NULL
    DROP VIEW dbo.v_StudentsByGrade;
GO

CREATE VIEW dbo.v_StudentsByGrade
AS
SELECT
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Grade
FROM dbo.Students;
GO

-- Test the view
SELECT * FROM dbo.v_StudentsByGrade;
GO
