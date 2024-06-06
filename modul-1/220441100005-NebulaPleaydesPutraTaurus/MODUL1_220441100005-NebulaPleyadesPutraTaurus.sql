CREATE DATABASE nebula_saba_market;

USE nebula_saba_market;

CREATE TABLE barang(
  id_produk INT AUTO_INCREMENT PRIMARY KEY,
  nama_produk VARCHAR(20),
  harga INT,
  jenis_produk VARCHAR(30),
  stok INT
);

INSERT INTO barang (nama_produk, harga, jenis_produk, stok) VALUES ('Lifeboy', 3000, 'Sabun Dan Perawatan Diri', 30)
INSERT INTO barang (nama_produk, harga, jenis_produk, stok) VALUES 
('Beras 1 kg', 18000, 'Bahan Makanan', 10),
('Indomie', 3500, 'Bahan Makanan', 200),
('Rokok Surya', 21000, 'Kebutuhan Tersier', 10),
('Masako', 1000, 'Bahan Makanan', 40),
('Royco', 1000, 'Bahan Makanan', 30),
('Buku Tulis', 3000, 'Alat Tulis', 10),
('Pulpen', 18000, 'Alat Tulis', 10),
('Stipo Kertas', 18000, 'Alat Tulis', 10),
('Kertas HVS Per-Pak', 40000, 'Alat Tulis', 50);


CREATE TABLE karyawan(
  id_karyawan INT,
  nama_karyawan VARCHAR(50),
  umur INT,
  shift ENUM ('pagi', 'malam')
);

ALTER TABLE karyawan
ADD PRIMARY KEY (id_karyawan);

DROP TABLE karyawan

CREATE TABLE hutang(
  id_hutang INT,
  hutang_supplier INT,
  pembelian_supplier INT,
  nama_supplier VARCHAR(50)
);

INSERT INTO hutang (id_hutang, hutang_supplier, pembelian_supplier, nama_supplier) VALUES
(1, 1000000, 10, 'Ahmad Lumbung Padi'),
(2, 32872109, 10, 'Ahmad Lumbung Padi'),
(3, 1000000, 10, 'Ahmad Lumbung Padi'),
(4, 1000000, 10, 'Ahmad Lumbung Padi'),
(5, 23423443, 10, 'Rizki Big Boss'),
(6, 1000000, 10, 'Rizki Big Boss'),
(7, 1000000, 10, 'Rizki Big Boss'),
(8, 1000000, 10, 'Nanad Betadine'),
(9, 1000000, 10, 'Nanad Betadine'),
(10, 1000000, 10, 'Nanad Betadine');

ALTER TABLE hutang
ADD PRIMARY KEY (id_hutang);

CREATE TABLE supplier(
  id_supplier INT,
  kontak_supplier INT,
  nama_supplier VARCHAR(50),
  jenis_barang VARCHAR(30)
);

INSERT INTO supplier (id_supplier, kontak_supplier, nama_supplier, jenis_barang) VALUES
(1, 0812333179, 'Ahmad Lumbung Padi', 'Bahan Makanan'),
(2, 0812333179, 'Ahmad Lumbung Padi', 'Bahan Makanan'),
(3, 0812333140, 'James Roti Balap', 'Bahan Makanan'),
(4, 0812333140, 'James Roti Balap', 'Bahan Makanan'),
(5, 0812333140, 'James Roti Balap', 'Bahan Makanan'),
(6, 0815222819, 'Rizki Big Boss', 'Alat Tulis'),
(7, 0815222819, 'Rizki Big Boss', 'Alat Tulis'),
(8, 0815222819, 'Rizki Big Boss', 'Alat Tulis'),
(9, 0815222819, 'Rizki Big Boss', 'Alat Tulis'),
(10, 0815222810, 'Nanad Betadine', 'Kebutuhan Tersier');

ALTER TABLE supplier
ADD PRIMARY KEY (id_supplier);

