-- -- --  MEMBUAT DATABASE -- -- --
CREATE SCHEMA swalayan;

-- -- --  MEMBUAT SET DEFAULT PADA DATABASE -- -- --
USE swalayan;
  
-- -- --  MENBUAT DAN MENGISI VALUE TABEL -- -- --
CREATE TABLE barang( 
    id_barang INT(20) NOT NULL PRIMARY KEY,
    nama_barang VARCHAR(50) NOT NULL,
    id_supplier INT(20) NOT NULL,
    jmlh_stok INT(20) NOT NULL,
    harga_jual INT (20) NOT NULL, 
    harga_beli INT(20) NOT NULL);

INSERT INTO barang VALUES 
    (1, 'Kopi', 18, 14000, 13000, 10002),
    (2, 'Gula', 7, 5000, 45000, 10002),
    (3, 'Parfum', 5, 25000, 24500, 10003),
    (4, 'bubuk teh', 9, 6000, 5000, 10004),
    (5, 'Snack', 20, 12000, 11000, 10005),
    (6, 'Minyak Goreng', 14, 20000, 19000, 10006),
    (7, 'Beras', 10, 52000, 49000, 10007),
    (8, 'Susu', 15, 10000, 8500, 10008),
    (9, 'Sabun Mandi', 20, 5000, 4000, 10009),
    (10,'Mie Instan', 20, 3500, 2500, 10010);
===================================================================
CREATE TABLE keuangan(
    id_keuangan INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    id_stok INT(20) NOT NULL,
    tipe ENUM ("Penjualan", "Pembelian"),
    kategori ENUM ("Lunas", "Hutang"),
    tanggal_keuangan DATE NOT NULL,
    harga_total INT(20) NOT NULL);
    
INSERT INTO keuangan VALUES 
    (9001, 1, 20001, "Pembelian", "Lunas", '2024-03-11', 234000),
    (9002, 2, 20002, "Penjualan", "Lunas", '2024-02-21', 15000),
    (9003, 3, 20003, "Pembelian", "Hutang", '2024-01-12', 50000),
    (9004, 4, 20004, "Penjualan", "Hutang", '2024-04-02', 18000),
    (9005, 5, 20005, "Penjualan", "Lunas", '2024-02-08', 24000),
    (9006, 6, 20006, "Pembelian", "Lunas", '2024-02-13', 20000),
    (9007, 7, 20007, "Penjualan", "Lunas", '2024-03-14', 104000),
    (9008, 8, 20008, "Pembelian", "Hutang", '2024-01-24', 20000),
    (9009, 9, 20009, "Penjualan", "Lunas", '2024-03-25', 15000),
    (9010, 10, 20010, "Penjualan", "Lunas", '2024-02-15', 14000);
===================================================================
CREATE TABLE laporan_stok(
    id_stok INT(20) NOT NULL PRIMARY KEY, 
    nama_barang VARCHAR(50) NOT NULL,
    stok_awal INT(20) NOT NULL,
    sisa_stok INT(20) NOT NULL);
    
INSERT INTO laporan_stok VALUES
    (2001, "Kopi", 30, 15),
    (2002, "Gula", 50, 30),
    (2003, "Parfum", 30, 15),
    (2004, "Bubuk Teh", 50, 20),
    (2005, "Snack", 30, 20),
    (2006, "Minyak Goreng", 30, 15),
    (2007, "Beras", 30, 15),
    (2008, "Susu", 40, 20),
    (2009, "Sabun Mandi", 30, 15),
    (2010, "Mie Instan", 30, 15);   
==================================================================
CREATE TABLE supplier(
    id_supplier INT(20) NOT NULL PRIMARY KEY,
    nama_supplier VARCHAR(50) NOT NULL,
    alamat VARCHAR(50) NOT NULL,
    kategori ENUM("Lunas","Hutang") NOT NULL);
    
INSERT INTO supplier VALUES
    (1001, "Izud", "Gresik", "Lunas"),
    (1002, "Yono", "Sampang", "Hutang"),
    (1003, "Budi", "Pamekasan", "Lunas"),
    (1004, "Yanto", "Sumenep", "Hutang"),
    (1005, "Suep", "Surabaya", "Lunas"),
    (1006, "Fajar", "Sidoarjo", "Lunas"),
    (1007, "Gita", "Gresik", "Hutang"),
    (1008, "Hadi", "Lamongan", "Lunas"),
    (1009, "Supri", "Tuban", "Lunas"),
    (1010, "Joko", "Bojonegoro", "Lunas");
