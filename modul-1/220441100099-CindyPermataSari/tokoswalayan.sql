CREATE DATABASE tokoSwalayan;
USE tokoSwalayan;

CREATE TABLE pelanggan(
idPelanggan INT(3) NOT NULL,
namaPelanggan VARCHAR(5) NOT NULL,
alamatPelanggan VARCHAR (15) NOT NULL,
noHp VARCHAR(12) NOT NULL,
PRIMARY KEY(idPelanggan)
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
idPelanggan INT(3) NOT NULL,
kodeBarang INT(3) NOT NULL,
jumlahBarang INT(3) NOT NULL,
totalHarga INT(10) NOT NULL,
PRIMARY KEY(kodePenjualan)
);


CREATE TABLE retur(
noRetur INT (3) NOT NULL,
tglRetur DATE NOT NULL,
idPelanggan INT(3) NOT NULL,
kodeBarang INT(3) NOT NULL,
keterangan VARCHAR (20) NOT NULL,
jumlahRetur INT(3) NOT NULL,
PRIMARY KEY(noRetur)
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


ALTER TABLE penjualan ADD CONSTRAINT fkPelanggan FOREIGN KEY (idPelanggan) REFERENCES pelanggan(idPelanggan);
ALTER TABLE penjualan ADD CONSTRAINT fkBarang FOREIGN KEY (kodeBarang) REFERENCES barang(kodeBarang);
ALTER TABLE barang ADD CONSTRAINT fkPembelian FOREIGN KEY (noPembelian) REFERENCES pembelian(noPembelian);
ALTER TABLE koreksistok ADD CONSTRAINT fkKoreksiStok FOREIGN KEY (kodeBarang) REFERENCES barang(kodeBarang);
ALTER TABLE pembelian ADD CONSTRAINT fkSupplier FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier);
ALTER TABLE retur ADD CONSTRAINT fkRetur FOREIGN KEY (idPelanggan) REFERENCES pelanggan(idPelanggan);
ALTER TABLE retur ADD CONSTRAINT fkRetur2 FOREIGN KEY (kodeBarang) REFERENCES barang(kodeBarang);

INSERT INTO supplier VALUES
(111,'Sentosa Megah','Surabaya','628734512345','Gula',20000),
(112,'Harmoni Sentra','Surabaya','628561234567','Minyak',17000),
(113,'Abadi Mulia Jaya','Gresik','628901234567','Biskuit',7000),
(114,'Intan Sejahtera','Surabaya','628211234567','Teh Kotak',5000),
(115,'Jaya Bersama','Malang','628311234567','Sabun',3000),
(116,'Mulya Jaya Utama','Gresik','628421234567','Rokok',18000),
(117,'Maju Lancar','Gresik','628151234567','Kecap',9000),
(118,'Sentosa Jaya','Surabaya','628181234567','Shampo',9000),
(119,'Jaya Abadi Sentra','Malang','628701234567','Permen',6000),
(120,'Sejahtera Mulia','Jakarta','628991234567','Lotion',12000);

INSERT INTO pembelian VALUES 
(010,'2024-03-01 09:35:20',111,2,40000,40000,'Lunas'),
(011,'2024-03-01 09:45:20',112,3,51000,51000,'Lunas'),
(012,'2024-03-01 09:55:20',113,3,21000,21000,'Lunas'),
(013,'2024-03-01 10:10:20',114,2,10000,0,'Hutang'),
(014,'2024-03-01 10:25:20',115,4,12000,0,'Hutang'),
(015,'2024-03-01 10:55:20',116,2,36000,0,'Hutang'),
(016,'2024-03-01 11:45:20',117,4,27000,0,'Hutang'),
(017,'2024-03-01 11:50:20',118,2,18000,10000,'Hutang'),
(018,'2024-03-01 11:55:20',119,2,12000,2000,'Hutang'),
(019,'2024-03-01 12:15:20',120,2,24000,24000,'Lunas');

INSERT INTO barang VALUES
(101,010,'Gula',22000,2),
(102,011,'Minyak',19000,3),
(103,012,'Biskuit',9000,3),
(104,013,'Teh Kotak',7000,2),
(105,014,'Sabun',7000,4),
(106,015,'Rokok',20000,2),
(107,016,'Kecap',11000,4),
(108,017,'Shampo',11000,2),
(109,018,'Permen',8000,2),
(110,019,'Lotion',14000,2);

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

INSERT INTO pelanggan VALUES
(220,'Bara','Sawahan','628987654321'),
(221,'Cahya','Gubeng','628876543210'),
(222,'Putri','Rungkut','628765432109'),
(223,'Lala','Rungkut','628654321098'),
(224,'Intan','Wonokromo','628543210987'),
(225,'Surya','Sawahan','628432109876'),
(226,'Mela','Sawahan','628321098765'),
(227,'Rifky','Gubeng','628210987654'),
(228,'Desi','Sukolilo','628109876543'),
(229,'Indah','Rungkut','628098765432');

INSERT INTO penjualan VALUES
(400,'2024-03-01 09:30:20',220,101,2,44000),
(401,'2024-03-01 09:35:20',221,102,1,19000),
(402,'2024-03-01 10:05:20',222,103,2,18000),
(403,'2024-03-01 10:15:20',223,104,1,9000),
(404,'2024-03-01 10:30:20',224,105,2,14000),
(405,'2024-03-01 11:20:20',225,106,1,20000),
(406,'2024-03-01 11:35:20',226,107,2,22000),
(407,'2024-03-01 11:40:20',227,108,1,11000),
(408,'2024-03-01 11:55:20',228,109,2,16000),
(409,'2024-03-01 12:05:20',229,110,1,14000);

INSERT INTO retur VALUES
(800,'2024-03-01 14:30:20',220,101,'Kemasan rusak',1),
(801,'2024-03-01 14:45:20',221,102,'Kemasan rusak',1),
(802,'2024-03-01 15:25:20',222,103,'Barang rusak',1),
(803,'2024-03-01 15:30:20',223,104,'Kemasan rusak',1),
(804,'2024-03-01 15:45:20',224,105,'Kemasan rusak',1),
(805,'2024-03-01 17:10:20',225,106,'Barang rusak',1),
(806,'2024-03-01 17:40:20',226,107,'Kemasan rusak',1),
(807,'2024-03-01 19:30:20',227,108,'Kemasan rusak',1),
(808,'2024-03-01 20:05:20',228,109,'Expired',1),
(809,'2024-03-01 20:15:20',229,110,'Expired',1);


SELECT * FROM supplier;
SELECT * FROM pembelian;
SELECT * FROM barang;
SELECT * FROM koreksistok;
SELECT * FROM pelanggan;
SELECT * FROM penjualan;
SELECT * FROM retur;

ALTER TABLE supplier CHANGE COLUMN  nama namaSupplier VARCHAR(20);

RENAME TABLE retur TO pengembalian;

DROP DATABASE tokoSwalayan;