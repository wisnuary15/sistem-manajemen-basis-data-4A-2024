
CREATE DATABASE toko_buku;

USE toko_buku;

CREATE TABLE IF NOT EXISTS Penulis (
id_penulis INT AUTO_INCREMENT PRIMARY KEY,
nama VARCHAR(30),
negara VARCHAR(30)
);

INSERT INTO Penulis (nama, negara) VALUES
('Rafly', 'Indonesia'),
('Nabil', 'Jepang'),
('Zaki', 'Malaysia');

CREATE TABLE IF NOT EXISTS Buku (
id_buku INT AUTO_INCREMENT PRIMARY KEY,
judul VARCHAR(30),
id_penulis INT,
harga INT(30),
stok INT(30),
FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Buku1', 1, 200000, 100),
('Buku2', 2, 180000, 50),
('Buku3', 3, 220000, 80);

CREATE TABLE IF NOT EXISTS Penjualan (
id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
id_buku INT,
tanggal VARCHAR(50),
jumlah INT(30),
FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

CREATE VIEW viewBukuPenulis AS
SELECT Buku.judul AS judul_buku, 
       Buku.harga, 
       Buku.stok, 
       Penulis.nama AS nama_penulis, 
       Penulis.negara AS negara_penulis
FROM Buku
INNER JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis;

SELECT * FROM viewBukuPenulis;

SELECT * FROM viewBukuPenulis ORDER BY harga ASC LIMIT 5;

