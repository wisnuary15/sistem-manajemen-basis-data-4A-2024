CREATE DATABASE library;
USE library;

CREATE TABLE petugas (
id_petugas INT(10) NOT NULL,
username VARCHAR (15) NOT NULL,
PASSWORD VARCHAR (15) NOT NULL,
nama_petugas VARCHAR (25) NOT NULL,
PRIMARY KEY (id_petugas)
);

CREATE TABLE buku (
kode_buku INT (10) NOT NULL,
judul_buku VARCHAR (25) NOT NULL,
pengarang_buku VARCHAR (30) NOT NULL,
penerbit_buku VARCHAR (30) NOT NULL,
tahun_buku VARCHAR (10) NOT NULL,
jumlah_buku VARCHAR (5) NOT NULL,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL,
primary key (kode_buku)
);

create table anggota (
id_anggota int (10) not null,
nama_anggota VARCHAR (20) NOT NULL,
angkatan_anggota VARCHAR (6) NOT NULL,
tempat_lahir_anggota VARCHAR (20) NOT NULL,
tanggal_lahir_anggota date,
no_telp int (12) not null,
jenis_kelamin VARCHAR (15) NOT NULL,
status_pinjam VARCHAR (15) NOT NULL,
primary key (id_anggota)
);

create table pengembalian (
kode_kembali int (10) not null,
id_anggota int (10) NOT NULL,
kode_buku int (10) NOT NULL,
id_petugas int (10) not null,
tgl_pinjam date,
tgl_kembali date,
denda VARCHAR (15) NOT NULL,
primary key (kode_kembali)
);

create table peminjaman (
kode_peminjaman int (10) not null,
id_anggota INT (10) NOT NULL,
id_petugas INT (10) NOT NULL,
tgl_pinjam date,
tgl_kembali date,
kode_buku int (10) not null, 
primary key (kode_peminjaman)
);

ALTER TABLE peminjaman
ADD CONSTRAINT anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
ADD CONSTRAINT petugas FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
ADD CONSTRAINT kode FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE pengembalian
ADD CONSTRAINT fk_anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
ADD CONSTRAINT fk_petugas FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
ADD CONSTRAINT fk_kode FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

