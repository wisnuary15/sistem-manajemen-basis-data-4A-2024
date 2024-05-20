CREATE DATABASE toko_buku;

USE toko_buku;

CREATE TABLE IF NOT EXISTS penulis(
id_penulis INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama VARCHAR (20) NOT NULL,
negara VARCHAR (20) NOT NULL);

CREATE TABLE IF NOT EXISTS buku(
id_buku INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
judul VARCHAR (20) NOT NULL,
id_penulis INT (3) NOT NULL,
harga INT (10) NOT NULL,
stok INT (10) NOT NULL);

CREATE TABLE IF NOT EXISTS penjualan(
id_penjualan INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_buku INT (3) NOT NULL,
tanggal DATE NOT NULL,
jumlah INT (10));


INSERT INTO penulis (nama, negara) VALUES
('Ardi', 'Indoneisa'),
('Risto', 'Jepang'),
('akai', 'Cina');


INSERT INTO buku (judul, id_penulis, harga, stok) VALUES
('Bumi', 1, 90000, 10),
('Pasti Bisa', 2, 75000, 11),
('Pulang', 3, 89000, 9),
('Bulan', 1, 88000, 29),
('Pergi', 3, 99000, 25);


ALTER TABLE buku ADD CONSTRAINT fk_buku FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis);
ALTER TABLE penjualan ADD CONSTRAINT fk_penulis FOREIGN KEY (id_buku) REFERENCES buku(id_buku);

CREATE VIEW viewBukuPenulis AS
SELECT  b.judul AS judul_buku, MAX(b.harga) AS harga, SUM(b.stok) AS stok, p.nama AS nama_penulis, p.negara AS negara_penulis
FROM buku b 
JOIN penulis p ON b.id_penulis = p.id_penulis 
GROUP BY b.judul
ORDER BY harga ASC
LIMIT 5;

SELECT * FROM viewBukuPenulis;

DROP VIEW viewBukuPenulis;



DELIMITER//
CREATE PROCEDURE tambah_penjualan(
	IN id_buku INT,
	IN tanggal DATE,
	IN jumlah INT
)
BEGIN
	INSERT INTO penjualan (id_buku, tanggal, jumlah)
	SELECT id_buku, tanggal, jumlah FROM buku LIMIT 1;

	SELECT 'Penjualan/Alert Berhail ditambahkan' AS hasil;
END //
DELIMITER;


CALL tambah_penjualan (1, '2024-05-09', 2);

DROP PROCEDURE tambah_penjualan;

CREATE VIEW penjualanTerbanyak AS
SELECT b.judul AS judul_buku, p.nama, nama_penuls, j.sum(id_penjualan) AS total penjualan
FROM buku b  JOIN penulis p ON b.id_penulis = p.id_penulis 
JOIN penjualan j ON j.id_ buku = b.id_buku
;

SELECT * FROM penjualanTerbanyak;


