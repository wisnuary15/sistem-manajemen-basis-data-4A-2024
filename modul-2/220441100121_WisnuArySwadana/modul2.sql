CREATE DATABASE Modul2;
USE Modul2;

CREATE TABLE IF NOT EXISTS buku (
Kode_Buku INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT,
Judul_Buku VARCHAR(25)NOT NULL,
Pengarang_Buku VARCHAR(30)NOT NULL,
Penerbit_Buku VARCHAR(30)NOT NULL,
Tahun_Buku VARCHAR(5)NOT NULL,
Jumlah_Buku VARCHAR(5)NOT NULL,
Status_Buku VARCHAR(10)NOT NULL,
Klasifikasi_Buku VARCHAR(20)NOT NULL
);

CREATE TABLE IF NOT EXISTS petugas(
IdPetugas INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT,
Username VARCHAR(15)NOT NULL,
Pasword VARCHAR(15)NOT NULL,
Nama VARCHAR(25)NOT NULL
);

CREATE TABLE IF NOT EXISTS anggota(
IdAnggota INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nama_Anggota VARCHAR(20)NOT NULL,
Anggkatan_Anggota VARCHAR(6)NOT NULL,
Tempat_Lahir_Anggota VARCHAR(20)NOT NULL,
Tanggal_Lahir_Anggota DATE NOT NULL,
No_Telp INT(12)NOT NULL,
Jenis_Kelamin VARCHAR(15)NOT NULL,
Status_Pinjam VARCHAR(15)NOT NULL
);

CREATE TABLE IF NOT EXISTS peminjaman(
    Kode_Peminjaman INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IdAnggota INT(10) NOT NULL,
    IdPetugas INT(10) NOT NULL,
    Tanggal_Pinjam TIMESTAMP DEFAULT NOW(),
    Tanggal_Kembali TIMESTAMP DEFAULT NOW(),
    Kode_Buku INT(10) NOT NULL,
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

CREATE TABLE IF NOT EXISTS pengembalian(
    Kode_Kembali INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IdAnggota INT(10) NOT NULL,
    Kode_Buku INT(10) NOT NULL,
    IdPetugas INT(10) NOT NULL,
    Tgl_Pinjam TIMESTAMP DEFAULT NOW(),
    Tgl_Kembali TIMESTAMP DEFAULT NOW(),
    Denda VARCHAR(15) NOT NULL,
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas)
);

