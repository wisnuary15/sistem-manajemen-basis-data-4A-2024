CREATE DATABASE ruang_baca;
USE ruang_baca;

CREATE TABLE etalase_skripsi(
id_etalase INT(20) NOT NULL PRIMARY KEY,
nim INT (20),
nama_mahasiswa VARCHAR(25),
judul_skripsi VARCHAR (50),
dosen_pembimbing VARCHAR (50),
dosen_penguji VARCHAR (50),
topik VARCHAR (50)
);

CREATE TABLE daftar_member(
id_member INT (20)NOT NULL PRIMARY KEY,
nama_member VARCHAR(25),
email VARCHAR (25),
pasword VARCHAR (10),
tipe_member VARCHAR (20)
);

INSERT INTO etalase_skripsi VALUE
(01,220441100129,"sulthon","cara cara membuat cara","pak doni","pak syarief","lawak"),
(02,22044110040,"yiga","cara meng cara","pak rafi","pak izud","bermain");

INSERT INTO daftar_member VALUE
(112,"sriannung","lawak@gmail.com","wkwkw","magang");

ALTER TABLE daftar_member RENAME email_member;

SELECT * FROM daftar_member;