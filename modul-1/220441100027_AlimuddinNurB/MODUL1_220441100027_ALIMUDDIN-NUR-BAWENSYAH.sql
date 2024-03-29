CREATE DATABASE toko;

USE toko;

CREATE TABLE pelanggan (
id_pelanggan INT (20) NOT NULL,
nama_pelanggan VARCHAR(50)NOT NULL,
alamat VARCHAR(100)NOT NULL,
email VARCHAR(100)NOT NULL,
no_telephone VARCHAR(50)NOT NULL
);

ALTER TABLE pelanggan ADD umur INT AFTER nama_pelanggan;
SELECT * FROM pelanggan;
ALTER TABLE pelanggan MODIFY COLUMN no_telephone VARCHAR(100)NOT NULL;

alter table barang modify column kode_barang int(20)not null primary key;

desc pelanggan;

create table barang (
kode_barang int(20)not null,
nama_barang varchar(50)not null,
tgl_koreksi date not null,
stok_sebelum int(20)not null,
stok_sesudah int(20)not null,
harga_barang int(50)not null
);

alter table barang add kode_pembelian int(20)not null after harga_barang;

create table suplier (
id_suplier int(20)not null primary key,
nama_suplier varchar(50)not null,
alamat_suplier varchar(50)not null,
email varchar(50)not null,
no_telephone int(50)not null
);

alter table suplier modify column no_telephone varchar(100)not null;

create table retur (
kode_retur int(20)not null primary key,
tanggal_transaksi date not null,
total_harga int(50)not null,
id_pelanggan int(20)not null
);

alter table retur change column id_pelanggan kode_penjualan int(20)not null;
alter table retur drop column total_harga;

create table penjualan_ (
kode_penjualan int(20)not null primary key,
tgl_penjualan date not null,`retur`
id_pelanggan int(20)not null,
kode_barang int(20)not null,
total_harga int(50)not null
);



create table pembelian (
kode_pembelian int(20)not null primary key,
tanggal_pembelian date not null,
id_suplier int(20)not null,
kode_barang int(20)not null,
total_harga int(50)not null,
status_barang varchar(20)not null,
total_hutang int(20)
);

alter table barang
add constraint FK_pembelian
foreign key (kode_pembelian)
references pembelian(kode_pembelian);

alter table penjualan_
add constraint FK_pelanggan
foreign key (id_pelanggan)
references pelanggan(id_pelanggan);

alter table penjualan_
add constraint FK_barang
foreign key (kode_barang)
references barang(kode_barang);

alter table retur
add constraint FK_penjualan
foreign key (kode_penjualan)
references penjualan_(kode_penjualan);

alter table pembelian 
add constraint FK_suplier 
foreign key (id_suplier)
references suplier(id_suplier);

ALTER TABLE pembelian 
ADD CONSTRAINT FK_barang
FOREIGN KEY (kode_barang)
REFERENCES barang(kode_barang);

INSERT INTO suplier VALUES 
(01,'PT Suka Maju','Gresik','sukamaju@gmail.com','081267439237'),
(02,'CV Berkah Jaya','Surabaya','berkahjaya@gmail.com','082134567890'),
(03,'UD Maju Jaya Abadi','Jakarta','majuabadi@gmail.com','085678901234'),
(04,'PT Sejahtera Bersama','Bandung','sejahterabersama@gmail.com','087654321098'),
(05,'CV Mandiri Sentosa','Semarang','mandirisentosa@gmail.com','089123456789'),
(06,'PT Cahaya Baru','Yogyakarta','cahayabaru@gmail.com','081234567890'),
(07,'UD Sukses Makmur','Medan','suksesmakmur@gmail.com','082345678901'),
(08,'CV Gemilang Sejahtera','Makassar','gemilangsejahtera@gmail.com','083456789012'),
(09,'PT Cemerlang Bersama','Balikpapan','cemerlangbersama@gmail.com','084567890123'),
(10,'UD Sentosa Abadi','Surabaya','sentosaabadi@gmail.com','085678901234');

