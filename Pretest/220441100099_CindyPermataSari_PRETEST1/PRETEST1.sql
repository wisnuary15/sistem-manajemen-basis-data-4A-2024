create database ruang_baca;
use ruang_baca;
create table etalase_skripsi(
id_etalase int(3) not null,
nim int(10) not null,
nama_mahasiswa varchar(20) not null,
judul_skripsi varchar(20) not null,
dose_pembimbing varchar(20) not null,
dosen_penguji varchar(20) not null,
topik varchar(20) not null
);
insert into etalase_skripsi values 
(001,22044,'cindy','pendukung keputusan',' wahyudi', 'syarif', 'teknologi'),
(002,22045,'dhea','manajemen proyek', 'wahyudi', 'syarif', 'teknologi'),
(003,22046,'eka','pendukung keputusan',' syarif', 'wahyudi', 'teknologi');
select * from etalase_skripsi;

create table daftar_member(
id_member int(3) not null,
nama_member varchar(20) not null,
email varchar(20) not null,
password_member varchar(6) not null,
tipe_member varchar(20) not null
);
alter table daftar_member drop column nim;

insert into daftar_member values 
(101,'cindy', 'cindy@gmail.com','123456', 'member'),
(102,'eka', 'eka@gmail.com','123457', 'member'),
(103,'dhea', 'dhea@gmail.com','123458', 'bukan member');

select * from daftar_member;

rename table etalase_skripsi to skripsi_etalase;
select * from skripsi_etalase;

alter table daftar_member 