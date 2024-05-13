CREATE DATABASE ruang_baca;

use ruang_baca;

CREATE TABLE etalase_skripsi(
Id_etalase INT NOT NULL, 
nim INT NOT NULL,
nama_mahasiswa VARCHAR (30) NOT NULL, 
judul_skripsi VARCHAR (50), 
dosen_pembimbing VARCHAR (30),
dosen_penguji  VARCHAR (30),
topik VARCHAR (30),
Primary key(Id_etalase));

INSERT INTO etalase_skripsi VALUES 
(101, 20101, "Ahmad",   "JudUl Abc", 'Pak Rizki',   "Pak Zain", "a"),
(102, 20102, "Ilham",   "JudUl Def", 'Pak Syarif',  "Bu eza", "b"),
(103, 20103, "Syahrul", "JudUl Ghi", 'Pak Zain',    "Pak Rizki", "c"),
(104, 20104, "Mamet",   "JudUl Jkl", 'Bu eza',      "Bu Rosida", "d"),
(105, 20105, "Mina",    "JudUl Mno", 'Bu Rosida',   "Pak Syarif", "e");

SELECT * FROM etalase_skripsi;

CREATE TABLE daftar_member(
Id_member INT NOT NULL, 
nama_member VARCHAR (30) NOT NULL, 
email VARCHAR (30), 
password_member VARCHAR (30),
tipe_member  VARCHAR (30),
Primary key(Id_member));

INSERT INTO daftar_member VALUES 
(201, "Ahmad",   "Ahmad@hmail.com", 'qwerty', "Standard"),
(202, "Ilham",   "Ilham@hmail.com", '1209876',"Premium"),
(205, "Mina",    "Mina@hmail.com", '4Bc0Pq',  "VIP");

SELECT * FROM daftar_member;

ALTER TABLE etalase_skripsi RENAME skripsi_etalase;