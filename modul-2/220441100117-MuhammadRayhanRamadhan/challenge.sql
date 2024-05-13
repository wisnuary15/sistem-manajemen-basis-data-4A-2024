CREATE DATABASE sekolah;

USE sekolah;

CREATE TABLE IF NOT EXISTS  student(
id_siswa VARCHAR (10) NOT NULL PRIMARY KEY,
NAME VARCHAR (30) NOT NULL,
age INT (3) NOT NULL,
gender VARCHAR (20) NOT NULL
);

INSERT INTO student VALUES 
('r01','rehan',16,'Pria'),
('r02','sigma',16,'Pria'),
('r03','rafly',15,'Pria');


CREATE TABLE IF NOT EXISTS courses (
id_course VARCHAR (10) NOT NULL PRIMARY KEY,
course_name VARCHAR (30) NOT NULL,
credits VARCHAR(10) NOT NULL 
);

INSERT INTO courses VALUES
('C01','IPA','2'),
('C02','IPS','3'),
('C03','Sejarah','4');

SELECT * FROM courses;



CREATE TABLE IF NOT EXISTS student_course(
id_student_course VARCHAR (10)NOT NULL PRIMARY KEY,
grade VARCHAR (10) NOT NULL,
id_course VARCHAR (10) NOT NULL,
FOREIGN KEY (id_course) REFERENCES courses(id_course)
);

SELECT * FROM student_course

INSERT INTO student_course VALUES
('SC01','A','C01'),
('SC02','B+','C03'),
('SC03','B','C02');



CREATE TABLE IF NOT EXISTS teachers (
id_teachers VARCHAR (10) NOT NULL PRIMARY KEY,
NAME VARCHAR (30) NOT NULL,
SUBJECT VARCHAR (30) NOT NULL
);

INSERT INTO teachers VALUES
('TC01','beni','IPA'),
('TC02','haqi','IPS'),
('TC03','fairus','Sejarah');


CREATE TABLE IF NOT EXISTS courses_teachers (
id_courses_teachers VARCHAR (10) NOT NULL PRIMARY KEY,
id_teachers VARCHAR (10) NOT NULL,
FOREIGN KEY (id_teachers) REFERENCES teachers (id_teachers)
);

INSERT INTO courses_teachers VALUES
('STC01','TC01'),
('STC02','TC02'),
('STC03','TC02');

SELECT * FROM courses_teachers

CREATE VIEW mengajarlebihsatu AS
SELECT NAME, SUBJECT AS Mata_Pelajaran, COUNT(a.id_teachers) AS Jumlah_Ajar
FROM teachers a
INNER JOIN courses_teachers b ON a.id_teachers = b.id_teachers
GROUP BY NAME
HAVING COUNT(Jumlah_Ajar) > 1;

CREATE VIEW mengajar AS 
SELECT NAME,SUBJECT AS Mata_Pelajaran
FROM teachers;