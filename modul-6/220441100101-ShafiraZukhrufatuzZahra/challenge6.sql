CREATE DATABASE andi;
USE andi;

CREATE TABLE IF NOT EXISTS item(
id_item INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_item VARCHAR (50),
stok INT (10),
stok_min INT (10),
deskripsi VARCHAR (200)
);

INSERT INTO item(nama_item, stok, stok_min, deskripsi) VALUES
('mie', 80, 5, 'mi goreng memiliki aneka rasa yang sangat lezat'),
('minyak', 70, 5, 'minyak goreng cap bimoli'),
('gula', 50, 2, 'gula putih bermacam ukuran'),
('beras', 20, 5, 'beras sebagai makanan pokok orang indonesia'),
('garam', 40, 2, 'garam asli khas madura'),
('tepung', 50, 3, 'tepung serbaguna yang wajib tersedia pada rumah anda');
SELECT * FROM item;

INSERT INTO item(nama_item, stok, stok_min, deskripsi) VALUES
('penyedap', 2, 5, 'penyedap makanan agar masakan lebih enak');
SELECT * FROM item;

--1. Menampilkan semua barang yang kurang dari minimum stok yang telah ditetapkan.--
DELIMITER //
CREATE PROCEDURE nomorSatu()
    BEGIN
        SELECT id_item, nama_item FROM item WHERE stok < stok_min GROUP BY id_item;
    END//
DELIMITER ;
CALL nomorSatu();
SELECT*FROM anggota;

--2. Perbarui STATUS barang menjadi "Out of Stock" jika stok sudah habis.--
DELIMITER//
CREATE PROCEDURE nomorDua()
BEGIN
   DECLARE stokbarang INT (10);
   DECLARE pesan VARCHAR (100);
   SELECT id_item, stok AS stokbarang FROM item GROUP BY id_item;
   IF stokbarang > 0 THEN 
	SET pesan = CONCAT("masih memiliki stok barang");
   ELSE
	SET pesan = CONCAT("Out of Stock");
   END IF;
   SELECT pesan;
END//
DELIMITER;//
CALL nomorDua();

--3. Otomatis menambahkan stok dalam jumlah tertentu jika stok kurang dari jumlah minimum.--
DELIMITER//
CREATE PROCEDURE nomorTiga(
IN tambahstok INT)
BEGIN
	DECLARE stok INT;
	DECLARE stok_min INT;
	
	IF stok < stok_min THEN 
		SET stok = stok + tambahstok;
	ELSE 
		SET stok = stok;
	END IF;
	SELECT stok;
END//
DELIMITER;//
CALL nomorTiga(15);
