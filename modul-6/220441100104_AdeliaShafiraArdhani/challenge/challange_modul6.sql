CREATE DATABASE gudang;

USE gudang;

CREATE TABLE barang(
id_barang INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_barang VARCHAR(20) NOT NULL,
stok INT(3),
min_stok INT(2),
deskripsi VARCHAR(100)
);

INSERT INTO barang  (nama_barang, stok, min_stok, deskripsi) VALUES
('permen', 100, 10, 'permen susu'),
('cokelat', 100, 10, 'dark coklat'),
('susu', 10, 10, 'susu fullcream'),
('ciki', 0, 10, 'ciki keju'),
('mie goreng', 100, 10, 'mie goreng indomie'),
('mie soto', 100, 10, 'mie sedap soto'),
('beras', 7, 10, 'beras 5kg'),
('minyak goreng', 100, 10, 'minyak goreng 2L'),
('tepung', 0, 10, 'tepung terigu pro sedang'),
('garam', 5, 10, 'garam asin');


-- Menampilkan semua barang yang kurang dari stok minimum yang telah ditetapkan.
DELIMITER//
CREATE PROCEDURE barangKurang()
BEGIN
	SELECT id_barang, nama_barang, stok
	FROM barang
	WHERE stok < min_stok;
END//
DELIMITER;

CALL barangKurang;

-- Memperbarui status barang menjadi “Habis” jika tidak ada stok yang tersisa.
DELIMITER//
CREATE PROCEDURE updateStatus()
BEGIN
	SELECT stok AS stok_barang,
	CASE 
	   WHEN stok = 0 THEN 'habis'
	   WHEN stok > 0 THEN stok
	END AS keterangan
	FROM barang;
END//
DELIMITER;

CALL updateStatus;

-- Secara otomatis menambahkan sejumlah stok jika stok kurang dari jumlah minimum.
DELIMITER//
CREATE PROCEDURE inputStok(IN tambah INT)
BEGIN
	UPDATE barang
	SET stok = stok + tambah
	WHERE stok < min_stok;
	
	SELECT id_barang, nama_barang, stok
	FROM barang;
END//
DELIMITER;

CALL inputStok(20);

DELIMITER//
CREATE PROCEDURE tambahStok(IN tambah INT)
BEGIN
	DECLARE stok INT;
	DECLARE min_stok INT;
	
	IF stok < min_stok THEN 
		SET stok = stok + tambah;
	ELSE 
		SET stok = stok;
	END IF;
	SELECT stok;
END//
DELIMITER;

CALL tambahStok(20);