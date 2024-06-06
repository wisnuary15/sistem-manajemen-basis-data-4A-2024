CREATE DATABASE perpustakaan_new;
USE perpustakaan_new;


CREATE TABLE IF NOT EXISTS petugas(
idPetugas VARCHAR (10) PRIMARY KEY NOT NULL,
username VARCHAR (15) NOT NULL,
pasword VARCHAR (15) NOT NULL,
nama VARCHAR (25) NOT NULL
);

CREATE TABLE IF NOT EXISTS buku(
kode_buku VARCHAR (10) PRIMARY KEY NOT NULL,
judul_buku VARCHAR (25) NOT NULL,
pengarang_buku VARCHAR (30) NOT NULL,
penerbit_buku VARCHAR (30) NOT NULL,
tahun_buku VARCHAR (10) NOT NULL,
jumlah_buku VARCHAR (5) NOT NULL,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL
);

CREATE TABLE IF NOT EXISTS anggota(
idAnggota VARCHAR (10) PRIMARY KEY NOT NULL,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR (6) NOT NULL,
tempat_lahir_anggota VARCHAR (20) NOT NULL,
tanggal_lahir_anggota DATE,
jenis_kelamin VARCHAR (1)
);

CREATE TABLE IF NOT EXISTS peminjaman(
kode_peminjaman VARCHAR(10) PRIMARY KEY NOT NULL,
idAnggota VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (10) NOT NULL
);

CREATE TABLE IF NOT EXISTS pengembalian(
kode_kembali VARCHAR(10) NOT NULL,
idAnggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR (10) NOT NULL,
idPetugas VARCHAR (10) NOT NULL,
tgl_pinjam DATE NOT NULL,
tgl_kembali DATE NOT NULL,
denda VARCHAR(15)
);


INSERT INTO anggota VALUES 
('A001', 'Budi ', '2020', 'Jakarta', '2000-01-01', 'L'),
('A002', 'Ani ', '2019', 'Bandung', '2001-02-02', 'P'),
('A003', 'Johan', '2021', 'Surabaya', '1999-03-03', 'L'),
('A004', 'Mily ', '2018', 'Medan', '2002-04-04', 'P'),
('A005', 'David ', '2022', 'Semarang', '1998-05-05', 'L')
;


INSERT INTO buku VALUES 
('B001', 'Harry Potter dan Batu Bertuah', 'J.K. Rowling', 'Scholastic', '1997', '100', 'Tersedia', 'Fantasi'),
('B002', 'Untuk Membunuh Seekor Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', '75', 'Tersedia', 'Fiksi'),
('B003', '1984', 'George Orwell', 'Secker & Warburg', '1949', '50', 'Tersedia', 'Dystopian'),
('B004', 'Gatsby Si Lelaki Besar', 'F. Scott Fitzgerald', 'Scribner', '1925', '60', 'Tersedia', 'Klasik'),
('B005', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '70', 'Tersedia', 'Romansa'),
('B006', 'Pemburu di Tepi Jeram', 'J.D. Salinger', 'Little, Brown and Company', '1951', '45', 'Tersedia', 'Pertumbuhan'),
('B007', 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '1937', '80', 'Tersedia', 'Fantasi'),
('B008', 'Moby-Dick', 'Herman Melville', 'Richard Bentley', '1851', '55', 'Tersedia', 'Petualangan'),
('B009', 'Frankenstein', 'Mary Shelley', 'Lackington, Hughes, Harding, Mavor & Jones', '1818', '65', 'Tersedia', 'Gothik'),
('B010', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', '90', 'Tersedia', 'Fantasi')
;


INSERT INTO petugas VALUES 
('P001', 'user1', 'password1', 'Andi'),
('P002', 'user2', 'password2', 'Budi'),
('P003', 'user3', 'password3', 'Cindy'),
('P004', 'user4', 'password4', 'Dedi'),
('P005', 'user5', 'password5', 'Eka')
;


INSERT INTO peminjaman VALUES 
('PM001', 'A001', 'P001', '2024-04-21', '2024-04-21', 'B001'),
('PM002', 'A002', 'P002', '2024-04-21', '2024-04-22', 'B002'),
('PM003', 'A003', 'P003', '2024-04-21', '2024-04-23', 'B003'),
('PM004', 'A004', 'P004', '2024-04-21', '2024-04-24', 'B004'),
('PM005', 'A003', 'P005', '2024-04-21', '2024-04-25', 'B005'),
('PM006', 'A002', 'P005', '2024-04-21', '2024-04-26', 'B006'),
('PM007', 'A002', 'P004', '2024-04-21', '2024-04-27', 'B007'),
('PM008', 'A002', 'P003', '2024-04-21', '2024-04-28', 'B008'),
('PM009', 'A002', 'P002', '2024-04-21', '2024-04-29', 'B009'),
('PM010', 'A003', 'P003', '2024-04-21', '2024-04-30', 'B003')
;



INSERT INTO pengembalian VALUES 
('K001', 'A001', 'B001', 'P001', '2024-04-21', '2024-04-21', '0'),
('K002', 'A002', 'B002', 'P002', '2024-04-21', '2024-04-22', '0'),
('K003', 'A003', 'B003', 'P003', '2024-04-21', '2024-04-23', '0'),
('K004', 'A004', 'B004', 'P004', '2024-04-21', '2024-04-24', '0'),
('K005', 'A003', 'B005', 'P005', '2024-04-21', '2024-04-25', '0'),
('K006', 'A002', 'B006', 'P001', '2024-04-21', '2024-04-26', '0'),
('K007', 'A002', 'B007', 'P002', '2024-04-21', '2024-04-27', '0'),
('K008', 'A002', 'B008', 'P003', '2024-04-21', '2024-04-28', '10000'),
('K009', 'A002', 'B009', 'P004', '2024-04-21', '2024-04-29', '11000'),
('K010', 'A003', 'B010', 'P003', '2024-04-21', '2024-04-30', '12000')
;


ALTER TABLE perpustakaan_new.pengembalian ADD CONSTRAINT fk_id_anggota FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);

