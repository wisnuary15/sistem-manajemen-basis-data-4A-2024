CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi (
id_etalase INT NOT NULL PRIMARY KEY ,
nim INT NOT NULL,
nama_mahasiswa VARCHAR(80) NOT NULL,
judul_skripsi VARCHAR(80) NOT NULL,
dosen_pembimbing VARCHAR(80) NOT NULL,
dosen_penguji VARCHAR(80) NOT NULL,
topik VARCHAR(100) NOT NULL
);

DESC etalase_skripsi;

INSERT INTO etalase_skripsi VALUES 
(1,801,'joko','Judul A','Budi','Anto','Teknologi'),
(2,802,'Andi','Judul B','Herman','Siti','Pertanian'),
(3,803,'Arif','Judul C','Ahmad','Abdul','Teknologi')

SELECT * FROM etalase_skripsi;


CREATE TABLE daftar_member (
id_member INT NOT NULL PRIMARY KEY,
nama_member VARCHAR (80) NOT NULL,
email VARCHAR (80) NOT NULL,
kata_sandi VARCHAR(40) NOT NULL,
tipe_member VARCHAR (80) NOT NULL
);

DESC daftar_member;

INSERT INTO daftar_member VALUES 
(11,'Budi','budi@gmail.com','AkuGanteng','Silver'),
(112,'Vrestappen','vrestappen@gmail.com','345838','Bronze'),
(14,'Khairul','khairul@gmail.com','8495','Platinum')

SELECT * FROM daftar_member;

ALTER TABLE etalase_skripsi RENAME TO skripsi_etalase;

SELECT * FROM skripsi_etalase;

ALTER TABLE daftar_member CHANGE COLUMN email (email_member);

DROP TABLE skripsi_etalase

