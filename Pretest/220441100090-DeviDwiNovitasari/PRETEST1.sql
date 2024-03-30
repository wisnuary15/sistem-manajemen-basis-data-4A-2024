CREATE DATABASE ruanggg_baca;
USE ruanggg_baca;
CREATE TABLE etalase_skripsi (
id_etalase INT(20) AUTO_INCREMENT PRIMARY KEY,
nim INT(20) NOT NULL,
nama_mhs VARCHAR(40) NOT NULL,
judul_skripsi VARCHAR(40) NOT NULL,
dosen_pembimbing VARCHAR(40) NOT NULL,
dosen_penguji VARCHAR(40) NOT NULL,
topik VARCHAR(40) NOT NULL
);
CREATE TABLE daftar_member (
id_member INT(20) AUTO_INCREMENT PRIMARY KEY,
nama_member VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL,
passwordd VARCHAR(40) NOT NULL,
tipe_member VARCHAR(40) NOT NULL
);
INSERT INTO etalase_skripsi (nim,nama_mhs,judul_skripsi,dosen_pembimbing,dosen_penguji,topik) VALUES
(22090,'Devi','metode saw','pak firman','pak syarif','spk'),
(22080,'Fira','metode wp','pak firli','bu hera','pemrograman'),
(22040,'Adel','metode kuantitatif','pak yasid','pak yudha','ui/ux');
SELECT * FROM etalase_skripsi;
INSERT INTO daftar_member (nama_member,email,passwordd,tipe_member) VALUES
('Adi','yyyy@gmail.com','kepo','aktif'),
('Firman','ghhhh@gmail.com','tidaktahu','non aktif'),
('Dela','opppp@gmail.com','hello','aktif');
SELECT * FROM daftar_member;
RENAME TABLE etalase_skripsi TO skripsi_etalase;
ALTER TABLE daftar_member CHANGE COLUMN email email_member VARCHAR(40);
UPDATE etalase_skripsi SET nama_mhs = 'nina' WHERE NIM = 1;
DELETE 
DROP DATABASE ruanggg_baca;

