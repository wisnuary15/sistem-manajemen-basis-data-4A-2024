CREATE DATABASE ruang_baca;

USE ruang_baca;

-- buat tabel
CREATE TABLE etalase_skripsi(
id_etalase INT(10) NOT NULL PRIMARY KEY,
nim INT(15) NOT NULL,
nama_mhs VARCHAR(50) NOT NULL,
judul_skripsi VARCHAR(50) NOT NULL,
dosen_pembimbing VARCHAR(50) NOT NULL,
dosen_penguji VARCHAR(50) NOT NULL,
topik VARCHAR(50) NOT NULL
);

-- masukkan data
INSERT INTO etalase_skripsi VALUES
(001, 104, 'ADELIA', 'judul1', 'pembimbing1', 'penguji1', 'topik1'),
(002, 105, 'SHAFIRA', 'judul2', 'pembimbing2', 'penguji2', 'topik2'),
(003, 106, 'DEVI', 'judul3', 'pembimbing3', 'penguji3', 'topik3'),
(004, 107, 'ARUM', 'judul4', 'pembimbing4', 'penguji4', 'topik4');

-- tampilkan data
SELECT * FROM etalase_skripsi;

-- buat tabel daftar member
CREATE TABLE daftar_member(
id_member INT(10) NOT NULL PRIMARY KEY,
nama_memb VARCHAR(50) NOT NULL,
email VARCHAR(20) NOT NULL,
pass INT(8) NOT NULL,
tipe_memb VARCHAR(20) NOT NULL
);

-- masukkan data member
INSERT INTO daftar_member VALUES
(101, 'lia', 'lia@gmail.com', 12345678, 'eksklusif'),
(102, 'fita', 'fta@gmail.com', 09845678, 'eksklusif'),
(103, 'ali', 'aala@gmail.com', 12345013, 'biasa'),
(104, 'alaia', 'alia@gmail.com', 12345753, 'biasa'),
(105, 'lim', 'lim@gmail.com', 19765678, 'eksklusif');

-- rename etalase skripsi
ALTER TABLE etalase_skripsi RENAME skripsi_etalase;

-- rename email member
ALTER TABLE daftar_member UPDATE email email_member; (eror)

-- ubah record pada tabel etalase skripsi


-- hapus tabel skripsi
DROP TABLE skripsi_etalase;

-- hapus database ruang baca
DROP DATABASE ruang_baca;
