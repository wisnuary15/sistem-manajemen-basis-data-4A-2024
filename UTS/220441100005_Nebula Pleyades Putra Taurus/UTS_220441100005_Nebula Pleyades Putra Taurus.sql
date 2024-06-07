-- Progress Untuk Soal 1 (Jawaban Nomer 1)
CREATE DATABASE toko_buku

USE toko_buku

CREATE TABLE Penulis(
  id_penulis INT(15) PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(20),
  negara VARCHAR(30)
);

CREATE TABLE Buku(
  id_buku INT(15) PRIMARY KEY AUTO_INCREMENT,
  judul VARCHAR(20),
  id_penulis INT(15),
  harga INT(15),
  stok INT(15),
  FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

CREATE TABLE Penjualan(
  id_penjualan INT(15) PRIMARY KEY AUTO_INCREMENT,
  id_buku INT(15),
  tanggal DATE,
  jumlah INT(15),
  FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

-- Penambahan Data Tabel
INSERT INTO Penulis (nama, negara) VALUES
('Makoto Shinkai', 'Jepang'),
('Eiichiro Oda', 'Jepang'),
('Hajime Isayama', 'Jepang'),
('Albert Einstein', 'Amerika'),
('Diki Supra Bapak', 'Republik Demokratik Kongo');


INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Perebutan Konstatinopel', 1, 150000, 50),
('One Punch Man', 2, 40000, 100),
('Attack on Titan Vol.1', 3, 550000, 80),
('The Da Vinci Code', 4, 150000, 30),
('Codingan Pengantar Python', 5, 1000000, 20);

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Panduan Pembuatan Bom Nuklir', 4, 12000000, 10),
('Panduan Perakitan PC Vol.1', 5, 150000, 3);

-- Progress Untuk Soal 2 (Jawaban Nomer 2)
CREATE VIEW viewBukuPenulis AS
SELECT Buku.judul AS 'Judul Buku', Buku.harga AS 'Harga', Buku.stok AS 'Stok', Penulis.nama AS 'Nama Penulis', Penulis.negara AS 'Negara Penulis'
FROM Buku
JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis;

SELECT * FROM viewBukuPenulis

-- Progress Untuk Soal 3 (Jawaban Nomer 3)
SELECT * FROM viewBukuPenulis
ORDER BY Harga ASC
LIMIT 5;

-- Progress Untuk Soal 4 (Jawaban Nomer 4) (Program Blm Selesai)
DELIMITER //

CREATE PROCEDURE tambahPenjualan (
    IN id_buku_param INT,
    IN tanggal_param DATE,
    IN jumlah_param INT
)
BEGIN
    DECLARE buku_tersedia INT;
    
    SELECT COUNT(*)
    INTO buku_tersedia
    FROM Buku
    WHERE id_buku = id_buku_param;
    
    
    IF buku_tersedia > 0 THEN
        INSERT INTO Penjualan (id_buku, tanggal, jumlah)
        VALUES (id_buku_param, tanggal_param, jumlah_param);
        SELECT 'Penjualan/Alert berhasil ditambahkan' AS hasil;
    ELSE
        SELECT 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!' AS hasil;
    END IF;
    
END //

DELIMITER//


-- Progress Untuk Soal 5 (Jawaban Nomer 5)
CREATE VIEW penjualanTerbanyak AS
SELECT a.judul AS 'Judul Buku', b.nama AS 'Nama Penulis', SUM(c.jumlah) AS 'Total Penjualan'
FROM Buku a
JOIN Penulis b ON a.id_penulis = b.id_penulis
JOIN Penjualan c ON a.id_buku = c.id_buku
GROUP BY a.id_buku
ORDER BY SUM(c.jumlah) DESC
LIMIT 5;

SELECT * FROM penjualanTerbanyak
