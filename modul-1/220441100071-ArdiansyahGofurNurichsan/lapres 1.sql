CREATE DATABASE toko_swalayan;
USE toko_swalayan;

CREATE TABLE pelanggan(
id INT(2) NOT NULL, 
nama VARCHAR(10) NOT NULL, 
alamat VARCHAR (20) NOT NULL, 
telepon VARCHAR (12) NOT NULL, 
PRIMARY KEY (id)
);

ALTER TABLE pelanggan CHANGE COLUMN id id_pelanggan INT(3);

CREATE TABLE barang(
kode INT (3) NOT NULL,
nama_barang VARCHAR (20) NOT NULL,
harga INT (11) NOT NULL,
stok INT (5) NOT NULL,
no_pembelian INT (3) NOT NULL,
PRIMARY KEY (kode)
);

ALTER TABLE barang CHANGE COLUMN kode kode_barang INT(3);

ALTER TABLE barang ADD COLUMN no_pembelian INT (3) NOT NULL AFTER stok;


CREATE TABLE penjualan(
kode_penjualan INT (3) NOT NULL ,
tanggal_penjualan DATE NOT NULL,
id INT (2) NOT NULL,
kode INT (3) NOT NULL,
jumlah_barang INT (3) NOT NULL,
total_harga INT (11) NOT NULL,
PRIMARY KEY (kode_penjualan)
);

ALTER TABLE penjualan CHANGE COLUMN kode kode_barang INT(3);


ALTER TABLE penjualan CHANGE COLUMN id id_pelanggan INT(3);


CREATE TABLE retur (
no_retur INT (3) NOT NULL,
tanggal_retur DATE NOT NULL,
id INT (2) NOT NULL,
kode INT (3) NOT NULL,
keterangan VARCHAR (15) NOT NULL,
jumlah_retur INT (3) NOT NULL,
PRIMARY KEY (no_retur)
);

ALTER TABLE retur CHANGE COLUMN id id_pelanggan INT(3);

ALTER TABLE retur CHANGE COLUMN kode kode_barang INT(3);

CREATE TABLE koreksi_stok(
no_koreksi_stok INT (3) NOT NULL,
tanggal_koreksi_stok DATE NOT NULL,
kode INT (3) NOT NULL,
total_stok INT (3) NOT NULL,
PRIMARY KEY (no_koreksi_stok)
);

ALTER TABLE koreksi_stok CHANGE COLUMN kode kode_barang INT(3);


CREATE TABLE pembelian (
no_pembelian INT (3) NOT NULL,
tanggal_pembelian DATE NOT NULL,
id_supplier INT (2) NOT NULL,
total_setor INT (3) NOT NULL,
jumlah_pembayaran INT (11) NOT NULL,
status_pembayaran VARCHAR (10) NOT NULL,
PRIMARY KEY (no_pembelian)
);




CREATE TABLE supplier (
id_supplier INT (2) NOT NULL,
nama VARCHAR (20) NOT NULL,
alamat VARCHAR (20) NOT NULL,
telepon VARCHAR (12) NOT NULL,
PRIMARY KEY (id_supplier)
);

ALTER TABLE supplier ADD COLUMN barang VARCHAR (20) NOT NULL AFTER telepon;
ALTER TABLE supplier ADD COLUMN harga_barang INT (10) NOT NULL AFTER barang;



ALTER TABLE penjualan ADD CONSTRAINT fk_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan);

ALTER TABLE penjualan ADD CONSTRAINT fk_barang FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang);

ALTER TABLE barang ADD CONSTRAINT fk_pembelian FOREIGN KEY (no_pembelian) REFERENCES pembelian (no_pembelian);

ALTER TABLE koreksi_stok ADD CONSTRAINT fk_koreksi_stok FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang);

ALTER TABLE koreksi_stok ADD CONSTRAINT fk_koreksi_stok FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang);
  
ALTER TABLE pembelian ADD CONSTRAINT fk_suplier FOREIGN KEY (id_supplier) REFERENCES supplier (id_supplier);

ALTER TABLE retur ADD CONSTRAINT fk_retur FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan);

ALTER TABLE retur ADD CONSTRAINT fk_retur_dua FOREIGN KEY (kode_barang) REFERENCES barang (kode_barang);



INSERT INTO pelanggan VALUES 
(001, 'Raib', 'Semen', '082938294829'),
(002, 'Seli', 'Mojo', '089824829172'),
(003, 'Ali', 'Mojoroto', '08787483948'),
(004, 'Batozar', 'Kota', '083784938471'),
(005, 'Ily', 'Ngadiluwih', '089876565456'),
(006, 'Fala', 'Banyakan', '087678936582'),
(007, 'Ilo', 'Pare', '088866663785'),
(008, 'Vey', 'Purwoasri', '084729402749'),
(009, 'Ou', 'Gampengrejo', '08656748888'),
(010, 'Panji', 'Krian', '087672938765');




