CREATE DATABASE ruang_baca;
USE ruang_baca;

CREATE TABLE etalase_skripsi (
 id_etalase INT(10) NOT NULL,
 nim INT(20) NOT NULL,
 nama_mahasiswa VARCHAR(50) NOT NULL,
 judul_skripsi VARCHAR(100) NOT NULL,
 dosen_pembimbing VARCHAR(50) NOT NULL,
 dosen_penguji VARCHAR(50) NOT NULL,
 topik VARCHAR(100) NOT NULL,
 PRIMARY KEY (id_etalase)
);

INSERT INTO etalase_skripsi  VALUES 
(1,220441152,'juan','pengembangan skil pemancing di smester akhir','ali','ahmad','skill'),
(2,2204411132,'samsul','perbaikan lahan pemancingan','ali','ahmad','skill');

CREATE TABLE daftar_member (
 id_member INT(10) NOT NULL,
 nama_member VARCHAR(50) NOT NULL,
 email VARCHAR(50) NOT NULL,
 pasword VARCHAR(50) NOT NULL,
 tipe_member VARCHAR(50),
 PRIMARY KEY(id_member)
);

INSERT INTO daftar_member VALUES
(1,'juan','juan123@gmail.com','juan123','premium'),
(2,'samsul','samsul123@gmail.com','samsul123','premium');

SELECT * FROM daftar_member;

RENAME TABLE etalase_skripsi TO skripsi_etalase;
ALTER TABLE daftar_member CHANGE COLUMN email email_member VARCHAR(50);
UPDATE skripsi_etalase SET nama_mahasiswa = 'pratama' WHERE id_etalase = 1;
DROP TABLE skripsi_etalase;