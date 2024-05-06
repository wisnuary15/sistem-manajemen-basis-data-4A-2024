CREATE DATABASE challenge2

USE challenge2

CREATE TABLE IF NOT EXISTS employees(
id_employee INT(10) PRIMARY KEY NOT NULL,
nama_employees VARCHAR(15) NOT NULL,
department_id INT(10) NOT NULL,
salary VARCHAR(25) NOT NULL,
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

DROP TABLE employees;

INSERT INTO employees VALUES 
(201,'rafly', '301', '5000'),
(202,'robi', '302', '10000'),
(203,'zaki', '303', '5000');

CREATE TABLE IF NOT EXISTS department(
department_id INT(10) PRIMARY KEY NOT NULL,
department_nama VARCHAR(15) NOT NULL
);

INSERT INTO department VALUES 
(301,'kantor1'),
(302,'kantor2'),
(303,'kantor3');

SELECT * FROM department;
DROP TABLE department;

CREATE TABLE IF NOT EXISTS projects(
id_projects INT(10) PRIMARY KEY NOT NULL,
projects_name VARCHAR(15) NOT NULL,
department_id INT(10) NOT NULL,
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

DROP TABLE projects;

INSERT INTO projects VALUES 
(401,'project1','301'),
(402,'project2','302'),
(403,'project3','303');

CREATE TABLE IF NOT EXISTS tasks(
id_tasks INT(10) PRIMARY KEY NOT NULL,
task_name VARCHAR(15) NOT NULL,
id_projects INT(10) NOT NULL,
STATUS VARCHAR(15) NOT NULL,
FOREIGN KEY (id_projects) REFERENCES projects(id_projects)
);

DROP TABLE tasks;

INSERT INTO tasks VALUES 
(501,'task1','401','status1'),
(502,'task2','402','status2'),
(503,'task3','403','status3');

CREATE TABLE IF NOT EXISTS tasks_assignments(
id_assignments INT(10) PRIMARY KEY NOT NULL,
id_employee INT(10) NOT NULL,
hours_worked VARCHAR(20) NOT NULL,
FOREIGN KEY (id_employee) REFERENCES employees(id_employee)
);

DROP TABLE tasks_assignments;

INSERT INTO tasks_assignments VALUES 
(601,'201','8jam'),
(602,'202','12jam'),
(603,'203','110jam');

CREATE VIEW vw_tampil AS
SELECT c.department_nama, COUNT(b.id_employee) AS Jumlah_Pegawai
FROM tasks_assignments a JOIN employees b ON a.id_employee = b.id_employee
JOIN department c ON b.department_id = c.department_id
WHERE a.hours_worked > 100
GROUP BY c.department_nama;

SELECT * FROM vw_tampil;