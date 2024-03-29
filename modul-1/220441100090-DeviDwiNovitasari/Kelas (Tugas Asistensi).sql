-- TUGAS ASISTENSI--
CREATE DATABASE Kelas;
USE Kelas;
CREATE TABLE matkul(
id_matkul INT(20) AUTO_INCREMENT PRIMARY KEY,
nama_matkul VARCHAR(40) NOT NULL
);
CREATE TABLE mhs(
id_nama INT(20) AUTO_INCREMENT PRIMARY KEY,
nama_mhs VARCHAR(40) NOT NULL,
alamat_mhs VARCHAR(40) NOT NULL,
id_matkul INT(20) NOT NULL,
FOREIGN KEY (id_matkul) REFERENCES matkul(id_matkul)
);
CREATE TABLE dosen(
id_dosen INT(20) AUTO_INCREMENT PRIMARY KEY,
nama_dosen VARCHAR(40) NOT NULL,
id_matkul INT(20) NOT NULL,
FOREIGN KEY (id_matkul) REFERENCES matkul(id_matkul)
);
INSERT INTO matkul (nama_matkul) VALUES
('SPK'),
('PEMBER'),
('SMBD'),
('IPPL'),
('RPL');
SELECT * FROM matkul;
INSERT INTO mhs (nama_mhs, alamat_mhs, id_matkul) VALUES
('Devi', 'Lamongan', 2),
('Adel', 'Sidoarjo', 3),
('Arum', 'Pasuruan', 1),
('Fira', 'Bojonegoro', 5),
('Tyas', 'Mojokerto', 4);
SELECT * FROM mhs;
INSERT INTO dosen (nama_dosen, id_matkul) VALUES
('Bu Hera', 3),
('Bu Novi', 1),
('Pak Wahyudi', 5),
('Pak Syarif', 2),
('Pak Zain', 4);
SELECT * FROM dosen;
UPDATE matkul SET nama_matkul = 'MPIT' WHERE id_matkul = 3;
RENAME TABLE mhs TO mahasiswa;
SELECT * FROM mahasiswa;
ALTER TABLE mahasiswa CHANGE COLUMN  nama_mhs Nama_Mahasiswa VARCHAR(40);
