CREATE DATABASE swalayan;

USE swalayan;

CREATE TABLE pelanggan(
id_pelanggan INT (3) NOT NULL,
nama_pelanggan VARCHAR (15) NOT NULL,
alamat VARCHAR (20) NOT NULL,
PRIMARY KEY (id_pelanggan)
);

CREATE TABLE stok(
kode_barang INT (3) NOT NULL,
nama_barang VARCHAR (15) NOT NULL,
stok_barang INT (3) NOT NULL,
PRIMARY KEY (kode_barang)
);

CREATE TABLE retur(
id_retur INT (3) NOT NULL,
kode_barang INT(3) NOT NULL,
id_pelanggan INT (3) NOT NULL,
tgl_retur DATE NOT NULL,
keterangan_retur VARCHAR (25) NOT NULL,
PRIMARY KEY (id_retur)
);

CREATE TABLE pembelian_barang(
id_supplier INT (3) NOT NULL,
barang VARCHAR (15) NOT NULL,
alamat_supplier VARCHAR (20) NOT NULL,
kontak_supplier INT (12) NOT NULL,
nominal_harga INT (10) NOT NULL,
status_pembayaran VARCHAR (12) NOT NULL,
PRIMARY KEY (id_supplier)
);

CREATE TABLE penjualan(
id_penjualan INT (3) NOT NULL,
kode_barang INT (3) NOT NULL,
id_pelanggan INT (3) NOT NULL,
banyak_penjualan INT (3) NOT NULL,
total_harga INT (10)NOT NULL,
tgl_jual DATE NOT NULL,
PRIMARY KEY (id_penjualan)
);

CREATE TABLE koreksi_stok(
id_koreksi INT (3) NOT NULL,
jml_stok INT (3) NOT NULL,
nama_stok VARCHAR (15) NOT NULL,
PRIMARY KEY (id_koreksi)
);

ALTER TABLE retur ADD CONSTRAINT fkKodebarang FOREIGN KEY (kode_barang) REFERENCES stok(kode_barang);
ALTER TABLE retur ADD CONSTRAINT fkPelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan);

ALTER TABLE penjualan ADD CONSTRAINT fkNobarang FOREIGN KEY (kode_barang) REFERENCES stok(kode_barang);
ALTER TABLE penjualan ADD CONSTRAINT fkNopelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan);

INSERT INTO pelanggan VALUES
(001,'Arta','Jombang'),
(002,'Nadif','Madura'),
(003,'Sigma','Bojonegoro'),
(004,'Juan','Blora'),
(005,'Dani','Lamongan'),
(006,'Akmal','Kediri'),
(007,'Rafly','Gresik'),
(008,'Fiqi','Madura'),
(009,'Birur','Gresik'),
(010,'Nebula','Surabaya');

INSERT INTO stok VALUES
(779,'Shampo',12),
(432,'Detergent',23),
(098,'Sabun',10),
(936,'Minyak Goreng',30),
(212,'Pasta Gigi',6),
(643,'Es Krim', 40),
(924,'Susu', 20),
(513,'Kecap', 15),
(211,'Saus', 13),
(111,'Air Mineral',35);

UPDATE stok
SET kode_barang = '98'
WHERE nama_barang = 'Sabun';

INSERT INTO retur VALUES
(1,779,001,'2024-03-17','barang rusak',2),
(2,432,002,'2024-03-17','barang rusak',1),
(3,98,003,'2024-03-20','barang rusak',1),
(4,936,004,'2024-03-20','barang rusak',3),
(5,212,005,'2024-03-20','barang rusak',2),
(6,643,006,'2024-03-22','barang rusak', 2),
(7,924,007,'2024-03-22','barang rusak', 1),
(8,513,008,'2024-03-23','barang rusak', 1),
(9,211,009,'2024-03-24','barang rusak', 3),
(10,111,010,'2024-03-24','barang rusak',3);

INSERT INTO penjualan VALUES
(11,779,001,4,23000,'2024-03-10'),
(21,432,002,4,34000,',2024-03-10'),
(31,98,003,3,20000,'2024-03-19'),
(41,936,004,5,36000,'2024-03-19'),
(51,212,005,4,52000,'2024-03-19'),
(61,643,006,5,50000,'2024-03-19'),
(71,924,007,6,60000,'2024-03-20'),
(81,513,008,3,22000,'2024-03-20'),
(91,211,009,2,15000,'2024-03-22'),
(101,111,010,2,8000,'2024-03-22');

INSERT INTO koreksi_stok VALUES
(30,12,'Shampo'),
(41,23,'Detergent'),
(43,10,'Sabun'),
(45,30,'Minyak Goreng'),
(50,6,'Pasta Gigi'),
(52,40,'Es Krim'),
(54,20,'Susu'),
(59,15,'Kecap'),
(61,13,'Saus'),
(62,35,'Air Mineral');

INSERT INTO pembelian_barang VALUES 
(110,'Air Mineral','jl kenanga',08734512345,100000,'Lunas'),
(111,'Saus','jl mangga',08734512345,57000,'Lunas'),
(112,'Kecap','jl manggis',08734512345,21000,'Lunas'),
(113,'Susu','jl pahlawan',08734512345,10000,'Hutang'),
(114,'Es Krim','jl a,yani',08734512345,12000,'Hutang'),
(115,'Pasta gigi','jl veteran',08734512345,36000,'Hutang'),
(116,'Minyak Goreng','jl pegangsaan',08734512345,200000,'Hutang'),
(117,'Sabun','jl sumatra',08734512345,180000,'Hutang'),
(118,'Deterjent','jl sulawesi',08734512345,12000,'Hutang'),
(119,'Shampo','jl salak',08734512345,24000,'Lunas');


ALTER TABLE retur ADD jml_barang INT (3) NOT NULL;

SELECT * FROM koreksi_stok;
SELECT * FROM pelanggan;
SELECT * FROM pembelian_barang;
SELECT * FROM penjualan;
SELECT * FROM retur;
SELECT * FROM stok;

DROP DATABASE swalayan;