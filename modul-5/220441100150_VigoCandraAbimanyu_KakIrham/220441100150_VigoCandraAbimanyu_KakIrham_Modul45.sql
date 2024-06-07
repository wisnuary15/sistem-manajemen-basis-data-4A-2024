-- No 1
DELIMITER //
CREATE PROCEDURE tanggalkembali (
	INOUT Tanggal DATE
)
BEGIN
	SELECT username,nama_anggota,kode_kembali,kode_buku,tgl_pinjam,tgl_kembali,denda 
	FROM anggota,petugas,pengembalian 
	WHERE anggota.idAnggota = pengembalian.idAnggota AND petugas.idPetugas =pengembalian.idPetugas AND pengembalian.tgl_kembali=Tanggal;
END //
DELIMITER ;

SET @Tanggal = '2024-08-09';
CALL tanggalkembali(@Tanggal);
SELECT @Tanggal;

-- No 2
DELIMITER //
CREATE PROCEDURE informasipinjam1 (
	INOUT statuspinjam VARCHAR(50)
)
BEGIN
	SELECT idAnggota,nama_anggota,angkatan_anggota,tempat_lahir_anggota,tanggal_lahir_anggota,status_pinjam,jenis_kelamin
	FROM anggota
	WHERE status_pinjam=statuspinjam;
END //
DELIMITER ;

SET @statuspinjam = 'pinjam';
CALL informasipinjam1(@statuspinjam);
SELECT * FROM anggota;

-- No3
DELIMITER//
CREATE PROCEDURE daftar_anggota(
	IN statuspinjam VARCHAR(50))
BEGIN 
	SELECT * FROM anggota WHERE 
        status_pinjam = statuspinjam;
	
END// 
DELIMITER//

SET @statuspinjam = 'pinjam';
CALL daftar_anggota(@statuspinjam);

-- No 4
DELIMITER //
CREATE PROCEDURE tambahdatakebuku(
    IN kode_buku VARCHAR(20),
    IN judul_buku VARCHAR(50),
    IN pengarang_buku VARCHAR(50),
    IN penerbit_buku VARCHAR(50),
    IN tahun_buku VARCHAR(50),
    IN jumlah_buku INT(10),
    IN status_buku VARCHAR(50),
    IN klasifikasi_buku VARCHAR(50)
    )
BEGIN
    INSERT INTO buku
    VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku,tahun_buku,jumlah_buku,status_buku,klasifikasi_buku);
    SELECT 'data buku berhasil ditambahkan.' AS 'Pesan';
END //
DELIMITER ;
CALL tambahdatakebuku('110', 'Surga dan Neraka', 'Tere Liye', 'Gramedia','2024',10,'tersedia','Non fiksi');
SELECT*FROM buku;

-- No 5
DELIMITER//
CREATE PROCEDURE hapusanggota1(
	IN ID VARCHAR(100)
)
BEGIN 
	DECLARE peringatan VARCHAR(50);
	DECLARE jumlahanggota INT;
	
	SELECT COUNT(*) INTO jumlahanggota FROM peminjaman WHERE idAnggota = ID;
	
    IF jumlahanggota = 0 THEN
	DELETE FROM anggota WHERE idAnggota = ID;
        SET peringatan = 'anggota berhasil dihapus';
    ELSE 
        SET peringatan = 'anggota gagal dihapus karena memiliki peminjaman';
    END IF;
    
    SELECT peringatan;
	
END//
DELIMITER ;

CALL hapusanggota1('204');

SELECT * FROM anggota;


-- No 6

CREATE VIEW view_peminjaman_anggota AS
SELECT 
    a.idAnggota,
    a.nama_anggota,
    COUNT(p.kode_peminjaman) AS total_peminjaman
FROM 
    anggota a
INNER JOIN 
    peminjaman p ON a.idAnggota = p.idAnggota
GROUP BY 
    a.idAnggota, a.nama_anggota;
SELECT * FROM view_peminjaman_anggota;


-- 
CREATE VIEW view_anggota_tidak_pinjam AS
SELECT 
    a.idAnggota,
    a.nama_anggota,
    a.status_pinjam,
    COUNT(p.kode_peminjaman) AS total_peminjaman
FROM 
    anggota a
LEFT JOIN 
    peminjaman p ON a.idAnggota = p.idAnggota
WHERE 
    p.kode_peminjaman IS NULL
GROUP BY 
    a.idAnggota, a.nama_anggota, a.status_pinjam;
    
    SELECT * FROM view_anggota_tidak_pinjam;
    
    
    --
    
  CREATE VIEW view_pengembalian_denda AS
SELECT 
    p.kode_kembali,
    p.idAnggota,
    a.nama_anggota,
    p.kode_buku,
    p.tgl_kembali,
    p.denda
FROM 
    pengembalian p
RIGHT JOIN 
    anggota a ON p.idAnggota = a.idAnggota
WHERE 
    p.denda IS NOT NULL;
    
    SELECT * FROM view_pengembalian_denda;

