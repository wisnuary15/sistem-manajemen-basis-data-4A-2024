CREATE DATABASE tugaspraktikum1;

USE tugaspraktikum1;

CREATE TABLE transaksi(
Id_Transaksi INT(5) NOT NULL,
id_stokbarang INT (5) NOT NULL,
tipe_transaksi VARCHAR(50) NOT NULL,
waktu_transaksi DATE,
harga_perunit INT(50) NOT NULL,
total_harga INT(50) NOT NULL,
PRIMARY KEY(Id_transaksi),
FOREIGN KEY (id_stokbarang) REFERENCES stok_barang(id_stokbarang)
);

DROP TABLE transaksi;
DESC transaksi;

ALTER TABLE transaksi ADD jumlah_barang INT (20);


CREATE TABLE stok_barang(
id_stokbarang INT(5) NOT NULL,
nama_barang VARCHAR(20) NOT NULL,
jumlah_stokbarang INT(5) NOT NULL,
harga_beli INT(20) NOT NULL,
harga_jual INT(20) NOT NULL,
PRIMARY KEY(id_stokbarang)
);

DESC stok_barang;

CREATE TABLE koreksi_stok(
id_koreksi INT(5) NOT NULL,
id_stokbarang INT(5) NOT NULL,
jumlah_sebelum INT(20) NOT NULL,
jumlah_sesudah INT(20) NOT NULL,
waktu_koreksi DATE,
PRIMARY KEY (id_koreksi),
FOREIGN KEY (id_stokbarang) REFERENCES stok_barang(id_stokbarang)
);
DROP TABLE koreksi_stok;

DESC koreksi_stok;

CREATE TABLE pembelian(
id_pembelian INT(5) NOT NULL,
id_supplier INT(5) NOT NULL,
id_stokbarang INT(5),
waktu_pembelian DATE,
jumlah_beli INT(20) NOT NULL,
total_hargabeli INT(20) NOT NULL,
nama_belibarang VARCHAR(50),
PRIMARY KEY (id_pembelian),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
FOREIGN KEY (id_stokbarang) REFERENCES stok_barang(id_stokbarang)
);

DROP TABLE pembelian;
DESC pembelian;

CREATE TABLE keuangan(
id_keuangan INT(5) NOT NULL,
id_transaksi INT(50) NOT NULL,
nominal INT(20) NOT NULL,
jenis_akun VARCHAR(30) NOT NULL,
PRIMARY KEY (id_keuangan),
FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
);
DROP TABLE keuangan;
DESC keuangan;

ALTER TABLE keuangan MODIFY COLUMN id_transaksi INT(5) NOT NULL;
ALTER TABLE keuangan CHANGE COLUMN id_transaksi Id_transaksi INT;

CREATE TABLE supplier(
id_supplier INT(5) NOT NULL,
nama_supplier VARCHAR(30) NOT NULL,
alamat_supplier VARCHAR(40) NOT NULL,
nomor_telpsup INT(20) NOT NULL,
PRIMARY KEY (id_supplier)
);
ALTER TABLE supplier MODIFY COLUMN nomor_telpsup INT(25);

DESC supplier;

SELECT id_stokbarang, nama_barang, jumlah_stokbarang, harga_beli
FROM stok_barang;

SELECT *
FROM stok_barang
WHERE jumlah_stokbarang < 0;

INSERT INTO transaksi VALUES 
(001, 201, 'penjualan', '2024-01-01', 5000, 5000, 1),
(002, 202, 'penjualan', '2024-01-05', 8000, 8000, 1),
(003, 203, 'penjualan', '2024-01-08', 10000, 10000, 1),
(004, 204, 'pembelian', '2024-02-01', 5000, 25000, 5),
(005, 205, 'pembelian', '2024-02-18', 10000, 50000, 5),
(006, 206, 'pembelian', '2024-02-21', 2000, 20000, 10),
(007, 207, 'pengembalian', '2024-02-25', 10000, 60000, 6),
(008, 207, 'pengembalian', '2024-03-5', 5000, 30000, 5),
(009, 209, 'pengembalian', '2024-03-6', 10000, 30000, 3),
(010, 210, 'penjualan', '2024-03-8', 2000, 14000, 7);

