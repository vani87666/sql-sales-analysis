-- =========================================
-- PROJECT 3: STUDENT PERFORMANCE ANALYSIS
-- =========================================

-- STEP 1: Create Database
CREATE DATABASE student_project;
USE student_project;

-- =========================================
-- STEP 2: Create Tables
-- =========================================

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- Exams Table
CREATE TABLE exams (
    exam_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

-- Attendance Table
CREATE TABLE attendance (
    student_id INT,
    attendance_percentage INT
);

-- =========================================
-- STEP 3: Insert Data
-- =========================================

-- Students
INSERT INTO students VALUES
(1, 'Amit', 'CS'),
(2, 'Sneha', 'IT'),
(3, 'Rahul', 'CS'),
(4, 'Priya', 'ENTC'),
(5, 'Neha', 'IT'),
(6, 'Karan', 'CS');

-- Exams
INSERT INTO exams VALUES
(101, 1, 'Math', 85),
(102, 1, 'DBMS', 78),
(103, 2, 'Math', 92),
(104, 2, 'DBMS', 88),
(105, 3, 'Math', 60),
(106, 3, 'DBMS', 55),
(107, 4, 'Math', 70),
(108, 4, 'DBMS', 65),
(109, 5, 'Math', 95),
(110, 5, 'DBMS', 90),
(111, 6, 'Math', 50),
(112, 6, 'DBMS', 45);

-- Attendance
INSERT INTO attendance VALUES
(1, 85),
(2, 92),
(3, 60),
(4, 75),
(5, 95),
(6, 55);

--🎯 Q1: Average marks per student

--👉 Hint:

--students + exams
--GROUP BY student
select s.student_id,s.name,Avg(e.marks) as Average_Marks from students s inner join exams e on s.student_id=e.student_id GROUP BY s.student_id, s.name order by Average_Marks Asc;

--Q2: Total marks per student
 select s.student_id,s.name,sum(e.marks) as Total_Marks from students s inner join exams e on s.student_id=e.student_id GROUP BY s.student_id, s.name order by  Total_Marks  Asc;

--Q3: Top 5 students

--👉 Based on total marks
 select s.student_id,s.name,sum(e.marks) as Total_Marks from students s inner join exams e on s.student_id=e.student_id GROUP BY s.student_id, s.name order by  Total_Marks  Desc limit 5;

--🎯 Q4: Students scoring below average

--👉 Meaning:

--Find students whose total marks < overall average
SELECT s.student_id,
       s.name,
       SUM(e.marks) AS total_marks
FROM students s
JOIN exams e 
  ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING SUM(e.marks) < (
    SELECT AVG(marks) FROM exams
);

--🔥 Q5:

--👉 Department-wise average performance

SELECT s.department,
       AVG(e.marks) AS avg_performance
FROM students s
JOIN exams e 
  ON s.student_id = e.student_id
GROUP BY s.department
ORDER BY avg_performance DESC;

--Q6: High attendance but LOW marks
SELECT s.student_id,
       s.name,
       SUM(e.marks) AS total_marks,
       a.attendance_percentage
FROM students s
JOIN exams e 
  ON s.student_id = e.student_id
JOIN attendance a 
  ON s.student_id = a.student_id
GROUP BY s.student_id, s.name, a.attendance_percentage
HAVING SUM(e.marks) < (
    SELECT AVG(marks) FROM exams
)
AND a.attendance_percentage > 80
ORDER BY a.attendance_percentage DESC;

--🔥 Q7: Rank students

--👉 Use:

--RANK()
SELECT student_id,
       name,
       total_marks,
       RANK() OVER (ORDER BY total_marks DESC) AS rank
FROM (
    SELECT s.student_id,
           s.name,
           SUM(e.marks) AS total_marks
    FROM students s
    JOIN exams e 
      ON s.student_id = e.student_id
    GROUP BY s.student_id, s.name
);

--🎯 Q8: Pass / Fail classification

--👉 Condition:

--marks ≥ 60 → PASS
--marks < 60 → FAIL

--👉 Use:
--✔️ CASE

SELECT s.student_id,
       s.name,
       SUM(e.marks) AS total_marks,
       CASE 
           WHEN SUM(e.marks) >= 120 THEN 'PASS'
           ELSE 'FAIL'
       END AS result
FROM students s
JOIN exams e 
  ON s.student_id = e.student_id
GROUP BY s.student_id, s.name;