INSERT INTO buku (Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) 
VALUES 
('Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Bloomsbury Publishing', '1997', '100', 'Available', 'Fantasy'),
('To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', '75', 'Available', 'Fiction'),
('1984', 'George Orwell', 'Secker & Warburg', '1949', '50', 'Available', 'Dystopian'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons', '1925', '60', 'Available', 'Classic'),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '45', 'Available', 'Fiction');

INSERT INTO petugas (Username, Pasword, Nama) 
VALUES 
('petugas1', 'password1', 'John Doe'),
('petugas2', 'password2', 'Jane Smith'),
('petugas3', 'password3', 'Michael Johnson'),
('petugas4', 'password4', 'Emily Brown'),
('petugas5', 'password5', 'David Wilson');

INSERT INTO anggota (Nama_Anggota, Anggkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) 
VALUES 
('Alice Johnson', '2019', 'New York', '2001-05-15', '1234567890', 'Female', 'Active'),
('Bob Smith', '2020', 'Los Angeles', '2002-03-20', '9876543210', 'Male', 'Active'),
('Charlie Brown', '2018', 'Chicago', '2000-11-10', '5555555555', 'Male', 'Active'),
('Diana Wilson', '2021', 'Houston', '2003-07-25', '7777777777', 'Female', 'Active'),
('Eva Taylor', '2017', 'Miami', '1999-09-05', '9999999999', 'Female', 'Active'),
('Felix Hernandez', '2023', 'Seattle', '2001-08-05', '1234567890', 'Male', 'Active'),
('Grace Martinez', '2022', 'Los Angeles', '2002-06-10', '9876543210', 'Female', 'Active');

INSERT INTO peminjaman (IdAnggota, IdPetugas, Kode_Buku, Tanggal_Pinjam, Tanggal_Kembali) 
VALUES 
(1, 1, 1, NOW(), NOW() + INTERVAL 7 DAY),  
(2, 2, 2, NOW(), NOW() + INTERVAL 7 DAY), 
(3, 3, 3, NOW(), NOW() + INTERVAL 7 DAY),
(6, 1, 1, NOW(), NOW() + INTERVAL 7 DAY),
(6, 2, 2, NOW(), NOW() + INTERVAL 7 DAY),
(6, 3, 3, NOW(), NOW() + INTERVAL 7 DAY),
(6, 4, 4, NOW(), NOW() + INTERVAL 7 DAY),
(6, 5, 5, NOW(), NOW() + INTERVAL 7 DAY),
(6, 1, 1, NOW(), NOW() + INTERVAL 7 DAY),
(6, 2, 2, NOW(), NOW() + INTERVAL 7 DAY),
(6, 3, 3, NOW(), NOW() + INTERVAL 7 DAY),
(6, 4, 4, NOW(), NOW() + INTERVAL 7 DAY),
(6, 5, 5, NOW(), NOW() + INTERVAL 7 DAY);  

INSERT INTO pengembalian (IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) 
VALUES 
(1, 1, 1, NOW(), NOW() + INTERVAL 7 DAY, '0'), 
(2, 2, 2, NOW(), NOW() + INTERVAL 7 DAY, '0'),  
(3, 3, 3, NOW(), NOW() + INTERVAL 7 DAY, '0');  


CREATE VIEW Anggota_Lebih_5_Buku AS
SELECT a.IdAnggota, a.Nama_Anggota, COUNT(p.Kode_Peminjaman) AS Jumlah_Peminjaman
FROM anggota a
LEFT JOIN peminjaman p ON a.IdAnggota = p.IdAnggota
GROUP BY a.IdAnggota
HAVING COUNT(p.Kode_Peminjaman) > 5;

SELECT * FROM Anggota_Lebih_5_Buku;



DROP VIEW Transaksi_Petugas;

CREATE VIEW Transaksi_Petugas AS
SELECT 
    pt.IdPetugas,
    pt.Nama AS Nama_Petugas,
    COUNT(DISTINCT p.Kode_Peminjaman) AS Jumlah_Peminjaman,
    COUNT(DISTINCT pg.Kode_Kembali) AS Jumlah_Pengembalian
FROM 
    petugas pt
LEFT JOIN 
    peminjaman p ON pt.IdPetugas = p.IdPetugas
LEFT JOIN 
    pengembalian pg ON pt.IdPetugas = pg.IdPetugas
GROUP BY 
    pt.IdPetugas, pt.Nama;


SELECT * FROM Transaksi_Petugas;



CREATE VIEW Petugas_Teratas AS
SELECT 
    pt.IdPetugas,
    pt.Nama AS Nama_Petugas,
    COUNT(DISTINCT p.Kode_Peminjaman) AS Jumlah_Peminjaman,
    COUNT(DISTINCT pg.Kode_Kembali) AS Jumlah_Pengembalian,
    COUNT(DISTINCT p.Kode_Peminjaman) + COUNT(DISTINCT pg.Kode_Kembali) AS Total_Transaksi
FROM 
    petugas pt
LEFT JOIN 
    peminjaman p ON pt.IdPetugas = p.IdPetugas
LEFT JOIN 
    pengembalian pg ON pt.IdPetugas = pg.IdPetugas
GROUP BY 
    pt.IdPetugas
ORDER BY 
    Total_Transaksi DESC
LIMIT 1;

SELECT * FROM Petugas_Teratas;



CREATE VIEW Buku_Terpinjam_Terbanyak AS
SELECT 
    b.Kode_Buku,
    b.Judul_Buku,
    COUNT(p.Kode_Peminjaman) AS Jumlah_Peminjaman
FROM 
    buku b
LEFT JOIN 
    peminjaman p ON b.Kode_Buku = p.Kode_Buku
GROUP BY 
    b.Kode_Buku,
    b.Judul_Buku
ORDER BY 
    Jumlah_Peminjaman DESC
LIMIT 1;

SELECT * FROM Buku_Terpinjam_Terbanyak;