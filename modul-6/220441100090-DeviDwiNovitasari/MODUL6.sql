/* NOMOR 1 */
DELIMITER //
CREATE PROCEDURE biodata_mhs(
    IN nim_mhs INT(100),
    IN nama_mhs VARCHAR(100),
    IN alamat_mhs VARCHAR(100),
    IN noTelp_mhs VARCHAR(100),
    IN gender_mhs VARCHAR(100),
    IN hobi_mhs VARCHAR(100),
    IN tglLahir_mhs DATE
)
BEGIN
    DECLARE vnim_mhs INT(100);
    DECLARE vnama_mhs VARCHAR(100);
    DECLARE valamat_mhs VARCHAR(100);
    DECLARE vnoTelp_mhs VARCHAR(100);
    DECLARE vgender_mhs VARCHAR(100);
    DECLARE vhobi_mhs VARCHAR(100);
    DECLARE vtglLahir_mhs DATE;
    DECLARE vumur_mhs INT(100);
    
    SET vnim_mhs = nim_mhs;
    SET vnama_mhs = nama_mhs;
    SET valamat_mhs = alamat_mhs;
    SET vnoTelp_mhs = noTelp_mhs;
    SET vgender_mhs = gender_mhs;
    SET vhobi_mhs = hobi_mhs;
    SET vtglLahir_mhs = tglLahir_mhs;
    SET vumur_mhs = TIMESTAMPDIFF(YEAR, tglLahir_mhs, CURDATE());
    
    SELECT vnim_mhs AS NIM, vnama_mhs AS Nama_Mahasiswa, valamat_mhs AS Alamat, vnoTelp_mhs AS No_Telepon,
     vgender_mhs AS Jenis_Kelamin, vhobi_mhs AS Hobi, vtglLahir_mhs AS Tanggal_Lahir, vumur_mhs AS Umur;
END//
DELIMITER;

CALL biodata_mhs(22090, "Devi Novitasari", "Lamongan", "089529753775", "P", "Membaca", "2004-09-18")

/* NOMOR 2 */
DELIMITER //
CREATE PROCEDURE pengingat()
    BEGIN
    SELECT kode_peminjaman, id_anggota, tanggal_pinjam, tanggal_kembali, CONCAT(DATEDIFF(tanggal_kembali, tanggal_pinjam),' Hari') AS lama_peminjaman,
    CASE
        WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam)<= 2 THEN 'Silakan Pergunakan Buku dengan Baik!'
        WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam)BETWEEN 3 AND 5 THEN 'Ingat!! Waktu Pinjam Segera Habis!'
        WHEN DATEDIFF(tanggal_kembali, tanggal_pinjam) >= 6 THEN 'Warning!!!, Denda Menanti Anda!'
    END AS status_pinjam
    FROM peminjaman;
END //
DELIMITER ;
CALL pengingat();
SELECT*FROM peminjaman;

/* NOMOR 3 */
DELIMITER //
CREATE PROCEDURE periksa_denda(IN nim_mhs INT(10))
    BEGIN
        DECLARE pesan VARCHAR(100);
        IF (SELECT SUM(Denda) FROM pengembalian WHERE id_anggota = nim_mhs) > 0 THEN
            SET pesan = 'Anda Memiliki Tanggungan Denda!';
            SELECT nim_mhs,(SELECT SUM(Denda) FROM pengembalian WHERE id_anggota = nim_mhs) AS Total_Denda, Pesan;     
            ELSEIF (SELECT SUM(Denda)FROM pengembalian WHERE id_anggota = nim_mhs) = 0 THEN
            SET pesan = 'Anda Tidak Memiliki Tanggungan Denda!';
            SELECT nim_mhs,(SELECT SUM(Denda) FROM pengembalian WHERE id_anggota = nim_mhs) AS Total_Denda, Pesan;  
            ELSE
            SET pesan = "Data tidak tersedia";
            SELECT pesan;
        END IF;
    END //
DELIMITER ;
CALL periksa_denda(4);
SELECT*FROM pengembalian;

/* NOMOR 4 */
DELIMITER //
CREATE PROCEDURE cetak_peminjaman(IN limitt INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        WHILE i <= limitt DO
            SET i = i + 1;
        END WHILE;
        SELECT*FROM peminjaman WHERE kode_peminjaman <= limitt ORDER BY kode_peminjaman ASC;
    END //
DELIMITER ;
CALL cetak_peminjaman(10);

/* NOMOR 5 */
DELIMITER //
CREATE PROCEDURE gender_anggota()
    BEGIN
        DELETE FROM anggota WHERE jenis_kelamin = "L" AND id_anggota 
        NOT IN(SELECT id_anggota FROM peminjaman);
    END//
DELIMITER ;
CALL gender_anggota();
SELECT*FROM anggota;

