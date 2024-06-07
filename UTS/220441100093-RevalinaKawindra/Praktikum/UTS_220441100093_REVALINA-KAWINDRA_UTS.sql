CREATE DATABASE toko_buku;

USE toko_buku;


CREATE TABLE IF NOT EXISTS Penulis (
    id_penulis INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    negara VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(100),
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

INSERT INTO Penulis (nama, negara) VALUES
('J.K. Rowling', 'Inggris'),
('Haruki Murakami', 'Jepang'),
('Andrea Hirata', 'Indonesia'),
('Tere Liye', 'Indonesia'),
('Stephen King', 'Amerika');

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 20000, 5),
('Norwegian Wood', 2, 60000, 3),
('Laskar Pelangi', 3, 51000, 6),
('Pulang', 4, 58000, 4),
('It', 5, 49000, 4);

CREATE VIEW viewBukuPenulis AS
SELECT Buku.judul AS judul_buku, 
Buku.harga, Buku.stok, Penulis.nama AS nama_penulis, 
Penulis.negara AS negara_penulis
FROM Buku
INNER JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis;

SELECT * FROM viewBukuPenulis
ORDER BY harga
LIMIT 5;

DELIMITER //
CREATE PROCEDURE tambahPenjualan (
    IN id_buku_param INT,
    IN tanggal_param DATE,
    IN jumlah_param INT,
    OUT hasil VARCHAR(100)
)
BEGIN
    DECLARE buku_tersedia INT;

    -- Cek apakah id_buku tersedia
    SELECT COUNT(*) INTO buku_tersedia FROM Buku WHERE id_buku = id_buku_param;

    IF buku_tersedia > 0 THEN
        -- id_buku tersedia, tambahkan data ke Tabel Penjualan
        INSERT INTO Penjualan (id_buku, tanggal, jumlah) VALUES (id_buku_param, tanggal_param, jumlah_param);
        SET hasil = 'Penjualan/Alert berhasil ditambahkan';
    ELSE
        -- id_buku tidak tersedia
        SET hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END//
DELIMITER ;

-- menambah data ke penjualan
CALL tambahPenjualan(1, '2024-05-09', 2, @hasil);
CALL tambahPenjualan(4, '2024-07-09', 3, @hasil);
CALL tambahPenjualan(3, '2024-06-09', 1, @hasil);
CALL tambahPenjualan(6, '2024-07-09', 1, @hasil);

-- Tampilkan hasil dari prosedur
SELECT @hasil;


CREATE VIEW penjualanTerbanyak AS
SELECT Buku.judul AS judul_buku, Penulis.nama AS nama_penulis, 
SUM(Penjualan.jumlah) AS total_penjualan
FROM Penjualan
INNER JOIN Buku ON Penjualan.id_buku = Buku.id_buku
INNER JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis
GROUP BY Penjualan.id_buku
ORDER BY total_penjualan DESC
LIMIT 5;

DELIMITER //
CREATE PROCEDURE insertToBuku (
    IN judul_param VARCHAR(255),
    IN id_penulis_param INT,
    IN harga_param INT,
    IN stok_param INT,
    OUT hasil VARCHAR(255)
)
BEGIN
    DECLARE buku_exist INT;

    -- Cek apakah buku sudah ada dalam database
    SELECT COUNT(*) INTO buku_exist FROM Buku WHERE judul = judul_param AND id_penulis = id_penulis_param;

    IF buku_exist = 0 THEN
        -- Buku belum ada dalam database, tambahkan buku baru
        INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES (judul_param, id_penulis_param, harga_param, stok_param);
        SET hasil = 'Buku berhasil ditambahkan ke dalam sistem.';
    ELSE
        -- Buku sudah ada dalam database
        SET hasil = 'Buku sudah ada dalam sistem.';
    END IF;
END//
DELIMITER ;


SELECT * FROM penjualanTerbanyak;

