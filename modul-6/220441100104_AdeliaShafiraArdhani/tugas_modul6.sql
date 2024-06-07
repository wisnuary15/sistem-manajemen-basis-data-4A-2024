CREATE DATABASE perpustakaan;

USE perpustakaan;

CREATE TABLE petugas(
id_petugas VARCHAR(10) NOT NULL PRIMARY KEY,
username VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

CREATE TABLE buku(
kode_buku VARCHAR(10) NOT NULL PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang VARCHAR(30) NOT NULL,
penerbit VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL,
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20)
);

CREATE TABLE anggota(
id_anggota VARCHAR(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir VARCHAR(20) NOT NULL,
tanggal_lahir DATE NOT NULL,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjaman VARCHAR(15) NOT NULL
);

CREATE TABLE pinjaman(
kode_pinjaman VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE NOT NULL,
tanggal_kembali DATE NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

CREATE TABLE kembali(
kode_kembali VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE NOT NULL,
tanggal_kembali DATE NOT NULL,
denda INT(15),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

ALTER TABLE kembali ADD CONSTRAINT fk_id_anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);

INSERT INTO petugas VALUES
('pt001', 'adelia001', 'adelia123', 'adelia'),
('pt002', 'fira002', 'fira234', 'fira'),
('pt003', 'arum003', 'arum345', 'arum'),
('pt004', 'devi004', 'devi456', 'devi'),
('pt005', 'depi005', 'depi567', 'depi');

INSERT INTO anggota VALUES
('agt001', 'adelia', 22, 'sidoarjo', '2004-09-24', 08951582057, 'perempuan', 'kembali'),
('agt002', 'fira', 22, 'lamongan', '2004-03-26', 08123456890, 'perempuan', 'kembali'),
('agt003', 'arum', 22, 'pasuruan', '2004-10-24', 08391730163, 'perempuan', 'pinjam'),
('agt004', 'devi', 22, 'lamongan', '2003-09-18', 085928461936, 'perempuan', 'pinjam'),
('agt005', 'depi', 22, 'tuban', '2004-03-25', 089173524781, 'perempuan', 'pinjam'),
('agt006', 'genta', 21, 'nganjuk', '2003-01-01', 08951123567, 'laki-laki', 'kembali'),
('agt007', 'rafi', 21, 'lamongan', '2002-03-26', 08123458315, 'laki-laki', 'kembali'),
('agt008', 'irham', 21, 'sidoarjo', '2003-10-24', 0839182648, 'laki-laki', 'pinjam'),
('agt009', 'syahrul', 21, 'surabaya', '2003-09-18', 089284692, 'laki-laki', 'pinjam');

INSERT INTO buku VALUES
('bk001', 'buku1', 'pengarang1', 'penerbit1', 2021, 10, 'ada', 'sql'),
('bk002', 'buku2', 'pengarang2', 'penerbit2', 2021, 10, 'kembali', 'data mining'),
('bk003', 'buku3', 'pengarang3', 'penerbit3', 2021, 10, 'ada', 'java'),
('bk004', 'buku4', 'pengarang4', 'penerbit4', 2021, 10, 'ada', 'php'),
('bk005', 'buku5', 'pengarang5', 'penerbit5', 2021, 10, 'dipinjam', 'html'),
('bk006', 'buku6', 'pengarang6', 'penerbit6', 2022, 10, 'ada', 'python'),
('bk007', 'buku7', 'pengarang7', 'penerbit7', 2022, 10, 'ada', 'kotlin'),
('bk008', 'buku8', 'pengarang8', 'penerbit8', 2022, 10, 'dipinjam', 'pemrograman dasar'),
('bk009', 'buku9', 'pengarang9', 'penerbit9', 2022, 10, 'ada', 'dataset'),
('bk0010', 'buku10', 'pengarang10', 'penerbit10', 2022, 10, 'ada', 'database');

INSERT INTO pinjaman VALUES
('pj001', 'ang003', 'pt002', '2024-03-01', '2024-03-08', 'bk007'),
('pj002', 'ang004', 'pt002', '2024-03-01', '2024-03-08', 'bk007'),
('pj003', 'ang005', 'pt002', '2024-03-01', '2024-03-08', 'bk007'),
('pj004', 'ang008', 'pt001', '2024-03-02', '2024-03-09', 'bk007'),
('pj005', 'ang001', 'pt001', '2024-03-02', '2024-03-09', 'bk007'),
('pj006', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk007'),
('pj007', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk008'),
('pj008', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk009'),
('pj009', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk001'),
('pj0010', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk002'),
('pj0011', 'ang009', 'pt001', '2024-03-03', '2024-03-10', 'bk003');

INSERT INTO kembali VALUES
('kbl001', 'ang002', 'bk005', 'pt003', '2024-02-21', '2024-02-29', '5000'),
('kbl002', 'ang006', 'bk006', 'pt003', '2024-02-21', '2024-02-28', '0'),
('kbl003', 'ang007', 'bk008', 'pt004', '2024-02-22', '2024-03-01', '5000');

/* menampilkan biodata dengan isi : Nim, Nama mahasiswa, Alamat, No Telpon, jenis Kelamin dan Hobi serta 
tambahkan umur sekarang. Kemudian tampilkan hasilnya. */

DELIMITER//
CREATE PROCEDURE biodataAnggota(
	IN nim VARCHAR(20),
	IN nama VARCHAR(50),
	IN alamat VARCHAR(50),
	IN noTelp INT(12),
	IN jenisKelamin VARCHAR(1),
	IN hobi VARCHAR(20),
	IN tglLahir DATE,
	IN umur INT
)
BEGIN
	DECLARE vNim VARCHAR(20);
	DECLARE vNama VARCHAR (50);
	DECLARE vAlamat VARCHAR(50);
	DECLARE vNoTelp INT(12);
	DECLARE vJk VARCHAR(1);
	DECLARE vHobi VARCHAR(20);
	DECLARE vTglLahir DATE;
	DECLARE vUmur INT;
	
	SET vNim = nim;
	SET vNama = nama;
	SET vAlamat = alamat;
	SET vNoTelp = noTelp;
	SET vJk = jenisKelamin;
	SET vHobi = hobi;
	SET vTglLahir = tglLahir;
	SET vUmur = TIMESTAMPDIFF(YEAR, tglLahir, CURDATE());
	
	SELECT vNim AS NIM, vNAma AS Nama_Mahasiswa, 
	vAlamat AS Alamat_Mahasiswa, vNoTelp AS No_Telp,
	vJk AS Jenis_kelamin, vHobi AS Hobi, vUmur AS Umur_Mahasiswa;
END//
DELIMITER;
	
CALL biodataAnggota('220441100104', 'adelia shafira ardhani', 'sidoarjo', 0895158, 'p', 'tidur', '2004-09-24', '')

/* menentukan keterangan pengingat pengembalian buku, dengan ketentuan jika tanggal pinjam <=2 hari 
"silahkan pergunakan buku dengan baik", jika tanggal pinjam antara 3-5 hari "ingat! waktu pinjam segera habis",
dan jika tanggal pinjam >= 6 hari "warning!!! denda menanti anda" */

DELIMITER //
CREATE PROCEDURE reminder(peminjam VARCHAR(50))
BEGIN 
    SELECT 
        nama_anggota AS namaAnggota,
        CONCAT(DATEDIFF(CURDATE(), tanggal_pinjam), ' hari') AS durasi_pinjam,
        CASE
            WHEN DATEDIFF(CURDATE(), tanggal_pinjam) <= 2 THEN 'Silahkan pergunakan buku dengan baik'
            WHEN DATEDIFF(CURDATE(), tanggal_pinjam) BETWEEN 3 AND 5 THEN 'Ingat! Waktu pinjam segera habis'
            WHEN DATEDIFF(CURDATE(), tanggal_pinjam) >= 6 THEN 'Warning!!! Denda menanti Anda'
        END AS keterangan
    FROM anggota JOIN pinjaman USING (id_anggota) WHERE nama_anggota = peminjam OR 
    id_anggota = peminjam;
END //
DELIMITER ;

CALL reminder('adelia');

/* memeriksa jumlah denda yang dimiliki mahasiswa! 
Jika mahasiswa mendapat denda maka akan menampilkan data denda yang belum 
dibayarkan, jika mahasiswa sudah membayar atau tidak memiliki tanggungan denda 
maka akan menampilkan pesan bahwa mahasiswa tersebut tidak memiliki tanggungan 
atau denda. */

DELIMITER //
CREATE PROCEDURE cekDenda(IN peminjam VARCHAR(20))
BEGIN
	DECLARE total_denda INT(15);
	SELECT SUM(denda) INTO total_denda FROM kembali JOIN anggota USING (id_anggota) 
	WHERE nama_anggota = peminjam AND denda > 0;
		IF total_denda IS NULL THEN SELECT 'Anggota ' AS 'Keterangan', 
		nama_anggota AS 'Nama Anggota', 
		'Tidak memiliki tanggungan atau denda' AS 'Denda'
	FROM anggota WHERE nama_anggota = peminjam;
		ELSE
			SELECT 'Anggota ' AS 'Keterangan', 
			nama_anggota AS 'Nama Anggota', 
			CONCAT('Total denda yang belum dibayar : Rp ', total_denda) AS 'Denda'
	FROM anggota WHERE nama_anggota = peminjam;
	END IF;
END //
DELIMITER;

CALL cekDenda('fira');

/* looping untuk mencetak data peminjaman 1 sampai dengan 10 */
DELIMITER //
CREATE PROCEDURE data_pinjam(IN batas INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= batas DO
        SET i = i + 1;
    END WHILE;  
    SELECT * FROM pinjaman WHERE kode_pinjaman <= batas;
END //
DELIMITER ;
DROP PROCEDURE data_pinjam;
CALL data_pinjam(10);

/* Hapuslah anggota dengan jenis kelamin Laki-laki dari basisdata PERPUSTAKAAN. Akan 
tetapi jika Anggota tersebut mempunyai status pinjam tidak nol,maka pemain tidak 
boleh dihapus dari basisdata!  */

DELIMITER //
CREATE PROCEDURE hapus_laki(IN jk VARCHAR(15))
BEGIN
    DECLARE jumlahPinjam INT;
    DECLARE keterangan VARCHAR(50);
    DELETE FROM anggota WHERE jenis_kelamin = jk AND status_pinjaman = 'kembali';

    SET jumlahPinjam = ROW_COUNT();
    
   IF jumlahPinjam = 0 THEN
	SET keterangan = 'tidak ada data yang dihapus';
   ELSE
	SET keterangan = CONCAT(jumlahPinjam, 'data dihapus');
        END IF;
        SELECT keterangan AS hasil; 
END //
DELIMITER ;
DROP PROCEDURE hapus_laki;

SET SQL_SAFE_UPDATES = 0;
CALL hapus_laki('agt002');
