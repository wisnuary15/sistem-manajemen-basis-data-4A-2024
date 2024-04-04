CREATE DATABASE perpustakaan;

USE perpustakaan;

CREATE TABLE petugas(
id_petugas VARCHAR(10) NOT NULL PRIMARY KEY,
username VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

CREATE TABLE buku(
kode_buku VARCHAR(10) NOT NULL PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang VARCHAR(30) NOT NULL,
penerbit VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL,
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20)
);

CREATE TABLE anggota(
id_anggota VARCHAR(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir VARCHAR(20) NOT NULL,
tanggal_lahir DATE NOT NULL,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjaman VARCHAR(15) NOT NULL
);

CREATE TABLE pinjaman(
kode_pinjaman VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE NOT NULL,
tanggal_kembali DATE NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

CREATE TABLE pengembalian(
kode_kembali VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE NOT NULL,
tanggal_kembali DATE NOT NULL,
denda VARCHAR(15),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

ALTER TABLE pengembalian ADD CONSTRAINT fk_id_anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);

INSERT INTO petugas VALUES
('pt001', 'adelia001', 'adelia123', 'adelia'),
('pt002', 'fira002', 'fira234', 'fira'),
('pt003', 'arum003', 'arum345', 'arum'),
('pt004', 'devi004', 'devi456', 'devi'),
('pt005', 'depi005', 'depi567', 'depi');

INSERT INTO anggota VALUES
('agt001', 'adelia', 22, 'sidoarjo', '2004-09-24', 08951582057, 'perempuan', 'kembali'),
('agt002', 'fira', 22, 'lamongan', '2004-03-26', 08123456890, 'perempuan', 'kembali'),
('agt003', 'arum', 22, 'pasuruan', '2004-10-24', 08391730163, 'perempuan', 'pinjam'),
('agt004', 'devi', 22, 'lamongan', '2003-09-18', 085928461936, 'perempuan', 'pinjam'),
('agt005', 'depi', 22, 'tuban', '2004-03-25', 089173524781, 'perempuan', 'pinjam'),
('agt006', 'genta', 21, 'nganjuk', '2003-01-01', 08951123567, 'laki-laki', 'kembali'),
('agt007', 'rafi', 21, 'lamongan', '2002-03-26', 08123458315, 'laki-laki', 'kembali'),
('agt008', 'irham', 21, 'sidoarjo', '2003-10-24', 0839182648, 'laki-laki', 'pinjam'),
('agt009', 'syahrul', 21, 'surabaya', '2003-09-18', 089284692, 'laki-laki', 'pinjam');

INSERT INTO buku VALUES
('bk001', 'buku1', 'pengarang1', 'penerbit1', 2021, 10, 'ada', 'sql'),
('bk002', 'buku2', 'pengarang2', 'penerbit2', 2021, 10, 'kembali', 'data mining'),
('bk003', 'buku3', 'pengarang3', 'penerbit3', 2021, 10, 'ada', 'java'),
('bk004', 'buku4', 'pengarang4', 'penerbit4', 2021, 10, 'ada', 'php'),
('bk005', 'buku5', 'pengarang5', 'penerbit5', 2021, 10, 'dipinjam', 'html'),
('bk006', 'buku6', 'pengarang6', 'penerbit6', 2022, 10, 'ada', 'python'),
('bk007', 'buku7', 'pengarang7', 'penerbit7', 2022, 10, 'ada', 'kotlin'),
('bk008', 'buku8', 'pengarang8', 'penerbit8', 2022, 10, 'dipinjam', 'pemrograman dasar'),
('bk009', 'buku9', 'pengarang9', 'penerbit9', 2022, 10, 'ada', 'dataset'),
('bk0010', 'buku10', 'pengarang10', 'penerbit10', 2022, 10, 'ada', 'database');

INSERT INTO pinjaman VALUES
('pj001', 'ang003', 'pt002', '2024-03-01', '2024-03-08', 'bk007'),
('pj002', 'ang004', 'pt002', '2024-03-01', '2024-03-08', 'bk007'),
('pj003', 'ang005', 'pt002', '2024-03-01', '2024-03-08', 'bk007'),
('pj004', 'ang008', 'pt001', '2024-03-02', '2024-03-09', 'bk007'),
('pj005', 'ang001', 'pt001', '2024-03-02', '2024-03-09', 'bk007'),
('pj006', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk007'),
('pj007', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk008'),
('pj008', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk009'),
('pj009', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk001'),
('pj0010', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk002'),
('pj0011', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk003');

INSERT INTO pengembalian VALUES
('kbl001', 'ang002', 'bk005', 'pt003', '2024-02-21', '2024-02-29', '5.000'),
('kbl002', 'ang006', 'bk006', 'pt003', '2024-02-21', '2024-02-28', '0'),
('kbl003', 'ang007', 'bk008', 'pt004', '2024-02-22', '2024-03-01', '5.000');


-- menampilkan nama anggota yang meminjam lebih dari 5 buku (nomor 1)
CREATE VIEW vw_pinjambuku5 AS
SELECT a.nama_anggota, COUNT(p.kode_buku) AS jumlah_buku
FROM anggota a
JOIN pinjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota
HAVING COUNT(p.kode_buku) > 5;

SELECT * FROM vw_pinjambuku5;

-- menampilkan data anggota yang meminjam lebihd ari 5 buku (nomor 1)
CREATE VIEW vw_meminjambuku5 AS
SELECT a.nama_anggota, a.angkatan_anggota, a.no_telp, a.jenis_kelamin, 
COUNT(p.kode_buku) AS jumlah_buku
FROM anggota a
JOIN pinjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota
HAVING COUNT(p.kode_buku) > 5;

SELECT * FROM vw_meminjambuku5;

-- petugas yang melakukan transaksi dan jumlah buku yang terpinjam ketika petugas tersebut berjaga (nomor 2)
CREATE VIEW vw_transaksiPetugas AS
SELECT p.id_petugas, COUNT(p.kode_buku) AS jumlah_buku
FROM pinjaman p GROUP BY p.id_petugas;

SELECT * FROM vw_transaksiPetugas;

-- petugas yang melayani transaksi terbanyak (nomor 3)
CREATE VIEW vw_petugasTransaksiMax AS
SELECT p.id_petugas, COUNT(p.kode_buku) AS jumlah_buku
FROM pinjaman p HAVING COUNT(p.kode_buku) = (SELECT MAX(jumlah_buku)
FROM (SELECT id_petugas, COUNT(kode_buku) AS jumlah_buku
FROM pinjaman GROUP BY id_petugas) AS jumlah_buku);

SELECT * FROM vw_transaksiPetugas LIMIT 1;

-- buku yang terpinjam paling banyak (nomor 4)
CREATE VIEW vw_bukuTerbanyakDipinjam AS
SELECT b.judul_buku, COUNT(p.kode_buku) AS jumlah_terpinjam
FROM buku b JOIN pinjaman p ON b.kode_buku = p.kode_buku
GROUP BY b.judul_buku HAVING COUNT(p.kode_buku) = (SELECT MAX(jumlah_terpinjam)
FROM (SELECT COUNT(kode_buku) AS jumlah_terpinjam FROM pinjaman GROUP BY kode_buku) AS
jumlah_terpinjam);

SELECT * FROM vw_bukuTerbanyakDipinjam;