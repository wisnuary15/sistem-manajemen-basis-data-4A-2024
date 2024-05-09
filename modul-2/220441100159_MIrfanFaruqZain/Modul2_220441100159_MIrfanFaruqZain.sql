CREATE DATABASE Perpustakaan;

USE Perpustakaan;

CREATE TABLE petugas(
id_petugas VARCHAR (10) PRIMARY KEY, 
username VARCHAR (15), 
pasword VARCHAR (15), 
nama VARCHAR (25));

CREATE TABLE anggota(
id_anggota VARCHAR (10) PRIMARY KEY, 
nama_anggota VARCHAR (20),
angkatan_anggota VARCHAR (6),
tempat_lahir_anggota VARCHAR (20),
tanggal_lahir_anggota DATE, 
no_telp INT (12),
jenis_kelamin VARCHAR (15), 
status_pinjam VARCHAR (15));

CREATE TABLE buku(
kode_buku VARCHAR (10) PRIMARY KEY,
judul_buku VARCHAR (25),
pengarang_buku VARCHAR (30),
penerbit_buku VARCHAR (30), 
tahun_buku VARCHAR (5),
jumlah_buku VARCHAR (5),
status_buku VARCHAR (10),
klasifikasi_buku VARCHAR (20));

CREATE TABLE peminjaman(
kode_peminjaman VARCHAR (10)PRIMARY KEY,
id_anggota VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (10),
FOREIGN KEY (id_petugas) REFERENCES petugas (id_petugas),
FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku));

CREATE TABLE pengembalian(
kode_kembali VARCHAR (10) PRIMARY KEY,
id_anggota VARCHAR (10),
kode_buku VARCHAR (10),
id_petugas VARCHAR (10),
tanggal_pinjam DATE,
tanggal_kembali DATE,
denda VARCHAR (15),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku));

INSERT INTO petugas VALUES 
('A1','AQSW1','111','MUNIF'),
('A2','AQSW2','222','SHONIF'),
('A3','AQSW3','333','MUKHLIS'),
('A4','AQSW4','444','SUAIB'),
('A5','AQSW5','555','ASEP');

SELECT * FROM petugas;

INSERT INTO anggota VALUES 
('B1', 'Herlina','2019','Gresik','2001-12-12','01234','Perempuan','Pinjam'),
('B2', 'Rahma','2019','Sidoarjo','2001-11-12','01235','Laki-Laki','Pinjam'),
('B3', 'Rahmi','2020','Surabaya','2002-10-12','01236','Perempuan','Pinjam'),
('B4', 'Romo','2019','Sumenep','2001-09-12','01237','Laki-Laki','Pinjam'),
('B5', 'Dila','2020','Bangkalan','2002-08-12','01238','Perempuan','Pinjam');

SELECT * FROM anggota;

INSERT INTO buku VALUES 
('C1', 'Laskar Pelangi', 'Andrea hirata', 'Bintang Pustaka', '2015', '20', 'Baru', 'Baik'),
('C2', 'Cinta Brontosaurus', 'Raditya Dika', 'Gagas Media', '2016', '30', 'Baru', 'Baik'),
('C3', 'Sepatu Dahlan', 'Khrisna Pabichara', 'Houra Books', '2017', '35', 'Baru', 'Baik'),
('C4', 'Dear Nathan', 'Erisca Febrianti', 'Best Media', '2019', '45', 'Baru', 'Baik'),
('C5', 'Sang Mimpi', 'Andrea hirata', 'Bintang Pustaka', '2019', '30', 'Baru', 'Baik');

SELECT * FROM buku;

INSERT INTO peminjaman VALUES 
('P1', 'B1', 'A1', '2023-04-06', '2023-04-09', 'C1'),
('P2', 'B1', 'A2', '2023-04-07', '2022-04-30', 'C2'),
('P3', 'B1', 'A3', '2023-04-08', '2022-04-13', 'C3'),
('P4', 'B1', 'A4', '2023-04-09', '2022-04-13', 'C4'),
('P5', 'B1', 'A5', '2023-04-22', '2022-04-30', 'C5');

