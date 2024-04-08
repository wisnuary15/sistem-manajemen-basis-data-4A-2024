CREATE DATABASE perpustakaan;

USE perpustakaan;

CREATE TABLE buku (
kode_buku VARCHAR (10) PRIMARY KEY NOT NULL,
judul_buku VARCHAR (25) NOT NULL,
pengarang_buku VARCHAR(20)NOT NULL,
penerbit_buku VARCHAR(30)NOT NULL,
tahun_buku VARCHAR(10)NOT NULL,
jumlah_buku VARCHAR(5)NOT NULL,
status_buku VARCHAR(10)NOT NULL,
klasifikasi_buku VARCHAR(20)NOT NULL
);

ALTER TABLE buku MODIFY COLUMN judul_buku VARCHAR(100)NOT NULL;

ALTER TABLE buku MODIFY COLUMN status_buku VARCHAR(30)NOT NULL;

CREATE TABLE pengembalian (
kode_kembali VARCHAR (10) PRIMARY KEY NOT NULL,
id_anggota VARCHAR (10) NOT NULL,
kode_buku VARCHAR(10)NOT NULL,
id_petugas VARCHAR(10)NOT NULL,
tgl_pinjam DATE NOT NULL,
tgl_kembali DATE NOT NULL,
denda VARCHAR(15)NOT NULL
);

ALTER TABLE pengembalian MODIFY COLUMN denda VARCHAR(40)NOT NULL;

CREATE TABLE anggota (
id_anggota VARCHAR (10) PRIMARY KEY NOT NULL,
nama_anggota VARCHAR (20) NOT NULL,
angkatan_anggota VARCHAR(6)NOT NULL,
tempat_lahir_anggota VARCHAR(20)NOT NULL,
tgl_lahir_anggota DATE NOT NULL,
no_telephone VARCHAR(100)NOT NULL,
status_buku VARCHAR(10)NOT NULL,
jenis_kelamin VARCHAR(15)NOT NULL,
status_pinjam VARCHAR(15)NOT NULL
);

CREATE TABLE peminjaman (
kode_peminjaman VARCHAR (10) PRIMARY KEY NOT NULL,
id_anggota VARCHAR (10) NOT NULL,
kode_buku VARCHAR(10)NOT NULL,
id_petugas VARCHAR(10)NOT NULL,
tgl_pinjam DATE NOT NULL,
tgl_kembali DATE NOT NULL
);

CREATE TABLE petugas (	
id_petugas VARCHAR (10) PRIMARY KEY NOT NULL,
username VARCHAR (15) NOT NULL,
password_ VARCHAR(15)NOT NULL,
Nama VARCHAR(25)NOT NULL
);

