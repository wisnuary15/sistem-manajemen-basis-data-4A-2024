CREATE DATABASE IF NOT EXISTS toko_buku;
USE toko_buku;

CREATE TABLE IF NOT EXISTS Penulis (
    id_penulis INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    negara VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(200),
    id_penulis INT,
    harga INT,
    stok INT,
    FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

CREATE TABLE IF NOT EXISTS Penjualan (
    id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_buku INT,
    tanggal DATE,
    jumlah INT,
    FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);
SHOW TABLES;
INSERT INTO Penulis (nama, negara) VALUES
    ('Haruki Murakata', 'Jepang'),
    ('Johan Libert', 'Inggris'),
    ('Budi Maulana', 'Indonesia'),
    ('Putri Susila', 'Indonesia'),
    ('Ana Maria'   , 'Indonesia');    
        
INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
    ('Norwegian Wood', 1, 150000, 100),
    ('Harry Potter and the Philosopher''s Stone', 2, 200000, 120),
    ('BUMI', 3, 180000, 80),
    ('Rembulan Malam', 4, 160000, 90),
    ('Kancil Mencuri Timun', 7, 300000, 60);
,
/*Nomor 2*/
CREATE VIEW viewBukuPenulis AS
SELECT 
    Buku.judul AS judul_buku,
    Buku.harga,
    Buku.stok,
    Penulis.nama AS nama_penulis,
    Penulis.negara AS negara_penulis
FROM 
    Buku
JOIN 
    Penulis ON Buku.id_penulis = Penulis.id_penulis;
    
SELECT * FROM viewBukuPenulis;

/*Nomor 3*/    
SELECT * FROM viewBukuPenulis
ORDER BY harga ASC
LIMIT 5;

/*Nomor 4*/
DELIMITER //

CREATE PROCEDURE tambahDataPenjualan (
    IN id_Buku INT,
    IN Jumlah INT,
    IN Tanggal DATE
)
BEGIN
    DECLARE check_buku INT;
        
    SELECT COUNT(*) INTO check_buku FROM Buku WHERE id_buku = id_Buku;
    
    IF check_buku > 0 THEN
        INSERT INTO Penjualan (id_buku, tanggal, jumlah) VALUES (id_Buku, Tanggal, Jumlah);
        SELECT 'Penjualan/Alert berhasil ditambahkan' AS hasil;
    ELSE
        SELECT 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!' AS hasil;
    END IF;
END //

DELIMITER ;

CALL tambahDataPenjualan(1, 5, '2024-05-10');

/*Nomor 5*/
CREATE VIEW penjualanTerbanyak AS
SELECT 
    Buku.judul AS judul_buku,
    Penulis.nama AS nama_penulis,
    SUM(Penjualan.jumlah) AS total_penjualan
FROM 
    Buku
JOIN 
    Penulis ON Buku.id_penulis = Penulis.id_penulis
LEFT JOIN 
    Penjualan ON Buku.id_buku = Penjualan.id_buku
GROUP BY 
    Buku.id_buku
ORDER BY 
    total_penjualan DESC
LIMIT 5;

SELECT * FROM penjualanTerbanyak;

/*Nomor 6*/
DELIMITER //

CREATE PROCEDURE insertToBuku (
    IN judul_buku VARCHAR(200),
    IN id_Penulis INT,
    IN Harga INT,
    IN Stok INT
)
BEGIN
    DECLARE buku_exist INT;
    
    SELECT COUNT(*) INTO buku_exist FROM Buku WHERE judul = judul_buku;
    
    IF buku_exist = 0 THEN
        INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES (judul_buku, id_Penulis, Harga, Stok);
        SELECT 'Buku berhasil ditambahkan ke dalam sistem' AS hasil;
    ELSE
        SELECT 'Buku sudah ada dalam database. Penambahan buku gagal.' AS hasil;
    END IF;
END //

DELIMITER ;

CALL insertToBuku('Judul Buku Baru', 1, 150000, 50);
