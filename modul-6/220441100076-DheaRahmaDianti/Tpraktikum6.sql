-- create database perpus;

USE library;

-- NO 1 --
DELIMITER//
CREATE PROCEDURE biodata(
	IN nim INT(20),
	IN namaMhs VARCHAR(20),
	IN alamat VARCHAR(50),
	IN noTelp INT(12),
	IN jenisKelamin VARCHAR(20),
	IN hobi VARCHAR(15),
	IN tglLahir DATETIME,
	IN umur INT(2)
)
BEGIN 
	DECLARE vNim INT(20);
	DECLARE vNamaMhs VARCHAR(20);
	DECLARE vAlamat VARCHAR(50);
	DECLARE vNoTelp INT(12);
	DECLARE vJenisKelamin VARCHAR(20);
	DECLARE vHobi VARCHAR(15);
	DECLARE vTanggal_lahir DATETIME;
	DECLARE vUmur INT(2);
	
	SET vNim = nim;
	SET vNamaMhs = namaMhs;
	SET vAlamat = alamat;
	SET vNoTelp = noTelp;
	SET vJenisKelamin = jenisKelamin;
	SET vHobi = hobi;
	SET vTanggal_lahir = TIMESTAMPADD(YEAR, 1, tglLahir);
	SET vUmur = umur;
	
	SELECT vNim AS NIM, vNamaMhs AS Nama_Mahasiswa, vAlamat AS ALAMAT,
	vNoTelp AS No_Telp, vJenisKelamin AS Jenis_Kelamin, 
	vHobi AS HOBI, vTanggal_lahir AS tgl_lahir, vUmur AS UMUR;
	
END//
DELIMITER//

DROP PROCEDURE biodata;

CALL biodata(22076, 'Dhea Rahma', 'Bojonegoro', 085745631833, 'Perempuan', 'Insecure', '2003-05-23', 20);

-- No 2 --

DELIMITER //
CREATE PROCEDURE pengingat_pengembalian (IN Tgl_Pinjam DATE, IN Tgl_Kembali DATE)
BEGIN
    DECLARE hari_kembali INT;    
    DECLARE peringatan VARCHAR(50);

    SET hari_kembali = DATEDIFF(Tgl_Pinjam, Tgl_Kembali);
    -- SELECT hari_kembali AS 'Selisih Hari';

    IF hari_kembali <= 2 THEN
        SET peringatan = 'Silahkan Pergunakan Buku dengan baik';
    ELSEIF hari_kembali < 5 THEN
        SET peringatan = 'Ingat!, Waktu Pinjam segera habis';
    ELSEIF hari_kembali >= 6 THEN
        SET peringatan = 'Warning!!!, Denda Menanti Anda';
    END IF;
    
    SELECT peringatan AS 'Pesan Peringatan';

END//
DELIMITER ;

CALL pengingat_pengembalian('2024-03-25', '2024-03-21');

DROP PROCEDURE pengingat_pengembalian;

DELIMITER //
CREATE PROCEDURE hitung_selisih_tanggal (
    IN tgl_pinjam DATE,
    IN tgl_kembali DATE
)
BEGIN
    DECLARE selisih_hari INT;

    -- Menghitung selisih antara dua tanggal
    SET selisih_hari = DATEDIFF(tgl_kembali, tgl_pinjam);

    -- Mengembalikan hasil selisih hari
    SELECT selisih_hari AS 'Selisih Hari';
END//
DELIMITER ;

CALL hitung_selisih_tanggal('2024-03-21', '2024-03-30');


-- NO 3 --
DELIMITER //
CREATE PROCEDURE cek_denda(IN id_anggota INT)
BEGIN
    DECLARE jml_denda INT;
    DECLARE STATUS VARCHAR(50);

    SELECT SUM(Denda) INTO jml_denda FROM pengembalian WHERE idAnggota = id_anggota;

    IF (jml_denda > 0) THEN
        SET STATUS = 'Denda yang harus dibayar';
    ELSEIF (jml_denda = 0) THEN
        SET STATUS = 'Anda tidak memiliki denda';
    END IF;

    SELECT id_anggota, jml_denda, STATUS;
END//
DELIMITER //

CALL cek_denda('114');

DROP PROCEDURE cek_denda;

-- No 4 --

DELIMITER//
CREATE PROCEDURE data_peminjaman (IN batas INT)
BEGIN
	DECLARE i INT;
	SET i = 1;
	WHILE i <= batas DO
		-- SELECT * FROM peminjaman where Kode_Peminjaman = i ;
		SET i = i + 1;
		-- SELECT i AS 'Indeks Sekarang';
	END WHILE;
	SELECT * FROM peminjaman WHERE Kode_Peminjaman <= batas ORDER BY Kode_Peminjaman ASC ;
END//
DELIMITER//
 
CALL data_peminjaman(5);

DROP PROCEDURE data_peminjaman;

SELECT * FROM peminjaman;

-- NO 5 --

DELIMITER //
CREATE PROCEDURE gender_anggota()
    BEGIN
        DELETE FROM anggota WHERE jenis_kelamin = "Laki-Laki" AND idAnggota 
        NOT IN(SELECT idAnggota FROM peminjaman);
    END//
DELIMITER ;

CALL gender_anggota();
SELECT * FROM anggota;

DROP PROCEDURE gender_anggota;