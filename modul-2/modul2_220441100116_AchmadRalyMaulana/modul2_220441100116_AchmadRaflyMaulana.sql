-- Modul 2

CREATE DATABASE perpustakaan;

USE perpustakaan;

CREATE TABLE IF NOT EXISTS petugas(
id_petugas INT(10) PRIMARY KEY NOT NULL,
username VARCHAR(15) NOT NULL,
pass VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

DROP TABLE petugas;

INSERT INTO petugas VALUES 
(201,'agung12', 'ag123', 'agung'),
(202,'zaki12', 'za23', 'zaki'),
(203,'indra12', 'in55', 'indra'),
(204,'rafly12', 'ra88', 'rafly'),
(205,'robi2', 'ro22', 'robi'),
(206,'hengky12', 'he22', 'hengky'),
(207,'putro12', 'pu13', 'putro'),
(208,'farid12', 'fa23', 'farid');

SELECT * FROM petugas;

CREATE TABLE IF NOT EXISTS buku(
kode_buku INT(10) NOT NULL  PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
penerbit_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL, 
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20) NOT NULL
);

INSERT INTO buku VALUES
(301,'Laskar Pelangi', 'Andrea Hirata', 'Bintang Pustaka', '2015', '30', 'baru', 'baik'),
(302,'Negeri 5 Menara', 'Ahmad Fuadi', 'Pt. Gramedia Pustaka Utama', '2009', '20', 'baru', 'baik'),
(303,'Koala Kamal', 'Raditya Dika', 'Gagas Media', '2015', '10', 'baru', 'baik'),
(304,'Promise', 'Dwitasari', 'Loveable', '2018', '30', 'baru', 'baik'),
(305,'Perahu Kertas', 'Dewi Lestari', 'Bentang Pustaka', '2018', '10', 'baru', 'baik'),
(306,'London Love Story', 'Tisa TS', 'Loveable', '2015', '10', 'baru', 'baik'),
(307,'Dear Nathan', 'Erisca Febrianti', 'Pastel Books', '2019', '30', 'baru', 'baik'),
(308,'Sang Mimpi', 'Andrea Hirata', 'Bintang Pustaka', '2019', '25', 'baru', 'baik');

SELECT * FROM buku;

CREATE TABLE IF NOT EXISTS anggota(
id_anggota INT(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL
);

INSERT INTO anggota VALUES
(101,'Birrur', '2022', 'Gresik', '2003-10-16', '085850080589', 'laki-laki', 'Pinjam'),
(102,'Shafira', '2022', 'Gresik', '2003-05-23', '085877890589', 'Perempuan', 'Pinjam'),
(103,'Farra', '2019', 'Gresik', '2003-01-06', '085856519589', 'Perempuan', 'Pinjam'),
(104,'Akmal', '2021', 'Kediri', '2003-06-04', '085823410589', 'laki-laki', 'Pinjam'),
(105,'Dani', '2022', 'Lamongan', '2003-10-31', '085859862589', 'laki-laki', 'Pinjam'),
(106,'Fiqi', '2020', 'Bangkalan', '2004-01-03', '085850029759', 'laki-laki', 'Pinjam');

SELECT * FROM anggota;

CREATE TABLE IF NOT EXISTS pengembalian(
kode_kembali INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
kode_buku INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR(15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

INSERT INTO pengembalian VALUES
('401', '103','301','206', '2023-10-10', '2023-10-22', '10.000'),
('402', '101','301','207', '2023-10-16', '2023-10-25', '0'),
('403', '105','301','206', '2023-11-23', '2023-11-29', '0'),
('404', '105','303','204', '2023-11-28', '2023-11-03', '0'),
('405', '105','308','203', '2023-12-02', '2023-12-10', '0'),
('406', '101','306','206', '2023-12-05', '2023-12-15', '0'),
('407', '105','302','206', '2024-01-06', '2024-01-13', '0'),
('408', '105','306','202', '2024-01-09', '2024-01-15', '0'),
('409', '102','301','201', '2024-02-10', '2024-02-19', '0'),
('410', '105','305','206', '2024-02-17', '2024-02-15', '0'),
('411', '104','307','208', '2024-03-03', '2024-03-12', '0');

CREATE TABLE IF NOT EXISTS peminjaman(
kode_peminjaman INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku INT(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);`pengembalian`

INSERT INTO peminjaman VALUES
('501', '103', '206', '2023-10-10', '2023-10-22', '301'),
('502', '101', '207', '2023-10-16', '2023-10-25', '301'),
('503', '105', '206', '2023-11-23', '2023-11-29', '301'),
('504', '105', '204', '2023-11-28', '2023-11-03', '303'),
('505', '105', '203', '2023-12-02', '2023-12-10', '308'),
('506', '101', '206', '2023-12-05', '2023-12-15', '306'),
('507', '105', '206', '2024-01-06', '2024-01-13', '302'),
('508', '105', '202', '2024-01-09', '2024-01-15', '306'),
('509', '102', '201', '2024-02-10', '2024-02-19', '301'),
('510', '105', '206', '2024-02-17', '2024-02-15', '305'),
('511', '104', '208', '2024-03-03', '2024-03-12', '307');

SELECT * FROM peminjaman;

CREATE VIEW vw_anggota_peminjamn_terbanyak3 AS
SELECT p.id_anggota, a.nama_anggota, COUNT(*) AS jumlah_peminjaman
FROM anggota a JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY p.id_anggota, a.nama_anggota
HAVING COUNT(*) > 5;

SELECT * FROM vw_anggota_peminjamn_terbanyak3;

CREATE VIEW vw_petugas AS
SELECT t.id_petugas, t.nama, p.tanggal_pinjam, COUNT(*) AS jumlah_transaksi
FROM petugas t JOIN peminjaman p ON t.id_petugas = p.id_petugas
GROUP BY t.id_petugas, t.nama;

SELECT * FROM vw_petugas;

CREATE VIEW vw_petugas_transaksi_terbanyak AS
SELECT t.id_petugas, t.nama, COUNT(p.kode_peminjaman) AS jumlah_transaksi
FROM petugas t
INNER JOIN peminjaman p ON t.id_petugas = p.id_petugas
GROUP BY t.id_petugas, t.nama
ORDER BY jumlah_transaksi DESC LIMIT 1;

SELECT * FROM vw_petugas_transaksi_terbanyak;

CREATE VIEW vw_buku_terbanyak AS
SELECT b.kode_buku, b.judul_buku, COUNT(p.kode_peminjaman) AS jumlah_pinjam
FROM buku b
INNER JOIN peminjaman p ON b.kode_buku = p.kode_buku
GROUP BY b.kode_buku, b.judul_buku
ORDER BY jumlah_pinjam DESC LIMIT 1;

SELECT * FROM vw_buku_terbanyak;

-- challenge

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




