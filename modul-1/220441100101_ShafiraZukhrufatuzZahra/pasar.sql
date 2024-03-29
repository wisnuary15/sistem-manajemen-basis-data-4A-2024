bkin db pasar
menamai tabel, mengubah salah satu DATA tabel, menghapus salah satu DATA tabel, menghapus tabel, menghapus database.
toko : id, id jenis, id penjual
penjual : id, nama
pembeli : id, nama, id barang
jenis jualan : id, jenis
baarang : id, nama, stok
setiap id aut increment

--membuat DATABASE--
CREATE DATABASE pasar;

--membuat tabel toko--
CREATE TABLE toko(
id_toko INT (10) AUTO_INCREMENT PRIMARY KEY,
id_jenis INT (10),
id_penjual INT (10),
FOREIGN KEY (id_penjual) REFERENCES penjual(id_penjual),
FOREIGN KEY (id_jenis) REFERENCES jenis_jualan (id_jenis)
);

--membuat tabel penjual--
CREATE TABLE penjual(
id_penjual INT (10) AUTO_INCREMENT PRIMARY KEY,
nama_penjual VARCHAR (50)
);

--membuat tabel pembeli--
CREATE TABLE pembeli (
id_pembeli INT (10) AUTO_INCREMENT PRIMARY KEY,
nama_pembeli VARCHAR (50),
id_barang INT (10),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
);

--membuat tabel jenis_jualan--
CREATE TABLE jenis_jualan(
id_jenis INT (10) AUTO_INCREMENT PRIMARY KEY,
nama_jenis_barang VARCHAR (50)
);

--membuat tabel barang--
CREATE TABLE barang (
id_barang INT (10) AUTO_INCREMENT PRIMARY KEY,
nama_barang VARCHAR(50),
stok INT
);

--mengisi DATA tabel barang--
INSERT INTO barang (nama_barang , stok) VALUES
('beras', 2),
('kompor', 1),
('mainan', 1); 

INSERT INTO barang (nama_barang , stok) VALUES
('pesawat mainan', 2),('balon', 3);

--mengisi DATA tabel jenis_jualan--
INSERT INTO jenis_jualan (nama_jenis_barang) VALUES
('sembako'),
('elektronik'),
('game');

--mengisi DATA tabel pembeli--
INSERT INTO pembeli (nama_pembeli, id_barang) VALUES
('taehyung', 4),
('jimin', 4),
('yoongi', 5);

--mengisi DATA tabel penjual--
INSERT INTO penjual (nama_penjual) VALUES
('shafira'),
('adelia'),
('devi');

--mengisi DATA tabel toko--
INSERT INTO toko (id_jenis, id_penjual) VALUES
(1, 1),
(1, 1),
(2, 2);

--menampilkan DATA tabel barang, jenis_jualan, pembeli, penjual, toko--
SELECT * FROM barang;
SELECT * FROM jenis_jualan;
SELECT * FROM pembeli;
SELECT * FROM penjual;
SELECT * FROM toko;

--mengubah salah satu DATA tabel--
UPDATE barang SET nama_barang = 'plastisin', stok = 5 WHERE id_barang = 7;

--menghapus DATA pada tabel barang--
DELETE FROM barang WHERE id_barang ='8';


--mengapus tabel toko--
DROP TABLE toko;

--menghapus DATABASE--
DROP DATABASE pasar;