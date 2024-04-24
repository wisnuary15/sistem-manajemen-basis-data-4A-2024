CREATE DATABASE perpustakaan;
USE perpustakaan;

CREATE TABLE anggota(
id_anggota INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_anggota VARCHAR(25) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp VARCHAR(20) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL);

CREATE TABLE petugas(
id_petugas INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(15) NOT NULL,
passwordd VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL);

CREATE TABLE buku(
kode_buku INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
penerbit_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL,
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20) NOT NULL);

CREATE TABLE peminjaman(
kode_peminjaman INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_anggota INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
kode_buku INT(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku));

CREATE TABLE pengembalian (
kode_kembali INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_anggota INT(10) NOT NULL,
kode_buku INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR(15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku));

INSERT INTO anggota (nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES
('Devi Dwi', '2022', 'Lamongan', '2004-09-18', '089529753775', 'P', 'Aktif'),
('Dedy Eka', '2019', 'Malang', '2002-07-28', '089612340987', 'L', 'Aktif'),
('Eri Nana', '2018', 'Bojonegoro', '2001-12-09', '089765472345', 'P', 'Aktif'),
('Adelia Shafira', '2022', 'Sidoarjo', '2004-09-26', '089178651234', 'P', 'Aktif'),
('Arum Rahma', '2022', 'Pasuruan', '2004-10-20', '081234567890', 'P', 'Aktif'),
('Ayuningtyas', '2022', 'Mojokerto', '2004-07-07', '082578900987', 'P', 'Aktif'),
('Alimmuddin', '2022', 'Gresik', '2003-12-11', '089765431234', 'L', 'Aktif'),
('Rozikhin', '2022', 'Pamekasan', '2004-03-15', '081523455432', 'L', 'Aktif'),
('Nizar Akhdan', '2023', 'Surabaya', '2005-02-10', '082567876787', 'L', 'Aktif'),
('Arvan Denanta', '2023', 'Ponorogo', '2004-03-28', '082434568765', 'L', 'Aktif');
SELECT * FROM anggota;

INSERT INTO petugas (username, passwordd, nama) VALUES
('userpetugas1', 'consolelog', 'Pebiyanti'),
('userpetugas2', 'helloworld', 'Novitasari'),
('userpetugas3', 'systemoutprint', 'Zahranda'),
('userpetugas4', 'tuhanyangtau', 'Putra'),
('userpetugas5', 'kepobanget', 'Susiati'),
('userpetugas6', 'nopassword', 'Denanta'),
('userpetugas7', 'passwordrahasia', 'Haris Zidan'),
('userpetugas8', 'kmusiapa', 'Hafis Sauqi'),
('userpetugas9', 'kangajelas', 'Reza Putra'),
('userpetugas10', 'tidakada', 'Anindita');
SELECT * FROM petugas;

INSERT INTO buku (judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
('Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2010', '5', 'Tersedia', 'Persahabatan'),
('Raja Yang Terpenjara', 'Khalil Gibran', 'Yayasan Bentang Budaya', '2011', '3', 'Tersedia', 'Kehidupan'),
('London', 'Windry Ramadhina', 'Gramedia', '2009', '2', 'Tersedia', 'Romansa'),
('Sura Kecil Untuk Tuhan', 'Agnes Dannover', 'Inandra Published', '2008', '7', 'Tersedia', 'Perjuangan Hidup'),
('Rumah Kaca', 'Pramoedya Ananta Toer', 'Lentera Dipantera', '2010', '8', 'Tersedia', 'Politik'),
('Malam Yang Kelam', 'Agatha Christie', 'Elex Media Komutindo', '2011', '4', 'Tersedia', 'Fiksi Dediktif'),
('Cantik Itu Luka', 'Eka Kurniawan', 'Gramedia', '2012', '3', 'Tersedia', 'Romansa'),
('Saman', 'Ayu Utami', 'Gramedia', '2002', '7', 'Tersedia', 'Politik Dan Agama'),
('Ronggeng Dukuh Paruh', 'Ahmad Tohari', 'Gramedia', '2003', '9', 'Tersedia', 'Sejarah'),
('Entrok', 'Okky Madasari', 'Gramedia', '2011', '5', 'Tersedia', 'Sejarah');
SELECT * FROM buku;

INSERT INTO peminjaman (id_anggota, id_petugas, kode_buku, tanggal_pinjam, tanggal_kembali) VALUES
(2, 1, 10, '2023-02-18', '2023-02-28'),
(8, 1, 6, '2024-03-11', '2024-03-21'),
(8, 4, 7, '2023-08-02', '2023-08-12'),
(3, 5, 7, '2024-01-05', '2024-01-15'),
(1, 9, 9, '2024-03-09', '2024-03-19'),
(5, 9, 10, '2023-05-15', '2023-05-25'),
(8, 8, 7, '2024-02-13', '2024-02-23'),
(8, 8, 3, '2024-02-17', '2024-02-27'),
(8, 9, 2, '2024-01-02', '2024-01-12'),
(8, 1, 1, '2024-02-14', '2024-02-24');
SELECT * FROM peminjaman;

INSERT INTO pengembalian (id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda) VALUES
(1, 10, 4, '2023-02-18', '2023-02-28', '10.000'),
(2, 9, 4, '2024-03-11', '2024-03-21', '5000'),
(2, 9, 5, '2023-08-02', '2023-08-12', '10.000'),
(4, 7, 6, '2024-01-05', '2024-01-15', '5000'),
(5, 6, 7, '2024-03-09', '2024-03-19', '10.000'),
(5, 1, 7, '2023-05-15', '2023-05-25', '10.000'),
(1, 4, 9, '2024-02-13', '2024-02-23', '5000'),
(8, 4, 5, '2024-02-17', '2024-02-27', '5000'),
(9, 2, 2, '2024-01-02', '2024-01-12', '10.000'),
(1, 1, 1, '2024-02-14', '2024-02-24', '10.000');
SELECT * FROM pengembalian;

--Soal 1--
CREATE VIEW vw_soal1 AS
SELECT a.id_anggota, b.nama_anggota,
COUNT(a.id_anggota) AS `Jumlah Buku Yang Dipinjam`
FROM peminjaman a , anggota b WHERE a.id_anggota = b.id_anggota 
GROUP BY id_anggota
HAVING COUNT(*) > 5;
SELECT * FROM vw_soal1;

--Soal 2--   
CREATE VIEW vw_soal2 AS
SELECT nama AS `Nama Petugas`, COUNT(DISTINCT b.kode_peminjaman) AS `Jumlah Peminjaman`, COUNT(DISTINCT c.kode_kembali) AS `Jumlah Pengembalian` 
FROM petugas a, peminjaman b, pengembalian c WHERE a.id_petugas = b.id_petugas AND a.id_petugas = c.id_petugas 
GROUP BY nama;
SELECT * FROM vw_soal2;

--Soal 3--
CREATE VIEW vw_soal3 AS  
SELECT a.nama AS `Nama Petugas`, COUNT(DISTINCT b.kode_peminjaman) AS `Jumlah Peminjaman`, COUNT(DISTINCT c.kode_kembali) AS `Jumlah Pengembalian`, 
COUNT(DISTINCT b.kode_peminjaman) + COUNT(DISTINCT c.kode_kembali) AS `Total` 
FROM petugas a, peminjaman b, pengembalian c WHERE a.id_petugas = b.id_petugas AND a.id_petugas = c.id_petugas GROUP BY a.nama
HAVING COUNT(DISTINCT b.kode_peminjaman) + COUNT(DISTINCT c.kode_kembali) =  
     (SELECT MAX(`Total`)  
      FROM (SELECT a.nama AS `Nama Petugas`, COUNT(DISTINCT b.kode_peminjaman) AS `Jumlah peminjaman`,  
      COUNT(DISTINCT c.kode_kembali) AS `Jumlah Pengembalian`, COUNT(DISTINCT b.kode_peminjaman) + COUNT(DISTINCT c.kode_kembali) AS `Total` 
      FROM petugas a, peminjaman b, pengembalian c WHERE a.id_petugas = b.id_petugas AND a.id_petugas = c.id_petugas 
      GROUP BY a.nama) AS `Jumlah Pelayanan`);
SELECT * FROM vw_soal3; 

--Soal 4--
CREATE VIEW vw_soal4 AS
SELECT judul_buku, COUNT(b.kode_buku) AS `Jumlah Peminjaman` 
FROM buku a, peminjaman b WHERE  a.kode_buku = b.kode_buku 
GROUP BY judul_buku 
HAVING COUNT(a.kode_buku) =  
    (SELECT MAX(`Jumlah Peminjaman`)  
     FROM (SELECT COUNT(kode_buku) AS `Jumlah Peminjaman`  
     FROM peminjaman GROUP BY kode_buku) AS `Jumlah Peminjaman Buku`); 
SELECT * FROM vw_soal4;
