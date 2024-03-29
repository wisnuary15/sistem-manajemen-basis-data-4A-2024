CREATE DATABASE ruang_baca;
USE ruang_baca;
CREATE TABLE etalase_skripsi (
id_etalase INT(15) NOT NULL,
nim INT (15) NOT NULL,
nama_mahasiswa VARCHAR (255) NOT NULL,
judul_skripsi VARCHAR (255) NOT NULL,
dosen_pembimbing VARCHAR (255) NOT NULL,
dosen_penguji VARCHAR (255) NOT NULL,
topik VARCHAR (255) NOT NULL,
PRIMARY KEY (id_etalase)
);

INSERT INTO etalase_skripsi VALUES
(1, 220441100, "Budi Sudarsono", "Penelitian Tumbuhan", "Dr. Heri", "Dr. Budi", "tumbuhan"),
(2, 220441101, "Rendi Setiawan", "Penelitian Hewan", "Dr. Roni", "Dr. Syarif", "Hewan"),
(3, 220441102, "Panji Bagus", "Penelitian Nuklir", "Dr. Doni", "Dr. Eka", "Nuklir");

DESC skripsi_etalase;

CREATE TABLE data_member (
id_member INT (15) NOT NULL,
nama_member VARCHAR (255) NOT NULL,
email VARCHAR (255) NOT NULL,
PASSWORD VARCHAR (255) NOT NULL,
tipe_member VARCHAR (255) NOT NULL,
PRIMARY KEY (id_member)
);

INSERT INTO data_member VALUES
(101, "Roni", "roni@gmail.com", "R123", "Senior"),
(102, "Budi", "roni@gmail.com", "R124", "Senior"),
(103, "Doni", "doni@gmail.com", "D123", "Senior");

ALTER TABLE etalase_skripsi RENAME TO skripsi_etalase;
ALTER TABLE data_member CHANGE COLUMN email email_member VARCHAR(255);
UPDATE skripsi_etalase SET nama_mahasiswa = "Rizky Kurniawan" WHERE id_etalase = 1;
DROP TABLE skripsi_etalase;
DROP DATABASE ruang_baca;
