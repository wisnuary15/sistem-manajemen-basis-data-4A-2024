CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi (
id_etalase INT(11) PRIMARY KEY,
nim INT(11),
nama_mahasiswa VARCHAR(25),
judul_skripsi VARCHAR(25),
dosen_pembimbing VARCHAR(25),
dosen_penguji VARCHAR(25),
topik VARCHAR(25)
);

CREATE TABLE daftar_member (
id_member INT(11) PRIMARY KEY,
nama_member VARCHAR(25),
email VARCHAR(25),
PASSWORD INT(11),
tipe_member VARCHAR(25)
);

INSERT INTO etalase_skripsi (id_etalase, nim, nama_mahasiswa, judul_skripsi, dosen_pembimbing, dosen_penguji, topik) VALUE 
(12, 229734, "sifa", "spk pemilihan KIP", "pak doni", "bu hera", "spk"),
(14, 297421, "saputra", "SI wisata" , "pak yasid", "bu yeni", "SI"),
(16, 172629, "dido", "spk pemilihan bansos", "pak budi", "bu hera", "spk");

INSERT INTO daftar_member (id_member, nama_member, email, PASSWORD, tipe_member) VALUE 
(12, "sifa", "sip@gmail.com", 126282, "GOLD");

ALTER TABLE etalase_skripsi RENAME TO skripsi_etalase;


ALTER TABLE daftar_member CHANGE COLUMN TO email email_member VARCHAR(25);


DROP TABLE skripsi_etalase;

DROP SCHEMA ruang_baca;