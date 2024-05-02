CREATE DATABASE toko_modul_1;

USE toko_modul_1;

CREATE TABLE pelanggan(
id INT (3) NOT NULL PRIMARY KEY,
nama_pelangga VARCHAR(100) NOT NULL,
no_telp_pelanggan VARCHAR(12) NOT NULL
);


CREATE TABLE barang (
id INT (3) NOT NULL PRIMARY KEY,
nama_barang VARCHAR (100),
harga_jual INT (10),
harga_beli INT (10),
stok_barang INT (10)
);

CREATE TABLE transaksi_penjualan (
id INT (3) NOT NULL PRIMARY KEY,
tanggal_transaksi DATE,
id_pelanggan INT,
total_harga INT (10),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id)
); 

ALTER TABLE transaksi_penjualan ADD COLUMN jumlah_beli INT (3) AFTER id_Pelanggan;
ALTER TABLE transaksi_penjualan ADD COLUMN id_barang INT AFTER id_pelanggan, -- menambah atribut pada tabel
ADD CONSTRAINT fk_barang FOREIGN KEY (id_barang) REFERENCES barang(id);

CREATE TABLE retur_barang (
id VARCHAR (3) NOT NULL PRIMARY KEY,
tanggal_retur DATE,
id_penjualan INT,
id_barang INT,
jumlah_retur INT,
FOREIGN KEY (id_penjualan) REFERENCES transaksi_penjualan(id),
FOREIGN KEY (id_barang) REFERENCES barang(id)
);

CREATE TABLE supplier (
id VARCHAR (3) NOT NULL PRIMARY KEY,
nama_supplier VARCHAR(100),
alamat VARCHAR(255),
no_telp VARCHAR(20)
);

CREATE TABLE koreksi_stok (
id VARCHAR (3) NOT NULL PRIMARY KEY,
tanggal_koreksi DATE,
id_barang INT,
jumlah_sebelum INT (3),
jumlah_sesuadah VARCHAR(3),
FOREIGN KEY (id_barang) REFERENCES barang(id)
);

CREATE TABLE pembelian (
id VARCHAR (3) NOT NULL PRIMARY KEY,
tanggal_pembelian DATE,
id_supplier VARCHAR(3),
id_barang INT(3),
total_harga_beli INT (10) NOT NULL,
FOREIGN KEY (id_supplier) REFERENCES supplier(id),
FOREIGN KEY (id_barang) REFERENCES barang(id)
);

INSERT INTO pelanggan VALUES
(111, 'Abdillah', 081452221467),
(112, 'Aisiyah', 083289650872),
(113, 'Beni', 0812765415742),
(114, 'Badrul', 089754625523),
(115, 'Cika', 085259721159),
(116, 'Delilah', 081984367188),
(117, 'Fahri', 082509624118),
(118, 'Geby', 0835095231836),
(119, 'Gloria', 089341008256),
(120, 'Hario', 082092538166);

INSERT INTO barang VALUES
(550, 'Toner', 30000, 26000, 20),
(551, 'Moisturizer', 35000, 30000, 17),
(552, 'Serum', 45000, 40000, 12),
(553, 'Micelar Water', 20000, 17000, 30),
(554, 'Facial Foam', 35000, 32000, 20),
(555, 'Eye Cream', 67000, 62000, 22),
(556, 'Sleeping Mask', 28000, 25000, 39),
(557, 'Lip Mask', 25000, 23000, 15),
(558, 'Hand Cream', 26000, 23000, 8),
(559, 'Sheet Mask', 12000, 10000, 40);

INSERT INTO transaksi_penjualan VALUES
(730, '2024-02-25', 112, 552, 2, 90000),
(731, '2024-02-05', 113, 551, 1, 35000),
(732, '2024-03-01', 114, 553, 3, 60000),
(733, '2024-03-04', 115, 553, 1, 20000),
(734, '2024-03-05', 116, 556, 1, 28000),
(735, '2024-03-06', 117, 550, 3, 90000),
(736, '2024-03-10', 119, 558, 2, 52000),
(737, '2024-03-10', 119, 559, 2, 24000),
(738, '2024-03-17', 120, 555, 1, 67000),
(739, '2024-03-18', 111, 554, 1, 35000);

INSERT INTO Retur_barang VALUES
('r10', '2024-02-26', 730, 552, 1),
('r11', '2024-02-06', 731, 551, 1),
('r12', '2024-03-02', 732, 553, 1),
('r13', '2024-03-04', 733, 553, 1),
('r14', '2024-03-06', 734, 556, 1),
('r15', '2024-03-07', 735, 550, 1),
('r16', '2024-03-11', 736, 558, 1),
('r17', '2024-03-10', 737, 559, 1),
('r18', '2024-03-18', 738, 555, 1),
('r19', '2024-03-18', 739, 554, 1);

INSERT INTO Supplier VALUES 
('s20', 'PT.Sejahtera', 'Surabaya', 08236539154),
('s21', 'PT.Cantikku', 'Surabaya', 081145096832),
('s22', 'PT.Kembang Ayu', 'Gresik', 084578220365),
('s23', 'PT.Merapi Group', 'Tanggerang', 086194621944),
('s24', 'PT.Anugrah', 'Bogor', 082033668821),
('s25', 'PT.Larasati', 'Lamongan', 089427466119),
('s26', 'PT.Melasti', 'Sidoarjo', 083392756488),
('s27', 'PT.Bina Beauty', 'Tanggerang', 08358177204),
('s28', 'PT.Regasa', 'Bekasi', 082567712292),
('s29', 'PT.Nuraga', 'Jakarta Timur', 08237779154);

INSERT INTO koreksi_stok VALUES 
('k30', '2024-03-20', 550, 20, 15),
('k31', '2024-03-20', 551, 17, 12),
('k32', '2024-03-20', 552, 12, 10),
('k33', '2024-03-20', 553, 30, 27),
('k34', '2024-03-20', 554, 20, 16),
('k35', '2024-03-20', 555, 22, 14),
('k36', '2024-03-20', 556, 39, 29),
('k37', '2024-03-20', 557, 15, 10),
('k38', '2024-03-20', 558, 8, 5),
('k39', '2024-03-20', 559, 40, 35);

-- menampilkan masing masing tabel

SELECT * FROM pelanggan;
SELECT * FROM barang;
SELECT * FROM transaksi_penjualan;
SELECT * FROM retur_barang;
SELECT * FROM supplier;

-- mengubah nama tabel
ALTER TABLE transaksi_penjualan RENAME TO penjualan;

-- mengubah nama kolom
ALTER TABLE koreksi_stok CHANGE COLUMN Jumalah_sesuadah Jumlah_sesudah INT (3);
