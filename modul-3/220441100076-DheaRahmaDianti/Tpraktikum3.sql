CREATE DATABASE library;

USE library;

CREATE TABLE IF NOT EXISTS anggota (
idAnggota VARCHAR(10) PRIMARY KEY NOT NULL,
Nama_Anggota VARCHAR(20) NOT NULL,
Angkatan_Anggota VARCHAR(6) NOT NULL,
Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
Tanggal_Lahir_Anggota DATE NOT NULL,
No_Telp INT(12) NOT NULL,
Jenis_Kelamin VARCHAR(15) NOT NULL,
Status_Pinjam VARCHAR(15) NOT NULL);

DESC anggota;
DROP TABLE anggota;

CREATE TABLE IF NOT EXISTS buku (
Kode_Buku VARCHAR(10) NOT NULL PRIMARY KEY,
Judul_Buku VARCHAR(25) NOT NULL,
Pengarang_Buku VARCHAR(30) NOT NULL,
Penerbit_Buku VARCHAR(30) NOT NULL,
Tahun_Buku VARCHAR(10) NOT NULL,
Jumlah_Buku INT(50) NOT NULL,
Status_Buku VARCHAR(10) NOT NULL,
Klasifikasi_Buku VARCHAR(20) NOT NULL);

DROP TABLE buku;

CREATE TABLE IF NOT EXISTS petugas (
idPetugas VARCHAR(10) NOT NULL PRIMARY KEY,
Username VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
Nama VARCHAR(25) NOT NULL);

SELECT * FROM petugas;
DROP TABLE petugas;

CREATE TABLE IF NOT EXISTS peminjaman (
Kode_Peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
idAnggota VARCHAR(10) NOT NULL,
idPetugas VARCHAR(10) NOT NULL,
Tanggal_Pinjam DATE NOT NULL,
Tanggal_Kembali DATE NOT NULL,
Kode_Buku VARCHAR(10) NOT NULL,
FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku));

DESC peminjaman;

ALTER TABLE library.peminjaman ADD CONSTRAINT fk_idAnggota 
FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);
ALTER TABLE library.peminjaman ADD CONSTRAINT fk_idPetugas 
FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);
ALTER TABLE library.peminjaman ADD CONSTRAINT fk_Kode_Buku 
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku);

DROP TABLE peminjaman;

CREATE TABLE IF NOT EXISTS pengembalian (
Kode_Kembali VARCHAR(10) NOT NULL PRIMARY KEY,
idAnggota VARCHAR(10) NOT NULL,
Kode_Buku VARCHAR(10) NOT NULL,
idPetugas VARCHAR(10) NOT NULL,
Tgl_Pinjam DATE NOT NULL,
Tgl_Kembali DATE NOT NULL,
Denda VARCHAR(15) NOT NULL,
FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku));

DESC pengembalian;

ALTER TABLE library.pengembalian ADD CONSTRAINT fk_idAnggota 
FOREIGN KEY (id_Anggota) REFERENCES anggota(idAnggota);
ALTER TABLE library.pengembalian ADD CONSTRAINT fk_idPetugas 
FOREIGN KEY (id_Petugas) REFERENCES petugas(idPetugas);
ALTER TABLE library.pengembalian ADD CONSTRAINT fk_Kode_Buku 
FOREIGN KEY (KodeBuku) REFERENCES buku(Kode_Buku);

DROP TABLE pengembalian;
DESC pengembalian;

