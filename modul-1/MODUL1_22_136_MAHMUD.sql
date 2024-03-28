CREATE DATABASE Toko_Klontong;

USE Toko_Klontong;

CREATE TABLE barang (
id_barang CHAR(5) NOT NULL, 
nama_barang VARCHAR(25) NOT NULL, 
harga_barang CHAR(10) NOT NULL, 
stok_barang INT(5) NOT NULL,
id_supplier CHAR(5) NOT NULL, PRIMARY KEY (id_barang));


CREATE TABLE data_supplier (
id_supplier INT(5) NOT NULL, 
nama_supplier VARCHAR (35) NOT NULL, 
no_telp INT(12) NOT NULL, 
alamat VARCHAR(35), 
tanggal_terakhir_stok DATE, 
harga_barang CHAR(10) NOT NULL, 
total_barang INT(10) NOT NULL, 
total_hutang CHAR (35) NOT NULL,
tanggal_terakhir_bayar DATE, PRIMARY KEY (id_supplier));

CREATE TABLE status_penjualan (
id_transaksi INT(5) NOT NULL, 
status_transaksi VARCHAR(35) NOT NULL);

CREATE TABLE laporan (
id_laporan INT(5) NOT NULL,  
id_barang INT(5) NOT NULL, 
id_transaksi INT(5) NOT NULL, 
total_transaksi VARCHAR (20) NULL,
PRIMARY KEY (id_laporan));

CREATE TABLE koreksi_stok (
id_barang INT(5) NOT NULL, 
nama_barang VARCHAR(35) NOT NULL, 
total_stok INT(10) NOT NULL, PRIMARY KEY (total_stok));

CREATE TABLE retur_penjualan (
id_penjualan INT (5),
tgl_jual DATE,
nama_barang VARCHAR (30),
jml_retur VARCHAR (20),
alasan_retur VARCHAR (50));

CREATE TABLE pembelian (
id_pembelian INT(10),
tgl_beli DATE,
id_supplier INT(5),
id_barang CHAR(5),
jml_beli INT(10),
harga_beli CHAR (20), PRIMARY KEY (id_pembelian));

CREATE TABLE penjualan(
id_penjualan INT (5) NOT NULL,
id_transaksi INT(5) NOT NULL, 
id_barang CHAR(5) NOT NULL, 
nama_barang VARCHAR(30)NOT NULL, 
jumlah VARCHAR(10) NOT NULL, 
tanggal_transaksi DATE, 
total_harga CHAR(10) NOT NULL, 
PRIMARY KEY (id_transaksi),
FOREIGN KEY (id_barang) REFERENCES barang (id_barang)
);

DROP TABLE penjualan;


INSERT INTO barang VALUES 
('001', 'pepsodent', '7.000', 30, '101'),
('002', 'molto', '20.000', 20, '102'),
('003', 'rinso', '25.000', 50, '103'),
('004', 'aqua', '22.000', 30, '104'),
('005', 'vit', '18.000', 20, '105'),
('006', 'lemineral', '25.000', 40, '106'),
('007', 'coklatos', '15.000', 20, '107'),
('008', 'nextar', '20.000', 30, '108'),
('009', 'roma kelapa', '7.000', 30, '109'),
('010', 'sip', '7.000', 30, '110');

SELECT * FROM barang;

INSERT INTO data_supplier VALUES
(501, 'Andreansyah', 0838309971, 'lamongan','2024-04-04','150.000', 20, '100.000','2024-05-05'),
(502, 'Putry Dwi Pebriani', 0838309972, 'Bojonegoro','2024-04-04','300.000',20, '200.000','2024-06-05'),
(503, 'rahmattullah', 0838309973, 'malang','2024-05-04','150.000',20, '100.000','2024-07-05'),
(504, 'abusri wahyuni', 0838309974, 'gersik','2024-06-01','250.000',20, '200.000','2024-08-05'),
(505, 'Abdul Qader Jailani', 0838309975, 'lamongan','2024-07-02','150.000',20, '150.000','2024-09-05'),
(506, 'Alesha azzahra', 0838309976, 'bojonegoro','2024-01-02','200.000',20, '200.000','2024-10-05'),
(507, 'nur fitriani', 0838309977, 'tuban','2024-02-01','150.000',20, '100.000','2024-11-05'),
(508, 'rafa adhiastha', 0838309978, 'lamongan','2024-08-08','100.000',20, '100.000','2024-12-05'),
(509, 'Eni wahyu ningrum', 0838309979, 'lamongan','2024-06-020','200.000',20, '100.000','2024-01-05'),
(510, 'Ansori', 0838309940, 'lamongan','2024-10-04','150.000',20, '100.000','2024-02-05');

