CREATE DATABASE school;

USE school;

CREATE TABLE student(
id_student VARCHAR(10) NOT NULL PRIMARY KEY,
name_student VARCHAR(50) NOT NULL,
age_student INT(2) NOT NULL,
gender VARCHAR(2) NOT NULL
);

CREATE TABLE courses(
id_courses VARCHAR(10) NOT NULL PRIMARY KEY,
name_courses VARCHAR(20)NOT NULL,
credits_courses INT(5) NOT NULL
);

CREATE TABLE student_courses(
id_student VARCHAR(10) NOT NULL,
id_courses VARCHAR(10) NOT NULL,
grade VARCHAR(10) NOT NULL,
FOREIGN KEY (id_student) REFERENCES student(id_student),
FOREIGN KEY (id_courses) REFERENCES courses(id_courses)
);

INSERT INTO student VALUES
('st001', 'adel', 19, 'P'),
('st002', 'fira', 20, 'P'),
('st003', 'devi', 19, 'P'),
('st004', 'arum', 19, 'P'),
('st005', 'tyas', 19, 'P');

INSERT INTO courses VALUES
('cr001', 'ipa', 4),
('cr002', 'matematika', 4),
('cr003', 'b.inggris', 3),
('cr004', 'ips', 4),
('cr005', 'informatika', 4);

INSERT INTO student_courses VALUES
('st001', 'cr001', 2),
('st002', 'cr002', 2),
('st003', 'cr003', 2),
('st004', 'cr004', 2),
('st005', 'cr005', 2);

-- challenge modul3
DELIMITER //
CREATE PROCEDURE nilaiKredit(
	INOUT nilaiKredit INT,
	IN id_st VARCHAR(20)
)
BEGIN
	SET nilaiKredit = nilaiKredit+1;
	UPDATE courses SET credits_courses = nilaiKredit;
END //
DELIMITER;

SET @jumlah_kredit = 4;
CALL nilaiKredit(@jumlah_kredit, 'cr003');
SELECT @jumlah_kredit AS 'Jumlah kredit kursus yang diambil';