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
VALUES  ('Martin', 'Vitanov','1996-11-30')
INSERT INTO [Student] ([FirstName], [LastName],[DateOfBirth])
VALUES  ('Martin', 'Vitanov','1996-11-30')

INSERT INTO [Teacher] ([FirstName], [LastName])
VALUES  ('Juliana', 'Cvetkovska')
INSERT INTO [Teacher] ([FirstName], [LastName])
VALUES  ('Dejan', 'Jovanov')



SELECT * FROM FINKI.dbo.Student
SELECT * FROM FINKI.dbo.Teacher
SELECT * FROM FINKI.dbo.Course
SELECT * FROM FINKI.dbo.Grade
SELECT * FROM FINKI.dbo.GradeDetail
SELECT * FROM FINKI.dbo.AchivementType

