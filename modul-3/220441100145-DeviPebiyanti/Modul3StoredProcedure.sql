CREATE DATABASE perpustakaan;
USE perpustakaan;

CREATE TABLE petugas (
	id_petugas INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	username VARCHAR (15) NOT NULL,
	pasword VARCHAR (15) NOT NULL,
	nama VARCHAR (25) NOT NULL
);

INSERT INTO petugas(username, pasword, nama) VALUES 
	('rosidah_', '12345', 'Rosidah'),
	('amelia_', '67890', 'Amelia'),
	('aliya_', '83657', 'Aliya'),
	('iqbal_', '93287', 'Iqbal'),
	('bagas_', '38458', 'Bagas');

CREATE TABLE buku(
	kode_buku INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	judul_buku VARCHAR(25) NOT NULL,
	pengarang_buku VARCHAR(30) NOT NULL,
	penerbit_buku VARCHAR(30) NOT NULL,
	tahun_buku VARCHAR(20) NOT NULL,
	jumlah_buku INT(10) NOT NULL,
	status_buku VARCHAR(10) NOT NULL,
	klasifikasi_buku VARCHAR(20) NOT NULL
);

INSERT INTO buku(judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES 
	('Si Kancil', 'Isnaini', 'Mizan', '2020', 30, 'tersedia', 'Dongeng'),
	('Buaya & Harimau', 'Isnaini', 'Mizan', '2021', 25, 'tersedia', 'Dongeng'),
	('Gagak Hitam', 'Teuku', 'Mizan', '2020', 25, 'tersedia', 'Dongeng'),
	('Harry Potter', 'J.K Rowlling', 'Gramedia', '1997', 35, 'tersedia', 'Fiksi'),
	('Laut Bercerita', 'Leila S.Chudori', 'Gramedia', '2017', 20, 'tersedia', 'Fiksi'),
	('Dilan', 'Pidi Baiq', 'Gramedia', '2018', 30, 'tersedia', 'Fiksi Remaja'),
	('Milea', 'Pidi Baiq', 'Gramedia', '2019', 35, 'tersedia', 'Fiksi Remaja'),
	('Mariposa', 'Luluk HF', 'Mizan', '2020', 20, 'tersedia', 'Fiksi Remaja'),
	('Laskar Pelangi', 'Andrea Hirata', 'Gramedia', '2008', 35, 'tersedia', 'Fiksi'),
	('Sang Pemimpi', 'Andrea Hirata', 'Gramedia', '2009', 30, 'tersedia', 'Fiksi');
	

CREATE TABLE anggota(
	id_anggota INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nama_anggota VARCHAR(20) NOT NULL,
	angkatan_anggota INT(10) NOT NULL,
	tempat_lahir_anggota VARCHAR(20) NOT NULL,
	tanggal_lahir_anggota DATE,
	no_telp VARCHAR(20) NOT NULL,
	jenis_kelamin VARCHAR(15) NOT NULL,
	status_pinjam VARCHAR(15) NOT NULL
);

INSERT INTO anggota(nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES 
	('Tesa', 2022, 'Tuban', '2004-09-17', '083783463686', 'Perempuan', 'pinjam'),
	('Deby', 2022, 'Tuban', '2004-03-13', '083524532876', 'Perempuan', 'pinjam'),
	('Trisya', 2021, 'Bojonegoro', '2003-04-23', '083723462380', 'Perempuan', 'pinjam'),
	('Arum', 2021, 'Lamongan', '2003-09-10', '085892633473', 'Perempuan', 'pinjam'),
	('Bima', 2022, 'Surabaya', '2003-05-12', '089626354737', 'Laki-Laki', 'pinjam'),
	('Aryo', 2021, 'Surabaya', '2004-01-15', '083247643646', 'Laki-Laki', 'pinjam'),
	('Arifin', 2022, 'Lamongan', '2003-03-31', '083267456273', 'Laki-Laki', 'kembali'),
	('Fuad', 2021, 'Pamekasan', '2003-04-26', '085329847214', 'Laki-Laki', 'pinjam'),
	('Rozikhin', 2022, 'Pamekasan', '2004-08-15', '085286423789', 'Laki-Laki', 'kembali'),
	('Diana', 2021, 'Bojonegoro', '2003-02-22', '085287382999', 'Perempuan', 'pinjam'),
	('Erna', 2021, 'Tuban', '2003-11-29', '083123623687', 'Perempuan', 'pinjam');

CREATE TABLE peminjaman(
	kode_peminjaman INT(10) PRIMARY KEY NOT NULL,
	id_anggota INT(10) NOT NULL,
	id_petugas INT(10) NOT NULL,
	kode_buku INT(10) NOT NULL,
	tgl_pinjam DATE,
	tgl_kembali DATE
);

INSERT INTO peminjaman(kode_peminjaman, id_anggota, id_petugas, kode_buku, tgl_pinjam, tgl_kembali) VALUES 
	(01, 2, 17, 9, '2023-03-13', '2023-03-18'),
	(02, 4, 17, 8, '2023-03-11', '2023-03-16'),
	(03, 6, 16, 1, '2023-03-17', '2023-03-22'),
	(04, 8, 18, 2, '2023-03-17', '2023-03-22'),
	(05, 10, 18, 6, '2023-03-20', '2023-03-25'),
	(06, 1, 19, 10, '2023-03-23', '2023-03-28'),
	(07, 3, 16, 7, '2023-03-23', '2023-03-28'),
	(08, 5, 20, 3, '2023-03-25', '2023-03-30'),
	(09, 7, 20, 10, '2023-03-24', '2023-04-01'),
	(10, 9, 16, 5, '2023-03-28', '2023-04-05'),
	(11, 11, 18, 5, '2023-03-26', '2023-03-31');
	

ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_id_anggota 
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);

ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_id_petugas 
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas);

ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_kode_buku 
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

