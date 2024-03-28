CREATE DATABASE modulsatu;

CREATE TABLE pelanggan (
id_pelanggan INT PRIMARY KEY,
nama_pelanggan VARCHAR(255) NOT NULL,
alamat VARCHAR(255),
no_telepon VARCHAR(20)
);

CREATE TABLE retur(
kode_retur INT PRIMARY KEY, 
tanggal_transaksi DATE NOT NULL
)

CREATE TABLE penjualan (
kode_penjualan INT PRIMARY KEY,
tgl_penjualan DATE,
quantity INT NOT NULL,
total_harga INT NOT NULL
);

CREATE TABLE barang (
kode_barang INT PRIMARY KEY, 
nama_barang VARCHAR (150) NOT NULL,
stok_barang INT NOT NULL,
harga_barang INT NOT NULL,
kategori VARCHAR (100) NOT NULL
);

CREATE TABLE pembelian (
kode_pembelian INT PRIMARY KEY , 
tanggal_datang DATE NOT NULL, 
total_pembayaran INT,
status_barang VARCHAR (100) NOT NULL,
hutang INT (100)
);

CREATE TABLE suplayer (
id_suplayer INT PRIMARY KEY ,
nama_suplayer VARCHAR (100) NOT NULL,
alamat_suplayer VARCHAR (100) NOT NULL,
email VARCHAR (100),
no_telepon INT NOT NULL
);

ALTER TABLE penjualan
ADD COLUMN id_pelanggan INT,
ADD CONSTRAINT penjualan_ke_pelanggan
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan);


ALTER TABLE retur
ADD COLUMN kode_penjualan INT,
ADD CONSTRAINT retur_ke_penjualan
FOREIGN KEY (kode_penjualan) REFERENCES penjualan(kode_penjualan);

ALTER TABLE penjualan
ADD COLUMN kode_barang INT,
ADD CONSTRAINT penjualan_ke_barang
FOREIGN KEY (kode_barang) REFERENCES barang(kode_barang);

ALTER TABLE barang
ADD COLUMN kode_pembelian INT,
ADD CONSTRAINT barang_ke_pembelian
FOREIGN KEY (kode_pembelian) REFERENCES pembelian(kode_pembelian);

ALTER TABLE pembelian
ADD COLUMN id_suplayer INT,
ADD CONSTRAINT pembelian_ke_suplayer
FOREIGN KEY (id_suplayer) REFERENCES suplayer(id_suplayer);


INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telepon)
VALUES 
(1, 'Budi', 'Jl. Merdeka No. 10', '08123456789'),
(2, 'Ani', 'Jl. Pahlawan No. 20', '08234567890'),
(3, 'Citra', 'Jl. Sudirman No. 30', '08345678901'),
(4, 'Dodi', 'Jl. Gajah Mada No. 40', '08456789012'),
(5, 'Eka', 'Jl. Diponegoro No. 50', '08567890123'),
(6, 'Fani', 'Jl. Imam Bonjol No. 60', '08678901234'),
(7, 'Gita', 'Jl. Ahmad Yani No. 70', '08789012345'),
(8, 'Hadi', 'Jl. Pattimura No. 80', '08890123456'),
(9, 'Indah', 'Jl. Siliwangi No. 90', '08901234567'),
(10, 'Joko', 'Jl. Kartini No. 100', '08123456789'),
(11, 'Kartika', 'Jl. Hayam Wuruk No. 110', '08234567890'),
(12, 'Lia', 'Jl. S. Parman No. 120', '08345678901'),
(13, 'Mira', 'Jl. Tanjung No. 130', '08456789012'),
(14, 'Nanda', 'Jl. Kusuma No. 140', '08567890123'),
(15, 'Opik', 'Jl. Hasanuddin No. 150', '08678901234');

INSERT INTO retur (kode_retur, tanggal_transaksi)
VALUES 
(1, '2024-03-25'),
(2, '2024-03-26'),
(3, '2024-03-27'),
(4, '2024-03-28'),
(5, '2024-03-29'),
(6, '2024-03-30'),
(7, '2024-03-31'),
(8, '2024-04-01'),
(9, '2024-04-02'),
(10, '2024-04-03');

