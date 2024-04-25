CREATE DATABASE school;

USE school;

CREATE TABLE IF NOT EXISTS students(
id INT (10) NOT NULL PRIMARY KEY,
name_student VARCHAR (15) NOT NULL,
age VARCHAR (15) NOT NULL,
gender VARCHAR (15) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses(
id INT (10) NOT NULL PRIMARY KEY,
course_name VARCHAR (15) NOT NULL,
credits VARCHAR (15) NOT NULL
);

CREATE TABLE IF NOT EXISTS students_courses(
id INT (10) NOT NULL PRIMARY KEY,
id_course INT(10) NOT NULL,
grade VARCHAR (15) NOT NULL,
FOREIGN KEY (id_course) REFERENCES courses(id)
);

CREATE TABLE IF NOT EXISTS teachers(
id INT (10) NOT NULL PRIMARY KEY,
name_teachers VARCHAR(15) NOT NULL,
subjects VARCHAR (15) NOT NULL
);

CREATE TABLE IF NOT EXISTS teachers_courses(
id INT (10) NOT NULL PRIMARY KEY,
id_teachers INT(10) NOT NULL,
id_courses INT (10) NOT NULL,
FOREIGN KEY (id_teachers) REFERENCES teachers(id),
FOREIGN KEY (id_courses) REFERENCES courses(id)
);

INSERT INTO courses VALUES
(111, 'science', '2'),
(112, 'math', '3'),
(113, 'chemistry', '2'),
(114, 'english', '1');

INSERT INTO students VALUES
(211, 'Abdillah', '7', 'boy'),
(212, 'Aisiyah', '8', 'girl'),
(213, 'Beni', '6', 'boy'),
(214, 'Badrul', '7', 'boy'),
(215, 'Cika', '6', 'girl');

INSERT INTO students_courses VALUES
(311, 111, '1'),
(312, 112, '1'),
(313, 113, '1'),
(314, 114, '1');

INSERT INTO teachers VALUES
(411, 'Syukron', 'math'),
(412, 'Syukron', 'english'),
(413, 'Larry', 'science'),
(414, 'cika', 'math');

DROP TABLE teachers_courses;
DROP TABLE teachers;

INSERT INTO teachers_courses VALUES
(511, 411, 112),
(512, 412, 114),
(513, 413, 111),
(514, 411, 114);

CREATE VIEW guru_mengajar AS
SELECT a.name_teachers AS Nama_Guru,
    COUNT(DISTINCT b.id_courses) AS jumlah_courses,
    GROUP_CONCAT(DISTINCT c.course_name) AS daftar_mata_pelajaran
FROM teachers a JOIN teachers_courses b ON a.id = b.id_teachers
JOIN courses c ON b.id_courses = c.id
GROUP BY a.id
HAVING COUNT(DISTINCT b.id_courses) > 1;

SELECT * FROM guru_mengajar;

DROP VIEW guru_mengajar;
