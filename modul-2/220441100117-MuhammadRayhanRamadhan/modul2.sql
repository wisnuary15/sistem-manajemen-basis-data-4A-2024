`vw_buku_dipinjam_banyak`CREATE DATABASE perpustakaan;

USE perpustakaan;

CREATE TABLE petugas(
id_petugas INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
username VARCHAR (15) NOT NULL,
passwod VARCHAR (15) NOT NULL,
nama VARCHAR (25) NOT NULL
);



CREATE TABLE anggota(
id_anggota INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_anggota VARCHAR (15) NOT NULL,
angkatan_anggota INT (5) NOT NULL,
tempat_lahir_anggota VARCHAR (25) NOT NULL,
tgl_lahir_anggota DATE NOT NULL,
no_telp INT (12) NOT NULL,
jenis_kelamin VARCHAR (10) NOT NULL,
status_pinjam VARCHAR (15) NOT NULL
);


CREATE TABLE peminjaman(
kode_peminjaman INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_anggota INT (3) NOT NULL,
id_petugas INT (3) NOT NULL,
kode_buku INT (3) NOT NULL,
tgl_pinjam DATE NOT NULL,
tgl_kembali DATE NOT NULL
);
ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_anggotaa FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);
ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_petugass FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas);
ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_kd_bukuu FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

CREATE TABLE pengembalian(
kode_kembali INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_anggota INT (3) NOT NULL,
id_petugas INT (3) NOT NULL,
tgl_pinjam DATE NOT NULL,
tgl_kembali DATE NOT NULL,
kode_buku INT (3) NOT NULL,
denah VARCHAR (10) NOT NULL
);
ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);
ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_petugas FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas);
ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_kd_buku FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

CREATE TABLE buku(
kode_buku INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
judul_buku varchar (20) NOT NULL,
pengarang_buku VARCHAR (20) NOT NULL,
penerbit_buku VARCHAR (20) NOT NULL,
tahun_buku int (4) not null,
jumlah_buku int (5) not null,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL
);



INSERT INTO anggota (nama_anggota, angkatan_anggota, tempat_lahir_anggota,tgl_lahir_anggota , no_telp, jenis_kelamin, status_pinjam) VALUES
('Hamzah', 2022,'arab','2003-07-01',081276660897,'Pria','meminjam'),
('nanik', 2021,'mesir','2001-07-01',081276660897,'Wanita','meminjam'),
('Heny', 2021,'mesir','2000-07-01',081276660897,'Wanita','meminjam'),
('Sholeh', 2023,'yaman','2004-07-01',081276660897,'Pria','meminjam');


INSERT INTO petugas (username, passwod, nama) VALUES
('doyok1','kucing1','Handoyok'),
('anton2','kucing2','Antoni');

INSERT INTO buku (judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
('sutasuma','rendy','gramedia',2000,3,'ready','sejarah'),
('secangkir kopi','reno','gramedia',2000,3,'ready','mindset'),
('pahlawan bangsa','yono','gramedia',2008,2,'ready','kebangsaan'),
('berdialog dengan tuhan','jafar','gramedia',2022,2,'ready','religi'),
('indah tampa melihat','rony','gramedia',2022,2,'ready','religi'),
('semua ada masanya','gen','gramedia',2001,4,'ready','motivasi');


INSERT INTO peminjaman (id_anggota,id_petugas, kode_buku, tgl_pinjam, tgl_kembali) VALUES
(1,1,1,'2022-10-05','2022-10-09'),
(2,2,2,'2022-10-05','2022-10-12'),
(3,2,3,'2022-10-05','2022-10-13'),
(4,2,1,'2022-10-05','2022-10-13'),
(4,2,2,'2022-10-05','2022-10-13'),
(4,1,4,'2022-10-05','2022-10-13'),
(4,2,5,'2022-10-05','2022-10-13'),
(4,1,6,'2022-10-05','2022-10-13'),
(4,1,6,'2022-10-05','2022-10-13');

DROP TABLE peminjaman;

INSERT INTO pengembalian (id_anggota,id_petugas,tgl_pinjam,tgl_kembali,kode_buku,denah) VALUES
(1,1,'2022-10-05','2022-10-09',1,'rak 1'),
(2,2,'2022-10-05','2022-10-12',2,'rak 2'),
(3,2,'2022-10-05','2022-10-12',3,'rak 2'),
(4,2,'2022-10-05','2022-10-13',4,'rak 3');

CREATE VIEW vw_anggota_peminjam_terbanyak 
AS SELECT a.id_anggota, b.nama_anggota, COUNT(*)AS jml_pinjam 
FROM anggota b JOIN peminjaman a ON b.id_anggota = a.id_anggota
GROUP BY a.id_anggota, b.nama_anggota HAVING COUNT(*)>5;

CREATE VIEW vw_petugas AS SELECT c.id_petugas, c.nama, d.tgl_pinjam, 
COUNT(*)AS jml_transaksi FROM petugas c JOIN peminjaman d ON c.id_petugas = d.id_petugas
GROUP BY c.id_petugas, c.nama;

CREATE VIEW vw_transaksi_banyak AS SELECT e.id_petugas, e.nama, COUNT(f.kode_peminjaman)AS
jml_transaksi FROM petugas e INNER JOIN`peminjaman` peminjaman f ON e.id_petugas = f.id_petugas 
GROUP BY e.id_petugas, e.nama ORDER BY jml_transaksi DESC LIMIT 1;

CREATE VIEW vw_buku_dipinjam_banyak AS SELECT g.kode_buku, g.judul_buku, COUNT(h.kode_peminjaman)AS
jml_pinjam FROM buku g INNER JOIN peminjaman h ON g.kode_buku = h.kode_buku 
GROUP BY g.kode_buku, g.judul_buku ORDER BY jml_pinjam DESC LIMIT 1;