INSERT INTO anggota VALUES 
('111', 'Dhea', '2022', 'Bojoonegoro', '2004-05-23', 085745631833, 'Perempuan', 'Pinjam'),
('112', 'Dita', '2022', 'Nganjuk', '2003-10-16', 085672416272, 'Perempuan', 'Pinjam'),
('113', 'Edith', '2021', 'Sidoarjo', '2003-07-31', 087543687654, 'Laki-Laki', 'Pinjam'),
('114', 'Rosyid', '2021', 'Mojokerto', '2003-02-14', 085232210097, 'Laki-Laki', 'Pinjam'),
('115', 'Reva', '2020', 'Sidoarjo', '2002-06-17', 082331567453, 'Perempuan', 'Pinjam'),
('116', 'Cindy', '2020', 'Pasuruan', '2002-11-13', 085422130998, 'Perempuan', 'Pinjam'),
('117', 'Devi', '2020', 'Lamongan', '2002-04-16', 082188977101, 'Perempuan', 'Pinjam'),
('118', 'Angga', '2019', 'Kamal', '2001-09-10', 086548903219, 'Laki-Laki', 'Pinjam');

SELECT * FROM anggota;

INSERT INTO petugas VALUES
('910', 'zlfa7', 'zf123', 'zulfa'),
('920', 'devidw23', 'dwi11', 'devi'),
('930', 'haidar02', 'hdrhzm76', 'haidar'),
('940', 'enyaaa', 'ebi65', 'enya'),
('950', 'frida19', 'fr1203', 'frida'),
('960', 'della44', '040103', 'della'),
('970', 'afitadw3', 'dwi02', 'afita'),
('980', 'ndadriana', 'nad06', 'nadiya');

SELECT * FROM petugas;

INSERT INTO buku VALUES
('B201', 'Cantik Itu Luka', 'Eka Kurniawan', 'Gramedia Pustaka Utama', '2016', 45, 'Lama', 'Novel Fiksi'),
('B202', 'Laut Bercerita', 'Leila S.Chudori', 'Kepustakaan Populer Gramedia', '2020', 30, 'Lama', 'Novel Fiksi'),
('B203', 'Bumi Manusia', 'Ananta Toer', 'Lentera Dipantara', '2015', 20, 'Lama', 'Sejarah'),
('B204', '172 Days', 'Nadzira Shafa', 'Motivaksi Inspira', '2022', 40, 'Terbaru', 'Novel'),
('B205', 'ILY', 'Tere Liye', 'Sabakgrip', '2023', 50, 'Terbaru', 'Novel Fiksi'),
('B206', 'Loneliness', 'Alvi Syahrin', 'Kawah Media', '2022', 32, 'Terbaru', 'Novel'),
('B207', 'Hujan', 'Tere Liye', 'Penerbit Sabak Grip', '2022', 25, 'Terbaru', 'Novel');

SELECT * FROM buku;

INSERT INTO peminjaman VALUES 
('301', '111', '910', '2024-03-21', '2024-03-29', 'B202'),
('302', '113', '920', '2024-03-25', '2024-03-30', 'B206'),
('303', '112', '960', '2024-03-30', '2024-04-03', 'B205'),
('304', '113', '910', '2024-04-01', '2024-04-09', 'B202'),
('305', '112', '970', '2024-04-02', '2024-04-07', 'B204'),
('306', '114', '930', '2024-03-31', '2024-04-03', 'B207'),
('307', '112', '920', '2004-04-04', '2024-04-12', 'B201'),
('308', '112', '940', '2024-04-05', '2024-04-11', 'B207'),
('309', '115', '910', '2024-04-02', '2024-04-10', 'B203'),
('310', '112', '910', '2024-04-15', '2024-04-20', 'B204'),
('311', '116', '950', '2024-04-03', '2024-04-11', 'B207'),
('312', '112', '920', '2024-04-20', '2024-04-25', 'B202');


DROP TABLE peminjaman;
SELECT * FROM peminjaman;

INSERT INTO pengembalian VALUES 
('401', '111', 'B202', '910', '2024-03-21', '2024-03-29', '2000'),
('402', '113', 'B206', '920', '2024-03-25', '2024-03-30', '0'),
('403', '112', 'B205', '960', '2024-03-30', '2024-04-03', '0'),
('404', '113', 'B202', '910', '2024-04-01', '2024-04-09', '2000'),
('405', '112', 'B204', '970', '2024-04-02', '2024-04-07', '0'),
('406', '114', 'B207', '930', '2024-03-31', '2024-04-03', '0'),
('407', '112', 'B201', '920', '2004-04-04', '2024-04-12', '2000'),
('408', '112', 'B207', '940', '2024-04-05', '2024-04-11', '0'),
('409', '115', 'B203', '910', '2024-04-02', '2024-04-10', '2000'),
('410', '112', 'B204', '910', '2024-04-15', '2024-04-20', '0'),
('411', '116', 'B207', '950', '2024-04-03', '2024-04-11', '2000'),
('412', '112', 'B202', '920', '2024-04-20', '2024-04-25', '0');

