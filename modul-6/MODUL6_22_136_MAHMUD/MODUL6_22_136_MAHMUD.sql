CREATE DATABASE perpustakaan4;

USE perpustakaan4;

CREATE TABLE petugas (
IdPetugas VARCHAR (10) NOT NULL,
Username VARCHAR (15) NOT NULL,
PASSWORD VARCHAR (15) NOT NULL,
Nama VARCHAR (25) NOT NULL,
PRIMARY KEY (IdPetugas));

CREATE TABLE anggota(
IdAnggota VARCHAR(10) NOT NULL,
Nama_Anggota VARCHAR(20) NOT NULL,
Angkatan_Anggota VARCHAR(20) NOT NULL,
Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
Tanggal_Lahir_Anggota DATE NOT NULL,
No_Telp INT(12) NOT NULL,
Jenis_Kelamin VARCHAR(15) NOT NULL,
Status_Pinjam VARCHAR(15),
PRIMARY KEY (IdAnggota));

CREATE TABLE buku (
Kode_Buku VARCHAR(10) NOT NULL,
Judul_Buku VARCHAR(45) NOT NULL,
Pengarang_Buku VARCHAR(30) NOT NULL,
Penerbit_Buku VARCHAR(30) NOT NULL,
Tahun_Buku VARCHAR(10) NOT NULL,
Jumlah_Buku VARCHAR(5) NOT NULL,
Status_Buku VARCHAR(10) NOT NULL,
Klasifikasi_Buku VARCHAR(20) NOT NULL,
PRIMARY KEY (Kode_Buku));

DROP TABLE peminjaman;
CREATE TABLE peminjaman(
Kode_Peminjaman VARCHAR(10) NOT NULL,
IdAnggota VARCHAR(10) NOT NULL,
IdPetugas VARCHAR(10) NOT NULL,
Tanggal_Pinjam DATE,
Tanggal_Kembali DATE,
Kode_Buku VARCHAR(10) NOT NULL,
PRIMARY KEY (Kode_Peminjaman),
FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku));

CREATE TABLE pengembalian(
Kode_Kembali VARCHAR(10) NOT NULL,
idAnggota VARCHAR(10) NOT NULL,
Kode_Buku VARCHAR(10) NOT NULL,
IdPetugas VARCHAR(10) NOT NULL,
Tanggal_Pinjam DATE NOT NULL,
Tanggal_Kembali DATE NOT NULL,
Denda VARCHAR(15),
PRIMARY KEY (Kode_Kembali),
FOREIGN KEY (IdAnggota) REFERENCES anggota(idAnggota),
FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku));

INSERT INTO petugas VALUES 
('001', 'Reza01', 'reza001', 'Reza Aditya'),
('002', 'Adit02', 'adit002', 'Aditya Putra'),
('003', 'Farah03', 'farah03', 'Farah Sahla'),
('004', 'Siti04', 'siti04', 'Siti Mustanik'),
('005', 'Putry05', 'putry05', 'Putry Pebriani');

INSERT INTO anggota VALUES 
('100', 'Sri Wahyuni', '2021', 'Bojonegoro', '2002-09-01', 0812347891, 'Perempuan', 'Tidak Ada'),
('101', 'Ana Indria', '2021', 'Tangerang', '2002-10-02', 0893002889, 'Perempuan', 'Ada'),
('102', 'Dandi Suprapto', '2021', 'Bandung', '2001-12-12', 0832341550, 'Laki-Laki', 'Ada'),
('103', 'Yanu Aji', '2021', 'Tuban', '2001-09-10', 0812376219, 'Laki-Laki', 'Tidak Ada'),
('104', 'Panji Ardana', '2020', 'Semarang', '2001-05-09', 0823348907, 'Laki-Laki', 'Ada'),
('105', 'Pita Permatasari', '2020', 'Bojonegoro', '2001-05-12', 0815409723, 'Perempuan', 'Ada'),
('106', 'Arya Alindra', '2020', 'Kediri', '2001-04-29', 0878932014, 'Laki-Laki','Tidak Ada'),
('107', 'Rista Anggraini', '2022', 'Pasuruan', '2005-01-29', 0834210076, 'Perempuan', 'Ada'),
('108', 'Maya Puspitadara', '2022', 'Mojokerto', '2004-12-30', 0812308954, 'Perempuan', 'Ada'),
('109', 'Galih Andra', '2022', 'Lamongan', '2004-11-28', 0827899093, 'Laki-Laki', 'Ada'),
('110', 'Dewi Nurmalita', '2022', 'Surabaya', '2005-01-02', 0876542130, 'Perempuan', 'Ada');

