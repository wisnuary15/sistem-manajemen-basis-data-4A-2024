CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi(
id INT (3) NOT NULL PRIMARY KEY,
nim INT (12) NOT NULL,
nama_mahasiswa VARCHAR (100),
judul_skripsi VARCHAR (100),
dosen_pembimbing VARCHAR (100),
dosen_penguji VARCHAR (100),
topik VARCHAR (100)
);

INSERT INTO etalase_skripsi VALUES
(001, 220441100093, 'Revalina Kawindra', 'Sistem Pendukung Keputusan Seleksi Dosen UTM', 'Bapak Doni', 'Ibu Eza', 'SPK');

SELECT * FROM etalase_skripsi;

CREATE TABLE daftar_member(
id_member INT (3) NOT NULL PRIMARY KEY,
nama_member VARCHAR (100) NOT NULL,
email VARCHAR (100),
pass VARCHAR (100),
tipe_member VARCHAR (100)
);

ALTER TABLE daftar_member CHANGE email email_member VARCHAR (100);

