USE perpustakaan;

CREATE DATABASE perpustakaan;

CREATE TABLE buku(
kode_buku VARCHAR(10) NOT NULL,
judul_buku VARCHAR (25) NOT NULL,
pengarang_buku VARCHAR (30) NOT NULL,
penerbit_buku VARCHAR (30) NOT NULL,
tahun_buku VARCHAR (10) NOT NULL,
jumlah_buku VARCHAR (5) NOT NULL,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL,
PRIMARY KEY (kode_buku)
);

CREATE TABLE petugas(
idPetugas VARCHAR (10) NOT NULL,
username VARCHAR (15) NOT NULL,
pasword VARCHAR (15) NOT NULL,
nama VARCHAR (25) NOT NULL,
PRIMARY KEY (idPetugas)
);

CREATE TABLE anggota(
idAnggota VARCHAR (10) NOT NULL,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR (6) NOT NULL,
tempat_lahir_anggota VARCHAR (20) NOT NULL,
tanggal_lahir_anggota DATE,
PRIMARY KEY (idAnggota)
);

CREATE TABLE peminjaman(
kode_peminjaman VARCHAR(10) NOT NULL,
idAnggota VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (10) NOT NULL,
PRIMARY KEY (kode_peminjaman),
FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

CREATE TABLE pengembalian(
kode_kembali VARCHAR(10) NOT NULL,
idAnggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
tgl_pinjam DATE NOT NULL,
tgl_kembali DATE NOT NULL,
denda VARCHAR(15),
PRIMARY KEY (kode_kembali),
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


INSERT INTO buku VALUES
('001','buku indah','sri mulyani','sinar dunia','2014','5','tersedia','non fiksi'),
('002','buku bumi','endang sukamto','sinar mas','2024','3','tersedia','fiksi'),
('105','Perahu Kertas', 'Dewi Lestari', 'Bentang Pustaka', '2018', '10', 'tersedia', 'non fiksi'),
('106','London Love Story', 'Tisa TS', 'Loveable', '2015', '10', 'tersedia', 'fiksi'),
('107','Dear Nathan', 'Erisca Febrianti', 'Pastel Books', '2019', '30', 'tersedia', 'fiksi')
;

INSERT INTO anggota VALUES 
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

INSERT INTO peminjaman VALUES
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



-- No 1 (Tampilkan Semua Data Peminjam yang Meminjam di tanggal 2024-09-08)
DELIMITER //
CREATE PROCEDURE getdatapeminjam(IN pinjam VARCHAR(50))
BEGIN
	SELECT * FROM peminjaman WHERE tanggal_pinjam = pinjam;
END //
DELIMITER ;
CALL getdatapeminjam('2024-09-08');

-- No 2 (data pengembalian berdasarkan denda)
DELIMITER //
CREATE PROCEDURE getdatapengembalian(IN bayar VARCHAR(50))
BEGIN
	SELECT * FROM pengembalian WHERE bayar=denda;
END //
DELIMITER ;
CALL getdatapengembalian('Tidak Ada');

-- No 3 (data peminjaman berdasarkan idAnggota dan kode_buku)
DELIMITER //
CREATE PROCEDURE pinjam(IN idago VARCHAR(10), IN kode VARCHAR(10))
BEGIN
	SELECT * FROM peminjaman WHERE idAnggota = idago AND kode_buku = kode;
END //
DELIMITER ;
CALL pinjam('204', '002');

-- No 4 (data buku berdasarkan klasifikasi buku, status, dan jumlah buku)
DELIMITER //
CREATE PROCEDURE getbuku(IN class VARCHAR(50), IN sedia VARCHAR(50), IN jumlah VARCHAR(50))
BEGIN
	SELECT * FROM buku WHERE klasifikasi_buku = class AND sedia = status_buku AND jumlah_buku = jumlah;
END //
DELIMITER ;
CALL getbuku('fiksi', 'tersedia', '15');

-- No 5 (tambah data petugas)
DELIMITER //
CREATE PROCEDURE tambahdatakepetugas(
    IN id VARCHAR(20),
    IN nama_user VARCHAR(50),
    IN pass VARCHAR(50),
    IN nama_asli VARCHAR(50)
    )
BEGIN
	INSERT INTO petugas
    VALUES (id, nama_user, pass, nama_asli);
END //
DELIMITER ;
CALL tambahdatakepetugas('A0203', 'petugas01', 'vigo77', 'Vigo Candra A');
SELECT*FROM petugas;

-- No 6 (jumlah anggota perpustakaan)
DELIMITER //
CREATE PROCEDURE banyakAnggota(
	OUT banyakAnggotaPerpus INT
)
BEGIN
	SELECT COUNT(*) INTO banyakAnggotaPerpus FROM anggota;
END //
DELIMITER ;
CALL banyakAnggota(@banyakAnggotaPerpus);
SELECT @banyakAnggotaPerpus;
SELECT*FROM anggota;

-- No 7 
DELIMITER //
CREATE PROCEDURE jumlah(
	INOUT Tambah INT,
    IN kodeBuku VARCHAR(100)
)
BEGIN
	SET Tambah = Tambah+5;
    UPDATE buku SET jumlah_buku = Tambah;
END //
DELIMITER ;

SET @jumlahBuku = 10;
CALL jumlah(@jumlahBuku, '106');
SELECT @jumlahBuku AS 'Jumlah Buku Telah Ditambah';
