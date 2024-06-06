CREATE DATABASE databuku;
USE databuku;

DROP DATABASE databuku;

CREATE TABLE IF NOT EXISTS penulis (
id_penulis INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nama VARCHAR (50) NOT NULL,
negara VARCHAR (30) NOT NULL
);

INSERT INTO penulis VALUES 
(NULL, 'Tereliye','Indonesia'),
(NULL, 'Joko','Indonesia'),
(NULL,'Palejo','Argentina');



CREATE TABLE IF NOT EXISTS buku (
id_buku INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
judul VARCHAR (50),
id_penulis INT,
harga INT (20),
stok INT (20),
FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis) 
);

INSERT INTO buku VALUES 
(NULL,'Laskar Pelangi',2,100000,5),
(NULL,'Pulang',1,200000,9),
(NULL,'The Gates',3,250000,7);

SELECT * FROM buku;
DROP TABLE buku



CREATE TABLE IF NOT EXISTS penjualan (
id_penjualan INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_buku INT,
tanggal DATE,
jumlah INT (20),
FOREIGN KEY (id_buku) REFERENCES buku(id_buku) 
);

INSERT INTO penjualan VALUES 
(NULL,3,'2024-05-05',4),
(NULL,1,'2024-05-08',2),
(NULL,2,'2024-05-07',1);

-- Nomor 2
CREATE VIEW viewBukuPenulis AS 
SELECT judul,harga,stok,nama,negara 
FROM penulis a 
JOIN buku b ON a.id_penulis = b.id_penulis
JOIN penjualan c ON b.id_buku = c.id_buku;

SELECT * FROM viewBukuPenulis;

-- Nomor 3
CREATE VIEW viewHargaTermurah AS 
SELECT judul,harga,stok,nama,negara 
FROM penulis a 
JOIN buku b ON a.id_penulis = b.id_penulis
JOIN penjualan c ON b.id_buku = c.id_buku
GROUP BY nama
ORDER BY harga DESC;

SELECT * FROM viewHargaTermurah;

-- Nomor 4



-- Nomor 5
CREATE VIEW penjualanTerbanyak AS 
SELECT judul,nama,jumlah 
FROM buku a
JOIN penulis b ON a.id_penulis = b.id_penulis
JOIN penjualan c ON b.id_buku = c.id_buku
GROUP BY judul
ORDER BY jumlah ASC;


