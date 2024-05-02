CREATE DATABASE modul_3;

USE modul_3;

CREATE TABLE petugas (
IdPetugas VARCHAR (10) NOT NULL,
Username VARCHAR (15) NOT NULL,
PASSWORD VARCHAR (15) NOT NULL,
Nama VARCHAR (25) NOT NULL,
PRIMARY KEY (IdPetugas));

CREATE TABLE anggota(
IdAnggota VARCHAR(10) NOT NULL,
Nama_Anggota VARCHAR(20) NOT NULL,
Angkatan_Anggota VARCHAR(20) NOT NULL,
Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
Tanggal_Lahir_Anggota DATE NOT NULL,
No_Telp INT(12) NOT NULL,
Jenis_Kelamin VARCHAR(15) NOT NULL,
Status_Pinjam VARCHAR(15),
PRIMARY KEY (IdAnggota));

CREATE TABLE buku (
Kode_Buku VARCHAR(10) NOT NULL,
Judul_Buku VARCHAR(45) NOT NULL,
Pengarang_Buku VARCHAR(30) NOT NULL,
Tahun_Buku VARCHAR(10) NOT NULL,
Jumlah_Buku VARCHAR(5) NOT NULL,
Status_Buku VARCHAR(10) NOT NULL,
Klasifikasi_Buku VARCHAR(20) NOT NULL,
PRIMARY KEY (Kode_Buku));

CREATE TABLE peminjaman(
Kode_Peminjaman VARCHAR(10) NOT NULL,
IdAnggota VARCHAR(10) NOT NULL,
IdPetugas VARCHAR(10) NOT NULL,
Tanggal_Pinjam DATE,
Tanggal_Kembali DATE,
Kode_Buku VARCHAR(10) NOT NULL,
PRIMARY KEY (Kode_Peminjaman),
FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku));

CREATE TABLE pengembalian(
Kode_Kembali VARCHAR(10) NOT NULL,
idAnggota VARCHAR(10) NOT NULL,
Kode_Buku VARCHAR(10) NOT NULL,
IdPetugas VARCHAR(10) NOT NULL,
Tanggal_Pinjam DATE NOT NULL,
Tanggal_Kembali DATE NOT NULL,
Denda VARCHAR(15),
PRIMARY KEY (Kode_Kembali),
FOREIGN KEY (IdAnggota) REFERENCES anggota(idAnggota),
FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku));

INSERT INTO petugas VALUES 
('001', 'Reza01', 'reza01', 'Reza Aditya'),
('002', 'Adit02', 'adit02', 'Aditya Putra'),
('003', 'Farah03', 'farah03', 'Farah Sahla'),
('004', 'Siti04', 'siti04', 'Siti Mustanik'),
('005', 'Putry05', 'putry05', 'Putry Pebriani');

INSERT INTO anggota VALUES 
('100', 'Sri Wahyuni', '2023', 'Bangkalan', '2002-09-01', 0812347891, 'Perempuan', 'Sudah Lama'),
('101', 'Ana Indria', '2024', 'Tangerang', '2002-10-02', 0893002889, 'Perempuan', 'Sudah Lama'),
('102', 'Dandi Suprapto', '2024', 'Bandung', '2001-12-12', 0832341550, 'Laki-Laki', 'Sudah Lama'),
('103', 'Yanu Aji', '2023', 'Tuban', '2001-09-10', 0812376219, 'Laki-Laki', 'Sudah Lama'),
('104', 'Panji Ardana', '2023', 'Semarang', '2001-05-09', 0823348907, 'Laki-Laki', 'Sudah Lama'),
('105', 'Pita Permatasari', '2024', 'Bojonegoro', '2001-05-12', 0815409723, 'Perempuan', 'Sudah Lama'),
('106', 'Arya Alindra', '2024', 'Kediri', '2001-04-29', 0878932014, 'Laki-Laki','Sudah Lama'),
('107', 'Rista Anggraini', '2023', 'Pasuruan', '2005-01-29', 0834210076, 'Perempuan', 'Baru'),
('108', 'Maya Puspitadara', '2024', 'Mojokerto', '2004-12-30', 0812308954, 'Perempuan', 'Baru'),
('109', 'Galih Andra', '2024', 'Lamongan', '2004-11-28', 0827899093, 'Laki-Laki', 'Baru'),
('110', 'Dewi Nurmalita', '2023', 'Surabaya', '2005-01-02', 0876542130, 'Perempuan', 'Baru');

