CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi (
nim INT (10) NOT NULL,
nama_mahasiswa VARCHAR(200) NOT NULL,
dosen_pembimbing VARCHAR(200) NOT NULL,
dosen_pengunji VARCHAR (200) NOT NULL,
PRIMARY KEY (nim)
);

CREATE TABLE daftar_member (
id_member INT (10) NOT NULL,
nama_member VARCHAR (200) NOT NULL,
email VARCHAR (200) NOT NULL,
PASSWORD VARCHAR (200) NOT NULL,
tipe_member VARCHAR (200) NOT NULL,
PRIMARY KEY (id_member)
);

INSERT INTO etalase_skripsi VALUES
(123,'Tymo','Pak Syarief','Pak Doni'),
(122,'Jono','Pak Syarief','Pak Doni'),
(121,'Joko','Pak Syarief','Pak Doni'),
(091,'Moko','Pak Syarief','Pak Doni'),
(078,'Loko','Pak Syarief','Pak Doni');

INSERT INTO daftar_member VALUES
(001,'Tanos','Tanos @gmail.com','Tanos123','Biasa'),
(002,'Joma','Joma @gmail.com','anos123','VIP'),
(003,'Jompi','Jompi @gmail.com','Lanos123','Biasa'),
(004,'Jaka','Jaka @gmail.com','Alanos123','Biasa'),
(005,'Tono','Tono @gmail.com','Tanosi123','VIP');

ALTER TABLE etalase_table CHANGE TABLE skripsi etalase;

ALTER TABLE skripsi_etalase CHANGE  etalase_skripsi;

ALTER TABLE daftar_member CHANGE COLUMN email email_member VARCHAR (200);

UPDATE daftar_member SET nama_member = 'Jokowi' WHERE id_member = 1;

DROP TABLE skripsi_etalase;

DROP DATABASE ruang_baca;
