USE [Faculty]
GO

-- Find all students with FirstName = 'Antonio'
SELECT *
FROM Student
WHERE FirstName = 'Antonio'
GO

--DateOfBirth > '1999-01-01'
SELECT *
FROM Student
WHERE DateOfBirth >=  '1999-01-01'
GO

--Find all Male students
SELECT *
FROM Student
WHERE Gender = 'M'
GO

--Last name start with T
SELECT *
FROM Student
WHERE LastName like 'T%'
GO

--Enrolled in January 1998
SELECT *
FROM Student
WHERE EnrolledDate = '1998-01-01'
GO

-- lastName start with J and enrolled 1998
SELECT *
FROM Student
WHERE LastName like 'J%' and  EnrolledDate >= '1998-01-01'
GO

--all students Antonio ordered by LastName
SELECT *
FROM Student
WHERE FirstName = 'Antonio'
ORDER BY LastName
GO

-- all students ordered by firstName
SELECT *
FROM Student
ORDER BY FirstName
GO

--all Male students ordere by enrolled date starting from last
SELECT *
FROM Student
ORDER BY EnrolledDate DESC
GO

-- all teacher and students FirstName WITH DUPLICATES
SELECT FirstName
FROM Teacher
UNION ALL
SELECT FirstName
FROM Student
GO

-- all teacher and students LastName WITHOUT DUPLICATES
SELECT LastName
FROM Teacher
UNION 
SELECT LastName
FROM Student
GO

--all firstName for Teacher and Students
SELECT FirstName
from Teacher
UNION
SELECT FirstName
FROM Student
GO

--insert value of 100 in AchievementMaxPoints column if there is no value
ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR [AchievementMaxPoints]
GO


-- prevent inserting AchievementPoints that are greater than AchievementMaxPoints
ALTER TABLE dbo.GradeDetails WITH CHECK
ADD CONSTRAINT CHK_GradeDetails_AchievementPoints
CHECK (AchievementPoints <= AchievementMaxPoints)
GO

-- create foreing key 
--ALTER TABLE dbo.Grade WITH CHECK
--ADD CONSTRAINT [FK_Grade_Teacher]
--FOREIGN KEY([TeacherID])
--REFERENCES Teacher ([ID])
--GO


---------------------HOMEWORK REQUIREMENT 6/6

--1
SELECT c.[Name] as CourseName, a.[Name] as AchievmentType
FROM Course c 
CROSS JOIN AchievementType a
GO

--2
SELECT t.FirstName as TeacherName
FROM Teacher t
CROSS JOIN Grade e 
GROUP BY FirstName
GO

--3
SELECT t.FirstName
FROM Teacher t
LEFT JOIN Grade g on t.ID = g.TeacherID
WHERE g.TeacherID is null
GO

--5 
SELECT s.*
FROM Grade g
RIGHT JOIN Student s on g.StudentID = s.ID
WHERE g.StudentID is null
GO