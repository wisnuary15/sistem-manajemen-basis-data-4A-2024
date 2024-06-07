USE perpustakaan;

-- no 1 --
DELIMITER //
CREATE PROCEDURE biodata(
    IN nim INT,
    IN nama VARCHAR(20),
    IN alamat VARCHAR(20),
    IN noTelp INT,
    IN jenisKelamin VARCHAR(1),
    IN hobi VARCHAR(20),
    IN umur INT
)
BEGIN
    DECLARE vNim INT;
    DECLARE vNamaM VARCHAR(20);
    DECLARE vAlamat VARCHAR(20);
    DECLARE vNoTelp INT;
    DECLARE vJenisKelamin VARCHAR(1);
    DECLARE vHobi VARCHAR(20);
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
END//
DELIMITER;

CALL biodata (21044110093, 'Danial', 'Bandung', 087291165112, 'L', 'Riding', 21);

-- no 2 --
DELIMITER //
CREATE PROCEDURE peringatan()
BEGIN 
	SELECT id_kembali, id_anggota, tgl_pinjam, tgl_kembali, 
	DATEDIFF(tgl_kembali, tgl_pinjam) AS lama_meminjam,
	CASE WHEN DATEDIFF(tgl_kembali, tgl_pinjam) <= 2 THEN ' Silahkan Pergunakan Buku'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) BETWEEN 3 AND 5 THEN  ' Ingat!, Waktu pinjam segera habis'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) >= 6 THEN ' Warning!!!, Denda menanti anda' END AS "status"
	FROM pengembalian ORDER BY lama_meminjam ASC;
END // 
DELIMITER ;
CALL peringatan();
DROP PROCEDURE peringatan;

-- no 3 --
DELIMITER//
CREATE PROCEDURE denda(
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
CALL denda('315');
DROP PROCEDURE denda;

-- no 4 --
DELIMITER //
CREATE PROCEDURE cetak_pinjam (
	IN jumlah INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= jumlah DO
        SELECT * FROM peminjaman LIMIT jumlah;
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

CALL cetak_pinjam(10);
DROP PROCEDURE cetak_pinjam;


-- no 5--
DELIMITER//
CREATE PROCEDURE hapus_anggota ()
BEGIN
	 DELETE FROM Anggota
    WHERE jenis_kelamin = 'Laki-laki'
    AND id_anggota NOT IN (
        SELECT DISTINCT id_anggota 
        FROM peminjaman 
        WHERE status_pinjam != "tidak pinjam"
    );
END//
DELIMITER ;

CALL hapus_anggota ();
DROP PROCEDURE hapus_anggota;