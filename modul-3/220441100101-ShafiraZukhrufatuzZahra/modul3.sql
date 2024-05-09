CREATE DATABASE perpustakaan;
USE perpustakaan;


CREATE TABLE IF NOT EXISTS buku(
Kode_Buku INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
Judul_Buku VARCHAR (25),
Pengarang_Buku VARCHAR (30),
Penerbit_Buku VARCHAR (30),
Tahun_Buku VARCHAR (10),
Jumlah_Buku VARCHAR (5),
Status_Buku VARCHAR (10),
Klasifikasi_Buku VARCHAR (20)
);

CREATE TABLE IF NOT EXISTS petugas(
IdPetugas INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
Username VARCHAR (15),
PASSWORD VARCHAR (15),
Nama VARCHAR (25)
);

CREATE TABLE IF NOT EXISTS anggota(
IdAnggota INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nama_Anggota VARCHAR (20),
Angkatan_Anggota VARCHAR (6),
Tempat_Lahir_Anggota VARCHAR (20),
Tanggal_Lahir_Anggota DATE,
No_Telp INT (12),
Jenis_Kelamin VARCHAR (15),
Status_Pinjam VARCHAR (15)
);

CREATE TABLE IF NOT EXISTS pengembalian(
Kode_Kembali INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
IdAnggota INT (10),
Kode_Buku INT (10),
IdPetugas INT (10),
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Denda VARCHAR (15),
FOREIGN KEY (IdAnggota) REFERENCES anggota (IdAnggota),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku),
FOREIGN KEY (IdPetugas) REFERENCES petugas (IdPetugas)
);

CREATE TABLE IF NOT EXISTS peminjaman(
Kode_Peminjaman INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
IdAnggota INT (10),
Kode_Buku INT (10),
IdPetugas INT (10),
Tanggal_Pinjam DATE,
Tanggal_Kembali DATE
FOREIGN KEY (IdAnggota) REFERENCES anggota (IdAnggota),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku),
FOREIGN KEY (IdPetugas) REFERENCES petugas (IdPetugas)
);

