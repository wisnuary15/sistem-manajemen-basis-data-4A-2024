-- Membuat Database Terlebih Dahulu
CREATE DATABASE perpustakaanku;

USE perpustakaanku;

-- Membuat Table Petugas
CREATE TABLE petugas(
id_petugas VARCHAR(10) NOT NULL PRIMARY KEY,
username VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

-- Membuat Table Anggota
CREATE TABLE anggota(
id_anggota VARCHAR(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir VARCHAR(20) NOT NULL,
tanggal_lahir DATE NOT NULL,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjaman VARCHAR(15) NOT NULL
);

-- Membuat Table Buku
CREATE TABLE buku(
kode_buku VARCHAR(10) NOT NULL PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang VARCHAR(30) NOT NULL,
penerbit VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL,
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20)
);

-- Membuat Table Pinjaman
CREATE TABLE pinjaman(
kode_pinjaman VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE NOT NULL,
tanggal_kembali DATE NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

-- Membuat Table Pengembalaian (Sesuai Seperti di contoh)
CREATE TABLE pengembalaian(
kode_kembali VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE NOT NULL,
tanggal_kembali DATE NOT NULL,
denda VARCHAR(15),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

-- Menambahkan Foreign key dan mereferensikan ke primary key
ALTER TABLE pengembalaian ADD CONSTRAINT fk_id_anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);


-- Menambahkan Value Pada Masing-masing Table
INSERT INTO petugas VALUES
('petugas001', 'Dimas Tambal Ban 123', 'DimasGokil123', 'Dimas'),
('petugas002', 'Riski Air Galon 331', 'RiskiPebe331', 'Riski'),
('petugas003', 'Arif Kebab 411', 'Arif123', 'Arif'),
('petugas004', 'Dean Geming 532', 'DeanYoutuberSukses32', 'Dean'),
('petugas005', 'Betelgeuse Anime Gue Banget 007', 'Betelgeuse007', 'Betelgeuse');

INSERT INTO anggota VALUES
('anggota001', 'Mas Mursyid Jr.', 18, 'Ngawi', '1999-04-19', 08318887761, 'laki-laki', 'pinjam'),
('anggota002', 'Jacky Walaweh', 17, 'Jombang', '1989-07-23', 08762210297, 'laki-laki', 'kembali'),
('anggota003', 'Dicky Wingky', 21, 'Surabaya', '2001-03-02', 08122334925, 'laki-laki', 'pinjam'),
('anggota004', 'Alfried Johannnes Gittenburg', 20, 'Essen, Jerman', '2002-08-03', 081223306543, 'laki-laki', 'pinjam'),
('anggota005', 'Dita Agen Rahasia 007', 22, 'Jakarta', '2004-10-09', 087411028612, 'perempuan', 'kembali');

INSERT INTO buku VALUES
('buku01', 'Pengantar Pemrograman Python', 'Prof. Dr. Michael Sebastian Dundles', 'Pemrograman Nyaman', 2019, 9, 'ada', 'Pemrograman'),
('buku02', 'Buku Pembelajaran Matematika Dasar Khusus Jenjang SD', 'Dimas Cukurukuk S.Pd., M.Sc.', 'Membaca Seru', 2020, 15, 'kembali', 'Pembelajaran'),
('buku03', 'Perakitan Tank Rumahan Homemade (Seri D.I.Y Vol.05)', 'Victor Emmanuel S.T., M.Eng.', 'AYO BACA!', 2018, 5, 'ada', 'Pembelajaran'),
('buku04', 'Pembuatan Artificial Intelegent Dalam Bidang Sastra dan Sejarah ', 'Allen Dulles S.Kom., M.Kom., Ph.D.', 'Membaca Seru', 2020, 11, 'ada', 'Pemrograman'),
('buku05', 'Sejarah Besar Kesultanan Utsmaniyah Pada Perang Crimea Tahun 1853', 'Dillan Gas LPG', 'WacanaKarya', 2022, 1, 'dipinjam', 'Sejarah');

INSERT INTO pinjaman VALUES
('pinjaman01', 'anggota001', 'petugas001', '2023-01-18', '2023-02-01', 'buku01'),
('pinjaman02', 'anggota001', 'petugas001', '2023-03-20', '2023-03-28', 'buku02'),
('pinjaman03', 'anggota003', 'petugas002', '2023-05-15', '2023-05-20', 'buku04'),
('pinjaman04', 'anggota004', 'petugas004', '2023-08-12', '2023-08-19', 'buku03'),
('pinjaman05', 'anggota005', 'petugas005', '2023-12-22', '2023-12-09', 'buku05');

INSERT INTO pinjaman VALUES
('pinjaman06', 'anggota005', 'petugas003', '2023-12-22', '2023-12-09', 'buku04'),
('pinjaman07', 'anggota005', 'petugas002', '2023-12-22', '2023-12-09', 'buku05'),
('pinjaman08', 'anggota005', 'petugas005', '2023-12-22', '2023-12-09', 'buku05'),
('pinjaman09', 'anggota005', 'petugas001', '2023-12-22', '2023-12-09', 'buku05');

INSERT INTO pinjaman VALUES
('pinjaman10', 'anggota005', 'petugas001', '2023-12-10', '2023-12-09', 'buku05'),
('pinjaman11', 'anggota005', 'petugas001', '2023-12-11', '2023-12-09', 'buku02'),
('pinjaman12', 'anggota004', 'petugas003', '2023-12-22', '2023-12-09', 'buku01'),
('pinjaman13', 'anggota004', 'petugas002', '2023-12-22', '2023-12-09', 'buku04');
-- Mengubah Tanggal Pengembalian Pada Tabel Pinjaman
UPDATE pinjaman
SET tanggal_kembali = '2023-12-30'
WHERE kode_pinjaman = 'pinjaman05';

INSERT INTO pengembalaian VALUES
('kembali01', 'anggota001', 'buku01', 'petugas001', '2023-01-18', '2023-02-01', '100.000'),
('kembali02', 'anggota001', 'buku02', 'petugas001', '2023-03-20', '2023-03-28', '0'),
('kembali03', 'anggota003', 'buku04', 'petugas002', '2023-05-15', '2023-05-20', '0'),
('kembali04', 'anggota004', 'buku03', 'petugas004', '2023-08-12', '2023-08-19', '0'),
('kembali05', 'anggota005', 'buku05', 'petugas005', '2023-12-22', '2023-12-09', '0');

SELECT * FROM anggota

-- Jawaban Soal 1, Menampilkan data anggota yang meminjam lebih dari 5 buku
CREATE VIEW vw_meminjambuku5 AS
SELECT a.nama_anggota, a.angkatan_anggota, a.no_telp, a.jenis_kelamin, 
COUNT(p.kode_buku) AS jumlah_buku
FROM anggota a
JOIN pinjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota
HAVING COUNT(p.kode_buku) > 5;

SELECT * FROM vw_meminjambuku5;

-- Jawaban Soal 2, Yakni Petugas Yang Melakukan Transaksi Beserta Jumlahnya
CREATE VIEW vw_banyaknyaTransaksiPadaPetugas AS
SELECT c.id_petugas, COUNT(c.kode_buku) AS jumlah_buku
FROM pinjaman c GROUP BY c.id_petugas;

SELECT * FROM vw_banyaknyaTransaksiPadaPetugas;

-- Jawaban Soal 3, Yakni Petugas Yang Melakukan Transaksi Paling Banyak
CREATE VIEW vw_petugasRajin AS
SELECT a.id_petugas, COUNT(a.kode_buku) AS jumlah_buku
FROM pinjaman a HAVING COUNT(a.kode_buku) = (SELECT MAX(jumlah_buku)
FROM (SELECT id_petugas, COUNT(kode_buku) AS jumlah_buku
FROM pinjaman GROUP BY id_petugas) AS jumlah_buku);

SELECT * FROM vw_petugasRajin LIMIT 1;

DROP VIEW vw_petugasRajin

-- Jawaban Soal 3, Yakni Petugas Yang Melakukan Transaksi Paling Banyak (Revisi Yang Benar)
CREATE VIEW vw_petugasRajin1 AS
SELECT id_petugas, COUNT(kode_buku) AS jumlah_buku
FROM pinjaman
GROUP BY id_petugas
HAVING COUNT(kode_buku) = (
    SELECT MAX(jumlah_buku)
    FROM (
        SELECT COUNT(kode_buku) AS jumlah_buku
        FROM pinjaman
        GROUP BY id_petugas
    ) AS max_buku
);

SELECT * FROM vw_petugasRajin1;

-- Jawaban Soal 4, Buku Yang Paling Populer Untuk Dipinjam
CREATE VIEW vw_bukuPalingPopuler AS
SELECT b.judul_buku, COUNT(c.kode_buku) AS jumlah_terpinjam
FROM buku b JOIN pinjaman c ON b.kode_buku = c.kode_buku
GROUP BY b.judul_buku 
HAVING COUNT(c.kode_buku) = (
     SELECT MAX(jumlah_terpinjam)
     FROM (
	SELECT COUNT(kode_buku) AS jumlah_terpinjam 
	FROM pinjaman 
	GROUP BY kode_buku) 
	AS jumlah_terpinjam);

SELECT * FROM vw_bukuPalingPopuler;