CREATE DATABASE perpustakaan;

USE perpustakaan; 
CREATE TABLE buku (
Kode_Buku VARCHAR (100) NOT NULL PRIMARY KEY,
Judul_Buku VARCHAR(100) NOT NULL,
Pengarang_Buku VARCHAR(100) NOT NULL,
Penerbit_Buku VARCHAR(100) NOT NULL,
Tahun_Buku VARCHAR (100) NOT NULL,
Jumlah_Buku VARCHAR (100)NOT NULL,
Status_Buku VARCHAR(100) NOT NULL,
Klasifikasi_Buku VARCHAR(200) NOT NULL
);
CREATE TABLE petugas (
IdPetugas VARCHAR(200) NOT NULL PRIMARY KEY,
Username VARCHAR(200) NOT NULL ,
Passwordd VARCHAR(100) NOT NULL,
Nama VARCHAR(250) NOT NULL 
);
CREATE TABLE anggota (
IdAnggota VARCHAR(250) NOT NULL PRIMARY KEY,
Nama_Anggota VARCHAR(250) NOT NULL,
Angkatan_Anggota VARCHAR(250) NOT NULL ,
Tempat_Lahir_Anggota VARCHAR(250) NOT NULL,
Tanggal_Lahir_Anggota DATE,
No_Telp INT NOT NULL,
Jenis_Kelamin VARCHAR(100) NOT NULL ,
Status_Pinjam VARCHAR(150) NOT NULL
);
CREATE TABLE pengembalian (
Kode_Kembali VARCHAR(100) NOT NULL PRIMARY KEY,
IdAnggota VARCHAR(250) NOT NULL,
Kode_Buku VARCHAR(100) NOT NULL,
IdPetugas VARCHAR(100) NOT NULL,
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Denda VARCHAR(150) NOT NULL 
);
CREATE TABLE peminjaman (
Kode_Peminjaman VARCHAR(100) NOT NULL PRIMARY KEY ,
IdAnggota VARCHAR(250) NOT NULL ,
IdPetugas VARCHAR(100) NOT NULL ,
Tanggal_Pinjam DATE,
Tanggal_Kembali DATE,
Kode_Buku VARCHAR(100) NOT NULL
);

ALTER TABLE peminjaman 
ADD CONSTRAINT FK_AnggotaPinjam 
FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota);
 
ALTER TABLE peminjaman 
ADD CONSTRAINT FK_PetugasPeminjaman 
FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas);
 
ALTER TABLE peminjaman 
ADD CONSTRAINT FK_BukuDipinjam 
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku);
 
ALTER TABLE pengembalian 
ADD CONSTRAINT FK_AnggotaKembali 
FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota);
 
ALTER TABLE pengembalian 
ADD CONSTRAINT FK_BukuDikembalikan 
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku);
 
ALTER TABLE pengembalian 
ADD CONSTRAINT FK_PetugasPengembalian 
FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas);

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku,Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES 
('B001', 'Belajar SQL Dasar', 'Ahmad Yani', 'Pustaka Media', '2020', '5', 'Tersedia', 'Teknologi'),
('B002', 'Pemrograman Python', 'Budi Santoso', 'Gramedia Pustaka', '2019', '7', 'Tersedia', 'Teknologi'),
('B003', 'Dasar-Dasar Pemrograman', 'Cahyo Putro', 'Erlangga', '2021', '4', 'Tidak Tersedia', 'Teknologi'),
('B004', 'Kisah 1001 Malam', 'Dewi Lestari', 'Mizan', '2018', '3', 'Tersedia', 'Fiksi'),
('B005', 'Pantun Nusantara', 'Erwin Rudianto', 'Bentang Pustaka', '2022', '6', 'Tersedia', 'Puisi'),
('B006', 'Ekonomi Makro', 'Faisal Basri', 'Kencana Prenada Media Group', '2017', '2', 'Tidak Tersedia', 'Ekonomi'),
('B007', 'Biografi Soekarno', 'Gus Dur', 'Buku Kita', '2019', '5', 'Tersedia', 'Biografi'),
('B008', 'Kalkulus Dasar', 'Hermawan Kertajaya', 'Andi Offset', '2020', '4', 'Tersedia', 'Matematika'),
('B009', 'Sejarah Indonesia', 'I Gusti Ngurah', 'Pustaka Pelajar', '2015', '7', 'Tersedia', 'Sejarah'),
('B010', 'Seni Rupa Modern', 'Joko Widodo', 'Grafindo Media Pratama', '2021', '3', 'Tidak Tersedia', 'Seni'),
('B011', 'Teknik Jaringan Komputer', 'Kresna Aditya', 'Elex Media Komputindo', '2018', '6', 'Tersedia', 'Teknologi'),
('B012', 'Manajemen Sumber Daya Manusia', 'Lia Yulianti', 'Salemba Empat', '2019', '5', 'Tersedia', 'Manajemen'),
('B013', 'Filsafat Hidup', 'Muhammad Syafii', 'PT Balai Pustaka', '2020', '4', 'Tersedia', 'Filsafat'),
('B014', 'Desain Grafis', 'Nina Kartika', 'Penerbit Andi', '2022', '2', 'Tidak Tersedia', 'Desain'),
('B015', 'Biologi Sel', 'Otong Surotong', 'Erlangga For Kids', '2017', '5', 'Tersedia', 'Biologi');

