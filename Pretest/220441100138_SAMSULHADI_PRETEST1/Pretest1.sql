CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi(
    id_etalase INT PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR(20) NOT NULL,
    nama_mahasiswa VARCHAR(50) NOT NULL,
    judul_skripsi VARCHAR(50) NOT NULL,
    dosen_pembimbing VARCHAR(50) NOT NULL,
    dosen_penguji VARCHAR(50) NOT NULL,
    topik VARCHAR(50) NOT NULL
);

INSERT INTO etalase_skripsi VALUES
    (1, '220441100138', 'Samsul Hadi', 'Analisis Algoritma', 'Dr. H. Nurdin', 'Dr. H. Hasim', 'Algoritma'),
    (2, '220441100139', 'Otong Surotong', 'Analisis Artificial Intelegent', 'Dr. H. Syarief', 'Dr. H. Nurdin', 'AI'),
    (3, '220441100140', 'Jono Sucipto', 'SPK Pengadaan Barang', 'Dr. H. Asep', 'Dr. H. Nurdin', 'SPK'),
    (4, '220441100141', 'Handoko Sudoyono', 'Deep Learning', 'Dr. H. Dono', 'Dr. H. Joko', 'Deep Learning'),
    (5, '220441100142', 'Asep Kurniawan', 'Machine Learning', 'Dr. H. Ucup', 'Dr. H. Kurniawan', 'Machine Learning');

SELECT * FROM etalase_skripsi;

CREATE TABLE daftar_member(
    id_member INT PRIMARY KEY AUTO_INCREMENT,
    nama_member VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    tipe_member ENUM('basic', 'standart', 'premium')
);


INSERT INTO daftar_member VALUES
    (1, 'Samsul Hadi', 'samsulhadi123@gmail.com', 'samsulhadi', 'basic'),
    (2, 'Otong Surotong', 'otong123@gmail.com', 'otong', 'basic'),
    (3, 'Jono Sucipto', 'jono123@gmail.com', 'jono', 'standart'),
    (4, 'Handoko Sudoyono', 'handoko123@gmail.com', 'handoko', 'premium'),
    (5, 'Asep Kurniawan', 'asepkurniawan123@gmail.com', 'asepkurniawan', 'standart');

SELECT * FROM daftar_member;

RENAME TABLE etalase_skripsi TO skripsi_etalase;
SELECT * FROM skripsi_etalase

ALTER TABLE daftar_member CHANGE COLUMN email email_member VARCHAR(50);

UPDATE skripsi_etalase SET nim = '220441100199' WHERE id_etalase = 1;

DROP TABLE skripsi_etalase;
/--pull request