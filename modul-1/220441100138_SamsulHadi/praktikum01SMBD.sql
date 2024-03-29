-- Active: 1711442067203@@127.0.0.1@3306@db_swalayan
-- Active: 1711442067203@@127.0.0.1@3306
CREATE DATABASE db_swalayan
    DEFAULT CHARACTER SET = 'utf8mb4';

USE db_swalayan

CREATE TABLE barang(
    id_brg INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nama_brg VARCHAR(50) NOT NULL,
    stok INT(20) NOT NULL,
    hrg_jual INT(20) NOT NULL,
    hrg_beli INT(20) NOT NULL);

CREATE TABLE supplier(
    id_supp INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nama_supp VARCHAR(50) NOT NULL,
    alamat VARCHAR(50) NOT NULL);

CREATE TABLE tr_penjualan(
    id_penjualan INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tanggal_jual DATE NOT NULL);

CREATE TABLE detail_tr_penjualan(
    id_detail_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_penjualan INT(20) NOT NULL,
    id_barang INT(20) NOT NULL,
    qty INT(20) NOT NULL,
    stok_sebelum INT(20) NULL,
    stok_sesudah INT(20) NULL);

CREATE TABLE tr_pembelian(
    id_pembelian INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_supp INT(20) NOT NULL,
    tanggal_beli DATE NOT NULL,
    keterangan ENUM('Lunas', 'Belum Lunas') NOT NULL);

CREATE TABLE detail_tr_pembelian(
    id_detail_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    id_pembelian INT(20) NOT NULL,
    id_barang INT(20) NOT NULL,
    stok INT(20) NOT NULL,
    hrg_beli INT(20) NOT NULL,
    stok_sebelum INT(20) NOT NULL,
    stok_sesudah INT(20) NOT NULL);


CREATE TABLE return_barang(
    id_ret INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_detail_penjualan INT(20) NOT NULL,
    tgl_ret DATE NOT NULL,
    keterangan_ret VARCHAR(50) NOT NULL);

INSERT INTO barang VALUES
    (1, 'Coca Cola', 38, 5000, 3500),
    (2, 'Sprite', 38, 5000, 3500),
    (3, 'Lasegar', 38, 7000, 6000),
    (4, 'Mie Sedap Goreng', 33, 4000, 3000),
    (5, 'Indomie Goreng', 33, 4000, 3000),
    (6, 'Indomie Soto', 33, 4000, 3000),
    (7, 'Silver Queen', 48, 12000, 10000),
    (8, 'Teh Pucuk', 58, 3500, 3000),
    (9, 'Daia', 28, 5000, 4000),
    (10, 'Potato Chips', 38, 9000, 7000);


INSERT INTO supplier VALUES
    (101, 'PT Indomaret', 'Jalan Sudirman No. 123'),
    (102, 'PT Alfamart', 'Jalan Gatot Subroto No. 456'),
    (103, 'PT Carrefour', 'Jalan Thamrin No. 789'),
    (104, 'PT Transmart', 'Jalan Pahlawan No. 1011'),
    (105, 'PT Lotte Mart', 'Jalan Asia Afrika No. 1213'),
    (106, 'PT Hero Supermarket', 'Jalan Hayam Wuruk No. 1415'),
    (107, 'PT Super Indo', 'Jalan Teuku Umar No. 1617'),
    (108, 'PT Matahari Department Store', 'Jalan Ahmad Yani No. 1819'),
    (109, 'PT Hypermart', 'Jalan Diponegoro No. 2021'),
    (110, 'PT Circle K', 'Jalan Pemuda No. 2223')


-- Dummy data untuk tabel pembelian (tr_pembelian)
INSERT INTO tr_pembelian (id_pembelian, id_supp, tanggal_beli, keterangan) VALUES
    (2001, 101, '2024-03-25', 'Lunas'),
    (2002, 102, '2024-03-26', 'Belum Lunas'),
    (2003, 103, '2024-03-27', 'Lunas'),
    (2004, 104, '2024-03-28', 'Belum Lunas'),
    (2005, 105, '2024-03-29', 'Belum Lunas'),
    (2006, 106, '2024-03-30', 'Lunas'),
    (2007, 107, '2024-03-31', 'Belum Lunas'),
    (2008, 108, '2024-04-01', 'Lunas'),
    (2009, 109, '2024-04-02', 'Lunas'),
    (2010, 110, '2024-04-03', 'Belum Lunas');