-- SOAL NO 1 --

DELIMITER //
CREATE PROCEDURE getInDefault(IN kode VARCHAR(100))
BEGIN 
	SELECT * FROM buku WHERE Kode_Buku = kode; 
END // 
DELIMITER;

CALL getInDefault('B205');

DROP PROCEDURE getInDefault;

-- SOAL NO2 --

DELIMITER //
CREATE PROCEDURE getAnggota(IN id_anggota VARCHAR(100))
BEGIN 
	SELECT * FROM anggota WHERE idAnggota = id_anggota; 
END // 
DELIMITER;

CALL getAnggota('111');
DROP PROCEDURE getAnggota;

-- SOAL NO 3 --

DELIMITER //
CREATE PROCEDURE getAnggotaPinjam(IN id_anggota VARCHAR(100), IN kodeBuku VARCHAR(10))
BEGIN 
	SELECT * FROM peminjaman WHERE idAnggota = id_anggota AND Kode_Buku = kodeBuku; 
END // 
DELIMITER;

CALL getAnggotaPinjam('111', 'B202');
DROP PROCEDURE getAnggotaPinjam;

-- SOAL NO 4 --

DELIMITER //
CREATE PROCEDURE getPengembalian(
	IN idPengembalian VARCHAR(100), 
	IN kodeBuku VARCHAR(10),
	IN id_Petugas VARCHAR (10))
BEGIN 
	SELECT * FROM pengembalian WHERE Kode_Kembali = idPengembalian 
	AND Kode_Buku = kodeBuku 
	AND idPetugas = id_petugas; 
END // 
DELIMITER;

CALL getPengembalian('406', 'B207', '930');
DROP PROCEDURE getPengembalian;

-- SOAL NO 5 --

DELIMITER // 
CREATE PROCEDURE insertBuku(
 IN kodeBuku VARCHAR(200),
 IN judul VARCHAR(100),
 IN pengarang VARCHAR(100),
 IN penerbit VARCHAR(100),
 IN tahun VARCHAR(100),
 IN jmlBuku INT(100),
 IN statusBuku VARCHAR(100),
 IN klasifikasi VARCHAR(100)
)
BEGIN
	INSERT INTO buku 
	VALUES (kodeBuku, judul, pengarang, penerbit, tahun, jmlBuku, statusBuku, klasifikasi);
END//
DELIMITER;

CALL insertBuku('B208', 'Home Sweet Loan', 'Almira Bastari', 'Gramedia Pustaka Utama', '2022', '10', 'Terbaru', 'Novel');
DROP PROCEDURE insertBuku;

-- SOAL NO 6 --

DELIMITER //
CREATE PROCEDURE banyakBuku(
	OUT jumlahBuku INT  
)
BEGIN
	SELECT COUNT(*) INTO jumlahBuku FROM buku;
END //
DELIMITER;

CALL banyakBuku(@jumlahBuku);
SELECT @jumlahBuku;
DROP PROCEDURE banyakBuku;

-- SOAL NO 7 --

DELIMITER //
CREATE PROCEDURE banyakStok(
	INOUT banyakStok INT,
	IN kodeBuku VARCHAR(100)
)
BEGIN
	SET banyakStok = banyakStok+10;
	UPDATE jumlahStok SET Jumlah_Buku = banyakStok;
END //
DELIMITER;

CALL banyakStok(@JumlahStok, 'B208');
SELECT @banyakStok AS 'Jumlah buku setelah di tambahkan';