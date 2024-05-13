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

-- Jawaban Soal 1

DELIMITER //
CREATE PROCEDURE kebetulanPetugas ( 
		IN kode_petugas VARCHAR (10),
		IN nama_lain VARCHAR (15),
		IN pass VARCHAR (15),
		IN penamaan VARCHAR (20)
)
BEGIN 
	    SELECT * FROM petugas WHERE 
	    id_petugas = kode_petugas AND 
	    username = nama_lain AND
	    PASSWORD = pass AND
	    nama = penamaan;
END //
DELIMITER;

CALL kebetulanPetugas('petugas001', 'Dimas Tambal Ban 123', 'DimasGokil123', 'Dimas');

-- Jawaban Soal 2
DELIMITER //
CREATE PROCEDURE tampilkanBuku (
	IN nama_buku VARCHAR (30)
)
BEGIN 
	SELECT * FROM buku WHERE pengarang = nama_buku;
END //
DELIMITER;

CALL tampilkanBuku('Dillan Gas LPG');

-- Jawaban Soal 3 

DELIMITER //
CREATE PROCEDURE tampilkanDuaAtribut (
	IN siapa_namanya VARCHAR (30),
	IN tempat_kelahiran VARCHAR (20)
)
BEGIN 
	SELECT * FROM anggota WHERE
	nama_anggota = siapa_namanya AND
	tempat_lahir = tempat_kelahiran;
END //
DELIMITER;

CALL tampilkanDuaAtribut ('Mas Mursyid Jr.','Ngawi');

-- Jawaban Soal 4

DELIMITER //
CREATE PROCEDURE tampilkanTigaAtribut (
	IN siapa_namanya VARCHAR (30),
	IN tempat_kelahiran VARCHAR (20),
	IN ulang_tahun DATE
)
BEGIN 
	SELECT * FROM anggota WHERE
	nama_anggota = siapa_namanya AND
	tempat_lahir = tempat_kelahiran AND
	tanggal_lahir = ulang_tahun;
END //
DELIMITER;

CALL tampilkanTigaAtribut ('Jacky Walaweh','Jombang','1989-07-23')

-- Jawaban Soal 5
DELIMITER //
CREATE PROCEDURE masukkanData (
    IN nomor_anggota VARCHAR(10),
    IN nama VARCHAR(20),
    IN angkatannya VARCHAR(6),
    IN tempat_kelahiran VARCHAR(20),
    IN tanggal_lahirnya DATE,
    IN nomer_wa INT(12),
    IN gender VARCHAR(15),
    IN status_hubungan VARCHAR(15)
)
BEGIN 
	INSERT INTO anggota 
	VALUES (nomor_anggota, nama, angkatannya, tempat_kelahiran, tanggal_lahirnya, nomer_wa, gender, status_hubungan);
 END //
DELIMITER//

DROP PROCEDURE masukkanData;

CALL masukkanData ('anggota006', 'Iqbal Bola Basket', 24, 'Jombang', '1995-04-21', 0827827191, 'laki-laki', 'pinjam');

SELECT * FROM anggota;

-- Jawaban Soal 6
DELIMITER //
CREATE PROCEDURE bagianOut ( OUT id_petugas VARCHAR (10))
BEGIN 
	SELECT COUNT(*)INTO id_petugas FROM petugas;
END //
DELIMITER//

CALL bagianOut(@id_petugas)
SELECT  @id_petugas

DROP PROCEDURE bagianOut;

-- Jawaban Soal 7
DELIMITER //
CREATE PROCEDURE TambahDenda(
	INOUT TambahDenda INT,
	IN KodeDenda VARCHAR(10)
)
BEGIN
	SET TambahDenda = TambahDenda+100000;
	UPDATE pengembalaian SET denda = TambahDenda;
END//
DELIMITER//
	
SET @denda = "0";
CALL TambahDenda(@denda,'kembali05');
SELECT@denda;

DROP PROCEDURE TambahDenda;

SELECT * FROM pengembalaian