-- Dummy data untuk tabel detail pembelian (detail_tr_pembelian)
INSERT INTO detail_tr_pembelian (id_pembelian, id_barang, tambah_stok, hrg_beli, stok_sebelum, stok_sesudah) VALUES
    (2001, 1, 40, 3500, 0, 40),
    (2002, 2, 40, 3500, 0, 40),
    (2003, 3, 50, 6000, 0, 40),
    (2004, 4, 35, 3000, 0, 35),
    (2005, 5, 35, 3000, 0, 35),
    (2006, 6, 35, 3000, 0, 35),
    (2007, 7, 50, 10000, 0, 50),
    (2008, 8, 60, 3000, 0, 60),
    (2009, 9, 30, 4000, 0, 30),
    (2010, 10, 40, 7000, 0, 40)

INSERT INTO tr_penjualan(id_penjualan, tanggal_jual) VALUES
    (3001, '2024-03-25'),
    (3002, '2024-03-26'),
    (3003, '2024-03-27'),
    (3004, '2024-03-28'),
    (3005, '2024-03-29'),
    (3006, '2024-03-30'),
    (3007, '2024-03-31'),
    (3008, '2024-04-01'),
    (3009, '2024-04-02'),
    (3010, '2024-04-03');

INSERT INTO detail_tr_penjualan VALUES
    (3001, 1, 1, 40, 39),
    (3001, 2, 1, 40, 39),
    (3002, 3, 1, 40, 39),
    (3002, 4, 1, 35, 34),
    (3003, 5, 1, 35, 34),
    (3003, 6, 1, 35, 34),
    (3004, 7, 1, 50, 49),
    (3004, 8, 1, 60, 59),
    (3005, 9, 1, 30, 29),
    (3005, 10, 1, 40, 39),
    (3006, 1, 1, 39, 38),
    (3006, 2, 1, 39, 38),
    (3007, 3, 1, 39, 38),
    (3007, 4, 1, 34, 33),
    (3008, 5, 2, 34, 32),
    (3008, 6, 2, 34, 32),
    (3009, 7, 1, 49, 48),
    (3009, 8, 1, 59, 58),
    (3010, 9, 1, 29, 28),
    (3010, 10, 1, 39, 38),

INSERT INTO return_barang(id_detail_penjualan, tgl_ret, keterangan_ret) VALUES
    (1, '2024-03-25', 'Kadaluarsa'),
    (3, '2024-03-26', 'Kadaluarsa'),
    (5, '2024-03-27', 'Kadaluarsa'),
    (7, '2024-03-28', 'Kadaluarsa'),
    (9, '2024-03-29', 'Kadaluarsa'),
    (11, '2024-03-30', 'Kadaluarsa'),
    (13, '2024-03-31', 'Kadaluarsa'),
    (15, '2024-04-01', 'Kadaluarsa'),
    (17, '2024-04-02', 'Kadaluarsa'),
    (19, '2024-04-03', 'Kadaluarsa');

SELECT* FROM barang;
SELECT* FROM supplier;
SELECT* FROM tr_penjualan;
SELECT* FROM detail_tr_penjualan;
SELECT* FROM tr_pembelian;
SELECT* FROM detail_tr_pembelian;
SELECT* FROM return_barang;

RENAME TABLE tbl_barang TO barang

DROP DATABASE db-swalayan

-- Total Penjualan per-ID(Nota) penjualan
SELECT tr_penjualan.id_penjualan, tr_penjualan.tanggal_jual, SUM(detail_tr_penjualan.qty * barang.hrg_jual) AS total_penjualan
FROM tr_penjualan
JOIN detail_tr_penjualan ON tr_penjualan.id_penjualan = detail_tr_penjualan.id_penjualan
JOIN barang ON detail_tr_penjualan.id_barang = barang.id_brg
GROUP BY tr_penjualan.id_penjualan

--Total Harga perbarang
SELECT tr_penjualan.id_penjualan, tr_penjualan.tanggal_jual, barang.nama_brg, detail_tr_penjualan.qty,
       barang.hrg_jual, (detail_tr_penjualan.qty * barang.hrg_jual) AS total_harga_per_barang
FROM tr_penjualan
JOIN detail_tr_penjualan ON tr_penjualan.id_penjualan = detail_tr_penjualan.id_penjualan
JOIN barang ON detail_tr_penjualan.id_barang = barang.id_brg;


--Total Penjualan Perhari
SELECT tr_penjualan.tanggal_jual, SUM(detail_tr_penjualan.qty * barang.hrg_jual) AS total_penjualan_per_hari
FROM tr_penjualan
JOIN detail_tr_penjualan ON tr_penjualan.id_penjualan = detail_tr_penjualan.id_penjualan
JOIN barang ON detail_tr_penjualan.id_barang = barang.id_brg
GROUP BY tr_penjualan.tanggal_jual;

