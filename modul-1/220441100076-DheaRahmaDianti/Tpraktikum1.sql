CREATE DATABASE tugasPraktikum1;

USE tugaspraktikum1;

SELECT * FROM penjualan;

CREATE TABLE pembeli (
id_pembeli INT(20) NOT NULL, 
nama_pembeli VARCHAR(20) NOT NULL, 
alamat_pembeli VARCHAR(40) NOT NULL, 
noTelp_pembeli INT(15) NOT NULL, 
PRIMARY KEY(id_pembeli));

ALTER TABLE pembeli MODIFY COLUMN noTelp_pembeli VARCHAR(15);

UPDATE pembeli SET noTelp_pembeli = '085763221945' WHERE id_pembeli = 129;

INSERT INTO pembeli VALUES(
120, 'Dhea Rahma', 'Bojonegoro', 085745631833),
(121, 'Revalina Kawindra', 'Sidoarjo', 087654372937),
(122, 'Aditya Kusuma', 'Nganjuk', 085764536271),
(123, 'Cindy Permata', 'Pasuruan', 085624537817),
(124, 'Devi Dwi N', 'Lamongan', 081345678728),
(125, 'Nisaur Rohmah', 'Nganjuk', 082334568490),
(126, 'Hasnah Insita', 'Sidoarjo', 082567432564),
(127, 'Nadia Aprilia', 'Nganjuk', 085676433002),
(128, 'Afita Dwi', 'Bojonegoro', 082399006757),
(129, 'Nadiya Adriana', 'Jambi', 0857632219454);

DROP TABLE penjualan;

ALTER TABLE penjualan DROP COLUMN status_pembayaran;

SELECT * FROM penjualan;

CREATE TABLE penjualan (
id_jual INT(20) NOT NULL, 
id_pembeli INT(20) NOT NULL,
tgl_penjualan DATE NOT NULL,  
id_barang INT(20) NOT NULL, 
jml_barang INT(30) NOT NULL, 
harga_satuanbrg INT(20) NOT NULL, 
total_harga INT(30) NOT NULL, 
metode_bayar VARCHAR(10) NOT NULL,
PRIMARY KEY (id_jual),
FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli),
FOREIGN KEY (id_barang) REFERENCES stok(id_barang));

ALTER TABLE penjualan CHANGE COLUMN harga_satuanbrg harga_barang INT;

INSERT INTO penjualan VALUES(
111, 120, '2024-02-28', 01, 6, 20000, 120000,'Cash'),
(112, 121, '2024-03-08', 02, 8, 18000, 144000, 'Cash'),
(113, 122, '2024-02-14', 03, 10, 45000, 450000, 'Transfer'),
(114, 123, '2024-04-23', 04, 15, 45000, 675000, 'Transfer'),
(115, 124, '2024-03-30', 05, 5, 200000, 1000000, 'Cash'),
(116, 125, '2024-04-11', 06, 12, 180000, 2160000, 'Transfer'),
(117, 126, '2024-05-24', 07, 7, 225000, 1575000, 'Transfer'),
(118, 127, '2024-02-21', 08, 20, 170000, 3400000, 'Transfer'),
(119, 128, '2024-06-07', 09, 5, 185000, 925000, 'Cash'),
(120, 129, '2024-05-13', 10, 4, 150000, 600000, 'Cash');

ALTER TABLE penjualan ADD status_pembayaran VARCHAR(20);

CREATE TABLE stok (
id_barang INT(20) NOT NULL, 
nama_barang VARCHAR(20) NOT NULL, 
harga_barang INT(30) NOT NULL,
jml_tersedia INT(20) NOT NULL,
PRIMARY KEY(id_barang));

INSERT INTO stok VALUES (
01, 'Jilbab Paris Premium', 20000, 130),
(02, 'Jilbab Bella Square', 18000, 200),
(03, 'Jilbab Pashmina Ceruty', 45000, 180),
(04, 'Jilbab Pashmina Kaos', 45000, 150),
(05, 'Gamis Wanita', 200000, 500),
(06, 'Baju Koko', 180000, 300),
(07, 'Mukena Wanita', 225000, 350),
(08, 'Sarung Batik', 170000, 200),
(09, 'Mukena Terusan', 185000, 100),
(10, 'Baju anak-anak', 150000, 320);

UPDATE stok SET harga_barang = '150000' WHERE id_barang = 10;

DROP INDEX  ON mahasiswa(nim)

CREATE TABLE supplier (
id_supplier INT(20) NOT NULL, 
nama_supplier VARCHAR(20) NOT NULL, 
alamat_supplier VARCHAR(40) NOT NULL, 
noTelp_supplier INT(15) NOT NULL,
jmlHutang_supplier INT(20),
PRIMARY KEY(id_supplier));

