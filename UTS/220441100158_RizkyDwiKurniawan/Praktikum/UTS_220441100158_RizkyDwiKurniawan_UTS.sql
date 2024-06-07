-- 1
CREATE DATABASE toko_buku;
USE toko_buku;
CREATE TABLE penulis (
id_penulis INT (11) AUTO_INCREMENT PRIMARY KEY,
nama VARCHAR (255),
negara VARCHAR (255),
);

CREATE TABLE buku (
    id_buku INT (11) AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255),
    id_penulis INT (11),
    harga INT (11),
    stok INT (11),
    FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

CREATE TABLE Penjualan (
    id_penjualan INT (11) AUTO_INCREMENT PRIMARY KEY,
    id_buku INT (11),
    tanggal DATE,
    jumlah INT (11),
    FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

INSERT INTO Penulis (nama, negara) VALUES
('J.K. Rowling', 'Inggris'),
('Agatha Christie', 'Inggris'),
('Andrea Hirata', 'Indonesia'),
('Edogawa Rampo', 'Jepang');

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 200000, 100),
('Murder on the Orient Express', 2, 150000, 75),
('Sang Pemimpi', 3, 180000, 50),
('Beast in the Shadows', 4, 160000, 120);

-- 2
CREATE VIEW viewBukuPenulis AS
SELECT a.judul AS judul_buku, 
       a.harga, 
       a.stok, 
       b.nama AS nama_penulis, 
       b.negara AS negara_penulis
FROM buku a
JOIN penulis b ON a.id_penulis = b.id_penulis;

-- 3
SELECT * FROM viewBukuPenulis ORDER BY harga LIMIT 5;

-- 4
DELIMITER //
CREATE PROCEDURE tambahPenjualan(
    IN a_id_buku INT,
    IN a_tanggal DATE,
    IN a_jumlah INT,
    OUT a_hasil VARCHAR(255)
)
BEGIN
    DECLARE stok_buku INT;
    DECLARE buku_tersedia BOOLEAN;

    SELECT COUNT(*) INTO buku_tersedia FROM buku WHERE id_buku = a_id_buku;

    IF buku_tersedia THEN
        SELECT stok INTO stok_buku FROM buku WHERE id_buku = a_id_buku;
        IF a_jumlah <= stok_buku THEN
            INSERT INTO Penjualan (id_buku, tanggal, jumlah) VALUES (a_id_buku, a_tanggal, a_jumlah);
            SET a_hasil = 'Penjualan/Alert berhasil ditambahkan';
        ELSE
            SET a_hasil = 'Stok buku tidak mencukupi. Penjualan gagal dilakukan!';
        END IF;
    ELSE
        SET a_hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END //
DELIMITER ;

-- 5
CREATE VIEW penjualanTerbanyak AS
SELECT 
    b.judul AS judul_buku, 
    p.nama AS nama_penulis, 
    SUM(c.jumlah) AS total_penjualan
FROM Penjualan c JOIN Buku b ON c.id_buku = b.id_buku JOIN Penulis p ON b.id_penulis = p.id_penulis
GROUP BY c.id_buku
ORDER BY total_penjualan DESC
LIMIT 5;

-- 6
DELIMITER //
CREATE PROCEDURE insertToBuku(
    IN a_judul VARCHAR(255),
    IN a_id_penulis INT,
    IN a_harga INT,
    IN a_stok INT,
    OUT a_hasil VARCHAR(255)
)
BEGIN
    DECLARE buku_ada BOOLEAN;
    SELECT COUNT(*) INTO buku_ada FROM Buku WHERE judul = a_judul AND id_penulis = a_id_penulis;
    IF buku_ada = 0 THEN
        INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES (a_judul, a_id_penulis, a_harga, a_stok);
        SET a_hasil = 'Penambahan buku berhasil dilakukan';
    ELSE
        SET a_hasil = 'Buku sudah ada dalam database. Penambahan buku gagal dilakukan!';
    END IF;
END //
DELIMITER ;