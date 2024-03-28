CREATE swalayan;
USE swalayan;
CREATE TABLE barang( 
    id_barang INT(20) NOT NULL PRIMARY KEY,
    nama_barang VARCHAR(50) NOT NULL,
    jmlh_stok INT(20) NOT NULL,
    hrg_jual INT (20) NOT NULL, 
    hrga_beli INT(20) NOT NULL,
    id_supplier INT(20) NOT NULL,
    FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier));
    
    DROP TABLE barang;
    DESC barang;

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
    tanggal_keuangan DATE NOT NULL,
    harga_total INT(20) NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
    FOREIGN KEY (id_stok) REFERENCES laporan_stok(id_stok));
    
    DROP TABLE keuangan;
    DESC keuangan;
    
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
    kategori ENUM ("Lunas", "Hutang") NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang));
    
    DROP TABLE tr_pembelian;
    DESC tr_pembelian;
    
CREATE TABLE tr_penjualan(
    id_penjualan INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jmlh_jual INT(20) NOT NULL,
    tgl_penjualan DATE NOT NULL,
    total INT(20) NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang));
    
    DROP TABLE tr_penjualan;
    DESC tr_penjualan;
    
    
CREATE TABLE laporan_penjualan(
    id_transaksi INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jmlh INT(20) NOT NULL,
    harga INT(20) NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang));
    
    DROP TABLE tr_penjualan;
    DESC laporan_penjualan;
    

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
    (10001, "Ahmad", "Bangkalan", "Lunas"),
    (10002, "Budi", "Sampang", "Hutang"),
    (10003, "Cinta", "Pamekasan", "Lunas"),
    (10004, "Dian", "Sumenep", "Hutang"),
    (10005, "Eka", "Surabaya", "Lunas"),
    (10006, "Fajar", "Sidoarjo", "Lunas"),
    (10007, "Gita", "Gresik", "Hutang"),
    (10008, "Hadi", "Lamongan", "Lunas"),
    (10009, "Indah", "Tuban", "Lunas"),
    (10010, "Joko", "Bojonegoro", "Lunas");

INSERT INTO tr_pembelian values
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

INSERT INTO tr_penjualan values
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

INSERT INTO tr_return values 
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

INSERT INTO laporan_penjualan values
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
    
SHOW TABLES;
SELECT * FROM barang;
SELECT * FROM keuangan;
SELECT * FROM laporan_penjualan;
SELECT * FROM laporan_stok;
SELECT * FROM supplier;
SELECT * FROM tr_pembelian;
SELECT * FROM tr_penjualan;

ALTER TABLE supplier RENAME pengepul;	


