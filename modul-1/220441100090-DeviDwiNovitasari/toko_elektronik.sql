CREATE DATABASE toko_elektronik;
USE toko_elektronik;
CREATE TABLE supplier(
id_supplier INT(20) NOT NULL,
nama_supplier VARCHAR(50) NOT NULL,
alamat VARCHAR(50) NOT NULL,
no_telp VARCHAR(20) NOT NULL,
hutang_ke_supplier INT(20) NOT NULL,
PRIMARY KEY (id_supplier)
);
CREATE TABLE barang(
id_barang INT(20) NOT NULL,
nama_barang VARCHAR(20) NOT NULL,
stok INT(20) NOT NULL,
harga_jual INT(20) NOT NULL,
harga_beli INT(20) NOT NULL,
id_supplier INT(20) NOT NULL,
PRIMARY KEY (id_barang),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);
CREATE TABLE pembelian(
id_pembelian INT(20) NOT NULL,
id_barang INT(20) NOT NULL,
jumlah_beli INT(20) NOT NULL,
total_beli INT(20) NOT NULL,
tgl_beli DATE,
PRIMARY KEY (id_pembelian),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
);
CREATE TABLE penjualan(
id_penjualan INT(20) NOT NULL,
id_barang INT(20) NOT NULL,
jumlah_jual INT(20) NOT NULL,
total_jual INT(20) NOT NULL,
tgl_jual DATE,
PRIMARY KEY (id_penjualan),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
);
CREATE TABLE laporan_stok(
id_stok INT(20) NOT NULL, 
id_barang INT(20) NOT NULL,
stok_awal INT(20) NOT NULL,
sisa INT(20) NOT NULL,
PRIMARY KEY (id_stok),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
);
CREATE TABLE retur_barang(
id_retur INT(20) NOT NULL,
id_barang INT(20) NOT NULL,
id_supplier INT(20) NOT NULL,
jumlah_retur INT(20) NOT NULL,
tgl_retur DATE,
alasan VARCHAR(100) NOT NULL,
PRIMARY KEY (id_retur),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);
CREATE TABLE keuangan(
id_keuangan INT(20) NOT NULL,
id_supplier INT(20) NOT NULL,
tanggal DATE,
kondisi ENUM ("Lunas","Hutang"),
nominal INT(20) NOT NULL,
PRIMARY KEY (id_keuangan),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);
CREATE TABLE pelanggan(
id_pelanggan INT(20) NOT NULL,
nama_pelanggan VARCHAR(40) NOT NULL,
alamat VARCHAR(40) NOT NULL,
no_telp VARCHAR(20) NOT NULL,
barangYgDibeli VARCHAR(40) NOT NULL,
total_pembelian INT(20) NOT NULL,
PRIMARY KEY (id_pelanggan)
);
INSERT INTO supplier VALUES
(111, 'PT.Merkurius', 'Jakarta', '089529775235', 200000),
(112, 'PT.Venus', 'Bandung', '089529753775', 350000),
(113, 'PT.Bumi', 'Semarang', '082098762345', 2000000),
(114, 'PT.Mars', 'Surabaya', '089504578321', 250000),
(115, 'PT.Jupiter', 'Lamongan', '081409754278', 150000),
(116, 'PT.Saturnus', 'Palembang', '085615897256', 355000),
(117, 'PT.Uranus', 'Banten', '083908976789', 180000),
(118, 'PT.Neptunus', 'Solo', '089527890543', 900000),
(119, 'PT.Bulan', 'Sidoarjo', '082309877890', 9000000),
(120, 'PT.Bintang', 'Bangkalan', '081567541234', 2300000);
SELECT * FROM tbl_supplier;

INSERT INTO barang VALUES
(11, 'Blender', 10, 329000, 280000, 111),
(12, 'Setrika', 12, 129000, 100000, 112),
(13, 'Hair Dryer', 20, 229000, 200000, 113),
(14, 'Air Fryer', 15, 529000, 500000, 114),
(15, 'Mesin Cuci', 10, 1499000, 1300000, 115),
(16, 'Catokan Rambut', 12, 129000, 100000, 116),
(17, 'Kulkas', 5, 1849000, 1500000, 117),
(18, 'Microwave', 15, 1195000, 1000000, 118),
(19, 'Rice Cooker', 20, 569000, 450000, 119),
(20, 'Mixer', 15, 329000, 250000, 120);
SELECT * FROM barang;

INSERT INTO pembelian VALUES
(21, 11, 5, 1400000, '2023-12-13'),
(22, 12, 3, 300000, '2023-11-11'),
(23, 13, 6, 1200000, '2023-09-18'),
(24, 14, 2, 1000000, '2023-09-09'),
(25, 15, 5, 6500000, '2023-10-07'),
(26, 16, 2, 200000, '2023-07-23'),
(27, 17, 6, 9000000, '2023-12-06'),
(28, 18, 7, 7000000, '2023-11-05'),
(29, 19, 7, 3150000, '2023-08-19'),
(30, 20, 3, 750000, '2023-12-29');
SELECT * FROM pembelian;

