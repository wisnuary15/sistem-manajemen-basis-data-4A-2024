create database challenge4;

use challenge4

CREATE TABLE IF NOT EXISTS gudang(
id_gudang INT(10) auto_increment primary key,
item_name VARCHAR(30) NOT NULL,
stock int(10) NOT NULL,
min_stock int(10) NOT NULL,
description VARCHAR(30) NOT NULL
);

drop table gudang;

INSERT INTO gudang VALUES 
(null,'barang1', '4', '10', 'barang masih ada'),
(null,'barang2', '7', '10', 'barang masih ada'),
(null,'barang3', '1', '10', 'barang masih ada');

DELIMITER//
CREATE PROCEDURE CekStockBarang ()
BEGIN
	SELECT * FROM gudang WHERE min_stock > stock;
 
END//
DELIMITER;

call CekStockBarang;

delimiter//
create procedure StatusBarang(
	in id_gudang int(10)
)
begin 
    DECLARE barang INT;
    DECLARE keterangan VARCHAR(100);

    SELECT COUNT(*) INTO barang
    FROM stock
    WHERE id_gudang = min_stock AND ket != '10';

    IF barang > 0 THEN
        SELECT * FROM stock
        WHERE id_gudang = min_stock AND ket != '10';
    ELSE
        SET keterangan = 'Barang sudah habis';
    END IF;
	SELECT keterangan AS Keterangan_Barang;
end//
delimiter;

drop procedure StatusBarang;

call StatusBarang(1);