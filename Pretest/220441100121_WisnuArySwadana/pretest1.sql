CREATE DATABASE Ruang_Baca;
USE Ruang_Baca;

CREATE TABLE Etalase_Skirpsi (
ID_Etalase INT (20) NOT NULL,
Nim INT (20),
Nama_mHs VARCHAR (100),
judul_skripsi VARCHAR (100),
dosen_pembimbing VARCHAR (100),
dosen_penguji VARCHAR (100),
topik VARCHAR (100)
);

CREATE TABLE daftar_member(
ID_member INT (20) NOT NULL,
nama_member VARCHAR (20),
email VARCHAR (20),
pasword VARCHAR  (20),
tipe_member VARCHAR (20)
);

INSERT INTO daftar_member (
    ID_member, nama_member, email, pasword, tipe_member
) VALUES (
    1, 'John china', 'johndoe@email.com', 'password123', 'regular'
);

DROP TABLE Etalase_Skirpsi;

INSERT INTO Etalase_Skirpsi (
    ID_Etalase, Nim, Nama_mhs, judul_skripsi, dosen_pembimbing, dosen_penguji, topik
) VALUES (
    '1', '22-121', 'madara', 'MAKALAH ILMIAH', 'bayu', 'yanto', 'mabarff'
);

ALTER TABLE daftar_member
ADD alamat VARCHAR(50);
