USE AcademyDB

CREATE TABLE STUDENTS
(
Id INT IDENTITY PRIMARY KEY,
FullName NVARCHAR (100) NOT NULL,
Email NVARCHAR(100) UNIQUE,
BrithDate DATE NULL,
GENDER CHAR(1) CHECK (Gender IN ('M','F')),
CreatedAt DATETIME DEFAULT GETDATE()
);



INSERT INTO Students (FullName, Email, BirthDate, Gender)
VALUES ('Nubar rahimova', 'nubarrahimova@gmail.com', '2006-04-16', 'F');


CREATE TABLE Groups (
    Id INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Students (
    Id INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE StudentGroups (
    Id INT PRIMARY KEY,
    StudentId INT,
    GroupId INT
);


UPDATE Students
SET Email = 'nubarrahimova@gmail.com"'
WHERE Email IS NULL
   OR Email = '';

   UPDATE Groups
SET Capacity = 30
WHERE GroupId = 3;

DELETE FROM Students
WHERE GroupId IS NULL
   OR GroupId NOT IN (SELECT GroupId FROM Groups);






   SELECT *
FROM Students
WHERE Email IS NULL
   OR Email = '';
SELECT GroupId, COUNT(StudentId) AS StudentCount
FROM StudentGroups
GROUP BY GroupId;
SELECT g.*
FROM Groups g
LEFT JOIN StudentGroups sg ON g.GroupId = sg.GroupId
WHERE sg.GroupId IS NULL;
SELECT *
FROM Groups
WHERE GroupId NOT IN (SELECT GroupId FROM StudentGroups);