--Total Penjualan Perbarnag
SELECT barang.id_brg, barang.nama_brg, SUM(detail_tr_penjualan.qty * barang.hrg_jual) AS total_penjualan_per_barang
FROM detail_tr_penjualan
JOIN barang ON detail_tr_penjualan.id_barang = barang.id_brg
GROUP BY barang.id_brg;

--Stok barang
SELECT nama_brg, stok FROM barang;

--Stok barang dari supplier
SELECT s.nama_supp, SUM(dtp.tambah_stok) AS total_stok
FROM detail_tr_pembelian dtp
JOIN tr_pembelian tp ON dtp.id_pembelian = tp.id_pembelian
JOIN supplier s ON tp.id_supp = s.id_supp
GROUP BY s.nama_supp;

--stok sebelumnya (pembelian)
SELECT brg.id_brg, brg.nama_brg, tr_pembelian.tanggal_beli, dtp.stok_sebelum, dtp.stok_sesudah
from detail_tr_pembelian dtp
JOIN barang brg ON dtp.id_barang = brg.id_brg
JOIN tr_pembelian ON tr_pembelian.id_pembelian = dtp.id_pembelian

--stok sebelumnya (penjualan)
SELECT brg.id_brg, brg.nama_brg, tr_penjualan.tanggal_jual, dtp.stok_sebelum, dtp.stok_sesudah
from detail_tr_penjualan dtp
JOIN barang brg ON dtp.id_barang = brg.id_brg
JOIN tr_penjualan ON tr_penjualan.id_penjualan = dtp.id_penjualan



--Barang yang diretur berdasarkan tanggal 
SELECT b.nama_brg, dtp.qty, rb.tgl_ret, rb.keterangan_ret
FROM barang b
JOIN  return_barang rb ON b.id_brg = rb.id_detail_penjualan
JOIN detail_tr_penjualan dtp ON rb.id_detail_penjualan = dtp.id_detail_penjualan
WHERE rb.tgl_ret = '2024-03-26';

--Total Retur
SELECT 
-- r.tgl_ret AS Tanggal_Retur,
SUM(dtp.qty) AS Total_Quantity_Retur,
SUM(dtp.qty * b.hrg_jual) AS Total_Harga_Retur
FROM return_barang r 
JOIN detail_tr_penjualan dtp ON r.id_detail_penjualan = dtp.id_detail_penjualan
JOIN barang b ON dtp.id_barang = b.id_brg;
-- WHERE r.tgl_ret = '2024-03-25';

--Barang Terjual
SELECT  barang.nama_brg, sum(detail_tr_penjualan.qty) as barang_Terjual
FROM barang
JOIN detail_tr_penjualan ON barang.id_brg = detail_tr_penjualan.id_barang
GROUP BY id_brg;


--TRIGGER Kurang Stok
DELIMITER //
CREATE TRIGGER kurangi_stok_setelah_penjualan
AFTER INSERT ON detail_tr_penjualan
FOR EACH ROW
BEGIN
    UPDATE barang
    SET stok = stok - NEW.qty
    WHERE id_brg = NEW.id_barang;
END;
//
DELIMITER ;


--TRIGGER Tambah Stok
DELIMITER //
CREATE TRIGGER tambah_stok_setelah_pembelian
AFTER INSERT ON detail_tr_pembelian
FOR EACH ROW
BEGIN
    DECLARE stok_sekarang INT;
    DECLARE stok_baru INT;
    SELECT stok INTO stok_sekarang FROM barang WHERE id_brg = NEW.id_barang;
    
    SET stok_baru = stok_sekarang + NEW.tambah_stok;
    UPDATE barang SET stok = stok_baru WHERE id_brg = NEW.id_barang;
END //

DELIMITER ;

-- updated stok history pembelian
DELIMITER //
CREATE TRIGGER before_insert_pembelian
BEFORE INSERT ON detail_tr_pembelian
FOR EACH ROW
BEGIN
    DECLARE stok_awal INT;
    SELECT stok INTO stok_awal FROM barang WHERE id_brg = NEW.id_barang;
    
    SET NEW.stok_sebelum = stok_awal;
    SET NEW.stok_sesudah = stok_awal + NEW.tambah_stok;
END;
//
DELIMITER ;

-- updated stok history penjualan
DELIMITER //
CREATE TRIGGER before_insert_penjualan
BEFORE INSERT ON detail_tr_penjualan
FOR EACH ROW
BEGIN
    DECLARE stok_awal INT;
    SELECT stok INTO stok_awal FROM barang WHERE id_brg = NEW.id_barang;
    
    SET NEW.stok_sebelum = stok_awal;
    SET NEW.stok_sesudah = stok_awal - NEW.qty;
END;
//
DELIMITER ;

