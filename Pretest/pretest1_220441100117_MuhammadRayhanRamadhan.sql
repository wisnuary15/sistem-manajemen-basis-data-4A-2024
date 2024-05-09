CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi(
id_etalase INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nim INT (15) NOT NULL,
nama_mahasiswa VARCHAR (15) NOT NULL,
judul_skripsi VARCHAR (20) NOT NULL,
dosen_pembimbing VARCHAR (15),
dosen_penguji VARCHAR (15),
topik VARCHAR (15)
);

INSERT INTO etalase_skripsi (nim,nama_mahasiswa,judul_skripsi,dosen_pembimbing,dosen_penguji,topik)VALUES
(220118,'joko','pemanfaatan limbah', 'naryo', 'dono','lingkungan'),
(220119,'roro','pemanfaatan plastik', 'doyok', 'dono','pengolahan plastik'),
(220120,'kasino','pemanfaatan kain cacah', 'handoko', 'dono','kreativitas');

SELECT * FROM etalase_skripsi;

CREATE TABLE daftar_member(
id_member INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_member VARCHAR (15) NOT NULL,
email VARCHAR (15) NOT NULL,
passwod INT (15),
tipe_member VARCHAR (15)
);

INSERT INTO daftar_member (nama_member,email,passwod,tipe_member)VALUES
(),
(),
();

SELECT * FROM daftar_member;