INSERT INTO petugas (IdPetugas, Username, Passwordd, Nama) VALUES
('P001', 'admin1', 'pass123', 'Ahmad Fauzi'),
('P002', 'admin2', 'pass456', 'Budi Raharjo'),
('P003', 'admin3', 'pass789', 'Cahya Wijaya'),
('P004', 'admin4', 'pass101', 'Dewi Lestari'),
('P005', 'admin5', 'pass112', 'Eko Saputra'),
('P006', 'admin6', 'pass131', 'Faisal Basri'),
('P007', 'admin7', 'pass415', 'Gita Wirawan'),
('P008', 'admin8', 'pass161', 'Hana Indriani'),
('P009', 'admin9', 'pass718', 'Irfan Haris'),
('P010', 'admin10', 'pass191', 'Joko Santoso'),
('P011', 'admin11', 'pass112', 'Krisna Suhendra'),
('P012', 'admin12', 'pass319', 'Lia Yulianti'),
('P013', 'admin13', 'pass441', 'Mira Wijaya'),
('P014', 'admin14', 'pass552', 'Nia Ayu'),
('P015', 'admin15', 'pass663', 'Otong Surotong');

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('A001', 'Agus Setiawan', '2019', 'Jakarta', '1995-05-15', 08123456789, 'Laki laki', 'Tidak Meminjam'),
('A002', 'Bunga Citra', '2020', 'Bandung', '1998-07-10', 08234567890, 'Perempuan', 'Meminjam'),
('A003', 'Cahyo Prasetyo', '2018', 'Surabaya', '1994-11-20', 08345678901, 'Laki-laki', 'Meminjam'),
('A004', 'Dini Lestari', '2017', 'Semarang', '1993-09-25', 08456789012, 'Perempuan', 'Tidak Meminjam'),
('A005', 'Eko Wijaya', '2019', 'Yogyakarta', '1996-03-05', 08567890123, 'Laki laki', 'Meminjam'),
('A006', 'Fira Azzahra', '2020', 'Makassar', '1999-01-12', 08678901234, 'Perempuan', 'Meminjam'),
('A007', 'Gilang Ramadhan', '2018', 'Medan', '1992-12-28', 08789012345, 'Laki-laki', 'Tidak Meminjam'),
('A008', 'Hana Fitri', '2017', 'Palembang', '1991-08-14', 08890123456, 'Perempuan', 'Meminjam'),
('A009', 'Irfan Hidayat', '2019', 'Balikpapan', '1997-04-30', 08901234567, 'Laki-laki', 'Tidak Meminjam'),
('A010', 'Jeni Susanti', '2020', 'Padang', '2000-02-18', 08112345678, 'Perempuan', 'Meminjam'),
('A011', 'Krisna Suhendra', '2018', 'Samarinda', '1995-06-22', 08223456789, 'Laki-laki', 'Meminjam'),
('A012', 'Lina Agustina', '2017', 'Pekanbaru', '1990-10-09', 08334567890, 'Perempuan', 'Tidak Meminjam'),
('A013', 'Mira Wijaya', '2019', 'Denpasar', '1996-08-17', 08445678901, 'Perempuan', 'Meminjam'),
('A014', 'Nina Kartika', '2020', 'Cirebon', '1998-05-29', 08556789012, 'Perempuan', 'Tidak Meminjam'),
('A015', 'Otong Surotong', '2018', 'Tangerang', '1994-01-04', 08667890123, 'Laki-laki', 'Meminjam');

INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, 
IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('PK001', 'A001', 'B001', 'P001', '2024-03-01', '2024-03-10', '0'),
('PK002', 'A002', 'B002', 'P002', '2024-02-15', '2024-02-25', '5000'),
('PK003', 'A003', 'B003', 'P003', '2024-01-10', '2024-01-20', '0'),
('PK004', 'A004', 'B004', 'P004', '2024-03-20', '2024-03-30', '0'),
('PK005', 'A005', 'B005', 'P005', '2024-02-10', '2024-02-20', '0'),
('PK006', 'A006', 'B006', 'P006', '2024-01-05', '2024-01-15', '2000'),
('PK007', 'A007', 'B007', 'P007', '2024-03-05', '2024-03-15', '0'),
('PK008', 'A008', 'B008', 'P008', '2024-02-20', '2024-02-28', '0'),
('PK009', 'A009', 'B009', 'P009', '2024-01-15', '2024-01-25', '1000'),
('PK010', 'A010', 'B010', 'P010', '2024-03-10', '2024-03-20', '0'),
('PK011', 'A011', 'B011', 'P011', '2024-02-05', '2024-02-15', '0'),
('PK012', 'A012', 'B012', 'P012', '2024-01-25', '2024-02-05', '1500'),
('PK013', 'A013', 'B013', 'P013', '2024-03-15', '2024-03-25', '0'),
('PK014', 'A014', 'B014', 'P014', '2024-02-20', '2024-02-28', '0'),
('PK015', 'A015', 'B015', 'P015', '2024-01-10', '2024-01-20', '0');

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, 
Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PM001', 'A001', 'P001', '2024-03-01', '2024-03-10', 'B001'),
('PM002', 'A002', 'P002', '2024-02-15', '2024-02-25', 'B002'),
('PM003', 'A003', 'P003', '2024-01-10', '2024-01-20', 'B003'),
('PM004', 'A004', 'P004', '2024-03-20', '2024-03-30', 'B004'),
('PM005', 'A005', 'P005', '2024-02-10', '2024-02-20', 'B005'),
('PM006', 'A006', 'P006', '2024-01-05', '2024-01-15', 'B006'),
('PM007', 'A007', 'P007', '2024-03-05', '2024-03-15', 'B007'),
('PM008', 'A008', 'P008', '2024-02-20', '2024-02-28', 'B008'),
('PM009', 'A009', 'P009', '2024-01-15', '2024-01-25', 'B009'),
('PM010', 'A010', 'P010', '2024-03-10', '2024-03-20', 'B010'),
('PM011', 'A011', 'P011', '2024-02-05', '2024-02-15', 'B011'),
('PM012', 'A012', 'P012', '2024-01-25', '2024-02-05', 'B012'),
('PM013', 'A013', 'P013', '2024-03-15', '2024-03-25', 'B013'),
('PM014', 'A014', 'P014', '2024-02-20', '2024-02-28', 'B014'),
('PM015', 'A015', 'P015', '2024-01-10', '2024-01-20', 'B015');

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PM016', 'A008', 'P003', '2024-01-10', '2024-01-20', 'B015'), 
('PM017', 'A002', 'P006', '2024-01-10', '2024-01-20', 'B015'), 
('PM018', 'A005', 'P013', '2024-01-10', '2024-01-20', 'B015');

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PM019', 'A008', 'P003', '2024-01-10', '2024-01-20', 'B015'), 
('PM020', 'A008', 'P006', '2024-01-10', '2024-01-20', 'B015'), 
('PM021', 'A008', 'P013', '2024-01-10', '2024-01-20', 'B015'),
('PM022', 'A008', 'P013', '2024-01-10', '2024-01-20', 'B015'), 
('PM023', 'A008', 'P013', '2024-01-10', '2024-01-20', 'B015'), 
('PM024', 'A008', 'P013', '2024-01-10', '2024-01-20', 'B015'); 

=========================================================================================================================================

- soal 1
CREATE OR REPLACE VIEW soal1 AS
SELECT a.Nama_Anggota, COUNT(p.Kode_Buku) AS `Jumlah Buku Dipinjam`
FROM anggota a JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
GROUP BY a.IdAnggota
HAVING COUNT(p.Kode_Buku) > 5;

SELECT * FROM soal1;

- soal 2
CREATE OR REPLACE VIEW soal2 AS
SELECT p.IdPetugas, COUNT(p.Kode_Buku) AS `Jumlah Buku Terpinjam`
FROM peminjaman p
GROUP BY p.IdPetugas;

SELECT * FROM soal2;

-soal 3

CREATE OR REPLACE VIEW soal3 AS
SELECT p.IdPetugas, COUNT(p.Kode_Buku) AS `Jumlah Buku Terpinjam`
FROM peminjaman p
GROUP BY p.IdPetugas
HAVING COUNT(Kode_Buku) = 
(SELECT MAX(`Jumlah Buku Terpinjam`) 
FROM (SELECT IdPetugas, COUNT(Kode_Buku) AS `Jumlah Buku Terpinjam` 
 FROM peminjaman GROUP BY IdPetugas) AS `Petugas Jumlah Buku`);
 
SELECT * FROM soal3;

-soal 4
CREATE VIEW soal4 AS
SELECT b.Judul_Buku, COUNT(p.Kode_Buku) AS `Jumlah Peminjaman`
FROM buku b
JOIN peminjaman p ON b.Kode_Buku = p.Kode_Buku
GROUP BY b.Judul_Buku
HAVING COUNT(p.Kode_Buku) = 
(SELECT MAX(`Jumlah Peminjaman`) 
FROM (SELECT COUNT(Kode_Buku) AS `Jumlah Peminjaman` 
 FROM peminjaman GROUP BY Kode_Buku) AS `Buku Jumlah Peminjaman`);

SELECT * FROM soal4;












