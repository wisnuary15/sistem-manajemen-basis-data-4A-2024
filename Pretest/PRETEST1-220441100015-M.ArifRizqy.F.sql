CREATE DATABASE ruang_baca;

USE ruang_baca;

CREATE TABLE etalase_skripsi (
   id_etalase INT NOT NULL,
   nim BIGINT NOT NULL,
   nama_mahasiswa VARCHAR(50) NOT NULL,
   judul_skripsi TEXT NOT NULL,
   dosen_pembimbing VARCHAR(50) NOT NULL,
   dosen_penguji VARCHAR(50) NOT NULL,
   topik VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_etalase, nim)
) ENGINE = InnoDB;

DESC etalase_skripsi;

INSERT INTO etalase_skripsi VALUES
(1, 220441100015, 'rizqy', 'tutorial belajar android dasar', 'firmansyah', 'syarief', 'tutorial'),
(2, 220441100016, 'arif', 'tutorial belajar php dasar', 'syarief', 'firmansyah', 'tutorial'),
(3, 220441100017, 'avrizal', 'riset kegunaan spk dalam dunia bisnis', 'syarief', 'firmansyah', 'riset');

SELECT * FROM etalase_skripsi;

CREATE TABLE daftar_member (
   id_member INT NOT NULL,
   nama_member VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   password VARCHAR(255) NOT NULL,
   tipe_member VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_member)
) ENGINE = InnoDB;

DESC daftar_member;

INSERT INTO daftar_member VALUES
(1, 'arriz', 'arriz@mail.com', 'pw3', 'bronze'),
(2, 'arif', 'arif@mail.com', 'pw2', 'silver'),
(3, 'rizqy', 'rizqy@mail.com', 'pw1', 'platinum');

SELECT * FROM daftar_member;

ALTER TABLE etalase_skripsi
   RENAME skripsi_etalase;

DESC skripsi_etalase;

ALTER TABLE daftar_member
   CHANGE email email_member VARCHAR(50) NOT NULL;

DESC daftar_member;

UPDATE skripsi_etalase SET nama_mahasiswa='fachrudin' WHERE nim=220441100015;

SELECT * FROM skripsi_etalase;



DROP DATABASE ruang_baca;