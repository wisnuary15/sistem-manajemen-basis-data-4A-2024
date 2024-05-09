-- delimiter modul 3
-- soal 1 
DELIMITER//
CREATE PROCEDURE getBuku(IN kode VARCHAR(100))
BEGIN
SELECT * FROM buku WHERE kode_buku = kode;

END//

DELIMITER;

CALL getBuku('bk001');

-- soal 2
DELIMITER //
CREATE PROCEDURE lookBuku
(IN judul VARCHAR(20))
BEGIN
	SELECT * FROM buku WHERE judul_buku = judul;
END //
DELIMITER//

CALL lookBuku('buku2');

-- soal 3
DELIMITER //
CREATE PROCEDURE lookBook
(IN pengarang_buku VARCHAR (100), IN penerbit_buku VARCHAR (100))
BEGIN
	SELECT * FROM buku WHERE pengarang = pengarang_buku AND penerbit = penerbit_buku;
END //
DELIMITER;

CALL lookBook('pengarang4', 'penerbit3');

-- soal 4
DELIMITER //
CREATE PROCEDURE soalEmpat
(IN tahun VARCHAR (25), IN pengarang_buku VARCHAR (30), IN klasifikasi VARCHAR (30))
BEGIN
	SELECT * FROM buku WHERE tahun_buku = tahun AND pengarang = pengarang_buku AND klasifikasi_buku = klasifikasi;
END //
DELIMITER;

CALL soalEmpat("2021", "pengarang5", "html");

-- soal 5
DELIMITER //
CREATE PROCEDURE insertToPetugas
( 	IN petugas_id VARCHAR(10),
	IN nameuser VARCHAR(15),
	IN pw VARCHAR(15),
	IN namee VARCHAR(25)
)
BEGIN
	INSERT INTO petugas
	VALUES (petugas_id,nameuser,pw,namee);
	END //
DELIMITER ;

DROP PROCEDURE insertToPetugas;
CALL insertToPetugas('pt006','juan006','juan890','Juanzh');
CALL insertToPetugas('pt007','rafly007','rafly098','Rafly');

SELECT * FROM petugas;

-- soal 6
DELIMITER //
CREATE PROCEDURE bnyakBuku(OUT banyakBukuPerpus INT)
BEGIN
	SELECT COUNT(*) INTO banyakBukuPerpus FROM buku;
END //
DELIMITER ;

CALL bnyakBuku(@banyakBukuPerpus);
SELECT @banyakBukuPerpus;

-- Soal 7
DELIMITER //
CREATE PROCEDURE status_anggota(
	IN statuss VARCHAR (15),
	OUT total INT (10))
	BEGIN
		SELECT COUNT(id_anggota)
		INTO total
		FROM anggota
		WHERE status_pinjaman = statuss ; 
END //
DELIMITER ;

CALL status_anggota('pinjam',@total);
SELECT@total;
SELECT * FROM anggota;

DROP PROCEDURE status_anggota;