ALTER TABLE supplier MODIFY COLUMN noTelp_supplier VARCHAR(15);

INSERT INTO supplier VALUES(
221, 'ChicStyle Wear', 'Bandung', 085765433345, 200000),
(222, 'EliteCloth Creations', 'Surabaya', 081346857577, 350000),
(223, 'StyleSavvy Wardrobe', 'Semarang', 087786536741, 0),
(224, 'VogueVenture Garments', 'Bekasi', 082298765544, 120000),
(225, 'TrendyThreads Apparel', 'Depok', 081556798998, 215000),
(226, 'EliteCloth Creations', 'Tangerang', 086657638733, 505000),
(227, 'FabulousFabric Fashion', 'Bogor', 081445673822, 430000),
(228, 'CoutureCraft Clothing', 'Jakarta Pusat', 085788300441, 213000),
(229, 'GlamourGrove Apparel', 'Batam', 081123889595, 0),
(230, 'ModishMania Clothing Co', 'Jakarta Selatan', 083452211054, 320000);

UPDATE supplier SET noTelp_supplier = '083452211054' WHERE id_supplier = 230;

CREATE TABLE retur (
id_retur INT(20) NOT NULL,
id_barang INT(20) NOT NULL,
id_jual INT(20) NOT NULL,
tgl_retur DATE NOT NULL,
jml_retur INT(20) NOT NULL,
PRIMARY KEY(id_retur),
FOREIGN KEY (id_jual) REFERENCES penjualan(id_jual),
FOREIGN KEY (id_barang) REFERENCES stok(id_barang));

INSERT INTO retur VALUES(
311, 01, 111, '2024-01-17', 2),
(312, 02, 112, '2024-01-23', 0),
(313, 03, 113, '2024-01-29', 1),
(314, 04, 114, '2024-01-31', 3),
(315, 05, 115, '2024-02-03', 0),
(316, 06, 116, '2024-02-09', 0),
(317, 07, 117, '2024-02-15', 1),
(318, 08, 118, '2024-02-25', 2),
(319, 09, 119, '2024-02-19', 2),
(320, 10, 120, '2024-02-29', 0);

CREATE TABLE pembelian (
id_beli INT(20) NOT NULL,
tgl_beli DATE NOT NULL,
id_supplier INT(20) NOT NULL,
id_barang INT(20) NOT NULL,
total_harga INT(30) NOT NULL,
nominal INT(30) NOT NULL,
status_bayar ENUM ("Lunas", "Hutang"),
PRIMARY KEY(id_beli),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
FOREIGN KEY (id_barang) REFERENCES stok(id_barang));

INSERT INTO pembelian VALUES(
441, '2024-01-24', 221, 01, 320000, 120000, 'Hutang'),
(442, '2024-01-28', 222, 02, 680000, 330000, 'Hutang'),
(443, '2024-02-07', 223, 03, 430000, 450000, 'Lunas'),
(444, '2024-02-10', 224, 04, 220000, 100000, 'Hutang'),
(445, '2024-02-12', 225, 05, 415000, 200000, 'Hutang'),
(446, '2024-03-15', 226, 06, 605000, 100000, 'Hutang'),
(447, '2024-03-23', 227, 07, 580000, 150000, 'Hutang'),
(448, '2024-03-25', 228, 08, 413000, 200000, 'Hutang'),
(449, '2024-03-28', 229, 09, 553000, 560000, 'Lunas'),
(450, '2024-03-30', 230, 10, 460000, 240000, 'Hutang');

CREATE TABLE koreksi_stok(
id_koreksi INT(20) NOT NULL,
tgl_koreksi DATE NOT NULL,
id_barang INT(20) NOT NULL,
stok_awal INT(20) NOT NULL,
stok_masuk INT(20) NOT NULL,
stok_keluar INT(20) NOT NULL,
stok_akhir INT(20) NOT NULL,
PRIMARY KEY(id_koreksi),
FOREIGN KEY (id_barang) REFERENCES stok(id_barang));

DROP TABLE pembelian;

ALTER TABLE supplier MODIFY COLUMN noTelp_supplier VARCHAR(15);

INSERT INTO koreksi_stok VALUES(
511, '2024-03-04', 01, 130, 150, 6, 274),
(512, '2024-03-05', 02, 200, 100, 8, 292),
(513, '2024-03-06', 03, 180, 50, 10, 220),
(514, '2024-03-07', 04, 150, 110, 15, 245),
(515, '2024-03-08', 05, 500, 80, 5, 575),
(516, '2024-03-09', 06, 300, 60, 12, 348),
(517, '2024-03-10', 07, 350, 10, 7, 353),
(518, '2024-03-11', 08, 200, 55, 20, 235),
(519, '2024-03-12', 09, 100, 90, 5, 185),
(520, '2024-03-13', 10, 320, 10, 4, 326);

