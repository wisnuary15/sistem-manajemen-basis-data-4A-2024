-- Active: 1711585917897@@127.0.0.1@3306@ruang_baca
-- Active: 1711585917897@@127.0.0.1@3306@smbdmodul2
use ruang_baca;

create DATABASE ruang_baca;

CREATE TABLE etalase_skripsi (
    id_etalase INT,
    NIM INT,
    nama_mahasiswa VARCHAR(50),
    judul_skripsi VARCHAR(250),
    dosen_pembimbing VARCHAR(50),
    dosen_penguji VARCHAR(50),
    topik VARCHAR(50)
);

INSERT INTO etalase_skripsi (id_etalase, NIM, nama_mahasiswa, judul_skripsi, dosen_pembimbing, dosen_penguji, topik)
VALUES 
    (1, 123, 'rafi', 'coba', 'yadi', 'yanto', 'haha'),
    (2, 123, 'rafi', 'coba', 'yadi', 'yanto', 'haha'),
    (3, 123, 'yadi', 'coba', 'yadi', 'yanto', 'haha');

SELECT * from etalase_skripsi;

CREATE TABLE daftar_member (
    id_member INT,
    nama_member VARCHAR(50),
    email VARCHAR(250),
    sandi VARCHAR(250)
);

INSERT INTO daftar_member (id_member, nama_member, email, sandi)
VALUES 
    (3,  'rafi', 'test@sample.com', '123'),
    (4,  'rafi', 'test@sample.com', '123');


SELECT * from daftar_member;