SELECT * FROM transaksi;

INSERT INTO stok_barang VALUES 
(201, 'pensil', 49, 4000, 5000),
(202, 'rautan', 49, 7000, 8000),
(203, 'stabilo', 49, 9000, 10000),
(204, 'bolpoin', 50, 4000, 5000),
(205, 'staples', 50, 9000, 10000),
(206, 'penghapus', 50, 4000, 5000),
(207, 'buku', 44, 9000, 10000),
(208, 'penggaris', 43, 4000, 5000),
(209, 'buku_gambar', 47, 4000, 5000),
(210, 'tipx', 43, 4000, 5000);

INSERT INTO koreksi_stok VALUES
(301, 201, 50, 49, '2024-03-10'),
(302, 202, 50, 49, '2024-03-10'),
(303, 203, 50, 49, '2024-03-10'),
(304, 204, 49, 50, '2024-03-11'),
(305, 205, 50, 49, '2024-03-11'),
(306, 206, 50, 49, '2024-03-11'),
(307, 207, 50, 44, '2024-03-12'),
(308, 208, 50, 43, '2024-03-12'),
(309, 209, 50, 47, '2024-03-12'),
(310, 210, 50, 43, '2024-03-13');

INSERT INTO  pembelian VALUES
(401, 501, 201, '2024-03-14', 5, 20000, 'pensil'),
(402, 502, 202, '2024-03-14', 5, 35000, 'rautan'),
(403, 503, 203, '2024-03-14', 5, 45000, 'stabilo'),
(404, 504, 204, '2024-03-14', 5, 20000, 'bolpoin'),
(405, 505, 205, '2024-03-14', 5, 45000, 'staples'),
(406, 506, 206, '2024-03-15', 5, 20000, 'penghapus'),
(407, 507, 207, '2024-03-15', 5, 45000, 'buku'),
(408, 508, 208, '2024-03-16', 5, 20000, 'penggaris'),
(409, 509, 209, '2024-03-17', 5, 20000, 'buku_gambar'),
(410, 510, 210, '2024-03-18', 5, 20000, 'tipx');

INSERT INTO keuangan VALUES
(601,001, 5000, 'penjualan'),
(602,002, 8000, 'penjualan'),
(603,003, 10000, 'penjualan'),
(604,004, 25000, 'hutang'),
(605,005, 50000, 'hutang'),
(606,006, 20000, 'hutang'),
(607,007, 60000, 'hutang'),
(608,008, 30000, 'hutang'),
(609,009, 30000, 'hutang'),
(610,010, 14000, 'penjualan');

INSERT INTO supplier VALUES
(501, 'putri', 'nganjuk', 0858500809),
(502, 'dinda', 'pacitan', 0858580545),
(503, 'aurel', 'sampang', 0858580467),
(504, 'dimas', 'pamekasan', 0858500235),
(505, 'dani', 'lamongan', 0858500784),
(506, 'angga', 'bangkalan', 0858527489),
(507, 'nana', 'madiun', 0858581429),
(508, 'tria', 'malang', 0858589689),
(509, 'galuh', 'magetan', 0858534789),
(510, 'feby', 'sidoarjo', 08585097409);


SELECT * FROM transaksi;
SELECT * FROM stok_barang;
SELECT * FROM koreksi_stok;
SELECT * FROM keuangan;
SELECT * FROM pembelian;
SELECT * FROM pemasok;

ALTER TABLE supplier RENAME TO pemasok;

DESC supplier;

DROP TABLE supplier;

ALTER TABLE `pembelian` DROP FOREIGN KEY `pembelian_ibfk_1`;
ALTER TABLE `pembelian` ADD  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `pemasok`(`id_supplier`) ON DELETE RESTRICT ON UPDATE RESTRICT;
 
SELECT * FROM pemasok;