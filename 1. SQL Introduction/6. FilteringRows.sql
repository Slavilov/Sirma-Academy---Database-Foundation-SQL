-- 6.a) Students with Grade = '10th'
SELECT *
FROM dbo.Students
WHERE Grade = '10th';

-- 6.b) Students whose Age is between 14 and 16 (inclusive)
SELECT *
FROM dbo.Students
WHERE Age BETWEEN 14 AND 16;
GO
