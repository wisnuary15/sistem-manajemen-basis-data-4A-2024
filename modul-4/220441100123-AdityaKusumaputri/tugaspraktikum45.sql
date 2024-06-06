CREATE DATABASE tugaspraktikum45;
USE tugaspraktikum45;


CREATE TABLE IF NOT EXISTS petugas(
id_petugas INT(10) PRIMARY KEY NOT NULL,
username VARCHAR(15) NOT NULL,
pass VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

DESC petugas;

CREATE TABLE IF NOT EXISTS buku(
kode_buku INT(10) NOT NULL  PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
penerbit_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL, 
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20) NOT NULL
);

DESC buku;

CREATE TABLE IF NOT EXISTS anggota(
id_anggota INT(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL
);


DESC anggota;

CREATE TABLE IF NOT EXISTS pengembalian(
kode_kembali INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
kode_buku INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR(15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);
DESC pengembalian;

CREATE TABLE IF NOT EXISTS peminjaman(
kode_peminjaman INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku INT(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

DESC peminjaman;

INSERT INTO petugas VALUES 
(201, 'agung1', 'ag123', 'agung'),
(202,'wahyu2', 'wh23', 'wahyu'),
(203,'dinda5', 'dn55', 'dinda'),
(204, 'della8', 'dl88', 'della'),
(205,'rinaa3', 'rr22', 'rina'),
(206,'lala11', 'llpoo', 'lala'),
(207,'bintanggg', 'bb9', 'bintang'),
(208,'putri1', 'put23', 'putri');

SELECT * FROM petugas;
DELETE FROM petugas;


INSERT INTO buku VALUES
(301,'Laskar Pelangi', 'Andrea Hirata', 'Bintang Pustaka', '2015', '30', 'baru', 'baik'),
(302,'Negeri 5 Menara', 'Ahmad Fuadi', 'Pt. Gramedia Pustaka Utama', '2009', '20', 'baru', 'baik'),
(303,'Koala Kamal', 'Raditya Dika', 'Gagas Media', '2015', '10', 'baru', 'baik'),
(304,'Promise', 'Dwitasari', 'Loveable', '2018', '30', 'baru', 'baik'),
(305,'Perahu Kertas', 'Dewi Lestari', 'Bentang Pustaka', '2018', '10', 'baru', 'baik'),
(306,'London Love Story', 'Tisa TS', 'Loveable', '2015', '10', 'baru', 'baik'),
(307,'Dear Nathan', 'Erisca Febrianti', 'Pastel Books', '2019', '30', 'baru', 'baik'),
(308,'Sang Mimpi', 'Andrea Hirata', 'Bintang Pustaka', '2019', '25', 'baru', 'baik');

SELECT * FROM buku;

INSERT INTO anggota VALUES
(101,'Dita', '2023', 'Nganjuk', '2003-10-16', '085850080589', 'perempuan', 'Pinjam'),
(102,'Dhea', '2023', 'Bojonegoro', '2003-05-23', '085877890589', 'perempuan', 'Pinjam'),
(103,'Reva', '2023', 'Sidoarjo', '2003-01-06', '085856519589', 'perempuan', 'Pinjam'),
(104,'Angga', '2022', 'Bangkalan', '2003-06-04', '085823410589', 'laki-laki', 'Pinjam'),
(105,'Dani', '2022', 'Lamongan', '2003-10-31', '085859862589', 'laki-laki', 'Pinjam'),
(106,'Aulia', '2024', 'Sumenep', '2004-01-03', '085850029759', 'perempuan', 'Pinjam'),
(107,'Farin', '2024', 'Sumenep', '2004-01-04', '085850022349', 'laki-laki', 'tidak pinjam');

SELECT * FROM anggota;
 DROP TABLE anggota;

INSERT INTO pengembalian VALUES
(401, 103, 301, 206 , '2023-10-10', '2023-10-18', '10000'),
(402, 101, 301, 207 , '2023-10-16', '2023-10-21', '0'),
(403, 105, 301, 206 , '2023-11-23', '2023-11-25', '0'),
(404, 105, 303, 204 , '2023-11-24', '2023-11-28', '0'),
(405, 105, 308, 203 , '2023-12-02', '2023-12-09', '5000'),
(406, 101, 306, 206 , '2023-12-05', '2023-12-10', '0'),
(407, 105, 302, 206 , '2024-01-06', '2024-01-11', '0'),
(408, 105, 306, 202 , '2024-01-09', '2024-01-12', '0'),
(409, 102, 301, 201 , '2024-02-10', '2024-02-15', '0'),
(410, 105, 305, 206 , '2024-02-17', '2024-02-21', '0'),
(411, 104, 307, 208 , '2024-03-03', '2024-03-06', '0');



SELECT * FROM pengembalian;

INSERT INTO peminjaman VALUES
(501 , 103 , 206 , '2023-10-10', '2023-10-18', '301'),
(502 , 101 , 207 , '2023-10-16', '2023-10-21', '301'),
(503 , 105 , 206 , '2023-11-23', '2023-11-25', '301'),
(504 , 105 , 204 , '2023-11-24', '2023-11-28', '303'),
(505 , 105 , 203 , '2023-12-02', '2023-12-09', '308'),
(506 , 101 , 206 , '2023-12-05', '2023-12-10', '306'),
(507 , 105 , 206 , '2024-01-06', '2024-01-11', '302'),
(508 , 105 , 202 , '2024-01-09', '2024-01-12', '306'),
(509 , 102 , 201 , '2024-02-10', '2024-02-15', '301'),
(510 , 105 , 206 , '2024-02-17', '2024-02-21', '305'),
(511 , 104 , 208 , '2024-03-03', '2024-03-06', '307');
SELECT * FROM peminjaman;

-- no 1
DELIMITER //

CREATE PROCEDURE carikembali(
    INOUT tanggal DATE
)
BEGIN
    SELECT 
        p.kode_kembali,
        p.id_anggota,
        a.nama_anggota,
        p.kode_buku,
        p.id_petugas,
        t.nama AS nama_petugas,
        p.tgl_pinjam,
        p.tgl_kembali,
        p.denda
    FROM 
        pengembalian p
    JOIN 
        anggota a ON p.id_anggota = a.id_anggota
    JOIN 
        petugas t ON p.id_petugas = t.id_petugas
    WHERE 
        p.tgl_kembali = tanggal;
END //

DELIMITER ;

SET @tanggal = '2023-10-21';
CALL carikembali(@tanggal);
SELECT @tanggal;
DROP PROCEDURE carikembali;

SELECT * FROM pengembalian;

-- no 2

DELIMITER //

CREATE PROCEDURE menampilkananggota(
    INOUT status_pinjaman VARCHAR(30)
)
BEGIN
    SELECT * FROM anggota
    WHERE status_pinjam = status_pinjaman;
END //

DELIMITER ;

DROP PROCEDURE menampilkananggota;
SET @status_pinjaman = 'tidak pinjam';
CALL menampilkananggota(@status_pinjaman);
SELECT @status_pinjaman;


-- no 3

DELIMITER//
CREATE PROCEDURE daftar_anggota(
	IN statusp VARCHAR(50))
BEGIN 
	SELECT * FROM anggota WHERE 
        status_pinjam = statusp;
	
END//
DELIMITER//

SET @statusp = 'tidak pinjam';
CALL daftar_anggota(@statusp);

DROP PROCEDURE daftar_anggota;

-- no 4

DELIMITER //

CREATE PROCEDURE insertbuku(
    IN kode_buku INT (10),
    IN judul_buku VARCHAR(25),
    IN pengarang_buku VARCHAR(30),
    IN penerbit_buku VARCHAR(30),
    IN tahun_buku VARCHAR (10),
    IN jumlah_buku VARCHAR (5),
    IN status_buku VARCHAR (10),
    IN klasifikasi_buku VARCHAR (20)
)
BEGIN
    INSERT INTO buku 
    VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);

    SELECT 'data buku berhasil ditambahkan.' AS 'Message';
    
END //
DELIMITER ;

DROP PROCEDURE insertbuku;

CALL insertbuku(309, 'Dilan', 'Manoj Punjabi', 'Balai Pustaka', '2022', '20', 'baik', 'fiksi');
SELECT * FROM buku;
-- no 5

DELIMITER//
CREATE PROCEDURE hapus_anggota(
	IN kode INT 
)
BEGIN 
	DECLARE periksa VARCHAR(50);
	DECLARE anggota INT;
	
	SELECT COUNT(*) INTO anggota FROM peminjaman WHERE id_anggota = kode;
	
    IF anggota = 0 THEN
	DELETE FROM anggota WHERE id_anggota = kode;
        SET periksa = 'anggota berhasil dihapus';
    ELSE 
        SET periksa = 'anggota gagal dihapus';
    END IF;
    
    SELECT periksa;
	
END//
DELIMITER ;

CALL hapus_anggota(101);

SELECT * FROM anggota;

DROP PROCEDURE hapus_anggota;


-- no 6
-- A

CREATE VIEW vw_totalbukudikembalikan AS
SELECT a.id_anggota, a.nama_anggota, COUNT(*) AS total_dikembalikan
FROM anggota a
INNER JOIN pengembalian p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota, a.nama_anggota;

SELECT * FROM vw_totalbukudikembalikan;
DROP VIEW vw_totalbukudikembalikan;

-- B

CREATE VIEW vw_petugas_transaksi AS
SELECT t.id_petugas, t.nama, p.tanggal_pinjam, p.tanggal_kembali, COUNT(*) AS jumlah_transaksi
FROM petugas t
RIGHT JOIN peminjaman p ON t.id_petugas = p.id_petugas
GROUP BY t.id_petugas, t.nama
ORDER BY jumlah_transaksi ASC;

SELECT * FROM vw_petugas_transaksi;

-- C

CREATE VIEW vw_jumlahmeminjam AS
SELECT a.id_anggota, a.nama_anggota, COUNT(*) AS jumlah_meminjam
FROM anggota a
LEFT JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota, a.nama_anggota
ORDER BY jumlah_meminjam DESC;

SELECT * FROM vw_jumlahmeminjam;

DROP VIEW vw_jumlahmeminjam;
