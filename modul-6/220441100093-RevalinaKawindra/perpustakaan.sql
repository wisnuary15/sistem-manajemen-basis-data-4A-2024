/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - perpustakaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `perpustakaan`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `id_anggota` int(10) NOT NULL,
  `nama_anggota` varchar(20) NOT NULL,
  `angkatan_anggota` varchar(6) NOT NULL,
  `tempat_lahir_anggota` varchar(20) NOT NULL,
  `tanggal_lahir_anggota` date DEFAULT NULL,
  `no_telp` varchar(12) DEFAULT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `status_pinjam` varchar(15) NOT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`id_anggota`,`nama_anggota`,`angkatan_anggota`,`tempat_lahir_anggota`,`tanggal_lahir_anggota`,`no_telp`,`jenis_kelamin`,`status_pinjam`) values 
(310,'Revalina','2022','Surabaya','2004-06-19','081334666249','perempuan','pinjam'),
(311,'Dita','2022','Nganjuk','2003-05-23','084582335617','perempuan','pinjam'),
(312,'Dhea','2022','Bojonegoro','2004-10-16','084429119444','perempuan','pinjam'),
(313,'Mahesa','2021','Malang','2002-10-15','082367789115','laki-laki','pinjam'),
(314,'Jeremy','2021','Blitar','2002-11-15','087311742299','laki-laki','pinjam'),
(315,'Shaka','2022','Pasuruan','2002-12-08','081670092366','laki-laki','pinjam');

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `kode_buku` int(10) NOT NULL,
  `judul_buku` varchar(25) NOT NULL,
  `pengarang_buku` varchar(30) NOT NULL,
  `penerbit_buku` varchar(30) NOT NULL,
  `tahun_buku` varchar(10) NOT NULL,
  `jumlah_buku` varchar(5) NOT NULL,
  `status_buku` varchar(10) NOT NULL,
  `klasifikasi_buku` varchar(20) NOT NULL,
  PRIMARY KEY (`kode_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buku` */

insert  into `buku`(`kode_buku`,`judul_buku`,`pengarang_buku`,`penerbit_buku`,`tahun_buku`,`jumlah_buku`,`status_buku`,`klasifikasi_buku`) values 
(210,'Harry Potter','J.K. Rowling','Bloomsbury','1997','7','baik','fiksi'),
(211,'The Hunger Games','Suzzane Collins','Scholastic Cooperation','2008','6','baik','fiksi'),
(212,'Pride and Preajudice','Jane Austen','Whitehall','1813','4','baik','fiksi'),
(213,'The Hobbit','J.R.R. Tolkien','Allen & Unwin','1937','7','baik','fiksi'),
(214,'The Passage','Justin Cronin','Ballantine Books','2010','15','baik','fiksi'),
(215,'Bumi Manusia','Pramoedya Ananta Toer','Hasta Mitra','1980','10','baik','fiksi'),
(216,'Pulang','Tere Liye','Gramedia Pustaka Utama','2012','10','baik ','fiksi'),
(217,'Aroma Karsa','Dee Lestari','Bentang Pustaka','2021','15','baik','fiksi'),
(218,'Sang Pemimpi','Andrea Hirata','Bentang Pustaka','2006','7','baik','fiksi'),
(219,'Matahari','Tere Liye','Gramedia Pustaka Utama','2011','11','baik','fiksi');

/*Table structure for table `peminjaman` */

DROP TABLE IF EXISTS `peminjaman`;

CREATE TABLE `peminjaman` (
  `id_pinjam` int(10) NOT NULL,
  `id_anggota` int(10) NOT NULL,
  `id_petugas` int(10) NOT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `kode_buku` int(10) NOT NULL,
  PRIMARY KEY (`id_pinjam`),
  KEY `id_anggota` (`id_anggota`),
  KEY `kode_buku` (`kode_buku`),
  KEY `id_petugas` (`id_petugas`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`),
  CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjaman` */

insert  into `peminjaman`(`id_pinjam`,`id_anggota`,`id_petugas`,`tanggal_pinjam`,`tanggal_kembali`,`kode_buku`) values 
(510,312,111,'2024-02-13','2024-02-20',216),
(511,311,112,'2024-02-17','2024-02-24',217),
(512,313,112,'2024-02-17','2024-02-24',219),
(513,313,113,'2024-02-23','2024-03-01',210),
(514,313,111,'2024-02-24','2024-03-01',212),
(515,312,113,'2024-05-01','2024-05-07',215),
(516,310,110,'2024-05-01','2024-07-01',219),
(517,315,114,'2024-05-01','2024-05-07',214),
(518,312,112,'2024-05-01','2024-05-07',212),
(519,314,114,'2024-05-08','2024-05-14',216),
(520,315,112,'2024-05-08','2024-05-14',218);

/*Table structure for table `pengembalian` */

DROP TABLE IF EXISTS `pengembalian`;

CREATE TABLE `pengembalian` (
  `id_kembali` int(10) NOT NULL,
  `id_anggota` int(10) NOT NULL,
  `kode_buku` int(10) NOT NULL,
  `id_petugas` int(10) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` varchar(15) NOT NULL,
  PRIMARY KEY (`id_kembali`),
  KEY `id_anggota` (`id_anggota`),
  KEY `kode_buku` (`kode_buku`),
  KEY `id_petugas` (`id_petugas`),
  CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`),
  CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pengembalian` */

insert  into `pengembalian`(`id_kembali`,`id_anggota`,`kode_buku`,`id_petugas`,`tgl_pinjam`,`tgl_kembali`,`denda`) values 
(410,310,211,110,'2024-02-02','2024-02-09','5000'),
(411,313,211,113,'2024-02-16','2024-02-18','0'),
(412,313,216,113,'2024-02-16','2024-02-20','0'),
(413,314,214,114,'2024-02-13','2024-02-15','0'),
(414,315,216,114,'2024-02-13','2024-02-16','5000'),
(415,311,214,115,'2024-02-13','2024-02-17','0'),
(416,310,219,111,'2024-02-13','2024-02-16','0'),
(417,312,210,114,'2024-02-13','2024-02-21','10000'),
(418,314,217,112,'2024-02-13','2024-02-21','10000');

/*Table structure for table `petugas` */

DROP TABLE IF EXISTS `petugas`;

CREATE TABLE `petugas` (
  `id_petugas` int(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `pass` varchar(15) NOT NULL,
  `nama_petugas` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `petugas` */

insert  into `petugas`(`id_petugas`,`username`,`pass`,`nama_petugas`) values 
(110,'budi00','b110','budi'),
(111,'siti01','s111','siti'),
(112,'nastri02','n112','nastri'),
(113,'sultan03','s113','suktan'),
(114,'andi04','a114','andi'),
(115,'sri05','sr115','Sriati');

/* Procedure structure for procedure `biodata` */

/*!50003 DROP PROCEDURE IF EXISTS  `biodata` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `biodata`(
    IN nim INT,
    IN nama VARCHAR(20),
    IN alamat VARCHAR(20),
    IN noTelp INT,
    IN jenisKelamin VARCHAR(1),
    IN hobi VARCHAR(20),
    IN umur INT
)
BEGIN
    DECLARE vNim INT;
    DECLARE vNamaM VARCHAR(20);
    DECLARE vAlamat VARCHAR(20);
    DECLARE vNoTelp INT;
    DECLARE vJenisKelamin VARCHAR(1);
    DECLARE vHobi VARCHAR(20);
    DECLARE vumur INT;
    
    SET vNim = nim;
    SET vNamaM = nama;
    SET vAlamat = alamat;
    SET vNoTelp = noTelp;
    SET vJenisKelamin = jenisKelamin;
    SET vHobi = hobi;
    SET vumur = umur;
    

    SELECT vNim AS NIM, 
           vNamaM AS Nama_Mahasiswa, 
           vAlamat AS Alamat_asal, 
           vNoTelp AS No_Telp,
           vJenisKelamin AS Jenis_Kelamin, 
           vHobi AS Hobi, 
           vumur AS Umur;
END */$$
DELIMITER ;

/* Procedure structure for procedure `cetak_pinjam` */

/*!50003 DROP PROCEDURE IF EXISTS  `cetak_pinjam` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cetak_pinjam`(
	IN jumlah INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= jumlah DO
        SELECT * FROM peminjaman LIMIT jumlah;
        SET i = i + 1;
    END WHILE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `denda` */

/*!50003 DROP PROCEDURE IF EXISTS  `denda` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `denda`(
	IN kode VARCHAR(10))
BEGIN
DECLARE total_denda VARCHAR (50);

	IF ((SELECT SUM(denda) FROM pengembalian WHERE id_anggota = kode) !=0) THEN
		SET total_denda = (SELECT SUM(denda) FROM pengembalian WHERE id_anggota=kode);
	ELSE 	
		SET total_denda = 'Anda tidak memiliki denda';
	END IF;
		SELECT total_denda;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getBuku` */

/*!50003 DROP PROCEDURE IF EXISTS  `getBuku` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getBuku`(
	IN KodeBuku VARCHAR(10), 
	OUT KodeBukuOUT VARCHAR(10),
	OUT JudulBukuOUT VARCHAR (25), 
	OUT PengarangBukuOUT VARCHAR (30))
BEGIN
		SELECT kode_buku, judul_buku, pengarang_buku INTO KodeBukuOUT,JudulBukuOUT,PengarangBukuOUT
		FROM buku WHERE kode_buku = KodeBuku;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `get_anggota` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_anggota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_anggota`(
	IN member_id INT (10), 
	IN nama VARCHAR (15),
	IN angkatan varchar (6))
BEGIN 
	SELECT * FROM petugas WHERE id_anggota = member_id
	and nama_anggota = nama
	and angkatan_anggota = angkatan ;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `get_book` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_book` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_book`(IN book_id int (100))
BEGIN 
	SELECT * FROM buku WHERE kode_buku = book_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `get_member` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_member` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_member`(
	IN member_id INT (10), 
	IN nama VARCHAR (15),
	IN angkatan varchar (6))
BEGIN 
	SELECT * FROM anggota WHERE id_anggota = member_id
	and nama_anggota = nama
	and angkatan_anggota = angkatan ;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `get_petugas` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_petugas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_petugas`(IN id_ptgs int (10), IN psword VARCHAR (15))
BEGIN 
	SELECT * FROM petugas WHERE id_petugas = id_ptgs AND pass = psword;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `hapus_anggota` */

/*!50003 DROP PROCEDURE IF EXISTS  `hapus_anggota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hapus_anggota`()
BEGIN
	 DELETE FROM Anggota
    WHERE jenis_kelamin = 'Laki-laki'
    AND id_anggota NOT IN (
        SELECT DISTINCT id_anggota 
        FROM peminjaman 
        WHERE status_pinjam != "tidak pinjam"
    );
END */$$
DELIMITER ;

/* Procedure structure for procedure `insert_petugas` */

/*!50003 DROP PROCEDURE IF EXISTS  `insert_petugas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_petugas`(
		IN id_ptgs int (10), 
		IN usrname VARCHAR (15),
		IN psword VARCHAR (15),
		IN nama varchar (15))
BEGIN 
	INSERT INTO petugas VALUES (id_ptgs, usrname, psword, nama);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `jumlah_buku` */

/*!50003 DROP PROCEDURE IF EXISTS  `jumlah_buku` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `jumlah_buku`(
	OUT jml_buku INT)
BEGIN 
	SELECT COUNT(*) INTO jml_buku FROM buku;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `peringatan` */

/*!50003 DROP PROCEDURE IF EXISTS  `peringatan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `peringatan`()
BEGIN 
	SELECT id_kembali, id_anggota, tgl_pinjam, tgl_kembali, 
	DATEDIFF(tgl_kembali, tgl_pinjam) AS lama_meminjam,
	CASE WHEN DATEDIFF(tgl_kembali, tgl_pinjam) <= 2 THEN ' Silahkan Pergunakan Buku'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) BETWEEN 3 AND 5 THEN  ' Ingat!, Waktu pinjam segera habis'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) >= 6 THEN ' Warning!!!, Denda menanti anda' END AS "status"
	FROM pengembalian ORDER BY lama_meminjam ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `total_Buku` */

/*!50003 DROP PROCEDURE IF EXISTS  `total_Buku` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `total_Buku`(
  IN nama_pengarang VARCHAR(30),
  INOUT tahun VARCHAR (30),
  OUT total VARCHAR (30)
)
BEGIN
  SELECT COUNT(*) INTO total
  FROM buku
  WHERE pengarang_buku = nama_pengarang AND tahun_buku = tahun;
  SET tahun = CAST(tahun AS SIGNED) ;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
