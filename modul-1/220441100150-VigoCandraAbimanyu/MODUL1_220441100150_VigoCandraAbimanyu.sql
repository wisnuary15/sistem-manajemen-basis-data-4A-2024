CREATE DATABASE Tokoku;
USE Tokoku;

CREATE TABLE customer(
idCustomer INT(3) NOT NULL,
namaCustomer VARCHAR(5) NOT NULL,
alamatCustomer VARCHAR (15) NOT NULL,
noHp VARCHAR(12) NOT NULL,
PRIMARY KEY(idCustomer)
);


CREATE TABLE barang(
kodeBarang INT(3) NOT NULL,
noPembelian INT(3) NOT NULL,
namaBarang VARCHAR(20) NOT NULL,
hargaBarang INT(15) NOT NULL,
stokBarang INT(5) NOT NULL,
PRIMARY KEY(kodeBarang)
);


CREATE TABLE penjualan(
kodePenjualan INT(3) NOT NULL,
tglPenjualan DATE NOT NULL,
idCustomer INT(3) NOT NULL,
kodeBarang INT (3) NOT NULL,
jumlahBarang INT(3) NOT NULL,
totalHarga INT(10) NOT NULL,
PRIMARY KEY(kodePenjualan),
FOREIGN KEY (kodeBarang) REFERENCES barang(kodeBarang)
);




CREATE TABLE kembalikan(
noKembali INT (3) NOT NULL,
tglKembali DATE NOT NULL,
idCustomer INT(3) NOT NULL,
kodeBarang INT(3) NOT NULL,
keterangan VARCHAR (20) NOT NULL,
jumlah INT(3) NOT NULL,
PRIMARY KEY(noKembali)
);

CREATE TABLE koreksiStok(
noKoreksi INT(3) NOT NULL,
tglKoreksi DATE NOT NULL,
kodeBarang INT(3) NOT NULL,
stokLuar INT(3) NOT NULL,
stokDalam INT(3) NOT NULL,
totalStok INT(3) NOT NULL,
PRIMARY KEY(noKoreksi)
);

CREATE TABLE pembelian(
noPembelian INT(3) NOT NULL,
tglPembelian DATE NOT NULL,
idSupplier INT(3) NOT NULL,
totalSetor INT(3) NOT NULL,
totalHutang INT(10) NOT NULL,
pembayaran INT(15) NOT NULL,
statusPembayaran VARCHAR(6) NOT NULL,
PRIMARY KEY(noPembelian)
);



CREATE TABLE supplier(
idSupplier INT(3) NOT NULL,
nama VARCHAR(20) NOT NULL,
alamatSupplier VARCHAR(10) NOT NULL,
noTlp VARCHAR(12) NOT NULL,
barang VARCHAR(15) NOT NULL,
harga INT(10) NOT NULL,
PRIMARY KEY(idSupplier)
);


INSERT INTO supplier VALUES
(111,'PT JAYA ABADI','Jakarta','628734510001','Gula',20000),
(112,'PT SENTOSA JAYA','Sidoarjo','628561230002','Beras',17000),
(113,'CV AGUNG SEJAHTERA','Gresik','628901230003','Minyak',7000),
(114,'CV INDAH BERSAMA','Surabaya','628211230004','Mie Instan',5000),
(115,'PT ABADI JAYA','Bojonegoro','628311230005','Sabun',3000),
(116,'CV BERSAMA JAYA','Mojokerto','628421230006','Rokok',18000),
(117,'PT SENTRA JAYA','Gresik','628151230007','telur',9000),
(118,'CV AGUNG JAYA','Surabaya','628181230008','Shampo',9000),
(119,'PT SEJAHTERA JAVA','Jogjakarta','62870120009','Permen',6000),
(120,'CV MULIA JAYA','Jakarta','628991230010','Roti',12000);

