CREATE DATABASE modul6;
USE modul6;

CREATE TABLE IF NOT EXISTS anggota (
id_anggota VARCHAR(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL, 
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
jumlah_buku VARCHAR(5) NOT NULL
);

CREATE TABLE IF NOT EXISTS peminjaman (
kode_peminjaman VARCHAR (10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR (10) NOT NULL,
id_petugas VARCHAR (10) NOT NULL,
tanggal_pinjam TIMESTAMP DEFAULT NOW(),
tanggal_kembali TIMESTAMP DEFAULT NOW(),
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
tgl_pinjam TIMESTAMP DEFAULT NOW(),
tgl_kembali TIMESTAMP DEFAULT NOW(),
denda VARCHAR (15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

SHOW TABLES;

INSERT INTO anggota VALUES 
('A001','Tomo','Jakarta','2004-06-22',085211112222,'Laki-Laki','1'),
('A002','Siska','Surabaya','2002-03-15',085233334444,'Perempuan','1'),
('A003','Budi','Bandung','2001-11-08',085255556666,'Laki-Laki','0'),
('A004','Dewi','Yogyakarta','2002-09-30',085277778888,'Perempuan','1'),
('A005','Hadi','Gresik','2003-07-12',085299990000,'Laki-Laki','5'),
('A006','Rina','Lamongan','2005-05-24',085211112233,'Perempuan','1'),
('A007','Adi','Bandung','2001-01-18',085211112244,'Laki-Laki','1'),
('A008','Lina','Jombang','2000-08-03',085211112255,'Perempuan','1'),
('A009','Andi','Bojonegoro','2004-04-06',085211112266,'Laki-Laki','1'),
('A010','Rani','Sidoarjo','2004-12-29',085211112277,'Perempuan','0');

UPDATE anggota
SET status_pinjam = '0'
WHERE id_anggota = 'A003';

INSERT INTO buku VALUES 
('B001','Pulang','Tereliye','2017','9'),
('B002','Matahari','Tereliye','2019','8'),
('B003','Senja','Biru','2018','7'),
('B004','Pelangi','Jompi','2020','6'),
('B005','Cahaya','Sukarso','2016','5'),
('B006','Bulan','Tereliye','2015','4'),
('B007','Mimpi','Dono','2021','3'),
('B008','Harapan','Pidie Baiq','2014','2'),
('B009','Bintang','Tereliye','2023','1'),
('B010','Menara','Joko','2022','3');

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

INSERT INTO peminjaman VALUES 
('PM001','A004','P004',NOW(), NOW() + INTERVAL 7 DAY,'B001'),
('PM002','A001','P005',NOW(), NOW() + INTERVAL 7 DAY,'B009'),
('PM003','A006','P003',NOW(), NOW() + INTERVAL 7 DAY,'B006'),
('PM004','A009','P007',NOW(), NOW() + INTERVAL 7 DAY,'B004'),
('PM005','A008','P008',NOW(), NOW() + INTERVAL 7 DAY,'B003'),
('PM007','A005','P010',NOW(), NOW() + INTERVAL 7 DAY,'B010'),
('PM008','A002','P001',NOW(), NOW() + INTERVAL 7 DAY,'B007'),
('PM009','A010','P002',NOW(), NOW() + INTERVAL 7 DAY,'B005'),
('PM010','A007','P003',NOW(), NOW() + INTERVAL 7 DAY,'B002'),
('PM011','A005','P005',NOW(), NOW() + INTERVAL 7 DAY,'B008'),
('PM012','A005','P005',NOW(), NOW() + INTERVAL 7 DAY,'B003'),
('PM013','A005','P003',NOW(), NOW() + INTERVAL 7 DAY,'B001'),
('PM014','A005','P003',NOW(), NOW() + INTERVAL 7 DAY,'B009');

DELETE FROM peminjaman
WHERE id_anggota = 'A003';

INSERT INTO pengembalian VALUES 
('PG001','A009','B004','P007',NOW(), NOW() + INTERVAL 7 DAY,'Rp.0'),
('PG002','A001','B009','P002',NOW(), NOW() + INTERVAL 7 DAY,'Rp.0'),
('PG003','A006','B006','P003',NOW(), NOW() + INTERVAL 7 DAY,'Rp.30000'),
('PM014','A005','B009','P003',NOW(), NOW() + INTERVAL 7 DAY ,'RP.0'),
('PM015','A006','B006','P003',NOW(), NOW() + INTERVAL 7 DAY ,'Rp.30000');

/Nomor 1/
DELIMITER//
CREATE PROCEDURE tampilBiodata(
	IN nim INT(20),
	IN nama VARCHAR(20),
	IN alamat VARCHAR(20),
	IN noTlp INT(12),
	IN jenisKelamin VARCHAR(1),
	IN hobi VARCHAR(20),
	IN tanggalLahir DATE
)
BEGIN
	DECLARE vNim INT(20);
	DECLARE vNama VARCHAR(20);
	DECLARE vAlamat VARCHAR(20);
	DECLARE vNoTlp INT(12);
	DECLARE vJenisKelamin VARCHAR(1);
	DECLARE vHobi VARCHAR(20);
	DECLARE vTanggalLahir DATE;
	DECLARE vUmur INT(2);
	
	SET vNim = nim;
	SET vNama = nama;
	SET vAlamat = alamat;
	SET vNoTlp = noTlp;
	SET vJenisKelamin = jenisKelamin;
	SET vHobi = hobi;
	SET vTanggalLahir = tanggalLahir;
	SET vUmur = TIMESTAMPDIFF(YEAR, vTanggalLahir, CURDATE());
	
	SELECT vNim AS Nim, vNama AS Nama_Mahasiswa, vAlamat AS Alamat, vNoTlp AS No_Tlp,
	vJenisKelamin AS Jenis_Kelamin, vHobi AS Hobi,vTanggalLahir AS Tanggal_Lahir, vUmur AS Umur;
END//
DELIMITER//

CALL tampilBiodata(1234, 'Kirisaki', 'Jombang', 911, 'P', 'makan', '2004-02-15');

/Nomor 2/
DELIMITER//
CREATE PROCEDURE Pengingat(
	IN tanggalPinjam DATE
)
BEGIN
	DECLARE keterangan VARCHAR(100);
	DECLARE selisih INT;
	
	SET selisih = DATEDIFF(CURDATE(), tanggalPinjam);
	IF selisih <= 2 THEN 
		SET keterangan = "Silahkan pergunakan buku dengan baik";
	ELSEIF selisih BETWEEN 3 AND 5 THEN
		SET keterangan = "Ingat!, Waktu pinjam segera habis";
	ELSE
		SET keterangan = 'Warning!!!, Denda Menanti Anda';
    END IF;
    
    SELECT keterangan AS Keterangan_Pengingat;
END//
DELIMITER//

CALL Pengingat ('2024-04-01');

/Nomor 3/
DELIMITER //

CREATE PROCEDURE cekDenda(IN student_id VARCHAR(10))
BEGIN
    DECLARE kondisi INT;
    DECLARE keterangan VARCHAR(100);

    SELECT COUNT(*) INTO kondisi
    FROM pengembalian
    WHERE id_anggota = student_id AND denda != 'Rp.0';

    IF kondisi > 0 THEN
        SELECT kode_kembali, kode_buku,tgl_pinjam, tgl_kembali, denda
        FROM pengembalian
        WHERE id_anggota = student_id AND denda != 'Rp.0';
    ELSE
        SET keterangan = 'Mahasiswa tidak memiliki tanggungan atau denda.';
    END IF;
	SELECT keterangan AS Keterangan_denda;
END //
DELIMITER ;

CALL cekDenda('A006');
CALL cekDenda('A009');

/Nomor 4/
DELIMITER //

CREATE PROCEDURE PerulanganPinjaman()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10 DO
        SELECT *
        FROM peminjaman
        WHERE kode_peminjaman = CONCAT('PM00', i);

        SET i = i + 1;
    END WHILE;
END //

/Nomor 5/
DELIMITER ;
CALL PerulanganPinjaman();

DELIMITER //

CREATE PROCEDURE hapusData(
IN kode VARCHAR (10))

BEGIN 
	DECLARE keterangan VARCHAR (100);
	DECLARE cek INT;
	DECLARE jenis VARCHAR (20);
	SELECT COUNT(*),jenis_kelamin INTO cek,jenis FROM peminjaman a 
	JOIN anggota b ON a.id_anggota = b.id_anggota 
	WHERE a.id_anggota = kode ;
	
	IF (jenis = 'Perempuan') THEN
		SET keterangan = CONCAT('data anggota dengan id ', kode, ' adalah perempuan'); 
	ELSEIF(cek = 0) THEN 
		DELETE FROM anggota WHERE id_anggota = kode AND jenis_kelamin = 'Laki_laki';
		SET keterangan = CONCAT('data anggota dengan id ', kode, ' berhasil dihapus');
	ELSE
		SET keterangan = CONCAT('data anggota dengan id ', kode, ' masih memiliki tanggungan');
	END IF;
	SELECT keterangan;
END //
DELIMITER;