DROP TABLE pengembalian;

CREATE TABLE pengembalian (
	kode_kembali INT(10) PRIMARY KEY NOT NULL,
	id_anggota INT(10) NOT NULL,
	kode_buku INT(10) NOT NULL,
	id_petugas INT(10) NOT NULL,
	tgl_pinjam DATE,
	tgl_kembali DATE,
	denda VARCHAR(15),
	FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
	FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
	FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

INSERT INTO pengembalian(kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda) VALUES 
	(01, 2, 9, 17, '2023-03-13', '2023-03-18', '-'),
	(02, 4, 8, 17, '2023-03-11', '2023-03-16', '-'),
	(03, 6, 1, 16, '2023-03-17', '2023-03-22', '-'),
	(04, 8, 2, 18, '2023-03-17', '2023-03-22', '-'),
	(05, 10, 6, 18, '2023-03-20', '2023-03-25', '-'),
	(06, 1, 10, 19, '2023-03-23', '2023-03-28', '-'),
	(07, 3, 7, 16, '2023-03-23', '2023-03-28', '-'),
	(08, 5, 3, 20, '2023-03-25', '2023-03-30', '-'),
	(09, 7, 10, 20, '2023-03-24', '2023-03-01', '30000'),
	(10, 9, 5, 16, '2023-03-28', '2023-03-05', '30000'),
	(11, 11, 5, 18, '2023-03-26', '2023-03-31', '-');


//NOMOR 1//
CREATE VIEW pinjam_buku AS
SELECT 
	anggota.nama_anggota,
	buku.judul_buku, 
	COUNT(anggota.nama_anggota)  
AS jumlah_buku 
FROM anggota, peminjaman 
WHERE anggota.id_anggota=peminjaman.id_anggota;

SELECT * FROM pinjam_buku;
DROP VIEW pinjam_buku;

////////////////////////////////////

CREATE VIEW pinjam_buku AS 
SELECT
	peminjaman.id_anggota,
	anggota.nama_anggota,
COUNT(peminjaman.id_anggota) AS banyak_pinjaman
FROM anggota INNER JOIN peminjaman 
ON peminjaman.id_anggota = anggota.id_anggota 
GROUP BY id_anggota
HAVING COUNT(*) > 5;
    
SELECT*FROM pinjam_buku;
DROP VIEW pinjam_buku;


//NOMOR 2//
CREATE VIEW transaksi_peminjaman AS SELECT
peminjaman.id_petugas, 
petugas.nama,
COUNT(peminjaman.id_petugas) AS jumlah
FROM petugas INNER JOIN peminjaman ON petugas.id_petugas = peminjaman.id_petugas
GROUP BY id_petugas;

SELECT * FROM transaksi_peminjaman;
DROP VIEW transaksi_peminjaman;

CREATE VIEW transaksi_pengembalian AS SELECT
pengembalian.id_petugas, 
petugas.nama,
COUNT(pengembalian.id_petugas) AS jumlah
FROM petugas JOIN pengembalian ON petugas.id_petugas = pengembalian.id_petugas
GROUP BY id_petugas;

SELECT * FROM transaksi_pengembalian;
DROP VIEW transaksi_pengembalian;



//NOMOR 3//
CREATE VIEW transaksi_petugas AS 
SELECT
	peminjaman.id_petugas, 
	petugas.nama,
COUNT(peminjaman.id_petugas) AS banyak
FROM petugas INNER JOIN 
	peminjaman ON petugas.id_petugas = peminjaman.id_petugas
ORDER BY banyak DESC;

SELECT * FROM transaksi_petugas;
DROP VIEW transaksi_petugas;



//NOMOR 4//
CREATE VIEW buku_terbanyak AS 
SELECT
    peminjaman.kode_buku,
    buku.judul_buku,
    COUNT(peminjaman.kode_buku) AS banyak
FROM buku INNER JOIN
    peminjaman ON buku.kode_buku = peminjaman.kode_buku
GROUP BY
    kode_buku
ORDER BY
    banyak DESC
LIMIT 1;

SELECT * FROM buku_terbanyak;
DROP VIEW buku_terbanyak;


///////////////////////////////////////////////////////////////////////////////////////
/////NOMOR 1/////

DELIMITER //

CREATE PROCEDURE dataa(IN id INT(20))
BEGIN
	SELECT * FROM anggota WHERE id_anggota = id;
END//
DELIMITER;

CALL dataa('1');


////NOMOR 2////

DELIMITER //
CREATE PROCEDURE satuatribut(IN judul VARCHAR(100))
BEGIN
	SELECT * FROM buku WHERE judul_buku = judul;
END//

CALL satuatribut('Si Kancil');


////NOMOR 3////

DELIMITER //
CREATE PROCEDURE duaatribut(IN id INT(100), IN nama_petugas VARCHAR(100))
BEGIN
	SELECT * FROM petugas WHERE id_petugas = id AND nama = nama_petugas;
END//
DELIMITER;

CALL duaatribut('18', 'Aliya');


////NOMOR 4////

DELIMITER //
CREATE PROCEDURE tigaatributt(IN kode INT(100), id INT(100), IN tglpinjam VARCHAR(100))
BEGIN
	SELECT * FROM peminjaman WHERE kode_peminjaman = kode AND id_petugas = id AND tgl_pinjam = tglpinjam;
END//
DELIMITER;

CALL tigaatributt('6', '19', '2023-03-23');


////NOMOR 5////BELUM BISA

DELIMITER //
CREATE PROCEDURE insertToPetugas(
	IN id_petugas INT(10),
	IN username VARCHAR(15),
	IN pasword VARCHAR(15),
	IN nama VARCHAR(25)
)
BEGIN
	INSERT INTO petugas
	VALUES (id_petugas, username, pasword, nama);
END//
DELIMITER ;

CALL insertToPetugas('21', 'nino_', '82637', 'Nino');
SELECT * FROM petugas;


////NOMOR 6////BELUM BISA

DELIMITER //
CREATE PROCEDURE jumlahbuku(OUT jumlah_buku INT(10))
BEGIN
	SELECT COUNT(kode_buku)
	INTO jumlah_buku FROM buku;
END//
DELIMITER ;

CALL jumlahbuku(@jumlah_buku);
SELECT @jumlah_buku;

DROP PROCEDURE jumlahbuku;

////NOMOR 7////

DELIMITER //
CREATE PROCEDURE jumlahpenerbit(
	IN namapenerbit VARCHAR(100),
	OUT total INT(100))
BEGIN
	SELECT COUNT(kode_buku)
	INTO total
	FROM buku WHERE penerbit_buku = namapenerbit;
END//
DELIMITER ;

CALL jumlahpenerbit('Mizan', @total);
SELECT @total;