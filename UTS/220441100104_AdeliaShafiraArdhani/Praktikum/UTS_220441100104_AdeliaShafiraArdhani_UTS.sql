CREATE DATABASE toko_buku;

USE toko_buku;

CREATE TABLE penulis(
id_penulis INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nama_penulis VARCHAR(50) NOT NULL,
negara VARCHAR(10) NOT NULL
);

CREATE TABLE buku(
id_buku INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
judul_buku VARCHAR(50) NOT NULL,
id_penulis INT(5) NOT NULL,
harga INT(7) NOT NULL,
stok INT(3),
FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

CREATE TABLE penjualan(
id_penjualan INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_buku INT(5) NOT NULL,
tanggal DATE,
jumlah INT(3),
FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);

INSERT INTO penulis (nama_penulis, negara) VALUES
('adelia', 'korsel'),
('amala', 'indo'),
('shafira', 'malay'),
('devi', 'korut'),
('ikin', 'brazil'),
('adi', 'afrika');

INSERT INTO buku (judul_buku, id_penulis, harga, stok) VALUES
('judul1', 1, 90000, 90),
('judul2', 1, 80000, 90),
('judul3', 2, 95000, 90),
('judul4', 2, 98000, 96),
('judul5', 3, 76000, 50),
('judul6', 3, 57000, 45),
('judul7', 4, 85000, 87),
('judul8', 4, 94000, 65),
('judul9', 5, 76000, 65),
('judul10', 5, 94000, 13),
('judul11', 6, 93000, 75),
('judul12', 6, 82000, 39);

-- nomer 1
CREATE VIEW vw_bukuPenulis AS
SELECT b.judul_buku, b.harga, b.stok, p.nama_penulis, p.negara
FROM buku b INNER JOIN penulis p ON b.id_penulis = p.id_penulis;

SELECT * FROM vw_bukuPenulis;

-- nomor 2
SELECT * FROM vw_bukuPenulis ORDER BY harga ASC LIMIT 5;

-- nomor 3
DELIMITER //
CREATE PROCEDURE tambahPenjualan(
    IN idBuku INT,
    IN jumlah_buku INT,
    IN total_buku DECIMAL(10,2),
    OUT hasil VARCHAR(100)
)
BEGIN
    DECLARE id_buku_exist INT;
    
    -- Cek ketersediaan id_buku di Tabel Buku
    SELECT COUNT(*) INTO id_buku_exist FROM Buku WHERE id_buku = idBuku;
    
    -- Jika id_buku tersedia, tambahkan data ke Tabel Penjualan
    IF id_buku_exist > 0 THEN
        INSERT INTO Penjualan (id_buku, jumlah, total) VALUES (idBuku, jumlah_buku, total_buku);
        SET hasil = 'Penjualan/Alert berhasil ditambahkan';
    ELSE
        SET hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END //
DELIMITER ;

CALL tambahPenjualan(1, 5, 95);

-- nomor 5
CREATE VIEW  vw_jualBanyak AS
SELECT b.judul_buku, p.nama_penulis, SUM(j.jumlah) AS total_jual
FROM penjualan j
INNER JOIN buku b ON j.id_buku = b.id_buku
INNER JOIN penulis p ON b.id_penulis = p.id_penulis
GROUP BY j.id_buku ORDER BY total_jual DESC LIMIT 5;

SELECT * FROM vw_jualBanyak;

-- nomor 6
DELIMITER //
CREATE PROCEDURE insertToBuku(
    IN judulBuku VARCHAR(50),
    IN idPenulis INT,
    IN hargaBuku INT(7),
    IN stokBuku INT(3)
)
BEGIN
   INSERT INTO Buku (judul_buku, id_penulis, harga, stok) 
    VALUES (judulBuku, idPenulis, hargaBuku, stokBuku);
END //
DELIMITER ;

CALL insertToBuku ('judul13', 6, 87000, 90);
