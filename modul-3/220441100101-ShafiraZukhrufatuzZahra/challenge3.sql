CREATE DATABASE challenge3;
USE challenge3;

CREATE TABLE IF NOT EXISTS employees(
id_employees INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
employees_name VARCHAR (100),
id_departments INT (10),
salary INT (100),
FOREIGN KEY (id_departments) REFERENCES departments (id_departments)
);

CREATE TABLE IF NOT EXISTS departments(
id_departments INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
departments_name VARCHAR (100)
);

CREATE TABLE IF NOT EXISTS salaries(
id_employees INT (10),
amount INT (100),
tanggal DATE,
FOREIGN KEY (id_employees) REFERENCES employees (id_employees)
);

INSERT INTO departments(departments_name) VALUES
('marketing'),
('HRD'),
('IT'),
('accounting'),
('production');
SELECT * FROM departments;

INSERT INTO employees(employees_name, id_departments, salary) VALUES
('shafira', 4, 3000000),
('novia', 2, 3600000),
('adiba', 1, 2800000),
('izzul', 5, 2900000),
('ibra', 5, 2900000),
('putri', 3, 3500000);
SELECT * FROM employees;

INSERT INTO salaries(id_employees,amount, tanggal) VALUES
(1, 30000000, '2024-04-15'),
(2, 36000000, '2024-04-15'),
(3, 28000000, '2024-04-15'),
(4, 29000000, '2024-04-30'),
(5, 29000000, '2024-04-30'),
(6, 35000000, '2024-04-30');
SELECT * FROM salaries;


--Buatlah sebuah STORED PROCEDURE yang menerima parameter input berupa ID karyawan (employee_id) dan mengembalikan total gaji yang diterima oleh karyawan tersebut sampai saat ini.--
DELIMITER //
CREATE PROCEDURE totalGaji(
 INOUT totalGaji INT,
 IN employees INT,
 IN tgl DATE)
BEGIN 
 SET totalGaji = totalGaji + 100000;
 UPDATE salaries SET amount = totalGaji WHERE id_employees = employees;
END //
DELIMITER ;
SET @gaji = 3000000;
CALL totalGaji(@gaji, 1);
SELECT @gaji AS 'Gaji setelah ditambah';