ALTER TABLE perpustakaan_new.pengembalian ADD CONSTRAINT fk_kode_buku FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE perpustakaan_new.pengembalian ADD CONSTRAINT fk_id_petugas FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);

ALTER TABLE perpustakaan_new.peminjaman ADD CONSTRAINT fk_id_anggota1 FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);

ALTER TABLE perpustakaan_new.peminjaman ADD CONSTRAINT fk_kode_buku1 FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE perpustakaan_new.peminjaman ADD CONSTRAINT fk_id_petugas1 FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas);



-- nomor 1
DELIMITER //
CREATE PROCEDURE biodata(
	IN nim INT(20),
	IN namaMahasiswa VARCHAR(100),
	IN alamat VARCHAR(20),
	IN no_tlp VARCHAR(12),
	IN jenis_kelamin VARCHAR(1),
	IN hobi VARCHAR (20),
	IN umur INT (3)
)
BEGIN
	DECLARE vNim INT(20);
	DECLARE vNamaMahasiswa VARCHAR(100);
	DECLARE vAlamat VARCHAR (20);
	DECLARE vNo_tlp VARCHAR(12);
	DECLARE vJenis_kelamin VARCHAR(1);
	DECLARE vHobi VARCHAR(20);
	DECLARE vUmur INT (3);

	SET vNim = nim;
	SET vNamaMahasiswa = namaMahasiswa;
	SET vAlamat = alamat;
	SET vNo_tlp = no_tlp;
	SET vJenis_kelamin = jenis_kelamin;
	SET vHobi = hobi;
	SET vUmur = umur;

	    
	SELECT 
	vNim AS 'NIM', 
	vNamaMahasiswa AS 'Nama Mahasiswa', 
	vAlamat AS 'Alamat', 
	vNo_tlp AS 'No Telepon', 
	vJenis_kelamin AS 'Jenis Kelamin', 
	vHobi AS 'Hobi', 
	vUmur AS 'Umur';
    

END//
DELIMITER;

CALL biodata (22071, 'Ardi', 'Kediri', '3947', 'L', 'Nonton Film', 20);
DROP PROCEDURE biodata;

-- nomor 2
DELIMITER //
CREATE PROCEDURE pengingat (
	IN id_Anggota VARCHAR(10)
)
BEGIN
	DECLARE kode VARCHAR (10);
	DECLARE pinjam DATE;
	DECLARE kembali DATE;
	DECLARE lamaPinjam INT;
	DECLARE peringatan VARCHAR (100);
	
	SELECT kode_peminjaman, tanggal_pinjam, tanggal_kembali INTO kode, pinjam, kembali
	FROM peminjaman 
	WHERE idAnggota = id_Anggota
	ORDER BY tanggal_pinjam DESC
	LIMIT 1;
	
	SET lamaPinjam := DATEDIFF(kembali, pinjam);
	
	IF lamaPinjam <= 2 THEN
		SET peringatan = 'Silahkan pergunakan buku dengan baik';
	ELSEIF lamaPinjam <= 5 THEN
		SET peringatan = 'Ingat!! waktu pinjam segera habis';
	ELSEIF lamaPinjam >= 6 THEN
		SET peringatan = 'Warning!! denda menanti anda';
	ELSE 
		SET peringatan = 'Tidak ada status peminjaman';
	END IF;
	
	SELECT peringatan AS pesan;
END //
DELIMITER;


CALL pengingat ('A005');
DROP PROCEDURE pengingat;

-- nomor 3
DELIMITER//
CREATE PROCEDURE cekDenda(
	IN id_Anggota VARCHAR (10)
)
BEGIN
	DECLARE vTotalDenda INT;
	
	SELECT SUM(denda) INTO vTotalDenda
	FROM pengembalian
	WHERE idAnggota = id_Anggota;
	
	IF vTotalDenda > 0 THEN
		SELECT idAnggota, tgl_pinjam, tgl_kembali, vTotalDenda AS total_denda
		FROM pengembalian
		WHERE idAnggota = id_Anggota
		GROUP BY idAnggota;
	ELSE
		SELECT 'Anggota tidak memiliki tanggungan atau denda.' AS pesan;
	END IF;
END//
DELIMITER;

CALL cekDenda ('A005');
DROP PROCEDURE cekDenda;


-- nomor 4
DELIMITER //
CREATE PROCEDURE printPeminjaman()
BEGIN
    DECLARE batas INT DEFAULT 1;
    DECLARE kode VARCHAR (10);
    
    WHILE batas <= 10 DO
	
	SET kode = CONCAT('PM00', batas); 
	
        
        
        SET batas = batas + 1;
    END WHILE;
    -- SELECT kode;
    SELECT * FROM peminjaman WHERE kode_peminjaman BETWEEN 'PM001' AND 'PM010';
END //
DELIMITER ;
CALL printPeminjaman();
DROP PROCEDURE printPeminjaman;



-- nomor 5
DELIMITER //
CREATE PROCEDURE delete_nggota(
)
BEGIN
        DELETE FROM anggota WHERE jenis_kelamin = "L" AND idAnggota 
        NOT IN(SELECT idAnggota FROM peminjaman);
END//
DELIMITER ;

CALL delete_nggota();
DROP PROCEDURE delete_nggota;
SELECT*FROM anggota;