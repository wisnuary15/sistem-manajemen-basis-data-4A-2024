CREATE DATABASE manager_gudang;

USE manager_gudang;

DROP DATABASE manager_gudang;

CREATE TABLE item(
id_item INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
item_name VARCHAR (15) NOT NULL,
stok INT (3) NOT NULL,
min_stok INT (3) NOT NULL,
descriptionn VARCHAR (25) NOT NULL
);


INSERT INTO item (item_name, stok, min_stok,descriptionn) VALUES
('Mie goreng ',10,5,'Indomie goreng'),
('Susu Kotak ',8,4,'Ultra Milk'),
('Teh Kotak ',6,3,'Sosro'),
('mie Kuah',15,10,'Indomie Soto');

UPDATE item 
SET min_stok ='12'
WHERE id_item = '3' ;


-- satu
DELIMITER //
CREATE PROCEDURE minimumStok()
	
BEGIN
SELECT item_name, min_stok FROM item WHERE min_stok < stok;
END //
DELIMITER ;
CALL minimumStok();

-- dua
CREATE PROCEDURE statusBarang(
	IN stok INT (3)
)
BEGIN 
	DECLARE JumlahBarang INT;
	DECLARE result VARCHAR(20);
	
	SET JumlahBarang = stok;
	
	IF (JumlahBarang = 0) THEN
		SET result = 'Out of Stock';
	ELSE 
		SET result = 'Barang Tersedia';
	END IF;
	
	SELECT result;
END//
DELIMITER;
CALL statusBarang();


-- Tiga
DELIMITER//
CREATE PROCEDURE tambahStok(
	IN batas INT(3)
)
BEGIN
	DECLARE i INT;
	SET i = 1;
	WHILE i <= batas DO
		SET i = i +1;
	END WHILE;
	
	SELECT * FROM item WHERE id_item <=
	batas ORDER BY id_item ASC;
END//
DELIMITER;
CALL tambahStok(2);