INSERT INTO barang VALUES 
(001, 'Beras', 38000, 20, 001),
(002, 'Minyak', 21000, 19, 002),
(003, 'Gula', 19000, 18, 003),
(004, 'Mie', 32000, 17, 004),
(005, 'Tepung', 17000, 16, 005),
(006, 'Pensil', 4500,15 ,006),
(007, 'Sabun', 6000, 14, 007),
(008, 'Sapu', 9500, 13, 008),
(009, 'Bolu', 44000, 12, 009),
(010, 'Petis', 4500, 11, 010);



INSERT INTO penjualan VALUES
(001, '2024-03-26', 001, 001, 10, 380000),
(002, '2024-03-26', 002, 002, 9, 190000),
(003, '2024-03-26', 003, 003, 8, 152000),
(004, '2024-03-26', 004, 004, 7, 224000),
(005, '2024-03-26', 005, 005, 6, 84000),
(006, '2024-03-26', 006, 006, 5, 22500),
(007, '2024-03-26', 007, 007, 4, 24000),
(008, '2024-03-26', 008, 008, 3, 28500),
(009, '2024-03-26', 009, 009, 2, 88000),
(010, '2024-03-26', 010, 010, 1, 4500);


INSERT INTO retur VALUES
(001, '2024-03-27', 001, 001, 'Kemasan Rusak', 1),
(002, '2024-03-27', 002, 002, 'Kemasan Rusak', 2),
(003, '2024-03-27', 003, 003, 'Expired', 3),
(004, '2024-03-27', 004, 004, 'Expired', 4),
(005, '2024-03-27', 005, 005, 'Kemasan Rusak', 5),
(006, '2024-03-27', 006, 006, 'Barang Rusak', 4),
(007, '2024-03-27', 007, 007, 'Kemasan Rusak', 3),
(008, '2024-03-27', 008, 008, 'Barsng Rusak', 2),
(009, '2024-03-27', 009, 008, 'Expired', 1),
(010, '2024-03-27', 010, 010, 'Expired', 1);


INSERT INTO koreksi_stok VALUES
(001, '2024-03-26', 001, 20),
(002, '2024-03-26', 002, 19),
(003, '2024-03-26', 003, 18),
(004, '2024-03-26', 004, 17),
(005, '2024-03-26', 005, 16),
(006, '2024-03-26', 006, 15),
(007, '2024-03-26', 007, 14),
(008, '2024-03-26', 008, 13),
(009, '2024-03-26', 009, 12),
(010, '2024-03-26', 010, 11);


INSERT INTO pembelian VALUES
(001, '2024-03-20', 001, 20, 720000, 'Lunas'),
(002, '2024-03-20', 002, 19, 361000, 'Lunas'),
(003, '2024-03-20', 003, 18, 306000, 'Lunas'),
(004, '2024-03-20', 004, 17, 510000, 'Belum Lunas'),
(005, '2024-03-20', 005, 16, 195000, 'Belum Lunas'),
(006, '2024-03-20', 006, 15, 37500, 'Lunas'),
(007, '2024-03-20', 007, 14, 56000, 'Belum Lunas'),
(008, '2024-03-20', 008, 13, 97500, 'Lunas'),
(009, '2024-03-20', 009, 12, 504000, 'Belum Lunas'),
(010, '2024-03-20', 010, 11, 27500, 'Lunas');



INSERT INTO supplier VALUES 
(001, 'PT Mega Distribusi', 'Kediri', '085683942948', 'Beras', 36000),
(002, 'CV Jaya Makmur Grosir', 'Nganjuk', '085683849292', 'Minyak', 19000),
(003, 'UD Berkah Sejahtera', 'Tulungagung', '085249582049', 'Gula', 17000),
(004, 'PT Sentra Distribusi Swalayan', 'Blitar', '08568303829', 'Mie', 30000),
(005, 'CV Mutiara Swalayan', 'Trenggalek', '085184892948', 'Tepung', 15000),
(006, 'PT Sejahtera Utama Grosir', 'Jombang', '085628948294', 'Pensil', 2500),
(007, 'PT Bintang Swalayan', 'Mojokerto', '085658382022', 'Sabun', 4000),
(008, 'PT Prima Makmur Distribusi', 'Sidoarjo', '08568028402', 'Sapu', 7500),
(009, 'CV Berkah Maju Swalayan', 'Surabaya', '08563271849', 'Bolu', 42000),
(010, 'PT Swakarya Distribusi Swalayan', 'Bangkalan', '0853284929', 'Petis', 2500);



SELECT * FROM barang;
SELECT * FROM koreksi_stok;
SELECT * FROM pelanggan;
SELECT * FROM pembelian;
SELECT * FROM penjualan;
SELECT * FROM retur;
SELECT * FROM supplier;