INSERT INTO buku VALUES
('200', 'Miracle Number', 'Addit P; Budiarto', '2009', '10', 'ada', 'non-fiksi'),
('201', 'The Miracle Of Enzyme', 'Hiromi Shinya', '2012', '10', 'ada', 'non-fiksi'),
('202', 'The Miracle of hypnotic persuasion', 'Idrus Putra', '2017', '10', 'ada', 'non-fiksi'),
('203', 'Hipnotisme pribadi ', 'Lecron', '1986', '10', 'ada', 'non-fiksi'),
('204', 'State Of Wonder', 'Patchett, Ann', '2011', '5', 'ada', 'fiksi'),
('205', 'Manusia Bebas', 'Joyopuspito, Sumarsih', '2012', '5', 'ada', 'fiksi'),
('206', 'Love Story', 'Embun Pagi', '2015', '10', 'ada', 'fiksi'),
('207', 'Twins Love Story', 'Tasya Livia', '2016', '10', 'ada', 'fiksi'),
('208', 'Analogi Cinta Sendiri', 'Oka', '2012', '10', 'ada', 'non-fiksi'),
('209', 'Mekar dalam Prahara', 'Asnita Wati', '2018', '10', 'ada', 'non-fiksi'),
('210', 'Algoritma dan pemprograman menggunakan python', 'Muhammad Rapianto','2016', '10', 'ada', 'non-fiksi');


INSERT INTO peminjaman VALUES
('1', '100', '001', '2021-10-12', '2023-10-19', '200'),
('2', '101', '001', '2021-10-12', '2023-10-19', '201'),
('3', '103', '002', '2021-09-11', '2023-09-18', '206'),
('4', '102', '002', '2021-08-17', '2023-08-23', '210'),
('5', '104', '003', '2021-09-20', '2023-09-27', '210'),
('6', '105', '004', '2021-01-09', '2023-01-15', '210'),
('7', '106', '005', '2021-01-20', '2023-01-27', '208'),
('8', '107', '005', '2022-09-15', '2023-09-23', '210'),
('9', '108', '003', '2022-10-09', '2023-10-16', '210'),
('10', '109', '004', '2022-12-13', '2023-12-20', '204'),
('11', '103', '002', '2022-12-14', '2023-12-21', '204'),
('12', '103', '001', '2022-12-20', '2023-12-27', '205'),
('13', '103', '002', '2022-12-27', '2024-01-03', '201'),
('14', '103', '002', '2022-01-03', '2024-01-10', '203'),
('15', '103', '004', '2022-01-10', '2024-01-17', '201');
INSERT INTO peminjaman VALUES
('16', '100', '001', '2021-10-12', '2023-10-19', '200'),
('17', '101', '001', '2021-10-12', '2023-10-19', '201'),
('18', '103', '001', '2021-09-11', '2023-09-18', '206'),
('19', '102', '003', '2021-08-17', '2023-08-23', '210');

