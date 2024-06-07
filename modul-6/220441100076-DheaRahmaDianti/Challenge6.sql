CREATE DATABASE warehouse;

USE warehouse;

CREATE TABLE IF NOT EXISTS items(
id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
items_name VARCHAR(50),
stock INT(10),
min_stock INT(10),
DESCRIPTION VARCHAR(100)
);

INSERT INTO items (items_name, stock, min_stock, DESCRIPTION) VALUES
('Minyak Goreng', 50, 10, 'Tersedia'),
('Pasta Gigi', 60, 5, 'Tersedia'),
('Shampo', 55, 5, 'Tersedia'),
('Sikat Gigi', 65, 7, 'Tersedia'),
('Handuk', 5, 10,'Tersedia'),
('Bumbu Dapur', 35, 3, 'Tersedia'),
('Kecap', 0, 3, 'Tersedia');

SELECT stock COUNT(*) INTO sisa_barang WHERE id=id_barang;

DROP TABLE items;

DELIMITER //
CREATE PROCEDURE cek_barang_kurang (IN id_barang INT(10), IN stock INT(10))
BEGIN
    DECLARE sisa_barang INT(10);
    
    SELECT COUNT(stock) INTO sisa_barang FROM items WHERE id = id_barang;
    
    IF sisa_barang < stock THEN
	SELECT stock FROM items WHERE min_stock < stock;
    END IF;
    
    SELECT sisa_barang;

END//
DELIMITER ;

CALL cek_barang_kurang(5, 5);
DROP PROCEDURE cek_barang_kurang;

DELIMITER //
CREATE PROCEDURE ubah_status(IN stock INT(10))
BEGIN
    DECLARE DESCRIPTION VARCHAR(50);
    -- declare id_barang int(10);
    
    IF (stock = 0) THEN
    SELECT SUM(stock) AS jml_stock, items_name, DESCRIPTION FROM items;
	-- SELECT items_name, stock, DESCRIPTION FROM items;
        SET DESCRIPTION = 'Barang Tidak Tersedia';
    END IF;

END//
DELIMITER //
CALL ubah_status(0);

DROP PROCEDURE ubah_status;

DELIMITER //
CREATE PROCEDURE tambah_barang()
    BEGIN
        INSERT INTO stock FROM items WHERE stock = 0;
	SELECT items_name FROM items;
    END//
DELIMITER ;

CALL tambah_barang();

