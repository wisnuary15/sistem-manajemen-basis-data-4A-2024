CREATE DATABASE  toko_buku;
use  toko_buku;

CREATE TABLE penulis(
id_penulis INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nama VARCHAR(100) NOT NULL,
negara VARCHAR(100) NOT NULL
);

CREATE TABLE buku(
id_buku INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
judul VARCHAR(100) NOT NULL,
id_penulis INT,
harga INT,
stok INT,
FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

CREATE TABLE penjualan(
id_penjualan INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_buku INT,
tanggal DATE,
jumlah INT,
FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);

INSERT INTO penulis (nama, negara)
VALUES 
('James Clear', 'England'),
('Yuval Noah Harari', 'Indonesia'),
('Cho Nam-Joo', 'South Korea'),
( 'Mommy ASF', 'Indonesia'),
('Tere Liye', 'Indonesia'),
('Andrea Hirata', 'Indonesia');


INSERT INTO buku ( judul, id_penulis, harga, stok)
VALUES 
('Atomic Habits', 1, 170000, 100),
('Sapiens: Riwayat Singkat Umat Manusia', 2, 150000, 70),
('Kim Ji-Yeong Lahir Tahun 1982', 3, 100000, 50),
('Layangan Putus', 4, 100000, 50),
('Luka dan Lara', 5, 110000, 50),
('Laskar Pelangi', 6, 100000, 50);


CREATE VIEW viewBukuPenulis AS
SELECT b.judul AS judul_buku, b.harga, b.stok, p.nama AS nama_penulis, p.negara
FROM buku b 
JOIN penulis p ON b.id_penulis = p.id_penulis;

SELECT * From viewBukuPenulis
ORDER BY harga;

CREATE PROCEDURE cekPenjualan(
    IN id_buku_param INT,
    IN jumlah INT
    )
BEGIN
    Declare buku_tersedia INT;

	SELECT COUNT(*) INTO buku_tersedia FROM buku WHERE id_buku = id_buku_param;
    IF buku_tersedia > 0 THEN
        INSERT INTO penjualan (id_buku, jumlah) VALUES (id_buku_param, jumlah);
        SELECT 'Penjualan/Alert Berhasil ditambhakan!' As hasil;
    ELSE 
        SELECT 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!' As hasil;
    END IF;
END 
