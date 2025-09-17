-- 3.a) Retrieve all columns
SELECT * FROM dbo.Students;

-- 3.b) FirstName and Grade of students whose Age > 14
SELECT FirstName, Grade
FROM dbo.Students
WHERE Age > 14;

GO
