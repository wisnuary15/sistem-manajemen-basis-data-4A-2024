/*Nomor 1*/
CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE penulis(
id_penulis INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama VARCHAR(25) NOT NULL,
negara VARCHAR(25) NOT NULL);

CREATE TABLE buku(
id_buku INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_penulis INT(100) NOT NULL,
judul VARCHAR(25) NOT NULL,
harga INT(100) NOT NULL,
stok INT(100) NOT NULL,
FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis));

CREATE TABLE penjualan(
id_penjualan INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_buku INT(100) NOT NULL,
tanggal DATE,
jumlah INT(100) NOT NULL,
FOREIGN KEY (id_buku) REFERENCES buku(id_buku));

INSERT INTO penulis(nama, negara) VALUES
("Devi", "Indonesia"),
("Dwi", "Jepang"),
("Novi", "Korea"),
("Sari", "Brazil"),
("Arvan", "India"),
("Akhdan", "Singapura"),
("Dedy", "Malaysia");
SELECT * FROM penulis;

INSERT INTO buku(id_penulis, judul, harga, stok) VALUES
(1, "Laskar Pelangi", 25000, 4),
(2, "Bintang Jatuh", 30000, 10),
(3, "Semua sudah berlalu", 20000, 5),
(4, "Apakah kmu?", 50000, 8),
(1, "Langit Biru", 30000, 9),
(1, "Hujan Debu", 45000, 4),
(6, "Badai Telah Lalu", 50000, 6);
SELECT * FROM buku;

INSERT INTO penjualan(id_buku, tanggal, jumlah) VALUES
(1, "2024-09-18", 1),
(3, "2024-06-11", 2),
(2, "2024-10-18", 3),
(1, "2024-01-18", 1),
(6, "2024-02-10", 2),
(7, "2024-03-12", 1),
(4, "2024-04-16", 1);
SELECT * FROM penjualan;

/*Nomor 2*/
CREATE VIEW viewBukuPenulis AS
SELECT buku.judul AS Judul, buku.harga AS Harga, buku.stok AS Stok, penulis.nama AS Nama_Penulis, penulis.negara AS Negara_Asal_Penulis
FROM buku JOIN penulis ON buku.id_penulis = penulis.id_penulis;
SELECT * FROM viewBukuPenulis;

/*Nomor 3*/
SELECT * FROM viewBukuPenulis ORDER BY Harga LIMIT 7;

/*Nomor 4*/
DELIMITER //
CREATE PROCEDURE menambah_penjualan(IN no_buku INT, IN jumlah_buku INT)
BEGIN
    DECLARE stok_buku INT;

    SELECT stok INTO stok_buku FROM buku WHERE id_buku = no_buku;

    IF stok_buku >= jumlah_buku THEN
        INSERT INTO penjualan (id_buku, tanggal, jumlah) VALUES (no_buku, CURDATE(), jumlah_buku);
        UPDATE buku SET stok = stok - jumlah_buku WHERE id_buku = no_buku;
        SELECT "Penjualan/Alert berhasil ditambahkan" AS hasil;
    ELSE
        SELECT "Id Buku Tidak Tersedia. Penjualan gagal dilakukan!" AS hasil;
    END IF;
END //
DELIMITER ;
CALL menambah_penjualan (1, 2);

/*Nomor 5*/
CREATE VIEW penjualanTerbanyak AS
	SELECT buku.judul AS Judul, penulis.nama AS Nama_Penulis, SUM(penjualan.jumlah) AS Total
	FROM penjualan JOIN buku ON penjualan.id_buku = buku.id_buku JOIN penulis ON buku.id_penulis = penulis.id_penulis
	GROUP BY penjualan.id_buku
	ORDER BY SUM(penjualan.jumlah) DESC
LIMIT 7;
SELECT * FROM penjualanTerbanyak;

/*Nomor 6*/
DELIMITER //
CREATE PROCEDURE insertToBuku(
    IN Judul_Buku VARCHAR(255),
    IN No_Penulis INT,
    IN Harga_Buku INT,
    IN Stok_Buku INT
)
BEGIN
    DECLARE nomor INT;
    SELECT id_buku INTO nomor FROM buku WHERE judul = Judul_Buku AND id_penulis = No_Penulis;
    IF nomor IS NULL THEN
        INSERT INTO buku (judul, id_penulis, harga, stok) VALUES (Judul_Buku, No_Penulis, Harga_Buku, Stok_Buku);
        SELECT "Buku ditambahkan!" AS hasil;
    ELSE
        SELECT "Buku sudah ada!" AS hasil;
    END IF;
END //
DELIMITER ;
CALL insertToBuku ("Jangan Sakit", 2, 70000, 10);
SELECT * FROM buku;
