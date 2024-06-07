CREATE DATABASE warehouse_manager;

USE warehouse_manager;


CREATE TABLE IF NOT EXISTS items(
id INT (5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
item_name VARCHAR (30),
stock INT (5),
min_stock INT (5),
deskripsi VARCHAR (30)
);


INSERT INTO items (item_name, stock, min_stock, deskripsi) VALUE
('monitor', 50, 5, 'normal'),
('sapu',  60, 5, 'rusak'),
('Mie goreng', 40, 5, 'normal'),
('sepatu', 75, 5, 'normal'),
('kipas angin', 2, 5, 'sedikit rusak'),
('sepeda', 1, 5, 'normal'),
('baterai', 3, 5, 'normal'),
('remote', 7, 5, 'rusak'),
('lemari', 8, 5, 'lecet'),
('box', 5, 5, 'normal'),
('kran', 0, 5, 'normal'),
('kursi', 0, 5, 'normal');


-- nomor 1
DELIMITER //
CREATE PROCEDURE tampil(
)
BEGIN
	SELECT item_name FROM items WHERE stock < min_stock;
END //
DELIMITER ;

CALL tampil();

-- nomor 2
DELIMITER //
CREATE PROCEDURE cek_stock(
	IN idItem INT (10)
)
BEGIN 
	DECLARE warning VARCHAR (100);
	DECLARE stock1 INT (10);
	DECLARE batas INT (10);
	
	SELECT stock INTO stock1 FROM items WHERE id = idItem;
	
	SET batas = stock1;
	
	IF batas <= 0 THEN
		SET warning = 'Out of Stock';
	ELSE
		SET warning = 'Barang ready';
	END IF;
	
	SELECT warning AS info;
	
END //
DELIMITER ;


CALL cek_stock(12);
DROP PROCEDURE cek_stock;

-- nomor 3
DELIMITER //
CREATE PROCEDURE tambah(
	
)
BEGIN
	UPDATE items SET stock = 8 WHERE stock < min_stock;
END//
DELIMITER ;

CALL tambah();
SELECT * FROM items;
DROP PROCEDURE tambah;
DROP DATABASE warehouse_manager;