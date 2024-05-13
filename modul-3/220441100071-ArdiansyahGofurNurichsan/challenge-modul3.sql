CREATE DATABASE departement;
USE departement;


CREATE TABLE IF NOT EXISTS employees (
id_employe INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama VARCHAR (20) NOT NULL,
id_departement INT (3) NOT NULL,
salary INT (9) NOT NULL 
)

CREATE TABLE IF NOT EXISTS departements (
id_departement INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_departement VARCHAR (20) NOT NULL
)

CREATE TABLE IF NOT EXISTS salaries (
id_employe INT (3) NOT NULL,
amount INT (9) NOT NULL,
DATE DATE NOT NULL
)


INSERT INTO employees (nama, id_departement, salary) VALUES
('Sigma', 1, 100000),
('Edith', 2, 125000),
('Cindy', 3, 150000);


INSERT INTO departements (nama_departement) VALUES
('PT Bunga Perkasa'),
('PT Raksasa Merah'),
('PT Ijo Biru');


INSERT INTO departements (nama_departement) VALUES
('PT Bunga Perkasa'),
('PT Raksasa Merah'),
('PT Ijo Biru');

DROP TABLE salaries;

INSERT INTO salaries VALUES
(1, 100000, '2024-05-01'),
(2, 125000, '2024-05-01'),
(3, 150000, '2024-05-01');


INSERT INTO salaries VALUES
(1, 100000, '2024-06-01'),
(2, 125000, '2024-06-01'),
(3, 150000, '2024-06-01');

ALTER TABLE salaries ADD CONSTRAINT fk_id_employees FOREIGN KEY (id_employe) REFERENCES employees(id_employe);

ALTER TABLE employees ADD CONSTRAINT fk_id_departement FOREIGN KEY (id_departement) REFERENCES departements(id_departement);



DELIMITER //
CREATE PROCEDURE new_salary(
	IN employe_id INT,
	OUT salaryNew INT
	
)
BEGIN 
	
	
	SELECT e.nama, SUM(s.amount) AS totalGaji  FROM salaries s 
	JOIN employees e ON  s.id_employe = e.id_employe
	WHERE e.id_employe = employe_id;
	
END //
DELIMITER ;





CALL new_salary (2, @salaryNew);

SELECT * FROM employees; 


DROP PROCEDURE new_salary;

