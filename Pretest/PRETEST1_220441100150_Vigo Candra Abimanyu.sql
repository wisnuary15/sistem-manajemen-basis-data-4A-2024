CREATE DATABASE ruang_baca;
USE ruang_baca;

CREATE TABLE etalse_skripsi(
id_etalase INT (20) NOT NULL,
nim INT (20),
nama_mahasiswa VARCHAR(20),
judul_skripsi VARCHAR (20),
dosen_penguji VARCHAR (20),
topik VARCHAR (20)
);

INSERT INTO etalse_skripsi VALUE
(001,220150,'Vigo Candra Abimanyu','Pengelolaan Database itu ','Muhammad Syarif Mkom','Pemograman'),
(002,220155,'Dghea','Pengelolaan Database ini','Muhammad Syarif Mkom','Pemograman');

SELECT*FROM etalse_skripsi;

CREATE TABLE daftar_member(
recor_id INT (20),
id_member INT (20),
nama VARCHAR(20),
email VARCHAR (20),
passwor VARCHAR (20),
tipe_member VARCHAR (20)
);

INSERT INTO daftar_member VALUE
(002,22014,'Vigo Candra Abimanyu','abiamnyu.com','vigo77','new');

ALTER TABLE etalse_skripsi CHANGE TABLE skripsi_etalase;

