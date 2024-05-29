create DATABASE challengemodul3;
use challengemodul3;

CREATE TABLE employees(
id_employees VARCHAR (10) PRIMARY KEY NOT NULL,
nama VARCHAR(25) NOT NULL,
salary VARCHAR(15) NOT NULL,
department_id VARCHAR(10) NOT NULL,
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE departments(
department_id VARCHAR (10) NOT NULL PRIMARY KEY,
department_name VARCHAR(25) NOT NULL
);

CREATE TABLE salaries(
id_employees VARCHAR (10),
amount VARCHAR(25) NOT NULL,
tanggal Date,
FOREIGN KEY (id_employees) REFERENCES employees(id_employees)
);

INSERT INTO departments (department_id, department_name) VALUES 
('DPG001', 'Keamanan'),
('DPG002', 'Pemasaran'),
('DPG003', 'Produksi');

INSERT INTO employees (id_employees, nama, salary, department_id) VALUES 
('KYG001', 'Sarah Connor', 3000000, 'DPG002'),
('KYG002', 'Bruce Wayne', 2000000, 'DPG001'),
('KYG003', 'Clark Kent', 3000000, 'DPG002'),
('KYG004', 'Peter Parker', 350000, 'DPG003'),
('KYG005', 'Super Dede', 2000000, 'DPG001'),
('KYG006', 'Tony Stark', 350000, 'DPG003');

INSERT INTO salaries (id_employees, amount, tanggal) VALUES 
('KYG001', 3000000,  '2024-04-01'),
('KYG002', 2000000, '2024-04-03'),
('KYG003', 3000000,  '2024-04-01'),
('KYG004', 3500000, '2024-04-05'),
('KYG005', 2000000,  '2024-04-03'),
('KYG006', 3500000,  '2024-04-05');

INSERT INTO salaries (id_employees, amount, tanggal) VALUES 
('KYG001', 3000000,  '2024-05-01');

CREATE PROCEDURE totalgaji (
    IN kode VARCHAR(10),
    OUT gaji VARCHAR(25)
)
BEGIN
 SELECT SUM(amount) INTO gaji
 FROM salaries
 WHERE id_employees = kode;
END

call totalgaji('KYG001', @gaji);
SELECT @gaji As Gaji;
