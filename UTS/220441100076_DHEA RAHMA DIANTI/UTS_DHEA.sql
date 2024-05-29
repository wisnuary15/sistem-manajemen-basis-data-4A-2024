CREATE DATABASE toko_buku;

USE toko_buku;

CREATE TABLE IF NOT EXISTS penulis (
id_penulis INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
nama VARCHAR(100), 
negara VARCHAR(50));

INSERT INTO penulis(nama, negara) VALUES
('Andrea Hirata', 'Indonesia'),
('Raditya Dika', 'Indonesia'),
('Pidi Baiq', 'Indonesia'),
('William Shakespeare', 'Inggris'),
('JK Rowling', 'Inggris');

DROP TABLE penulis;

CREATE TABLE IF NOT EXISTS buku(
 id_buku INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 judul VARCHAR(100), 
 id_penulis INT(10),
 harga INT(50),
 stok INT(50),
 FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

INSERT INTO buku(judul, id_penulis, harga, stok) VALUES
('Laskar Pelangi', 1, 85000, 30),
('Kambing Jantan', 2, 55000, 20),
('Dillan Tahun 1990', 3, 90000, 40),
('Romeo and Juliet', 4, 110000, 50),
('Harry Poter', 5, 150000, 50);

DROP TABLE buku;

CREATE TABLE IF NOT EXISTS penjualan (
id_penjualan INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
id_buku INT(10), 
tanggal DATE, 
jumlah INT(50),
FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);

INSERT INTO penjualan(id_buku, tanggal, jumlah) VALUES
( 1, 85000, 30),
( 2, 55000, 20),
( 3, 90000, 40),
(4, 110000, 50),
(5, 150000, 50);
DROP TABLE penjualan;

CREATE VIEW vw_BukuPenulis AS SELECT judul, nama, negara, harga, stok
FROM penulis a JOIN buku b ON a.id_penulis = b.id_penulis 
GROUP BY a.nama, a.negara, b.judul, b.harga, b.stok;

SELECT *FROM vw_BukuPenulis;

DROP VIEW vw_BukuPenulis;

CREATE VIEW vw_HargaBuku AS SELECT judul, harga
FROM penulis a JOIN buku b ON a.id_penulis = b.id_penulis 
ORDER BY harga ASC;

SELECT * FROM vw_HargaBuku;

-- No 3 --

DELIMITER // 
CREATE PROCEDURE insertToPenjualan(
 IN id_buku INT(200),
 IN tanggal DATE,
 IN jumlah INT(10),
)
BEGIN
	INSERT INTO penjualan
	VALUES (id_buku, tanggal, jumlah);
	DECLARE tbl_buku INT
	
	SELECT COUNT(*) INTO tbl_buku FROM penjualan WHERE id_buku = id_buku;
	
	IF tbl_buku > 0 THEN
		INSERT INTO penjualan(id_buku, jumlah, tanggal)
		VALUES (id_buku, jumlah, tanggal);
		SELECT 'Penjualan/Alert berhasil ditambahkan' AS hasil;

	ELSE

		SELECT 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!' AS hasil;
	END IF;
END//
DELIMITER;

DROP PROCEDURE IN

CALL insertToPenjualan(1, '2024-04-20', 15);
