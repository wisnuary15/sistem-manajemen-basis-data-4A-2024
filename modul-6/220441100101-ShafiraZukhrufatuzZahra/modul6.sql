CREATE DATABASE perpustakaan;
USE perpustakaan;

--1.Buatlah STORED PROCEDURE Variabel untuk menampilkan Biodata masing-masing dengan isi : Nim, Nama mahasiswa, Alamat, NO Telpon, jenis Kelamin dan Hobi serta tambahkan umur sekarang. Kemudian tampilkan hasilnya.--
--jawaban 1--
DELIMITER//
CREATE PROCEDURE nomorSatu(
 IN nim INT,
 IN namaMhs VARCHAR (20),
 IN alamat VARCHAR (1),
 IN tanggal_lahir DATE,
 IN no_tlp INT (12),
 IN jenis_kelamin VARCHAR (25),
 IN hobi VARCHAR (25)
)
BEGIN
	DECLARE umur INT;
	SET umur = TIMESTAMPDIFF (YEAR, tanggal_lahir, CURDATE());
	SELECT nim AS NIM, namaMhs AS NAMA_MAHASISWA, alamat AS ALAMAT, tanggal_lahir AS TANGGAL_LAHIR, no_tlp AS NO_TELEPON, jenis_kelamin AS JENIS_KELAMIN,
	hobi AS HOBI, umur AS UMUR; 
END//
DELIMITER;
CALL nomorSatu (951283789, "Kim Taehyung", "Daegu", '1997-12-30', 082737176127, "L", "Menyanyi");

--jawaban 2--
DELIMITER//
CREATE PROCEDURE cobaSatu()
BEGIN
	DECLARE umur INT;
	SELECT IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, TIMESTAMPDIFF (YEAR, Tanggal_Lahir_Anggota, CURDATE()) AS UMUR FROM anggota; 
END//
DELIMITER;
CALL cobaSatu();

--2.Buatlah STORED PROCEDURE untuk menentukan keterangan pengingat pengembalian buku, dengan ketentuan jika tanggal pinjam <= 2 hari “Silahkan Pergunakan Buku dengan baik”, Jika tanggal pinjam antara 3-5 hari “Ingat!, Waktu Pinjem segera habis”, dan jika tanggal pinjam >= 6 hari “Warning!!!, Denda Menanti Anda”.--
--jawaban 1--
DELIMITER//
CREATE PROCEDURE nomorDua(
IN kode_peminjaman INT,
IN tanggal_pinjam DATE,
IN tanggal_kembali DATE
)
BEGIN 
	DECLARE pengingat VARCHAR (200);
	IF DATEDIFF (tanggal_kembali, tanggal_pinjam)<=2 THEN
		SET pengingat = "Silahkan Pergunakan Buku Dengan Baik";
	ELSEIF DATEDIFF (tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN
		SET pengingat = "Ingat! Waktu Pinjam Segera Habis";
	ELSE
		SET pengingat = "Warning!!!, Denda Menanti Anda";
	END IF;
	SELECT pengingat;
END//
DELIMITER;//
CALL nomorDua(1, '2024-01-01', '2024-01-08');

--jawaban 2--
DELIMITER//
CREATE PROCEDURE cobaDua()
BEGIN 
	DECLARE pengingat VARCHAR (200);
	DECLARE tanggal_pinjam DATE;
	DECLARE tanggal_kembali DATE;
	
	SELECT Tanggal_Pinjam, Tanggal_Kembali INTO tanggal_pinjam, tanggal_kembali FROM peminjaman ORDER BY Kode_Peminjaman LIMIT 5;
	IF DATEDIFF (tanggal_kembali, tanggal_pinjam)<=2 THEN
		SET pengingat = "Silahkan Pergunakan Buku Dengan Baik";
	ELSEIF DATEDIFF (tanggal_kembali, tanggal_pinjam) BETWEEN 3 AND 5 THEN
		SET pengingat = "Ingat! Waktu Pinjam Segera Habis";
	ELSE
		SET pengingat = "Warning!!!, Denda Menanti Anda";
	END IF;
	SELECT pengingat;
END//
DELIMITER;//
CALL cobaDua();


--3.Buatlah STORED PROCEDURE untuk memeriksa jumlah denda yang dimiliki mahasiswa! Jika mahasiswa mendapat denda maka akan menampilkan DATA denda yang belum dibayarkan, jika mahasiswa sudah membayar atau tidak memiliki tanggungan denda maka akan menampilkan pesan bahwa mahasiswa tersebut tidak memiliki tanggungan atau denda.--
--jawaban 1--
DELIMITER//
CREATE PROCEDURE nomorTiga()
BEGIN
   DECLARE jumlah_denda DECIMAL (10,2);
   DECLARE periksa VARCHAR (100);
   SELECT IdAnggota, SUM(Denda) AS jumlah_denda FROM pengembalian GROUP BY IdAnggota;
   IF jumlah_denda > 0 THEN 
	SET periksa = CONCAT("Total Denda: ", jumlah_denda);
   ELSE
	SET periksa = CONCAT("Anda Tidak Memiliki Denda");
   END IF;
   SELECT periksa;
END//
DELIMITER;//
CALL nomorTiga();

--coba jawaban 2--
CALL CheckDendaMahasiswa(951283789);


--4.Buatlah STORED PROCEDURE Looping untuk mencetak DATA peminjaman 1 sampai dengan 10.--
DELIMITER//
CREATE PROCEDURE nomerEmpat (IN batas INT)
BEGIN
	DECLARE i INT;
	SET i = 1;
	
	WHILE i <= batas DO 
		SELECT * FROM peminjaman WHERE kode_peminjaman = i;
		SET i = i + 1 ;
	END WHILE;
	SELECT hasil;
END//
DELIMITER;
CALL nomerEmpat(10);

--5.Hapuslah anggota dengan jenis kelamin Laki-laki dari basisdata PERPUSTAKAAN. Akan tetapi jika Anggota tersebut mempunyai STATUS pinjam tidak nol,maka pemain tidak boleh dihapus dari basisdata!--
--jawaban 1--
DELIMITER//
CREATE PROCEDURE nomorLima()
BEGIN
	DECLARE pesan VARCHAR (500);
	DECLARE IdAnggota INT (10);
	SELECT Jenis_Kelamin, Status_Pinjam, IdAnggota FROM anggota;
	IF (Jenis_Kelamin = Lk AND Status_Pinjam = 0) THEN
		DELETE IdAnggota FROM anggota;
		SET pesan = CONCAT (IdAnggota, "telah dihapus");
	ELSE 
		SET pesan = CONCAT( IdAnggota, "anggota memiliki lebih dari 0 status pinjam");
	END IF;
	SELECT pesan;
END//
DELIMITER;
CALL nomorLima;//

--jawaban 2--
DELIMITER //
CREATE PROCEDURE cobalima()
    BEGIN
        DELETE FROM anggota WHERE Jenis_Kelamin = "Lk" AND IdAnggota 
        NOT IN(SELECT IdAnggota FROM peminjaman);
    END//
DELIMITER ;
CALL cobalima();
SELECT*FROM anggota;

