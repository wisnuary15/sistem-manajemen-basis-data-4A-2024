-- soal 1
DELIMITER //
CREATE PROCEDURE soal1(
	IN user_name VARCHAR (20)
	)
BEGIN
	SELECT * FROM petugas WHERE username = user_name;
END //
DELIMITER;
CALL soal1 ('panji');

-- soal 2
DELIMITER //
CREATE PROCEDURE soal2(
	IN nama VARCHAR (100)
	)
BEGIN
	SELECT * FROM anggota WHERE nama_anggota = nama;
END //
DELIMITER ;
CALL soal2('agus');

-- soal 3
DELIMITER //
CREATE PROCEDURE soal3(
	IN id INT(20),
	IN nama VARCHAR(20)
	)
BEGIN
	SELECT * FROM anggota
	WHERE id_anggota = id AND nama_anggota = nama;
END //
DELIMITER ;
CALL soal3(301, 'agus');
SELECT *FROM buku;

-- soal 4
DELIMITER //
CREATE PROCEDURE soal4(
	IN tempat VARCHAR(20),
	IN jenkel VARCHAR(20),
	IN statuse VARCHAR(10)
)
BEGIN
	SELECT * FROM anggota
	WHERE tempat_lahir_anggota = tempat AND jenis_kelamin = jenkel AND status_pinjam = statuse;
END //
DELIMITER ;
CALL soal4('Surabaya', 'perempuan', 'meminjam');

-- soal 5
DELIMITER //
CREATE PROCEDURE soal5 (
    IN id INT (10) ,
    IN user_name VARCHAR(100),
    IN pw VARCHAR(100),
    IN nama VARCHAR(100)
)
BEGIN
    INSERT INTO petugas
    VALUES (id, user_name, pw,nama);
END //
DELIMITER ;
CALL soal5 (204, "dewi", "dewi123", "Dewi Sarti");
SELECT *FROM petugas;

-- soal 6
DELIMITER //
CREATE PROCEDURE soal6 (
	OUT jumlah_pinjam INT
	)
BEGIN
	SELECT COUNT(*) INTO jumlah_pinjam FROM peminjaman; 
END//
DELIMITER ;

CALL soal6 (@jumlah_pinjam);
SELECT @jumlah_pinjam;

-- soal 7
DELIMITER //
CREATE PROCEDURE soal7(
    IN tgl DATE,
    IN kode INT,
    OUT soal7 INT
)
BEGIN
    SELECT COUNT(*) INTO soal7
    FROM peminjaman
    WHERE tgl_pinjam = tgl AND kode_buku = kode;
END //
DELIMITER ;
SET @soal7 := 0;
CALL soal7('2024-04-02', 101, @soal7);
SELECT @soal7 AS 'Jumlah Peminjam (2024-04-02) dan Kode Buku 101';
SELECT *FROM peminjaman;