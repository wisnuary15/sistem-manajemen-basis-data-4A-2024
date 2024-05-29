USE Perpustakaan

-- no 1 --

DELIMITER //
CREATE PROCEDURE bio_mahasiswa(

	IN nama_mhs VARCHAR (20), 
	IN nim_mhs VARCHAR (20),
	IN alamat_mhs VARCHAR (40), 
	IN no_telpon_mhs INT,
	IN jenis_kelamin_mhs VARCHAR (20), 
	IN hobi_mhs VARCHAR (50),
	IN umur_mhs INT
)

BEGIN

	DECLARE nim VARCHAR (20);
	DECLARE nama VARCHAR (20);
	DECLARE alamat VARCHAR (20);
	DECLARE no_telpon INT;
	DECLARE jenis_kelamin VARCHAR (20);
	DECLARE hobi VARCHAR (20);
	DECLARE umur INT;
	SET nim = nim_mhs, nama = nama_mhs, alamat = alamat_mhs, no_telpon = no_telpon_mhs,
	jenis_kelamin = jenis_kelamin_mhs, hobi = hobi_mhs,umur = umur_mhs;
	SELECT nim, nama, alamat, no_telpon, jenis_kelamin, hobi, umur;
END //
DELIMITER ;

CALL bio_mahasiswa ('Irfan', '220441100159', 'SBY', 0821412050, 'Laki-laki', 'volly', 17)

-- no 2 --

DELIMITER $$
CREATE PROCEDURE peringatan()
BEGIN 
	SELECT kode_kembali, id_anggota, tanggal_pinjam, DATEDIFF(tanggal_kembali, tanggal_pinjam) AS lama_pinjam,
	CASE WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) <= 2 THEN ' Silahkan Pergunakan Buku'
	WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN  ' Ingat! Waktu pinjam segera habis'
	WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) >= 6 THEN ' Warning! Denda menanti anda' END AS "statusnya"
	FROM pengembalian ORDER BY lama_pinjam ASC;
END $$ 
DELIMITER ;
CALL peringatan();
DROP PROCEDURE peringatan;

-- no 3 --

DELIMITER//
CREATE PROCEDURE denda(
	IN idanggota VARCHAR(10))
BEGIN
DECLARE jumlah_denda VARCHAR (50);

	IF ((SELECT SUM(denda) FROM pengembalian WHERE id_anggota = idanggota) !=0) THEN
		SET jumlah_denda = (SELECT SUM(denda) FROM pengembalian WHERE id_anggota=idanggota);
	ELSE 	
		SET jumlah_denda = 'Anda tidak memiliki tanggungan/ denda';
	END IF;
		SELECT jumlah_denda;
END//
DELIMITER ;
CALL denda('8022');
DROP PROCEDURE denda;

-- no4 --

DELIMITER //
CREATE PROCEDURE cetak_pinjam (IN bil INT (10))
BEGIN 
	DECLARE i INT;
	SET i = 1;
	WHILE i <= bil DO
		SELECT * FROM peminjaman;
		SET i=i+1;
		
	END WHILE;
END //
DELIMITER ;
CALL cetak_pinjam(10);
DROP PROCEDURE cetak_pinjam;

-- no5 --

DELIMITER//
CREATE PROCEDURE hapus (IN jk VARCHAR(20))
BEGIN
	IF jk = 'Laki-laki' THEN DELETE FROM anggota WHERE jenis_kelamin = 'Laki-laki'
	AND status_pinjam !='tidakada';
	END IF;
END//
DELIMITER //
CALL hapus ('Laki-laki');
SELECT * FROM anggota;
DROP PROCEDURE hapus;