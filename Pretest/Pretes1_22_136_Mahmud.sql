CREATE DATABASE ruang_baca;
USE ruang_baca;

CREATE TABLE etalase_skripsi(
id_etalase INT (11) PRIMARY KEY NOT NULL,
nim INT (11) NOT NULL,
nama_mahasiswa VARCHAR (50) NOT NULL,
judul_skripsi VARCHAR (100) NOT NULL,
dosen_pembimbing VARCHAR (50) NOT NULL,
dosen_penguji VARCHAR (50) NOT NULL,
topi VARCHAR (100) NOT NULL
);

INSERT INTO etalase_skripsi VALUES
(01, 12345, 'Mahmud', 'Jam digital', 'Pak syarif', 'pak firman', 'Digital'),
(02, 12346, 'Hery', 'penggunaan hp', 'bu yeni', 'pak aeri', 'Digital'),
(03, 12347, 'Agus Lukman', 'Penggunaan Iot', 'Pak firman', 'pak syarif', 'Digital'),
(04, 12348, 'Komaruddin', 'evaluasi pekerja', 'bu yeni', 'pak firman', 'Digital'),
(05, 12349, 'M yusuf', 'Pengolahan data restoran', 'Pak syarif', 'pak aeri', 'Digital');

SELECT * FROM etalase_skripsi;

CREATE TABLE daftar_member(
id_member INT (11) PRIMARY KEY NOT NULL,
nama_member VARCHAR (50) NOT NULL,
email VARCHAR (100) NOT NULL,
password_member VARCHAR (50) NOT NULL,
tipe_member VARCHAR (50) NOT NULL
);

INSERT INTO daftar_member VALUES
(01, 'Mahmud', 'mahmud@gmail.com', 'mahmud', 'vip'),
(02, 'Hery', 'hery@gmail.com', 'hery', 'vip'),
(03, 'Agus Lukman', 'agus@gmail.com', 'agus', 'vip'),
(04, 'Komaruddin', 'komar@gmail.com', 'komar', 'vip'),
(05, 'M yusuf', 'yusuf@gmail.com', 'yusuf', 'vip');

