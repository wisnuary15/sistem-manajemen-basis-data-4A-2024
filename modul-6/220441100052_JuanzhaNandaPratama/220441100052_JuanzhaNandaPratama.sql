USE perpustakaan;

-- Nomor 1
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

CALL BIODATA('Juanzha Nanda P','220441100052','Blora','2005-11-22','081217081945','Laki-laki','Ngaji');

-- Nomor 2

DELIMITER //
CREATE PROCEDURE pengingat()
	BEGIN
	SELECT kode_pinjaman, id_anggota,id_petugas ,tanggal_pinjam, tanggal_kembali, CONCAT(DATEDIFF(tanggal_kembali, tanggal_pinjam),' Hari') AS Lama_Pinjam,
	CASE
		WHEN DATEDIFF(Tanggal_Kembali, Tanggal_Pinjam)<= 2 THEN 'Silakan pergunakan buku dengan baik'
		WHEN DATEDIFF(Tanggal_Kembali, Tanggal_Pinjam)BETWEEN 3 AND 5 THEN 'Ingat! Waktu Pinjam Segera Habis!'
		WHEN DATEDIFF(Tanggal_Kembali, Tanggal_Pinjam) >= 6 THEN 'Warning!!!, Denda Menanti Anda!'
	END AS Status_Pinjam
	FROM pinjaman ORDER BY Lama_Pinjam DESC;
END //
DELIMITER ;
CALL pengingat();
SELECT*FROM pinjaman;
DROP PROCEDURE pengingat;

-- Nomor 3


DELIMITER //
CREATE PROCEDURE lihatdenda(IN Id_Mahasiswa VARCHAR(20))
	BEGIN
		DECLARE pesan VARCHAR(100);
		IF (SELECT SUM(Denda) FROM pengembalian WHERE id_anggota = Id_Mahasiswa) > 0 THEN
			SET pesan = 'Anda Memiliki Tanggungan Denda, Bayar Segera!';
			SELECT Id_Mahasiswa,(SELECT SUM(Denda) FROM pengembalian WHERE id_anggota = Id_Mahasiswa) AS Tanggungan, Pesan;
				
			ELSEIF (SELECT SUM(Denda)FROM pengembalian WHERE id_anggota = Id_Mahasiswa) = 0 THEN
			SET pesan = 'Anda Tidak Memiliki Tanggungan Denda!';
			SELECT Id_Mahasiswa,(SELECT SUM(Denda) FROM pengembalian WHERE id_anggota= Id_Mahasiswa) AS Tanggungan, Pesan;
					
			ELSE
			SET pesan = "Data tidak tersedia";

			SELECT pesan;
		END IF;
	END //
DELIMITER ;
CALL lihatdenda('agt007');
SELECT*FROM pengembalian;
DROP PROCEDURE lihatdenda;

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
    
    SELECT * FROM pinjaman ORDER BY kode_pinjaman ASC LIMIT batas;
END//
DELIMITER ;

CALL CetakSiswa(10);
DROP PROCEDURE CetakSiswa

-- Nomor 5

DELIMITER //
CREATE PROCEDURE IF NOT EXISTS HapusMhs (
    IN nomor VARCHAR(10)
)
BEGIN 
    DECLARE Keterangan VARCHAR(100);
    DECLARE Nomor_Siswa INT;

    SELECT COUNT(*) INTO Nomor_Siswa FROM pinjaman WHERE id_anggota = nomor;

    IF Nomor_Siswa = 0 THEN    
	DELETE FROM anggota WHERE id_anggota = nomor AND jenis_kelamin = 'laki-Laki';
	SET Keterangan = 'Data Berhasil Dihapus';
    
    ELSE 
	SET Keterangan = 'Buku Belum Dikembalikan'; 
    END IF;
    
    SELECT Keterangan;
END //
DELIMITER ;


SELECT * FROM pinjaman;
SELECT * FROM anggota;
CALL HapusMhs('agt008');
DROP PROCEDURE HapusMhs;



