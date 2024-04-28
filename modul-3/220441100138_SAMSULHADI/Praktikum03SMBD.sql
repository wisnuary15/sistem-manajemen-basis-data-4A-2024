
USE db_perpustakaan;

SHOW PROCEDURE STATUS;


-- Tugas 1
DELIMITER //
CREATE PROCEDURE GetAnggotaByStatus(IN statusPinjam VARCHAR(15))
BEGIN
    IF statusPinjam = '' THEN SET statusPinjam = 'Aktif'; END IF;
    SELECT * FROM anggota WHERE Status_Pinjam = statusPinjam;
END;
DELIMITER;
CALL GetAnggotaByStatus('');
SELECT * FROM anggota;
DROP PROCEDURE IF EXISTS GetAnggotaByStatus;


-- Tugas 2
DELIMITER //
CREATE PROCEDURE GetBukuByJudul(IN judul VARCHAR(25))
BEGIN
    SELECT * FROM buku WHERE Judul_Buku = judul;
END;
DELIMITER;
CALL GetBukuByJudul('To Kill a Mockingbird');
SELECT * FROM buku;
DROP PROCEDURE IF EXISTS GetBukuByJudul;

-- Tugas 3
DELIMITER //
CREATE PROCEDURE GetPeminjamanByAnggotaBuku(IN idAnggota VARCHAR(10), IN kodeBuku VARCHAR(10))
BEGIN
    SELECT * FROM peminjaman WHERE IdAnggota = idAnggota AND Kode_Buku = kodeBuku;
END;
DELIMITER;
CALL GetPeminjamanByAnggotaBuku('A01', 'B001');
SELECT * FROM peminjaman;
DROP PROCEDURE IF EXISTS GetPeminjamanByAnggotaBuku;


-- Tugas 4
DELIMITER //
CREATE PROCEDURE GetPengembalianByTanggal(IN tglPinjam DATE, IN tglKembali DATE, IN denda VARCHAR(15))
BEGIN
    SELECT * FROM pengembalian WHERE Tgl_Pinjam = tglPinjam AND Tgl_Kembali = tglKembali AND Denda = denda;
END;
DELIMITER;
CALL GetPengembalianByTanggal('2024-03-01', '2024-03-10', 0);
SELECT * FROM pengembalian;
DROP PROCEDURE IF EXISTS GetPengembalianByTanggal;

-- Tugas 5
DELIMITER //
CREATE PROCEDURE InsertPeminjaman(IN kodePeminjaman VARCHAR(10), IN idAnggota VARCHAR(10), IN idPetugas VARCHAR(10), IN tglPinjam DATE, IN tglKembali DATE, IN kodeBuku VARCHAR(10))
BEGIN
    INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
    VALUES (kodePeminjaman, idAnggota, idPetugas, tglPinjam, tglKembali, kodeBuku);
END;
DELIMITER;
CALL InsertPeminjaman('PJ012', 'A001', 'P001', '2024-04-10', '2024-04-20', 'B001');
SELECT * FROM peminjaman;
DROP PROCEDURE IF EXISTS InsertPeminjaman;


-- Tugas 6
DELIMITER //
CREATE PROCEDURE CountAnggota(OUT totalAnggota INT)
BEGIN
    SELECT COUNT(*) INTO totalAnggota FROM anggota;
END;
DELIMITER;
CALL CountAnggota(@totalAnggota);
SELECT @totalAnggota;
DROP PROCEDURE IF EXISTS CountAnggota;


-- Tugas 7
DELIMITER //
CREATE PROCEDURE HitungBanyakGender(
    IN jenkel VARCHAR(10),
    OUT hasil INT
)
BEGIN
   SELECT COUNT(IdAnggota) INTO hasil FROM anggota WHERE Jenis_Kelamin = jenkel;
END;
DELIMITER ;

CALL HitungBanyakGender('Perempuan',@hasil);
SELECT @hasil;
DROP PROCEDURE IF EXISTS UpdateStatusAnggota

SELECT * FROM anggota