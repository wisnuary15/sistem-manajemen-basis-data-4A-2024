CREATE DATABASE Akademik;

CREATE TABLE tbl_dosen(
id_dosen INT(20) AUTO_INCREMENT PRIMARY KEY,
nama_dosen VARCHAR(30) NOT NULL);

INSERT INTO tbl_dosen (nama_dosen) VALUES
('Bapak Mohammad Syarief'),
('Bapak Yasid'),
('Ibu Rosida');

SELECT * FROM tbl_dosen;


CREATE TABLE tbl_kelas(
id_kelas INT(20) AUTO_INCREMENT PRIMARY KEY,
nama_kelas VARCHAR(30) NOT NULL,
id_dosen INT(20) NOT NULL,
FOREIGN KEY (id_dosen) REFERENCES tbl_dosen(id_dosen));

INSERT INTO tbl_kelas (nama_kelas, id_dosen) VALUES
('SMBD', 1),
('PBW', 2),
('PEMBER', 3);

SELECT * FROM tbl_kelas;

CREATE TABLE tbl_mhs(
id_mhs INT(20) AUTO_INCREMENT PRIMARY KEY,
nama_mhs VARCHAR(30) NOT NULL,
id_kelas INT(20) NOT NULL,
id_dosen INT(20) NOT NULL,
FOREIGN KEY (id_kelas) REFERENCES tbl_kelas(id_kelas),
FOREIGN KEY (id_dosen) REFERENCES tbl_dosen(id_dosen));

INSERT INTO tbl_mhs (nama_mhs, id_kelas, id_dosen) VALUES
('Dhea Rahma', 1, 1),
('Devi Dwi', 2, 2),
('Cindy', 3, 3);

SELECT * FROM tbl_mhs;

DROP TABLE tbl_mhs;

UPDATE tbl_mhs SET id_kelas = 1 WHERE nama_mhs = 'Devi Dwi';

-- mengubah tbl_mhs ke tbl_mahasiswa
ALTER TABLE tbl_mhs RENAME tbl_mahasiswa;

-- mengubah salah satu data tabel
UPDATE tbl_mahasiswa SET nama_mhs = 'Cindy Permata Sari' WHERE id_mhs = 3;

-- menghapus salah satu data tabel
DELETE FROM tbl_mahasiswa WHERE nama_mhs = 'Devi Dwi';

-- menghapus tabel
DROP TABLE tbl_mahasiswa;

-- menghapus databse
DROP DATABASE Akademik;