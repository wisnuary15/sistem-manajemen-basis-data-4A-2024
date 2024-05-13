CREATE DATABASE tugasModul1;

USE tugasModul1;

CREATE TABLE pelanggan(
id_pelanggan INT(15) NOT NULL,
nama_pelanggan VARCHAR(20),
noTelp INT (15),
PRIMARY KEY(id_pelanggan)
);

CREATE TABLE barang(
id_barang INT(10) NOT NULL PRIMARY KEY,
nama_barang VARCHAR(20) NOT NULL,
harga_satuan INT(10) NOT NULL,
stok INT(4),
);

ALTER TABLE barang ADD askot VARCHAR(20) AFTER jenis_kelamin;

create table pembelian(
id_pembelian int(10) not null primary key,
id_barang int(10) not null,
id_supplier int (10) not null,
tanggal_beli date not null,
harga_beli int(10) not null,
jumlah int(5) not null,
total_hargaBeli int(15) not null,
foreign key (id_supplier) references supplier(id_supplier)
);

ALTER TABLE pembelian ADD CONSTRAINT fk_id_barang FOREIGN KEY(id_barang) REFERENCES barang(id_barang);

create table supplier(
id_supplier int(10) not null primary key,
nama_supplier varchar (20) not null,
alamat_supplier varchar(50) not null,
noTelp_supplier varchar(20) not null,
email_supplier varchar(20) not null
);

aLTER TABLE supplier MODIFY COLUMN nama_supplier VARCHAR(50) NOT NULL;


create table penjualan(
id_penjualan int(10) not null primary key,
tanggal_penjualan date,
total_hargaJual int(10)
);

create table penjualan_detail(
id_detailJual int(10) not null primary key,
id_penjualan int(10) not null,
id_barang int (10) not null,
jumlah_barang int(5) not null,
harga int(10) not null,
foreign key (id_penjualan) references penjualan(id_penjualan)
);

create table retur(
id_retur int(10) not null primary key,
id_supplier int(10) not null,
tanggal_retur date not null,
foreign key (id_supplier) references supplier(id_supplier)
);

create table retur_detail(
id_detailRetur int(10) not null primary key,
id_retur int(10) not null,
id_barang int(10) not null,
jumlah int(5) not null,
keterangan varchar(100),
foreign key (id_retur) references retur(id_retur),
foreign key (id_barang) references barang(id_barang)
);

create table keuangan(
id_keuangan int(10) not null primary key,
id_pembelian int(10) not null,
total_utang int(10) not null,
foreign key (id_pembelian) references pembelian(id_pembelian)
);

insert into barang values
(10001, 'roti tawar', 11000, 50),
(10002, 'roti sobek', 8000, 50),
(10003, 'roti sandwitch', 6000, 50),
(10004, 'selai nanas', 15000, 20),
(10005, 'cimory chocolate', 7000, 50),
(10006, 'cimory strawberry', 7000, 50),
(10007, 'cimory tiramisu', 7000, 50),
(10008, 'cimory marrie biscuit', 7000, 50),
(10009, 'cimory yogurt sq', 10000, 50),
(100010, 'cimory ypgurt drink', 9000, 50);

insert into pelanggan values
(00001, 'adel', 1234567890),
(00002, 'shafira', 0987654321),
(00003, 'devi', 3214560987),
(00004, 'tyas', 0981237654),
(00005, 'ikin', 9841890178),
(00006, 'alim', 9149109827),
(00007, 'akmal', 0912384651),
(00008, 'kun', 0248721741),
(00009, 'gent', 92348201034),
(000010, 'adhelia', 012637319);

insert into penjualan values
(20001, '2024-03-01', 11000),
(20002, '2024-03-01', 14000),
(20003, '2024-03-01', 15000),
(20004, '2024-03-01', 20000),
(20005, '2024-03-01', 9000),
(20006, '2024-03-02', 10000),
(20007, '2024-03-02', 11000),
(20008, '2024-03-02', 15000),
(20009, '2024-03-02', 15000),
(200010, '2024-03-02', 11000);

