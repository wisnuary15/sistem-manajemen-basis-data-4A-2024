CREATE DATABASE penjualan;

USE penjualan;

CREATE TABLE barang(
id_barang INT PRIMARY KEY AUTO_INCREMENT,
nama_barang VARCHAR(50)NOT NULL,
harga INT (10)NOT NULL,
stok INT (5)NOT NULL
);
DESC barang;


CREATE TABLE supplier(
id_sup INT PRIMARY KEY AUTO_INCREMENT,
nama_supplies VARCHAR(50),
alamat VARCHAR(100),
no_tlp BIGINT(30)
);
ALTER TABLE supplier MODIFY COLUMN no_tlp BIGINT (30) NOT NULL;
DESC supplier;


CREATE TABLE keuangan(
id_keuangan INT PRIMARY KEY AUTO_INCREMENT,
jenis_catatan VARCHAR(50),
nominal INT(50),
tanggal_catatan DATE
);
DESC keuangan;

CREATE TABLE transaksi(
id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
jenis_transaksi VARCHAR(50),
jumlah INT(20),
total INT (100),
waktu_transaksi TIMESTAMP
);
DESC transaksi;

CREATE TABLE laporan(
id_laporan INT PRIMARY KEY AUTO_INCREMENT,
jenis_laporan VARCHAR(50),
nama_barang VARCHAR(50),
stok INT (20),
tanggal DATE
);
DESC laporan;

INSERT INTO barang (nama_barang, harga, stok) VALUES
('Laptop ASUS ROG', 1`barang`5000000, 10),
('Smartphone Samsung Galaxy S21', 12000000, 15),
('Headset Gaming Logitech G Pro X', 2000000, 20),
('Mouse Wireless Logitech MX Master 3', 1500000, 25),
('Keyboard Mechanical Corsair K95 RGB Platinum', 2500000, 12),
('Monitor LG 24 inch', 2000000, 15),
('Printer Epson L3150', 3000000, 8),
('Speaker Bluetooth JBL Flip 5', 1500000, 20),
('SSD Samsung 1TB', 2500000, 10),
('Webcam Logitech C920', 1000000, 12);
SELECT * FROM barang;

INSERT INTO supplier (nama_supplies, alamat, no_tlp) VALUES
('PT. Sentra Elektronik', 'Jl. Jendral Sudirman No. 123, Jakarta', 628123456789),
('CV. Tekno Makmur', 'Jl. Gajah Mada No. 45, Surabaya', 623156789012),
('UD. Cahaya Baru', 'Jl. Merdeka No. 78, Bandung', 622345678901),
('PT. Maju Jaya Abadi', 'Jl. Diponegoro No. 56, Yogyakarta', 627890123456),
('CV. Sejahtera Jaya', 'Jl. Pahlawan No. 90, Semarang', 622234567890),
('PT. Elektronik Maju', 'Jl. Raya Darmo No. 100, Surabaya', 623156789012),
('CV. Teknik Elektronik Mandiri', 'Jl. A. Yani No. 50, Jakarta', 628123456789),
('UD. Cahaya Baru', 'Jl. Raya Bandung No. 123, Bandung', 622345678901),
('PT. Jaya Abadi Teknologi', 'Jl. Gajah Mada No. 75, Yogyakarta', 627890123456),
('CV. Sejahtera Elektronik', 'Jl. Pahlawan No. 80, Semarang', 622234567890);
SELECT * FROM supplier;

INSERT INTO transaksi (jenis_transaksi, jumlah, total, waktu_transaksi) VALUES
('beli', 15, 30000000, NOW()),
('retur', 3, 6000000, NOW()),
('jual', 10, 20000000, NOW()),
('beli', 20, 40000000, NOW()),
('jual', 5, 10000000, NOW()),
('beli', 25, 50000000, NOW()),
('jual', 8, 16000000, NOW()),
('retur', 2, 4000000, NOW()),
('beli', 10, 20000000, NOW()),
('jual', 15, 30000000, NOW());
SELECT * FROM transaksi;

INSERT INTO keuangan (jenis_catatan, nominal, tanggal_catatan) VALUES
('pemasukan', 5000000, '2024-03-25'),
('pengeluaran', 3000000, '2024-03-26'),
('hutang', 1000000, '2024-03-24'),
('pemasukan', 8000000, '2024-03-23'),
('pengeluaran', 2000000, '2024-03-22'),
('pengeluaran', 1500000, '2024-03-27'),
('pemasukan', 7000000, '2024-03-28'),
('hutang', 2000000, '2024-03-29'),
('pemasukan', 4500000, '2024-03-30'),
('pengeluaran', 3000000, '2024-03-31');
SELECT * FROM keuangan;

INSERT INTO laporan (jenis_laporan, nama_barang, stok, tanggal) VALUES
('beli', 'Laptop ASUS ROG', 20, '2024-03-25'),
('jual', 'Smartphone Samsung Galaxy S21', 10, '2024-03-26'),
('retur', 'Headset Gaming Logitech G Pro X', 2, '2024-03-24'),
('beli', 'Mouse Wireless Logitech MX Master 3', 30, '2024-03-23'),
('jual', 'Keyboard Mechanical Corsair K95 RGB Platinum', 8, '2024-03-22'),
('beli', 'Monitor LG 24 inch', 5, '2024-03-27'),
('jual', 'Printer Epson L3150', 3, '2024-03-28'),
('retur', 'Speaker Bluetooth JBL Flip 5', 1, '2024-03-29'),
('beli', 'SSD Samsung 1TB', 8, '2024-03-30'),
('jual', 'Webcam Logitech C920', 6, '2024-03-31');
SELECT * FROM laporan;

DROP DATABASE penjualan;
