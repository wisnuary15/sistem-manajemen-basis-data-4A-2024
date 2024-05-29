CREATE DATABASE modul4;
USE modul4;

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
DELIMITER //

CREATE PROCEDURE CariPengembalian(
    INOUT tanggal_kembali DATE
)
BEGIN
    SELECT 
        p.kode_kembali,
        a.nama_anggota,
        b.judul_buku,
        t.nama AS nama_petugas,
        p.tgl_pinjam,
        p.tgl_kembali,
        p.denda
    FROM 
        pengembalian p
    JOIN 
        anggota a ON p.id_anggota = a.id_anggota
    JOIN 
        buku b ON p.kode_buku = b.kode_buku
    JOIN 
        petugas t ON p.id_petugas = t.id_petugas
    WHERE 
        DATE(p.tgl_kembali) = tanggal_kembali;
END //

DELIMITER ;

SET @tanggal = '2024-06-05';
CALL CariPengembalian(@tanggal);

/Nomor 2/
DELIMITER //

CREATE PROCEDURE CariAnggotaBerdasarkanStatus(
    INOUT status_pinjam VARCHAR(15)
)
BEGIN
    SELECT 
        id_anggota,
        nama_anggota,
        tempat_lahir_anggota,
        tanggal_lahir_anggota,
        no_telp,
        jenis_kelamin,
        status_pinjam
    FROM 
        anggota
    WHERE 
        status_pinjam = status_pinjam;
END //

DELIMITER ;

SET @status = 'tidak pinjam';
CALL CariAnggotaBerdasarkanStatus(@status);

/Nomor 3/
DELIMITER //
CREATE PROCEDURE daftarAnggota (
OUT stat VARCHAR(50))
BEGIN
	SELECT * FROM anggota WHERE status_pinjam = stat;
END // 
DELIMITER ;

SET @status = 'pinjam';
CALL daftarAnggota(@status);

/Nomor 4/
DELIMITER //

CREATE PROCEDURE TambahBuku(
    IN p_kode_buku VARCHAR(10),
    IN p_judul_buku VARCHAR(25),
    IN p_pengarang_buku VARCHAR(30),
    IN p_tahun_buku VARCHAR(10),
    IN p_jumlah_buku VARCHAR(5)
)
BEGIN
    DECLARE keterangan VARCHAR(100);
    
    SELECT COUNT(*) INTO keterangan
    FROM buku 
    WHERE kode_buku = p_kode_buku;
    
    IF keterangan > 0 THEN
        SET keterangan = CONCAT('Data buku dengan kode ', p_kode_buku, ' sudah ada.');
    ELSE
        INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, tahun_buku, jumlah_buku) 
        VALUES (p_kode_buku, p_judul_buku, p_pengarang_buku, p_tahun_buku, p_jumlah_buku);
        SET keterangan = CONCAT('Data buku dengan kode ', p_kode_buku, ' berhasil ditambahkan.');
    END IF;
    SELECT keterangan;
END //

DELIMITER ;

CALL TambahBuku('B011', 'masih pemula', 'saya', '2024', '100');
DELETE FROM buku WHERE kode_buku = 'B011';

/Nomor 5/
DELIMITER //

CREATE PROCEDURE HapusAnggota(
    IN p_anggota_id VARCHAR(10)
)
BEGIN
    DECLARE jumlah_pinjaman INT;
    DECLARE result VARCHAR(100);

    SELECT COUNT(*) INTO jumlah_pinjaman
    FROM anggota
    WHERE id_anggota = p_anggota_id AND status_pinjam = 'pinjam';

    IF jumlah_pinjaman > 0 THEN
        SET result = 'Tidak dapat menghapus anggota karena masih memiliki pinjaman yang belum dikembalikan.';
    ELSE
        DELETE FROM anggota WHERE id_anggota = p_anggota_id;
        SET result = 'Data anggota berhasil dihapus.';
    END IF;
    SELECT result;
END //

DELIMITER ;

CALL HapusAnggota('A002');

/Nomor 6/
CREATE TABLE anak(
    anak_id INT PRIMARY KEY,
    nama_anak VARCHAR(50),
    hp_id INT
);

CREATE TABLE hp (
    hp_id INT PRIMARY KEY,
    merk_hp VARCHAR(50)
);

INSERT INTO anak (anak_id, nama_anak, hp_id) VALUES
(1, 'Ahmad', 101),
(2, 'Budi', 102),
(3, 'Cinta', NULL),
(4, 'Dinda', NULL),
(5, 'Erika', 103);

INSERT INTO hp (hp_id, merk_hp) VALUES
(101, 'Samsung'),
(102, 'iPhone'),
(103, 'Xiaomi'),
(104, 'Oppo'),
(105, 'Vivo');

CREATE VIEW anak_hp_count AS
SELECT 
    anak.nama_anak, 
    hp.merk_hp, 
    COUNT(hp.merk_hp) AS jumlah_hp
FROM 
    anak
LEFT JOIN 
    hp ON anak.hp_id = hp.hp_id
GROUP BY 
    anak.nama_anak, hp.merk_hp;
    
SELECT * FROM anak_hp_count

CREATE VIEW hp_anak_count AS
SELECT 
    anak.nama_anak, 
    hp.merk_hp, 
    COUNT(anak.nama_anak) AS jumlah_anak
FROM 
    anak
RIGHT JOIN 
    hp ON anak.hp_id = hp.hp_id
GROUP BY 
    anak.nama_anak, hp.merk_hp;
    
SELECT * FROM hp_anak_count

CREATE VIEW anak_hp_inner AS

SELECT 
    anak.nama_anak, 
    hp.merk_hp, 
    COUNT(anak.nama_anak) AS jumlah_anak
FROM 
    anak
INNER JOIN 
    hp ON anak.hp_id = hp.hp_id
GROUP BY 
    anak.nama_anak, hp.merk_hp;
    SELECT * FROM anak_hp_inner