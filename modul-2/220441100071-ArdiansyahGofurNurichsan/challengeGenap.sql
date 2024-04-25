CREATE DATABASE challengeGenap;

USE challengeGenap;

CREATE TABLE IF NOT EXISTS employees(
employee_id INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
NAME VARCHAR (20) NOT NULL,
departement_id INT (3) NOT NULL,
salary VARCHAR (25) NOT NULL
);

CREATE TABLE IF NOT EXISTS departements(
departement_id INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
departemen_name VARCHAR (20) NOT NULL
);


CREATE TABLE IF NOT EXISTS project(
project_id INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
project_name VARCHAR (20) NOT NULL,
departement_id INT (3) NOT NULL
);

CREATE TABLE IF NOT EXISTS task(
task_id INT (2) PRIMARY KEY NOT NULL AUTO_INCREMENT,
task_name VARCHAR (20) NOT NULL,
project_id INT (3) NOT NULL,
STATUS VARCHAR (20) NOT NULL
);

CREATE TABLE IF NOT EXISTS task_assigment(
task_assigment_id INT (2) PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id INT (3) NOT NULL,
hours_worked INT (4) NOT NULL
);
 

INSERT INTO employees (NAME, departement_id, salary) VALUES
('Reyhan', 001, "20000"),
('Rafly', 002, "40000"),
('Sigma', 003, "50000"),
('Dhea', 002, "70000"),
('Cindy', 001, "90000")
;

INSERT INTO departements (departemen_name) VALUES
("PT.bunga bangsa"),
("PT.semen perkasa"),
("PT.tiga roda")
;


INSERT INTO project (project_name, departement_id) VALUES
("pengembangan perangkat lunak", 01),
("jasa konsultasi", 02),
("pengembangan sistem informasi perusahaan", 03)
;


INSERT INTO task (task_name, project_id, STATUS) VALUES
("membuat web",01,"sukses"),
("mencari klien",01,"sukses"),
("membuat konsep kasaran",01,"sukses")
;

INSERT INTO task_assigment (employee_id, hours_worked) VALUES
(01,120),
(02,150),
(03,90),
(04,115),
(05,80)
;


ALTER TABLE employees ADD CONSTRAINT fk_id_departemen FOREIGN KEY (departement_id) REFERENCES departements(departement_id);

ALTER TABLE project ADD CONSTRAINT fk_id_departemen_dua FOREIGN KEY (departement_id) REFERENCES departements(departement_id);

ALTER TABLE task ADD CONSTRAINT fk_id_project FOREIGN KEY (project_id) REFERENCES project(project_id);

ALTER TABLE task_assigment ADD CONSTRAINT fk_id_employees FOREIGN KEY (employee_id) REFERENCES employees(employee_id);


CREATE VIEW viewChallenge AS
SELECT  c.departemen_name, COUNT(b.departement_id) AS jumlah_pegawai, SUM(a.hours_worked) AS jam_kerja
FROM task_assigment a 
JOIN employees b ON a.employee_id = b.employee_id 
JOIN departements c ON b.departement_id = c.departement_id
GROUP BY c.departemen_name
HAVING jam_kerja > 100 ;


DROP VIEW viewChallenge;


DROP DATABASE challengeGenap;