insert into penjualan_detail values
(30001, 20001, 10001, 1, 11000),
(30002, 20002, 10008, 2, 7000),
(30003, 20003, 10005, 1, 7000),
(30004, 20003, 10002, 1, 8000),
(30005, 20004, 10009, 2, 20000),
(30006, 20005, 100010, 1, 10000),
(30007, 20006, 10009, 1, 10000),
(30008, 20007, 10001, 1, 11000),
(30009, 20008, 10002, 1, 8000),
(300010, 20008, 10008, 1, 7000),
(300011, 20009, 10004, 1, 15000),
(300012, 200010, 10001, 1, 11000);

insert into supplier values
(90001, 'PT Cisarua Mountain Dairy Tbk', 'Bogor', 6287365, 'cimory.ac.id'),
(90002, 'PT Nippon Indosari Cormindo Tbk', 'Indonesia', 6283691, 'sariroti.ac.id'),
(90003, 'PT Astaguna Wisesa Tbk', 'Bekasi', 6281092, 'morin.ac.id'),
(90004, 'PT Tirta Fresindo Jaya', 'Indonesia', 6281234, 'tirtafres.ac.id'),
(90005, 'PT Tirta Sibayakindo', 'Indonesia', 6289865, 'aqua.ac.id'),
(90006, 'PT Sariguna Primatirta Tbk', 'Indonesia', 62845678, 'cleo.ac.id'),
(90007, 'PT Indonesia Bakery Family', 'Bandung', 6280987, 'aoka.ac.id'),
(90008, 'PT Indofood CBP', 'Indonesia', 6280183, 'indomie.ac.id'),
(90009, 'PT Bumi Alam Segar', 'Indonesia', 6281234, 'sedap.ac.id'),
(900010, 'PT Tirta Investama', 'Indonesia', 6286512, 'vit.ac.id');

insert into pembelian values
(40001, 10001, 90002, '2024-02-27', 9800, 60, 588000),
(40002, 10002, 90002, '2024-02-27', 7100, 60, 426000),
(40003, 10003, 90002, '2024-02-27', 5100, 60, 306000),
(40004, 10004, 90003, '2024-02-25', 13500, 60, 810000),
(40005, 10005, 90001, '2024-02-24', 5800, 60, 588000),
(40006, 10006, 90001, '2024-02-24', 5800, 60, 588000),
(40007, 10007, 90001, '2024-02-24', 5800, 60, 588000),
(40008, 10008, 90001, '2024-02-24', 5800, 60, 588000),
(40009, 10009, 90001, '2024-02-24', 8800, 60, 528000),
(400010, 100010, 90001, '2024-02-24', 7800, 60, 468000);

insert into retur values
(30001, 90001,'2024-02-26'),
(30002, 90002,'2024-02-23'),
(30003, 90003,'2024-02-21'),
(30004, 90002,'2024-02-20'),
(30005, 90002,'2024-02-18'),
(30006, 90003,'2024-02-17'),
(30007, 90001,'2024-02-16'),
(30008, 90002,'2024-02-15'),
(30009, 90002,'2024-02-10'),
(300010, 90003,'2024-02-9');

insert into retur_detail values
(50001, 30001, 100010, 2, 'kemasan rusak'),
(50002, 30002, 10001, 3, 'barang kadaluarsa'),
(50003, 30003, 10004, 5, 'kemasan rusak'),
(50004, 30004, 10003, 3, 'kemasan rusak'),
(50005, 30005, 10002, 2, 'barang kadaluarsa'),
(50006, 30006, 10004, 4, 'kemasan rusak'),
(50007, 30007, 10006, 3, 'kemasan rusak'),
(50008, 30008, 10002, 2, 'barang kadaluarsa'),
(50009, 30009, 10001, 2, 'barang kadaluarsa'),
(500010, 300010, 10004, 2, 'kemasan rusak');

insert into keuangan values
(60001, 40001, 118000),
(60002, 40002, 0),
(60003, 40003, 0),
(60004, 40004, 200000),
(60005, 40005, 200000),
(60006, 40006, 180000),
(60007, 40007, 0),
(60008, 40008, 21000),
(60009, 40009, 0),
(600010, 400010, 0);

select * from barang;

SELECT * FROM keuangan;

SELECT * FROM pelanggan;

SELECT * FROM pembelian;

SELECT * FROM penjualan;

SELECT * FROM penjualan_detail;

SELECT * FROM retur;

SELECT * FROM retur_detail;

SELECT * FROM supplier;

alter table pelanggan rename customer;

drop database tugasmodul1;