CREATE TABLE pelanggan(
  id_pelanggan INT,
  nama_pelanggan VARCHAR(50),
  jumlah_pengembalian INT
);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, jumlah_pengembalian) VALUES
(1, 'Aristoteles', 0),
(2, 'David Marimas', 0),
(3, 'Wilhelm Nganjuk', 0),
(4, 'Rahmat Tahalu Asik', 0),
(5, 'Jimmy Nusakambangan', 0),
(6, 'Aries Multatuli', 2),
(7, 'Rian Bojonegoro', 0),
(8, 'Majid Amalan Soleh', 0),
(9, 'Crazy Killer Free Fire', 0),
(10, 'Einstain Lamongan', 4);


INSERT INTO pelanggan

ALTER TABLE pelanggan
ADD PRIMARY KEY (id_pelanggan);

ALTER TABLE pelanggan
DROP PRIMARY KEY;

ALTER TABLE pelanggan
ADD PRIMARY KEY (nama_pelanggan);

CREATE TABLE struk(
  id_struk INT,
  nama_pelanggan VARCHAR(50),
  nama_karyawan VARCHAR(50),
  jumlah_pembelian INT,
  total_harga INT
);

INSERT INTO struk (id_struk, nama_pelanggan, nama_karyawan, jumlah_pembelian, total_harga) VALUES
(1, 'Aristoteles', 'Rian', 3, 20000),
(2, 'David Marimas', 'Rian', 3, 20000),
(3, 'Wilhelm Nganjuk', 'Rian', 3, 8000),
(4, 'Rian Bojonegoro', 'Rian', 3, 7000),
(5, 'Rahmat Tahalu Asik', 'Rian', 3, 40000),
(6, 'Jimmy Nusakambangan', 'Rian', 3, 50000),
(7, 'Aries Multatuli', 'Rian', 3, 10000),
(8, 'Majid Amalan Soleh', 'Rian', 3, 200000),
(9, 'Crazy Killer Free Fire', 'Rian', 3, 20000000),
(10, 'Einstain Lamongan', 'Rian', 3, 45000);


ALTER TABLE struk
ADD PRIMARY KEY (id_struk);

CREATE TABLE pengembalian_barang(
  id_pengembalian INT,
  nama_barang VARCHAR(50),
  status_pengembalian VARCHAR(20)
);

INSERT INTO pengembalian_barang (id_pengembalian, nama_barang, status_pengembalian) VALUES
(1, 'Aristoteles', 'Belum Dikembalikan'),
(2, 'David Marimas', 'Belum Dikembalikan'),
(3, 'Wilhelm Nganjuk', 'Belum Dikembalikan'),
(4, 'Rahmat Tahalu Asik', 'Belum Dikembalikan'),
(5, 'Jimmy Nusakambangan', 'Belum Dikembalikan'),
(6, 'Aries Multatuli', 'Sudah Dikembalikan'),
(7, 'Rian Bojonegoro', 'Belum Dikembalikan'),
(8, 'Majid Amalan Soleh', 'Belum Dikembalikan'),
(9, 'Crazy Killer Free Fire', 'Belum Dikembalikan'),
(10, 'Einstain Lamongan', 'Sudah Dikembalikan');


ALTER TABLE pengembalian_barang
ADD PRIMARY KEY (id_pengembalian);

CREATE TABLE penjualan(
  id_penjualan INT,
  nama_barang VARCHAR(50),
  jumlah_yang_terjual INT,
  total_harga_penjualan INT
);

INSERT INTO penjualan (id_penjualan, nama_barang, jumlah_yang_terjual, total_harga_penjualan) VALUES
(1, 'Buku Tulis', 100, 500000),
(2, 'Pensil', 150, 75000),
(3, 'Penghapus', 80, 160000),
(4, 'Penggaris', 120, 480000),
(5, 'Pensil Warna', 200, 100000),
(6, 'Spidol', 50, 100000),
(7, 'Penggaris Setrum', 30, 450000),
(8, 'Stabilo', 70, 140000),
(9, 'Buku Catatan', 90, 450000),
(10, 'Lem Stick', 120, 360000);


ALTER TABLE penjualan
ADD PRIMARY KEY (id_penjualan);

alter table penjualan
rename to penjualan_barang;

SELECT * FROM barang

drop database nebula_saba_market;
