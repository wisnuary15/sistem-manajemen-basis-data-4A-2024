CREATE DATABASE ruang_baca;
USE ruang_baca;

CREATE TABLE etalase_skripsi(
id_etalase INT(5) NOT NULL PRIMARY KEY,
nim INT(15) NOT NULL,
nama_mahasiswa VARCHAR(20) NOT NULL,
judul_skripsi VARCHAR(50) NOT NULL,
dosen_pembimbingg VARCHAR(50) NOT NULL,
dosen_penguji VARCHAR(50) NOT NULL,
topik VARCHAR(50) NOT NULL,
);

DROP TABLE etalase_skripsi;

DESC etalase_skripsi;

DROP DATABASE ruang_baca;

INSERT TABLE etalase_skripsi VALUES
(101, 220441100123, 'aditya', 'sistem informasi apotek', 'yudha', 'ali', 'sistem');

CREATE TABLE daftar_member(
id_member INT(5) NOT NULL PRIMARY KEY ,
nama_member VARCHAR(15) NOT NULL,
email VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
tipe_member VARCHAR(15) NOT NULL
);

INSERT TABLE daftar_table VALUES
(101, 'aditya', 'aditya@gmail.com', '161616', '111' );
