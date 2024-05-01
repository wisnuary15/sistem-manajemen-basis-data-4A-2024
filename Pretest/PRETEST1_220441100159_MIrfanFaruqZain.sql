CREATE SCHEMA ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi(
	id_etalase INT(20) NOT NULL PRIMARY KEY,
	nim INT(20) NOT NULL,
	nama_mahasiswa VARCHAR(50) NOT NULL,
	judul_skripsi VARCHAR(50) NOT NULL,
	dosen_pembimbing VARCHAR(50) NOT NULL,
	dosen_penguji VARCHAR(50) NOT NULL,
	topik VARCHAR(50) NOT NULL);
	
INSERT INTO etalase_skripsi VALUES
	(101,201,'M.Irfan Faruq','Sistem Pendukung Keputusan','Pak Syarif','Pak Budi','SPK');
	
CREATE TABLE daftar_member(
	id_member INT(20) NOT NULL PRIMARY KEY,
	nama_member VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	pasword VARCHAR(50) NOT NULL,
	tipe_member VARCHAR(50) NOT NULL);
	
SELECT * FROM daftar_member

INSERT INTO daftar_member VALUES
	(1,'Julian','julian122@gmail.com','qqww12','1111');
	
ALTER TABLE etalase_skripsi RENAME TO skripsi_etalase;

DROP TABLE skripsi_etalase;

DROP SCHEMA ruang_baca;