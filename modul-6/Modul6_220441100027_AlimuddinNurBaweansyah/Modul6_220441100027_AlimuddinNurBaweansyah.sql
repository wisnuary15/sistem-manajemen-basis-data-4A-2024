use perpustakaan;

#NO1
DROP PROCEDURE IF EXISTS biodata;
DELIMITER //
CREATE PROCEDURE biodata(
	IN nama_mhs VARCHAR(20),
	IN nim_mhs VARCHAR(20),
	IN alamat_mhs VARCHAR(40),
	IN tgl_mhs DATE,
	IN tlpn_mhs VARCHAR(20),
	IN gender_mhs VARCHAR(20),
	IN hobi_mhs VARCHAR(20)
)
BEGIN
DECLARE Nama VARCHAR(20);
DECLARE NIM VARCHAR(20);
DECLARE Alamat VARCHAR(40);
DECLARE TTL DATE;
DECLARE Telepon VARCHAR(20);
DECLARE Jenis_Kelamin VARCHAR(20);
DECLARE Hobi VARCHAR(20);
DECLARE Umur INT;
	
SET Nama = nama_mhs;
SET NIM = nim_mhs;
SET Alamat = alamat_mhs;
SET TTL = tgl_mhs;
SET Telepon = tlpn_mhs;
SET Jenis_Kelamin = gender_mhs;
SET Hobi =hobi_mhs;
SET Umur = TIMESTAMPDIFF(YEAR, tgl_mhs, CURDATE());
SELECT Nama, NIM, Alamat, Telepon, Jenis_Kelamin, Hobi, Umur;
END //
DELIMITER ;

CALL BIODATA('Alimuddin Nur B','220441100027','Bawean','2003-03-16','089510212115','Laki-laki','Foto');

#NO2
DROP PROCEDURE IF EXISTS pengingat;
DELIMITER //
CREATE PROCEDURE pengingat()
	BEGIN
	SELECT Kode_Peminjaman, IdAnggota, Tanggal_Pinjam, Tanggal_Kembali, CONCAT(DATEDIFF(CURDATE(), Tanggal_Pinjam),' Hari') AS Lama_Pinjam,
	CASE
		WHEN DATEDIFF(CURDATE(), Tanggal_Pinjam)<= 2 THEN 'Silakan Pergunakan Buku dengan Baik!'
		WHEN DATEDIFF(CURDATE(), Tanggal_Pinjam)BETWEEN 3 AND 5 THEN 'Ingat!! Waktu Pinjam Segera Habis!'
		WHEN DATEDIFF(CURDATE(), Tanggal_Pinjam) >= 6 THEN 'Warning!!!, Denda Menanti Anda!'
	END AS Status_Pinjam
	FROM peminjaman ORDER BY Lama_Pinjam DESC;
END //
DELIMITER ;
CALL pengingat();
SELECT*FROM peminjaman;
DROP PROCEDURE pengingat;


#NO3
DROP PROCEDURE IF EXISTS periksadenda;
DELIMITER //
CREATE PROCEDURE periksadenda(IN Id_Mahasiswa VARCHAR(20))
	BEGIN
		DECLARE pesan VARCHAR(100);
		IF (SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = Id_Mahasiswa) > 0 THEN
			SET pesan = 'Anda Memiliki Tanggungan Denda, Bayar Segera!';
			SELECT Id_Mahasiswa,(SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = Id_Mahasiswa) AS Tanggungan, Pesan;
				
			ELSEIF (SELECT SUM(Denda)FROM pengembalian WHERE IdAnggota = Id_Mahasiswa) = 0 THEN
			SET pesan = 'Anda Tidak Memiliki Tanggungan Denda!';
			SELECT Id_Mahasiswa,(SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = Id_Mahasiswa) AS Tanggungan, Pesan;
					
			ELSE
			SET pesan = "Data tidak tersedia";

			SELECT pesan;
		END IF;
	END //
DELIMITER ;
CALL periksadenda('A013');
SELECT*FROM pengembalian;
DROP PROCEDURE periksadenda;


#NO4
DROP PROCEDURE IF EXISTS CetakDataPeminjaman;
DELIMITER //
CREATE PROCEDURE CetakDataPeminjaman(IN batas INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        WHILE i <= batas DO
            SET i = i + 1;
        END WHILE;
        SELECT*FROM peminjaman WHERE Kode_Peminjaman <= batas ORDER BY Kode_Peminjaman ASC;
    END //
DELIMITER ;
CALL CetakDataPeminjaman(10);

SET SQL_SAFE_UPDATES = 0;

#NO5
DROP PROCEDURE IF EXISTS jenkel;
DELIMITER //
CREATE PROCEDURE jenkel()
	BEGIN
		DELETE FROM anggota WHERE Jenis_Kelamin = "L" AND IdAnggota 
        NOT IN(SELECT IdAnggota FROM peminjaman);
	END//
DELIMITER ;
SELECT*FROM anggota;

CALL jenkel();