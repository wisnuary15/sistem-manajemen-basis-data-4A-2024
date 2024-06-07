CREATE DATABASE tugaspraktikum6;
USE tugaspraktikum6;

 
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

-- no 1--

DELIMITER //

CREATE PROCEDURE biodata(
    IN nim INT,
    IN nama VARCHAR(20),
    IN alamat VARCHAR(40),
    IN noTelp INT,
    IN jenisKelamin VARCHAR(1),
    IN hobi VARCHAR(30),
    IN umur INT
)
BEGIN
    DECLARE vNim INT;
    DECLARE vNamaM VARCHAR(20);
    DECLARE vAlamat VARCHAR(40);
    DECLARE vNoTelp INT;
    DECLARE vJenisKelamin VARCHAR(1);
    DECLARE vHobi VARCHAR(30);
    DECLARE vumur INT;
    
    SET vNim = nim;
    SET vNamaM = nama;
    SET vAlamat = alamat;
    SET vNoTelp = noTelp;
    SET vJenisKelamin = jenisKelamin;
    SET vHobi = hobi;
    SET vumur = umur;
    

    SELECT vNim AS NIM, 
           vNamaM AS Nama_Mahasiswa, 
           vAlamat AS Alamat_asal, 
           vNoTelp AS No_Telp,
           vJenisKelamin AS Jenis_Kelamin, 
           vHobi AS Hobi, 
           vumur AS Umur;
END //

DELIMITER ;

DROP PROCEDURE biodata;

CALL biodata (21044110123, 'Ratna', 'Nganjuk', 085645761242, 'p', 'Memasak', 26);

-- no 2
-- datediff untuk menghitung selisih

DELIMITER $$
CREATE PROCEDURE peringatanbuku()
BEGIN 
	SELECT kode_kembali, id_anggota, tgl_pinjam, tgl_kembali, DATEDIFF(tgl_kembali, tgl_pinjam) AS lama_meminjam,
	CASE WHEN DATEDIFF(tgl_kembali, tgl_pinjam) <= 2 THEN ' Silahkan Pergunakan Buku'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) BETWEEN 3 AND 5 THEN  ' Ingat!, Waktu pinjam segera habis'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) >= 6 THEN ' Warning!!!, Denda menanti anda' END AS "statusnya"
	FROM pengembalian ORDER BY lama_meminjam ASC;
END $$ 
DELIMITER ;
CALL peringatanbuku();
DROP PROCEDURE peringatanbuku;

-- no 3

DELIMITER//
CREATE PROCEDURE dendapinjam(
	IN kode VARCHAR(10))
BEGIN
DECLARE total_denda VARCHAR (50);

	IF ((SELECT SUM(denda) FROM pengembalian WHERE id_anggota = kode) !=0) THEN
		SET total_denda = (SELECT SUM(denda) FROM pengembalian WHERE id_anggota=kode);
	ELSE 	
		SET total_denda = 'Anda tidak memiliki denda';
	END IF;
		SELECT total_denda;
END//
DELIMITER ;
CALL dendapinjam('103');
DROP PROCEDURE dendapinjam;

-- no 4

DELIMITER //
CREATE PROCEDURE cetak_peminjaman (
    IN bil INT
)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= bil DO
        SELECT * FROM peminjaman LIMIT bil;
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

CALL cetak_peminjaman(10);

-- no 5
-- distinct mengambil nilai unik

DELIMITER//
CREATE PROCEDURE hapus_anggota ()
BEGIN
	 DELETE FROM Anggota
    WHERE jenis_kelamin = 'laki-laki'
    AND id_anggota NOT IN (
        SELECT DISTINCT id_anggota 
        FROM peminjaman 
        WHERE status_pinjam != "tidak pinjam"
    );
END//
DELIMITER ;
CALL hapus_anggota();
SELECT * FROM anggota;
DROP TABLE anggota;