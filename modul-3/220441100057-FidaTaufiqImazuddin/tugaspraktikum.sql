USE library;
-- 1. Buatlah sebuah prosedur dengan menggunakan parameter IN default
DELIMITER //
CREATE PROCEDURE getNamaBukuu(
	IN penerbit VARCHAR(200))
BEGIN
	SELECT * FROM buku WHERE penerbit_buku = penerbit;
END //
DELIMITER;

CALL getNamaBukuu('Gramedia Pustaka Utama');

SELECT * FROM buku
-- 2. Definisikan stored procedure untuk mengetahui data pada salah satu table dengan berdasarkan pada salah satu atribut/field 
CREATE PROCEDURE getBuku(
	IN kode VARCHAR(200))
BEGIN
	SELECT * FROM buku WHERE kode_buku = kode;
END //
DELIMITER;
CALL getBuku('BK002');


-- 3. Definisikan stored procedure untuk mengetahui data pada salah satu table dengan berdasarkan pada dua atribut/field.
CREATE PROCEDURE getAnggota(
	IN jenkel VARCHAR(100),
	IN almt VARCHAR(100))
BEGIN
	SELECT * FROM anggota WHERE jenis_kelamin = jenkel AND tempat_lahir_anggota = almt;
END //
DELIMITER;
CALL getAnggota('Laki-laki', 'Jakarta');


-- 4. Definisikan stored procedure untuk mengetahui data pada salah satu table dengan berdasarkan pada tiga atribut/field
CREATE PROCEDURE getPengembalian(
	IN Anggota VARCHAR(100),
	IN kodebuku VARCHAR(100),
	IN petugas VARCHAR(100))
BEGIN
	SELECT * FROM pengembalian 
	WHERE idAnggota = Anggota 
	AND kode_buku = kodebuku 
	AND idPetugas = petugas;		
END //
DELIMITER;
CALL getPengembalian('A001','BK010','PTG001');

SELECT* FROM petugas;
-- 5. Definisikan stored procedure untuk memasukkan data pada salah satu table
CREATE PROCEDURE insertToPetugas (
	IN idPetugas VARCHAR(10), 
	IN username VARCHAR(15), 
	IN PASSWORD VARCHAR(15), 
	IN nama VARCHAR(25))
BEGIN
	INSERT INTO petugas (idPetugas, username, PASSWORD, nama) VALUES (idPetugas, username, PASSWORD, nama);
END //
DELIMITER;
CALL insertToPetugas('PTG006','Santoso','pw1','Rohmat Santoso');


-- 6. Definisikan stored procedure untuk mengetahui data pada salah satu table menggunakan parameter OUT
CREATE PROCEDURE getBanyakBuku(
	OUT total_buku INT)
BEGIN
	SELECT COUNT(kode_buku) INTO total_buku FROM buku;
END //
DELIMITER;
CALL getBanyakBuku(@total_buku);
SELECT @total_buku;


-- 7. Definisikan stored procedure untuk mengetahui data pada salah satu table menggunakan parameter INOUT
CREATE PROCEDURE tambahJumlahBuku(
	INOUT `jmlBuku` INT, 
	IN `kodeBuku` VARCHAR(10))
BEGIN
	SET jmlBuku = jmlBuku + 5;
	UPDATE buku SET jumlah_buku = jmlBuku WHERE kode_buku = kodeBuku;

END //
DELIMITER;

SET @stokjmlbuku = 20;
CALL tambahJumlahBuku (@stokjmlbuku, 'BK006');
SELECT @stokjmlbuku AS Buku BK006 stok berubah;

SELECT * FROM buku;