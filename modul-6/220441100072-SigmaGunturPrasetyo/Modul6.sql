
/* Nomer 1*/

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

CALL Biodata(220444444,'Tomini','Jakarta',0891231923,'L','Mancing','2002-03-03','');

/* Nomor 2*/

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

DROP PROCEDURE IngatKembali;

CALL IngatKembali('Sigma','2024-05-04');

/* Nomor 3 */



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
CALL CheckStudentFine('A001');

-- Nomor 4
DELIMITER //
CREATE PROCEDURE CetakSiswa (
    IN batas INT
)
BEGIN
    DECLARE i INT;
    SET i = 1;
    
    REPEAT 
        SET i = i + 1;
    UNTIL i > batas END REPEAT;
    
    SELECT * FROM peminjaman ORDER BY kode_peminjaman ASC LIMIT batas;
END//
DELIMITER ;

CALL CetakSiswa(10);
DROP PROCEDURE CetakSiswa

SELECT * FROM anggota WHERE jenis_kelamin = "Laki-Laki";
SELECT * FROM anggota ;

-- Nomor 5
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS HapusMhs (
    IN nomor VARCHAR(10)
)
BEGIN 
    DECLARE Keterangan VARCHAR(100);
    DECLARE Nomor_Siswa INT;

    SELECT COUNT(*) INTO Nomor_Siswa FROM peminjaman WHERE id_anggota = nomor;

    IF Nomor_Siswa = 0 THEN    
	DELETE FROM anggota WHERE id_anggota = nomor AND jenis_kelamin = 'Laki-Laki';
	SET Keterangan = 'Data Berhasil Dihapus';
    
    ELSE 
	SET Keterangan = 'Buku Belum Dikembalikan'; 
    END IF;
    
    SELECT Keterangan;
END //
DELIMITER ;


SELECT * FROM peminjaman;
SELECT * FROM anggota;
DROP PROCEDURE HapusMhs;
CALL HapusMhs('A001');


