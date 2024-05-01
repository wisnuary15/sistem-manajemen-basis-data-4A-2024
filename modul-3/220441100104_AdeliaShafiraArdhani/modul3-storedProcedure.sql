USE perpustakaan;

-- prosedur menggunakan parameter IN default
DELIMITER // 
CREATE PROCEDURE getBuku(IN kode VARCHAR(10))
BEGIN
    SELECT * FROM buku
    WHERE kode_buku = kode;
END //
DELIMITER ;

CALL getBuku('bk002');

-- mengetahui data pada salah satu table dengan berdasarkan pada salah satu atribut/field
DELIMITER // 
CREATE PROCEDURE getPetugas(IN nama VARCHAR(15))
BEGIN
    SELECT * FROM petugas
    WHERE username = nama;
END //
DELIMITER ;

CALL getPetugas('adelia001');

-- mengetahui data pada salah satu table dengan berdasarkan pada salah dua atribut/field
DELIMITER // 
CREATE PROCEDURE getKembali(
	IN kode_kbl VARCHAR(10), 
	in tgl_kbl date)
BEGIN
    SELECT * FROM pengembalian
    WHERE kode_kembali = kode_kbl and tanggal_kembali = tgl_kbl;
END //
DELIMITER ;

CALL getKembali('kb003', '2024-02-28');

-- mengetahui data pada salah satu table dengan berdasarkan pada salah tiga atribut/field
DELIMITER // 
CREATE PROCEDURE getPinjam(
	IN kode_pj VARCHAR(10), 
	in id_ang varchar(10),
	IN kode_bk varchar(10)
	)
BEGIN
    SELECT * FROM pinjaman
    WHERE kode_pinjaman = kode_pj AND id_anggota = id_ang and kode_buku = kode_bk;
END //
DELIMITER ;

CALL getPinjam('pj004', 'ang008', 'bk007');

-- Definisikan stored procedure untuk memasukkan data pada salah satu table
DELIMITER // 
CREATE PROCEDURE insertToPtg(
	 IN id_ptg VARCHAR(10),
	 IN uname VARCHAR(15),
	 IN pw VARCHAR(15),
	 IN nama_ptg varchar(25)
	 )
BEGIN
	INSERT INTO petugas
	VALUES (id_ptg, uname, pw, nama_ptg);
END //
DELIMITER;

CALL insertToPtg('pt006', 'adi006', 'adi098', 'adi');

-- Definisikan stored procedure untuk mengetahui data pada salah satu table menggunakan parameter OUT
DELIMITER // 
CREATE PROCEDURE banyakBuku(
	OUT banyakBukuPerpus INT
)
BEGIN
	SELECT COUNT(*) banyakBukuPerpus FROM buku;	
END //
DELIMITER;

CALL banyakBuku(@banyakBukuPerpus);

-- Definisikan stored procedure untuk mengetahui data pada salah satu table menggunakan parameter INOUT
DELIMITER //
CREATE PROCEDURE tambahBuku(
	INOUT tambahBuku INT,
	IN jumlah VARCHAR(15)
)
BEGIN
	SET tambahBuku = tambahBuku+5;
	UPDATE buku SET jumlah_buku = tambahBuku;
END //
DELIMITER;

drop procedure tambahBuku;

SET @total_buku = 10;
CALL tambahBuku(@total_buku, 'bk001');
SELECT @total_buku AS 'Jumlah buku setelah ditambah';