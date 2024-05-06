CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalse_skripsi (
id_etalase INT PRIMARY KEY,
nama_mahasiswa VARCHAR(100),
judul_skripsi VARCHAR(100),
dosen_pembimbing VARCHAR(100),
dosen_penguji VARCHAR(100),
topik VARCHAR(100)
);

INSERT INTO etalse_skripsi VALUES 
(1,'Alim','Aku dan Kamu','Sisfor','Udin','Herbivora');

DESC etalse_skripsi ;

SELECT * FROM etalse_skripsi;

CREATE TABLE daftar_member (
id_member INT PRIMARY KEY,
nama_member VARCHAR(100),
email VARCHAR(100),
password_ INT(100),
tipe_member VARCHAR(100)
);

INSERT INTO daftar_member VALUES
(10,'diah','diahex.co.id',123,'Tahu'),
(20,'akuh','akuhex.co.id',234,'tempe');

SELECT * FROM daftar_member;

ALTER TABLE etalse_skripsi RENAME TO 'skripsi_etalase';

ALTER TABLE daftar_member CHANGE COLUMN email email_member VARCHAR(100);

UPDATE 

DROP TABLE etalse_skripsi;

DELETE DATABASE ruang baca;
