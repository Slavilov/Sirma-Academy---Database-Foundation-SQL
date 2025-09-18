-- Update the grade of a specific student (example: StudentID = 1 to '11th')
UPDATE dbo.Students
SET Grade = '11th'
WHERE StudentID = 1;

-- Verify
SELECT * FROM dbo.Students WHERE StudentID = 1;
GO

