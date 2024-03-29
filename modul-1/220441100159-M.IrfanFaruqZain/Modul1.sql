CREATE SCHEMA swalayan;

USE swalayan;

#MEMBUAT TABEL 
CREATE TABLE barang( 
    id_barang INT(20) NOT NULL PRIMARY KEY,
    nama_barang VARCHAR(50) NOT NULL,
    jmlh_stok INT(20) NOT NULL,
    hrg_jual INT (20) NOT NULL, 
    hrg_beli INT(20) NOT NULL,
    id_supplier INT(20) NOT NULL,
    FOREIGN KEY (id_supplier)REFERENCES supplier(id_supplier));
    
    
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
    FOREIGN KEY (id_stok)REFERENCES stok (id_stok));
    
CREATE TABLE stok(
    id_stok INT(20) NOT NULL PRIMARY KEY, 
    nama_barang VARCHAR(25) NOT NULL,
    stok_awal INT(20) NOT NULL,
    stok_sisa INT(20) NOT NULL);
    
CREATE TABLE pembelian(
    id_pembeli INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jmlh_beli INT(20) NOT NULL,
    tgl_pembeli DATE NOT NULL,
    kategori ENUM ("Lunas", "Hutang") NOT NULL,
    FOREIGN KEY (id_barang)REFERENCES barang (id_barang));
    
CREATE TABLE penjualan(
    id_penjual INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    jmlh_jual INT(20) NOT NULL,
    tgl_penjualan DATE NOT NULL,
    total INT(20) NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES barang (id_barang));
    
CREATE TABLE retur(
    id_retur INT(20) NOT NULL PRIMARY KEY,
    id_barang INT(20) NOT NULL,
    id_supplier INT(20) NOT NULL,
    jmlh_retur INT(20) NOT NULL,
    tgl_retur DATE NOT NULL,
    alasan ENUM ("Kadaluarsa", "Rusak", "Dll") NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
    FOREIGN KEY (id_supplier)REFERENCES supplier(id_supplier));
    

SHOW TABLES;
DROP TABLE barang;
DESC barang;
SELECT * FROM barang;
#PENGISIAN TABEL
INSERT INTO barang (`id_barang`, `nama_barang`, `jmlh_stok`, `hrg_jual`, `hrg_beli`, `id_supplier`) VALUES 
    (1, 'Rokok', 12, 25000, 24000, 2012),
    (2, 'Shampo', 20, 7000, 6500, 2011),
    (3, 'Sabun', 100, 5000, 4000, 2122),
    (4, 'Rinso', 12, 8000, 7000, 2211),
    (5, 'Permen', 14, 1000, 500, 2311),
    (6, 'Bygon', 7, 14000, 13000, 2212),
    (7, 'Mie Instan', 20, 4000, 3000, 1121),
    (8, 'Minyak', 10, 12000, 10000, 1021),
    (9, 'Lampu', 17, 14000, 12500, 1002),
    (10,'Teh Pucuk', 18, 4000, 3500, 1122);
    
INSERT INTO supplier VALUES
    (2012, "Junaidi", "Bangkalan", "Lunas"),
    (2011, "hariyanto", "Surabaya", "Lunas"),
    (2122, "Sutrisno", "Gresik", "Hutang"),
    (2211, "Darmaji", "Tuban", "Hutang"),
    (2311, "Mujib", "Surabaya", "Lunas"),
    (2212, "Mukhlis", "Sidoarjo", "Lunas"),
    (1121, "Sri Ayu", "Sidoarjo", "Hutang"),
    (1021, "Mulyani", "Gresik", "Lunas"),
    (1002, "Paijo", "Lamongan", "Hutang"),
    (1122, "Purnomo", "Surabaya", "Lunas");
SELECT * FROM keuangan;

