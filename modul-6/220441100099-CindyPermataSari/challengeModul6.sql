CREATE DATABASE gudang;
USE gudang;

CREATE TABLE IF NOT EXISTS dataBarang(
IdBarang INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
NamaBarang VARCHAR(20) NOT NULL,
StokBarang INT(2) NOT NULL,
MinStok INT(1) NOT NULL,
Deskripsi VARCHAR(20) NOT NULL
);

INSERT INTO dataBarang (NamaBarang, StokBarang, MinStok, Deskripsi) VALUES
('Sabun Mandi', 10, 3, 'Tersedia'),
('Sabun Cuci Piring', 5, 3, 'Tersedia'),
('Pasta Gigi', 5, 3, 'Tersedia'),
('Shampo', 15, 3, 'Tersedia'),
('Handuk', 7, 3, 'Tersedia'),
('Sikat Gigi', 0, 3, 'Tersedia');

SELECT * FROM dataBarang;
DROP TABLE dataBarang;

-- no 1
DELIMITER //
CREATE PROCEDURE dataBarangKurang(
)
BEGIN 
	SELECT namaBarang FROM dataBarang WHERE StokBarang < MinStok;
END//
DELIMITER;
CALL dataBarangKurang();
DROP PROCEDURE dataBarangKurang;

-- no 2
SELECT * FROM dataBarang;

DELIMITER //
CREATE PROCEDURE upDeskripsi(
	IN barang_id INT
)
BEGIN
	DECLARE varNamaBarang VARCHAR(20);
	DECLARE varStokBarang INT;
	DECLARE varMinStok INT;
	DECLARE varDeskripsi VARCHAR(20);
	
	SELECT NamaBarang, StokBarang, MinStok, Deskripsi INTO varNamaBarang, varStokBarang, varMinStok, varDeskripsi
	FROM dataBarang WHERE IdBarang = barang_id;


	IF varStokBarang = 0 THEN
		SET varDeskripsi = 'Habis';
	ELSE
		SET varDeskripsi = 'Tersedia';
	END IF;
	
	UPDATE dataBarang SET Deskripsi = varDeskripsi WHERE IdBarang = barang_id;

END//
DELIMITER;
CALL upDeskripsi(6);
SELECT * FROM dataBarang;

DROP PROCEDURE upDeskripsi;

-- no 3
SELECT * FROM dataBarang;

DELIMITER //
CREATE PROCEDURE tambahStok(
	IN barang_id INT
)
BEGIN
	DECLARE varNamaBarang VARCHAR(20);
	DECLARE varStokBarang INT;
	DECLARE varMinStok INT;
	DECLARE varDeskripsi VARCHAR(20);
	
	SELECT NamaBarang, StokBarang, MinStok, Deskripsi INTO varNamaBarang, varStokBarang, varMinStok, varDeskripsi
	FROM dataBarang WHERE IdBarang = barang_id;

	IF varStokBarang < varMinStok THEN
		SET varStokBarang = varStokBarang +  varMinStok;
	ELSE
		SET varDeskripsi = varStokBarang + 0;
	END IF;
	
	UPDATE dataBarang SET StokBarang = varStokBarang WHERE IdBarang = barang_id;

END//
DELIMITER;
CALL tambahStok(6);
DROP PROCEDURE tambahStok;

SELECT * FROM dataBarang;


DROP DATABASE gudang;