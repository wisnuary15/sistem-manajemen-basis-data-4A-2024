
-- Tugas Praktikum 02
CREATE DATABASE IF NOT EXISTS db_perpustakaan;

USE db_perpustakaan;

-- Membuat tabel peminjaman
CREATE TABLE IF NOT EXISTS peminjaman (
    Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR(10),
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

-- Membuat tabel petugas
CREATE TABLE IF NOT EXISTS petugas (
    IdPetugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15),
    Password VARCHAR(15),
    Nama VARCHAR(25)
);

-- Membuat tabel buku
CREATE TABLE IF NOT EXISTS buku (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(25),
    Pengarang_Buku VARCHAR(30),
    Penerbit_Buku VARCHAR(30),
    Tahun_Buku VARCHAR(10),
    Jumlah_Buku VARCHAR(5),
    Status_Buku VARCHAR(10),
    Klasifikasi_Buku VARCHAR(20)
);

-- Membuat tabel anggota
CREATE TABLE IF NOT EXISTS anggota (
    IdAnggota VARCHAR(10) PRIMARY KEY,
    Nama_Anggota VARCHAR(20),
    Angkatan_Anggota VARCHAR(6),
    Tempat_Lahir_Anggota VARCHAR(20),
    Tanggal_Lahir_Anggota DATE,
    No_Telp INT(12),
    Jenis_Kelamin VARCHAR(15),
    Status_Pinjam VARCHAR(15)
);

-- Membuat tabel pengembalian
CREATE TABLE IF NOT EXISTS pengembalian (
    Kode_Kembali VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    Kode_Buku VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tgl_Pinjam DATE,
    Tgl_Kembali DATE,
    Denda VARCHAR(15),
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas)
);

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES
('A001', 'John Doe', '2019', 'Jakarta', '1998-05-15', 123456789, 'Laki-laki', 'Aktif'),
('A002', 'Jane Smith', '2020', 'Surabaya', '1999-08-20', 987654321, 'Perempuan', 'Aktif'),
('A003', 'Michael Johnson', '2018', 'Bandung', '1997-03-10', 555555555, 'Laki-laki', 'Aktif'),
('A004', 'Emily Brown', '2021', 'Yogyakarta', '2000-11-25', 111111111, 'Perempuan', 'Aktif'),
('A005', 'Daniel Lee', '2017', 'Medan', '1996-09-05', 999999999, 'Laki-laki', 'Aktif');

INSERT INTO petugas (IdPetugas, Username, Password, Nama)
VALUES
('P001', 'petugas1', 'password1', 'Peter Parker'),
('P002', 'petugas2', 'password2', 'Mary Jane'),
('P003', 'petugas3', 'password3', 'Tony Stark'),
('P004', 'petugas4', 'password4', 'Natasha Romanoff'),
('P005', 'petugas5', 'password5', 'Steve Rogers');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES
('B001', 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Bloomsbury Publishing', '1997', '10', 'Available', 'Fantasy'),
('B002', 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', '8', 'Available', 'Fiction'),
('B003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons', '1925', '6', 'Available', 'Fiction'),
('B004', '1984', 'George Orwell', 'Secker & Warburg', '1949', '12', 'Available', 'Science Fiction'),
('B005', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '15', 'Available', 'Romance');
INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES
('PJ001', 'A001', 'P001', '2024-03-01', '2024-03-10', 'B001'),
('PJ002', 'A002', 'P002', '2024-03-02', '2024-03-12', 'B002'),
('PJ003', 'A003', 'P003', '2024-03-03', '2024-03-14', 'B003'),
('PJ004', 'A004', 'P004', '2024-03-04', '2024-03-16', 'B004'),
('PJ005', 'A005', 'P005', '2024-03-05', '2024-03-18', 'B005');
INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES('PJ006', 'A001', 'P001', '2024-03-29', '2024-04-10', 'B001'),
('PJ007', 'A001', 'P001', '2024-03-29', '2024-04-12', 'B002'),
('PJ008', 'A001', 'P001', '2024-03-29', '2024-04-14', 'B003'),
('PJ009', 'A001', 'P001', '2024-04-29', '2024-04-16', 'B004'),
('PJ010', 'A001', 'P001', '2024-04-29', '2024-04-18', 'B005');

INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda)
VALUES
('PK001', 'A001', 'B001', 'P001', '2024-03-01', '2024-03-10', '0'),
('PK002', 'A002', 'B002', 'P002', '2024-03-02', '2024-03-12', '0'),
('PK003', 'A003', 'B003', 'P003', '2024-03-03', '2024-03-14', '0'),
('PK004', 'A004', 'B004', 'P004', '2024-03-04', '2024-03-16', '0'),
('PK005', 'A005', 'B005', 'P005', '2024-03-05', '2024-03-18', '0');

SELECT * FROM anggota;
SELECT * FROM petugas;
SELECT * FROM buku;
SELECT * FROM peminjaman;
SELECT * FROM pengembalian;

-- Soal 1
CREATE VIEW view_tugas1 AS
SELECT a.IdAnggota, a.Nama_Anggota, COUNT(p.Kode_Peminjaman) AS Jumlah_Peminjaman
FROM anggota a
JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
GROUP BY a.IdAnggota, a.Nama_Anggota
HAVING Jumlah_Peminjaman > 5;
SELECT*FROM view_tugas1;

--Soal 2
CREATE VIEW view_tugas2 AS
SELECT pt.IdPetugas, pt.Nama, COUNT(pj.Kode_Peminjaman) AS Jumlah_Peminjaman
FROM petugas pt
JOIN peminjaman pj ON pt.IdPetugas = pj.IdPetugas
JOIN pengembalian pk ON pt.IdPetugas = pk.IdPetugas
GROUP BY pt.IdPetugas, pt.Nama;
SELECT*FROM view_tugas2;

--Soal 3
CREATE VIEW view_tugas3 AS
SELECT nama, MAX(jumlah_peminjaman) from view_tugas2;
SELECT*FROM view_tugas3;

--Soal 4
CREATE VIEW jumlah_buku_dipinjam AS
SELECT buku.judul_buku, COUNT(peminjaman.kode_buku) AS Jumlah_Buku_Dipinjam
FROM buku 
JOIN peminjaman ON buku.kode_buku = peminjaman.kode_buku
GROUP BY peminjaman.kode_buku;
SELECT*FROM jumlah_buku_dipinjam;

CREATE VIEW view_tugas4 AS
SELECT judul_buku, MAX(jumlah_buku_dipinjam) FROM jumlah_buku_dipinjam;
SELECT*FROM view_tugas4;