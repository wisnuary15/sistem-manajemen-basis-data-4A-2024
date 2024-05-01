CREATE DATABASE sekolah;

USE sekolah;

CREATE TABLE student(
id_student INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama VARCHAR(50) NOT NULL,
usia INT(2) NOT NULL,
gender VARCHAR(1) NOT NULL
);

CREATE TABLE courses(
id_course INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
course_name VARCHAR(30) NOT NULL,
credits INT(5) NOT NULL
);

CREATE TABLE student_course(
id_sc INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_course INT(20) NOT NULL,
grade INT(2) NOT NULL,
FOREIGN KEY (id_course) REFERENCES courses(id_course)
);

CREATE TABLE teachers(
id_teachers INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name_teachers VARCHAR(50) NOT NULL,
subject_teachers VARCHAR(5) NOT NULL
);

CREATE TABLE course_teachers(
id_ct INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_teachers INT(20) NOT NULL,
FOREIGN KEY (id_teachers) REFERENCES teachers(id_teachers)
);

INSERT INTO student (nama, usia, gender) VALUES
('adel', 19, 'P'),
('fira', 19, 'P'),
('arum', 19, 'P'),
('devi', 20, 'P'),
('alim', 19, 'L'),
('adi', 20, 'L');

INSERT INTO courses (course_name, credits) VALUES
('ipa', 18),
('matematika', 18),
('b.inggris', 18),
('website', 20);

INSERT INTO student_course (id_course, grade) VALUES
(1, 'A'),
(2, 'B'),
(3, 'B'),
(4, 'B+');

INSERT INTO teachers (name_teachers, subject_teachers) VALUES
('novi', 'ipa'),
('ali', 'matematika'),
('dina', 'b.inggris'),
('zaki', 'website');

INSERT INTO course_teachers (id_teachers) VALUES
(1),
(2),
(3),
(4);

CREATE VIEW ngajar AS
SELECT name_teachers, subject_teachers AS course,  COUNT(a.id_teachers) AS jumlah_ngajar
FROM teachers a
INNER JOIN course_teachers b ON a.id_teachers = b.id_teachers
GROUP BY name_teachers
HAVING COUNT(jumlah_ngajar) > 1;

SELECT * FROM ngajar;