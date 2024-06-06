CREATE DATABASE IF NOT EXISTS MapelSiswa;

USE MapelSiswa;

CREATE TABLE IF NOT EXISTS students (
id_students VARCHAR (10) NOT NULL PRIMARY KEY,
NAME VARCHAR (10) NOT NULL,
age INT (10) NOT NULL,
gender VARCHAR (10)
)

DROP TABLE students;

CREATE TABLE IF NOT EXISTS courses (
id_course VARCHAR (10) NOT NULL PRIMARY KEY,
name_course VARCHAR (100) NOT NULL,
credits VARCHAR (10)
);

CREATE TABLE IF NOT EXISTS student_courses(
id_student_courses VARCHAR (10) NOT NULL PRIMARY KEY,
id_students VARCHAR (10) NOT NULL,
id_course VARCHAR (10) NOT NULL,
grade VARCHAR (10) NOT NULL,
FOREIGN KEY (id_students) REFERENCES students (id_students),
FOREIGN KEY (id_course) REFERENCES courses (id_course)
);
SELECT *  FROM student_courses;
DROP TABLE student_courses;

INSERT INTO students VALUES
('S01','Tymo',19,'Pria'),
('S02','Kapo',20,'Pria'),
('S03','Joko',18,'Pria');

INSERT INTO courses VALUES
('C01','Physics','3'),
('C02','Calculus','3'),
('C03','Data Sciense','3');


INSERT INTO student_courses VALUES 
('SC01','S02','C03','80'),
('SC02','S03','C01','80'),
('SC03','S01','C03','85'),
('SC04','S01','C02','90');


DELIMITER //
CREATE PROCEDURE DataSiswa(
    INOUT nilai INT,
    IN id_siswa VARCHAR (50),
    IN nama_siswa VARCHAR (50),
    IN nama_pelajaran VARCHAR (50)
)
BEGIN
	SELECT id_students = id_siswa, NAME = nama_siswa,  name_course = nama_pelajaran, grade = nilai FROM students a
	JOIN student_course b ON  a.id_students = b.id_student WHERE id_student = id_siswa;


END//
DELIMITER ;

SET @grade = 85;
CALL DataSiswa(@id_student,@nama_siswa,@nama_pelajaran, 'S01');
SELECT * @Grade;