INSERT INTO pembelian VALUES 
(010,'2024-03-02 09:35:20',111,2,40000,0,'Hutang'),
(011,'2024-03-03 09:45:20',112,3,51000,51000,'Lunas'),
(012,'2024-03-01 09:55:20',113,3,21000,21000,'Hutang'),
(013,'2024-03-04 10:10:20',114,2,10000,0,'Hutang'),
(014,'2024-03-05 10:25:20',115,4,12000,0,'Hutang'),
(015,'2024-03-06 10:55:20',116,2,36000,0,'Hutang'),
(016,'2024-03-07 11:45:20',117,4,27000,0,'Hutang'),
(017,'2024-03-08 11:50:20',118,2,18000,0,'Hutang'),
(018,'2024-03-09 11:55:20',119,2,12000,2000,'Lunas'),
(019,'2024-03-10 12:15:20',120,2,24000,24000,'Lunas');

INSERT INTO barang VALUES
(101,010,'Gula',22000,2),
(102,011,'Beras',19000,3),
(103,012,'Minyak',9000,3),
(104,013,'Mie Intan',7000,2),
(105,014,'Sabun',7000,4),
(106,015,'Rokok',20000,2),
(107,016,'telur',11000,4),
(108,017,'Shampo',11000,2),
(109,018,'Permen',8000,2),
(110,019,'Roti',14000,2);

INSERT INTO koreksistok VALUES
(500,'2024-03-01',101,4,2,6),
(501,'2024-03-01',102,2,3,5),
(502,'2024-03-01',103,4,3,7),
(503,'2024-03-01',104,2,2,4),
(504,'2024-03-01',105,4,4,8),
(505,'2024-03-01',106,2,2,4),
(506,'2024-03-01',107,4,4,8),
(507,'2024-03-01',108,2,2,4),
(508,'2024-03-01',109,4,2,6),
(509,'2024-03-01',110,2,2,4);

INSERT INTO customer VALUES
(220,'Bara','Kebraoan','628987657878'),
(221,'Cahya','Wonocolo','628876538787'),
(222,'Putri','Karang Pilang','628765432658'),
(223,'Lala','Rungkut','62865432735'),
(224,'Intan','Ngagel','628543218788'),
(225,'Surya','Pabean','628437309876'),
(226,'Mela','Wiyung','628321098765'),
(227,'Rifky','Gubeng','628210987654'),
(228,'Desi','Sukolilo','628109876543'),
(229,'Indah','Wonokromo','628098765432');

INSERT INTO penjualan VALUES
(400,'2024-03-01',220,101,2,44000),
(401,'2024-03-02',221,102,1,19000),
(402,'2024-03-03',222,103,2,18000),
(403,'2024-03-04',223,104,1,9000),
(404,'2024-03-05',224,105,2,14000),
(405,'2024-03-06 ',225,106,1,20000),
(406,'2024-03-07',226,107,2,22000),
(407,'2024-03-08',227,108,1,11000),
(408,'2024-03-09',228,109,2,16000),
(409,'2024-03-10',229,110,1,14000);

INSERT INTO kembalikan VALUES
(900,'2024-03-02 14:30:20',220,101,'Rusak',1),
(901,'2024-03-03 14:45:20',221,102,'Rusak',1),
(902,'2024-03-04 15:25:20',222,103,'Rusak',1),
(903,'2024-03-05 15:30:20',223,104,'Expied',1),
(904,'2024-03-06 15:45:20',224,105,'Rusak',1),
(905,'2024-03-07 17:10:20',225,106,'Expied ',1),
(906,'2024-03-08 17:40:20',226,107,'Rusak',1),
(907,'2024-03-09 19:30:20',227,108,'Rusak',1),
(908,'2024-03-10 20:05:20',228,109,'Rusak',1),
(909,'2024-03-11 20:15:20',229,110,'Rusak',1);


SELECT * FROM supplier;
SELECT * FROM pembelian;
SELECT * FROM barang;
SELECT * FROM koreksistok;
SELECT * FROM customer;
SELECT * FROM penjualan;
SELECT * FROM kembalikan;




ALTER TABLE kembalikan CHANGE COLUMN noKembali idKembali INT (20);

DROP DATABASE tokoSwalayan;