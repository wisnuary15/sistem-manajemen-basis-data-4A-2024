CREATE DATABASE datamahasiswa;
USE datamahasiswa;


-- Tugas No 1 Create Procedure Variabel
DELIMITER //
CREATE PROCEDURE biodatamahasiswa(
    IN nim INT(50),
    IN namaMahasiswa VARCHAR(100),
    IN alamat VARCHAR(20),
    IN no_tlp VARCHAR(12),
    IN jenis_kelamin VARCHAR(2),
    IN hobi VARCHAR(20),
    IN umur INT(20)
)
BEGIN
    DECLARE vnim INT(50);
    DECLARE vnama VARCHAR(100);
    DECLARE valamat VARCHAR(20);
    DECLARE vno_tlp VARCHAR(12);
    DECLARE vjenis_kelamin VARCHAR(2);
    DECLARE vhobi VARCHAR(20);
    DECLARE vumur INT(20);

SET vnim = nim;
SET vnama = namaMahasiswa;
SET valamat = alamat;
SET vno_tlp = no_tlp;
SET vjenis_kelamin = jenis_kelamin;
SET vhobi = hobi;
SET vumur = umur;

SELECT vnim AS NIM, 
vnama AS Nama_Mahasiswa, 
valamat AS Alamat,
vno_tlp AS Nomor_Telepon,
vjenis_kelamin AS Jenis_Kelamin, 
vhobi AS Hobi, vumur AS Umur;

END//
DELIMITER;

CALL biodatamahasiswa(2204411, 'Vigo', 'Surabaya' , '085733987860' ,'L', 'Membuat Cerita',20);


-- Tugas No 2 

USE perpustakaan;
DELIMITER //
CREATE PROCEDURE cekPengingat19 (
    IN kode VARCHAR(10)
)
BEGIN
    DECLARE selisih_hari INT;
    DECLARE pengingatan VARCHAR(255);

    SELECT DATEDIFF(tanggal_kembali, tanggal_pinjam) INTO selisih_hari FROM peminjaman WHERE kode_peminjaman = kode;
    
    IF (selisih_hari <= 2) THEN
        SET pengingatan = 'Silahkan Pergunakan Buku Dengan Baik';
    ELSEIF (selisih_hari >= 3 AND selisih_hari <= 5) THEN
        SET pengingatan = 'Waktu Pinjam Segera Habis';
    ELSE
        SET pengingatan = 'Warning!, Denda Menanti Anda';
    END IF;
    
    SELECT pengingatan;

END//
DELIMITER ;

CALL cekPengingat19('909');
SELECT*FROM peminjaman

-- Tugas No 3
DELIMITER //
CREATE PROCEDURE cekDenda4(
    IN kode VARCHAR(10)
)
BEGIN
    DECLARE denda_total INT;
    DECLARE informasi VARCHAR(255);
    DECLARE informasi1 VARCHAR(255);

    SELECT SUM(denda) INTO denda_total FROM pengembalian WHERE idAnggota = kode;
    
    SET informasi1='Mahasiswa ini Memiliki Denda Total = ';
    IF (denda_total = 0) THEN
        SET informasi = 'Mahasiswa Ini Tidak memiliki Denda';
    ELSE
        SET informasi = CONCAT(informasi1,denda_total);
    END IF;
    
    SELECT informasi;

END//
DELIMITER ;

CALL cekDenda4('204');
SELECT*FROM pengembalian;

-- Tugas No 4
DELIMITER //
CREATE PROCEDURE tampilkanData4 (
    IN jumlah INT
)
BEGIN
    DECLARE ini INT DEFAULT 0;

    WHILE ini <= jumlah DO
        SELECT * FROM peminjaman LIMIT ini,1; 
        SET ini = ini + 1;
    END WHILE;
END//
DELIMITER ;

CALL tampilkanData4(10);
SELECT*FROM peminjaman;

DELIMITER //
CREATE PROCEDURE updarestok(IN idbarang)
BEGIN 
WHILE stokBarang < 5 DO 
UPDATE barang  

END //

DELIMITER ;

-- Tugas No 5
DELIMITER //
CREATE PROCEDURE HapusAnggota8(
IN jenis VARCHAR(2)
)
BEGIN
    DELETE FROM anggota
    WHERE jenis_kelamin = jenis
    AND idAnggota NOT IN (
        SELECT DISTINCT idAnggota 
        FROM peminjaman
    );
END //

DELIMITER ;
CALL HapusAnggota8('L');

SELECT*FROM anggota;



CREATE PROCEDURE updatestok(IN idBarang INT)
BEGIN 
UPDATE 