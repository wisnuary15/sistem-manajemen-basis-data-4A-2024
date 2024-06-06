CREATE DATABASE toko;
USE toko;

CREATE TABLE barang(
id_barang INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_barang VARCHAR(25) NOT NULL,
stok INT(100) NOT NULL,
min_stock INT(100) NOT NULL,
deskripsi VARCHAR(25) NOT NULL);

INSERT INTO barang (nama_barang, stok, min_stock, deskripsi) VALUES
("Pensil", 7, 3, "barang bagus dan memenuhi stok"),
("Penghapus", 10, 2, "barang bagus dan memenuhi stok"),
("Penggaris", 2, 3, "barang rusak dan memenuhi stok"),
("Bolpoin", 0, 3, "barang bagus dan memenuhi stok"),
("Buku", 1, 2, "barang bagus dan memenuhi stok"),
("Buku_gambar", 7, 3, "barang rusak dan memenuhi stok"),
("stabilo", 0, 3, "barang rusak dan memenuhi stok"),
("Penghapus", 11, 3, "barang bagus dan memenuhi stok"),
("kotak_pensil", 4, 2, "barang bagus dan memenuhi stok"),
("crayon", 1, 2, "barang bagus dan memenuhi stok");
SELECT * FROM barang;


/*Nomor 1*/
DELIMITER//
CREATE PROCEDURE stok_minimum()
BEGIN
	SELECT * FROM barang WHERE stok < min_stock;
END//
DELIMITER ;
CALL stok_minimum()

/*Nomor 2*/
DELIMITER//
CREATE PROCEDURE status_barang()
BEGIN
	SELECT stok AS stok_barang,
	CASE 
	   WHEN stok = 0 THEN 'habis'
	   WHEN stok > 0 THEN stok
	END AS deskripsi
	FROM barang;
END//
DELIMITER;

CALL status_barang;
DROP PROCEDURE status_barang;

/*Nomor 3*/
DELIMITER//
CREATE PROCEDURE tambah_stok()
BEGIN
	UPDATE barang SET stok = min_stock WHERE stok < min_stock;
END//
DELIMITER;
CALL tambah_stok()
SELECT * FROM barang;