INSERT INTO buku VALUES
('200', 'Miracle Number', 'Addit P; Budiarto', 'Gramedia', '1990', '10', 'ada', 'non-fiksi'),
('201', 'The Miracle Of Enzyme', 'Hiromi Shinya', 'Gramedia','2012', '10', 'ada', 'non-fiksi'),
('202', 'The Miracle of hypnotic persuasion', 'Idrus Putra', 'Gramedia','2017', '10', 'ada', 'non-fiksi'),
('203', 'Hipnotisme pribadi ', 'Lecron', 'Gramedia', '1986', '10', 'ada', 'non-fiksi'),
('204', 'State Of Wonder', 'Patchett, Ann', 'Gramedia', '2011', '5', 'ada', 'fiksi'),
('205', 'Manusia Bebas', 'Sumarsih', 'AndhiPubliser', '1999', '5', 'ada', 'fiksi'),
('206', 'Love Story', 'Embun Pagi', 'AndhiPubliser', '2015', '10', 'ada', 'fiksi'),
('207', 'Twins Love Story', 'Tasya Livia', 'AndhiPubliser','2016', '10', 'ada', 'fiksi'),
('208', 'Analogi Cinta Sendiri', 'Oka', 'AndhiPubliser','2012', '10', 'ada', 'non-fiksi'),
('209', 'Mekar dalam Prahara', 'Asnita Wati', 'AndhiPubliser', '1990', '10', 'ada', 'non-fiksi'),
('210', 'Algoritma dan pemprograman menggunakan python', 'Muhammad Rapianto', 'AndhiPubliser', '2016', '10', 'ada', 'non-fiksi');


INSERT INTO peminjaman VALUES
('1', '101', '001', '2021-10-12', '2021-10-19', '200'),
('2', '101', '001', '2021-10-12', '2021-10-19', '201'),
('3', '102', '002', '2021-09-11', '2021-09-18', '206'),
('4', '102', '002', '2021-08-17', '2021-08-23', '210'),
('5', '104', '003', '2021-09-20', '2021-09-27', '210'),
('6', '105', '004', '2021-01-09', '2021-01-15', '210'),
('7', '102', '005', '2021-01-20', '2021-01-27', '208'),
('8', '107', '005', '2022-09-15', '2022-09-23', '210'),
('9', '108', '003', '2022-10-09', '2022-10-16', '210'),
('10', '109', '004', '2022-12-13', '2022-12-20', '204'),
('11', '102', '002', '2022-12-14', '2022-12-21', '204'),
('12', '102', '001', '2022-12-20', '2022-12-27', '205'),
('13', '102', '002', '2022-12-27', '2023-01-03', '201'),
('14', '102', '002', '2022-01-03', '2023-01-10', '203'),
('15', '102', '004', '2022-01-10', '2023-01-17', '201');

DROP TABLE peminjaman;
INSERT INTO pengembalian VALUES
('01', '100', '200', '001', '2021-10-12', '2021-10-19', '0'),
('02', '101', '201', '001', '2021-10-12', '2021-10-20', '10.000'),
('03', '102', '206', '002', '2021-09-11', '2021-09-13', '0'),
('04', '102', '210', '002', '2021-08-17', '2021-08-25', '20.000'),
('05', '104', '210', '003', '2021-09-20', '2021-09-29', '20.000'),
('06', '105', '210', '003', '2021-01-09', '2021-01-14', '0'),
('07', '102', '208', '005', '2021-01-20', '2021-01-25', '0'),
('08', '107', '210', '005', '2022-09-15', '2022-09-24', '10.000'),
('09', '108', '210', '003', '2022-10-09', '2022-10-18', '20.000'),
('10', '109', '204', '004', '2022-12-13', '2022-12-19', '0'),
('11', '102', '204', '002',  '2022-12-14', '2022-12-20', '0'),
('12', '102', '205', '001', '2022-12-20', '2022-12-27', '0'),
('13', '102', '201', '002', '2022-12-27', '2023-01-03', '0'),
('14', '102', '203', '002', '2022-01-03', '2023-01-10', '0'),
('15', '102', '201', '002', '2022-01-10', '2023-01-17', '0');

