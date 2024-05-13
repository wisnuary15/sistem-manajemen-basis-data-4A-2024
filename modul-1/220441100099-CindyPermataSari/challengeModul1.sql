-- Tugas Challenge (Asistensi Modul 1) --

CREATE DATABASE toko;
USE toko;
barang, penjualan, pembeli
id barang,nama,stok
idpenjualan,
id,nama,idbarang

CREATE TABLE barang(
idBarang INT(3) AUTO_INCREMENT PRIMARY KEY,
namaBarang VARCHAR(10) NOT NULL,
stok INT(3) NOT NULL,
);

CREATE TABLE pembeli(
idPembeli INT(3) AUTO_INCREMENT PRIMARY KEY,
namaPembeli VARCHAR(20) NOT NULL,
idPenjualan INT(3)
);
ALTER TABLE pembeli CHANGE COLUMN idPenjualan idBarang INT(3);


CREATE TABLE penjualan(
idPenjualan INT(3) AUTO_INCREMENT,
idBarang INT(3),
idPembeli INT(3),
PRIMARY KEY (idPenjualan)
);

ALTER TABLE penjualan ADD CONSTRAINT fkbarang FOREIGN KEY (idBarang) REFERENCES barang(idBarang);
ALTER TABLE penjualan ADD CONSTRAINT fkpembeli FOREIGN KEY (idPembeli) REFERENCES pembeli(idPembeli);


INSERT INTO barang (namaBarang, stok)VALUES
('Buku',5),
('Pensil',3),
('Penggaris',4),
('Penghapus',5),
('Bulpoint',4);

INSERT INTO pembeli (namaPembeli)VALUES
('Cindy'),
('Devi'),
('Dhea'),
('Reva'),
('Dita');
UPDATE pembeli SET idBarang = 5 WHERE idPembeli=5;

INSERT INTO penjualan VALUES
(4,5),
(5,5),
(1,2),
(3,5),
(4,5);
UPDATE penjualan SET idBarang = 5, idPembeli=5 WHERE idPenjualan=5;

SELECT * FROM barang;
SELECT * FROM pembeli;
SELECT * FROM penjualan;

-- nama barang,ubah nama tabel, mengubah atribut tabel barang --

-- ini tugas tambahan mulai dari sini --

UPDATE barang SET namaBarang= 'Staples' WHERE idBarang = 1;
UPDATE barang SET namaBarang= 'Gunting' WHERE idBarang = 2;
UPDATE barang SET namaBarang= 'Spidol' WHERE idBarang = 3;
UPDATE barang SET namaBarang= 'Lem' WHERE idBarang = 4;
UPDATE barang SET namaBarang= 'Binder' WHERE idBarang = 5;

RENAME TABLE barang TO stok;
SELECT * FROM stok;

ALTER TABLE stok CHANGE COLUMN namaBarang barang VARCHAR(10);
ALTER TABLE stok CHANGE COLUMN stok jumlahStok INT(3);


-- alhamdulillah --