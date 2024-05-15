CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE Penulis (
    id_penulis INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255),
    negara VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255),
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
('Stephen King', 'Amerika Serikat'),
('Haruki Murakami', 'Jepang');

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 200000, 100),
('It', 2, 150000, 120),
('Norwegian Wood', 3, 180000, 80);

-- 2. Membuat view "viewBukuPenulis"
CREATE VIEW viewBukuPenulis AS
SELECT B.judul AS judul_buku, B.harga, B.stok, P.nama AS nama_penulis, P.negara AS negara_penulis
FROM Buku AS B
JOIN Penulis AS P ON B.id_penulis = P.id_penulis;

-- 3. Menampilkan 5 data pertama dari view "viewBukuPenulis" dari harga Termurah ke Termahal
SELECT *
FROM viewBukuPenulis
ORDER BY harga
LIMIT 5;

-- 4. Membuat stored procedure untuk menambahkan data pada Tabel Penjualan
DELIMITER //

CREATE PROCEDURE tambahPenjualan(
    IN id_buku_param INT,
    IN tanggal_param DATE,
    IN jumlah_param INT
)
BEGIN
    DECLARE stok_buku INT;

    -- Memeriksa apakah id_buku tersedia
    SELECT stok INTO stok_buku FROM Buku WHERE id_buku = id_buku_param;

    IF stok_buku >= jumlah_param THEN
        -- Jika tersedia, tambahkan data ke Tabel Penjualan
        INSERT INTO Penjualan (id_buku, tanggal, jumlah) VALUES (id_buku_param, tanggal_param, jumlah_param);
        SELECT 'Penjualan/Alert berhasil ditambahkan' AS hasil;
    ELSE
        -- Jika tidak tersedia, tampilkan peringatan
        SELECT 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!' AS hasil;
    END IF;
END //

DELIMITER ;

-- 5. Membuat view "penjualanTerbanyak"
CREATE VIEW penjualanTerbanyak AS
SELECT B.judul AS judul_buku, P.nama AS nama_penulis, SUM(J.jumlah) AS total_penjualan
FROM Penjualan AS J
JOIN Buku AS B ON J.id_buku = B.id_buku
JOIN Penulis AS P ON B.id_penulis = P.id_penulis
GROUP BY J.id_buku
ORDER BY total_penjualan DESC
LIMIT 5;

-- 6. Membuat stored procedure "insertToBuku"
DELIMITER //

CREATE PROCEDURE insertToBuku(
    IN judul_param VARCHAR(255),
    IN id_penulis_param INT,
    IN harga_param INT,
    IN stok_param INT
)
BEGIN
    DECLARE buku_exist INT;

    -- Memeriksa apakah buku sudah ada dalam database
    SELECT COUNT(*) INTO buku_exist FROM Buku WHERE judul = judul_param AND id_penulis = id_penulis_param;

    IF buku_exist = 0 THEN
        -- Jika belum ada, tambahkan buku ke Tabel Buku
        INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES (judul_param, id_penulis_param, harga_param, stok_param);
        SELECT 'Buku berhasil ditambahkan.' AS hasil;
    ELSE
        -- Jika sudah ada, tampilkan peringatan
        SELECT 'Buku sudah ada dalam database.' AS hasil;
    END IF;
END //

DELIMITER ;