INSERT INTO penjualan (kode_penjualan, tgl_penjualan, quantity, total_harga)
VALUES 
(1, '2024-03-25', 5, 50000),
(2, '2024-03-26', 3, 30000),
(3, '2024-03-27', 7, 70000),
(4, '2024-03-28', 4, 40000),
(5, '2024-03-29', 6, 60000),
(6, '2024-03-30', 2, 20000),
(7, '2024-03-31', 8, 80000),
(8, '2024-04-01', 1, 10000),
(9, '2024-04-02', 9, 90000),
(10, '2024-04-03', 5, 50000);

INSERT INTO barang (kode_barang, nama_barang, stok_barang, harga_barang, kategori)
VALUES 
(101, 'Beras', 50, 100000, 'Sembako'),
(102, 'Minyak Goreng', 40, 30000, 'Sembako'),
(103, 'Gula Pasir', 60, 25000, 'Sembako'),
(104, 'Cermin', 70, 25000, 'Perabotan rumah'),
(105, 'Tepung Terigu', 55, 15000, 'Sembako'),
(106, 'Buku', 80, 3000, 'Atk'),
(107, 'Susu Kental Manis', 30, 15000, 'Sembako'),
(108, 'Kopi Bubuk', 45, 50000, 'Sembako'),
(109, 'Spidol', 90, 10000, 'Atk'),
(110, 'Pasta Gigi', 85, 12000, 'Sembako');

INSERT INTO pembelian (kode_pembelian, tanggal_datang, total_pembayaran, status_barang, hutang)
VALUES 
(1, '2024-03-25', 15000000, 'Diterima', 0),
(2, '2024-03-26', 10000000, 'Diterima', 20000),
(3, '2024-03-27', 20000000, 'Diterima', 0),
(4, '2024-03-28', 17500000, 'Proses pengiriman', 0),
(5, '2024-03-29', 25000000, 'Diterima', 0),
(6, '2024-03-30', 12000000, 'Diterima', 74000 ),
(7, '2024-03-31', 18000000, 'Diterima', 200000),
(8, '2024-04-01', 22000000, 'Diterima', 35000),
(9, '2024-04-02', 13000000, 'Proses pengiriman', 0),
(10, '2024-04-03', 19000000, 'Diterima', 0);

select * from pembelian;

INSERT INTO suplayer (id_suplayer, nama_suplayer, alamat_suplayer, email, no_telepon)
VALUES 
(1, 'PT ABC', 'Jl. Merdeka No. 123', 'abc@email.com', 1234567890),
(2, 'PT XYZ', 'Jl. Pahlawan No. 456', 'xyz@email.com', 9876543210),
(3, 'CV Jaya', 'Jl. Raya No. 789', NULL, 1122334455),
(4, 'UD Maju', 'Jl. Maju No. 1011', 'maju@email.com', 9988776655),
(5, 'PT Sejahtera', 'Jl. Damai No. 1213', 'sejahtera@email.com', 1122334466),
(6, 'CV Berkah', 'Jl. Berkah No. 1415', 'berkah@email.com', 7788990011),
(7, 'UD Sentosa', 'Jl. Sentosa No. 1617', NULL, 1122334477),
(8, 'PT Harapan', 'Jl. Harapan No. 1819', 'harapan@email.com', 1122334488),
(9, 'CV Damai', 'Jl. Damai No. 2021', 'damai@email.com', 1122334499),
(10, 'UD Sukses', 'Jl. Sukses No. 2223', NULL, 1122334500);

SELECT * FROM pelanggan;
select * from retur;
select * from penjualan;
SELECT * FROM barang;
select * from pembelian;
SELECT * FROM suplayer;

SELECT * FROM pelanggan;
select * from retur;
select * from penjualan;
SELECT * FROM barang;
select * from pembelian;
SELECT * FROM suplayer;
ALTER TABLE gudang RENAME TO barang  ;
DELETE FROM pelanggan WHERE id_pelanggan = 3;
