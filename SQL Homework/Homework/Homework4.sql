USE Faculty
GO

--EXERCISE 1
DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName
GO

--EXERCISE 2
DECLARE @AllFemaleStudents TABLE
(Id int,FirstName NVARCHAR(100), LastName NVARCHAR(100), DateOfBirth date)

INSERT INTO @AllFemaleStudents
SELECT Id,FirstName,LastName,DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

SELECT * FROM @AllFemaleStudents
GO

--EXERCISE 3
DROP TABLE IF EXISTS #AllMaleStudents
GO

CREATE TABLE #AllMaleStudents
(LastName NVARCHAR(50),EnrolledDate date)
GO 

INSERT INTO #AllMaleStudents
SELECT LastName,EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' and FirstName like 'T%'
GO

SELECT *
FROM #AllMaleStudents
WHERE LEN(LastName) = 7
GO

DROP TABLE #AllMaleStudents
GO

--EXERCISE 4
DECLARE @AllTeachers TABLE
(FirstName NVARCHAR(100), LastName NVARCHAR(100))

INSERT INTO @AllTeachers
SELECT FirstName,LastName
FROM Teacher
WHERE LEN(FirstName) < 5 and LEFT(FirstName,3) = LEFT(LastName,3)

SELECT * FROM @AllTeachers
GO
--EXERCISE 5
DROP FUNCTION IF EXISTS dbo.fn_AllStudent
GO

CREATE FUNCTION dbo.fn_AllStudent (@StudentId INT)
RETURNS NVARCHAR(100)
AS 
BEGIN

DECLARE @FunctionOutput NVARCHAR(100)

SELECT @FunctionOutput = REPLACE(StudentCardNumber,'sc-','') + ' - ' + LEFT(FirstName,1) + '.' + (LastName)
FROM dbo.Student
WHERE id = @StudentId

RETURN @FunctionOutput

END
GO

SELECT *,dbo.fn_AllStudent(id) AS FunctionOutput
FROM dbo.Student
GO




-- EXERCISE 6

DROP FUNCTION IF EXISTS dbo.fn_StudentsThatPassed;
GO

CREATE FUNCTION dbo.fn_StudentsThatPassed (@TeacherID int,@CourseId int)
RETURNS @output TABLE (StudentFirstName NVARCHAR(100), StudentLastName NVARCHAR(100),Grade SMALLINT, CreatedDate DATETIME)
AS
BEGIN
INSERT INTO @output
SELECT s.FirstName AS StudentFirstName, s.LastName AS StudentLastName, g.Grade AS Grade, g.CreatedDate AS CreatedDate
FROM dbo.[Grade] g
INNER JOIN dbo.Student s on s.Id = g.StudentID
INNER JOIN dbo.Student t on t.Id = g.TeacherID
WHERE t.Id = @TeacherID and g.CourseID = @CourseId

RETURN 
END
GO

SELECT * FROM DBO.fn_StudentsThatPassed(1,1)
GO

