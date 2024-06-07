-- soal 1
DELIMITER //
CREATE PROCEDURE CariPengembalian(INOUT p_tanggal DATE)
BEGIN
    DECLARE no_result INT DEFAULT 0;
    
    -- Memeriksa apakah ada hasil untuk tanggal yang diberikan
    SELECT COUNT(*) INTO no_result
    FROM pengembalian
    WHERE Tanggal_Kembali = p_tanggal;

    -- Jika ada hasil, tampilkan datanya
    IF no_result > 0 THEN
        SELECT 
		p.Kode_Kembali,
		a.Nama_Anggota,
		t.Nama,
		p.Tanggal_Kembali
        FROM 
            pengembalian p
        JOIN 
            anggota a ON p.IdAnggota = a.IdAnggota
        JOIN 
            petugas t ON p.IdPetugas = t.IdPetugas
        WHERE 
            p.Tanggal_Kembali = p_tanggal;
    ELSE
        -- Jika tidak ada hasil, set p_tanggal menjadi NULL
        SET p_tanggal = NULL;
    END IF;
END //
DELIMITER ;
DROP PROCEDURE CariPengembalian;
-- Contoh penggunaan stored procedure dengan parameter INOUT
SET @tanggal = '2024-10-20';
CALL CariPengembalian(@tanggal);
SELECT @tanggal;
SELECT * FROM pengembalian;

-- soal 2
SELECT * FROM anggota;
DELIMITER //
CREATE PROCEDURE CariAnggota(INOUT p_status_pinjam ENUM('Sudah Lama', 'Baru'))
BEGIN
    -- Memilih data anggota berdasarkan status pinjam yang diberikan
    SELECT * FROM anggota WHERE status_pinjam = p_status_pinjam;
END //
DELIMITER ;
SET @status_pinjam = 'Baru';
CALL CariAnggota(@status_pinjam);
SELECT @status_pinjam;

-- soal 3
DROP PROCEDURE DaftarAnggotaByStatusPinjam;
DELIMITER //
CREATE PROCEDURE DaftarAnggotaByStatusPinjam(
    IN p_status_pinjam ENUM('Sudah Lama', 'Baru'),
    OUT p_result VARCHAR(255)
)
BEGIN
    DECLARE result VARCHAR(255);
    
    -- Memilih anggota berdasarkan status pinjam yang diberikan
    SELECT GROUP_CONCAT(nama_anggota) INTO result
    FROM anggota
    WHERE status_pinjam = p_status_pinjam;
    
    -- Mengembalikan hasil
    SET p_result = result;
END //
DELIMITER ;
CALL DaftarAnggotaByStatusPinjam('Sudah Lama', @result);
SELECT @result;

 -- soal 4

DELIMITER //
CREATE PROCEDURE TambahBuku(
    IN p_Kode_Buku VARCHAR (10),
    IN p_judul_buku VARCHAR(45),
    IN p_pengarang_buku VARCHAR(30),
    IN p_tahun_buku VARCHAR(10),
    IN p_jumlah_buku VARCHAR(5),
    IN p_status_buku VARCHAR(10),
    IN p_klasifikasi_buku VARCHAR(20)
   
)
BEGIN
    -- Menambahkan data buku ke dalam tabel buku
    INSERT INTO buku(Kode_Buku,Judul_Buku, Pengarang_Buku,Tahun_Buku,Jumlah_Buku,Status_Buku,Klasifikasi_Buku) 
    VALUES (p_Kode_Buku, p_judul_buku, p_pengarang_buku, p_tahun_buku,p_jumlah_buku,p_status_buku,p_klasifikasi_buku);
    
    -- Mengembalikan pesan konfirmasi
    SELECT 'Data buku berhasil ditambahkan' AS message;
END //
DELIMITER ;
CALL TambahBuku('234','Lanadora','Lana','2003','10','ada','fiksi');
SELECT* FROM buku;

-- soal 5
DELIMITER //
CREATE PROCEDURE HapusAnggota(
    IN p_ID_Anggota INT
)
BEGIN
    DECLARE pinjaman_count INT;
    SELECT COUNT(*) INTO pinjaman_count
    FROM pengembalian
    WHERE IdAnggota = p_ID_Anggota AND Tanggal_Kembali IS NULL;

    -- Jika anggota memiliki pinjaman yang belum dikembalikan, batalkan proses penghapusan
    IF pinjaman_count > 0 THEN
        SELECT 'Anggota memiliki pinjaman yang belum dikembalikan. Proses penghapusan dibatalkan.' AS message;
    ELSE
        -- Jika tidak ada pinjaman yang belum dikembalikan, hapus data anggota
        DELETE FROM anggota WHERE IdAnggota = p_ID_Anggota;
        SELECT 'Data anggota berhasil dihapus.' AS message;
    END IF;
END //
DELIMITER ;
CALL HapusAnggota('102');
SELECT * FROM pengembalian;

-- soal 6
CREATE VIEW RightJoin_View AS
SELECT b.Kode_Buku, b.Judul_Buku, COUNT(p.Kode_Buku) AS Jumlah_Peminjaman
FROM pengembalian p
RIGHT JOIN buku b ON b.Kode_Buku = p.Kode_Buku
GROUP BY b.Kode_Buku, b.Judul_Buku;

SELECT * FROM RightJoin_View;
-- Mengambil semua baris dari tabel buku dan hanya baris yang cocok dari tabel pengembalian.
-- Baris yang tidak cocok di tabel pengembalian akan memiliki nilai NULL.

CREATE VIEW InnerJoin_View AS
SELECT b.Kode_Buku, b.Judul_Buku, COUNT(p.Kode_Buku) AS Jumlah_Peminjaman
FROM pengembalian p
INNER JOIN buku b ON b.Kode_Buku = p.Kode_Buku
GROUP BY b.Kode_Buku;

SELECT * FROM InnerJoin_View;
-- hanya Mengambil baris yang cocok dari kedua tabel.

CREATE VIEW LeftJoin_View AS
SELECT b.Kode_Buku, b.Judul_Buku, COUNT(p.Kode_Buku) AS Jumlah_Peminjaman
FROM pengembalian p
LEFT JOIN buku b ON b.Kode_Buku = p.Kode_Buku
GROUP BY b.Judul_Buku;

DROP VIEW LeftJoin_View;
SELECT * FROM LeftJoin_View;


