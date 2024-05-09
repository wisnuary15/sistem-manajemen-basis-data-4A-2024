CREATE DATABASE library;

USE library;

CREATE TABLE petugas (
    idPetugas VARCHAR (10),
    username VARCHAR (15),
    PASSWORD VARCHAR (15),
    nama VARCHAR (25),
    PRIMARY KEY (idPetugas)
);

CREATE TABLE buku (
    kode_buku VARCHAR (10),
    judul_buku VARCHAR (25),
    pengarang_buku VARCHAR (30),
    penerbit_buku VARCHAR (30),
    tahun_buku VARCHAR (10),
    jumlah_buku VARCHAR (5),
    status_buku VARCHAR (10),
    klasifikasi_buku VARCHAR (20),
    PRIMARY KEY (kode_buku)
);


CREATE TABLE anggota (
    idAnggota VARCHAR (10) PRIMARY KEY,
    nama_anggota VARCHAR (20),
    angkatan_anggota VARCHAR (6),
    tempat_lahir_anggota VARCHAR (20),
    tanggal_lahir_anggota DATE,
    no_telp INT (12),
    jenis_kelamin VARCHAR (15),
    status_pinjam VARCHAR (15)
);

CREATE TABLE pengembalian (
kode_kembalian VARCHAR(10) PRIMARY KEY,
idAnggota VARCHAR (10),
kode_buku VARCHAR (10),
idPetugas VARCHAR (10),
Tgl_Pinjam DATE,
Tgl_Kembalian DATE,
Denda VARCHAR(15)
);

ALTER TABLE pengembalian ADD CONSTRAINT keanggota FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota);
ALTER TABLE pengembalian ADD CONSTRAINT kebuku FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku);
ALTER TABLE pengembalian ADD CONSTRAINT kepetugas FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas);

CREATE TABLE peminjaman (
Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
idAnggota VARCHAR (10),
idPetugas VARCHAR (10),
Tanggal_Pinjam DATE,
Tanggal_Kembali DATE,
kode_buku VARCHAR (10)
);

ALTER TABLE peminjaman ADD CONSTRAINT peminjaman_anggota FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota);
ALTER TABLE peminjaman ADD CONSTRAINT peminjaman_petugas FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas);
ALTER TABLE peminjaman ADD CONSTRAINT peminjaman_buku FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku);

INSERT INTO petugas VALUES
('PTG001', 'budi', 'password1', 'Budi Santoso'),
('PTG002', 'anita', 'password2', 'Anita Wijaya'),
('PTG003', 'ahmad', 'password3', 'Ahmad Fadillah'),
('PTG004', 'siti', 'password4', 'Siti Rahayu'),
('PTG005', 'dewi', 'password5', 'Dewi Susanti');

SELECT * FROM buku;
INSERT INTO buku VALUES 
('BK001', 'Harry Potter dan Batu Bertuah', 'J.K. Rowling', 'Gramedia Pustaka Utama', '1998', '100', 'Tersedia', 'Fiksi Fantasi'),
('BK002', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '75', 'Tersedia', 'Fiksi Drama'),
('BK003', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '50', 'Tersedia', 'Sastra'),
('BK004', 'Sherlock Holmes: The Hound of the Baskervilles', 'Arthur Conan Doyle', 'Penguin Classics', '1902', '30', 'Tersedia', 'Misteri'),
('BK005', 'Atlas Indonesia', 'Penerbit Erlangga', 'Erlangga', '2020', '20', 'Tersedia', 'Non-Fiksi Geografi'),

('BK006', 'Buku A', 'Smith', 'Gramedia Pustaka Utama', '1999', '100', 'Tersedia', 'Fiksi Fantasi'),
('BK007', 'Buku B', 'Andrea', 'Bentang Pustaka', '2015', '75', 'Tersedia', 'Fiksi Drama'),
('BK008', 'Buku C', 'Ananta', 'Hasta Mitra', '2010', '50', 'Tersedia', 'Sastra'),
('BK009', 'Buku D', 'Conan', 'Gramedia Pustaka Utama', '2019', '30', 'Tersedia', 'Bisnis'),
('BK010', 'Buku E', 'Arthur', 'Gramedia Pustaka Utama', '2019', '30', 'Tersedia', 'Bisnis');


