CREATE DATABASE IF NOT EXISTS modul3;

USE modul3;

CREATE TABLE IF NOT EXISTS anggota (
id_anggota VARCHAR(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL, 
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL  
);

CREATE TABLE IF NOT EXISTS petugas (
id_petugas VARCHAR(10) NOT NULL PRIMARY KEY,
username VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS  buku (
kode_buku VARCHAR(10) NOT NULL PRIMARY KEY ,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL,
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL
);

CREATE TABLE IF NOT EXISTS peminjaman (
kode_peminjaman VARCHAR (10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR (10) NOT NULL,
id_petugas VARCHAR (10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku)
);

CREATE TABLE IF NOT EXISTS pengembalian (
kode_kembali VARCHAR (10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR (10) NOT NULL,
kode_buku VARCHAR (10) NOT NULL,
id_petugas VARCHAR (10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR (15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

SHOW TABLES;


INSERT INTO anggota VALUES 
('A001','Tomo','23','Jakarta','2004-06-22',085211112222,'Laki-Laki','Pinjam'),
('A002','Siska','20','Surabaya','2002-03-15',085233334444,'Perempuan','Pinjam'),
('A003','Budi','20','Bandung','2001-11-08',085255556666,'Laki-Laki','Kembali'),
('A004','Dewi','21','Yogyakarta','2002-09-30',085277778888,'Perempuan','Pinjam'),
('A005','Hadi','22','Gresik','2003-07-12',085299990000,'Laki-Laki','Kembali'),
('A006','Rina','24','Lamongan','2005-05-24',085211112233,'Perempuan','Pinjam'),
('A007','Adi','19','Bandung','2001-01-18',085211112244,'Laki-Laki','Pinjam'),
('A008','Lina','18','Jombang','2000-08-03',085211112255,'Perempuan','Kembali'),
('A009','Andi','22','Bojonegoro','2004-04-06',085211112266,'Laki-Laki','Pinjam'),
('A010','Rani','23','Sidoarjo','2004-12-29',085211112277,'Perempuan','Kembali');
SELECT * FROM anggota;

INSERT INTO buku VALUES 
('B001','Pulang','Tereliye','2017','9','Tersedia','Fiksi'),
('B002','Matahari','Tereliye','2019','8','Tersedia','Fantasi'),
('B003','Senja','Biru','2018','7','Tersedia','Romantis'),
('B004','Pelangi','Jompi','2020','6','Tersedia','Anak-anak'),
('B005','Cahaya','Sukarso','2016','5','Tersedia','Pendidikan'),
('B006','Bulan','Tereliye','2015','4','Tersedia','Fiksi'),
('B007','Mimpi','Dono','2021','3','Tersedia','Komedi'),
('B008','Harapan','Pidie Baiq','2014','2','Tersedia','Drama'),
('B009','Bintang','Tereliye','2023','1','Tersedia','Misteri'),
('B010','Menara','Joko','2022','3','Tersedia','Sastra');
SELECT * FROM buku;

INSERT INTO petugas VALUES 
('P001','Jay12','Jy01','Jayadi'),
('P002','Lia34','Li02','Liana'),
('P003','Dan45','Da03','Dandi'),
('P004','Ria56','Ri04','Riana'),
('P005','Yan67','Ya05','Yani'),
('P006','Rio78','Ro06','Rio'),
('P007','Fitri89','Fi07','Fitria'),
('P008','Anto90','An08','Anton'),
('P009','Sari01','Sa09','Sarita'),
('P010','Dian12','Di10','Diana');
SELECT * FROM petugas;

INSERT INTO peminjaman VALUES 
('PM001','A004','P004','2024-01-25','2024-02-03','B001'),
('PM002','A001','P005','2024-03-12','2024-03-20','B009'),
('PM003','A006','P003','2024-01-05','2024-02-15','B006'),
('PM004','A009','P007','2024-01-21','2024-01-29','B004'),
('PM005','A008','P008','2024-02-10','2024-02-18','B003'),
('PM006','A003','P003','2024-02-03','2024-02-11','B008'),
('PM007','A005','P010','2024-01-15','2024-03-23','B010'),
('PM008','A002','P001','2024-02-02','2024-03-10','B007'),
('PM009','A010','P002','2024-03-19','2024-03-27','B005'),
('PM010','A007','P003','2024-01-07','2024-02-15','B002'),
('PM011','A005','P005','2024-01-19','2024-02-04', 'B008'),
('PM012','A005','P005','2024-01-23','2024-02-07', 'B003'),
('PM013','A005','P003','2024-01-31','2024-02-14', 'B001'),
('PM014','A005','P003','2024-01-31','2024-02-12', 'B009');
SELECT * FROM peminjaman;

INSERT INTO peminjaman VALUES 
('PM015','A005','P002','2024-02-17','2024-02-22','B010');

UPDATE peminjaman SET kode_buku = 'B002' WHERE kode_peminjaman = 'PM015'; 
UPDATE peminjaman SET kode_buku = 'B002' WHERE kode_peminjaman = 'PM012'; 

INSERT INTO pengembalian VALUES 
('PG001','A009','B004','P007','2024-01-21','2024-01-29','Rp.0'),
('PG002','A001','B009','P002','2024-03-12','2024-03-20','Rp.0'),
('PG003','A006','B006','P003','2024-01-05','2024-03-15','Rp.30000');



-- Buat Bikin


-- Nomor 1

DELIMITER //
CREATE PROCEDURE getDefault ( 
		IN nomor_pinjam VARCHAR (100),
		IN nomor_anggota VARCHAR (100),
		IN nomor_petugas VARCHAR (100),
		IN tanggal_peminjaman DATE,
		IN tanggal_pengembalian DATE,
		IN nomor_buku VARCHAR (100)
)
BEGIN 
	    SELECT * FROM peminjaman WHERE 
	    kode_peminjaman = nomor_pinjam AND 
	    id_anggota = nomor_anggota AND
	    id_petugas = nomor_petugas AND
	    tanggal_pinjam = tanggal_peminjaman AND
	    tanggal_kembali = tanggal_pengembalian AND
	    kode_buku = nomor_buku;
END //
DELIMITER;

CALL getDefault('PM015','A005','P002','2024-02-17','2024-02-22','B002');

-- Nomor 2
DELIMITER //
CREATE PROCEDURE getOne (IN nama_member VARCHAR (100))
BEGIN 
	SELECT * FROM anggota WHERE nama_anggota = nama_member;
END //
DELIMITER;

DROP PROCEDURE getOne;


CALL getOne('Tomo');

-- Nomor 3 

DELIMITER //
CREATE PROCEDURE getTwo (
	IN nomor_buku VARCHAR (100),
	IN nama_penulis VARCHAR (100)
)
BEGIN 
	SELECT * FROM buku WHERE
	kode_buku = nomor_buku AND
	pengarang_buku = nama_penulis;
END //
DELIMITER;


CALL getTwo ('B001','Tereliye');

-- Nomor 4

DELIMITER //
CREATE PROCEDURE getThree (
	IN nomor_petugas VARCHAR (100),
	IN nama_user VARCHAR (100),
	IN nama_petugas VARCHAR (100)
	)
BEGIN 
	SELECT * FROM petugas WHERE
	id_petugas = nomor_petugas AND
	username = nama_user AND
	nama = nama_petugas;
END //
DELIMITER //

CALL getThree ('P008','Anto90','Anton')

-- Nomor 5
DELIMITER //
CREATE PROCEDURE getInsert (
    IN nomor_petugas VARCHAR(100),
    IN nama_user VARCHAR(100),
    IN kata_sandi VARCHAR(100),
    IN nama_petugas VARCHAR(100)
)
BEGIN 
	INSERT INTO petugas 
	VALUES (nomor_petugas, nama_user, kata_sandi, nama_petugas);
 END //
DELIMITER;
SELECT * FROM petugas;
CALL getInsert ('P011','Rus12','Rus10','Rusdi');

DROP PROCEDURE getInsert;

-- Nomor 6
DELIMITER //
CREATE PROCEDURE getOut ( OUT jumlah_buku INT (10))
BEGIN 
	SELECT COUNT(*)INTO jumlah_buku FROM peminjaman;
END //
DELIMITER;

CALL getOut(@jumlah_buku)
SELECT @jumlah_buku

-- Nomor 7
DELIMITER //
CREATE PROCEDURE TambahStok(
    INOUT Tambah_Buku INT,
    IN KodeBuku VARCHAR(100)
)
BEGIN
    SET Tambah_Buku = Tambah_Buku + 3;
    UPDATE buku SET jumlah_buku = Tambah_Buku WHERE kode_buku = KodeBuku;
END//
DELIMITER ;

DROP PROCEDURE TambahStok
SET @jumlah_buku := 9; 
CALL TambahStok(@jumlah_buku, 'B001');
SELECT @jumlah_buku;

