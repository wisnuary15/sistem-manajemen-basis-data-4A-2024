CREATE DATABASE UTM;
USE UTM;

CREATE TABLE students(
student_id VARCHAR(100) NOT NULL PRIMARY KEY,
nama VARCHAR(100) NOT NULL,
age INT(100) NOT NULL,
gender VARCHAR(100) NOT NULL);

CREATE TABLE courses(
course_id VARCHAR(100) NOT NULL PRIMARY KEY,
courses_name VARCHAR(100) NOT NULL,
credits INT(100) NOT NULL);

CREATE TABLE student_courses(
student_id VARCHAR(100) NOT NULL,
course_id VARCHAR(100) NOT NULL,
grade VARCHAR(100) NOT NULL,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id));

INSERT INTO students (student_id, nama, age, gender) VALUES
('101', 'Devi', 19, 'P'),
('102', 'Cindy', 19, 'P'),
('103', 'Dhea', 19, 'P'),
('104', 'Ardi', 20, 'L'),
('105', 'Dedy', 20, 'L');
SELECT * FROM students;

INSERT INTO courses (course_id, courses_name, credits) VALUES
('201', 'PBW', 4),
('202', 'PBO', 4),
('203', 'MPIT', 3),
('204', 'B.Indonesia', 2),
('205', 'Alpro', 4);
SELECT * FROM courses;

INSERT INTO student_courses (student_id, course_id, grade) VALUES
('101', '202', 'A'),
('102', '202', 'B'),
('102', '203', 'B'),
('104', '203', 'C'),
('104', '201', 'A');
SELECT * FROM student_courses;

DELIMITER //
CREATE PROCEDURE challenge(
	INOUT StudentId VARCHAR(100)
)
BEGIN
	SELECT nama, courses_name, grade 
	FROM students a JOIN student_courses b ON a.student_id= b.student_id JOIN courses c ON b.course_id=c.course_id
	WHERE a.student_id=StudentId;
END//
DELIMITER ;
DROP PROCEDURE challenge;

SET @id = '102';
CALL challenge(@id);
