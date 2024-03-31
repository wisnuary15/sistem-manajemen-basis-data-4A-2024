-- Database MODUL1
CREATE DATABASE modul1;

USE modul1;

CREATE TABLE `detailtransaksi` (
`Id_detail_transaksi` INT(10) NOT NULL,
`Id_Transaksi` INT(10) DEFAULT NULL,
`Nama_Barang` VARCHAR(35) DEFAULT NULL,
`Harga_Barang` INT(15) NOT NULL,
`Jumlah_Barang` INT(10) DEFAULT NULL,
`total` INT(10) DEFAULT NULL,
PRIMARY KEY (`Id_detail_transaksi`)
)

INSERT INTO `detailtransaksi` (`Id_detail_transaksi`, `Id_Transaksi`, `Nama_Barang`, `Harga_Barang`, `Jumlah_Barang`, `total`) VALUES
(1, 1, 'Sabun cair', 3000, 3, 9000),
(2, 2, 'Vas Bunga', 30000, 1, 30000),
(3, 3, 'Pasta Gigi', 5000, 4, 20000),
(4, 4, 'Minuman', 5000, 6, 30000),
(5, 5, 'Pasta Gigi', 5000, -1, -5000),
(6, 6, 'Kecap', 3000, 2, 6000),
(7, 7, 'Shampo', 8000, 1, 8000),
(8, 8, 'Minuman Soda', 5000, 4, 20000),
(9, 9, 'Mie', 2000, -2, -4000),
(10, 10, 'Bola', 30000, 1, 30000);

CREATE TABLE `keuangan` (
`Id_buku` INT(10) NOT NULL,
`Tanggal_Transaksi` DATE DEFAULT NULL,
`Jenis_Transaksi` VARCHAR(45) DEFAULT NULL,
`Total_Transaksi` INT(10) DEFAULT NULL,
PRIMARY KEY (`Id_buku`)
)

INSERT INTO `keuangan` (`Id_buku`, `Tanggal_Transaksi`, `Jenis_Transaksi`, `Total_Transaksi`) VALUES
(1, '2023-03-01', 'Penjualan', 9000),
(2, '2023-03-02', 'Pembelian dari supplier', -30000),
(3, '2023-03-03', 'Stok', -20000),
(4, '2023-03-04', 'Pembelian dari supplier', -30000),
(5, '2023-03-05', 'Koreksi Stok', -5000),
(6, '2023-03-06', 'Penjualan', 6000),
(7, '2023-03-07', 'Penjualan', 8000),
(8, '2023-03-08', 'Pembelian Barang Dari Supplier', 20000),
(9, '2023-03-09', 'Stok', -4000),
(10, '2023-03-10', 'Pengembalian Barang', -30000);

CREATE TABLE `laporan` (
`Id_Laporan` INT(10) NOT NULL,
`Tanggal_Laporan` DATE DEFAULT NULL,
`Jenis_Laporan` VARCHAR(45) DEFAULT NULL,
`Total_Laporan` INT(15) DEFAULT NULL,
PRIMARY KEY (`Id_Laporan`)
)

INSERT INTO `laporan` (`Id_Laporan`, `Tanggal_Laporan`, `Jenis_Laporan`, `Total_Laporan`) VALUES
(1, '2023-03-01', 'Penjualan', 9000),
(2, '2023-03-02', 'Pembelian Dari Supplier', 30000),
(3, '2023-03-03', 'Stok', 20000),
(4, '2023-03-04', 'Pembelian Dari Supplier', 30000),
(5, '2023-03-05', 'Koreksi Stok', 5000),
(6, '2023-03-06', 'Penjualan', 6000),
(7, '2023-03-07', 'Penjualan', 80008),
(8, '2023-03-08', 'Pembelian Barang Dari Supplier', 20000),
(9, '2023-03-09', 'Stok', 4000),
(10, '2023-03-10', 'Pengembalian Barang', 30000);

CREATE TABLE `transaksi` (
`Id_Transaksi` INT(10) NOT NULL,
`Tanggal_Transaksi` DATE DEFAULT NULL,
`Jenis_Transaksi` VARCHAR(45) DEFAULT NULL,
PRIMARY KEY (`Id_Transaksi`)
)

INSERT INTO `transaksi` (`Id_Transaksi`, `Tanggal_Transaksi`, `Jenis_Transaksi`) VALUES
(1, '2023-03-01', 'Penjualan'),
(2, '2023-03-02', 'Pengembalian Barang'),
(3, '2023-03-03', 'Stok'),
(4, '2023-03-04', 'Pembelian Barang dari Supplier'),
(5, '2023-03-05', 'Koreksi Stok'),
(6, '2023-03-06', 'Penjualan'),
(7, '2023-03-07', 'Penjualan'),
(8, '2023-03-08', 'Pembelian Barang dari Supplier'),
(9, '2023-03-09', 'Stok'),
(10, '2023-03-10', 'Pengembalian Barang ');


-- Database BENGKEL
CREATE DATABASE bengkel;

USE bengkel;

CREATE TABLE kendaraan (
id_kendaraan INT(3) NOT NULL AUTO_INCREMENT, 
jenis_kendaraan VARCHAR(30) NOT NULL,
PRIMARY KEY(id_kendaraan)
)

INSERT INTO kendaraan (jenis_kendaraan) VALUES
('mobil'),
('sepeda engkol'),
('becak');

SELECT *  FROM kendaraan;

CREATE TABLE pelanggan (
id_pelanggan INT(3) NOT NULL AUTO_INCREMENT,
nama_pelanggan VARCHAR(30) NOT NULL,
id_kendaraan INT(3) NOT NULL,
FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan),
PRIMARY KEY(id_pelanggan)
)

INSERT INTO pelanggan (nama_pelanggan, id_kendaraan) VALUES 
('rafly', 1),
('sigma', 2),
('rehan', 3);

SELECT * FROM pelanggan;

CREATE TABLE perbaikan (
id_perbaikan INT(5) NOT NULL AUTO_INCREMENT,
jenis VARCHAR(30) NOT NULL,
PRIMARY KEY(id_perbaikan)
)

INSERT INTO perbaikan (jenis) VALUES 
('oli'),
('kampas rem'),
('ban');

SELECT * FROM perbaikan;

CREATE TABLE montir (
id_montir INT(5) NOT NULL AUTO_INCREMENT,
nama_montir VARCHAR(30) NOT NULL,
id_perbaikan INT(5) NOT NULL,
FOREIGN KEY (id_perbaikan) REFERENCES perbaikan(id_perbaikan),
PRIMARY KEY(id_montir)
)

INSERT INTO montir (nama_montir, id_perbaikan) VALUES
('dani', 1),
('akmal', 2),
('birrur', 3);

SELECT * FROM montir;

CREATE TABLE transaksi (
id_transaksi INT(5) NOT NULL AUTO_INCREMENT,
id_pelanggan INT(3) NOT NULL,
id_kendaraan INT(3) NOT NULL,
id_montir INT(5) NOT NULL,
id_perbaikan INT(5) NOT NULL,
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan),
FOREIGN KEY (id_montir) REFERENCES montir(id_montir),
FOREIGN KEY (id_perbaikan) REFERENCES perbaikan(id_perbaikan),
PRIMARY KEY(id_transaksi)
)

INSERT INTO transaksi (id_pelanggan, id_kendaraan, id_montir, id_perbaikan) VALUES 
(10, 1, 1, 1), 
(11, 2, 2, 2), 
(12, 3, 3, 3);


SELECT * FROM transaksi;

DROP TABLE transaksi;
