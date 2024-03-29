CREATE DATABASE swalayan;


CREATE TABLE transaksi (
id_transaksi VARCHAR(10),
tanggal_transaksi DATE,
id_barang VARCHAR (10),
jumlah_barang INT (5),
total_harga BIGINT(15), 
id_pegawai VARCHAR(10),
id_pelanggan VARCHAR(10),
id_supplier VARCHAR(10),
FOREIGN KEY (id_transaksi) REFERENCES detail_transaksi(id_transaksi),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);

CREATE TABLE detail_transaksi(
id_transaksi VARCHAR (10) NOT NULL,
jenis_transaksi VARCHAR (50)NOT NULL,
PRIMARY KEY (id_transaksi)
);

CREATE TABLE barang(
id_barang VARCHAR (10) NOT NULL,
nama_barang VARCHAR (50) NOT NULL,
stok INT (10) NOT NULL,
PRIMARY KEY (id_barang)
);

ALTER TABLE barang ADD harga BIGINT (20) AFTER stok;

CREATE TABLE supplier(
id_supplier VARCHAR (10) NOT NULL,
nama_supplier VARCHAR (50) NOT NULL,
PRIMARY KEY (id_supplier) 
);

CREATE TABLE pegawai(
id_pegawai VARCHAR (10) NOT NULL,
nama_pegawai VARCHAR (50)NOT NULL,
jabatan VARCHAR (10) NOT NULL,
PRIMARY KEY (id_pegawai)
);

CREATE TABLE pelanggan (
id_pelanggan VARCHAR (10) NOT NULL,
nama_pelanggan VARCHAR (50)NOT NULL,
no_telp VARCHAR (13),
alamat VARCHAR (100),
PRIMARY KEY (id_pelanggan)
);

INSERT INTO barang VALUES
('b001', 'minyak goreng 1L', 10, 17000),
('b002', 'minyak goreng 2L', 7, 35000),
('b003', 'telur', 15, 2000),
('b004', 'gula 1kg', 8, 16000),
('b005', 'abc kecap manis 685 gr', 20, 16500),
('b006', 'beras 5kg', 5, 71000),
('b007', 'saori saus teriyaki', 11, 10000),
('b008', 'saori saus tiram', 12, 10000),
('b009', 'saori lada hitam', 9, 10000),
('b010', 'kobe tepung serbaguna', 8, 4900);

INSERT INTO pegawai VALUES
('pgw01', 'hidayah', 'kasir'),
('pgw02', 'amelia', 'kasir'),
('pgw03', 'nawfan', 'kasir'),
('pgw04', 'akhmad', 'gudang'),
('pgw05', 'tifaldi', 'gudang'),
('pgw06', 'nanda', 'gudang'),
('pgw07', 'yogik', 'gudang'),
('pgw08', 'ririn', 'penata barang'),
('pgw09', 'puspita', 'penata barang'),
('pgw10', 'bambang', 'penata barang');

INSERT INTO supplier VALUES
('s01', 'mufidah'),
('s02', 'rahma'),
('s03', 'aksa'),
('s04', 'angga'),
('s05', 'angkasa'),
('s06', 'rieke'),
('s07', 'laeli'),
('s08', 'rizkia'),
('s09', 'rangga'),
('s10', 'abe');

INSERT INTO pelanggan VALUES
('p01', 'shafira', '081234567892', 'dupak'),
('p02', 'novia','085234567891', 'kemayoran' ),
('p03', 'adiba','081234567895', 'morokrembangan'),
('p04', 'aldi','0892345678913', 'banyu urip'),
('p05', 'ibra','081234567897', 'tambak'),
('p06', 'rafa','089234567899', 'kali rungkut'),
('p07', 'abas','085234567847', 'tambak'),
('p08', 'deva','089234567824', 'dupak'),
('p09', 'aska','081234567823', 'morokrembangan'),
('p10', 'bisma','081234567854', 'tambak');

INSERT INTO detail_transaksi VALUES
('dt01', 'penjualan'),
('dt02', 'pengembalian'),
('dt03', 'pembelian'),
('dt04', 'koreksi stok');

INSERT INTO transaksi VALUES
('dt01', '2024-03-20', 'b002', 1, 35000, 'pgw01', 'p01', null),
('dt02', '2024-03-20', 'b002', 1, 35000, 'pgw01', 'p01', NULL),
('dt03', '2024-03-21', 'b001', 10, 170000, 'pgw05', NULL, 's01' ),
('dt01','2024-03-21', 'b006', 1, 71000, 'pgw03','p02', NULL),
('dt01','2024-03-21','b009', 1, 10000, 'pgw03','p03', NULL),
('dt03','2024-03-21','b007', 6, 60000, 'pgw04', NULL, 's02'),
('dt01','2024-03-22', 'b005', 3, 49500, 'pgw02','p04', NULL),
('dt03','2024-03-22','b008',7 , 70000, 'pgw06', NULL, 's03'),
('dt03','2024-03-25', 'b003', 12, 24000, 'pgw07', NULL, 's04'),
('dt01','2024-03-25','b004', 2, 32000, 'pgw01','p05', NULL);

INSERT INTO transaksi VALUES 
('dt01', '2024-03-25', 'b002', 1, 35000, 'pgw02', 'p01', null);

select * from barang;
SELECT * FROM detail_transaksi;
SELECT * FROM pegawai;
SELECT * FROM pelanggan;
SELECT * FROM supplier;
SELECT * FROM transaksi;

ALTER TABLE detail_transaksi RENAME to jenis_transaksi;

Drop database swalayan;
