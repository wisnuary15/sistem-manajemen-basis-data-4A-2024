create database modull6;

use modull6

-- Nomor 1

DELIMITER //
CREATE PROCEDURE Biodata (
	IN nim INT(12),
	IN namaMhs VARCHAR (50),
	IN alamat VARCHAR (20),
	IN noTelp INT (12),
	IN jenisKelamin VARCHAR (1),
	IN hobi VARCHAR (20),
	IN tanggal DATE,
	IN umur INT (4)
)
BEGIN
	DECLARE vNim INT(12);
	DECLARE vNamaMhs VARCHAR(50);
	DECLARE vAlamat VARCHAR (20);
	DECLARE vNoTelp INT(12);
	DECLARE vJenisKelamin VARCHAR(1);
	DECLARE vHobi VARCHAR(20);
	DECLARE vTanggal DATE;
	DECLARE vUmur INT (4);
	
	SET vNim = nim;
	SET vNamaMhs = namaMhs;
	SET vAlamat = alamat;
	SET vNoTelp = noTelp;
	SET vJenisKelamin = jenisKelamin;
	SET vHobi = hobi;
	SET vTanggal = tanggal;
	SET vUmur = TIMESTAMPDIFF(YEAR, vTanggal, CURDATE());

	SELECT vNim AS NIM,vNamaMhs AS Nama_Mahasiswa,vAlamat AS Alamat,
	vNoTelp AS No_Telepon, vJenisKelamin AS Jenis_Kelamin, vHobi AS Hobi,
	vTanggal AS Tanggal, vUmur AS Umur;
END//
DELIMITER;

CALL Biodata(220441100123,'Robi','Jakarta',0891231923,'L','Voli','2001-02-10','');

-- Nomor 2

DELIMITER //
CREATE PROCEDURE IngatKembali(
	IN nama VARCHAR (100),
	IN tanggal_pinjam DATE
)
BEGIN 
	DECLARE vNama VARCHAR (100);
	DECLARE pengembalian INT;
	DECLARE vKeterangan VARCHAR (100);
	
	SET vNama = nama;
	SET pengembalian = DATEDIFF(CURDATE(),tanggal_pinjam);
	
	IF pengembalian <= 2 THEN 
	SET vKeterangan = 'Silahkan Gunakan Buku Dengan Baik';
	
	ELSEIF pengembalian >= 3 AND pengembalian <= 5 THEN 
	SET vKeterangan = 'Waktu Pinjam Anda Hampir Habis';
	
	ELSE 
	SET vKeterangan = 'Warning!! Denda Menanti Anda';
	END IF;
	
	SELECT Vnama,vKeterangan AS Keterangan_Pengingat;
END//
DELIMITER;

CALL IngatKembali('Rafly','2024-05-04');
CALL IngatKembali('Robu','2024-05-04');

DROP PROCEDURE IngatKembali;

-- Nomor 3

DELIMITER //
CREATE PROCEDURE CekDenda(
	IN nomor_siswa VARCHAR(10)
)
BEGIN
    DECLARE fine_count INT;
    DECLARE keterangan VARCHAR(100);

    SELECT COUNT(*) INTO fine_count
    FROM pengembalian
    WHERE id_anggota = nomor_siswa AND denda != 'Rp.0';

    IF fine_count > 0 THEN
        SELECT * FROM pengembalian
        WHERE id_anggota = nomor_siswa AND denda != 'Rp.0';
    ELSE
        SET keterangan = 'Mahasiswa tidak memiliki tanggungan atau denda.';
    END IF;
	SELECT keterangan AS Keterangan_denda;
END //
DELIMITER ;

DROP PROCEDURE CekDenda;

CALL CekDenda('502');

-- Nomor 4

DELIMITER//
CREATE PROCEDURE Data_Peminjam(
	IN batas INT(3)
)
BEGIN
	DECLARE i INT;
	SET i = 1;
	WHILE i <= batas DO
		SET i = i +1;
	END WHILE;

	SELECT * FROM peminjaman WHERE kode_peminjaman <=
	batas ORDER BY kode_peminjaman ASC;
END//
DELIMITER;
CALL Data_Peminjam(501)
DROP PROCEDURE Data_Peminjam;

-- Nomor 5

DELIMITER//
CREATE PROCEDURE hapusAgt()
BEGIN
	DELETE FROM anggota 
	WHERE jenis_kelamin = "laki-laki" AND id_anggota
	NOT IN (SELECT id_anggota FROM peminjaman);
END//
DELIMITER//

CALL hapusAgt();