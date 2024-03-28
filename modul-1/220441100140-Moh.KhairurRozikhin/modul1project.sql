CREATE DATABASE modulsatu;

CREATE TABLE pelanggan (
id_pelanggan INT PRIMARY KEY,
nama_pelanggan VARCHAR(255) NOT NULL,
alamat VARCHAR(255),
no_telepon VARCHAR(20)
);

DESC pelanggan;

CREATE TABLE retur(
kode_retur INT PRIMARY KEY, 
tanggal_transaksi DATE NOT NULL
)

DESC retur;

CREATE TABLE penjualan (
kode_penjualan INT PRIMARY KEY,
tgl_penjualan DATE,
quantity INT NOT NULL,
total_harga INT NOT NULL
);

DESC penjualan;

CREATE TABLE barang (
kode_barang INT PRIMARY KEY, 
nama_barang VARCHAR (150) NOT NULL,
stok_barang INT NOT NULL,
harga_barang INT NOT NULL,
kategori VARCHAR (100) NOT NULL
);

DESC barang;

CREATE TABLE pembelian (
kode_pembelian INT PRIMARY KEY , 
tanggal_datang DATE NOT NULL, 
total_pembayaran INT,
status_barang VARCHAR (100) NOT NULL,
hutang INT (100)
);

DESC pembelian;

CREATE TABLE suplayer (
id_suplayer INT PRIMARY KEY ,
nama_suplayer VARCHAR (100) NOT NULL,
alamat_suplayer VARCHAR (100) NOT NULL,
email VARCHAR (100),
no_telepon INT NOT NULL
);

DESC suplayer;


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

ALTER TABLE penjualan
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


INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telepon) VALUES
(1, 'Andi', 'Jl. Merdeka No. 10', '08123456789'),
(2, 'Budi', 'Jl. Kebon Sirih No. 20', '08234567890'),
(3, 'Cici', 'Jl. Pahlawan No. 30', '08345678901'),
(4, 'Dedi', 'Jl. Asia Afrika No. 40', '08456789012'),
(5, 'Euis', 'Jl. Diponegoro No. 50', '08567890123'),
(6, 'Fafa', 'Jl. Gatot Subroto No. 60', '08678901234'),
(7, 'Gina', 'Jl. Citarum No. 70', '08789012345'),
(8, 'Hani', 'Jl. Ciliwung No. 80', '08890123456'),
(9,  'Indra', 'Jl. Kaliurang No. 90', '08901234567'),
(10, 'Joko', 'Jl. Magelang No. 100', '08012345678');

DELETE FROM pelanggan; 

SELECT * FROM pelanggan

INSERT INTO retur (kode_retur, tanggal_transaksi) VALUES
(111, '2024-03-01'),
(112, '2024-03-02'),
(113, '2024-03-03'),
(114, '2024-03-04'),
(115, '2024-03-05'),
(116, '2024-03-06'),
(117, '2024-03-07'),
(118, '2024-03-08'),
(119, '2024-03-09'),
(1110, '2024-03-10');

DELETE FROM retur;

SELECT * FROM retur;

INSERT INTO penjualan (tgl_penjualan, quantity, total_harga) VALUES
('2024-03-01', 2, 20000),
('2024-03-02', 3, 30000),
('2024-03-03', 1, 10000),
('2024-03-04', 4, 40000),
('2024-03-05', 2, 20000),
('2024-03-06', 5, 50000),
('2024-03-07', 3, 30000),
('2024-03-08', 1, 10000),
('2024-03-09', 4, 40000),
('2024-03-10', 2, 20000);

DELETE FROM penjualan; 

SELECT * FROM penjualan;

SELECT a.nama_pelanggan, b.tgl_penjualan 
FROM pelanggan a 
JOIN penjualan b 
ON a.id_penjualan = b.id_penjualan;

SELECT a.nama_pelanggan, b.tgl_penjualan 
FROM pelanggan a 
JOIN penjualan b 
ON a.id_pelanggan = b.id_pelanggan;



