SELECT * FROM anggota;
INSERT INTO anggota VALUES 
('A001', 'Ahmad', '2018', 'Jakarta', '2003-05-10', 081234567890, 'Laki-laki', 'Belum Meminjam'),
('A002', 'Budi', '2019', 'Bandung', '2004-07-15', 082345678901, 'Laki-laki', 'Sudah Meminjam'),
('A003', 'Citra', '2020', 'Surabaya', '2002-06-22', 083456789012, 'Perempuan', 'Belum Meminjam'),
('A004', 'Dewi', '2021', 'Yogyakarta', '2003-11-25', 084567890123, 'Perempuan', 'Sudah Meminjam'),
('A005', 'Eka', '2022', 'Semarang', '2003-09-30', 085678901234, 'Laki-laki', 'Belum Meminjam'),
('A006', 'Agung', '2021', 'Jakarta', '2002-02-08', 084567890123, 'Laki-laki', 'Sudah Meminjam'),
('A007', 'Siti', '2022', 'Surabaya', '2002-01-25', 084567890123, 'Perempuan', 'Sudah Meminjam'),
('A008', 'Bayu', '2021', 'Banyuwangi', '2004-11-20', 084567890123, 'Laki-laki', 'Sudah Meminjam'),
('A009', 'Anton', '2021', 'Mataram', '2003-11-01', 084567890123, 'Laki-laki', 'Sudah Meminjam');



-- Isi tabel peminjaman
SELECT * FROM peminjaman;
INSERT INTO peminjaman VALUES
('PJ001', 'A001', 'PTG001', '2024-03-15', '2024-03-20', 'BK010'),
('PJ002', 'A002', 'PTG002', '2024-03-16', '2024-03-21', 'BK002'),
('PJ003', 'A003', 'PTG003', '2024-03-17', '2024-03-22', 'BK003'),
('PJ004', 'A004', 'PTG004', '2024-03-18', '2024-03-23', 'BK001'),
('PJ005', 'A005', 'PTG005', '2024-03-19', '2024-03-24', 'BK005'),

('PJ006', 'A001', 'PTG002', '2024-03-20', '2024-03-25', 'BK004'),
('PJ007', 'A002', 'PTG003', '2024-03-21', '2024-03-26', 'BK005'),
('PJ008', 'A003', 'PTG004', '2024-03-22', '2024-03-27', 'BK001'),
('PJ009', 'A004', 'PTG005', '2024-03-23', '2024-03-28', 'BK002'),
('PJ010', 'A005', 'PTG001', '2024-03-24', '2024-03-29', 'BK001'),

('PJ011', 'A005', 'PTG005', '2024-03-18', '2024-03-24', 'BK005'),
('PJ012', 'A001', 'PTG002', '2024-03-22', '2024-03-25', 'BK001'),
('PJ013', 'A002', 'PTG003', '2024-03-26', '2024-03-30', 'BK005'),
('PJ014', 'A001', 'PTG004', '2024-03-22', '2024-03-28', 'BK001'),
('PJ015', 'A001', 'PTG005', '2024-03-11', '2024-03-20', 'BK002'),
('PJ016', 'A001', 'PTG001', '2024-03-17', '2024-03-18', 'BK003');


-- Isi tabel pengembalian
SELECT * FROM pengembalian;
INSERT INTO pengembalian VALUES
('PK001', 'A001', 'BK010', 'PTG001', '2024-03-15', '2024-03-20', '0'),
('PK002', 'A002', 'BK002', 'PTG002', '2024-03-16', '2024-03-21', '0'),
('PK003', 'A003', 'BK003', 'PTG003', '2024-03-17', '2024-03-22', '0'),
('PK004', 'A004', 'BK001', 'PTG004', '2024-03-18', '2024-03-23', '0'),
('PK005', 'A005', 'BK005', 'PTG005', '2024-03-19', '2024-03-24', '0'),

('PK006', 'A001', 'BK004', 'PTG002', '2024-03-20', '2024-03-25', '0'),
('PK007', 'A002', 'BK005', 'PTG003', '2024-03-21', '2024-03-26', '0'),
('PK008', 'A003', 'BK001', 'PTG004', '2024-03-22', '2024-03-27', '0'),
('PK009', 'A004', 'BK002', 'PTG005', '2024-03-23', '2024-03-28', '0'),
('PK010', 'A005', 'BK001', 'PTG001', '2024-03-24', '2024-03-29', '0'),

