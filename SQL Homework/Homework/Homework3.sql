USE Faculty
GO

-- Calculate the count of all Grades 
select count(Grade) as TotalGrades
from dbo.Grade
go

--Calculate the count of all Grades per TeacherID
select TeacherID,count(Grade) as TotalGrade
from dbo.[Grade]
group by TeacherID
go

--Calculate the count of all Grades per TeacherID for first 100 students
select StudentID,count(Grade) as TotalGrade
from dbo.[Grade]
where StudentID < 100
group by StudentID
go

-- Find the maximal Grade and the average Grade 
select max(Grade) as MaxGrade,avg(Grade) as AverageGrade
from dbo.Grade
go

--Calculate all grades per teacher and filter only grade count greater than 200
select TeacherID,count(Grade) as TotalGrade
from dbo.[Grade]
group by TeacherID 
having count(Grade) <= 200
go

--Calculate all grades per teacher for first 100 students and filter teachers with more than 50 grade count
select TeacherID,count(Grade) as TotalGrade
from dbo.[Grade]
where StudentID <= 100
group by TeacherID
having count(Grade) > 50
go

--Find grade count,maximal grade and average grade 
select StudentID,count(Grade) as TotalGrade,max(Grade) as MaxGrade,avg(Grade) as AverageGrade 
from dbo.[Grade]
group by StudentID
having max(Grade) = avg(Grade)
go

-- List FirstName and LastName  from previous query
select s.FirstName,s.LastName,count(Grade) as TotalGrade,max(Grade) as MaxGrade,avg(Grade) as AverageGrade 
from dbo.[Grade] g
inner join dbo.Student s on s.Id = g.StudentID
Group by s.FirstName,s.LastName
having max(Grade) = avg(Grade)
go

-- Create view vv_Students that will list all Studentids and count of grades per student
drop view if exists vv_Students
GO

create view vv_Students
as
select StudentID,count(Grade) as TotalGrade
from dbo.[Grade]
group by StudentID
go

select * from vv_Students
go


--Change view to show Students FirstName and LastName instead StudentsID
alter view vv_Students
as
select s.FirstName,s.LastName, count(Grade) as Grades
from dbo.[Grade] g
inner join dbo.Student s on s.Id = g.StudentID
Group by s.FirstName,s.LastName
go

select * from vv_Students
go

-- List all rows from view ordered by bigest Crade Count
select * 
from vv_Students
order by Grades desc
go

-- Create view vv_StudentGradeDetails that will list all students (FirstName,
--LastName) and Count the courses he passed through the exam.

drop view if exists vv_StudentGradeDetails
go

create view vv_StudentGradeDetails
as 
select s.FirstName, s.LastName, count(g.CourseID) as PassedCourses
from Student s
inner join dbo.Grade g on g.StudentID = s.ID
where g.Grade > 6
group by FirstName,LastName
go

select * from vv_StudentGradeDetails
