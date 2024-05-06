CREATE DATABASE perusahaan;
USE perusahaan;


CREATE TABLE IF NOT EXISTS employees(
id_employees INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_employees VARCHAR (25),
id_department INT (30),
salary INT (30),
FOREIGN KEY (id_department) REFERENCES department (id_department)
);

CREATE TABLE IF NOT EXISTS department(
id_department INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_department VARCHAR (25)
);

CREATE TABLE IF NOT EXISTS project(
id_project INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_project VARCHAR (25)
);

CREATE TABLE IF NOT EXISTS tasks(
id_task INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_task VARCHAR (25),
STATUS VARCHAR (25)
);

CREATE TABLE IF NOT EXISTS task_assigments(
id_taskassigments INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_project INT (10),
id_employees INT (10),
hours_worked INT (25),
FOREIGN KEY (id_employees) REFERENCES employees (id_employees)
);

INSERT INTO department (nama_department) VALUES
('keuangan'),
('sumber daya manusia'),
('Pemasaran');
SELECT * FROM department;

INSERT INTO project (nama_project) VALUES
('projek a'),
('projek b'),
('projek c');
SELECT * FROM project;

INSERT INTO tasks (nama_task, STATUS) VALUES
('task pertama', 'proses'),
('task kedua', 'proses'),
('task ketiga', 'proses');
SELECT * FROM tasks;

INSERT INTO employees (nama_employees, id_department, salary) VALUES
('shafira', 4, '2.600.000'),
('adiba', 5, '3.000.000'),
('novia', 6,'4.000.000');
SELECT * FROM employees;

INSERT INTO task_assigments (id_project, id_employees, hours_worked) VALUES
(1, 1, 150),
(1, 2, 100),
(1, 3, 200);
SELECT * FROM task_assigments;


--1. VIEW menampilkan nama-nama department beserta jumlah pegawai disetiap department yang memiliki total jam kerja > 100jam--
CREATE VIEW vw_tugas AS
SELECT d.nama_department, COUNT(*) AS jumlah_employees FROM department d JOIN employees e ON d.id_department = e.id_department 
JOIN task_assigments ta ON e.id_employees = ta.id_employees GROUP BY d.nama_department HAVING SUM(ta.hours_worked) > 100;
SELECT * FROM vw_tugas;