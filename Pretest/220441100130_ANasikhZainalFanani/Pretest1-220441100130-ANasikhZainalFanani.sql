CREATE DATABASE ruangbaca;
USE ruangbaca;

CREATE TABLE etalase_skripsi (
	id_etalase INT (10) PRIMARY KEY,
	nim INT (15),
	nama_mahasiswa VARCHAR (50),
	judul_skripsi VARCHAR (100),
	dosen_pembimbing VARCHAR (50),
	dosen_penguji VARCHAR (50),
	topik VARCHAR (100)
);

INSERT INTO etalase_skripsi(id_etalase, nim, nama_mahasiswa, judul_skripsi, dosen_pembimbing, dosen_penguji, topik) VALUES
	(1, 1, 'agung', 'pengembangan budidaya', 'pak budi', 'pak safi', 'pengembangan'),
	(2, 2, 'anis', 'pengetahuan masyarakat', 'pak budi', 'pak safi', 'pengetahuan'),
	(3, 3, 'matanjar', 'implementasi ', 'pak budi', 'pak safi', 'implementasi');
	
SELECT * etalase_skripsi;

CREATE TABLE daftar_member (
	id_member INT (10) PRIMARY KEY,
	nama_member VARCHAR (50),
	email VARCHAR (100),
	pasword VARCHAR (50),
	tipe_member VARCHAR (50)
);

INSERT INTO daftar_member(id_member, nama_memeber, email, pasword, tipe_member) VALUES
	(1,  'agung', 'abc@gmail.com', 'pak budi',  'pengembangan'),
	(2, 'anis', 'abc@gmail.com', 'pak budi',  'pengetahuan'),
	(3,  'matanjar', 'abc@gmail.com', 'pak budi', 'implementasi');

ALTER TABLE etalase_skripsi RENAME TO skripsi_etalase;

ALTER TABLE daftar_member CHANGE COLUMN email email_member VARCHAR (100);

UPDATE skripsi_etalase SET nama_mahasiswa = 'jauhar' WHERE id_etalase = 3;

DROP TABLE skripsi_etalase;

DROP DATABASE ruangbaca;



