CREATE DATABASE IF NOT EXISTS swalayan;

USE swalayan;

CREATE TABLE IF NOT EXISTS Barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(255),
    harga DECIMAL(10,2),
    stok INT
);

CREATE TABLE IF NOT EXISTS Laporan_Penjualan (
    id_laporan_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT,
    jumlah_penjualan INT,
    total_penjualan DECIMAL(10,2),
    tanggal_laporan DATE,
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);

CREATE TABLE IF NOT EXISTS Laporan_Stok (
    id_laporan_stok INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT,
    stok INT,
    tanggal_laporan DATE,
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);

CREATE TABLE IF NOT EXISTS Transaksi_Penjualan (
    id_transaksi_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT,
    jumlah INT,
    total_harga DECIMAL(10,2),
    tanggal_transaksi DATE,
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);

CREATE TABLE IF NOT EXISTS Transaksi_Pembelian (
    id_transaksi_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT,
    jumlah INT,
    total_harga DECIMAL(10,2),
    tanggal_transaksi DATE,
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);

CREATE TABLE IF NOT EXISTS Transaksi_Retur (
    id_transaksi_retur INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT,
    jumlah_retur INT,
    tanggal_retur DATE,
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang)
);

CREATE TABLE IF NOT EXISTS Keuangan (
    id_keuangan INT AUTO_INCREMENT PRIMARY KEY,
    jenis_transaksi VARCHAR(50),
    jumlah DECIMAL(10,2),
    tanggal_transaksi DATE
);

CREATE TABLE IF NOT EXISTS Laporan (
    id_laporan INT AUTO_INCREMENT PRIMARY KEY,
    jenis_laporan VARCHAR(50),
    jumlah_barang INT,
    total_penjualan DECIMAL(10,2),
    tanggal_laporan DATE
);

CREATE Table Details_Transaksi(
    Nama_transaksi VARCHAR(50)
);

-- Isi data pada tabel Barang
INSERT INTO Barang (nama_barang, harga, stok)
VALUES 
    ('Gula', 15000.00, 100),
    ('Kopi', 20000.00, 80),
    ('Sabun', 5000.00, 150);

-- Isi data pada tabel Laporan_Penjualan
INSERT INTO Laporan_Penjualan (id_barang, jumlah_penjualan, total_penjualan, tanggal_laporan)
VALUES 
    (1, 20, 300000.00, '2024-03-01'),
    (2, 15, 300000.00, '2024-03-01'),
    (3, 25, 125000.00, '2024-03-01');

-- Isi data pada tabel Laporan_Stok
INSERT INTO Laporan_Stok (id_barang, stok, tanggal_laporan)
VALUES 
    (1, 80, '2024-03-01'),
    (2, 65, '2024-03-01'),
    (3, 125, '2024-03-01');

-- Isi data pada tabel Transaksi_Penjualan
INSERT INTO Transaksi_Penjualan (id_barang, jumlah, total_harga, tanggal_transaksi)
VALUES 
    (1, 20, 300000.00, '2024-03-01'),
    (2, 15, 300000.00, '2024-03-01'),
    (3, 25, 125000.00, '2024-03-01');

-- Isi data pada tabel Transaksi_Pembelian
INSERT INTO Transaksi_Pembelian (id_barang, jumlah, total_harga, tanggal_transaksi)
VALUES 
    (1, 30, 450000.00, '2024-03-05'),
    (2, 20, 400000.00, '2024-03-05'),
    (3, 40, 200000.00, '2024-03-05');

-- Isi data pada tabel Transaksi_Retur
INSERT INTO Transaksi_Retur (id_barang, jumlah_retur, tanggal_retur)
VALUES 
    (1, 5, '2024-03-10'),
    (2, 3, '2024-03-10'),
    (3, 2, '2024-03-10');

-- Isi data pada tabel Keuangan
INSERT INTO Keuangan (jenis_transaksi, jumlah, tanggal_transaksi)
VALUES 
    ('Penjualan', 725000.00, '2024-03-01'),
    ('Pembelian', -1050000.00, '2024-03-05');

-- Isi data pada tabel Laporan
INSERT INTO Laporan (jenis_laporan, jumlah_barang, total_penjualan, tanggal_laporan)
VALUES 
    ('Penjualan', 60, 725000.00, '2024-03-01'),
    ('Stok', NULL, NULL, '2024-03-01');


SELECT * FROM Daftar_Barang;
SELECT * FROM Laporan_Penjualan;
SELECT * FROM Laporan_Stok;
SELECT * FROM Transaksi_Penjualan;
SELECT * FROM Transaksi_Pembelian;
SELECT * FROM Transaksi_Retur;
SELECT * FROM Keuangan;
SELECT * FROM Laporan;

SELECT * from Laporan_Stok WHERE id_barang=1;


INSERT INTO Barang (nama_barang, harga, stok) 
VALUES 
    ('Susu', 20000.00, 60),
    ('Roti', 15000.00, 40),
    ('Sampo', 30000.00, 30),
    ('Pasta Gigi', 5000.00, 80),
    ('Tissue', 10000.00, 90),
    ('Bawang Merah', 12000.00, 70),
    ('Bawang Putih', 10000.00, 60),
    ('Sikat Gigi', 8000.00, 100),
    ('Kecap', 18000.00, 50),
    ('Mie Instan', 7000.00, 120);


ALTER TABLE Barang RENAME TO Daftar_Barang;

UPDATE Daftar_Barang set nama_barang = "Beras" WHERE id_barang=1;

DROP DATABASE swalayan;


-- Tambahkan data berdasarkan transaksi pembelian
INSERT INTO Laporan_Stok (id_barang, stok, tanggal_laporan)
SELECT 
    id_barang,
    jumlah,
    CURDATE()
FROM Transaksi_Pembelian
LIMIT 5; -- Menambahkan data sebanyak 5 transaksi pembelian teratas

-- Tambahkan data berdasarkan transaksi retur
INSERT INTO Laporan_Stok (id_barang, stok, tanggal_laporan)
SELECT 
    id_barang,
    -jumlah_retur,
    CURDATE()
FROM Transaksi_Retur
LIMIT 5; -- Menambahkan data sebanyak 5 transaksi retur teratas
