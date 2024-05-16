/*soal1*/
DELIMITER //
CREATE PROCEDURE soal1(
	IN nama_mhs VARCHAR(20),
	IN nim_mhs VARCHAR(20),
	IN alamat_mhs VARCHAR(40),
	IN tgl_mhs DATE,
	IN tlpn_mhs VARCHAR(20),
	IN gender_mhs VARCHAR(20),
	IN hobi_mhs VARCHAR(20),
	IN umur_mhs INT
)
BEGIN
	DECLARE NIM VARCHAR(20);
	DECLARE Nama VARCHAR(20);
	DECLARE Alamat VARCHAR(40);
	DECLARE TTL DATE;
	DECLARE Telepon VARCHAR(20);
	DECLARE Jenis_Kelamin VARCHAR(20);
	DECLARE Hobi VARCHAR(20);
	DECLARE Umur INT;

	SET NIM = nim_mhs;
	SET Nama = nama_mhs;
	SET Alamat = alamat_mhs;
	SET TTL = tgl_mhs;
	SET Telepon = tlpn_mhs;
	SET Jenis_Kelamin = gender_mhs;
	SET Hobi = hobi_mhs;
	SET Umur = TIMESTAMPDIFF(YEAR, tgl_mhs, CURDATE());
	SELECT NIM, Nama,  Alamat, Telepon, Jenis_Kelamin, Hobi, Umur;
END //
DELIMITER ;

CALL soal1('220441100140', 'Moh.Khairur Rozikhin', 'Jl.P.Trunojoyo', '2004-05-24', '081335558136', 'Laki - Laki', '-', NULL);



/*soal2*/
DELIMITER//
CREATE PROCEDURE soal2()
BEGIN
    SELECT 
        Kode_Peminjaman, 
        IdAnggota, 
        Tanggal_Pinjam,
        Tanggal_Kembali, 
        CONCAT(DATEDIFF(CURDATE(), Tanggal_Pinjam), ' Hari') AS Lama_Pinjam,
        CASE
            WHEN DATEDIFF(CURDATE(), Tanggal_Pinjam) <= 2 THEN 'Silakan Pergunakan Buku dengan Baik!'
            WHEN DATEDIFF(CURDATE(), Tanggal_Pinjam) BETWEEN 3 AND 5 THEN 'Ingat!! Waktu Pinjam Segera Habis!'
            WHEN DATEDIFF(CURDATE(), Tanggal_Pinjam) >= 6 THEN 'Warning!!!, Denda Menanti Anda!'
        END AS Status_Pinjam
    FROM 
        peminjaman 
    ORDER BY 
        Lama_Pinjam DESC;
END //
DELIMITER ;

CALL soal2();

SELECT * FROM peminjaman;

DROP PROCEDURE soal2;



/*soal3*/
DELIMITER //

CREATE PROCEDURE soal3 (IN Id_Mahasiswa VARCHAR(20))
BEGIN
    DECLARE pesan VARCHAR(100);

    IF (SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = Id_Mahasiswa) > 0 THEN
        SET pesan = 'Anda Memiliki Tanggungan Denda, Bayar Segera!';
    ELSEIF (SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = Id_Mahasiswa) = 0 THEN
        SET pesan = 'Anda Tidak Memiliki Tanggungan Denda!';
    ELSE
        SET pesan = "Data tidak tersedia";
    END IF;

    SELECT Id_Mahasiswa, (SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = Id_Mahasiswa) AS Tanggungan, pesan;
END //
DELIMITER ;

CALL soal3 ('A003');
SELECT * FROM pengembalian;


DROP PROCEDURE soal3;



/*soal4*/
DELIMITER //
CREATE PROCEDURE soal4(IN batas INT)
BEGIN
    DECLARE i INT;
    SET i = 1;
    
    WHILE i <= batas DO
        SET i = i + 1;
	SELECT * FROM peminjaman WHERE Kode_Peminjaman <= batas ORDER BY Kode_Peminjaman ASC;
    END WHILE;

END //
DELIMITER ;

CALL CetakDataPeminjaman(10);

DROP PROCEDURE IF EXISTS soal4;

/*soal5*/
DROP PROCEDURE jenkel;

DELIMITER //

CREATE PROCEDURE jenkel()
	BEGIN
	    DELETE FROM anggota WHERE Jenis_Kelamin = 'Laki laki' AND IdAnggota NOT IN (SELECT IdAnggota FROM peminjaman);
	END//
DELIMITER ;


SELECT * FROM anggota;
CALL jenkel();