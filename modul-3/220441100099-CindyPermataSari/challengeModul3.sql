CREATE DATABASE course;
USE course;

CREATE TABLE students (
	studentId VARCHAR(4) NOT NULL PRIMARY KEY,
	nama VARCHAR(10) NOT NULL,
	age INT(2) NOT NULL,
	gender ENUM('L','P') NOT NULL
);

CREATE TABLE course (
	courseId VARCHAR(4) NOT NULL PRIMARY KEY,
	courseName VARCHAR(10) NOT NULL,
	credits VARCHAR(5) NOT NULL
);

CREATE TABLE studentCourse (
	studentId VARCHAR(4) NOT NULL,
	courseId VARCHAR(4) NOT NULL,
	grade VARCHAR (1) NOT NULL
);

INSERT INTO students VALUES 
('S001', 'Cindy', 19, 'P'),
('S002', 'Devi', 19, 'P'),
('S003', 'Dhea', 20, 'P'),
('S004', 'Ardi', 19, 'L'),
('S005', 'Edhit', 20, 'L');

INSERT INTO course VALUES 
('C001', 'Pember', '4 SKS'),
('C002', 'SMBD', '4 SKS'),
('C003', 'IPPL', '3 SKS'),
('C004', 'SPK', '3 SKS'),
('C005', 'DM', '3 SKS');

INSERT INTO studentCourse VALUES
('S001', 'C004', 'A'),
('S002', 'C004', 'A'),
('S003', 'C004', 'A'),
('S004', 'C004', 'B'),
('S005', 'C004', 'B'),
('S001', 'C005', 'B'),
('S002', 'C005', 'B'),
('S003', 'C005', 'A'),
('S004', 'C005', 'B'),
('S005', 'C005', 'B');

ALTER TABLE studentCourse ADD CONSTRAINT fkStudents FOREIGN KEY (studentId) REFERENCES students(studentId);
ALTER TABLE studentCourse ADD CONSTRAINT fkCourse FOREIGN KEY (courseId) REFERENCES course(courseId);

SELECT * FROM students;
SELECT * FROM course;
SELECT * FROM studentCourse;

DELIMITER //
CREATE PROCEDURE infoMhs(
	INOUT idMhs VARCHAR(4)
)
BEGIN
	SELECT nama AS Nama ,courseName AS Matkul, grade AS Nilai FROM students a JOIN studentCourse b 
	ON a.studentId = b.studentId JOIN course c ON b.courseId = c.courseId
	WHERE a.studentId = idMhs;
END //
DELIMITER;
 
DROP PROCEDURE infoMhs;

SET @nim = 'S001';
CALL infoMhs(@nim);