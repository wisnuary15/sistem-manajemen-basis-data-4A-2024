CREATE DATABASE ruang_baca; 

USE ruang_baca; 

CREATE TABLE etalase_skripsi (
id_etalase INT PRIMARY KEY, 
nim INT, 
nama_mahasiswa VARCHAR (100), 
judul VARCHAR (100), 
dos_pembimbing VARCHAR (100), 
dosen_penguji VARCHAR (100), 
topik VARCHAR (100)
);

DESC etalase_skripsi;

CREATE TABLE daftar_member (
id_member INT PRIMARY KEY, 
nama_member VARCHAR (100), 
email VARCHAR (100), 
passwort VARCHAR (100), 
tipe_member VARCHAR (100)
);

INSERT INTO etalase_skripsi (id_Etalase, nim, nama_mahasiswa, judul, dos_pembimbing, dosen_penguji, topik)
VALUE
(22, 2321, "rozikhin", "ini judul", "yudha", "ali", "ini topik");

INSERT INTO daftar_member (id_member, nama_member, email, passwort, tipe_member)
VALUE 
(12, "solihin", "awa@gmail.com", "ini pwnya", "premium");


ALTER TABLE etalase_skripsi RENAME = skripsi_etalase;


ALTER TABLE etalase_skripsi 

UPDATE nama_member FROM daftar_member WHERE nama_member = 

DELETE TABLE daftar_member;



