CREATE DATABASE manager;

USE manager;

CREATE TABLE IF NOT EXISTS barang (
id_gudang INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nama_barang VARCHAR (100),
stok INT (10),
minimal_stock INT (10),
deskripsi VARCHAR (100)
);

DROP TABLE barang;

INSERT INTO barang VALUES 
(NULL, 'Detergen',30,10,'Ready'),
(NULL, 'Kopi Luwak',50,20,'Ready'),
(NULL, 'Teh Sarijaya',20,30,'Warning'),
(NULL, 'Sampo Limo',15,20,'Warning'),
(NULL, 'Sabun Jamal',40,15,'Ready');

SELECT *FROM barang;

-- Nomor Satu

DELIMITER //
CREATE PROCEDURE cekStok ()
BEGIN
	SELECT * FROM barang WHERE minimal_stock > stok;
 
END//
DELIMITER;
DROP PROCEDURE cekStok;
CALL cekStok();



-- Nomor 2
DELIMITER //
CREATE PROCEDURE cekHabis (
	IN nomor_barang INT
)
BEGIN
	DECLARE  Cek INT;
	DECLARE Keterangan VARCHAR (100);
	
	SELECT COUNT(*) INTO Cek
	FROM barang
	WHERE id_anggota = nomor_siswa AND stok = 0;
	
	IF  Cek > 0 THEN 
		SELECT * FROM barang
		id_gudang = nomor_barang AND stok != 0;
				
	ELSE 
	SET Keterangan = 'Barang Dalam Stok Habis';
	END IF;
	
	SELECT Keterangan AS Stok_Barang
END//
DELIMITER;


CALL cekHabis(1)

-- Nomor 3
DELIMITER//

CREATE PROCEDURE tambahBarang()

