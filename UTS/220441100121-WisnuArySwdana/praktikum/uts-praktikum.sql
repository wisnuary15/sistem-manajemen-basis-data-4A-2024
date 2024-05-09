CREATE DATABASE IF NOT EXISTS toko_buku;

USE toko_buku;

-- Tabel Penulis
CREATE TABLE IF NOT EXISTS Penulis (
    id_penulis INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    negara VARCHAR(50)
);

-- Tabel Buku
CREATE TABLE IF NOT EXISTS Buku (
    id_buku INT PRIMARY KEY AUTO_INCREMENT,
    judul VARCHAR(200),
    id_penulis INT,
    harga INT,
    stok INT,
    FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

-- Tabel Penjualan
CREATE TABLE IF NOT EXISTS Penjualan (
    id_penjualan INT PRIMARY KEY AUTO_INCREMENT,
    id_buku INT,
    tanggal DATE,
    jumlah INT,
    FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

INSERT INTO Penulis (nama, negara) VALUES
    ('Nidji', 'Indonesia'),
    ('Zetsu', 'Indonesia'),
    ('Nuri Hidayatulloh', 'Indonesia'),
    ('Iqbal', 'Indonesia');

-- Tambahkan data ke Tabel Buku
INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
    ('Laskar Pelangi', 1, 90000, 50),
    ('Kimetsu no Yaiba', 2, 100000, 50),
    ('Live Code', 3, 150000, 50),
    ('SMBD', 3, 150000, 50),
    ('PBO', 4, 150000, 50);

DELETE FROM Penulis;

DELETE FROM Buku;

SELECT * FROM Penulis;

SELECT * FROM Buku;
    

-- 2 Buku penulis
CREATE VIEW viewBukuPenulis AS
SELECT 
    B.judul AS 'judul buku',
    B.harga,
    B.stok,
    P.nama AS 'nama penulis',
    P.negara AS 'negara penulis'
FROM Buku AS B
INNER JOIN Penulis AS P ON B.id_penulis = P.id_penulis;


-- 3 tampilkan
SELECT *
FROM viewBukuPenulis
ORDER BY harga ASC
LIMIT 5;

-- 4 Buatkanlah Stored Procedure untuk menambahkan data pada Tabel Penjualan
DELIMITER //

CREATE PROCEDURE TambahPenjualan(
    IN id_buku_param INT,
    IN tanggal_param DATE,
    IN jumlah_param INT,
    OUT hasil VARCHAR(100)
)
BEGIN
    DECLARE buku_tersedia INT;
    DECLARE pesan VARCHAR(100);

    SELECT COUNT(*)
    INTO buku_tersedia
    FROM Buku
    WHERE id_buku = id_buku_param;

    IF buku_tersedia > 0 THEN
        INSERT INTO Penjualan (id_buku, tanggal, jumlah)
        VALUES (id_buku_param, tanggal_param, jumlah_param);
        SET pesan = 'Penjualan berhasil ditambahkan';
    ELSE
        SET pesan = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;

    -- Set hasil keluaran
    SET hasil = pesan;
END//

DELIMITER ;

CALL TambahPenjualan(1, '2024-05-15', 3, @hasil);
SELECT @hasil AS hasil;


DROP PROCEDURE IF EXISTS TambahPenjualan;

-- 5 Buatkanlah view “penjualanTerbanyak”
CALL TambahPenjualan(1, '2024-05-10', 2, @hasil);
SELECT @hasil AS hasil;

CREATE VIEW penjualanTerbanyak AS
SELECT Buku.judul AS judul_buku, Penulis.nama AS nama_penulis, SUM(Penjualan.jumlah) AS total_penjualan
FROM Penjualan
JOIN Buku ON Penjualan.id_buku = Buku.id_buku
JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis
GROUP BY Penjualan.id_buku
ORDER BY total_penjualan DESC
LIMIT 5;

SELECT * FROM penjualanTerbanyak;

-- 6 Buatlah stored procedure ”insertToBuku”
DELIMITER //

CREATE PROCEDURE insertToBuku(
    IN judul_buku_param VARCHAR(200),
    IN id_penulis_param INT,
    IN harga_param INT,
    IN stok_param INT,
    OUT hasil VARCHAR(100)
)
BEGIN
    DECLARE buku_ada INT;

    SELECT COUNT(*)
    INTO buku_ada
    FROM Buku
    WHERE judul = judul_buku_param;

    IF buku_ada = 0 THEN
        INSERT INTO Buku (judul, id_penulis, harga, stok)
        VALUES (judul_buku_param, id_penulis_param, harga_param, stok_param);
        SET hasil = 'Buku berhasil ditambahkan';
    ELSE
        SET hasil = 'Buku sudah ada dalam database';
    END IF;
END//

DELIMITER ;

CALL insertToBuku('Judul Buku Baru', 1, 150000, 50, @hasil);
SELECT @hasil AS hasil;


