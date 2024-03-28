CREATE DATABASE swalayan;
USE swalayan;

CREATE TABLE pelanggan (
id_pelanggan INT (11) NOT NULL 
nama_pelanggan VARCHAR (255) NOT NULL ,
PRIMARY KEY (id_pelanggan)
);

CREATE TABLE penjualan (
id_penjualan INT (11) NOT NULL,
id_pelanggan INT (11) NOT NULL,
tgl_penjualan DATE,
total_harga_penjualan INT (15) NOT NULL,
PRIMARY KEY (id_penjualan)
);

CREATE TABLE retur (
id_retur INT (11) NOT NULL ,
id_pelanggan INT (11) NOT NULL,
id_barang INT (11) NOT NULL,
tgl_retur DATE,
alasan_retur VARCHAR (255) NOT NULL,
PRIMARY KEY (id_retur)
);

CREATE TABLE detail_penjualan (
id_detail INT (11) NOT NULL,
id_penjualan INT (11) NOT NULL,
id_barang INT (11) NOT NULL,
jumlah_beli INT (11) NOT NULL,
PRIMARY KEY (id_detail)
);

CREATE TABLE manajemen_stok (
id_stok INT (11) NOT NULL,
id_barang INT (11) NOT NULL, 
jumlah_lama INT (11) NOT NULL,
jumlah_baru INT (11) NOT NULL,
PRIMARY KEY (id_stok)
);

CREATE TABLE barang (
id_barang INT (11) NOT NULL,
nama_barang VARCHAR (255) NOT NULL,
harga_jual INT (11) NOT NULL,
stok INT (11) NOT NULL,
PRIMARY KEY (id_barang)
);

CREATE TABLE supplier (
id_supplier INT (11) NOT NULL,
nama_supplier VARCHAR (255) NOT NULL,
alamat VARCHAR (255) NOT NULL,
PRIMARY KEY (id_supplier)
);

CREATE TABLE status_pembayaran (
id_status INT (11) NOT NULL,
keterangan VARCHAR (255) NOT NULL, 
PRIMARY KEY (id_status)
);

CREATE TABLE pembelian (
id_pembelian INT (11) NOT NULL,
id_barang INT(11) NOT NULL,
id_supplier INT (11) NOT NULL,
tgl_beli DATE,
jumlah INT (15) NOT NULL,
total_harga INT (15) NOT NULL,
id_status INT (11) NOT NULL,
PRIMARY KEY (id_pembelian)
);

CREATE TABLE status_pembayaran (
id_status INT (11) NOT NULL,
keterangan VARCHAR (255) NOT NULL, 
RIMARY KEY (id_status)
);

ALTER TABLE penjualan
ADD CONSTRAINT id_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan);


ALTER TABLE retur
ADD CONSTRAINT fk_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
ADD CONSTRAINT id_barang FOREIGN KEY (id_barang) REFERENCES barang(id_barang);

ALTER TABLE detail_penjualan
ADD CONSTRAINT id_penjualan FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan),
ADD CONSTRAINT fk_barang FOREIGN KEY (id_barang) REFERENCES barang(id_barang);

ALTER TABLE manajemen_stok
ADD CONSTRAINT barang FOREIGN KEY (id_barang) REFERENCES barang(id_barang);

ALTER TABLE detail_penjualan
ADD CONSTRAINT barang_fk FOREIGN KEY (id_barang) REFERENCES barang(id_barang), 
ADD CONSTRAINT id_supplier FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
ADD CONSTRAINT id_status FOREIGN KEY (id_status) REFERENCES status_pembayaran(id_status);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan) VALUE (101, "Sabil"), (102, "Dani"), (103, "Nasikh"), (104, "Endra"), (105, "Faril"), (106, "Wisnu"), (107, "Sandi"), (108, "Fikri"),(109, "Martin"), (110, "Mahsus");

INSERT INTO penjualan (id_penjualan, id_pelanggan, tgl_penjualan, total_harga_penjualan) VALUES (201, 101, '2024-03-26', 150), (202, 101, '2024-03-27', 200), (203, 102, '2024-03-27', 300), (204, 103, '2024-03-28', 250),(205, 104, '2024-03-29', 180), (206, 105, '2024-03-30', 220), (207, 106, '2024-03-31', 350), (208, 107, '2024-04-01', 280), (209, 108, '2024-04-02', 190), (210, 109, '2024-04-03', 400),(211, 110, '2024-04-04', 270);

