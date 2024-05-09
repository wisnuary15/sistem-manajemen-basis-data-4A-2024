CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE penulis (
   id_penulis INT AUTO_INCREMENT PRIMARY KEY,
   nama VARCHAR(35),
   negara VARCHAR(36)
);

CREATE TABLE Buku (
   id_buku INT AUTO_INCREMENT PRIMARY KEY,
   judul VARCHAR(25),
   id_penulis INT UNIQUE,
   harga INT,
   stok INT,
   FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

CREATE TABLE penjualan (
   id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
   id_buku INT UNIQUE,
   tanggal DATE,
   jumlah INT,
   FOREIGN KEY (id_buku) REFERENCES Buku(id_penulis)
);

INSERT INTO penulis (nama, negara) VALUES
('John Doe', 'United States'),
('Jane Smith', 'United Kingdom'),
('Mohammed Ahmed', 'Egypt'),
('Maria Garcia', 'Spain'),
('Chen Wei', 'China'),
('Anna Müller', 'Germany'),
('Yuki Tanaka', 'Japan'),
('Carlos Lopez', 'Mexico'),
('Fatima Khan', 'Pakistan'),
('Olga Petrova', 'Russia');

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('The Adventures of Tom Sawyer', 1, 15, 100),
('Pride and Prejudice', 2, 20, 85),
('The Alchemist', 3, 18, 120),
('Don Quixote', 4, 22, 75),
('Dream of the Red Chamber', 5, 25, 90),
('Faust', 6, 30, 110),
('One Hundred Years of Solitude', 7, 17, 95),
('Pedro Páramo', 8, 19, 80),
('The Kite Runner', 9, 21, 105),
('War and Peace', 10, 35, 130);


CREATE VIEW viewBukuPenulis AS
SELECT Buku.judul, Buku.harga, Buku.stok, penulis.nama AS nama_penulis, penulis.negara AS negara_penulis
FROM Buku
JOIN penulis ON Buku.id_penulis = penulis.id_penulis;

SELECT *
FROM viewBukuPenulis
ORDER BY harga ASC
LIMIT 5;

DELIMITER //
CREATE PROCEDURE tambah_penjualan(
    IN id_buku_param INT,
    IN jumlah_param INT,
    OUT hasil VARCHAR(100)
)
BEGIN
    DECLARE buku_tersedia INT;

    SELECT COUNT(*) INTO buku_tersedia FROM Buku WHERE id_buku = id_buku_param;

    IF buku_tersedia > 0 THEN
        INSERT INTO Penjualan (id_buku, jumlah) VALUES (id_buku_param, jumlah_param);
        SET hasil = 'Penjualan/Alert berhasil ditambahkan';
    ELSE
        SET hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END //
DELIMITER ;

CREATE VIEW penjualanTerbanyak AS
SELECT 
    Buku.judul AS judul_buku, 
    penulis.nama AS nama_penulis, 
    SUM(Penjualan.jumlah) AS total_penjualan
FROM 
    Penjualan
JOIN 
    Buku ON Penjualan.id_buku = Buku.id_buku
JOIN 
    penulis ON Buku.id_penulis = penulis.id_penulis
GROUP BY 
    Penjualan.id_buku
ORDER BY 
    total_penjualan DESC
LIMIT 5;

DELIMITER //

CREATE PROCEDURE insertToBuku(
    IN judul_buku VARCHAR(255),
    IN id_penulis_param INT,
    IN harga_param INT,
    IN stok_param INT,
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE buku_exist INT;

    SELECT COUNT(*) INTO buku_exist FROM Buku WHERE judul = judul_buku;

    IF buku_exist = 0 THEN
        INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES (judul_buku, id_penulis_param, harga_param, stok_param);
        SET result = 'Buku berhasil ditambahkan ke dalam sistem.';
    ELSE
        SET result = 'Buku dengan judul tersebut sudah ada dalam database.';
    END IF;
END //

DELIMITER ;


CALL tambah_penjualan(1, 5, @hasil);
SELECT @hasil;

SELECT * FROM penjualanTerbanyak;

CALL insertToBuku('Judul Buku Baru', 1, 50, 100, @hasil);
SELECT @hasil;