INSERT INTO penjualan VALUES
(31, 11, 2, 658000, '2024-03-18'),
(32, 12, 3, 387000, '2024-03-01'),
(33, 13, 1, 229000, '2024-03-11'),
(34, 14, 1, 529000, '2024-03-21'),
(35, 15, 5, 7495000, '2024-03-22'),
(36, 16, 2, 258000, '2024-03-14'),
(37, 17, 3, 5547000, '2024-03-09'),
(38, 18, 4, 4000000, '2024-03-19'),
(39, 19, 2, 900000, '2024-03-02'),
(40, 20, 1, 250000, '2024-03-17');
SELECT * FROM penjualan;

INSERT INTO laporan_stok VALUES
(121, 11, 10, 8),
(122, 12, 12, 9),
(123, 13, 20, 19),
(124, 14, 15, 14),
(125, 15, 10, 5),
(126, 16, 12, 10),
(127, 17, 5, 2),
(128, 18, 15, 11),
(129, 19, 20, 18),
(130, 20, 15, 14);
SELECT * FROM laporan_stok;

INSERT INTO retur_barang VALUES
(1111, 11, 111, 2, '2024-01-02', 'barang rusak'),
(1112, 12, 112, 1, '2024-01-02', 'barang palsu'),
(1113, 13, 113, 1, '2024-01-23', 'barang palsu'),
(1114, 14, 114, 2, '2024-01-04', 'barang rusak'),
(1115, 15, 115, 1, '2024-01-03', 'barang salah'),
(1116, 16, 116, 2, '2024-01-10', 'barang salah'),
(1117, 17, 117, 3, '2024-01-12', 'barang rusak'),
(1118, 18, 118, 1, '2024-01-11', 'barang rusak'),
(1119, 19, 119, 1, '2024-01-05', 'barang rusak'),
(1120, 20, 120, 1, '2024-01-09', 'barang rusak');
SELECT * FROM retur_barang;

INSERT INTO keuangan VALUES
(151, 111, '2024-02-10', 'Hutang', 200000),
(152, 112, '2024-02-11', 'Lunas', 350000),
(153, 113, '2024-02-12', 'Hutang', 2000000),
(154, 114, '2024-02-10', 'Lunas', 250000),
(155, 115, '2024-02-09', 'Lunas', 150000),
(156, 116, '2024-02-08', 'Hutang', 355000),
(157, 117, '2024-02-12', 'Lunas', 180000),
(158, 118, '2024-02-11', 'Lunas', 900000),
(159, 119, '2024-02-10', 'Lunas', 9000000),
(160, 120, '2024-02-05', 'Hutang', 2300000);
SELECT * FROM keuangan;

INSERT INTO pelanggan VALUES
(2201, 'Devi Deee', 'Lamongan', '089509808976', 'Setrika 1, Mesin Cuci 1', 1429000),
(2202, 'Nizar Akhdan', 'Jombang', '081376540987', 'Blender 1, Microwave 2', 2719000),
(2203, 'Dedy Eka', 'Jakarta', '082309123456', 'Mixer 1, Mesin Cuci 1', 1828000),
(2204, 'Arvan Denanta', 'Kediri', '081412345678', 'Setrika 1, Blender 1', 458000),
(2205, 'Eri Nana', 'Madiun', '089123456543', 'Hair Dryer 1, Mesin Cuci 1', 1728000),
(2206, 'Susiati', 'Malang', '086289765432', 'Air Fryer 1, Mesin Cuci 1, Rice Cooker 1', 2597000),
(2207, 'Yolinda Asti', 'Sidoarjo', '0899265433456', 'Catokan Rambut 1, Mesin Cuci 1, Microwave 1', 2823000),
(2208, 'Haris Zidan', 'Surabaya', '089517899065', 'Kulkas 1, Setrika 1, Microwave 1', 3173000),
(2209, 'Nabilla Putri', 'Pasuruan', '082367544567', 'Catokan Rambut 1, Kulkas 1', 1978000),
(2210, 'Ratna Kusuma`electronic_store`', 'Pamekasan', '081234567892', 'Kulkas 1, Rice Cooker 1', 2418000);
SELECT * FROM pelanggan;

DESC barang;
ALTER TABLE pelanggan CHANGE COLUMN id_pelanggan ID_PELANGGAN INT;
ALTER TABLE barang MODIFY COLUMN stok INT(30) NOT NULL;
RENAME TABLE supplier TO tbl_supplier;
DROP DATABASE toko_elektronik;