INSERT INTO keuangan VALUES 
    (3399, 1, 10012, "Penjualan", "Hutang", '2023-03-1', 400000),
    (4433, 2, 10011, "Pembelian", "Lunas", '2023-03-02', 270000),
    (4455, 3, 10022, "Pembelian", "Hutang", '2023-03-12', 120000),
    (5544, 4, 10033, "Penjualan", "Hutang", '2023-03-11', 300000),
    (2211, 5, 10044, "Penjualan", "Lunas", '2023-03-22', 250000),
    (2233, 6, 10055, "Pembelian", "Lunas", '2023-03-15', 180000),
    (1122, 7, 10066, "Penjualan", "Hutang", '2023-03-16', 320000),
    (5533, 8, 10077, "Pembelian", "Hutang", '2023-03-18', 210000),
    (4411, 9, 10088, "Pembelian", "Lunas", '2023-03-21', 270000),
    (1155,10, 10099, "Pembelian", "Lunas", '2023-03-24', 150000);
    
SELECT * FROM keuangan;

INSERT INTO stok VALUES
    (10012, "Rokok", 50, 15),
    (10011, "Shampo", 50, 30),
    (10022, "Sabun", 50, 15),
    (10033, "Rinso", 50, 20),
    (10044, "Permen", 50, 20),
    (10055, "Bygon", 50, 15),
    (10066, "Mie instan", 50, 10),
    (10077, "Minyak", 50, 20),
    (10088, "Lampu", 50, 20),
    (10099, "Teh pucuk", 50, 10);
 
SELECT * FROM stok;

INSERT INTO pembelian VALUES
    (2001, 1, 50 ,'2023-02-22', "Lunas"),
    (2002, 2, 50 ,'2023-02-12', "Lunas"),
    (2003, 3, 50 ,'2023-02-11', "Lunas"),
    (2004, 4, 50 ,'2023-02-05', "Lunas"),
    (2005, 5, 50 ,'2023-02-21', "Lunas"),
    (2006, 6, 50 ,'2023-02-22', "Lunas"),
    (2007, 7, 50 ,'2023-02-12', "Lunas"),
    (2008, 8, 50 ,'2023-02-10', "Lunas"),
    (2009, 9, 50 ,'2023-02-25', "Lunas"),
    (2010, 10,50 ,'2023-02-17', "Lunas");
    
INSERT INTO penjualan VALUES
    (401, 1, 3, '2023-03-21', 70000),
    (402, 2, 4, '2023-03-22', 60000),
    (403, 3, 2, '2023-03-23', 55000),
    (404, 4, 6, '2023-03-24', 45000),
    (405, 5, 8, '2023-03-25', 20000),
    (406, 6, 7, '2023-03-26', 27000),
    (407, 7, 4, '2023-03-27', 44000),
    (408, 8, 5, '2023-03-28', 22000),
    (409, 9, 3, '2023-03-29', 35000),
    (410, 10,4, '2023-03-30', 52000);

INSERT INTO retur VALUES 
    (501, 1, 2012, 6, '2023-01-11', "Rusak"),
    (502, 2, 2011, 3, '2023-01-12', "Rusak"),
    (503, 3, 2122, 2, '2023-01-11', "Kadaluarsa"),
    (504, 4, 2211, 1, '2023-01-12', "Rusak"),
    (505, 5, 2311, 3, '2023-01-08', "Kadaluarsa"),
    (506, 6, 2212, 4, '2023-01-03', "Kadaluarsa"),
    (507, 7, 1121, 2, '2023-01-08', "Rusak"),
    (508, 8, 1021, 3, '2023-01-09', "Rusak"),
    (509, 9, 1002, 5, '2023-01-10', "Kadaluarsa"),
    (510,10, 1122, 3, '2023-01-12', "Rusak");


-- -- --  MENAMPILKAN TABEL -- -- --
SHOW TABLES;
SELECT * FROM barang;
SELECT * FROM keuangan;
SELECT * FROM penjualan;
SELECT * FROM stok;
SELECT * FROM supplier;
SELECT * FROM pembelian;
SELECT * FROM penjualan;
SELECT * FROM retur;

-- -- --  MERUBAH NAMA TABEL -- -- --
ALTER TABLE retur RENAME TO pengembalian;

-- -- --  MENGHAPUS DATABASE -- -- --
DROP SCHEMA swalayan;