INSERT INTO buku VALUES 
(101, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '100', 'tersedia', 'Fiksi'),
(102, 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '75', 'tersedia', 'Romance'),
(103, 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '50', 'tersedia', 'Fiksi Sejarah'),
(104, 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2002', '90', 'tersedia', 'Fiksi'),
(105, 'Garis Waktu', 'Fiersa Besari', 'MediaKita', '2017', '120', 'tersedia', 'Non-Fiksi'),
(106, '99 Cahaya di Langit Eropa', 'Hanum Salsabiela Rais', 'Falcon Publishing', '2011', '80', 'tersedia', 'Travelogue'),
(107, 'Laut Bercerita', 'Leila S. Chudori', 'Kepustakaan Populer Gramedia', '2019', '60', 'tersedia', 'Fiksi'),
(108, 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '70', 'tersedia', 'Fiksi'),
(109, 'The Alchemist', 'Paulo Coelho', 'Bentang Pustaka', '1988', '100', 'tersedia', 'Fiksi'),
(110, 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '85', 'tersedia', 'Fiksi');

INSERT INTO petugas VALUES 
(201, 'panji', 'panji123', 'Panji Setiawan'),
(202, 'budi', 'budi123', 'Budi Sudarsono'),
(203, 'rudi', 'rudi123', 'Rudi Widodo');

INSERT INTO anggota VALUES 
(301, 'Agus', '2018', 'Jakarta', '1999-03-15', 08123450, 'Laki-laki', 'Meminjam'),
(302, 'Budi', '2019', 'Bandung', '2000-05-20', 08123451, 'Laki-laki', 'Meminjam'),
(303, 'Citra', '2020', 'Surabaya', '2001-07-25', 08123456, 'Perempuan', 'Meminjam'),
(304, 'Dewi', '2021', 'Semarang', '2002-09-30', 08123457, 'Perempuan', 'Meminjam'),
(305, 'Eka', '2022', 'Yogyakarta', '2003-11-05', 08123458, 'Laki-laki', 'Meminjam'),
(306, 'Fani', '2018', 'Surakarta', '1999-01-10', 08123459, 'Perempuan', 'Meminjam'),
(307, 'Guntur', '2019', 'Palembang', '2000-02-15', 08123455, 'Laki-laki', 'Meminjam'),
(308, 'Hana', '2020', 'Manado', '2001-04-20', 08123454, 'Perempuan', 'Meminjam'),
(309, 'Indra', '2021', 'Makassar', '2002-06-25', 08123453, 'Laki-laki', 'Meminjam'),
(310, 'Joko', '2022', 'Medan', '2003-08-30', 08123452, 'Laki-laki', 'Meminjam');

INSERT INTO pengembalian (kode_kembali, id_anggota, id_petugas, tgl_pinjam, tgl_kembali, kode_buku, denda) VALUES 
(501, 301, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(502, 301, 202, '2024-04-02', '2024-04-09', 102, 'tidak ada'),
(503, 301, 203, '2024-04-09', '2024-04-16', 103, 'tidak ada'),
(504, 301, 203, '2024-04-09', '2024-04-16', 104, 'tidak ada'),
(505, 301, 203, '2024-04-09', '2024-04-16', 105, 'tidak ada'),
(506, 301, 201, '2024-04-16', '2024-04-23', 106, 'tidak ada'),
(507, 301, 201, '2024-04-16', '2024-04-23', 107, 'tidak ada'),

(508, 302, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(509, 302, 202, '2024-04-09', '2024-04-09', 102, 'tidak ada'),
(510, 302, 203, '2024-04-09', '2024-04-16', 103, 'tidak ada'),
(511, 302, 203, '2024-04-09', '2024-04-16', 104, 'tidak ada'),
(512, 302, 201, '2024-04-16', '2024-04-23', 105, 'tidak ada'),
(513, 302, 201, '2024-04-16', '2024-04-23', 106, 'tidak ada'),

(514, 303, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(515, 303, 202, '2024-04-02', '2024-04-09', 102, 'tidak ada'),
(516, 303, 203, '2024-04-09', '2024-04-09', 103, 'tidak ada'),
(517, 303, 203, '2024-04-09', '2024-04-09', 104, 'tidak ada'),
(518, 303, 201, '2024-04-16', '2024-04-23', 105, 'tidak ada'),
(519, 303, 201, '2024-04-16', '2024-04-23', 106, 'tidak ada'),

(520, 303, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(521, 303, 202, '2024-04-02', '2024-04-09', 102, 'tidak ada'),
(522, 303, 201, '2024-04-16', '2024-04-23', 103, 'tidak ada'),
(523, 303, 201, '2024-04-16', '2024-04-23', 104, 'tidak ada'),
(524, 304, 202, '2024-04-02', '2024-04-09', 105, 'tidak ada'),
(525, 304, 202, '2024-04-02', '2024-04-09', 106, 'tidak ada'),
(526, 305, 202, '2024-04-02', '2024-04-09', 107, 'tidak ada'),
(527, 305, 202, '2024-04-02', '2024-04-09', 108, 'tidak ada'),
(528, 306, 202, '2024-04-02', '2024-04-09', 109, 'tidak ada'),
(529, 306, 201, '2024-04-16', '2024-04-23', 110, 'tidak ada'),
(530, 307, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(531, 307, 203, '2024-04-02', '2024-04-09', 102, 'tidak ada'),
(532, 308, 202, '2024-04-02', '2024-04-09', 103, 'tidak ada'),
(533, 308, 203, '2024-04-09', '2024-04-16', 104, 'tidak ada'),
(534, 309, 201, '2024-04-16', '2024-04-23', 105, 'tidak ada'),
(535, 309, 201, '2024-04-16', '2024-04-23', 106, 'tidak ada'),
(536, 310, 201, '2024-04-02', '2024-04-09', 107, 'tidak ada'),
(537, 310, 203, '2024-04-09', '2024-04-16', 108, 'tidak ada');

INSERT INTO peminjaman VALUES 
(401, 301, 201, '2024-04-02', '2024-04-09', 101),
(402, 301, 201, '2024-04-02', '2024-04-09', 102),
(403, 301, 202, '2024-04-09', '2024-04-16', 103),
(404, 301, 202, '2024-04-09', '2024-04-16', 104),
(405, 301, 202, '2024-04-09', '2024-04-16', 105),
(406, 301, 203, '2024-04-16', '2024-04-23', 106),
(407, 301, 203, '2024-04-16', '2024-04-23', 107),

(408, 302, 201, '2024-04-02', '2024-04-09', 101),
(409, 302, 201, '2024-04-09', '2024-04-09', 102),
(410, 302, 202, '2024-04-09', '2024-04-16', 103),
(411, 302, 202, '2024-04-09', '2024-04-16', 104),
(412, 302, 203, '2024-04-16', '2024-04-23', 105),
(413, 302, 203, '2024-04-16', '2024-04-23', 106),

(414, 303, 201, '2024-04-02', '2024-04-09', 101),
(415, 303, 201, '2024-04-02', '2024-04-09', 102),
(416, 303, 202, '2024-04-09', '2024-04-09', 103),
(417, 303, 202, '2024-04-09', '2024-04-09', 104),
(418, 303, 203, '2024-04-16', '2024-04-23', 105),
(419, 303, 203, '2024-04-16', '2024-04-23', 106),

(420, 303, 201, '2024-04-02', '2024-04-09', 101),
(421, 303, 201, '2024-04-02', '2024-04-09', 102),
(422, 303, 203, '2024-04-16', '2024-04-23', 103),
(423, 303, 203, '2024-04-16', '2024-04-23', 104),
(424, 304, 201, '2024-04-02', '2024-04-09', 105),
(425, 304, 201, '2024-04-02', '2024-04-09', 106),
(426, 305, 201, '2024-04-02', '2024-04-09', 107),
(427, 305, 201, '2024-04-02', '2024-04-09', 108),
(428, 306, 201, '2024-04-02', '2024-04-09', 109),
(429, 306, 203, '2024-04-16', '2024-04-23', 110),
(430, 307, 201, '2024-04-02', '2024-04-09', 101),
(431, 307, 201, '2024-04-02', '2024-04-09', 102),
(432, 308, 201, '2024-04-02', '2024-04-09', 103),
(433, 308, 202, '2024-04-09', '2024-04-16', 104),
(434, 309, 203, '2024-04-16', '2024-04-23', 105),
(435, 309, 203, '2024-04-16', '2024-04-23', 106),
(436, 310, 201, '2024-04-02', '2024-04-09', 107),
(437, 310, 202, '2024-04-09', '2024-04-16', 108);

USE library;

CREATE VIEW soal1 AS
SELECT a.nama_anggota, COUNT(b.kode_buku) AS jumlah_pinjam
FROM anggota a JOIN peminjaman b ON a.id_anggota = b.id_anggota
GROUP BY a.nama_anggota
HAVING COUNT(b.kode_buku) > 5;

CREATE VIEW soal2 AS
SELECT a.nama_petugas, COUNT(b.kode_buku) AS jumlah_buku_terpinjam
FROM petugas a JOIN peminjaman b
ON a.id_petugas = b.id_petugas
GROUP BY a.nama_petugas;

CREATE VIEW soal3 AS
SELECT a.nama_petugas, COUNT(b.kode_buku) AS jumlah_buku_terpinjam
FROM petugas a JOIN peminjaman b
ON a.id_petugas = b.id_petugas
GROUP BY a.nama_petugas
ORDER BY jumlah_buku_terpinjam DESC
LIMIT 1;

CREATE VIEW soal4 AS
SELECT a.judul_buku AS buku_terbanyak_dipinjam, COUNT(b.kode_buku) AS jumlah
FROM buku a JOIN peminjaman b 
ON a.kode_buku = b.kode_buku
GROUP BY buku_terbanyak_dipinjam
ORDER BY jumlah DESC
LIMIT 1;