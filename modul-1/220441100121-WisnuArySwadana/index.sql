CREATE DATABASE toko_swalayan;
USE toko_swalayan;

CREATE TABLE Barang (
    ID_Barang INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Barang VARCHAR(100),
    Harga DECIMAL(10, 2),
    Jumlah_Stok INT,
    
);

DROP TABLE Transaksi;


CREATE TABLE Transaksi (
    ID_Transaksi INT PRIMARY KEY AUTO_INCREMENT,
    ID_Barang INT,
    Jenis_Transaksi VARCHAR(50),
    Waktu_Transaksi DATE,
    Total_Harga DECIMAL(10, 2),
    Keterangan VARCHAR(100),
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang)
);


CREATE TABLE Supplier (
    ID_Supplier INT PRIMARY KEY AUTO_INCREMENT,
    Nama_Supplier VARCHAR(100),
    Alamat VARCHAR(255),
    No_Telepon VARCHAR(20)
);

CREATE TABLE Laporan (
    ID_Laporan INT PRIMARY KEY AUTO_INCREMENT,
    Tanggal_Laporan DATE,
    Jenis_Laporan VARCHAR(100),
    Keterangan VARCHAR(100)
);

INSERT INTO Barang (Nama_Barang, Harga, Jumlah_Stok) VALUES
('Sabun Mandi', 5000.00, 100),
('Shampoo', 10000.00, 50),
('Pasta Gigi', 8000.00, 80),
('Tisu Basah', 3000.00, 120),
('Minyak Goreng', 15000.00, 200),
('Gula Pasir', 12000.00, 150),
('Kopi Bubuk', 25000.00, 70),
('Teh Celup', 18000.00, 90),
('Beras', 30000.00, 100),
('Mie Instan', 5000.00, 120);

INSERT INTO Transaksi (Jenis_Transaksi,ID_Barang, Waktu_Transaksi, Total_Harga, Keterangan) VALUES
('POS / Penjualan : ke pelanggan','1','2024-03-25 ', 25000.00, 'Transaksi penjualan barang A'),
('POS / Penjualan : ke pelanggan','2', '2024-03-25 ', 18000.00, 'Transaksi penjualan barang B'),
('Pengembalian barang / retur','3', '2024-03-25 ', 15000.00, 'Pengembalian barang C karena cacat'),
('Pengembalian barang / retur','4', '2024-03-26 ', 12000.00, 'Pengembalian barang D karena tidak sesuai pesanan'),
('Stok','5', '2024-03-26 ', NULL, 'Penyesuaian stok barang E setelah inventarisasi'),
('Stok', '6','2024-03-27 ', NULL, 'Penyesuaian stok barang F setelah pengecekan kualitas'),
('Pembelian barang dari supplier','7', '2024-03-27 ', 35000.00, 'Pembelian barang G dari Supplier J'),
('Pembelian barang dari supplier','8', '2024-03-28 ', 28000.00, 'Pembelian barang H dari Supplier I'),
('Koreksi stok','9', '2024-03-28 ', NULL, 'Koreksi stok setelah terjadi kehilangan'),
('Koreksi stok','10','2024-03-29 ', NULL, 'Koreksi stok setelah barang rusak dalam penyimpanan');

SELECT * FROM Transaksi;

INSERT INTO Supplier (Nama_Supplier, Alamat, No_Telepon) VALUES
('Supplier A', 'Jl. Pahlawan No. 123', '081234567890'),
('Supplier B', 'Jl. Gatot Subroto No. 456', '085678901234'),
('Supplier C', 'Jl. Sudirman No. 789', '081234567891'),
('Supplier D', 'Jl. Diponegoro No. 1011', '085678901235'),
('Supplier E', 'Jl. Veteran No. 1213', '081234567892'),
('Supplier F', 'Jl. Asia Afrika No. 1415', '085678901236'),
('Supplier G', 'Jl. Merdeka No. 1617', '081234567893'),
('Supplier H', 'Jl. Majapahit No. 1819', '085678901237'),
('Supplier I', 'Jl. Raya No. 2021', '081234567894'),
('Supplier J', 'Jl. Gatot Kaca No. 2223', '085678901238');

INSERT INTO Laporan (Tanggal_Laporan, Jenis_Laporan, Keterangan) VALUES
('2024-01-01', 'Stok', 'Laporan stok awal tahun. Stok saat ini: 100'),
('2024-01-02', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 500000'),
('2024-01-03', 'Stok', 'Koreksi stok. Stok setelah koreksi: 90'),
('2024-01-04', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 600000'),
('2024-01-05', 'Stok', 'Koreksi stok. Stok setelah koreksi: 95'),
('2024-01-06', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 550000'),
('2024-01-07', 'Stok', 'Koreksi stok. Stok setelah koreksi: 85'),
('2024-01-08', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 700000'),
('2024-01-09', 'Stok', 'Koreksi stok. Stok setelah koreksi: 100'),
('2024-01-10', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 750000');


INSERT INTO Laporan (Tanggal_Laporan, Jenis_Laporan, Keterangan) VALUES
('2024-01-01', 'Stok', 'Laporan stok awal tahun. Stok saat ini: 100');

UPDATE Laporan
SET Keterangan = 'Penjualan harian. Pendapatan hari ini: Rp 5000000'
WHERE Tanggal_Laporan = '2024-01-01';

DELETE FROM Laporan
WHERE Tanggal_Laporan = '2024-01-01';

DROP TABLE makan;

ALTER TABLE Laporan ADD Test VARCHAR (100);

ALTER TABLE laporan MODIFY COLUMN Test INT(100);

ALTER TABLE Laporan DROP COLUMN Test;

CREATE INDEX IDX_Laporan ON Laporan(Tanggal_Laporan);

SELECT * FROM Laporan WHERE Tanggal_Laporan = '2024-01-01';



