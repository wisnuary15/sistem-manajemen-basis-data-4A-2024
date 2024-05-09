CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE penulis(
	id_penulis VARCHAR(10) NOT NULL,
	nama VARCHAR(100) NOT NULL,
	negara VARCHAR(100) NOT NULL,
	PRIMARY KEY(id_penulis)
)
DROP TABLE penulis;
DROP TABLE buku;
DROP TABLE penjualan;
CREATE TABLE buku(
	id_buku VARCHAR(10) NOT NULL,
	judul VARCHAR(100)NOT NULL,
	id_penulis VARCHAR(10) NOT NULL,
	harga INT(100) NOT NULL,
	stok INT(100),
	PRIMARY KEY(id_buku)
)

CREATE TABLE penjualan(
	id_penjualan VARCHAR(10)NOT NULL,
	id_buku VARCHAR(10)NOT NULL,
	tanggal DATE NOT NULL,
	jumlah INT(100)NOT NULL,
	PRIMARY KEY(id_penjualan)
)

INSERT INTO penulis VALUES 
	('ps01','juan','indonesia'),
	('ps02','nanda','indonesia'),
	('ps03','pratama','indonesia');
INSERT INTO buku VALUES 
	('bk01','siksa kubur','ps01',20000,20),
	('bk02','neraka','ps02',30000,25),
	('bk03','taubat','ps03',25000,30);

INSERT INTO buku VALUES 
	('bk04','ahli surga','ps01',40000,20),
	('bk05','dunia','ps02',50000,25),
	('bk06','memahami wanita','ps03',100000,30);

INSERT INTO penjualan VALUES
	('pj01','bk01','2024-05-01',10),
	('pj02','bk02','2024-05-02',15),
	('pj03','bk03','2024-05-03',11);
SELECT* FROM penjualan;
	
SELECT * FROM buku;
-- VIEW BUKU PENULIS
CREATE VIEW viewBukuPenulis AS
SELECT Buku.judul AS judul_buku, Buku.harga, Buku.stok, Penulis.nama AS nama_penulis, Penulis.negara AS negara_penulis
FROM Buku
INNER JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis;

SELECT*FROM viewBukuPenulis;

-- SELECT 5 DATA PERTAMA DARI HARGA TERMURAH KE TERMAHAL
SELECT * FROM viewBukuPenulis ORDER BY harga ASC LIMIT 5;

-- TAMBAH PENJUALAN
DROP tambahPenjualan;
DELIMITER //
CREATE PROCEDURE tambahPenjualan(IN buku_id INT, IN tanggal_penjualan DATE, IN jumlah_penjualan INT, OUT hasil VARCHAR(255))
BEGIN
    DECLARE stok_buku INT;
    SELECT stok INTO stok_buku FROM Buku WHERE id_buku = buku_id;

    IF stok_buku >= jumlah_penjualan THEN
        INSERT INTO Penjualan (id_buku, tanggal, jumlah) VALUES (buku_id, tanggal_penjualan, jumlah_penjualan);
        SET hasil = 'Penjualan Berhasil ditambahkan';
    ELSE
        SET hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END //
DELIMITER ;

CALL tambahPenjualan('bk01' ,'2024-05-10', 10, @hasil);
SELECT @hasil;

CALL tambahPenjualan('bk02' ,'2024-05-10', 10, @hasil);
SELECT @hasil;

-- VIEW PENJUALAN TERBANYAK
CREATE VIEW penjualanTerbanyak AS
SELECT Buku.judul AS judul_buku, Penulis.nama AS nama_penulis, SUM(Penjualan.jumlah) AS total_penjualan
FROM Buku
INNER JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis
INNER JOIN Penjualan ON Buku.id_buku = Penjualan.id_buku
GROUP BY Buku.id_buku
ORDER BY total_penjualan DESC
LIMIT 5;

SELECT*FROM penjualanTerbanyak;

-- STORED PROCEDURE MENAMBAHKAN BUKU
DROP PROCEDURE insertToBuku;
DELIMITER //

CREATE PROCEDURE insertToBuku(
    IN buku_id VARCHAR(10),
    IN judul_buku VARCHAR(255),
    IN id_penulis INT,
    IN harga INT,
    IN stok INT,
    OUT hasil VARCHAR(255)
)
BEGIN
    DECLARE buku_count INT;
    
    SELECT COUNT(*) INTO buku_count FROM Buku WHERE judul = judul_buku;
    
    IF buku_count = 0 THEN
        INSERT INTO Buku (id_buku,judul, id_penulis, harga, stok) VALUES (buku_id,judul_buku, id_penulis, harga, stok);
        SET hasil = 'Buku berhasil ditambahkan ke dalam sistem';
    ELSE
        SET hasil = 'Buku sudah ada dalam database. Penambahan gagal dilakukan!';
    END IF;
END //

DELIMITER ;

CALL insertToBuku('bk07','budaya', 'ps04', 50000, 50, @hasil);
SELECT @hasil;

SELECT * FROM buku;

DELIMITER//
CREATE PROCEDURE insertTobook
( 	IN buku_id VARCHAR(10),
	IN judul_buku VARCHAR(100),
	IN penulis_id VARCHAR(10),
	IN hargaa INT(100),
	IN stokk INT(100)
)
BEGIN
	INSERT INTO buku
	VALUES (buku_id,judul_buku,penulis_id,hargaa,stokk);
END//
DELIMITER ;
CALL insertTobook('bk07','budaya', 'ps04', 50000, 50);


