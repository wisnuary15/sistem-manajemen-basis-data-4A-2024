USE library;
-- soal 1
DELIMITER //
CREATE PROCEDURE nomor1(
    IN nim VARCHAR(20),
    IN nama VARCHAR(100),
    IN alamat VARCHAR(100),
    IN tlp VARCHAR(20),
    IN gender VARCHAR(20),
    IN hobi VARCHAR(100),
    IN umur INT(20)
)
BEGIN
    DECLARE vnim VARCHAR(20);
    DECLARE vnama VARCHAR(100);
    DECLARE valamat VARCHAR(100);
    DECLARE vtlp VARCHAR(20);
    DECLARE vgender VARCHAR(20);
    DECLARE vhobi VARCHAR(100);
    DECLARE vumur INT(20);

SET vnim = nim;
SET vnama = nama;
set valamat = alamat;
SET vtlp = tlp;
SET vgender = gender;
SET vhobi = hobi;
set vumur = umur;

SELECT vnim AS NIM, 
vnama AS Nama_Mahasiswa, 
valamat as Alamat,
vtlp as Nomor_Telepon,
vgender AS Jenis_Kelamin, 
vhobi AS Hobi, 
vumur AS Umur;

END//
DELIMITER;

CALL nomor1('220441100157', 'Rizky Dwi Kurniawan', 'Sidoarjo' , '089676244130' ,'L', 'Main',20);


-- soal 2
DELIMITER //
CREATE PROCEDURE nomor2 (
    IN kode int(10)
)
BEGIN
    DECLARE selisih INT;
    DECLARE pengingatan_pinjam VARCHAR(255);

    SELECT DATEDIFF(tgl_kembali, tgl_pinjam) INTO selisih FROM peminjaman WHERE kode_peminjaman = kode;

    IF (selisih <= 2) THEN
        SET pengingatan_pinjam = 'Silahkan Pergunakan Buku Dengan Baik';
    ELSEIF (selisih >= 3 AND selisih <= 5) THEN
        SET pengingatan_pinjam = 'Waktu Pinjam Segera Habis';
    ELSE
        SET pengingatan_pinjam = 'Warning!, Denda Menanti Anda';
    END IF;
    
    SELECT pengingatan_pinjam;

END//
DELIMITER ;

CALL nomor2(405);

-- soal 3
DELIMITER //
CREATE PROCEDURE nomor3(
    IN kode int(10)
)
BEGIN
    DECLARE total_denda INT;
    DECLARE informasi_denda VARCHAR(255);
    declare keterangan varchar(255);

    SELECT sum(denda) INTO total_denda FROM pengembalian WHERE id_anggota  = kode;
    
    set keterangan='Mahasiswa ini Memiliki Denda Total = ';
    IF (total_denda = 0) THEN
        SET informasi_denda = 'Mahasiswa Ini Tidak memiliki Denda';
    ELSE
        SET informasi_denda = concat(keterangan,total_denda);
    END IF;
    
    SELECT informasi_denda;

END//
DELIMITER ;

CALL nomor3(302);

-- soal 4
DELIMITER //
CREATE PROCEDURE nomor4 (
    IN jumlah INT
)
BEGIN
    DECLARE ulang INT DEFAULT 1;

    WHILE ulang <= jumlah DO
        SELECT * FROM peminjaman limit jumlah;
        SET ulang = ulang + 1;
    END WHILE;
END//
DELIMITER ;

CALL nomor4(10);

-- soal 5
DELIMITER //
CREATE PROCEDURE nomor5(
    IN anggota_id int(10)
)
BEGIN
    DECLARE kondisi INT;
    DECLARE wanita INT;
    DECLARE result VARCHAR(100);

    SELECT COUNT(*)
    INTO Kondisi
    FROM anggota
    WHERE id_anggota = anggota_id AND jenis_kelamin = 'Laki-Laki' AND status_pinjam != '0';

    SELECT COUNT(*)
    INTO wanita
    FROM anggota
    WHERE id_anggota = anggota_id AND jenis_kelamin = 'Perempuan';

    IF Kondisi > 0 THEN
        SELECT 'Masih ada pinjaman yang belum selesai. Tidak dapat menghapus!' AS result;
    
    ELSEIF wanita > 0 THEN
        SELECT 'Anggota tersebut adalah perempuan. Tidak dapat menghapus!' AS result;
    ELSE
        DELETE FROM anggota WHERE id_anggota = anggota_id;
        SET result = 'Data berhasil dihapus';
    END IF;

    SELECT result;
END //

DELIMITER ;
CALL nomor5(300);
select * from anggota;