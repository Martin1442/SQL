use FINKI

DROP TABLE IF EXISTS [dbo].[Student];
DROP TABLE IF EXISTS [dbo].[Teacher];
DROP TABLE IF EXISTS [dbo].[Course];
DROP TABLE IF EXISTS [dbo].Grade;
DROP TABLE IF EXISTS [dbo].AchivementType;
DROP TABLE IF EXISTS [dbo].GradeDetail;
GO


CREATE TABLE [Student](
[Id] [smallint] IDENTITY(1,1) NOT NULL,
[FirstName] [nvarchar](50) NULL,
[LastName] [nvarchar](50) NULL,
[DateOfBirth] [date] NULL,
[EnrolledDate] [date] NULL,
[Gender] [nvarchar] NULL,
[NationalIDNumber] [tinyint] NULL,
[StudentCardNumber] [tinyint] NULL,
CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

CREATE TABLE [Teacher](
[Id] [smallint] IDENTITY(1,1) NOT NULL,
[FirstName] [nvarchar](50) NULL,
[LastName] [nvarchar](50) NULL,
[DateOfBirth] [date] NULL,
[AcademicRank] [nvarchar](50) NULL,
[Hiredate] [date] NULL,
CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

CREATE TABLE [Course](
[Id] [smallint] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](50) NULL,
[Credit] [tinyint] NULL,
[AcademicYear] [tinyint] NULL, 
[Semester] [tinyint] NULL,
CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

CREATE TABLE [Grade](
[Id] [int] IDENTITY(1,1) NOT NULL,
[StudentID] [smallint] NULL,
[CourseID] [smallint] NULL,
[TeacherID] [smallint] NULL,
[Grade] [tinyint] NULL, 
[Comment] [nvarchar] NULL, 
[CreatedDate] [datetime] NULL,
CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

CREATE TABLE [AchivementType](
[Id] [int] IDENTITY(1,1)NOT NULL,
[Name] [nvarchar](50) NULL,
[Description] [nvarchar](100) NULL,
[ParticipationRate] [tinyint] NULL,
CONSTRAINT [PK_AchivementType] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

CREATE TABLE [GradeDetail](
[Id] [int] IDENTITY(1,1) NOT NULL,
[GradeID] [int] NULL,
[AchivementTypeID] [smallint] NULL,
[AchivementPoints] [tinyint] NULL,
[AchivementMaxPoints] [tinyint] NULL, 
[AchivementDate] [date] NULL, 
CONSTRAINT [PK_GradeDetail] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

INSERT INTO [Student] ([FirstName], [LastName],[DateOfBirth])
VALUES  ('John', 'Doe', '1999.09.09')
INSERT INTO [Student] ([FirstName], [LastName],[DateOfBirth])
VALUES  ('Jane', 'Doe', '1981.02.01')

INSERT INTO [Teacher] ([FirstName], [LastName],[DateOfBirth])
VALUES  ('John', 'Doe','1991.01.01')
INSERT INTO [Teacher] ([FirstName], [LastName],[DateOfBirth])
VALUES  ('John', 'Doe','1991.01.01')

INSERT INTO [Course] ([Name], [Credit],[AcademicYear])
VALUES  ('Math', '50','3')
INSERT INTO [Course] ([Name], [Credit],[AcademicYear])
VALUES  ('C-Language', '50','3')

INSERT INTO [Grade] ([StudentID],[CourseID],[TeacherID],[Grade])
VALUES  ('1', '1','1','8')
INSERT INTO [Grade] ([StudentID],[CourseID],[TeacherID],[Grade])
VALUES  ('2', '2','2','10')
INSERT INTO [Grade] ([StudentID],[CourseID],[TeacherID],[Grade])
VALUES  ('1', '3','2','5')

INSERT INTO [AchivementType] ([Name],[Description],[ParticipationRate])
VALUES  ('StudentOfTheYear', 'Student with most knowledge this year','101')
INSERT INTO [AchivementType] ([Name],[Description],[ParticipationRate])
VALUES  ('Winer', 'Winer','95')

INSERT INTO [GradeDetail] ([GradeID],[AchivementTypeID],[AchivementPoints],[AchivementMaxPoints],[AchivementDate])
VALUES  ('2', '1','101','101','2019-01-01')
INSERT INTO [GradeDetail] ([GradeID],[AchivementTypeID],[AchivementPoints],[AchivementMaxPoints],[AchivementDate])
VALUES  ('1', '2','95','100','2019-02-02')

select count(Grade) as TotalGrades
from dbo.Grade
go

select TeacherID,count(Grade) as TotalGrade
from dbo.[Grade]
group by TeacherID
go

select StudentID,count(Grade) as TotalGrade
from dbo.[Grade]
where StudentID < 100
group by StudentID
go

select max(Grade) as MaxGrade,avg(Grade) as AverageGrade
from dbo.Grade
go

select TeacherID,count(Grade) as TotalGrade
from dbo.[Grade]
group by TeacherID 
having count(Grade) <= 200
go

select TeacherID,count(Grade) as TotalGrade
from dbo.[Grade]
where StudentID <= 100
group by TeacherID
having count(Grade) <= 50
go

select StudentID,count(Grade) as TotalGrade,max(Grade) as MaxGrade,avg(Grade) as AverageGrade 
from dbo.[Grade]
where StudentID < 100
group by StudentID
having max(Grade) = avg(Grade)
go

select s.FirstName,s.LastName,count(Grade) as TotalGrade,max(Grade) as MaxGrade,avg(Grade) as AverageGrade 
from dbo.[Grade] g
inner join dbo.Student s on s.Id = g.StudentID
where StudentID < 100
Group by s.FirstName,s.LastName
having max(Grade) = avg(Grade)
go

drop view if exists vv_Students

create view vv_Students
as
select StudentID,count(Grade) as TotalGrade
from dbo.[Grade]
where StudentID < 100
group by StudentID
go

alter view vv_Students
as
select s.FirstName,s.LastName
from dbo.[Grade] g
inner join dbo.Student s on s.Id = g.StudentID
Group by s.FirstName,s.LastName
go


SELECT * FROM FINKI.dbo.Student
SELECT * FROM FINKI.dbo.Teacher
SELECT * FROM FINKI.dbo.Course
SELECT * FROM FINKI.dbo.Grade
SELECT * FROM FINKI.dbo.GradeDetail
SELECT * FROM FINKI.dbo.AchivementType