('PK011', 'A005', 'BK005', 'PTG005', '2024-03-18', '2024-03-24', '0'),
('PK012', 'A001', 'BK001', 'PTG005', '2024-03-22', '2024-03-25', '0'),
('PK013', 'A002', 'BK005', 'PTG003', '2024-03-26', '2024-03-30', '0'),
('PK014', 'A001', 'BK001', 'PTG004', '2024-03-22', '2024-03-28', '0'),
('PK015', 'A001', 'BK002', 'PTG005', '2024-03-11', '2024-03-20', '0'),
('PK016', 'A001', 'BK003', 'PTG001', '2024-03-17', '2024-03-18', '0');

-- 1. Definisikan view untuk mendapatkan data anggota yang hanya meminjam buku lebih dari 5 buku
CREATE VIEW anggotapinjambuku AS
SELECT a.idAnggota, a.nama_anggota, COUNT(p.Kode_Peminjaman) AS jumlah_peminjaman
FROM anggota a JOIN peminjaman p ON a.idAnggota = p.idAnggota 
GROUP BY a.idAnggota, a.nama_anggota HAVING COUNT(p.Kode_Peminjaman) > 5;

SELECT * FROM anggotapinjambuku;

-- 2. Definisikan view petugas yang melakukan transaksi (peminjaman/pengembalian) beserta jumlah buku yang terpinjam ketika petugas tersebut bertugas!
CREATE VIEW transaksi AS
SELECT pt.idPetugas, pt.nama AS nama_petugas, 
    COUNT(pm.Kode_Peminjaman) AS jumlah_peminjaman,
    COUNT(pg.kode_kembalian) AS jumlah_pengembalian,
    (SELECT COUNT(*) FROM peminjaman WHERE idPetugas = pt.idPetugas) - 
    (SELECT COUNT(*) FROM pengembalian WHERE idPetugas = pt.idPetugas) AS jumlah_buku_terpinjam
FROM petugas pt
LEFT JOIN peminjaman pm ON pt.idPetugas = pm.idPetugas
LEFT JOIN pengembalian pg ON pt.idPetugas = pg.idPetugas
GROUP BY pt.idPetugas, pt.nama;

SELECT * FROM transaksi;

-- 3. Definisikan view dari tugas praktikum nomor 2 hanya petugas yang melayani transaksi terbanyak

CREATE VIEW pelayananterbanyak AS
SELECT pt.idPetugas, pt.nama AS nama_petugas, 
    COUNT(pm.Kode_Peminjaman) AS jumlah_peminjaman,
    COUNT(pg.kode_kembalian) AS jumlah_pengembalian,
    (SELECT COUNT(*) FROM peminjaman WHERE idPetugas = pt.idPetugas) - 
    (SELECT COUNT(*) FROM pengembalian WHERE idPetugas = pt.idPetugas) AS jumlah_buku_terpinjam
FROM petugas pt
LEFT JOIN peminjaman pm ON pt.idPetugas = pm.idPetugas
LEFT JOIN pengembalian pg ON pt.idPetugas = pg.idPetugas
GROUP BY pt.idPetugas, pt.nama
ORDER BY (COUNT(pm.Kode_Peminjaman) + COUNT(pg.kode_kembalian)) DESC
LIMIT 1; 

SELECT * FROM pelayananterbanyak;

-- 4. Definisikan view buku yang terpinjam paling banyak

CREATE VIEW terbanyak AS
SELECT b.kode_buku, b.judul_buku, b.pengarang_buku, b.penerbit_buku,
    COUNT(p.kode_peminjaman) AS jumlah_peminjaman
FROM buku b LEFT JOIN peminjaman p ON b.kode_buku = p.kode_buku
GROUP BY b.kode_buku, b.judul_buku, b.pengarang_buku, b.penerbit_buku
HAVING COUNT(p.kode_peminjaman) = (
    SELECT MAX(jumlah_peminjaman)
    FROM (
        SELECT COUNT(kode_peminjaman) AS jumlah_peminjaman
        FROM peminjaman
        GROUP BY kode_buku
    ) AS jumlah_pinjam_per_buku
);


SELECT * FROM terbanyak;
