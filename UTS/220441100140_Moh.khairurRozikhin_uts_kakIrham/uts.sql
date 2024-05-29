CREATE DATABASE IF NOT EXISTS toko_buku;

USE toko_buku;

/*soal 1*/

CREATE TABLE  Penulis (
    id_penulis INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255),
    negara VARCHAR(255)
);

CREATE TABLE  Buku (
    id_buku INT PRIMARY KEY AUTO_INCREMENT,
    judul VARCHAR(255),
    id_penulis INT,
    harga INT,
    stok INT
);

CREATE TABLE  Penjualan (
    id_penjualan INT PRIMARY KEY AUTO_INCREMENT,
    id_buku INT,
    tanggal DATE,
    jumlah INT
);

ALTER TABLE Buku 
ADD FOREIGN KEY (id_penulis) 
REFERENCES Penulis(id_penulis);

ALTER TABLE Penjualan 
ADD FOREIGN KEY (id_buku) 
REFERENCES Buku(id_buku);


/*soal 2*/

CREATE VIEW viewBukuPenulis AS
SELECT Buku.judul, Buku.harga, Buku.stok, Penulis.nama AS nama_penulis, Penulis.negara
FROM Buku
JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis;

SELECT * FROM viewBukuPenulis;

INSERT INTO Penulis (nama, negara) VALUES 
    ('adhelia', 'indonesia'),
    ('alim', 'indonesi'),
    ('sugiarto', 'indonesi');

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES 
    ('kisah nabi', 1, 20000, 100),
    ('pokok ini buku', 2, 25000, 50),
    ('sama ini juga buku', 3, 18000, 75);


/*soal no3*/
SELECT * FROM viewBukuPenulis 
ORDER BY harga 
ASC LIMIT 5;


/*soal no4*/
DELIMITER //

CREATE PROCEDURE tambahPenjualan (
    IN p_id_buku INT,
    IN p_tanggal DATE,
    IN p_jumlah INT,
    OUT hasil VARCHAR(255)
)
BEGIN
    DECLARE stok_buku INT;
    SELECT stok INTO stok_buku FROM Buku WHERE id_buku = p_id_buku;
    
    IF stok_buku >= p_jumlah THEN
        INSERT INTO Penjualan (id_buku, tanggal, jumlah) VALUES (p_id_buku, p_tanggal, p_jumlah);
        SET hasil = 'Penjualan/Alert berhasil ditambahkan';
    ELSE
        SET hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END //
DELIMITER ;

CALL tambahPenjualan(1, '2024-05-09', 20, @hasil);
SELECT @hasil;

/*soal no5*/

CREATE VIEW penjualanTerbanyak AS
SELECT Buku.judul, Penulis.nama AS nama_penulis, SUM(Penjualan.jumlah) AS total_penjualan
FROM Penjualan
JOIN Buku ON Penjualan.id_buku = Buku.id_buku
JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis
GROUP BY Penjualan.id_buku
ORDER BY total_penjualan DESC
LIMIT 5;

SELECT * FROM penjualanTerbanyak;



