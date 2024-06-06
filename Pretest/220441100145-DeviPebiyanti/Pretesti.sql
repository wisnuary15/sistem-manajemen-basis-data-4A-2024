CREATE DATABASE ruang_baca;
USE ruang_baca;

CREATE TABLE etalase_skripsi(
	id_etalase INT(20) NOT NULL,
	nim INT(20) NOT NULL,
	nama_mahasiswa VARCHAR(50) NOT NULL,
	judul_skripsi VARCHAR(50) NOT NULL,
	dosen_pembimbing VARCHAR(50) NOT NULL, 
	dosen_penguji VARCHAR(50) NOT NULL,
	topik VARCHAR(50) NOT NULL
);

INSERT INTO etalase_skripsi VALUES 
	(01, 123, 'Devi Pebiyanti', 'Metode Pengembangan Perusahaan', 'Pak Syarief', 'Bu Yeni', 'Pengembangan'),
	(02, 124, 'Devi Dwi', 'Hasil Budidaya Rumput Laut', 'Bu Weni', 'Bu Eza', 'Budidaya'),
	(03, 125, 'Shafira', 'Pengaruh Pola Asuh', 'Bu Novi', 'Pak Wahyudi', 'Pengaruh');
	
CREATE TABLE daftar_member(
	id_member INT(20) NOT NULL,
	nama_member VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	pass INT(20) NOT NULL,
	tipe_member VARCHAR(20) NOT NULL
);

INSERT INTO daftar_member VALUES 
	(011, 'Devi Pebiyanti', 'devipebi@gmail.com', 12345 , 'aktif'),
	(022, 'Devi Dwi', 'devidwi@gmail.com', 67890 , 'aktif'),
	(033, 'Shafira', 'shafira@gmail.com', 27365, 'aktif');
	
	
ALTER TABLE etalase_skripsi CHANGE COLUMN skripsi_etalase;

ALTER TABLE daftar_member CHANGE COLUMN email email_member VARCHAR(20);


