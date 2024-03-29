CREATE DATABASE Tokoswalayan;
USE Tokoswalayan;
CREATE TABLE transaksi(
  Id_Transaksi INT(10) NOT NULL,
  Tanggal_Transaksi DATE DEFAULT NULL,
  Jenis_Transaksi VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (Id_Transaksi)
);

INSERT INTO transaksi VALUES 
(1, '2024-03-01', 'Pengembalian Barang'),
(2, '2024-03-02', 'Penjualan'),
(3, '2024-03-03', 'Penjualan'),
(4, '2024-03-04', 'Pembelian Barang dari Supplier'),
(5, '2024-03-05', 'Koreksi Stok'),
(6, '2024-03-06', 'Stok'),
(7, '2024-03-07', 'Stok'),
(8, '2024-03-08', 'Pembelian Barang dari Supplier'),
(9, '2024-03-09', 'Stok'),
(10, '2024-03-10', 'Pengembalian Barang ');

CREATE TABLE keuangan (
  Id_buku INT(10) NOT NULL,
  Tanggal_Transaksi DATE DEFAULT NULL,
  Jenis_Transaksi VARCHAR(45) DEFAULT NULL,
  Total_Transaksi INT(10) DEFAULT NULL,
  PRIMARY KEY (Id_buku)
);

INSERT INTO keuangan VALUES 
(1, '2023-03-01', 'Pembelian barang', -30000),
(2, '2023-03-02', 'Penjualan', 9000),
(3, '2023-03-03', 'Stok', -20000),
(4, '2023-03-04', 'Pembelian dari supplier', -30000),
(5, '2023-03-05', 'Koreksi Stok', -5000),
(6, '2023-03-06', 'Stok', 6000),
(7, '2023-03-07', 'Stok', 8000),
(8, '2023-03-08', 'Pembelian Barang Dari Supplier', 20000),
(9, '2023-03-09', 'Stok', -4000),
(10, '2023-03-10', 'Pengembalian Barang', -30000);

CREATE TABLE laporan (
  Id_Laporan INT(10) NOT NULL,
  Tanggal_Laporan DATE DEFAULT NULL,
  Jenis_Laporan VARCHAR(45) DEFAULT NULL,
  Total_Laporan INT(15) DEFAULT NULL,
  PRIMARY KEY (Id_Laporan)
);

INSERT INTO laporan VALUES 
(1, '2023-03-01', 'Pembelian Barang', 30000),
(2, '2023-03-02', 'Penjualan', 9000),
(3, '2023-03-03', 'Stok', 20000),
(4, '2023-03-04', 'Pembelian Dari Supplier', 30000),
(5, '2023-03-05', 'Koreksi Stok', 5000),
(6, '2023-03-06', 'Stok', 6000),
(7, '2023-03-07', 'Stok', 80008),
(8, '2023-03-08', 'Pembelian Barang Dari Supplier', 20000),
(9, '2023-03-09', 'Stok', 4000),
(10, '2023-03-10', 'Pengembalian Barang', 30000);

CREATE TABLE detailtransaksi (
  Id_detail_transaksi INT(10) NOT NULL,
  Id_Transaksi INT(10) DEFAULT NULL,
  Nama_Barang VARCHAR(35) DEFAULT NULL,
  Harga_Barang INT(15) NOT NULL,
  Jumlah_Barang INT(10) DEFAULT NULL,
  total INT(10) DEFAULT NULL
);

ALTER TABLE detailtransaksi ADD PRIMARY KEY (Id_detail_transaksi);
DESC detailtransaksi;
INSERT INTO detailtransaksi VALUES
(1, 1, 'Vas Bunga', 30000, 1, 30000),
(2, 2, 'Susu', 3000, 3, 9000),
(3, 3, 'Pasta Gigi', 5000, 4, 20000),
(4, 4, 'Minuman Kaleng', 5000, 6, 30000),
(5, 5, 'Pasta Gigi', 5000, -1, -5000),
(6, 6, 'Kecap', 3000, 2, 6000),
(7, 7, 'Shampo', 8000, 1, 8000),
(8, 8, 'Minuman Kaleng', 5000, 4, 20000),
(9, 9, 'Mie Instan', 2000, -2, -4000),
(10, 10, 'Guling', 30000, 1, 30000);

SELECT * FROM transaksi;
SELECT * FROM keuangan;
SELECT * FROM laporan;
SELECT * FROM detailtransaksi;

UPDATE detailtransaksi SET Nama_Barang = 'Pot Bunga' WHERE Id_detail_transaksi = 1;
DROP  SCHEMA tokoswalayan;
ALTER TABLE laporan MODIFY COLUMN laporan_barang;
RENAME TABLE laporan TO laporan_barang;
ALTER TABLE detailtransaksi 
ADD CONSTRAINT FK_pembayaran FOREIGN KEY (Id_Transaksi) REFERENCES transaksi(Id_Transaksi);
