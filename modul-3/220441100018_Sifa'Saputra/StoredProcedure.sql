-- Soal Nomor 1
DELIMITER //
	CREATE PROCEDURE getAnggota()
	BEGIN 
	  SELECT * FROM anggota;
	END //
DELIMITER;

CALL getAnggota();

-- Soal Nomor 2
DELIMITER // 
   CREATE PROCEDURE getPeminjaman(IN petugas_layan VARCHAR(8))
   BEGIN
     SELECT * FROM peminjaman WHERE IdPetugas = petugas_layan;
   END //
DELIMITER;

CALL getPeminjaman('P002');

-- Soal Nomor 3
DELIMITER // 
   CREATE PROCEDURE getPeminjamanKodetgl(IN petugas_layanan VARCHAR(8), IN tanggal DATE)
   BEGIN
     SELECT * FROM peminjaman WHERE IdPetugas = petugas_layanan AND Tanggal_Pinjam = tanggal;
   END //
DELIMITER;

CALL getPeminjamanKodetgl('P002', '2024-05-01');

-- Soal Nomor 4
DELIMITER //
   CREATE PROCEDURE getBuku(IN penerbit VARCHAR(30), IN tahun VARCHAR(7), IN kategori VARCHAR(25))
   BEGIN
     SELECT * FROM buku WHERE Penerbit_Buku = penerbit AND Tahun_Buku = tahun AND Klasifikasi_Buku = kategori;
   END //
DELIMITER;

CALL getBuku('Sinar Putra', '2020', 'Action');

-- Soal Nomor 5
DELIMITER //
   CREATE PROCEDURE addPetugas(IN IdPetugas VARCHAR(7), IN Username VARCHAR(15),IN PASSWORD VARCHAR(15), IN Nama VARCHAR(18))
   BEGIN 
     INSERT INTO petugas VALUES (IdPetugas, Username, PASSWORD, Nama);
   END //
DELIMITER;

CALL addPetugas('P010', 'pustakawan10', 'pustakawan10', 'Tito');

-- Soal Nomor 6
DELIMITER //
   CREATE PROCEDURE countAnggota(OUT Jumlah_Anggota INT(9))
   BEGIN
     SELECT COUNT(IdAnggota) INTO Jumlah_Anggota FROM anggota;
   END //
DELIMITER;

CALL countAnggota(@Jumlah_Anggota);
SELECT @Jumlah_Anggota;

-- Soal Nomor 7
DELIMITER //
   CREATE PROCEDURE countGender(IN gender VARCHAR(15), OUT total INT(9))
   BEGIN
      SELECT COUNT(IdAnggota) INTO total FROM anggota WHERE Jenis_Kelamin = gender;
   END //
DELIMITER;

CALL countGender('Perempuan', @total);
SELECT @total;