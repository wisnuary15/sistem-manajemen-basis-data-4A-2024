/////NOMOR 1/////

DELIMITER //
CREATE PROCEDURE DataMhs(
	IN nim INT(20),
	IN namaMhs VARCHAR(30),
	IN tglLahir DATE,
	IN alamat VARCHAR(20),
	IN noTlp VARCHAR(20),
	IN jeniskelamin VARCHAR(1),
	IN hobi VARCHAR(20),
	IN umur INT(2)
)
BEGIN 
	DECLARE vNim INT(20);
	DECLARE vNamaMhs VARCHAR(30);
	DECLARE vTglLahir DATE;
	DECLARE vAlamat VARCHAR(20);
	DECLARE vNoTlp VARCHAR(20);
	DECLARE vJenisKelamin VARCHAR(1);
	DECLARE vHobi VARCHAR(20);
	DECLARE vUmur INT(2);
	
	SET vNim = nim;
	SET vNamaMhs = namaMhs;
	SET vTglLahir = tglLahir;
	SET vAlamat = alamat;
	SET vNoTlp = noTlp;
	SET vJenisKelamin = jeniskelamin;
	SET vHobi = hobi;
	SET vUmur = TIMESTAMPDIFF(YEAR, vTglLahir, CURDATE());
	
	SELECT vNim AS NIM, 
		vNamaMhs AS NAMA,
		vTglLahir AS TANGGAL_LAHIR,
		vAlamat AS ALAMAT,
		vNoTlp AS NO_TELP,
		vJenisKelamin AS JENIS_KELAMIN,
		vHobi AS HOBI,
		vUmur AS UMUR;
	
END//
DELIMITER ; 

CALL DataMhs(220441100145, "Devi Pebiyanti", "2004-03-13", "Tuban", "083863833932", "P", "Membaca", 19);


/////NOMOR 2/////

DELIMITER //
CREATE PROCEDURE pengingatpinjam()
BEGIN 
	SELECT kode_peminjaman, id_anggota, kode_buku, tgl_pinjam, tgl_kembali, CONCAT(DATEDIFF(tgl_kembali, tgl_pinjam), 'hari') AS "waktu_pinjam",
	CASE 
		WHEN DATEDIFF(tgl_kembali, tgl_pinjam) <= 2 THEN "silahkan pergunakan buku dengan baik"
		
		WHEN DATEDIFF(tgl_kembali, tgl_pinjam) BETWEEN 3 AND 5 THEN "ingat! waktu pinjam segera habis"
		
		WHEN DATEDIFF(tgl_kembali, tgl_pinjam) >= 6 THEN "warning! denda menanti anda"
	END AS keterangan
	FROM peminjaman ORDER BY tgl_pinjam ASC;
END//
DELIMITER ;

CALL pengingatpinjam();
DROP PROCEDURE pengingatpinjam;


/////NOMOR 3/////

DELIMITER //
CREATE PROCEDURE cekdenda2 (
    IN idAnggota VARCHAR(50)
)
BEGIN
    DECLARE keterangan VARCHAR(100);
    DECLARE jumlah_denda DECIMAL(10, 2);

    SET jumlah_denda = 0;

    SELECT COALESCE(SUM(denda), 0) INTO jumlah_denda 
    FROM pengembalian 
    WHERE id_anggota = idAnggota;

    IF jumlah_denda = 0 THEN
        SET keterangan = 'anda tidak memiliki denda';
    ELSEIF jumlah_denda > 0 THEN
        SET keterangan = 'anda memiliki denda';
    END IF;

    SELECT idAnggota AS id_anggota, jumlah_denda, keterangan;

END//
DELIMITER ;

CALL cekdenda2(7);



/////nomor 4/////


DELIMITER//
CREATE PROCEDURE cetakpeminjaman(IN cetak INT(5))
BEGIN
	DECLARE ulang INT(5);
	
	SET ulang = 1;
	
	WHILE ulang <= cetak DO 
		SELECT * FROM peminjaman;
		SET ulang = ulang + 1;
	END WHILE; 
END//
DELIMITER ;
CALL cetakpeminjaman(10);

DROP PROCEDURE cetakpeminjaman;



/////NOMOR 5/////

DELIMITER //
CREATE PROCEDURE hapusjeniskelamin (
    IN jenis_kel VARCHAR(20)
)
BEGIN 
    IF jenis_kel = 'Laki-Laki' THEN 

        DELETE FROM peminjaman 
        WHERE id_anggota IN (
            SELECT id_anggota FROM anggota 
            WHERE jenis_kelamin = 'Laki-Laki' AND status_pinjam != 'pinjam'
        );

        DELETE FROM pengembalian 
        WHERE id_anggota IN (
            SELECT id_anggota FROM anggota 
            WHERE jenis_kelamin = 'Laki-Laki' AND status_pinjam != 'pinjam'
        );

        DELETE FROM anggota
        WHERE jenis_kelamin = 'Laki-Laki' AND status_pinjam != 'pinjam';
    END IF;
END //
DELIMITER ;

CALL hapusjeniskelamin('Laki-Laki');
SELECT*FROM anggota;
