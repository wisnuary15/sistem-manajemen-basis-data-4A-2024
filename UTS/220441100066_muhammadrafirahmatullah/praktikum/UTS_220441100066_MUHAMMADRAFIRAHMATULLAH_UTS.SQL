-- Membuat database
CREATE DATABASE IF NOT EXISTS toko_buku;

-- Menggunakan database
USE toko_buku;

-- Membuat tabel Penulis
CREATE TABLE IF NOT EXISTS Penulis (
    id_penulis INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255),
    negara VARCHAR(255)
);

-- Membuat tabel Buku
CREATE TABLE IF NOT EXISTS Buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255),
    id_penulis INT,
    harga INT,
    stok INT,
    FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

-- Menambahkan data ke tabel Penulis
INSERT INTO Penulis (nama, negara) VALUES 
    ('J.K. Rowling', 'Inggris'),
    ('Haruki Murakami', 'Jepang'),
    ('Agatha Christie', 'Inggris'),
    ('Stephen King', 'Amerika');

-- Menambahkan data ke tabel Buku
INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES 
    ('Harry Potter and the Philosopher''s Stone', 1, 150000, 100),
    ('Norwegian Wood', 2, 125000, 80),
    ('Murder on the Orient Express', 3, 135000, 120),
    ('It', 4, 140000, 90);

-- Membuat view viewBukuPenulis
CREATE VIEW viewBukuPenulis AS
SELECT Buku.judul AS judul_buku, Buku.harga, Buku.stok, Penulis.nama AS nama_penulis, Penulis.negara AS negara_penulis
FROM Buku
JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis;

SELECT * FROM viewBukuPenulis;


-- Mengurutkan dari termurah ke mahal
SELECT * FROM viewBukuPenulis ORDER BY harga ASC LIMIT 5;

--Stored procedure
DELIMITER //

CREATE PROCEDURE tambahPenjualan (
    IN id_buku_param INT,
    IN tanggal_param DATE,
    IN jumlah_param INT
)

--bikin tabel penjualan dlu 
CREATE TABLE IF NOT EXISTS Penjualan (
    id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_buku INT,
    tanggal DATE,
    jumlah INT,
    FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

--stored PROCEDURE
-- Membuat stored procedure untuk menambahkan data ke tabel Penjualan dengan validasi ketersediaan id_buku
DELIMITER //

CREATE PROCEDURE tambahPenjualan(
    IN id_buku_param INT,
    IN tanggal_param DATE,
    IN jumlah_param INT,
    OUT hasil VARCHAR(255)
)
BEGIN
    DECLARE buku_tersedia INT;

    -- Periksa apakah id_buku tersedia di tabel Buku
    SELECT COUNT(*) INTO buku_tersedia FROM Buku WHERE id_buku = id_buku_param;

    IF buku_tersedia > 0 THEN
        -- Jika id_buku tersedia, tambahkan data ke tabel Penjualan
        INSERT INTO Penjualan (id_buku, tanggal, jumlah) VALUES (id_buku_param, tanggal_param, jumlah_param);
        SET hasil = 'Penjualan/Alert berhasil ditambahkan';
    ELSE
        -- Jika id_buku tidak tersedia, berikan peringatan
        SET hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END //

DELIMITER ;

CALL tambahPenjualan(1, '2024-05-09', 3, @hasil);
SELECT @hasil AS hasil;
