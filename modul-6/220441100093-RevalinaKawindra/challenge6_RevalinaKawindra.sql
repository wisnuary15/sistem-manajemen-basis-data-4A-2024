CREATE DATABASE gudang;

USE gudang;
 

CREATE TABLE item (
id INT PRIMARY KEY AUTO_INCREMENT,
nama_item VARCHAR (20),
stok INT (10),
stok_min INT (10),
deskripsi VARCHAR (20)
);

DROP TABLE item;

INSERT INTO item (nama_item, stok, stok_min, deskripsi) VALUES 
('pensil', 30, 20, 'Memenuhi stok'),
('buku', 16, 20, 'Tidak Memenuhi stok'),
('penghapus', 25, 20, 'Memenuhi stok'),
('tipe x', 10, 20, 'Tidak Memenuhi stok'),
('penggaris', 23, 20, 'Memenuhi stok'),
('rautan', 20, 20, 'Memenuhi stok');

-- no 1 --
DELIMITER//
CREATE PROCEDURE cetak_barang()
BEGIN
    SELECT id, nama_item, stok, stok_min, deskripsi
    FROM item
    WHERE stok < stok_min;
END//
DELIMITER ;

CALL cetak_barang;
DROP PROCEDURE cetak_barang;

-- no 2 --
DELIMITER//
CREATE PROCEDURE barang_habis()
BEGIN
    SELECT id, nama_item, stok, stok_min,
           CASE 
	       WHEN stok > stok_min THEN 'memenuhi stok'
               WHEN stok - stok_min = 0 THEN 'habis'
               WHEN stok < stok_min THEN 'kurang dari stok'
               ELSE deskripsi
           END AS deskripsi
    FROM item
    WHERE stok > stok_min OR stok - stok_min = 0 OR stok < stok_min;
END//
DELIMITER;

CALL barang_habis;
DROP PROCEDURE barang_habis;

-- no 3 --
DELIMITER//
CREATE PROCEDURE tambah_stok( IN tambahan INT)
BEGIN
   
    UPDATE item
    SET stok = stok + tambahan
    WHERE stok < stok_min;

    UPDATE item
    SET deskripsi = 'memenuhi stok'
    WHERE stok >= stok_min AND deskripsi != 'memenuhi stok';
    
     SELECT nama_item, stok, stok_min, deskripsi
    FROM item;
END//
DELIMITER;

CALL tambah_stok(10);
DROP PROCEDURE tambah_stok;