CREATE DATABASE perpus;

USE perpus;

CREATE TABLE IF NOT EXISTS petugas(
id_petugas INT (10) NOT NULL PRIMARY KEY,
username VARCHAR (15) NOT NULL,
pass VARCHAR (15) NOT NULL,
nama_petugas VARCHAR (15)
);

CREATE TABLE IF NOT EXISTS buku(
kode_buku INT(10) NOT NULL  PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
penerbit_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL, 
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS anggota(
id_anggota INT(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL
);

ALTER TABLE anggota MODIFY COLUMN no_telp VARCHAR (12);


CREATE TABLE IF NOT EXISTS pengembalian(
id_kembali INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
kode_buku INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR(15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);


CREATE TABLE IF NOT EXISTS peminjaman(
id_pinjam INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku INT(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);


INSERT INTO perpus.petugas VALUES
(110, 'budi00', 'b110','budi'),
(111, 'siti01', 's111','siti'),
(112, 'nastri02', 'n112','nastri'),
(113, 'sultan03', 's113','suktan'),
(114, 'andi04', 'a114','andi');


INSERT INTO perpus.buku VALUES
(210, 'Harry Potter', 'J.K. Rowling','Bloomsbury','1997', '7', 'baik', 'fiksi'),
(211, 'The Hunger Games', 'Suzzane Collins','Scholastic Cooperation','2008', '6', 'baik', 'fiksi'),
(212, 'Pride and Preajudice', 'Jane Austen','Whitehall','1813', '4', 'baik', 'fiksi'),
(213, 'The Hobbit', 'J.R.R. Tolkien','Allen & Unwin','1937', '7', 'baik', 'fiksi'),
(214, 'The Passage', 'Justin Cronin','Ballantine Books','2010', '15', 'baik', 'fiksi'),
(215, 'Bumi Manusia', 'Pramoedya Ananta Toer','Hasta Mitra','1980', '10', 'baik', 'fiksi'),
(216, 'Pulang', 'Tere Liye','Gramedia Pustaka Utama','2012', '10', 'baik ', 'fiksi'),
(217, 'Aroma Karsa', 'Dee Lestari','Bentang Pustaka','2021', '15', 'baik', 'fiksi'),
(218, 'Sang Pemimpi', 'Andrea Hirata','Bentang Pustaka','2006', '7', 'baik', 'fiksi'),
(219, 'Matahari', 'Tere Liye','Gramedia Pustaka Utama','2011', '11', 'baik', 'fiksi');

INSERT INTO perpus.anggota VALUES
(310, 'Revalina', '2022', 'Surabaya', '2004-06-19', '081334666249', 'perempuan', 'pinjam'),
(311, 'Dita', '2022', 'Nganjuk', '2003-05-23', '084582335617', 'perempuan', 'pinjam'),
(312, 'Dhea', '2022', 'Bojonegoro', '2004-10-16', '084429119444', 'perempuan', 'pinjam'),
(313, 'Mahesa', '2021', 'Malang', '2002-10-15', '082367789115', 'laki-laki', 'pinjam'),
(314, 'Jeremy', '2021', 'Blitar', '2002-11-15', '087311742299', 'laki-laki', 'pinjam'),
(315, 'Shaka', '2022', 'Pasuruan', '2002-12-08', '081670092366', 'laki-laki', 'pinjam');


INSERT INTO perpus.pengembalian VALUES
(410, 310, 211, 110, '2024-02-02', '2024-02-09', '0'),
(411, 313, 211, 113, '2024-02-16', '2024-02-23', '0'),
(412, 313, 216, 113, '2024-02-16', '2024-02-23', '0'),
(413, 314, 214, 114, '2024-02-13', '2024-02-20', '0'),
(414, 315, 216, 114, '2024-02-13', '2024-02-20', '0');

INSERT INTO perpus.peminjaman VALUES
(510, 312, 111, '2024-02-13', '2024-02-20', 216),
(511, 311, 112, '2024-02-17', '2024-02-24', 217),
(512, 313, 112, '2024-02-17', '2024-02-24', 219),
(513, 313, 113, '2024-02-23', '2024-02-30', 210),
(514, 313, 111, '2024-02-24', '2024-03-01', 212);

DELETE FROM peminjaman;

CREATE VIEW vw_anggota_peminjamn_5 AS
SELECT p.id_anggota, a.nama_anggota, COUNT(*) AS jumlah_pinjam
FROM anggota a JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY p.id_anggota, a.nama_anggota
HAVING COUNT(*) > 5;

SELECT * FROM vw_anggota_peminjamn_5;

CREATE VIEW view_petugas_pinjam AS
SELECT t.id_petugas, t.nama_petugas, p.tanggal_pinjam, COUNT(*) AS jumlah_transaksi
FROM petugas t JOIN peminjaman p ON t.id_petugas = p.id_petugas
GROUP BY t.id_petugas, t.nama_petugas;

SELECT * FROM view_petugas_pinjam;

CREATE VIEW view_petugas_kembali AS
SELECT t.id_petugas, t.nama_petugas, p.tgl_pinjam, COUNT(*) AS jumlah_transaksi
FROM petugas t JOIN pengembalian p ON t.id_petugas = p.id_petugas
GROUP BY t.id_petugas, t.nama_petugas;

SELECT * FROM view_petugas_kembali;


CREATE VIEW view_petugas_transaksi_terbanyak AS
SELECT id_petugas, nama_petugas, SUM(jumlah_transaksi) AS total_transaksi
FROM (
    SELECT t.id_petugas, t.nama_petugas, COUNT(p.id_pinjam) AS jumlah_transaksi
    FROM petugas t
    INNER JOIN peminjaman p ON t.id_petugas = p.id_petugas
    GROUP BY t.id_petugas, t.nama_petugas
    UNION ALL
    SELECT t.id_petugas, t.nama_petugas, COUNT(p.id_kembali) AS jumlah_transaksi
    FROM petugas t
    INNER JOIN pengembalian p ON t.id_petugas = p.id_petugas
    GROUP BY t.id_petugas, t.nama_petugas
) AS transaksi_total
GROUP BY id_petugas, nama_petugas
ORDER BY total_transaksi DESC
LIMIT 1;

SELECT * FROM view_petugas_transaksi_terbanyak;

CREATE VIEW view_buku_terbanyak AS
SELECT kode_buku, judul_buku, SUM(jumlah_pinjam) AS total_peminjaman
FROM (
    SELECT b.kode_buku, b.judul_buku, COUNT(p.id_pinjam) AS jumlah_pinjam
    FROM buku b
    INNER JOIN peminjaman p ON b.kode_buku = p.kode_buku
    GROUP BY b.kode_buku, b.judul_buku
    UNION ALL
    SELECT b.kode_buku, b.judul_buku, COUNT(p.id_kembali) AS jumlah_pengembalian
    FROM buku b
    INNER JOIN pengembalian p ON b.kode_buku = p.kode_buku
    GROUP BY b.kode_buku, b.judul_buku
) AS transaksi_buku
GROUP BY kode_buku, judul_buku
ORDER BY total_peminjaman DESC
LIMIT 1;

SELECT * FROM view_buku_terbanyak;