INSERT INTO peminjaman VALUES 
('P6', 'B1', 'A1', '2023-04-06', '2023-04-09', 'C1'),
('P7', 'B1', 'A2', '2023-04-07', '2022-04-30', 'C2'),
('P8', 'B1', 'A3', '2023-04-08', '2022-04-13', 'C3'),
('P9', 'B1', 'A4', '2023-04-09', '2022-04-13', 'C4'),
('P10', 'B1', 'A5', '2023-04-22', '2022-04-30', 'C5');

INSERT INTO peminjaman VALUES 
('P11', 'B1', 'A5', '2023-04-09', '2022-04-13', 'C4'),
('P12', 'B1', 'A5', '2023-04-22', '2022-04-30', 'C5');

INSERT INTO peminjaman VALUES 
('P13', 'B1', 'A5', '2023-04-09', '2022-04-13', 'C5'),
('P14', 'B1', 'A5', '2023-04-22', '2022-04-30', 'C5');

SELECT * FROM peminjaman;

INSERT INTO pengembalian VALUES 
('Z01', 'B1', 'C1', 'A1', '2023-04-06', '2023-04-09', '2000'),
('Z02', 'B2', 'C2', 'A2', '2023-04-07', '2022-04-30', '3000'),
('Z03', 'B3', 'C3', 'A3', '2023-04-08', '2022-04-13', '1500'),
('Z04', 'B4', 'C4', 'A4', '2023-04-09', '2022-04-13', '2500'),
('Z05', 'B5', 'C5', 'A5', '2023-04-22', '2022-04-30', '2000');

INSERT INTO pengembalian VALUES 
('Z06', 'B1', 'C1', 'A5', '2023-04-06', '2023-04-09', '2000'),
('Z07', 'B2', 'C2', 'A5', '2023-04-07', '2022-04-30', '3000');

INSERT INTO pengembalian VALUES 
('Z08', 'B1', 'C1', 'A5', '2023-04-06', '2023-04-09', '2000'),
('Z09', 'B2', 'C2', 'A5', '2023-04-07', '2022-04-30', '3000');


SELECT * FROM pengembalian;

1
CREATE VIEW peminjam_terbanyak AS
SELECT peminjam.id_anggota, namee.nama_anggota FROM peminjaman peminjam
JOIN anggota namee ON peminjam.id_anggota = namee.id_anggota;

SELECT * , COUNT(*) FROM peminjam_terbanyak GROUP BY nama_anggota HAVING COUNT(*) > 5;

SELECT * FROM peminjam_terbanyak ;
 
2
CREATE VIEW petugas_peminjam_buku AS
SELECT tugas.id_petugas, tugas.nama, pinjam.tanggal_pinjam, COUNT(*) AS jumlah_transaksi FROM
petugas tugas JOIN peminjaman pinjam ON tugas.id_petugas = pinjam.id_petugas GROUP BY id_petugas;

SELECT * FROM petugas_peminjam_buku GROUP BY id_petugas HAVING COUNT(*); 

3
SELECT namee.id_petugas, namee.nama, MAX(jumlah_transaksi) FROM petugas_peminjam_buku namee, peminjaman ptgs
WHERE namee.id_petugas = ptgs.id_petugas AND jumlah_transaksi >= ALL
(SELECT jumlah_transaksi FROM petugas_peminjam_buku)
GROUP BY namee.id_petugas DESC LIMIT 1;

4
CREATE VIEW buku_terbanyak AS
	SELECT buku.judul_buku, COUNT(peminjaman.kode_buku) AS JumlahPeminjaman
	FROM buku JOIN peminjaman ON buku.kode_buku = peminjaman.kode_buku
	GROUP BY buku.kode_buku HAVING COUNT(peminjaman.kode_buku) = (SELECT MAX(JumlahPeminjaman) 
	FROM (SELECT COUNT(kode_buku) AS JumlahPeminjaman FROM peminjaman GROUP BY kode_buku) AS JumlahPeminjaman);

SELECT * FROM buku_terbanyak;