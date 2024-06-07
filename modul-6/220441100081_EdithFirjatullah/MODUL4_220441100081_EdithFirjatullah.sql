create DATABASE tugasmodul4;
use tugasmodul4;

CREATE TABLE petugas(
id_petugas VARCHAR (10) PRIMARY KEY NOT NULL,
username VARCHAR(15) NOT NULL,
password VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

CREATE TABLE buku(
kode_buku VARCHAR (10) NOT NULL  PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
penerbit_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL, 
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20) NOT NULL
);

CREATE TABLE anggota(
id_anggota VARCHAR (10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL
);

CREATE TABLE pengembalian(
kode_kembali VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR(15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

CREATE TABLE peminjaman(
kode_peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

-- Input data --
INSERT INTO petugas (id_petugas, username, password, nama) VALUES 
('PTG001', 'sarah_connor', 'terminator', 'Sarah Connor'),
('PTG002', 'bruce_wayne', 'batman', 'Bruce Wayne'),
('PTG003', 'clark_kent', 'superman', 'Clark Kent'),
('PTG004', 'peter_parker', 'spiderman', 'Peter Parker'),
('PTG005', 'tony_stark', 'ironman', 'Tony Stark');


INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku)
VALUES 
('BK01', 'Atomic Habits', 'James Clear', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Self-help'),
('BK02', 'Sapiens: Riwayat Singkat Umat Manusia', 'Yuval Noah Harari', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Sejarah'),
('BK03', 'Homo Deus: Riwayat Singkat Masa Depan', 'Yuval Noah Harari', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Futurologi'),
('BK04', 'Kim Ji-Yeong Lahir Tahun 1982', 'Cho Nam-Joo', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Feminisme'),
('BK05', 'Layangan Putus', 'Mommy ASF', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Roman'),
('BK06', 'Luka dan Lara', 'Tere Liye', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Roman'),
('BK07', 'Orang-Orang Biasa', 'Andrea Hirata', 'Bentang Pustaka', '2023', '1', 'Tersedia', 'Fiksi-Inspiratif'),
('BK08', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2023', '1', 'Tersedia', 'Fiksi-Inspiratif'),
('BK09', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2023', '1', 'Tersedia', 'Fiksi-Inspiratif'),
('BK010', 'Kereta Api di Langit Malam', 'Tere Liye', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Fantasi');


INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam)
VALUES 
('A01', 'Adinda van der Berg', '2020', 'Jakarta', '1998-05-15', '081234567890', 'Perempuan', 'Meminjam'),
('A02', 'Budi Susanto', '2021', 'Yogyakarta', '1999-08-20', '081234567891', 'Laki-laki', 'Tidak Meminjam'),
('A03', 'Citra Sari', '2019', 'Bandung', '1997-12-10', '081234567892', 'Perempuan', 'Meminjam'),
('A04', 'David Tanaka', '2022', 'Surabaya', '2000-03-25', '081234567893', 'Laki-laki', 'Tidak Meminjam'),
('A05', 'Eva Wijaya', '2020', 'Semarang', '1998-01-05', '081234567894', 'Perempuan', 'Meminjam'),
('A06', 'Fransiska Hashimoto', '2021', 'Makassar', '1999-06-30', '081234567895', 'Perempuan', 'Tidak Meminjam'),
('A07', 'Gunawan van den Broek', '2019', 'Medan', '1997-09-12', '081234567896', 'Laki-laki', 'Meminjam'),
('A08', 'Hadi Sutanto', '2022', 'Pekanbaru', '2000-11-18', '081234567897', 'Laki-laki', 'Tidak Meminjam'),
('A09', 'Indra Prasetyo', '2020', 'Denpasar', '1998-04-02', '081234567898', 'Laki-laki', 'Meminjam'),
('A010', 'Jasmine van Acker', '2021', 'Balikpapan', '1999-07-20', '081234567899', 'Perempuan', 'Meminjam');


INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda)
VALUES 
('KMB01', 'A01', 'BK01', 'PTG001', '2024-04-01', '2024-04-07', '0'),
('KMB02', 'A03', 'BK02', 'PTG002', '2024-04-02', '2024-04-08', '0'),
('KMB03', 'A05', 'BK03', 'PTG003', '2024-04-03', '2024-04-09', '0'),
('KMB04', 'A07', 'BK04', 'PTG004', '2024-04-04', '2024-04-10', '0'),
('KMB05', 'A09', 'BK05', 'PTG005', '2024-04-05', '2024-04-11', '0'),
('KMB06', 'A01', 'BK06', 'PTG001', '2024-04-06', '2024-04-12', '0'),
('KMB07', 'A09', 'BK07', 'PTG002', '2024-04-07', '2024-04-13', '0'),
('KMB08', 'A010', 'BK08', 'PTG003', '2024-04-08', '2024-04-14', '0'),
('KMB09', 'A01', 'BK09', 'PTG004', '2024-04-09', '2024-04-15', '0'),
('KMB10', 'A010', 'BK010', 'PTG005', '2024-04-10', '2024-04-16', '0');


INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku)
VALUES 
('PMJ01', 'A01', 'PTG001', '2024-04-01', '2024-04-07', 'BK01'),
('PMJ02', 'A03', 'PTG002', '2024-04-02', '2024-04-08', 'BK02'),
('PMJ03', 'A05', 'PTG003', '2024-04-03', '2024-04-09', 'BK03'),
('PMJ04', 'A07', 'PTG004', '2024-04-04', '2024-04-10', 'BK04'),
('PMJ05', 'A09', 'PTG005', '2024-04-05', '2024-04-11', 'BK05'),
('PMJ06', 'A01', 'PTG001', '2024-04-06', '2024-04-12', 'BK06'),
('PMJ07', 'A09', 'PTG002', '2024-04-07', '2024-04-13', 'BK07'),
('PMJ08', 'A010', 'PTG003', '2024-04-08', '2024-04-14', 'BK08'),
('PMJ09', 'A01', 'PTG004', '2024-04-09', '2024-04-15', 'BK09'),
('PMJ10', 'A010', 'PTG005', '2024-04-10', '2024-04-16', 'BK010'),
('PMJ11', 'A03', 'PTG001', '2024-04-11', '2024-04-16', 'BK03'),
('PMJ12', 'A07', 'PTG002', '2024-04-16', '2024-04-22', 'BK010'),
('PMJ13', 'A01', 'PTG005', '2024-04-23', '2024-04-29', 'BK010'),
('PMJ14', 'A01', 'PTG005', '2024-04-23', '2024-04-29', 'BK07'),
('PMJ15', 'A01', 'PTG005', '2024-04-23', '2024-04-29', 'BK02');

------Soal----------------------------------------------------------------------------------------------------------
-----1-----
CREATE PROCEDURE biodata(
    IN nim INT,
    IN nama VARCHAR(20),
    IN alamat VARCHAR(40),
    IN noTelp INT,
    IN jenisKelamin VARCHAR(1),
    IN hobi VARCHAR(30),
    IN umur INT
)
BEGIN
    DECLARE vNim INT;
    DECLARE vNamaM VARCHAR(20);
    DECLARE vAlamat VARCHAR(40);
    DECLARE vNoTelp INT;
    DECLARE vJenisKelamin VARCHAR(1);
    DECLARE vHobi VARCHAR(30);
    DECLARE vumur INT;
    
    SET vNim = nim;
    SET vNamaM = nama;
    SET vAlamat = alamat;
    SET vNoTelp = noTelp;
    SET vJenisKelamin = jenisKelamin;
    SET vHobi = hobi;
    SET vumur = umur;
    

    SELECT vNim AS NIM, 
           vNamaM AS Nama_Mahasiswa, 
           vAlamat AS Alamat_asal, 
           vNoTelp AS No_Telp,
           vJenisKelamin AS Jenis_Kelamin, 
           vHobi AS Hobi, 
           vumur AS Umur;
END

DROP PROCEDURE biodata;

CALL biodata (200441100123, 'Adinda', 'Sumedang', 0897654321, 'L', 'Memancing', 23)
----------------------------------------------------------------------------------------------------------------

-----2----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE peringatanbuku()
BEGIN 
	SELECT kode_kembali, id_anggota, tgl_pinjam, tgl_kembali, DATEDIFF(tgl_kembali, tgl_pinjam) AS lama_meminjam,
	CASE WHEN DATEDIFF(tgl_kembali, tgl_pinjam) <= 2 THEN ' Silahkan Pergunakan Buku dengan baik'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) BETWEEN 3 AND 5 THEN  ' Ingat!, Waktu pinjam segera habis'
	WHEN DATEDIFF(tgl_kembali, tgl_pinjam) >= 6 THEN ' Warning!!!, Denda menanti anda' END AS "statusnya"
	FROM pengembalian ORDER BY lama_meminjam ASC;
END 

call peringatanbuku()
DROP PROCEDURE peringatanbuku;
----------------------------------------------------------------------------------------------------------------

-----3----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dendapinjam(
	IN kode VARCHAR(10))
BEGIN
DECLARE total_denda VARCHAR (50);

	IF ((SELECT SUM(denda) FROM pengembalian WHERE id_anggota = kode) !=0) THEN
		SET total_denda = (SELECT SUM(denda) FROM pengembalian WHERE id_anggota=kode);
	ELSE 	
		SET total_denda = 'Anda tidak memiliki denda';
	END IF;
		SELECT total_denda;
END

CALL dendapinjam('A03');
DROP PROCEDURE dendapinjam;
----------------------------------------------------------------------------------------------------------------

-----4----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dataPeminjaman (
    IN jumlah INT
)
BEGIN
    DECLARE ini INT DEFAULT 1;

    WHILE ini <= jumlah DO
        SELECT * FROM peminjaman LIMIT jumlah;
        SET ini = ini + 1;
    END WHILE;
END

CALL dataPeminjaman(10);
----------------------------------------------------------------------------------------------------------------

-----5----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE hapusDataanggota ()
BEGIN
	 DELETE FROM anggota
    WHERE jenis_kelamin = 'Laki-laki'
    AND id_anggota NOT IN (
        SELECT DISTINCT id_anggota 
        FROM peminjaman 
        WHERE status_pinjam != "Tidak Meminjam"
    );
END

CALL hapusDataanggota();
SELECT * FROM anggota;
----------------------------------------------------------------------------------------------------------------