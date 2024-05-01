CREATE DATABASE ruang_baca;

USE ruang_baca;

-- buat tabel
CREATE TABLE etalase_skripsi(
id_etalase INT(10) NOT NULL PRIMARY KEY,
nim INT(15) NOT NULL,
nama_mhs VARCHAR(50) NOT NULL,
judul_skripsi VARCHAR(50) NOT NULL,
dosen_pembimbing VARCHAR(50) NOT NULL,
dosen_penguji VARCHAR(50) NOT NULL,
topik VARCHAR(50) NOT NULL
);

-- masukkan data
insert into etalase_skripsi values
(001, 104, 'ADELIA', 'judul1', 'pembimbing1', 'penguji1', 'topik1'),
(002, 105, 'SHAFIRA', 'judul2', 'pembimbing2', 'penguji2', 'topik2'),
(003, 106, 'DEVI', 'judul3', 'pembimbing3', 'penguji3', 'topik3'),
(004, 107, 'ARUM', 'judul4', 'pembimbing4', 'penguji4', 'topik4');

-- tampilkan data
select * FROM etalase_skripsi;

-- buat tabel daftar member
create table daftar_member(
id_member int(10) not null primary key,
nama_memb varchar(50) not null,
email varchar(20) not null,
pass int(8) not null,
tipe_memb varchar(20) not null
);

-- masukkan data member
insert into daftar_member values
(101, 'lia', 'lia@gmail.com', 12345678, 'eksklusif'),
(102, 'fita', 'fta@gmail.com', 09845678, 'eksklusif'),
(103, 'ali', 'aala@gmail.com', 12345013, 'biasa'),
(104, 'alaia', 'alia@gmail.com', 12345753, 'biasa'),
(105, 'lim', 'lim@gmail.com', 19765678, 'eksklusif');

-- rename etalase skripsi
alter table etalase_skripsi rename skripsi_etalase;

-- rename email member
alter table daftar_member modify table email email_member; (eror)

-- ubah record pada tabel etalase skripsi


-- hapus tabel skripsi
DROP table skripsi_etalase;

-- hapus database ruang baca
drop database ruang_baca;