INSERT INTO retur (id_retur, id_pelanggan, id_barang, tgl_retur, alasan_retur) VALUES
(301, 101, 601, '2024-03-01', 'Barang rusak'), 
(302, 102, 602, '2024-03-02', 'Barang salah kirim'),
(303, 103, 603, '2024-03-03', 'Barang tidak sesuai pesanan'),
(304, 104, 604, '2024-03-04', 'Barang rusak'), 
(305, 105, 605, '2024-03-05', 'Barang rusak'); 


INSERT INTO detail_penjualan (id_detail, id_penjualan, id_barang, jumlah) VALUES
(401, 201, 601, 5), (402, 202, 602, 3), (403, 203, 603, 2), (404, 204, 604, 4), (405, 205, 605, 6),
(406, 206, 606, 5), (407, 207, 607, 3), (408, 208, 608, 4), (409, 209, 609, 2), (410, 210, 610, 3),
(411, 211, 601, 3), (412, 211, 610, 4);

INSERT INTO manajemen_stok (id_stok, id_barang, jumlah_lama, jumlah_baru) VALUES
(501, 601, 80, 70), (502, 602, 120, 110),(503, 603, 70, 60), (504, 604, 90, 80), (505, 605, 180, 170),
(506, 606, 85, 75), (507, 607, 105, 95), (508, 608, 65, 55), (509, 609, 90, 80), (510, 610, 50, 40);

INSERT INTO barang (id_barang, nama_barang, harga_jual, stok) VALUES 
(601, 'Sabun Mandi', 5000, 100), (602, 'Sikat Gigi', 3000, 150), (603, 'Shampoo', 10000, 80), (604, 'Pasta Gigi', 6000, 120), 
(605, 'Tisu Basah', 2000, 200), (606, 'Sikat Pembersih', 7000, 90), (607, 'Sikat Kuku', 4000, 110), (608, 'Pewangi Pakaian', 12000, 70), 
(609, 'Krim Pembersih Wajah', 8000, 100), (610, 'Pelembut Pakaian', 15000, 60);

INSERT INTO supplier (id_supplier, nama_supplier, alamat) VALUES
(701, 'Supplier A', 'Jalan Raya Jati No. 123, Sidoarjo'),
(702, 'Supplier B', 'Jalan Mayjen Sungkono No. 456, Surabaya'),
(703, 'Supplier C', 'Jalan Kertajaya Indah No. 789, Surabaya'),
(704, 'Supplier D', 'Jalan Pahlawan No. 101, Sidoarjo'),
(705, 'Supplier E', 'Jalan Kayoon No. 202, Surabaya'),
(706, 'Supplier F', 'Jalan Raya Juanda No. 303, Sidoarjo'),
(707, 'Supplier G', 'Jalan Darmo No. 404, Surabaya'),
(708, 'Supplier H', 'Jalan Diponegoro No. 505, Sidoarjo'),
(709, 'Supplier I', 'Jalan Ketintang No. 606, Surabaya'),
(710, 'Supplier J', 'Jalan Ahmad Yani No. 707, Sidoarjo');

INSERT INTO pembelian (id_pembelian, id_supplier, id_barang, tgl_beli, jumlah, total_harga, id_status) VALUES
(801, 701, 601, '2024-03-01', 50, 250000, 901), (802, 702, 602, '2024-03-02', 30, 90000, 902), (803, 703, 603, '2024-03-03', 20, 200000, 901), 
(804, 704, 604, '2024-03-04', 40, 240000, 902), (805, 701, 605, '2024-03-05', 60, 120000, 901), (806, 702, 606, '2024-03-06', 25, 175000, 901), 
(807, 703, 607, '2024-03-07', 35, 140000, 902), (808, 704, 608, '2024-03-08', 45, 540000, 901), (809, 701, 609, '2024-03-09', 55, 440000, 902), 
(810, 702, 610, '2024-03-10', 10, 150000, 901), (811, 701, 601, '2024-03-11', 10, 440000, 901), (812, 702, 602, '2024-03-11', 50, 150000, 901); 

INSERT INTO status_pembayaran (id_status, keterangan) VALUES 
(901, "Lunas"), (902, "Hutang");

SELECT * FROM barang;
SELECT * FROM detail_penjualan;
SELECT * FROM manajemen_stok;
SELECT * FROM pelanggan;
SELECT * FROM pembelian;
SELECT * FROM penjualan;
SELECT * FROM retur;
SELECT * FROM status_pembayaran;
SELECT * FROM supplier;

ALTER TABLE pelanggan RENAME TO customer;
SELECT * FROM customer;