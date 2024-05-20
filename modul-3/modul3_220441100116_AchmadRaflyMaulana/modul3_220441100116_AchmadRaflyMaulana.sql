CREATE DATABASE perpustakaan1;

USE perpustakaan1;

CREATE TABLE IF NOT EXISTS petugas(
id_petugas INT(10) PRIMARY KEY NOT NULL,
username VARCHAR(15) NOT NULL,
pass VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

INSERT INTO petugas VALUES 
(201,'agung12', 'ag123', 'agung'),
(202,'zaki12', 'za23', 'zaki'),
(203,'indra12', 'in55', 'indra'),
(204,'rafly12', 'ra88', 'rafly'),
(205,'robi2', 'ro22', 'robi'),
(206,'hengky12', 'he22', 'hengky'),
(207,'putro12', 'pu13', 'putro'),
(208,'farid12', 'fa23', 'farid');

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

INSERT INTO buku VALUES
(301,'Laskar Pelangi', 'Andrea Hirata', 'Bintang Pustaka', '2015', '30', 'baru', 'baik'),
(302,'Negeri 5 Menara', 'Ahmad Fuadi', 'Pt. Gramedia Pustaka Utama', '2009', '20', 'baru', 'baik'),
(303,'Koala Kamal', 'Raditya Dika', 'Gagas Media', '2015', '10', 'baru', 'baik'),
(304,'Promise', 'Dwitasari', 'Loveable', '2018', '30', 'baru', 'baik'),
(305,'Perahu Kertas', 'Dewi Lestari', 'Bentang Pustaka', '2018', '10', 'baru', 'baik'),
(306,'London Love Story', 'Tisa TS', 'Loveable', '2015', '10', 'baru', 'baik'),
(307,'Dear Nathan', 'Erisca Febrianti', 'Pastel Books', '2019', '30', 'baru', 'baik'),
(308,'Sang Mimpi', 'Andrea Hirata', 'Bintang Pustaka', '2019', '25', 'baru', 'baik');

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

INSERT INTO anggota VALUES
(101,'Birrur', '2022', 'Gresik', '2003-10-16', '085850080589', 'laki-laki', 'Pinjam'),
(102,'Shafira', '2022', 'Gresik', '2003-05-23', '085877890589', 'Perempuan', 'Pinjam'),
(103,'Farra', '2019', 'Gresik', '2003-01-06', '085856519589', 'Perempuan', 'Pinjam'),
(104,'Akmal', '2021', 'Kediri', '2003-06-04', '085823410589', 'laki-laki', 'Pinjam'),
(105,'Dani', '2022', 'Lamongan', '2003-10-31', '085859862589', 'laki-laki', 'Pinjam'),
(106,'Fiqi', '2020', 'Bangkalan', '2004-01-03', '085850029759', 'laki-laki', 'Pinjam');

CREATE TABLE IF NOT EXISTS pengembalian(
kode_kembali INT(10) NOT NULL PRIMARY KEY,
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

INSERT INTO pengembalian VALUES
('401', '103','301','206', '2023-10-10', '2023-10-22', '10.000'),
('402', '101','301','207', '2023-10-16', '2023-10-25', '0'),
('403', '105','301','206', '2023-11-23', '2023-11-29', '0'),
('404', '105','303','204', '2023-11-28', '2023-11-03', '0'),
('405', '105','308','203', '2023-12-02', '2023-12-10', '0'),
('406', '101','306','206', '2023-12-05', '2023-12-15', '0'),
('407', '105','302','206', '2024-01-06', '2024-01-13', '0'),
('408', '105','306','202', '2024-01-09', '2024-01-15', '0'),
('409', '102','301','201', '2024-02-10', '2024-02-19', '0'),
('410', '105','305','206', '2024-02-17', '2024-02-15', '0'),
('411', '104','307','208', '2024-03-03', '2024-03-12', '0');

CREATE TABLE IF NOT EXISTS peminjaman(
kode_peminjaman INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku INT(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

INSERT INTO peminjaman VALUES
('501', '103', '206', '2023-10-10', '2023-10-22', '301'),
('502', '101', '207', '2023-10-16', '2023-10-25', '301'),
('503', '105', '206', '2023-11-23', '2023-11-29', '301'),
('504', '105', '204', '2023-11-28', '2023-11-03', '303'),
('505', '105', '203', '2023-12-02', '2023-12-10', '308'),
('506', '101', '206', '2023-12-05', '2023-12-15', '306'),
('507', '105', '206', '2024-01-06', '2024-01-13', '302'),
('508', '105', '202', '2024-01-09', '2024-01-15', '306'),
('509', '102', '201', '2024-02-10', '2024-02-19', '301'),
('510', '105', '206', '2024-02-17', '2024-02-15', '305'),
('511', '104', '208', '2024-03-03', '2024-03-12', '307');


DELIMITER //
CREATE PROCEDURE tampilkan_buku_dengan_judul(
    IN judul VARCHAR(25)
)
BEGIN
    SELECT * FROM buku WHERE judul_buku = judul;
END //
DELIMITER ;

CALL tampilkan_buku_dengan_judul('Laskar Pelangi');

DELIMITER //
CREATE PROCEDURE tampilkan_nama_anggota_dan_angkatan(
    IN nama_anggota VARCHAR(20),
    IN angkatan_anggota VARCHAR(6)
)
BEGIN
    SELECT * FROM anggota WHERE nama_anggota = nama_anggota AND angkatan_anggota = angkatan_anggota;
END //
DELIMITER ;

CALL tampilkan_nama_anggota_dan_angkatan('Birrur', '2022');

DELIMITER //
CREATE PROCEDURE tampilkan_buku_dengan_judul_pengarang_tahun(
    IN judul VARCHAR(25),
    IN pengarang VARCHAR(30),
    IN tahun VARCHAR(10)
)
BEGIN
    SELECT * FROM buku WHERE judul_buku = judul AND pengarang_buku = pengarang AND tahun_buku = tahun;
END //
DELIMITER ;

CALL tampilkan_buku_dengan_judul_pengarang_tahun('Laskar Pelangi', 'Andrea Hirata', '2015');

DELIMITER //
CREATE PROCEDURE tambah_petugas(
    IN id_petugas_param INT(10),
    IN username_param VARCHAR(15),
    IN pass_param VARCHAR(15),
    IN nama_param VARCHAR(25)
)
BEGIN
    INSERT INTO petugas (id_petugas, username, pass, nama) VALUES (id_petugas_param, username_param, pass_param, nama_param);
END //
DELIMITER ;

CALL tambah_petugas(209, 'rudi12', 'ru22', 'rudi');
SELECT * FROM petugas;

DELIMITER //
CREATE PROCEDURE get_petugas_by_id(
    IN id_petugas_param INT(10),
    OUT username_out VARCHAR(15),
    OUT pass_out VARCHAR(15),
    OUT nama_out VARCHAR(25)
)
BEGIN
    SELECT username, pass, nama INTO username_out, pass_out, nama_out
    FROM petugas
    WHERE id_petugas = id_petugas_param;
END //
DELIMITER ;

CALL get_petugas_by_id(201, @username, @pass, @nama);
SELECT @username, @pass, @nama;

DELIMITER //
CREATE PROCEDURE get_buku_by_id(
    INOUT kode_buku_param INT(10)
)
BEGIN
    SELECT judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku
    INTO @judul, @pengarang, @penerbit, @tahun, @jumlah, @status, @klasifikasi
    FROM buku
    WHERE kode_buku = kode_buku_param;

    SET kode_buku_param = @kode_buku;
END //
DELIMITER ;

SET @kode_buku = 301;
CALL get_buku_by_id(@kode_buku);
SELECT @kode_buku, @judul, @pengarang, @penerbit, @tahun, @jumlah, @status, @klasifikasi;


