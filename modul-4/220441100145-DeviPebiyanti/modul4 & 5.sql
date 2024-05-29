////////////NOMOR 1//////////

DELIMITER //
CREATE PROCEDURE cari(
	INOUT tanggal_kembali DATE
)
BEGIN
	SELECT
		kode_kembali, 
		tgl_kembali, 
		nama_anggota, 
		nama
	FROM 
		pengembalian
	LEFT JOIN
		anggota ON pengembalian.id_anggota = anggota.id_anggota
	LEFT JOIN 
		petugas ON pengembalian.id_petugas = petugas.id_petugas
	WHERE 
		pengembalian.tgl_kembali = tanggal_kembali;
END //
DELIMITER;

DROP PROCEDURE cari;
SET @tanggal = '2023-04-10';
CALL cari(@tanggal);


/////////////NOMOR 2/////////////

DELIMITER //
CREATE PROCEDURE StatusPinjam(
	INOUT statuspinjam VARCHAR(50)
)
BEGIN
	SELECT 
		id_anggota,
		nama_anggota,
		status_pinjam
	FROM 
		anggota
	WHERE 
		anggota.status_pinjam = statuspinjam;
END //
DELIMITER;

DROP PROCEDURE StatusPinjam;
SET @status = 'pinjam';
CALL StatusPinjam(@status);


/////////NOMOR 3///////

DELIMITER //
CREATE PROCEDURE StatusPinjam2(
	IN statusPinjam VARCHAR(50),
	OUT namaAnggota VARCHAR(50)
)
BEGIN
	SELECT 
		GROUP_CONCAT(nama_anggota SEPARATOR ', ')
	INTO 
		namaAnggota
	FROM 
		anggota
	WHERE
		status_pinjam = statusPinjam;
END//
DELIMITER ;

DROP PROCEDURE StatusPinjam2;

CALL StatusPinjam2('pinjam', @nama); 
SELECT @nama;


//////NOMOR 4//////

DELIMITER //

CREATE PROCEDURE InsertBuku(
    IN JudulBuku VARCHAR(100),
    IN PengarangBuku VARCHAR(100),
    IN PenerbitBuku VARCHAR(100),
    IN TahunBuku INT,
    IN JumlahBuku INT,
    IN StatusBuku VARCHAR(100),
    IN KlasifikasiBuku VARCHAR(50)    
)
BEGIN 
    INSERT INTO buku(
        judul_buku, 
        pengarang_buku, 
        penerbit_buku, 
        tahun_buku, 
        jumlah_buku, 
        status_buku, 
        klasifikasi_buku
    )
    VALUES (
        JudulBuku,
        PengarangBuku,
        PenerbitBuku,
        TahunBuku,
        JumlahBuku,
        StatusBuku,
        KlasifikasiBuku
    );

    SELECT CONCAT('Buku "', JudulBuku, '" berhasil ditambahkan') AS pesan;
END //

DELIMITER ;

CALL InsertBuku('Sebening Syahadat', 'Diva', 'Gramedia', 2020, 60, 'Tersedia', 'Fiksi Remaja');


///////NOMOR 5/////////

DELIMITER //

CREATE PROCEDURE HapusAnggota(
    IN idAnggota INT
)
BEGIN
    DECLARE status_pinjaman VARCHAR(20);
    
    SELECT status_pinjam INTO status_pinjaman
    FROM anggota
    WHERE id_anggota = idAnggota;
    
    IF status_pinjaman = 'pinjam' THEN
        SELECT CONCAT('Gagal menghapus anggota. Anggota dengan ID ', idAnggota, ' masih memiliki pinjaman yang belum dikembalikan.') AS pesan;
    ELSE
        DELETE FROM anggota WHERE id_anggota = idAnggota;
        
        SELECT CONCAT('Anggota dengan ID ', idAnggota, ' berhasil dihapus.') AS pesan;
    END IF;
END //

DELIMITER ;


DROP PROCEDURE HapusAnggota;
CALL HapusAnggota(1);


////////NOMOR 6/////////////

CREATE VIEW innerjoin AS 
SELECT 
    anggota.id_anggota,
    anggota.nama_anggota,
    buku.judul_buku,
    peminjaman.kode_buku,
    COUNT(peminjaman.kode_peminjaman) AS jumlah
FROM 
    anggota
INNER JOIN
    peminjaman ON anggota.id_anggota = peminjaman.id_anggota
INNER JOIN
    buku ON peminjaman.kode_buku = buku.kode_buku
GROUP BY
    anggota.id_anggota,
    anggota.nama_anggota,
    peminjaman.kode_buku,
    buku.judul_buku;

SELECT * FROM innerjoin;



CREATE VIEW leftjoin AS
SELECT 
	anggota.id_anggota,
	anggota.nama_anggota,
	MAX(peminjaman.tgl_kembali) AS tgl_terakhir
FROM 
	anggota
LEFT JOIN 
	peminjaman ON anggota.id_anggota = peminjaman.id_anggota
GROUP BY 
	anggota.id_anggota, 
	anggota.nama_anggota;

SELECT * FROM leftjoin;



CREATE VIEW rightjoin AS
SELECT 
	buku.kode_buku,
	buku.judul_buku,
	MIN(peminjaman.tgl_pinjam) AS tgl_awal
FROM 
	buku
RIGHT JOIN 
	peminjaman ON buku.kode_buku = peminjaman.kode_buku
GROUP BY 
	buku.kode_buku,
	buku.judul_buku;

SELECT * FROM rightjoin;