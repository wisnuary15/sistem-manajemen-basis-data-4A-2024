/////NOMOR 1/////

CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE penulis (
	id_penulis INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nama VARCHAR (20) NOT NULL,
	negara VARCHAR (20) NOT NULL
);

INSERT INTO penulis(nama, negara) VALUES 
	('devi', 'indonesia'),
	('lita', 'german'),
	('anita', 'malaysia'),
	('kim mi so', 'korea'),
	('anna', 'belanda');

CREATE TABLE buku (
	id_buku INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	judul VARCHAR (30) NOT NULL,
	id_penulis INT (15) NOT NULL,
	harga INT (25) NOT NULL,
	stok INT (25) NOT NULL,
	FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

INSERT INTO buku(judul, id_penulis, harga, stok) VALUES 
	('dua dunia', '1', 99000, 45),
	('the genius', '3', 123000, 30),
	('pisa tower', '3', 80000, 30),
	('doa ku', '1', 50000, 20),
	('alice in wonderland', '4', 35000, 46),
	('harry potter', '4', 120000, 45),
	('mouse in the house', '4', 67000, 32),
	('the rose', '2', 87000, 32),
	('in your heart', '5', 55000, 25),
	('eyes', '2', 56000, 23);

CREATE TABLE penjualan (
    id_penjualan INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_buku INT(10) NOT NULL,
    tanggal DATE,
    jumlah INT (25) NOT NULL,
    FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);


/////NOMOR 2 & 3////

CREATE VIEW viewBukuPenulis AS 
SELECT 
	buku.judul,
	buku.stok,
	buku.harga,
	penulis.nama,
	penulis.negara
FROM buku JOIN penulis ON buku.id_buku = penulis.id_penulis ORDER BY harga DESC;
SELECT * FROM viewBukuPenulis;
DROP VIEW viewBukuPenulis;


/////NOMOR 4/////
DELIMITER //

CREATE PROCEDURE tambahPenjualan (
    IN id_bukuu VARCHAR(30),
    IN tanggal_baru DATE,
    IN jumlah_baru INT
)
BEGIN
    DECLARE id_buku INT;
    
    SELECT COUNT(*) INTO id_buku FROM buku WHERE id_buku = id_bukuu;
    
    IF id_buku > 0 THEN
        INSERT INTO penjualan (id_buku, tanggal, jumlah)
        VALUES (id_bukuu, tanggal_baru, jumlah_baru);
        SELECT 'Penjualan berhasil ditambahkan' AS hasil;
    ELSE
        SELECT 'Penjualan gagal dilakukan!' AS hasil;
    END IF;
END //
DELIMITER ;
CALL tambahPenjualan(1, '2024-05-01', 23);


/////NOMOR 6/////

DELIMITER //
CREATE PROCEDURE insertToBuku(
	IN id_buk INT(10),
	IN judul_buku VARCHAR (200),
	IN id_pen INT (10),
	IN hargaa INT (10),
	IN stokk INT(10)
)

BEGIN
	INSERT INTO buku
	VALUES (id_buku, judul, id_penulis, harga, stok);
END//
DELIMITER ;

CALL insertToBuku(11, 'dear allah', 1, 35000, 80);
DROP PROCEDURE insertToBuku;