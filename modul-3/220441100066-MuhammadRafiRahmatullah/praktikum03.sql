-- Active: 1711585917897@@127.0.0.1@3306@Modul3_praktikum
use Modul3_praktikum;
-- Buat tabel untuk data mahasiswa
CREATE TABLE IF NOT EXISTS mahasiswa (
    nama VARCHAR(100),
    nim VARCHAR(20) PRIMARY KEY,
    jenis_kelamin ENUM('L', 'P'),
    tanggal_lahir DATE,
    alamat VARCHAR(255)
);

-- Buat tabel untuk data mata kuliah
CREATE TABLE IF NOT EXISTS mata_kuliah (
    kode_mk VARCHAR(20) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT
);

-- Buat tabel untuk data dosen
CREATE TABLE IF NOT EXISTS dosen (
    nama VARCHAR(100),
    nidn VARCHAR(20) PRIMARY KEY,
    jenis_kelamin ENUM('L', 'P'),
    tanggal_lahir DATE,
    alamat VARCHAR(255)
);

-- Buat tabel untuk data praktikum
CREATE TABLE IF NOT EXISTS praktikum (
    kode_praktikum VARCHAR(20) PRIMARY KEY,
    nama_praktikum VARCHAR(100),
    nidn VARCHAR(20),
    FOREIGN KEY (nidn) REFERENCES dosen(nidn)
);

-- Buat tabel untuk data hasil praktikum mahasiswa
CREATE TABLE IF NOT EXISTS hasil_praktikum (
    nim VARCHAR(20),
    kode_praktikum VARCHAR(20),
    nilai DECIMAL(5,2),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    FOREIGN KEY (kode_praktikum) REFERENCES praktikum(kode_praktikum)
);

--INSERT DATA
-- Masukkan data mahasiswa
INSERT INTO mahasiswa (nama, nim, jenis_kelamin, tanggal_lahir, alamat) 
VALUES 
    ('Shin Tae Yong', '123456789', 'L', '1999-05-15', 'Korea'),
    ('Marselino Ferdinan', '987654321', 'L', '2000-08-20', 'Surabaya'),
    ('Ernando Ari', '135792468', 'L', '1998-12-10', 'Surabaya'),
    ('Rafael Struick', '246813579', 'L', '2001-02-28', 'Den Haag'),
    ('Pratama Arhan', '369258147', 'L', '1997-07-03', 'Lamongan');

-- Masukkan data mata kuliah
INSERT INTO mata_kuliah (kode_mk, nama_mk, sks) 
VALUES 
    ('MK101', 'Pember', 4),
    ('MK202', 'Alpro', 4),
    ('MK303', 'Basis Data', 3),
    ('MK404', 'Data Science', 3),
    ('MK505', 'Keterampilan Interpresonal', 2);

-- Masukkan data dosen
INSERT INTO dosen (nama, nidn, jenis_kelamin, tanggal_lahir, alamat) 
VALUES 
    ('Budi Satoto', '1234567890', 'L', '1975-03-20', 'Gresik'),
    ('Sri Herawati', '0987654321', 'P', '1980-06-15', 'Madura'),
    ('Firmansyah Adiputra', '1122334455', 'L', '1978-11-10', 'Madura'),
    ('Yudha Dwi Putra Negara', '5566778899', 'L', '1982-04-28', 'Madura'),
    ('Shofia Hardi', '9900112233', 'P', '1976-09-03', 'Surabaya');

-- Masukkan data praktikum
INSERT INTO praktikum (kode_praktikum, nama_praktikum, nidn) 
VALUES 
    ('PR101', 'Praktikum Pember', '1234567890'),
    ('PR202', 'Praktikum Alpro', '0987654321'),
    ('PR303', 'Praktikum Basis Data', '1122334455'),
    ('PR404', 'Praktikum Data Science', '5566778899'),
    ('PR505', 'Praktikum Keterampilan Interpersonal', '9900112233');

-- Masukkan data hasil praktikum mahasiswa
INSERT INTO hasil_praktikum (nim, kode_praktikum, nilai) 
VALUES 
    ('123456789', 'PR101', 85.5),
    ('987654321', 'PR202', 78.2),
    ('135792468', 'PR303', 90.0),
    ('246813579', 'PR404', 82.7),
    ('369258147', 'PR505', 88.9);


DELIMITER //
CREATE Procedure getPraktikum(in kode VARCHAR(100))
Begin
    SELECT * FROM praktikum WHERE kode_praktikum = kode;
end //
DELIMITER;

CALL getPraktikum('PR101')

DELIMITER//
CREATE Procedure getMhs(in jenkel VARCHAR(10)), in almt VARCHAR(100)
begin
    SELECT * FROM mahasiswa WHERE jenis_kelamin=jenkel AND alamat=almt;
end//

DELIMITER//
CREATE PROCEDURE nilaiTambah(
    INOUT nilaiTambah INT,
    IN nimMhs VARCHAR(100)
)
BEGIN
    SET nilaiTambah=nilaiTambah+5;
    UPDATE hasil_praktikum SET nilai=nilaiTambah;
END//
DELIMITER;
set @nilai_praktikum = 80;
CALL nilaiTambah(@nilai_praktikum, '123456789');