INSERT INTO pengembalian VALUES
('01', '100', '200', '001', '2024-10-12', '2025-10-19', '0'),
('02', '101', '201', '001', '2024-10-12', '2024-10-20', '10.000'),
('03', '103', '206', '002', '2024-09-11', '2025-09-13', '0'),
('04', '102', '210', '002', '2024-08-17', '2024-08-25', '20.000'),
('05', '104', '210', '003', '2024-09-20', '2024-09-29', '20.000'),
('06', '105', '210', '003', '2024-01-09', '2025-01-14', '0'),
('07', '106', '208', '005', '2024-01-20', '2025-01-25', '0'),
('08', '107', '210', '005', '2024-09-15', '2024-09-24', '10.000'),
('09', '108', '210', '003', '2024-10-09', '2024-10-18', '20.000'),
('10', '109', '204', '004', '2024-12-13', '2025-12-19', '0'),
('11', '103', '204', '002',  '2024-12-14', '2025-12-20', '0'),
('12', '103', '205', '001', '2024-12-20', '2025-12-27', '0'),
('13', '103', '201', '002', '2024-12-27', '2025-01-03', '0'),
('14', '103', '203', '002', '2024-01-03', '2025-01-10', '0'),
('15', '103', '201', '002', '2024-01-10', '2025-01-17', '0');


-- soal 1
DROP  PROCEDURE getNamaByJK;

DELIMITER //
CREATE PROCEDURE getNamaByJK(IN JenisKelamin VARCHAR(15))
BEGIN 
SELECT * FROM anggota
WHERE Jenis_Kelamin = JenisKelamin;
END //
DELIMITER ;

CALL getNamaByJK('Laki-Laki');


-- soal 2
DROP  PROCEDURE getKode;

DELIMITER //
CREATE PROCEDURE getKode(IN KodeBuku VARCHAR(10))
BEGIN 
SELECT * FROM buku
WHERE KodeBuku = Kode_Buku;
END //
DELIMITER ;

CALL getKode('207');

-- soal 3
DROP PROCEDURE duaParameter;

DELIMITER //
CREATE PROCEDURE duaParameter(
IN Nama VARCHAR (35),
IN jk VARCHAR(15))
BEGIN
SELECT * FROM anggota
WHERE Nama = Nama_Anggota AND
jk = Jenis_Kelamin;
END //
DELIMITER ;

CALL duaParameter('Sri Wahyuni', 'Perempuan');

-- soal 4

DROP PROCEDURE tigaParameter;

DELIMITER //
CREATE PROCEDURE tigaParameter(
IN KodeKembali VARCHAR (35),
IN IdAnggota VARCHAR(15),
IN KodeBuku VARCHAR (10))
BEGIN
SELECT * FROM pengembalian
WHERE KodeKembali = Kode_Kembali AND
IdAnggota = idAnggota AND
KodeBuku = Kode_Buku;
END //
DELIMITER ;

CALL tigaParameter('04', '102', '210');


-- soal 5

DROP PROCEDURE addData;
DELIMITER //
CREATE PROCEDURE addData(
IN IdPetugas INT (10),
IN Username VARCHAR(35),
IN PASSWORD VARCHAR (35),
IN Nama VARCHAR (35))
BEGIN
INSERT INTO petugas VALUES
(IdPetugas, Username, PASSWORD, Nama);
END //
DELIMITER ;
  
CALL addData (13, 'kkl', 'lkkll', 'L');
SELECT * FROM petugas;

-- soal 6

DELIMITER //
CREATE PROCEDURE jmlPinjam(OUT jumlah_pinjam INT(2))
BEGIN
SELECT COUNT(Kode_Peminjaman)
INTO jumlah_pinjam FROM peminjaman;
END //
DELIMITER ;

CALL jmlPinjam(@jumlah_pinjam);
SELECT @jumlah_pinjam;

-- soal 7

DROP PROCEDURE countByGender;
DELIMITER //
CREATE PROCEDURE countByGender(
IN gender VARCHAR(15),
OUT total INT(3))
BEGIN
SELECT COUNT(idAnggota)
INTO total
FROM anggota
WHERE Jenis_Kelamin = gender;
END //
DELIMITER ;

CALL countByGender ('Laki-Laki', @total);
SELECT @total;
SELECT * FROM anggota;
