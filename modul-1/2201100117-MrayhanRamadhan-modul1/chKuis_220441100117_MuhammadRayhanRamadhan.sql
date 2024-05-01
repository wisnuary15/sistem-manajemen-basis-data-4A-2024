CREATE DATABASE db_perkuliahan;
USE db_perkuliahan;

CREATE TABLE kelas(
id_kelas INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_kls VARCHAR (15) NOT NULL,
jml_perkuliahan INT (3) NOT NULL
);

CREATE TABLE mhs(
id_mhs INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_kelas INT(3) NOT NULL,
FOREIGN KEY (id_kelas) REFERENCES kelas(id_kelas),
nama_mhs VARCHAR (15) NOT NULL
);

DROP TABLE kelas;

ALTER TABLE mhs ADD CONSTRAINT idmhs FOREIGN KEY (id_kelas) REFERENCES kelas(id_kelas);


CREATE TABLE dosen(
id INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_mhs INT (3) NOT NULL,
id_matkul INT (3) NOT NULL,
FOREIGN KEY (id_mhs) REFERENCES mhs(id_mhs),
FOREIGN KEY (id_matkul) REFERENCES matkul(id_matkul),
nama_dosen VARCHAR (15) NOT NULL
);


CREATE TABLE matkul(
id_matkul INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_matkul VARCHAR (15) NOT NULL
);

INSERT INTO dosen  VALUES 
(NULL,'jojon'),
(NULL,'dadang'),
(NULL,'dono');

INSERT INTO kelas (nama_kls, jml_perkuliahan) VALUES
('PBW',2),
('PEMBER',3),
('PBD',3);

INSERT INTO matkul (nama_matkul) VALUES
('PBW'),
('PEMBER'),
('PBD');

INSERT INTO mhs (id_kelas, nama_mhs) VALUES
(1,'arta'),
(2, 'sigma'),
(3, 'rafly');

SELECT * FROM dosen;
SELECT * FROM kelas;
SELECT * FROM matkul;
SELECT * FROM mhs;

ALTER TABLE mhs
RENAME TO mahasiswa;

UPDATE mhs 
SET nama_mhs ='rayhan'
WHERE id_mhs = '1' ;

DROP TABLE kelas;
DROP DATABASE db_perkuliahan;
