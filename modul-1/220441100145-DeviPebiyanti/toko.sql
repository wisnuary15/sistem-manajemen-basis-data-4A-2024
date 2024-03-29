CREATE DATABASE toko;
USE toko;

CREATE TABLE supplier(
	id_supplier INT(10) NOT NULL,
	nama_supplier VARCHAR(20) NOT NULL,
	alamat VARCHAR(20) NOT NULL,
	no_hp INT(10),
PRIMARY KEY (id_supplier)
);

ALTER TABLE supplier CHANGE COLUMN nomor_hp no_hp VARCHAR(20);

INSERT INTO supplier VALUES 
	(100, 'Rama', 'jl.pahlawan', 083863833932),
	(111, 'Bima', 'jl.mawar', 083263564487),
	(112, 'Tama', 'jl.melati', 083213281998),
	(113, 'Hendra', 'jl.tanah abang', 083992725283),
	(114, 'Akbar', 'jl.nias', 083234516872),
	(115, 'Faisal', 'jl.pramuka', 083231889282),
	(116, 'Dika', 'jl.basuki rahmat', 083129837373),
	(117, 'Zainal', 'jl.ahmad yani', 083163512299),
	(118, 'Fuad', 'jl.brigjen', 083773652117),
	(119, 'Ahmad', 'jl.rafles', 083327812632),
	(110, 'Fahri', 'jl.soekarno', 085826737123);


CREATE TABLE barang(
	id_barang INT(10) NOT NULL,
	nama_barang VARCHAR(20) NOT NULL,
	harga INT(10) NOT NULL,
	stok INT(10),
PRIMARY KEY (id_barang)
);

INSERT INTO barang VALUES
	(200, 'pepsodent', 8000, 30),
	(211, 'detergen', 5000, 25),
	(212, 'listerin', 10000, 20),
	(213, 'tisu', 11000, 30),
	(214, 'sabun mandi', 4000, 40),
	(215, 'shampo', 15000, 20),
	(216, 'pewangi', 6000, 35),
	(217, 'kapur barus', 5000, 30),
	(218, 'stela', 10000, 25),
	(219, 'baygon', 20000, 20);


CREATE TABLE penjual(
	id_penjual INT(10) NOT NULL,
	nama_penjual VARCHAR(20) NOT NULL,
PRIMARY KEY (id_penjual)
);

INSERT INTO penjual VALUES
	(001, 'Rosidah'),
	(002, 'Kinan');

CREATE TABLE pelanggan(
	id_pelanggan INT(10) NOT NULL,
	nama_pelanggan VARCHAR(20) NOT NULL,
PRIMARY KEY (id_pelanggan)
);

INSERT INTO pelanggan VALUES 
	(01, 'Devi'),
	(02, 'Nines'),
	(03, 'Khoirum'),
	(04, 'Adel'),
	(05, 'Fira'),
	(06, 'Tyas'),
	(07, 'Alim'),
	(08, 'Imam'),
	(09, 'Nana'),
	(10, 'Meida');
	

CREATE TABLE pemgiriman(
	id_pengiriman INT(10) NOT NULL,
	id_supplier INT(10) NOT NULL,
	id_barang INT(10) NOT NULL,
PRIMARY KEY (id_pengiriman),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
);

CREATE TABLE transaksi(
	id_transaksi INT(10) NOT NULL,
	id_barang INT(10) NOT NULL,
	id_pelanggan INT(10) NOT NULL,
	id_penjual INT(10) NOT NULL,
	tgl_transaksi DATE,
	jumlah INT(10) NOT NULL,
	total_harga INT(20) NOT NULL,
	total_bayar INT(20) NOT NULL,
PRIMARY KEY (id_transaksi),
FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
FOREIGN KEY (id_penjual) REFERENCES penjual(id_penjual)
);

ALTER TABLE transaksi ADD kembalian INT(20);

CREATE TABLE keuangan(
	id_keuangan INT(10) NOT NULL,
	id_transaksi INT(10) NOT NULL,
	pemasukan INT(20) NOT NULL,
	pengeluaran INT(20) NOT NULL,
PRIMARY KEY (id_keuangan),
FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
);

CREATE TABLE laporan(
	id_laporan INT(10) NOT NULL,
	id_keuangan INT(10) NOT NULL,
	tanggal DATE,
	stok_sisa INT(10) NOT NULL,
PRIMARY KEY (id_laporan),
FOREIGN KEY (id_keuangan) REFERENCES keuangan(id_keuangan)
);

CREATE TABLE return_barang(
	id_return INT(10) NOT NULL,
	id_supplier INT(10) NOT NULL,
	id_barang INT(10) NOT NULL,
	tgl_return DATE,
	detail_return VARCHAR(20) NOT NULL,
	jumlah_return int(10) not null,
primary key (id_return),
foreign key (id_barang) references barang(id_barang)
);