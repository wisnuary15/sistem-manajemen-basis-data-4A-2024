CREATE DATABASE challenge3

USE challenge3

CREATE TABLE IF NOT EXISTS students(
students_id INT(10) PRIMARY KEY NOT NULL,
students_name VARCHAR(30) NOT NULL,
students_age VARCHAR(10) NOT NULL,
students_gender VARCHAR(30) NOT NULL
);

INSERT INTO students VALUES 
(101,'Rafly', '19', 'laki-laki'),
(102,'Zaki', '23', 'laki-laki'),
(103,'Umi', '20', 'perempuan');

SELECT * FROM students;

CREATE TABLE IF NOT EXISTS courses(
courses_id INT(10) PRIMARY KEY NOT NULL,
courses_name VARCHAR(30) NOT NULL,
courses_credits VARCHAR(20) NOT NULL
);

INSERT INTO courses VALUES 
(201,'kursus1', 'BRI'),
(202,'kursus2', 'Mandiri'),
(203,'kursus3', 'BNI');

CREATE TABLE IF NOT EXISTS students_courses(
students_id INT(10) NOT NULL,
courses_id INT(10) NOT NULL,
grade VARCHAR(10) NOT NULL,
FOREIGN KEY (students_id) REFERENCES students(students_id),
FOREIGN KEY (courses_id) REFERENCES courses(courses_id)
);

INSERT INTO students_courses VALUES
('101','201','100'),
('102','202','90'),
('103','203','80');

DELIMITER //
CREATE PROCEDURE getStudentsAndCourses(
    INOUT grade_nilai VARCHAR(10)  
)
BEGIN
    SELECT students_name, courses_name, grade
    INTO @students_name, @courses_name, @grade
    FROM students, courses, students_courses
    WHERE grade = grade_nilai;

    SET grade_nilai = @grade;
END //
DELIMITER ;

SET @grade = 85;
CALL getStudentsAndCourses(@grade);
SELECT @students_name, @courses_name, @grade;


