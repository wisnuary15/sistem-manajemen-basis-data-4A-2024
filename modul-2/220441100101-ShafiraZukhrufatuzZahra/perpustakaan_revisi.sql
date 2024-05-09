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

CREATE VIEW vw_petugas AS SELECT
CONCAT("Id ", perpustakaan.petugas.IdPetugas)AS ID,
CONCAT (" " ,perpustakaan.petugas.Username)AS USER,
CONCAT ("  " ,perpustakaan.petugas.Password)AS Pass,
CONCAT ("  " ,perpustakaan.petugas.Nama)AS Nama FROM perpustakaan.petugas;
SELECT * FROM vw_petugas;

CREATE VIEW vw_petugas_Pinjam AS
SELECT p.Kode_Peminjaman, p.IdAnggota, p.Kode_Buku, p.Tanggal_Pinjam, p.Tanggal_Kembali, c.Username, c.Nama
FROM peminjaman p JOIN petugas c ON p.IdPetugas = c.IdPetugas;
SELECT * FROM vw_petugas_Pinjam;

--1. definisikan VIEW untuk mendapatkan DATA anggota yang hanya meminjam buku lebih dari 5 buku!--
CREATE VIEW vw_peminjamlebihdari5buku AS
SELECT a.Nama_Anggota, COUNT(*) AS Jumlah_Peminjaman FROM peminjaman p JOIN anggota a ON p.IdAnggota=a.IdAnggota GROUP BY a.Nama_Anggota HAVING COUNT(*) > 5;
SELECT * FROM vw_peminjamlebihdari5buku;

--2. definisikan VIEW petugas yang melakukan transaksi (peminjaman/pengembalian) beserta jumlah buku yang terpinjam ketika petugas tersebut bertugas!--
CREATE VIEW vw_transaksi AS
SELECT pt.Username, pt.Nama, COUNT(pj.Kode_Peminjaman) AS Jumlah_Peminjaman, COUNT(*) AS Jumlah_Transaksi FROM petugas pt JOIN peminjaman pj ON pt.IdPetugas = pj.IdPetugas
JOIN pengembalian pb ON pt.IdPetugas = pb.IdPetugas GROUP BY pt.Username, pt.Nama;
SELECT * FROM vw_transaksi;

--3. Definisikan VIEW dari nomor 2 hanya petugas yang melayani terbanyak--
CREATE VIEW vw_transaksiterbnyak AS 
SELECT pt.Username, pt.Nama, COUNT(*) AS Transaksi FROM petugas pt JOIN peminjaman pj ON pt.IdPetugas = pj.IdPetugas JOIN pengembalian pb ON pt.IdPetugas = pb.IdPetugas GROUP BY pt.Username, pt.Nama ORDER BY Transaksi DESC LIMIT 1;
SELECT * FROM vw_transaksiterbnyak;

--4. Definisikan VIEW buku yang terpinjam paling banyak--
CREATE VIEW vw_bukuterpinjam AS
SELECT b.Judul_Buku, COUNT(*) AS Terpinjam FROM Buku b JOIN peminjaman p ON b.Kode_Buku=p.Kode_Buku GROUP BY b.Judul_Buku ORDER BY Terpinjam DESC LIMIT 1;
SELECT * FROM vw_bukuterpinjam;