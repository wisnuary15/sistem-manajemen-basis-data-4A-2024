CREATE DATABASE toko_buku;

USE toko_buku;

CREATE TABLE Penulis (
    id_penulis INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    negara VARCHAR(50)
);


    
CREATE TABLE Buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(100),
    id_penulis INT,
    harga INT(10),
    stok INT(10),
    FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);


CREATE TABLE Penjualan (
    id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_buku INT,
    tanggal DATE,
    jumlah INT,
    FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

INSERT INTO Penulis (nama, negara) VALUES 
('Andrea Hirata', 'Indonesia'),
('Tere Liye', 'Indonesia'),
('Dewi Lestari', 'Indonesia'),
('Eiichiro Oda', 'Jepang'),
('Masashi Kishimoto', 'Jepang'),
('Akira Toriyama', 'Jepang');

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Laskar Pelangi', 1, 80000, 10), 
('Bumi', 2, 90000, 15),            
('One Piece', 3, 50000, 20),
('Naruto', 4, 50000, 12),
('Dragon Ball', 6, 95000, 18),
('Supernova', 5, 100000, 20)
; 
-- soal2

CREATE VIEW viewBukuPenulis AS 
SELECT judul,harga,stok,nama AS 'nama penulis' 
FROM Buku a JOIN Penulis b
ON a.id_penulis = b.id_penulis;

-- soal 3

SELECT * FROM viewBukuPenulis 
ORDER BY harga ASC LIMIT 5;

-- soal 4



-- soal 5

CREATE VIEW penjualanTerbanyak AS
SELECT judul,nama, jumlah 
FROM Penulis a JOIN Buku b ON a.id_penulis = b.id_penulis
JOIN Penjualan c ON b.id_buku = c.id_buku GROUP BY b.id_buku
ORDER BY jumlah DESC;