/*Soal 1*/
DELIMITER //
   CREATE PROCEDURE biodata(IN nim INT(20), IN namaMhs VARCHAR(20), IN alamat VARCHAR(25), IN noTlp INT(12), 
   IN jenisKelamin VARCHAR(1), IN hobi VARCHAR(25), IN umur VARCHAR(25))
   BEGIN
     DECLARE vnim INT(20);
     DECLARE vnamaMhs VARCHAR(20);
     DECLARE valamat VARCHAR(25);
     DECLARE vnoTlp INT(12);
     DECLARE vjenisKelamin VARCHAR(1);
     DECLARE vhobi VARCHAR(25);
     DECLARE vumur VARCHAR(25);
     
     SET vnim = nim;
     SET vnamaMhs = namaMhs;
     SET valamat = alamat;
     SET vjenisKelamin = jenisKelamin;
     SET vnoTlp = noTlp;
     SET vhobi = hobi;
     SET vumur = umur;
     
     SELECT vnim AS NIM, vnamaMhs AS Nama_Mahasiswa, valamat AS Alamat, vnoTlp AS Nomor_Telepon,
     vjenisKelamin AS Jenis_Kelamin, vhobi AS Hobi, vumur AS Umur_Sekarang;
   END //
DELIMITER;

CALL biodata(214312, 'Sifa Saputra', 'Bojonegoro', 9283273, 'L', 'Sepak Bola', '19 Tahun');

/*soal 2*/
DELIMITER //
   CREATE PROCEDURE ingat()
   BEGIN
     SELECT Kode_Kembali, IdAnggota, Tgl_Pinjam, DATEDIFF(Tgl_Kembali, Tgl_Pinjam) AS lama_peminjaman,
     CASE WHEN DATEDIFF(Tgl_Kembali, Tgl_Pinjam) <= 2 THEN "Silahkan Pergunakan Buku"
          WHEN DATEDIFF(Tgl_Kembali, Tgl_Pinjam) BETWEEN 3 AND 5 THEN "Ingat Waktu Pinjam Segera Habis"
          WHEN DATEDIFF(Tgl_Kembali, Tgl_Pinjam) >= 6 THEN "Warning! Denda Menanti Anda" END AS "Status"
     FROM pengembalaian ORDER BY lama_peminjaman ASC;
   END //
DELIMITER;

CALL ingat();

/*soal 3*/
DELIMITER //
   CREATE PROCEDURE besarDenda(IN id VARCHAR(20))
   BEGIN
     DECLARE jumlah VARCHAR(45);
     IF ((SELECT SUM(Denda) FROM pengembalaian WHERE IdAnggota = id) != 0) THEN
        SET jumlah = (SELECT SUM(Denda) FROM pengembalaian WHERE IdAnggota = id);
     ELSE
        SET jumlah = "Anda Tidak Memiliki Tanggungan / Denda";
     END IF;
     SELECT jumlah;
   END //
DELIMITER;

CALL besarDenda("A002");

/*soal 4*/
DELIMITER //
  CREATE PROCEDURE cetak(IN bila INT(9))
  BEGIN
    DECLARE b INT;
    SET b = 1;
    WHILE b <= bila DO
      SELECT * FROM peminjaman WHERE Kode_Peminjaman = CONCAT('PJ', LPAD(b, 3, '0'));
      SET b = b + 1;
    END WHILE;
  END //
DELIMITER;

DROP PROCEDURE cetak;

CALL cetak(10);

/*soal 5*/
DELIMITER //
CREATE PROCEDURE hapusData(
IN kode VARCHAR (10))

BEGIN 

	DECLARE keterangan VARCHAR (100);

	DECLARE cek INT;
	
	DECLARE jenis VARCHAR (20);

	SELECT COUNT(*),Jenis_Kelamin INTO cek,jenis FROM peminjaman a 
	JOIN anggota b ON a.IdAnggota = b.IdAnggota 
	WHERE a.IdAnggota = kode ;
	
	

	IF (jenis = 'Perempuan') THEN
	
		SET keterangan = CONCAT('data anggota dengan id ', kode, ' adalah perempuan'); 

	ELSEIF(cek = 0) THEN 
	
		DELETE FROM anggota WHERE IdAnggota = kode;

		SET keterangan = CONCAT('data anggota dengan id ', kode, ' berhasil dihapus');

	ELSE

		SET keterangan = CONCAT('data anggota dengan id ', kode, ' masih memiliki tanggungan');

	END IF;
	
	SELECT keterangan;

END //
DELIMITER;
DROP PROCEDURE hapusData;

CALL hapusData('A008');

