-- Delete a student record where StudentID = 3
DELETE FROM dbo.Students
WHERE StudentID = 3;

-- Verify
SELECT * FROM dbo.Students WHERE StudentID = 3;
GO
