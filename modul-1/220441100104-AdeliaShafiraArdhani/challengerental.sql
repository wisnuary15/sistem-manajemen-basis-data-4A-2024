CREATE DATABASE rentalcoba;

USE rentalcoba;

CREATE TABLE mobil(
id_mobil INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
merk_mobil VARCHAR (20) NOT NULL
);

CREATE TABLE penyewa(
id_penyewa INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_mobil INT(3) NOT NULL,
nama_penyewa VARCHAR(25) NOT NULL,
FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil)
);

CREATE TABLE pembayaran(
id_pembayaran INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_penyewa INT(10) NOT NULL,
total_harga INT(10) NOT NULL,
FOREIGN KEY (id_penyewa) REFERENCES penyewa(id_penyewa)
);

CREATE TABLE gudang(
id_gudang INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_mobil INT(3) NOT NULL,
id_penyewa INT(10) NOT NULL,
id_pembayaran INT(5) NOT NULL,
FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
FOREIGN KEY (id_penyewa) REFERENCES penyewa(id_penyewa),
FOREIGN KEY (id_pembayaran) REFERENCES pembayaran(id_pembayaran)
);

INSERT INTO mobil (merk_mobil) VALUES
('xenia'),
('brio'),
('avanza');

INSERT INTO penyewa (id_mobil, nama_penyewa) VALUES
(1, 'adel'),
(2, 'devi'),
(2, 'fira');

INSERT INTO pembayaran (id_penyewa, total_harga) VALUES
(1, 500.000),
(2, 500.000),
(2, 350.000);

INSERT INTO gudang (id_mobil, id_penyewa, id_pembayaran) VALUES
(1, 1, 1),
(2, 2, 2),
(2, 3, 3);

-- menampilkan tabel
SELECT * FROM gudang;

SELECT * FROM mobil;

SELECT * FROM pembayaran;

SELECT * FROM penyewa;


-- menamai ulang tabel
ALTER TABLE penyewa RENAME customer;

-- mengubah salah satu data tabel
UPDATE mobil SET merk_mobil = 'pajero' WHERE id_mobil = 3;

-- menghapus salah satu data pada tabel
DELETE FROM mobil WHERE id_mobil = 3;

-- menghapus database
DROP DATABASE rentalcoba;