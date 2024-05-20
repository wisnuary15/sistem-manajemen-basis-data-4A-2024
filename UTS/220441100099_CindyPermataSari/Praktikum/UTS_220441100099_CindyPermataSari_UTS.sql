CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE IF NOT EXISTS penulis(
IdPenulis INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nama VARCHAR(15) NOT NULL,
Negara VARCHAR(15) NOT NULL
);

INSERT INTO penulis (Nama, Negara) VALUES
('Cindy', 'Indonesia'),
('Eka', 'Indonesia'),
('Nisa', 'Malaysia'),
('Ardi', 'Indonesia'),
('Akmal', 'Malaysia');

SELECT * FROM penulis;


CREATE TABLE IF NOT EXISTS buku(
IdBuku INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Judul_Buku VARCHAR(25) NOT NULL,
IdPenulis INT(3) NOT NULL,
Harga_Buku INT(7) NOT NULL,
Stok_Buku INT(2) NOT NULL
);

INSERT INTO buku (Judul_Buku, IdPenulis, Harga_Buku, Stok_Buku)VALUES
('Laskar Pelangi', 1, 75000 , 3),
('Ayat-ayat Cinta', 1, 70000, 2),
('Bumi Manusia', 2, 65000, 1),
('Negeri 5 Menara', 3, 90000, 10),
('Pulang', 4, 55000, 5),
('Sang Pemimpi', 5, 55000, 5),
('Perahu Kertas', 5, 70000, 3);

SELECT * FROM buku;


CREATE TABLE IF NOT EXISTS penjualan (
    IdPenjualan INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IdBuku INT(3) NOT NULL,
    Tanggal DATE NOT NULL,
    Jumlah INT(2) NOT NULL
);


ALTER TABLE buku ADD CONSTRAINT fkBuku FOREIGN KEY (IdPenulis) REFERENCES penulis(IdPenulis);
ALTER TABLE penjualan ADD CONSTRAINT fkPenjualan FOREIGN KEY (IdBuku) REFERENCES buku(IdBuku);

-- Nomor 2
CREATE VIEW viewBukuPenulis AS
SELECT b.Judul_Buku, b.Harga_Buku, b.Stok_Buku, a.Nama AS Nama_Penulis, a.Negara AS Negara_Penulis
FROM buku b JOIN penulis a ON b.IdPenulis = a.IdPenulis;

SELECT * FROM viewBukuPenulis;

-- Nomor 3
SELECT * FROM viewBukuPenulis 
ORDER BY Harga_Buku LIMIT 5;

-- Nomor 4
DELIMITER //
CREATE PROCEDURE tambahPenjualan (
    IN id_buku INT,
    IN tanggal DATE,
    IN jumlah INT
)
BEGIN
    INSERT INTO penjualan (IdBuku, Tanggal, Jumlah) VALUES (id_buku, tanggal, jumlah);
END//
DELIMITER ;

CALL tambahPenjualan(1, '2024-01-01', 1);
CALL tambahPenjualan(1, '2024-01-01', 1);
CALL tambahPenjualan(2, '2024-01-01', 1);
CALL tambahPenjualan(2, '2024-01-01', 1);
CALL tambahPenjualan(3, '2024-01-01', 2);
CALL tambahPenjualan(3, '2024-01-01', 1);
CALL tambahPenjualan(4, '2024-01-02', 1);

SELECT * FROM penjualan;

DROP TABLE IF EXISTS penjualan;


-- Nomor 5
CREATE VIEW penjualanTerbanyak AS
SELECT b.Judul_Buku, a.Nama AS Nama_Penulis, SUM(c.Jumlah) AS Total_Penjualan
FROM buku b
JOIN penulis a ON b.IdPenulis = a.IdPenulis
JOIN penjualan c ON b.IdBuku = c.IdBuku
GROUP BY b.IdBuku
ORDER BY Total_Penjualan DESC
LIMIT 5;

SELECT * FROM penjualanTerbanyak;

