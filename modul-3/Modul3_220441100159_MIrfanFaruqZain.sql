USE perpustakaan;

NO.1
DELIMITER //
CREATE PROCEDURE getJKanggota(IN jeniskelamin VARCHAR(15))
	BEGIN
	SELECT * FROM anggota WHERE Jenis_Kelamin = jeniskelamin;
	END //
DELIMITER ;
CALL getJKanggota('L');

DROP PROCEDURE getJKanggota

NO.2
DELIMITER //
CREATE PROCEDURE getKodeBuku(IN kodebuku VARCHAR(10))
	BEGIN
	SELECT * FROM peminjaman WHERE Kode_Buku = kodebuku;
	END //
DELIMITER ;
CALL getKodeBuku('103');

NO.3
DELIMITER //
CREATE PROCEDURE getJudulPengarang(IN judul VARCHAR(25),IN pengarang VARCHAR(30))
	BEGIN 
	SELECT * FROM buku WHERE Judul_Buku = judul AND Pengarang_Buku = pengarang ;
	END //
DELIMITER ;
CALL getJudulPengarang('Matahari', 'Suzanne Collins');

NO.4
DELIMITER //
CREATE PROCEDURE getNamaAngktnLahir(IN nama VARCHAR (20),IN angkatan VARCHAR (6),IN tmptlahir VARCHAR (20))
	BEGIN 
	SELECT * FROM anggota WHERE Nama_Anggota = nama AND Angkatan_Anggota = angkatan AND Tempat_Lahir_Anggota = tmptlahir;
	END //
DELIMITER ;
CALL getNamaAngktnLahir('Budi Santoso', '2018', 'Jakarta');

NO.5
DELIMITER //
CREATE PROCEDURE getTambahAnggota(
	IN id_anggota VARCHAR(10),
	IN nama_anggota VARCHAR(20),
	IN angkatan_anggota VARCHAR(6),
	IN tempat_lahir VARCHAR(20),
	IN tanggal_lahir DATE,
	IN no_telp INT(12),
	IN jenis_kelamin VARCHAR(15),
	IN status_pinjam VARCHAR(15))
	BEGIN 
	INSERT INTO anggota VALUES (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam);
	END //
DELIMITER ;
CALL getTambahAnggota ("201", 'Budi Santoso', '2018', 'Jakarta', '1998-05-10', '08123456789', 'L', 'Aktif');
SELECT * FROM anggota;

NO.6
DELIMITER //
CREATE PROCEDURE getJumlahBuku(OUT jumlahBuku INT(3))
	BEGIN 
		SELECT COUNT(Jumlah_Buku) INTO jumlahBuku FROM buku;
	END //
DELIMITER ;
CALL getJumlahBuku(@jumlahBuku);
SELECT @jumlahBuku;


NO.7
DELIMITER //
CREATE PROCEDURE jumlah_buku(
	IN NamaPengarang VARCHAR (35),
	INOUT tahunTerbit VARCHAR (10),
	OUT totalBuku INT)
	BEGIN
	SELECT COUNT(*) INTO totalBuku
	FROM buku
	WHERE Pengarang_Buku = NamaPengarang AND Tahun_Buku = tahunTerbit;
	END //
DELIMITER ; 

SET @tahunTerbit = '2008';
CALL jumlah_buku('Suzanne Collins', @tahunTerbit , @totalBuku);
SELECT @totalBuku AS TotalBuku;