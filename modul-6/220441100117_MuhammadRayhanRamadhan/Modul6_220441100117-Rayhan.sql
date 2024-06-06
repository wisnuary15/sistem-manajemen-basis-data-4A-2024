-- Modul 6

-- nomor1
DELIMITER//
CREATE PROCEDURE biodataMhs(
IN nim INT(20),
IN namaMhs VARCHAR (20),
IN alamat VARCHAR (20),
IN jenisKelamin VARCHAR (1),
IN noTlp INT (12),
IN umur VARCHAR (2),
IN hobi VARCHAR (12)
)
BEGIN
DECLARE vNim INT (20);
DECLARE vNamaMhs VARCHAR (20);
DECLARE vAlamat VARCHAR (20);
DECLARE vJenisKelamin VARCHAR (1);
DECLARE vNoTlp INT (12);
DECLARE vUmur INT (2);
DECLARE vHobi VARCHAR (12);

SET Vnim = nim;
SET vNamaMhs = namaMhs;
SET vAlamat = alamat;
SET vJenisKelamin = jenisKelamin;
SET vNoTlp = noTlp;
SET vUmur = umur;
SET vHobi = hobi;


SELECT vNim AS NIM, 
vNamaMhs AS Nama_Mahasiswa,
vAlamat AS Alamat, 
vJenisKelamin AS Jenis_Kelamin, 
vNoTlp AS no_tlp, 
vUmur AS Umur,
vHobi AS Hobi;
END//
DELIMITER//

CALL biodataMhs(22117,'Muhammad Rayhan Ramadhan','Jombang','L',098654322,20,'Basket Ball')

-- nomor 2
DELIMITER//
CREATE PROCEDURE pengembalianBuku(
	IN tgl_pinjam DATE
)
BEGIN 
	DECLARE pengembalian INT;
	DECLARE vInformasi VARCHAR (100);
	
	
	SET pengembalian = DATEDIFF(CURDATE(),tgl_pinjam);
	
	IF pengembalian <= 2 THEN 
	SET vInformasi = 'Silahkan Gunakan Buku Dengan Baik';
	
	ELSEIF pengembalian >= 3 AND pengembalian <= 5 THEN 
	SET vInformasi = 'Waktu Pinjam Anda Hampir Habis';
	
	ELSE 
	SET vInformasi = 'Warning!! Denda Menanti Anda';
	END IF;
	
	SELECT vInformasi AS Informasi;
END//
DELIMITER//
CALL pengembalianBuku('2024-05-06');

-- nomer3
DELIMITER //
CREATE PROCEDURE denda_siswa(
	IN id_mahasiswa INT (3)
)
BEGIN
    DECLARE perhitungan INT;
    DECLARE keterangan VARCHAR(100);

    SELECT COUNT(*) INTO perhitungan
    FROM pengembalian
    WHERE id_anggota = id_mahasiswa AND denah != 'Rp.0';

    IF perhitungan > 0 THEN
        SELECT kode_kembali, kode_buku,tgl_pinjam, tgl_kembali, denah
        FROM pengembalian
        WHERE id_anggota = id_mahasiswa AND denah != 'Rp.0';
    ELSE
        SET keterangan = 'Mahasiswa tidak memiliki tanggungan atau denda.';
    END IF;
	SELECT keterangan AS Keterangan_denda;
END //
DELIMITER ;
CALL denda_siswa(1);


-- nomer4
DELIMITER//
CREATE PROCEDURE dataPeminjam(
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
CALL dataPeminjam(4)
DROP PROCEDURE dataPeminjam;

-- nomer5
DELIMITER//
CREATE PROCEDURE hapusAgt()
BEGIN
	DELETE FROM anggota 
	WHERE jenis_kelamin = "Pria" AND id_anggota
	NOT IN (SELECT id_anggota FROM peminjaman);
END//
DELIMITER//

CALL hapusAgt();