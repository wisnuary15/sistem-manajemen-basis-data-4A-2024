CREATE DATABASE perpustakaan;

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
judul_buku VARCHAR (20) NOT NULL,
pengarang_buku VARCHAR (20) NOT NULL,
penerbit_buku VARCHAR (20) NOT NULL,
tahun_buku INT (4) NOT NULL,
jumlah_buku INT (5) NOT NULL,
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



INSERT INTO pengembalian (id_anggota,id_petugas,tgl_pinjam,tgl_kembali,kode_buku,denah) VALUES
(1,1,'2022-10-05','2022-10-09',1,'rak 1'),
(2,2,'2022-10-05','2022-10-12',2,'rak 2'),
(3,2,'2022-10-05','2022-10-12',3,'rak 2'),
(4,2,'2022-10-05','2022-10-13',4,'rak 3');



-- Praktikum3

-- soal2
DELIMITER //
CREATE PROCEDURE getPtgs(IN nama_ptgs VARCHAR (25))
BEGIN
SELECT * FROM petugas WHERE nama = nama_ptgs;
END //
DELIMITER ;
CALL getPtgs('Handoyok');

-- soal3
DELIMITER //
CREATE PROCEDURE getAgt(
IN nama_Agt VARCHAR (15),
IN angkatan_Agt INT (5)
)
BEGIN
SELECT * FROM anggota WHERE nama_anggota = nama_Agt AND angkatan_anggota = angkatan_Agt;
END //
DELIMITER ;
CALL getAgt('Hamzah', 2022);

DROP PROCEDURE insertToptgs;

-- Soal4
DELIMITER //
CREATE PROCEDURE getbk(
IN judul_bk VARCHAR (20),
IN pengarang_bk VARCHAR (20),
IN penerbit_bk VARCHAR (20)
)
BEGIN
SELECT * FROM buku WHERE judul_buku = judul_bk AND pengarang_buku = pengarang_bk AND penerbit_buku = penerbit_bk;
END //
DELIMITER ;
CALL getbk('sutasuma', 'rendy', 'gramedia');

-- Soal5
DELIMITER //
CREATE PROCEDURE insertToptgs(
    id_ptgs INT(3),
    username_ptgs VARCHAR(15),
    passwod_ptgs VARCHAR(15),
    nama_ptgs VARCHAR(25)
) 
BEGIN
    INSERT INTO petugas
    VALUES (id_ptgs, username_ptgs, passwod_ptgs, nama_ptgs);
END //
DELIMITER ;

CALL insertToptgs(NULL, 'Rojali1', 'kucing3', 'Rojali');
SELECT*FROM petugas;

-- Soal6
DELIMITER //
CREATE PROCEDURE banyakBk(
	OUT banyakBukuPerpus INT
)
BEGIN
	SELECT COUNT(*) INTO banyakBukuPerpus FROM buku;
END //
DELIMITER ;

CALL banyakBk(@banyakBukuPerpus);
SELECT @banyakBukuPerpus;
