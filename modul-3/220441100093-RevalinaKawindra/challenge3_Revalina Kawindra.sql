CREATE DATABASE karyawan;

USE karyawan;

DROP DATABASE karyawan;

CREATE TABLE IF NOT EXISTS departments(
id INT (10) NOT NULL PRIMARY KEY,
department_name VARCHAR (15),
salary INT (10));

CREATE TABLE IF NOT EXISTS employees(
id INT (10) NOT NULL PRIMARY KEY,
employee_name VARCHAR (15)NOT NULL,
department_id INT (10)NOT NULL,
FOREIGN KEY (department_id) REFERENCES departments(id));

CREATE TABLE IF NOT EXISTS salaries(
id INT (10) NOT NULL PRIMARY KEY,
employee_id INT (10) NOT NULL,
amount INT (10) NOT NULL,
salary_date DATE,
FOREIGN KEY (employee_id) REFERENCES employees(id));

INSERT INTO karyawan.departments VALUES
(001, 'PT. AMAN SENTOSA', 2000000),
(002, 'PT. PARAGON', 7000000),
(003, 'PT. BULAN BINTANG', 5000000),
(004, 'PT. SEKARANG BANGET', 8000000);

INSERT INTO karyawan.employees VALUES
(101, 'Suryo Pranoto', 001),
(102, 'Gita Danuar', 004),
(103, 'Nabila Andini', 003);

INSERT INTO karyawan.salaries VALUES
(201, 101, 2000000, '2024-03-25'),
(202, 102, 7000000, '2024-03-25'),
(203, 102, 7000000, '2024-04-25'),
(204, 103, 8000000, '2024-03-25');

DELIMITER //
CREATE PROCEDURE total_salary(
	IN id_karyawan INT (10), 
	OUT total_amount INT (10))
BEGIN
    
    SELECT SUM(amount) INTO total_amount
    FROM salaries
    WHERE employee_id = id_karyawan;

END //
DELIMITER ;

DROP PROCEDURE karyawan.total_salary; 
-- Menampilkan total gaji karyawan 
CALL total_salary(102, @total_amount);
SELECT @total_amount AS total_gaji;
