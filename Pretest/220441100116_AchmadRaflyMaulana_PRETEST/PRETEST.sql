CREATE DATABASE ruang_kaca

USE ruang_kaca;

CREATE TABLE etalase_skripsi (
id_etalase INT(10) NOT NULL,
nama_mahasiswa VARCHAR(30) NOT NULL,
judul_skripsi VARCHAR(50) NOT NULL,
dosen_pembimbing VARCHAR(30) NOT NULL,
dosen_penguji VARCHAR(30) NOT NULL,
topik VARCHAR(50) NOT NULL,
PRIMARY KEY (id_etalase)
)

DROP TABLE etalase_skripsi;

SELECT * FROM etalase_skripsi;

INSERT INTO etalase_skripsi (id_etalase, nama_mahasiswa, judul_skripsi, dosen_pembimbing, dosen_penguji, topik) VALUES
(1, Rafly, sistem berbasis skripsi, pak syarief, pak doni, skripsi),
(2, Rozikin, sistem berbasis skripsi, pak doni, pak syarief, skripsi);

CREATE TABLE daftar_member (
id_member INT(10) NOT NULL,
nama_member VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
PASSWORD VARCHAR(20) NOT NULL,
tipe_member VARCHAR(30) NOT NULL,
PRIMARY KEY (id_member)
)

SELECT * FROM daftar_member;

INSERT INTO daftar_member (id_member, nama_member, email, PASSWORD, tipe_member) VALUES
(1, rafly, raflygmailcom, rafly123, vip),
(2, rozikin, rozikingmailcom, rozikin123, vip);