SELECT* FROM pengembalian;
-- soal 1
DELIMITER //
CREATE PROCEDURE biodata (
IN newnama VARCHAR (20),
IN newnim VARCHAR (20),
IN newalamat VARCHAR (20),
IN newtgl_lahir DATE ,
IN newumur INT ,
IN newtelp VARCHAR (13),
IN newjenis_kelamin VARCHAR (20),
IN newhobi VARCHAR (20))
BEGIN
DECLARE nama VARCHAR (30);
DECLARE nim VARCHAR (30);
DECLARE alamat VARCHAR (30);
DECLARE tgl_lahir DATE ;
DECLARE umur INT ;
DECLARE telp VARCHAR (30);
DECLARE jenis_kelamin VARCHAR (30);
DECLARE hobi  VARCHAR (30);

SET nama = newnama;
SET nim = newnim;
SET alamat= newalamat;
SET tgl_lahir = newtgl_lahir;
SET umur = TIMESTAMPDIFF(YEAR,newtgl_lahir, CURDATE());
SET telp = newtelp;
SET jenis_kelamin = newjenis_kelamin;
SET hobi = newhobi;

SELECT nama AS NAMA, nim AS NIM, alamat AS ALAMAT, tgl_lahir AS TGL_LAHIR,
telp AS TELPON , jenis_kelamin AS JENIS_KELAMIN, hobi AS HOBI, umur AS UMUR;
END //
DELIMITER ;

CALL biodata('Mahmud','220441100081','Bangkalan','2003-10-12',
'','081235360407','Laki-laki','Main');

-- soal 2
DROP PROCEDURE pengingat_pengembalian;
DELIMITER //
CREATE PROCEDURE pengingat_pengembalian(IN p_kode_buku VARCHAR(100))
BEGIN
	DECLARE v_tanggal_pinjam DATE;
    DECLARE v_selisih_hari INT;

	SELECT Tanggal_Pinjam INTO v_tanggal_pinjam FROM peminjaman WHERE Kode_Buku = p_kode_buku;
    SET v_selisih_hari = DATEDIFF(CURRENT_DATE(), v_tanggal_pinjam);

	IF v_selisih_hari <= 2 THEN
		SELECT 'Silahkan pergunakan buku dengan baik' AS keterangan_pengingat;
	ELSEIF v_selisih_hari BETWEEN 3 AND 5 THEN
		SELECT 'Ingat!, waktu pinjam segera habis' AS keterangan_pengingat;
	ELSEIF v_selisih_hari >= 6 THEN
		SELECT 'Warning!!!, denda menanti anda' AS keterangan_pengingat;
	END IF;
END //
DELIMITER ;
CALL pengingat_pengembalian('205');
SELECT * FROM peminjaman;

-- soal 3
DROP PROCEDURE denda
DELIMITER //
CREATE PROCEDURE denda (IN id_anggota VARCHAR(100))
BEGIN
DECLARE JumlahDenda VARCHAR(100);
IF ((SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = id_anggota) !=0) THEN
	SET JumlahDenda = (SELECT SUM(Denda) FROM pengembalian WHERE IdAnggota = id_anggota);
ELSE
	SET JumlahDenda = "Anda Tidak Memiliki Denda";
END IF;
	SELECT JumlahDenda;
END //
DELIMITER ;
        
CALL denda("102");

-- soal 4
DROP PROCEDURE looping; 
DELIMITER //
CREATE PROCEDURE looping(IN cetakData INT)
BEGIN
DECLARE s VARCHAR(150);
DECLARE i INT(3);
SET i = 1;
SET s = '';

WHILE i <= cetakData DO
SET s = CONCAT('', i);
SET i = i+1;
SELECT * FROM peminjaman WHERE kode_peminjaman = s;
END WHILE ;
END //
DELIMITER ;
CALL looping(10);

-- soal 5
DROP PROCEDURE hapus;
DELIMITER //
CREATE PROCEDURE hapus(IN jeniskelamin VARCHAR(20))
BEGIN
IF jeniskelamin = "Laki-Laki" THEN DELETE FROM anggota
WHERE Jenis_Kelamin = "Laki-Laki" AND Status_Pinjam != "Ada";
END IF;
END //
DELIMITER ; 
CALL hapus("Laki-Laki");
SELECT * FROM anggota;