INSERT INTO anggota(Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('shafira', 'angkatan22', 'Surabaya', '2004-03-16', 6214748364, 'Pr', 'tidak'),
('novia', 'angkatan18', 'Surabaya', '1999-11-21', 6214483647, 'Pr', 'tidak'),
('izzul', 'angkatan18', 'Surabaya', '2000-06-13', 6214748362, 'Lk', 'iya'),
('aldi', 'angkatan23', 'Surabaya', '2004-07-18', 6214748363, 'Lk', 'iya'),
('amelia', 'angkatan22', 'Lamongan', '2004-09-06', 6214783648, 'Pr', 'iya'),
('devi dwi', 'angkatan22', 'Lamongan', '2004-09-18', 6214483668, 'Pr', 'iya'),
('adelia', 'angkatan22', 'Sidoarjo', '2004-09-24', 621474836, 'Pr', 'iya'),
('arum', 'angkatan22', 'Pasuruan', '2004-10-24', 6214742379, 'Pr', 'tidak'); 
SELECT * FROM anggota;

INSERT INTO petugas (Username, PASSWORD, Nama) VALUES
('thv', 'kth9512', 'Kim Taehyung'),
('rkive', 'knj9409', 'Kim Namjoon'),
('jin', 'ksj9212', 'Kim Seokjin'),
('uarmyhope', 'jjh9402', 'Jung Hoseok'),
('j.m', 'pjm9510', 'Park Jimin'),
('agustd', 'myg9303', 'Min Yoongi'),
('abjkmrsty', 'jjk9709', 'Jeon Jungkook');
SELECT * FROM petugas;

INSERT INTO buku (Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
('The Great Gatsby','F. Scott Fitzgerald','Scribner','1925','5','Tersedia','Fiksi Klasik'),
('To Kill a Mockingbird','Harper Lee','J.B. Lippincott & Co.','1960','7','Tersedia','Fiksi Klasik'),
('Pride and Prejudice','Jane Austen','T. Egerton, Whitehall','1813','6','Tersedia','Fiksi Klasik'),
('The Catcher in the Rye','J.D. Salinger','Little, Brown and Company','1951','4','Tersedia','Fiksi Klasik'),
('Me Before You','Jojo Moyes','Pamela Dorman Books','2012','5','Tersedia','Romansa'),
('The Notebook','Nicholas Sparks','Warner Books','1996','3','Tersedia','Romansa'),
('The Girl with the Dragon Tattoo','Stieg Larsson','Norstedts Förlag','2005','8','Tersedia','Thriller'),
('The Silent Patient','Alex Michaelides','Celadon Books','2019','7','Tersedia','Thriller');
SELECT * FROM buku;

INSERT INTO  peminjaman (IdAnggota, Kode_Buku, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali) VALUES 
(1, 1, 1, '2024-01-01', '2024-01-08'),
(2, 3, 7, '2024-01-02', '2024-01-09'),
(3, 2, 7, '2024-01-02', '2024-01-09'),
(4, 2, 2, '2024-01-03', '2024-01-10'),
(5, 8, 2, '2024-01-03', '2024-01-10'),
(6, 2, 2, '2024-01-03', '2024-01-10'),
(7, 4, 4, '2024-01-04', '2024-01-11'),
(8, 8, 3, '2024-01-05', '2024-01-12'),
(1, 7, 1,'2024-01-08', '2024-01-15'),
(2, 6, 7, '2024-01-09', '2024-01-16'),
(6, 1, 2, '2024-01-10', '2024-01-17'),
(7, 4, 4, '2024-01-11', '2024-01-18'),
(6, 5, 2, '2024-01-17', '2024-01-24'),
(6, 4, 2, '2024-01-24', '2024-01-31'),
(6, 3, 2, '2024-01-31', '2024-02-07'),
(1, 5, 6, '2024-02-02', '2024-02-09'),
(1, 5, 6, '2024-03-09', '2024-03-16'),
(3, 6, 5, '2024-03-29', '2024-04-05'),
(4, 4, 5, '2024-03-29', '2024-04-05'),
(5, 7, 5, '2024-03-29', '2024-04-05'),
(6, 8, 5, '2024-03-29', '2024-04-05'),
(7, 6, 5, '2024-03-29', '2024-04-05');
SELECT * FROM peminjaman;

INSERT INTO  pengembalian (IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES 
(1, 1, 1, '2024-01-01', '2024-01-08', 'Rp.0'),
(2, 3, 7, '2024-01-02', '2024-01-10', 'Rp.1000' ),
(3, 2, 7, '2024-01-02', '2024-01-13', 'Rp.4000'),
(4, 2, 2, '2024-01-03', '2024-01-10', 'Rp.0'),
(5, 8, 2, '2024-01-03', '2024-01-11', 'Rp.1000'),
(6, 2, 2, '2024-01-03', '2024-01-10', 'Rp.0'),
(7, 4, 4, '2024-01-04', '2024-01-11', 'Rp.0'),
(8, 8, 3, '2024-01-05', '2024-01-12', 'Rp.0'),
(1, 7, 1,'2024-01-08', '2024-01-17', 'Rp.1000'),
(2, 6, 7, '2024-01-09', '2024-01-16', 'Rp.0'),
(6, 1, 2, '2024-01-10', '2024-01-17', 'Rp.0'),
(7, 4, 4, '2024-01-11', '2024-01-20', 'Rp.1000'),
(6, 5, 2, '2024-01-17', '2024-01-24', 'Rp.0'),
(6, 4, 2, '2024-01-24', '2024-01-31', 'Rp.0'),
(6, 3, 2, '2024-01-31', '2024-02-07', 'Rp.0'),
(1, 5, 6, '2024-02-02', '2024-02-09', 'Rp.0'),
(1, 5, 6, '2024-03-09', '2024-03-18', 'Rp.3000'),
(3, 6, 5, '2024-03-29', '2024-04-05', 'Rp.0'),
(4, 4, 5, '2024-03-29', '2024-04-05', 'Rp.0'),
(5, 7, 5, '2024-03-29', '2024-04-05', 'Rp.0'),
(6, 8, 5, '2024-03-29', '2024-04-05', 'Rp.0'),
(7, 6, 5, '2024-03-29', '2024-04-07', 'Rp.2000');
SELECT * FROM pengembalian;

--1. Buatlah sebuah PROCEDURE dengan menggunakan parameter IN DEFAULT--
DELIMITER //  
CREATE PROCEDURE getCekBuku (IN kode VARCHAR (100))
BEGIN
 SELECT * FROM buku WHERE kode_buku = kode;
END // 
DELIMITER;
CALL getCekBuku(2);

--2. Definisikan STORED PROCEDURE untuk mengetahui DATA pada salah satu TABLE dengan berdasarkan pada salah satu atribut/FIELD--
DELIMITER //  
CREATE PROCEDURE getPetugas (IN userpetugas VARCHAR (100))
BEGIN
 SELECT * FROM petugas WHERE Username = userpetugas;
END // 
DELIMITER;
CALL getPetugas('thv');

--3. Definisikan STORED PROCEDURE untuk mengetahui DATA pada salah satu TABLE dengan berdasarkan pada dua atribut/FIELD--
DELIMITER //
CREATE PROCEDURE getBuku(IN statusbuku VARCHAR(20),IN klasifikasi VARCHAR (20))
BEGIN
 SELECT * FROM buku WHERE Status_Buku = statusbuku AND Klasifikasi_Buku = klasifikasi;
END// 
DELIMITER;
CALL getBuku ('Tersedia', 'Thriller');

--4.Definisikan STORED PROCEDURE untuk mengetahui DATA pada salah satu TABLE dengan berdasarkan pada tiga atribut/FIELD--
DELIMITER //
CREATE PROCEDURE getAnggota(IN tempatlahir VARCHAR(20),IN angkatan VARCHAR (10), IN statuspinjam VARCHAR (100))
BEGIN
 SELECT * FROM anggota WHERE Tempat_Lahir_Anggota = tempatlahir AND Angkatan_Anggota = angkatan AND Status_Pinjam = statuspinjam;
END// 
DELIMITER;
CALL getAnggota ('Lamongan', 2022, 'iya');

--5.Definisikan STORED PROCEDURE untuk memasukkan DATA pada salah satu TABLE--
DELIMITER //
CREATE PROCEDURE insertToPeminjaman (
IN peminjaman INT (10),
IN anggota INT (10),
IN buku INT (10),
IN petugas INT (10),
IN tanggalpinjam DATE,
IN tanggalkembali DATE)
BEGIN 
 INSERT INTO peminjaman
 VALUES (peminjaman, anggota, buku, petugas, tanggalpinjam, tanggalkembali);
END //
DELIMITER;
CALL insertToPeminjaman (23, 1, 4, 3, '2024-04-30', '2024-05-07');
select * from peminjaman;

--6.Definisikan STORED PROCEDURE untuk mengetahui DATA pada salah satu TABLE menggunakan parameter OUT--
DELIMITER //
CREATE PROCEDURE bnykPeminjam(
 OUT banyakPeminjamBuku INT
)
BEGIN
 SELECT COUNT(*) INTO banyakPeminjamBuku FROM peminjaman;
END//
DELIMITER;
CALL bnykPeminjam(@banyakPeminjamBuku);
SELECT @banyakPeminjamBuku;

--7.Definisikan STORED PROCEDURE untuk mengetahui DATA pada salah satu TABLE menggunakan parameter INOUT--
DELIMITER //
CREATE PROCEDURE tambahStok(
 INOUT tambahStok INT,
 IN kodebuku INT)
BEGIN 
 SET tambahStok = tambahStok + 3;
 UPDATE buku SET Jumlah_Buku = tambahStok WHERE Kode_Buku = kodebuku;
END //
DELIMITER ;
SET @stokbuku = 5;
CALL tambahStok(@stokbuku, 1);
SELECT @stokbuku AS 'Stok buku setelah ditambah';

