-- NO 1 --
DELIMITER //
CREATE PROCEDURE anggota(IN Id VARCHAR(100))
BEGIN
	SELECT * FROM anggota WHERE Id = id_anggota;
END//
DELIMITER ;

CALL anggota(5);

-- NO 2 --
DELIMITER //
CREATE PROCEDURE peminjaman(IN id_peminjaman INT(10))
BEGIN
	SELECT * FROM peminjaman WHERE id_peminjaman = kode_peminjaman;
END//
DELIMITER ;

CALL peminjaman(2);

-- NO 3 --
DELIMITER //
CREATE PROCEDURE pengembalian(IN id_pengembali INT(10), IN id_buku INT(10)) 
BEGIN 
    SELECT * FROM pengembalian WHERE id_pengembali = id_anggota AND id_buku = kode_buku; 
END//
DELIMITER ; 
 
CALL pengembalian(9, 4); 

-- NO 4 --
DELIMITER //
CREATE PROCEDURE buku_perpustakaan(IN Penerbit VARCHAR(30), IN Statuss VARCHAR(10), IN Klasifikasi VARCHAR(20)) 
BEGIN 
    SELECT * FROM buku WHERE Penerbit = penerbit_buku AND Statuss = status_buku AND Klasifikasi = klasifikasi_buku; 
END// 
DELIMITER ; 
 
CALL buku_perpustakaan('Gramedia', 'Tersedia', 'Sejarah'); 

-- NO 5 --
DELIMITER //
CREATE PROCEDURE insertToPetugas(
	IN id_petugas INT(100),
	IN username VARCHAR(100),
	IN passwordd VARCHAR(100),
	IN nama VARCHAR(100)
)
BEGIN
	INSERT INTO petugas VALUES (id_petugas, username, passwordd, nama);
END//
DELIMITER ;
CALL insertToPetugas(11, 'userpetugas11', 'pikirsendiri', 'Irianti Putri');
SELECT * FROM petugas;

-- NO 6 --
DELIMITER //
CREATE PROCEDURE Jumlah_Anggota( OUT banyak_anggota INT)
BEGIN
	SELECT COUNT(*) INTO banyak_anggota FROM anggota;
END //
DELIMITER ;

CALL Jumlah_Anggota(@banyak_anggota);
SELECT @banyak_anggota;

-- NO 7 --
DELIMITER //
CREATE PROCEDURE jumlah(
	INOUT jumlah INT,
	IN kode_buku int(10)
)
BEGIN
	SET jumlah = jumlah+5;
	UPDATE buku SET jumlah_buku = jumlah;
END //
DELIMITER ;

SET @HasilJumlahBuku = 4;
CALL jumlah(@HasilJumlahBuku, 6);
SELECT @HasilJumlahBuku AS `Hasil Jumlah Buku`;

