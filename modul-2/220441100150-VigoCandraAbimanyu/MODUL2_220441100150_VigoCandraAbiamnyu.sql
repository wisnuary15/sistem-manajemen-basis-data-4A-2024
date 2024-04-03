

create database perpustakaan;
use perpustakaan;

create table buku(
kode_buku varchar(10) not null,
judul_buku varchar (25) not null,
pengarang_buku varchar (30) not null,
penerbit_buku varchar (30) not null,
tahun_buku varchar (10) not null,
jumlah_buku varchar (5) not null,
status_buku varchar (10) not null,
klasifikasi_buku varchar (20) not null,
primary key (kode_buku)
);

create table petugas(
idPetugas varchar (10) not null,
username varchar (15) not null,
pasword varchar (15) not null,
nama varchar (25) not null,
primary key (idPetugas)
);

create table anggota(
idAnggota varchar (10) not null,
nama_anggota varchar(20) not null,
angkatan_anggota varchar (6) not null,
tempat_lahir_anggota varchar (20) not null,
tanggal_lahir_anggota date,
primary key (idAnggota)
);

create table peminjaman(
kode_peminjaman varchar(10) not null,
idAnggota varchar (10) not null,
idPetugas varchar (10) not null,
tanggal_pinjam date,
tanggal_kembali date,
kode_buku varchar (10) not null,
primary key (kode_peminjaman),
foreign key (idAnggota) references anggota(idAnggota),
foreign key (idPetugas) references petugas(idPetugas),
foreign Key (kode_buku) references buku(kode_buku)
);

create table pengembalian(
kode_kembali varchar(10) not null,
idAnggota varchar(10) not null,
kode_buku varchar (10) not null,
idPetugas varchar (10) not null,
tgl_pinjam date not null,
tgl_kembali date not null,
denda varchar(15),
primary key (kode_kembali),
FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);



ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_id_anggota FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);
ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_kode_buku FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);
ALTER TABLE perpustakaan.pengembalian ADD CONSTRAINT fk_id_petugas FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);


ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_id_anggota1 FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);
ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_kode_buku1 FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);
ALTER TABLE perpustakaan.peminjaman ADD CONSTRAINT fk_id_petugas1 FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);


insert into buku values
('001','buku indah','sri mulyani','sinar dunia','2014','5','tersedia','non fiksi'),
('002','buku bumi','endang sukamto','sinar mas','2024','3','tersedia','fiksi'),
('105','Perahu Kertas', 'Dewi Lestari', 'Bentang Pustaka', '2018', '10', 'tersedia', 'non fiksi'),
('106','London Love Story', 'Tisa TS', 'Loveable', '2015', '10', 'tersedia', 'fiksi'),
('107','Dear Nathan', 'Erisca Febrianti', 'Pastel Books', '2019', '30', 'tersedia', 'fiksi')
;

insert into anggota values 
('201','agung', '2022', 'Nganjuk', '2003-10-16'),
('202','alifia', '2022', 'Bojonegoro', '2003-05-23'),
('203','andini', '2019', 'Sidoarjo', '2003-01-06'),
('204','dwi', '2021', 'Bangkalan', '2003-06-04')
;

INSERT INTO petugas VALUES
('P001', 'admin1', 'pass123', 'leli'),
('P002', 'admin2', 'pass456', 'dhea'),
('P003', 'admin3', 'pass789', 'sigma'),
('P004', 'user1', 'userpass1', 'Alice '),
('P005', 'user2', 'userpass2', 'Boby');

insert into peminjaman values
('901','204','P001','2024-09-08','2024-08-09','001'),
('902','204','P002','2024-09-08','2024-08-09','002'),
('903','204','P002','2024-09-08','2024-08-09','105'),
('904','204','P002','2024-09-08','2024-08-09','107'),
('905','204','P002','2024-09-08','2024-08-09','106'),
('906','204','P002','2024-09-08','2024-08-09','002')
;



INSERT INTO pengembalian VALUES
('801','201','001','P001','2024-09-08','2024-08-09','1000'),
('802','204','002','P002','2024-09-08','2024-08-09','1500'),
('803','204','107','P002','2024-09-08','2024-08-09','Tidak Ada'),
('804','204','106','P003','2024-09-08','2024-08-09','2000'),
('805','204','105','P003','2024-09-08','2024-08-09','Tidak Ada'),
('806','204','002','P002','2024-09-08','2024-08-09','5000'),
('807','203','002','P002','2024-09-08','2024-08-09','tidak ada')
;

CREATE VIEW view_anggota_peminjaman AS
SELECT p.idAnggota, a.nama_anggota, COUNT(*) AS jumlah_peminjaman
FROM anggota a JOIN peminjaman p ON a.idAnggota = p.idAnggota
GROUP BY p.idAnggota, a.nama_anggota
HAVING COUNT(*) > 5;

SELECT * FROM view_anggota_peminjaman;


CREATE VIEW view_petugas AS
SELECT a.idPetugas, a.nama, p.tanggal_pinjam, COUNT(*) AS jumlah_transaksi
FROM petugas a JOIN peminjaman p ON a.idPetugas = p.idPetugas
GROUP BY a.idPetugas, a.nama;

SELECT * FROM view_petugas;


CREATE VIEW vieww_petugas_terbanyak AS
SELECT a.idPetugas, a.nama, COUNT(p.kode_peminjaman) AS jumlah_transaksi
FROM petugas a
INNER JOIN peminjaman p ON a.idPetugas = p.idPetugas
GROUP BY a.idPetugas, a.nama
ORDER BY jumlah_transaksi DESC LIMIT 1;

SELECT * FROM vieww_petugas_terbanyak;


CREATE VIEW view_buku_terbanyak AS
SELECT b.kode_buku, b.judul_buku, COUNT(p.kode_peminjaman) AS jumlah_pinjam
FROM buku b
INNER JOIN peminjaman p ON b.kode_buku = p.kode_buku
GROUP BY b.kode_buku, b.judul_buku
ORDER BY jumlah_pinjam DESC LIMIT 1;

SELECT * FROM view_buku_terbanyak;



