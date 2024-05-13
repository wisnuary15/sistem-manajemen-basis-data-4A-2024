CREATE DATABASE ruang_baca;

CREATE TABLE etalase_skripsi(
id_etalase INT(20) NOT NULL PRIMARY KEY,
nim INT(20) NOT NULL,
nama_mahasiswa VARCHAR(30) NOT NULL,
judul_skripsi VARCHAR(30) NOT NULL,
dosen_pembimbing VARCHAR(30) NOT NULL,
dosen_penguji VARCHAR(30) NOT NULL,
topik VARCHAR(30) NOT NULL);

INSERT INTO etalase_skripsi VALUES
(1, 220441100076, 'Dhea Rahma Dianti', 'Penerapan UI/UX pada aplikasi', 'Bapak Doni', 'Bapak Syarief', 'UI/UX'),
(2, 220441100099, 'Cindy Permata Sari', 'Penggunaan Metode SAW dalam SPK', 'Bu Eza', 'Bu Rosida', 'SPK'),
(3, 220441100123, 'Aditya Kusumaputri', 'Implementasi IOT pada aplikasi', 'Bapak Yasid', 'Bapak Zain', 'IOT');

DROP TABLE etalase_skripsi;

DESC etalase_skripsi;

CREATE TABLE daftar_member(
id_member INT(20) NOT NULL PRIMARY KEY,
nama_member VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
pasword VARCHAR(40) NOT NULL,
tipe_member INT(20) NOT NULL
);

INSERT INTO daftar_member VALUES
(91, 'Revalina', 'reva2@gmail.com', 'aku123', 227),
(92, 'Devi Dwi', 'devi3@gmail.com', 'hai124', 228),
(93, 'Edith Firja', 'Edith4@gmail.com', 'halo1', 229);

ALTER TABLE etalase_skripsi RENAME skripsi_etalase;

UPDATE TABLE 