ALTER TABLE peminjaman
ADD CONSTRAINT FK_AnggotaPinjam
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE peminjaman
ADD CONSTRAINT FK_PetugasPeminjaman
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE peminjaman
ADD CONSTRAINT FK_BukuDipinjam
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE pengembalian
ADD CONSTRAINT FK_AnggotaKembali
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE pengembalian
ADD CONSTRAINT FK_BukuDikembalikan
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE pengembalian
ADD CONSTRAINT FK_PetugasPengembalian
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku,
Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku,
Klasifikasi_Buku) VALUES
('BL001', 'Siapa Namamu?', 'Mashashi Kishimoto', 'Gramedia Pustaka
Utama', '2019', '40', 'Tersedia', 'Kesenian dan Hiburan'),
('BL002', 'Malam yang Kelam', 'Agatha Christie', 'Elex Media
Komputindo', '2020', '30', 'Tersedia', 'Fiksi Detektif'),
('BL003', 'Cinta Tak Pernah Salah', 'Tere Liye', 'Gramedia Pustaka
Utama', '2021', '50', 'Tersedia', 'Romantis'),
('BL004', 'Kisah Hidup Steve Jobs', 'Walter Isaacson', 'Bentang
Pustaka', '2017', '65', 'Tidak Tersedia', 'Biografi'),
('BL005', 'Sapiens: Sejarah Manusia', 'Yuval Noah Harari', 'Gramedia
Pustaka Utama', '2018', '75', 'Tersedia', 'Sejarah'),
('BL006', 'The Lord of The Rings: The Fellowship of The Ring',
'J.R.R. Tolkien', 'HarperCollins Publishers', '2022', '90',
'Tersedia', 'Fantasi'),
('BL007', 'Kumpulan Puisi Chairil Anwar', 'Chairil Anwar', 'Balai
Pustaka', '2021', '25', 'Tersedia', 'Puisi'),
('BL008', 'Panduan Lengkap Fotografi', 'Scott Kelby', 'Elex Media
Komputindo', '2020', '55', 'Tidak Tersedia', 'Fotografi'),
('BL009', 'Dunia Sophie', 'Jostein Gaarder', 'Mizan Media Utama',
'2019', '45', 'Tersedia', 'Fiksi Filosofis'),
('BL010', 'The Power of Now', 'Eckhart Tolle', 'Periplus Editions',
'2017', '60', 'Tersedia', 'Pengembangan Diri'),
('BL011', '101 Teknik Berbicara di Depan Umum', 'Dale Carnegie',
'Gramedia Pustaka Utama', '2016', '35', 'Tersedia', 'Pengembangan
Diri'),
('BL012', 'Harry Potter and The Half Blood Prince', 'J.K. Rowling',
'Bloomsbury Publishing', '2019', '80', 'Tidak Tersedia', 'Fantasi'),
('BL013', 'Membaca Pikiran Orang Lain', 'David J. Lieberman',
'Gramedia Pustaka Utama', '2022', '50', 'Tersedia', 'Pengembangan
Diri'),
('BL014', 'Perencanaan Keuangan untuk Pemula', 'Andrie Wongso', 'PT
Elex Media Komputindo', '2020', '40', 'Tersedia', 'Bisnis dan
Keuangan');

SELECT * FROM buku;

INSERT INTO anggota (id_anggota, Nama_Anggota, Angkatan_Anggota,
Tempat_Lahir_Anggota, tgl_Lahir_Anggota, No_Telephone, Jenis_Kelamin,
Status_Pinjam) VALUES
('IDA001', 'Frosty Wings Agatha', '2021', 'Bangkalan', '2001-08-09',
'089590898751', 'L', 'Aktif'),
('IDA002', 'Rifqi Arif Fajri', '2020', 'Jakarta', '1999-02-21',
'081234567890', 'L', 'Aktif'),
('IDA003', 'Dhara Saraswati', '2021', 'Yogyakarta', '2003-06-02',
'087654321098', 'P', 'Aktif'),
('IDA004', 'Rizka Amelia', '2022', 'Bandung', '1998-11-16',
'082345678901', 'P', 'Aktif'),
('IDA005', 'Yusuf Rizky Ananda', '2022', 'Surabaya', '2000-08-07',
'089012345678', 'L', 'Aktif'),
('IDA006', 'Laras Tari', '2023', 'Makassar', '2004-12-31',
'081234567890', 'P', 'Aktif'),
('IDA007', 'Nashitama Kirei', '2021', 'Malang', '2002-05-22',
'089876543210', 'P', 'Aktif'),
('IDA008', 'Bayu Pratama', '2022', 'Semarang', '1999-09-23',
'085678901234', 'L', 'Aktif'),
('IDA009', 'Firda Almira', '2021', 'Denpasar', '2003-03-14',
'082345678901', 'P', 'Aktif'),
('IDA010', 'Aldi Fajar', '2023', 'Surabaya', '2001-04-15',
'081234567890', 'L', 'Aktif'),
('IDA011', 'Nia Rizky', '2022', 'Bandung', '1998-02-10',
'087654321098', 'P', 'Aktif'),
('IDA012', 'Wahyu Agung', '2023', 'Jakarta', '2004-10-01',
'082345678901', 'L', 'Aktif'),
('IDA013', 'Arya Dwi', '2021', 'Yogyakarta', '2002-09-12',
'089012345678', 'L', 'Aktif'),
('IDA014', 'Indah Mawar', '2022', 'Semarang', '1999-12-25',
'081234567890', 'P', 'Aktif'),
('IDA015', 'Rara Ayu', '2021', 'Malang', '2003-07-03',
'085678901234', 'P', 'Aktif');

SELECT * FROM anggota;

INSERT INTO petugas (id_petugas, Username, Password_, Nama) VALUES
('IDP001', 'userIDP001', 'ZENNN14', 'Bagus Sucipto'),
('IDP002', 'userIDP002', 'password123', 'Agus Yulianto'),
('IDP003', 'userIDP003', 'qwerty123', 'Rahmat Hidayat'),
('IDP004', 'userIDP004', 'iloveyou', 'Diva Khairunnisa'),
('IDP005', 'userIDP005', 'P@ssw0rd', 'Linda Setiawati'),
('IDP006', 'userIDP006', 'welcome123', 'Bambang Pramono'),
('IDP007', 'userIDP007', 'letmein123', 'Rina Fitriani'),
('IDP008', 'userIDP008', 'admin123', 'Ika Wahyuni'),
('IDP009', 'userIDP009', 'password1', 'Indra Wijaya'),
('IDP010', 'userIDP010', '123456789', 'Yunanto Setiawan'),
('IDP011', 'userIDP011', 'abc123', 'Mila Cahyani'),
('IDP012', 'userIDP012', 'qazwsxedc', 'Budi Kurniawan'),
('IDP013', 'userIDP013', 'letsgo123', 'Larasati Dewi'),
('IDP014', 'userIDP014', 'test1234', 'Putri Ayu'),
('IDP015', 'userIDP015', 'password1234', 'Nurul Hidayati');

SELECT * FROM petugas;

INSERT INTO peminjaman (Kode_Peminjaman, id_anggota, id_petugas,
tgl_Pinjam, tgl_Kembali, Kode_Buku) VALUES
('KPJ001', 'IDA004', 'IDP015', '2023-03-17', '2023-03-21', 'BL001'),
('KPJ002', 'IDA008', 'IDP013', '2023-02-12', '2023-02-15', 'BL002'),
('KPJ003', 'IDA012', 'IDP009', '2023-05-03', '2023-05-05', 'BL003'),
('KPJ004', 'IDA003', 'IDP001', '2023-04-07', '2023-04-10', 'BL001'),
('KPJ005', 'IDA015', 'IDP002', '2023-01-20', '2023-01-22', 'BL004'),
('KPJ006', 'IDA011', 'IDP004', '2023-06-14', '2023-06-16', 'BL002'),
('KPJ007', 'IDA007', 'IDP012', '2023-08-29', '2023-08-31', 'BL005'),
('KPJ008', 'IDA009', 'IDP005', '2023-07-10', '2023-07-14', 'BL003'),
('KPJ009', 'IDA014', 'IDP008', '2023-05-01', '2023-05-05', 'BL004'),
('KPJ010', 'IDA001', 'IDP003', '2023-04-18', '2023-04-21', 'BL001'),
('KPJ011', 'IDA013', 'IDP014', '2023-09-05', '2023-09-07', 'BL005'),
('KPJ012', 'IDA002', 'IDP006', '2023-02-20', '2023-02-24', 'BL001'),
('KPJ013', 'IDA006', 'IDP015', '2023-07-25', '2023-07-27', 'BL002'),
('KPJ014', 'IDA010', 'IDP011', '2023-03-15', '2023-03-19', 'BL003'),
('KPJ015', 'IDA005', 'IDP007', '2023-05-09', '2023-05-12', 'BL001'),
('KPJ016', 'IDA008', 'IDP010', '2023-08-01', '2023-08-05', 'BL004'),
('KPJ017', 'IDA015', 'IDP013', '2023-09-10', '2023-09-14', 'BL005'),
('KPJ018', 'IDA003', 'IDP001', '2023-11-07', '2023-11-10', 'BL001'),
('KPJ019', 'IDA011', 'IDP004', '2023-10-18', '2023-10-20', 'BL002'),
('KPJ020', 'IDA014', 'IDP002', '2023-12-24', '2023-12-27', 'BL004'),
('KPJ021', 'IDA014', 'IDP010', '2023-08-01', '2023-08-05', 'BL004'),
('KPJ022', 'IDA014', 'IDP013', '2023-09-10', '2023-09-14', 'BL005'),
('KPJ023', 'IDA014', 'IDP001', '2023-11-07', '2023-11-10', 'BL001'),
('KPJ024', 'IDA014', 'IDP004', '2023-10-18', '2023-10-20', 'BL002'),
('KPJ025', 'IDA014', 'IDP002', '2023-12-24', '2023-12-27', 'BL004');

SELECT * FROM peminjaman;

INSERT INTO pengembalian (Kode_Kembali, id_anggota, Kode_Buku,
id_petugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('IDK001', 'IDA004', 'BL001', 'IDP015', '2023-03-17', '2023-03-21',
'Tidak Kena Denda'),
('IDK002', 'IDA001', 'BL003', 'IDP008', '2023-03-25', '2023-03-27',
'Tidak Kena Denda'),
('IDK003', 'IDA002', 'BL002', 'IDP010', '2023-03-28', '2023-03-30',
'Denda Rp. 10000'),
('IDK004', 'IDA003', 'BL005', 'IDP011', '2023-03-20', '2023-03-22',
'Tidak Kena Denda'),
('IDK005', 'IDA004', 'BL001', 'IDP015', '2023-03-17', '2023-03-21',
'Denda Rp. 50000'),
('IDK006', 'IDA005', 'BL004', 'IDP012', '2023-03-19', '2023-03-21',
'Tidak Kena Denda'),
('IDK007', 'IDA006', 'BL003', 'IDP012', '2023-03-23', '2023-03-24',
'Denda Rp. 15000'),
('IDK008', 'IDA007', 'BL002', 'IDP014', '2023-03-22', '2023-03-23',
'Tidak Kena Denda'),
('IDK009', 'IDA008', 'BL005', 'IDP011', '2023-03-18', '2023-03-20',
'Denda Rp. 20000'),
('IDK010', 'IDA009', 'BL001', 'IDP014', '2023-03-21', '2023-03-25',
'Tidak Kena Denda'),
('IDK011', 'IDA010', 'BL004', 'IDP009', '2023-03-29', '2023-03-30',
'Denda Rp. 5000'),
('IDK012', 'IDA011', 'BL003', 'IDP002', '2023-03-18', '2023-03-19',
'Tidak Kena Denda'),
('IDK013', 'IDA012', 'BL002', 'IDP008', '2023-03-24', '2023-03-26',
'Denda Rp. 25000'),
('IDK014', 'IDA013', 'BL005', 'IDP007', '2023-03-26', '2023-03-29',
'Tidak Kena Denda'),
('IDK015', 'IDA014', 'BL001', 'IDP006', '2023-03-20', '2023-03-22',
'Denda Rp. 10000'),
('IDK016', 'IDA015', 'BL004', 'IDP005', '2023-03-27', '2023-03-28',
'Tidak Kena Denda'),
('IDK017', 'IDA014', 'BL003', 'IDP004', '2023-03-22', '2023-03-24',
'Denda Rp. 30000'),
('IDK018', 'IDA001', 'BL002', 'IDP003', '2023-03-18', '2023-03-19',
'Tidak Kena Denda'),
('IDK019', 'IDA009', 'BL005', 'IDP002', '2023-03-23', '2023-03-26',
'Denda Rp. 15000'),
('IDK020', 'IDA010', 'BL001', 'IDP009', '2023-03-29', '2023-03-31',
'Tidak Kena Denda');

DELETE FROM pengembalian;
SELECT * FROM pengembalian;

## 1
CREATE OR REPLACE VIEW NO1 AS
SELECT a.Nama_Anggota, COUNT(p.Kode_Buku) AS `Jumlah Buku Dipinjam`
FROM anggota a
JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota
HAVING COUNT(p.Kode_Buku) > 5;
SELECT * FROM NO1;

## 2
CREATE OR REPLACE VIEW NO2 AS
SELECT p.id_petugas, COUNT(p.Kode_Buku) AS `Jumlah Buku Terpinjam`
FROM peminjaman p
GROUP BY p.id_petugas;
SELECT * FROM NO2;

##3
CREATE OR REPLACE VIEW NO3 AS
SELECT p.id_petugas, COUNT(p.Kode_Buku) AS `Jumlah Buku Terpinjam`
FROM peminjaman p
GROUP BY p.id_petugas
HAVING COUNT(Kode_Buku) =
(SELECT MAX(`Jumlah Buku Terpinjam`)
FROM (SELECT id_petugas, COUNT(Kode_Buku) AS `Jumlah Buku Terpinjam`
FROM peminjaman GROUP BY id_petugas) AS `Petugas Jumlah Buku`);
SELECT * FROM NO3;

##4
CREATE VIEW NO4 AS
SELECT b.Judul_Buku, COUNT(p.Kode_Buku) AS `Jumlah Peminjaman`
FROM buku b
JOIN peminjaman p ON b.Kode_Buku = p.Kode_Buku
GROUP BY b.Judul_Buku
HAVING COUNT(p.Kode_Buku) =
(SELECT MAX(`Jumlah Peminjaman`)
FROM (SELECT COUNT(Kode_Buku) AS `Jumlah Peminjaman`
FROM peminjaman GROUP BY Kode_Buku) AS `Buku Jumlah
Peminjaman`);
SELECT * FROM NO4;