==================================================================
CREATE TABLE tr_pembelian(
    id_pembelian INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jumlah_beli INT(20) NOT NULL,
    tgl_pembelian DATE NOT NULL,
    kategori ENUM ("Lunas", "Hutang") NOT NULL);
    
INSERT INTO tr_pembelian VALUES
    (3001, 1, 50 ,'2023-12-01', "Lunas"),
    (3002, 2, 50 ,'2023-12-01', "Lunas"),
    (3003, 3, 50 ,'2023-12-01', "Lunas"),
    (3004, 4, 50 ,'2023-12-01', "Lunas"),
    (3005, 5, 50 ,'2023-12-01', "Lunas"),
    (3006, 6, 50 ,'2023-12-01', "Lunas"),
    (3007, 7, 50 ,'2023-12-01', "Lunas"),
    (3008, 8, 50 ,'2023-12-01', "Lunas"),
    (3009, 9, 50 ,'2023-12-01', "Lunas"),
    (3010, 10, 50 ,'2023-12-01', "Lunas");
=================================================================
CREATE TABLE tr_penjualan(
    id_penjualan INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jumlah_jual INT(20) NOT NULL,
    tgl_penjualan DATE NOT NULL,
    total INT(20) NOT NULL);
    
INSERT INTO tr_penjualan VALUES
    (4001, 1, 3, '2023-01-01', 50000),
    (4002, 2, 4, '2023-01-01', 60000),
    (4003, 3, 2, '2023-01-01', 54000),
    (4004, 4, 6, '2023-01-01', 52000),
    (4005, 5, 8, '2023-01-01', 20000),
    (4006, 6, 7, '2023-01-01', 60000),
    (4007, 7, 4, '2023-01-01', 52000),
    (4008, 8, 5, '2023-01-01', 30000),
    (4009, 9, 3, '2023-01-01', 12000),
    (4010, 10, 4, '2023-01-01', 40000);
================================================================    
CREATE TABLE tr_return(
    id_return INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    id_suplyer INT(20) NOT NULL,
    jumlah_return INT(20) NOT NULL,
    tgl_return DATE NOT NULL,
    alasan ENUM ("Kadaluarsa", "Rusak", "Dll") NOT NULL);

INSERT INTO tr_return VALUES 
    (50001, 1, 1001, 3, '2024-01-01', "Rusak"),
    (50002, 2, 1002, 5, '2024-01-02', "Kadaluarsa"),
    (50003, 3, 1003, 5, '2024-01-03', "Kadaluarsa"),
    (50004, 4, 1004, 5, '2024-01-04', "Rusak"),
    (50005, 5, 1005, 5, '2024-01-05', "Kadaluarsa"),
    (50006, 6, 1006, 5, '2024-01-06', "Kadaluarsa"),
    (50007, 7, 1007, 5, '2024-01-07', "Rusak"),
    (50008, 8, 1008, 5, '2024-01-08', "Kadaluarsa"),
    (50009, 9, 1009, 5, '2024-01-09', "Kadaluarsa"),
    (50010, 10, 1010, 5, '2024-01-10', "Kadaluarsa"); 
================================================================
CREATE TABLE laporan_penjualan(
    id_transaksi INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jumlah INT(20) NOT NULL,
    harga INT(20) NOT NULL);

INSERT INTO laporan_penjualan VALUES
    (6001, 1, 2, 10000),
    (6002, 2, 3, 15000),
    (6003, 3, 5, 20000),
    (6004, 4, 6, 20000),
    (6005, 5, 4, 30000),
    (6006, 6, 3, 50000),
    (6007, 7, 2, 10000),
    (6008, 8, 4, 15000),
    (6009, 9, 7, 10000),
    (6010, 10, 8, 80000);

-- -- --  MENAMPILKAN TABEL -- -- --
SHOW TABLES;
SELECT * FROM barang;
SELECT * FROM keuangan;
SELECT * FROM laporan_penjualan;
SELECT * FROM laporan_stok;
SELECT * FROM supplier;
SELECT * FROM tr_pembelian;
SELECT * FROM tr_penjualan;
SELECT * FROM tr_return;

-- -- --  MERUBAH NAMA TABEL -- -- --
ALTER TABLE tr_return RENAME TO tr_pengembalian;

-- -- --  MENGHAPUS DATABASE -- -- --
DROP SCHEMA swalayan;

