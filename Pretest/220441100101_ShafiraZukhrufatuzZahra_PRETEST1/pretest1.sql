CREATE DATABASE ruang_baca;

--membuat tabel etalase--
CREATE TABLE etalase_skripsi(
id_etalase VARCHAR (10) PRIMARY KEY,
nim INT (20),
nama_mahasiswa VARCHAR (50),
judul_skripsi VARCHAR (50),
dosen_pembimbing VARCHAR (50),
dosen_penguji VARCHAR (50),
topik VARCHAR (50)
);

SELECT * FROM TABLE etalase_skripsi;
--insert etalase skripsi--
INSERT TABLE etalase_skripsi
('es001', 220441100101, 'shafira zukhrufatuz', 'kemajuan teknologi' , 'Novia nur', 'devi dwi novitasari', 'teknologi'),
('es002', 220441100102, 'adiba choiro zalwa', 'globalisasi', 'adelia shafira ardhani', 'devi pebiyanti', 'lingkungan');

--merubah nama tabel skripsi--
ALTER TABLE etalase_skripsi UPDATE skripsi_etalase;
 
--menghapus tabel skripsi_etalase--
DROP TABLE skripsi_etalase;

--membuat tabel daftarmember--
CREATE TABLE daftar_member(
id_member VARCHAR(10),
nama_member VARCHAR (50),
email VARCHAR (50),
pass VARCHAR (10),
tipe_member VARCHAR (20),
PRIMARY KEY (id_member)
);

--insert tabel daftar_member--
INSERT TABLE daftar_member
('dm001', 'shafira', 'shafirazhr118@gmail.com', 'SZ223344', 'gold');


--menghapus DATABASE--
DROP DATABASE ruang_baca;
