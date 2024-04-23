CREATE DATABASE perpustakaan;

USE perpustakaan;

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
Jumlah_Buku VARCHAR(5) NOT NULL,
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

ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_idAnggota 
FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);
ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_idPetugas 
FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);
ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_Kode_Buku 
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku);

DROP TABLE peminjaman;

CREATE TABLE IF NOT EXISTS tbl_pengembalian (
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

DROP TABLE IF EXISTS perpustakaan.pengembalian;
ALTER TABLE tbl_pengembalian RENAME pengembalian;
DROP TABLE pengembalian;

ALTER TABLE perpustakaan.pengembalian DISCARD TABLESPACE;

DESC tbl_pengembalian;

ALTER TABLE perpustakaan.tbl_pengembalian ADD CONSTRAINT fk_idAnggota 
FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);
ALTER TABLE perpustakaan.tbl_pengembalian ADD CONSTRAINT fk_idPetugas 
FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);
ALTER TABLE perpustakaan.tbl_pengembalian ADD CONSTRAINT fk_Kode_Buku 
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku);

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
('201', 'Cantik Itu Luka', 'Eka Kurniawan', 'Gramedia Pustaka Utama', '2016', '45', 'Lama', 'Novel Fiksi'),
('202', 'Laut Bercerita', 'Leila S.Chudori', 'Kepustakaan Populer Gramedia', '2020', '30', 'Lama', 'Novel Fiksi'),
('203', 'Bumi Manusia', 'Ananta Toer', 'Lentera Dipantara', '2015', '20', 'Lama', 'Sejarah'),
('204', '172 Days', 'Nadzira Shafa', 'Motivaksi Inspira', '2022', '40', 'Terbaru', 'Novel'),
('205', 'ILY', 'Tere Liye', 'Sabakgrip', '2023', '50', 'Terbaru', 'Novel Fiksi'),
('206', 'Loneliness', 'Alvi Syahrin', 'Kawah Media', '2022', '32', 'Terbaru', 'Novel'),
('207', 'Hujan', 'Tere Liye', 'Penerbit Sabak Grip', '2022', '25', 'Terbaru', 'Novel');

SELECT * FROM buku;

INSERT INTO peminjaman VALUES 
('301', '111', '910', '2024-03-21', '2024-03-29', '202'),
('302', '113', '920', '2024-03-25', '2024-03-30', '206'),
('303', '112', '960', '2024-03-30', '2024-04-03', '205'),
('304', '113', '910', '2024-04-01', '2024-04-09', '202'),
('305', '112', '970', '2024-04-02', '2024-04-07', '204'),
('306', '114', '930', '2024-03-31', '2024-04-03', '207'),
('307', '112', '920', '2004-04-04', '2024-04-12', '201'),
('308', '112', '940', '2024-04-05', '2024-04-11', '207'),
('309', '115', '910', '2024-04-02', '2024-04-10', '203'),
('310', '112', '910', '2024-04-15', '2024-04-20', '204'),
('311', '116', '950', '2024-04-03', '2024-04-11', '207'),
('312', '112', '920', '2024-04-20', '2024-04-25', '202');


DROP TABLE peminjaman;
SELECT * FROM peminjaman;

INSERT INTO tbl_pengembalian VALUES 
('401', '111', '202', '910', '2024-03-21', '2024-03-29', '2000'),
('402', '113', '206', '920', '2024-03-25', '2024-03-30', '0'),
('403', '112', '205', '960', '2024-03-30', '2024-04-03', '0'),
('404', '113', '202', '910', '2024-04-01', '2024-04-09', '2000'),
('405', '112', '204', '970', '2024-04-02', '2024-04-07', '0'),
('406', '114', '207', '930', '2024-03-31', '2024-04-03', '0'),
('407', '112', '201', '920', '2004-04-04', '2024-04-12', '2000'),
('408', '112', '207', '940', '2024-04-05', '2024-04-11', '0'),
('409', '115', '203', '910', '2024-04-02', '2024-04-10', '2000'),
('410', '112', '204', '910', '2024-04-15', '2024-04-20', '0'),
('411', '116', '207', '950', '2024-04-03', '2024-04-11', '2000'),
('412', '112', '202', '920', '2024-04-20', '2024-04-25', '0');

DROP TABLE tbl_pengembalian;
SELECT * FROM tbl_pengembalian;

CREATE VIEW vw_anggota_peminjam_terbanyak 
AS SELECT a.idAnggota, b.Nama_Anggota, COUNT(*)AS jml_pinjam 
FROM anggota b JOIN peminjaman a ON b.idAnggota = a.idAnggota
GROUP BY a.idAnggota, b.Nama_Anggota HAVING COUNT(*)>5;

-- menghitung keseluruhan jumlah baris yang ada pada jml_pinjam
-- count menghitung jumlah baris aja
-- mencari agregate data yang lebih dari 5
-- mencari keseleuruhan baris data dari agregate yang nilainya lebih dari 5

SELECT * FROM vw_anggota_peminjam_terbanyak;

CREATE VIEW vw_petugas AS SELECT c.idPetugas, c.Nama, d.Tanggal_Pinjam, 
COUNT(*)AS jml_transaksi FROM petugas c JOIN peminjaman d ON c.idPetugas = d.idPetugas
GROUP BY c.idPetugas, c.Nama;

SELECT * FROM vw_petugas;

CREATE VIEW vw_transaksi_banyak AS SELECT e.idPetugas, e.Nama, COUNT(f.kode_peminjaman)AS
jml_transaksi FROM petugas e INNER JOIN peminjaman f ON e.idPetugas = f.idPetugas 
GROUP BY e.idPetugas, e.Nama ORDER BY jml_transaksi DESC LIMIT 1;

SELECT * FROM vw_transaksi_banyak;

CREATE VIEW vw_buku_dipinjam_banyak AS SELECT g.kode_buku, g.judul_buku, COUNT(h.kode_peminjaman)AS
jml_pinjam FROM buku g INNER JOIN peminjaman h ON g.kode_buku = h.kode_buku 
GROUP BY g.kode_buku, g.judul_buku ORDER BY jml_pinjam DESC LIMIT 1;

SELECT * FROM vw_buku_dipinjam_banyak;
