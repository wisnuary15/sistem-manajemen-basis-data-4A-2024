CREATE DATABASE perpustakaan;

USE perpustakaan;

CREATE TABLE petugas (
IdPetugas VARCHAR(10) NOT NULL PRIMARY KEY,
Username VARCHAR(15),
PASSWORD VARCHAR(15),
Nama VARCHAR(25)
);

CREATE TABLE buku (
Kode_Buku VARCHAR(10)NOT NULL PRIMARY KEY,
Judul_Buku VARCHAR(25),
Pengarang_Buku VARCHAR(30),
Penerbit_Buku VARCHAR(30),
Tahun_Buku VARCHAR(10),
Jumlah_Buku VARCHAR(5),
Status_Buku VARCHAR(10),
Klasifikasi_Buku VARCHAR(20)
);

CREATE TABLE anggota (
IdAnggota VARCHAR(10) NOT NULL PRIMARY KEY,
Nama_Anggota VARCHAR(20),
Angkatan_Anggota VARCHAR(6),
Tempat_Lahir_Anggota VARCHAR(20),
Tanggal_Lahir_Anggota DATE,
No_Telp INT(12),
Jenis_Kelamin VARCHAR(15),
Status_Pinjam VARCHAR(15)
);

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
    IdAnggota VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR(10),
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

CREATE TABLE pengembalaian (
Kode_Kembali VARCHAR(10) NOT NULL PRIMARY KEY,
IdAnggota VARCHAR(10),
Kode_Buku VARCHAR(10),
IdPetugas VARCHAR(10),
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Denda VARCHAR(15),
FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama) VALUE 
("P001", "pustakawan1", "password1", "Budi"),
("P002", "pustakawan2", "password2", "Ani"),
("P003", "pustakawan3", "password3", "Cici");

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES ('B001', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 2005, 10, 'Tersedia', 'Fiksi'),
       ('B002', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', 2009, 5, 'Dipinjam', 'Fiksi'),
       ('B003', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', 2006, 7, 'Tersedia', 'Fiksi');
       
INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin)
VALUES ('A001', 'Anton', "2022", 'Surabaya', '2002-01-01', '08123456789', 'Laki-laki'),
       ('A002', 'Bella', "2023", 'Jakarta', '2003-02-02', '08234567890', 'Perempuan'),
       ('A003', 'Candra', "2024", 'Bandung', '2004-03-03', '08345678901', 'Laki-laki');

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Kode_Buku)
VALUES ('P001', 'A001', 'P001', "2024-04-01", 'B001'),
       ('P002', 'A002', 'P002', "2024-04-02", 'B002'),
       ('P003', 'A003', 'P003', "2024-04-03", 'B003'),
       ('P004', 'A001', 'P001', "2024-04-01", 'B002');
       
INSERT INTO pengembalaian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda)
VALUES ('K001', 'A001', 'B001', 'P001', '2024-04-01', '2024-04-07', 0),
       ('K002', 'A002', 'B002', 'P002', '2024-04-02', '2024-04-08', 0),
       ('K003', 'A003', 'B003', 'P003', '2024-04-03', '2024-04-09', 0);

CREATE VIEW dta_anggota AS
SELECT a.Nama_Anggota, a.Angkatan_Anggota, a.Tempat_Lahir_Anggota, a.Tanggal_Lahir_Anggota, a.No_Telp,
       a.Jenis_Kelamin, COUNT(*) AS Jumlah_Buku
FROM anggota a JOIN peminjaman b ON a.IdAnggota = b.IdAnggota 
GROUP BY a.IdAnggota
HAVING COUNT(*) > 5;

CREATE VIEW trs_petugas AS
SELECT b.Nama, COUNT(*) AS trs_peminjaman
FROM peminjaman a JOIN petugas b ON a.IdPetugas = b.IdPetugas 
GROUP BY b.IdPetugas;

CREATE VIEW trs_banyak_petugas AS
SELECT *
FROM trs_petugas
ORDER BY trs_peminjaman DESC
LIMIT 1;

CREATE VIEW ord_buku AS
SELECT a.Judul_Buku, COUNT(*) AS terpinjam 
FROM buku a JOIN peminjaman b ON a.Kode_Buku = b.Kode_buku 
GROUP BY b.Kode_Buku 
ORDER BY terpinjam DESC
LIMIT 1;


SELECT * FROM dta_anggota;
SELECT * FROM trs_petugas;
SELECT * FROM trs_banyak_petugas;
SELECT * FROM ord_buku;