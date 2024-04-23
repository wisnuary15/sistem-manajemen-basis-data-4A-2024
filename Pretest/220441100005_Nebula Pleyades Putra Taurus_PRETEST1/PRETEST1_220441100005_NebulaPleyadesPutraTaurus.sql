CREATE DATABASE ruang_baca

USE ruang_baca

CREATE TABLE etalase_skripsi(
   id_etalase INT AUTO_INCREMENT PRIMARY KEY,
   nim INT(20),
   nama_mahasiswa VARCHAR(30),
   judul_skripsi VARCHAR(40),
   dosen_pembimbing VARCHAR(30),
   dosen_penguji VARCHAR(30),
   topik VARCHAR(20)
);

INSERT INTO etalase_skripsi (nim, nama_mahasiswa, judul_skripsi, dosen_pembimbing, dosen_penguji, topik) VALUES
(1704411000091, 'James Bond', 'Analisis Fenomena Sosial Media Berupa White Knight Pada Asumsi Publik Di suatu Influencer', 'Nanad Wasikom S.T, M.T', 'Dylan William S.T, M.M', 'Sosial Media'),
(1704411000091, 'Andre Gas LPG', 'Analisis Perkembangan Harga LPG di Kota Surabaya', 'Mikael William Robert S.kom, M.Kom', 'Dylan Kopling S.T, M.M', 'Ekonomi');

SELECT * FROM etalase_skripsi

CREATE TABLE daftar_memeber(
   id_member INT AUTO_INCREMENT PRIMARY KEY,
   nama_member VARCHAR(30),
   email VARCHAR(30),
   pass VARCHAR(30),
   tipe_member VARCHAR(20)
);

INSERT INTO daftar_memeber (nama_member, email, pass, tipe_member) VALUES
('Ryan Gosling', 'RyanSukaLolipop@yahoo.com', 'RyanProplayer123', 'Premium'),
('William Jimmy', 'MieGoreng123@gmail.com', 'WillyRotasi123', 'Gratisan');

SELECT * FROM daftar_memeber

ALTER TABLE etalase_skripsi
RENAME TO skripsi_etalase;

ALTER TABLE daftar_memeber

DROP TABLE skripsi_etalase

DROP DATABASE ruang_baca
