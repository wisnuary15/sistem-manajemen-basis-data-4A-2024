CREATE DATABASE swalayan;

USE swalayan

CREATE TABLE barang( 
    id_barang INT(20) NOT NULL PRIMARY KEY,
    nama_barang VARCHAR(50) NOT NULL,
    jumlh_stok INT(20) NOT NULL,
    hrga_jual INT (20) NOT NULL, 
    hrga_beli INT(20) NOT NULL,
    id_supplier INT(20) NOT NULL);
    
CREATE TABLE supplier(
    id_supplier INT(20) NOT NULL PRIMARY KEY,
    nama_supplier VARCHAR(50) NOT NULL,
    alamat VARCHAR(50) NOT NULL,
    kategori ENUM("Lunas","Hutang") NOT NULL);
    
    
CREATE TABLE keuangan(
    id_keuangan INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    id_stok INT(20) NOT NULL,
    tipe ENUM ("Penjualan", "Pembelian"),
    kategori ENUM ("Lunas", "Hutang"),
    tgl_keuangan DATE NOT NULL,
    hrga_total INT(20) NOT NULL);
    
 CREATE TABLE laporan_stok(
    id_stok INT(20) NOT NULL PRIMARY KEY, 
    nama_barang VARCHAR(50) NOT NULL,
    stok_awal INT(20) NOT NULL,
    sisa_stok INT(20) NOT NULL);
    
 CREATE TABLE tr_pembelian(
    id_pembelian INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jmlh_beli INT(20) NOT NULL,
    tgl_pembelian DATE NOT NULL,
    kategori ENUM ("Lunas", "Hutang") NOT NULL);
    
 CREATE TABLE tr_penjualan(
    id_penjualan INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jmlah_jual INT(20) NOT NULL,
    tgl_penjualan DATE NOT NULL,
    total INT(20) NOT NULL);
    
 CREATE TABLE trs_return(
    id_return INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    id_suplyer INT(20) NOT NULL,
    jmlh_return INT(20) NOT NULL,
    tgal_return DATE NOT NULL,
    alasan ENUM ("Kadaluarsa", "Rusak", "Dll") NOT NULL);
    
 CREATE TABLE laporan_penjualan(
    id_transaksi INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jmlah INT(20) NOT NULL,
    harga INT(20) NOT NULL);
    
 INSERT INTO barang (`id_barang`, `nama_barang`, `jumlh_stok`, `hrga_jual`, `hrga_beli`, `id_supplier`) VALUES 
    (1, 'Gula', 16, 14000, 13000, 10002),
    (2, 'Kopi', 7, 5000, 4500, 10002),
    (3, 'Minyak', 5, 25000, 24500, 10003),
    (4, 'bubuk teh', 9, 6000, 5000, 10004),
    (5, 'Snack', 15, 12000, 11000, 10005),
    (6, 'parfum', 14, 20000, 19000, 10006),
    (7, 'Beras 5kg', 10, 52000, 49000, 10007),
    (8, 'Susu Sapi 1L', 30, 10000, 8500, 10008),
    (9, 'Sabun Mandi 100gr', 10, 5000, 4000, 10009),
    (10, 'Mie Instan', 30, 3500, 2500, 10010);
    
 INSERT INTO keuangan VALUES 
    (90001, 1, 20001, "Pembelian", "Lunas", '2023-01-01', 234000),
    (90002, 2, 20002, "Penjualan", "Lunas", '2023-01-01', 15000),
    (90003, 3, 20003, "Pembelian", "Hutang", '2023-01-02', 50000),
    (90004, 4, 20004, "Penjualan", "Hutang", '2023-01-02', 18000),
    (90005, 5, 20005, "Penjualan", "Lunas", '2023-01-03', 24000),
    (90006, 6, 20006, "Pembelian", "Lunas", '2023-01-03', 20000),
    (90007, 7, 20007, "Penjualan", "Lunas", '2023-01-04', 104000),
    (90008, 8, 20008, "Pembelian", "Hutang", '2023-01-04', 20000),
    (90009, 9, 20009, "Penjualan", "Lunas", '2023-01-05', 15000),
    (90010, 10, 20010, "Penjualan", "Lunas", '2023-01-05', 14000);
    
 INSERT INTO laporan_stok VALUES
    (20001, "Gula", 30, 15),
    (20002, "Kopi", 50, 30),
    (20003, "Minyak", 30, 15),
    (20004, "Bubuk Teh", 50, 20),
    (20005, "Snack", 30, 20),
    (20006, "parfum", 30, 15),
    (20007, "Beras 5kg", 30, 15),
    (20008, "Susu Sapi 1L", 40, 20),
    (20009, "Sabun Mandi", 30, 15),
    (20010, "Mie Instan", 30, 15);
    
