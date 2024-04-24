CREATE DATABASE perpustakaan;
USE perpustakaan;



CREATE TABLE IF NOT EXISTS petugas(
idPetugas VARCHAR (10) PRIMARY KEY NOT NULL,
username VARCHAR (15) NOT NULL,
pasword VARCHAR (15) NOT NULL,
nama VARCHAR (25) NOT NULL
);

CREATE TABLE IF NOT EXISTS buku(
kode_buku VARCHAR (10) PRIMARY KEY NOT NULL,
judul_buku VARCHAR (25) NOT NULL,
pengarang_buku VARCHAR (30) NOT NULL,
penerbit_buku VARCHAR (30) NOT NULL,
tahun_buku VARCHAR (10) NOT NULL,
jumlah_buku VARCHAR (5) NOT NULL,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL
);

CREATE TABLE IF NOT EXISTS anggota(
idAnggota VARCHAR (10) PRIMARY KEY NOT NULL,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR (6) NOT NULL,
tempat_lahir_anggota VARCHAR (20) NOT NULL,
tanggal_lahir_anggota DATE
);

CREATE TABLE IF NOT EXISTS peminjaman(
kode_peminjaman VARCHAR(10) PRIMARY KEY NOT NULL,
idAnggota VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (10) NOT NULL
);

CREATE TABLE IF NOT EXISTS pengembalian(
kode_kembali VARCHAR(10) NOT NULL,
idAnggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
tgl_pinjam DATE NOT NULL,
tgl_kembali DATE NOT NULL,
denda VARCHAR(15)
);



ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_id_anggota FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);

ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_kode_buku FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_id_petugas FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);

ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_id_anggota1 FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);

ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_kode_buku1 FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_id_petugas1 FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);





INSERT INTO anggota VALUES 
('A001', 'Budi Santoso', '2020', 'Jakarta', '2000-01-01'),
('A002', 'Ani Susanti', '2019', 'Bandung', '2001-02-02'),
('A003', 'Michael Johnson', '2021', 'Surabaya', '1999-03-03'),
('A004', 'Emily Brown', '2018', 'Medan', '2002-04-04'),
('A005', 'David Lee', '2022', 'Semarang', '1998-05-05')
;

INSERT INTO buku VALUES 
('B001', 'Harry Potter dan Batu Bertuah', 'J.K. Rowling', 'Scholastic', '1997', '100', 'Tersedia', 'Fantasi'),
('B002', 'Untuk Membunuh Seekor Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', '75', 'Tersedia', 'Fiksi'),
('B003', '1984', 'George Orwell', 'Secker & Warburg', '1949', '50', 'Tersedia', 'Dystopian'),
('B004', 'Gatsby Si Lelaki Besar', 'F. Scott Fitzgerald', 'Scribner', '1925', '60', 'Tersedia', 'Klasik'),
('B005', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '70', 'Tersedia', 'Romansa'),
('B006', 'Pemburu di Tepi Jeram', 'J.D. Salinger', 'Little, Brown and Company', '1951', '45', 'Tersedia', 'Pertumbuhan'),
('B007', 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '1937', '80', 'Tersedia', 'Fantasi'),
('B008', 'Moby-Dick', 'Herman Melville', 'Richard Bentley', '1851', '55', 'Tersedia', 'Petualangan'),
('B009', 'Frankenstein', 'Mary Shelley', 'Lackington, Hughes, Harding, Mavor & Jones', '1818', '65', 'Tersedia', 'Gothik'),
('B010', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', '90', 'Tersedia', 'Fantasi')
;

INSERT INTO petugas VALUES 
('P001', 'user1', 'password1', 'Andi'),
('P002', 'user2', 'password2', 'Budi'),
('P003', 'user3', 'password3', 'Cindy'),
('P004', 'user4', 'password4', 'Dedi'),
('P005', 'user5', 'password5', 'Eka')
;


INSERT INTO peminjaman VALUES 
('PM001', 'A001', 'P001', '2024-04-21', '2024-05-05', 'B001'),
('PM002', 'A002', 'P002', '2024-04-21', '2024-05-05', 'B002'),
('PM003', 'A003', 'P003', '2024-04-21', '2024-05-05', 'B003'),
('PM004', 'A004', 'P004', '2024-04-21', '2024-05-05', 'B004'),
('PM005', 'A005', 'P005', '2024-04-21', '2024-05-05', 'B005'),
('PM006', 'A002', 'P005', '2024-04-21', '2024-05-06', 'B006'),
('PM007', 'A002', 'P004', '2024-04-21', '2024-05-07', 'B007'),
('PM008', 'A002', 'P003', '2024-04-21', '2024-05-08', 'B008'),
('PM009', 'A002', 'P002', '2024-04-21', '2024-05-09', 'B009'),
('PM010', 'A003', 'P003', '2024-04-21', '2024-05-05', 'B003')
;




INSERT INTO pengembalian VALUES 
('K001', 'A001', 'B001', 'P001', '2024-04-21', '2024-05-05', '0'),
('K002', 'A002', 'B002', 'P002', '2024-04-21', '2024-05-05', '0'),
('K003', 'A003', 'B003', 'P003', '2024-04-21', '2024-05-06', '0'),
('K004', 'A004', 'B004', 'P004', '2024-04-21', '2024-05-05', '0'),
('K005', 'A005', 'B005', 'P005', '2024-04-21', '2024-05-05', '0'),
('K006', 'A002', 'B006', 'P001', '2024-04-21', '2024-05-06', '0'),
('K007', 'A002', 'B007', 'P002', '2024-04-21', '2024-05-07', '0'),
('K008', 'A002', 'B008', 'P003', '2024-04-21', '2024-05-08', '0'),
('K009', 'A002', 'B009', 'P004', '2024-04-21', '2024-05-09', '0'),
('K010', 'A003', 'B010', 'P003', '2024-04-21', '2024-05-06', '0')
;




CREATE VIEW viewAnggotaPeminjaman AS
SELECT p.idAnggota, a.nama_anggota, COUNT(*) AS jumlah_peminjaman
FROM anggota a JOIN peminjaman p ON a.idAnggota = p.idAnggota
GROUP BY p.idAnggota, a.nama_anggota
HAVING COUNT(*) >= 5;


CREATE VIEW viewPetugas AS
SELECT a.idPetugas, a.nama, p.tanggal_pinjam, COUNT(*) AS jumlah_transaksi
FROM petugas a JOIN peminjaman p ON a.idPetugas = p.idPetugas
GROUP BY a.idPetugas, a.nama;


CREATE VIEW viewPetugasTerbanyak AS
SELECT a.idPetugas, a.nama, COUNT(p.kode_peminjaman) AS jumlah_transaksi
FROM petugas a
INNER JOIN peminjaman p ON a.idPetugas = p.idPetugas
GROUP BY a.idPetugas, a.nama
ORDER BY jumlah_transaksi DESC LIMIT 1;


CREATE VIEW viewBukuTerbanyak AS
SELECT b.kode_buku, b.judul_buku, COUNT(p.kode_peminjaman) AS jumlah_pinjam
FROM buku b
INNER JOIN peminjaman p ON b.kode_buku = p.kode_buku
GROUP BY b.kode_buku, b.judul_buku
ORDER BY jumlah_pinjam DESC LIMIT 1;



SELECT * FROM viewAnggotaPeminjaman;

SELECT * FROM viewPetugas;

SELECT * FROM viewPetugasTerbanyak;

SELECT * FROM viewBukuTerbanyak;

 