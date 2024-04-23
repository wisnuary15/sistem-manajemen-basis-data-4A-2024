-- KUIS MODUL 2--
CREATE DATABASE gudang;
USE gudang;
CREATE TABLE barang(
id_barang INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_barang VARCHAR(25) NOT NULL,
jumlah INT(10) NOT NULL);
CREATE TABLE harga_barang(
id_barang INT(10) NOT NULL,
harga VARCHAR(10) NOT NULL,
FOREIGN KEY (id_barang) REFERENCES barang(id_barang));

INSERT INTO barang (nama_barang, jumlah) VALUES
('Pensil', 3),
('Penggaris', 2),
('Penghapus', 8),
('Bolpoin', 5),
('Spidol', 4);
SELECT * FROM barang;

INSERT INTO harga_barang (id_barang, harga) VALUES
(1, '3.000'),
(2, '2.000'),
(3, '1.000'),
(4, '4.000'),
(5, '7.000');
SELECT * FROM harga_barang;
DROP VIEW hasil;
CREATE VIEW hasil AS
SELECT a.id_barang AS `NO`,
nama_barang AS `BARANG`,
CONCAT("RP ", b.harga) AS `HARGA`
FROM barang a JOIN harga_barang b ON a.id_barang=b.id_barang;
SELECT * FROM hasil;
