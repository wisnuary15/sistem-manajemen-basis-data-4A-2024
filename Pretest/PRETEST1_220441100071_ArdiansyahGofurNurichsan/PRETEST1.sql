CREATE DATABASE ruang_baca;

CREATE TABLE etalase_skripsi(
id_etalase INT (3) NOT NULL,
nim VARCHAR (12) NOT NULL,
judul_skripsi VARCHAR (50) NOT NULL,
dosen_pembimbing VARCHAR (20) NOT NULL,
dosen_penguji VARCHAR (20) NOT NULL,
topik VARCHAR (20) NOT NULL);

INSERT INTO etalase_skripsi VALUES 
(001, '220441100071', 'Cara memasak tanpa menggunakan api', 'Niko, S.P., M.P', 'Bayu, S.P., M.P.', 'Makanan'),
(002, '220441100099', 'Pengelolaan Database dengan benar', 'Aan, S.Kom., M.Kom.', 'Febri, S.T., M.Kom.', 'Skripsi')
;

SELECT * FROM etalase_skripsi;

CREATE TABLE daftar_member(
id_member INT (3) NOT NULL,
nama_member VARCHAR (30) NOT NULL,
email VARCHAR (30) NOT NULL,
password_member VARCHAR (8) NOT NULL, 
tipe_member VARCHAR (20) NOT NULL,
PRIMARY KEY (id_member)
);

INSERT INTO daftar_member VALUES
(001, 'Ardiansyah', 'ardiansyah@gmal.com', 'gajahter', 'premium'),
(002, 'Cindy', 'cindy@gmail.com', 'kudaja', 'premium')
;

SELECT *FROM daftar_member;


ALTER TABLE etalase_skripsi RENAME skripsi_etalase;