insert into pembelian values 
(010,'2003-06-17',01,150000,'Lunas',null), 
(020,'2003-02-25',03,200000,'Hutang',150000),
(030,'2003-05-21',05,300000,'Lunas',null),
(040,'2003-03-11',07,450000,'Lunas',null),
(050,'2003-08-16',09,255000,'Hutang',200000)
(60, '2003-09-10', 02, 750000, 'Hutang', 500000),
(70, '2003-10-05', 04, 500000, 'Hutang', 250000),
(80, '2003-11-20', 06, 455000, 'Hutang', 400000),
(90, '2003-12-15', 08, 350000, 'Lunas', NULL),
(100, '2003-04-30', 10, 100000, 'Lunas', NULL);

INSERT INTO barang VALUES 
(201, 'Pepsodent', '2003-02-10', 120, 50, 5000, 20),
(202, 'Biore', '2003-01-20', 200, 300, 25000, 10),
(203, 'Colgate', '2003-03-15', 150, 70, 6000, 40),
(204, 'Listerine', '2003-05-05', 100, 120, 12000, 30),
(205, 'Closeup', '2003-04-08', 180, 60, 7000, 50),
(206, 'Sensodyne', '2003-06-20', 90, 40, 8000, 70),
(207, 'Signal', '2003-07-12', 110, 80, 5500, 60),
(208, 'Aquafresh', '2003-08-25', 130, 90, 6500, 90),
(209, 'Oral-B', '2003-09-17', 170, 100, 9000, 100),
(210, 'Listerine', '2003-10-30', 140, 110, 11000, 80);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, alamat, email, no_telephone) VALUES 
(1, 'Budi Santoso', 'Jalan Merdeka No. 123, Jakarta Pusat', 'budi.santoso@example.com', '081234567890'),
(2, 'Anita Suryani', 'Jalan Raya Gajah Mada No. 456, Surabaya', 'anita.suryani@example.com', '082345678901'),
(3, 'Cahyo Wijaya', 'Jalan Sudirman No. 789, Bandung', 'cahyo.wijaya@example.com', '083456789012'),
(4, 'Dewi Kusuma', 'Jalan Diponegoro No. 321, Yogyakarta', 'dewi.kusuma@example.com', '084567890123'),
(5, 'Eko Pratama', 'Jalan Ahmad Yani No. 654, Medan', 'eko.pratama@example.com', '085678901234'),
(6, 'Fita Nugraha', 'Jalan Gajah Mada No. 987, Makassar', 'fita.nugraha@example.com', '086789012345'),
(7, 'Galih Ramadhan', 'Jalan Pahlawan No. 234, Semarang', 'galih.ramadhan@example.com', '087890123456'),
(8, 'Hesti Sari', 'Jalan Jenderal Sudirman No. 567, Denpasar', 'hesti.sari@example.com', '088901234567'),
(9, 'Indra Wijaya', 'Jalan Merak No. 890, Palembang', 'indra.wijaya@example.com', '089012345678'),
(10, 'Joko Susilo', 'Jalan Gajah Mada No. 432, Bandar Lampung', 'joko.susilo@example.com', '089123456789');

INSERT INTO penjualan_ VALUES
(310, '2003-04-05', 1, 201, 50000),
(320, '2003-05-10', 2, 202, 75000),
(330, '2003-06-15', 3, 203, 100000),
(340, '2003-07-20', 4, 204, 125000),
(350, '2003-08-25', 5, 205, 80000),
(360, '2003-09-30', 6, 206, 95000),
(370, '2003-10-05', 7, 207, 70000),
(380, '2003-11-10', 8, 208, 120000),
(390, '2003-12-15', 9, 209, 110000),
(400, '2004-01-20', 10, 210, 135000);

INSERT INTO retur VALUES 
(401, '2003-05-05', 310),
(402, '2003-06-10', 320),
(403, '2003-07-15', 330),
(404, '2003-08-20', 340),
(405, '2003-09-25', 350),
(406, '2003-10-30', 360),
(407, '2003-11-05', 370),
(408, '2003-12-10', 380),
(409, '2004-01-15', 390),
(410, '2004-02-20', 400);

Select * from barang;
select * from pelanggan;
select * from pembelian;
SELECT * FROM penjualan_;
SELECT * FROM retur;
SELECT * FROM suplier;

alter table retur rename to 'Pengembalian';

update pembelian set total_hutang=null where kode_pembelian=20;


Drop database toko;