SELECT * FROM data_supplier;

INSERT INTO koreksi_stok VALUES
('001', 'pepsodent',60),
('002', 'molto',70), 
('003', 'rinso',80),
('004', 'aqua',90),
('005', 'vit',100),
('006', 'lemineral',110),
('007', 'coklatos',120),  
('008', 'nextar',130),
('009', 'roma kelapa',140),
('010', 'sip',150);
SELECT * FROM koreksi_stok;

INSERT INTO penjualan VALUES
(1,401,'001','pepsodent','20','2024-01-10','140.000'),
(2,402,'002','molto','10','2024-02-11','200.000'),
(3,403,'003','rinso','20','2024-03-12','625.000'),
(4,404,'004','aqua','10','2024-04-13','220.000'),
(5,405,'005','vit','5','2024-05-14','90.000'),
(6,406,'006','lemineral','5','2024-06-15','125.000'),
(7,407,'007','coklatos','10','2024-07-16','150.000'),
(8,408,'008','nextar','20','2024-08-17','400.000'),
(9,409,'009','roma kelapa','20','2024-09-18','140.000'),
(10,410,'010','sip','20','2024-10-10','140.000');

SELECT * FROM penjualan;

INSERT INTO pembelian VALUES
(601,'2024-01-10',501,'001',20,'140.000'),
(602,'2024-02-11',502,'002',10,'200.000'),
(603,'2024-03-12',503,'003',20,'625.000'),
(604,'2024-04-13',504,'004',10,'220.000'),
(605,'2024-05-14',505,'005',5,'90.000'),
(606,'2024-06-15',506,'006',5,'125.000'),
(607,'2024-07-16',507,'007',10,'150.000'),
(608,'2024-08-17',508,'008',20,'400.000'),
(609,'2024-09-18',509,'009',20,'140.000'),
(610,'2024-10-10',510,'010',20,'140.000');
SELECT * FROM pembelian;

INSERT INTO status_penjualan VALUES
(401,'terjual'),
(402,'terjual'),
(403,'terjual'),
(404,'terjual'),
(405,'terjual'),
(406,'terjual'),
(407,'terjual'),
(408,'terjual'),
(409,'terjual'),
(410,'terjual');

SELECT * FROM status_penjualan;

INSERT INTO laporan VALUES
(301,'001',401,'200.000'),
(302,'002',402,'200.000'),
(303,'003',403,'700.000'),
(304, '004',404,'300.000'),
(305,'005',405,'100.000'),
(306,'006',406,'200.000'),
(307,'007',407,'200.000'),
(308,'008',408,'400.000'),
(309,'009',409,'150.000'),
(310,'010',410,'200.000');


INSERT INTO retur_penjualan VALUES
(1,'2024-12-06','pepsodent','2','rusak'),
(2,'2024-12-06','molto','4','expired'),
(3,'2024-12-06','rinso','5','expired'),
(4,'2024-12-06','aqua','1','expired'),
(5,'2024-12-06','vit','1','expired'),
(6,'2024-12-06','leminerel','2','expired'),
(7,'2024-12-06','coklatos','12','expired'),
(8,'2024-12-06','nextar','4','rusak'),
(9,'2024-12-06','roma kelapa','1','rusak'),
(10,'2024-12-06','sip','1','rusak');

ALTER TABLE barang RENAME TO data_barang;

DROP DATABASE toko_Klontong;