INSERT INTO supplier VALUES
    (10001, "Dani", "Bangkalan", "Lunas"),
    (10002, "Tata", "Sampang", "Hutang"),
    (10003, "Laura", "Pamekasan", "Lunas"),
    (10004, "Sholeh", "Sumenep", "Hutang"),
    (10005, "Ma'ruf", "Surabaya", "Lunas"),
    (10006, "Hakim", "Sidoarjo", "Lunas"),
    (10007, "Aad", "Gresik", "Hutang"),
    (10008, "Tarto", "Lamongan", "Lunas"),
    (10009, "Sintya", "Tuban", "Lunas"),
    (10010, "Ubed", "Bojonegoro", "Lunas");
    
INSERT INTO tr_pembelian VALUES
    (30001, 1, 50 ,'2022-12-01', "Lunas"),
    (30002, 2, 50 ,'2022-12-01', "Lunas"),
    (30003, 3, 50 ,'2022-12-01', "Lunas"),
    (30004, 4, 50 ,'2022-12-01', "Lunas"),
    (30005, 5, 50 ,'2022-12-01', "Lunas"),
    (30006, 6, 50 ,'2022-12-01', "Lunas"),
    (30007, 7, 50 ,'2022-12-01', "Lunas"),
    (30008, 8, 50 ,'2022-12-01', "Lunas"),
    (30009, 9, 50 ,'2022-12-01', "Lunas"),
    (30010, 10, 50 ,'2022-12-01', "Lunas");
    
INSERT INTO tr_penjualan VALUES
    (40001, 1, 3, '2023-01-01', 50000),
    (40002, 2, 4, '2023-01-01', 60000),
    (40003, 3, 2, '2023-01-01', 54000),
    (40004, 4, 6, '2023-01-01', 52000),
    (40005, 5, 8, '2023-01-01', 20000),
    (40006, 6, 7, '2023-01-01', 60000),
    (40007, 7, 4, '2023-01-01', 52000),
    (40008, 8, 5, '2023-01-01', 30000),
    (40009, 9, 3, '2023-01-01', 12000),
    (40010, 10, 4, '2023-01-01', 40000);
    
INSERT INTO trs_return VALUES 
    (50001, 1, 10001, 3, '2023-01-01', "Rusak"),
    (50002, 2, 10002, 5, '2023-01-02', "Kadaluarsa"),
    (50003, 3, 10003, 5, '2023-01-03', "Kadaluarsa"),
    (50004, 4, 10004, 5, '2023-01-04', "Rusak"),
    (50005, 5, 10005, 5, '2023-01-05', "Kadaluarsa"),
    (50006, 6, 10006, 5, '2023-01-06', "Kadaluarsa"),
    (50007, 7, 10007, 5, '2023-01-07', "Rusak"),
    (50008, 8, 10008, 5, '2023-01-08', "Kadaluarsa"),
    (50009, 9, 10009, 5, '2023-01-09', "Kadaluarsa"),
    (50010, 10, 10010, 5, '2023-01-10', "Kadaluarsa");
    
INSERT INTO laporan_penjualan VALUES
    (60001, 1, 2, 10000),
    (60002, 2, 3, 15000),
    (60003, 3, 5, 20000),
    (60004, 4, 6, 20000),
    (60005, 5, 4, 30000),
    (60006, 6, 3, 50000),
    (60007, 7, 2, 10000),
    (60008, 8, 4, 15000),
    (60009, 9, 7, 10000),
    (60010, 10, 8, 80000);
    
SELECT * FROM barang;
SELECT * FROM keuangan;
SELECT * FROM laporan_penjualan;
SELECT * FROM laporan_stok;
SELECT * FROM supplier;
SELECT * FROM tr_pembelian;
SELECT * FROM tr_penjualan;
SELECT * FROM trs_return;

ALTER TABLE tr_pembelian RENAME TO trs_pembelian;

DROP SCHEMA swalayan;