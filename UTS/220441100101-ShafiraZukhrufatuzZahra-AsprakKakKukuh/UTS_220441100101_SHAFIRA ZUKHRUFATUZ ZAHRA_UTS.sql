--create DATABASE--
CREATE DATABASE toko_buku;
USE toko_buku;


CREATE TABLE IF NOT EXISTS penulis(
id_penulis INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_penulis VARCHAR (30),
negara VARCHAR (30)
);

CREATE TABLE IF NOT EXISTS buku(
id_buku INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
judul_buku VARCHAR (15),
id_penulis INT (15),
harga DECIMAL (10,2),
stok INT (10),
FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

CREATE TABLE IF NOT EXISTS penjualan(
id_penjualan INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_buku INT (10),
tanggal DATE,
jumlah INT (30),
FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
);

--isi DATABASE--
INSERT INTO penulis(nama_penulis, negara) VALUES
('shafira', 'korea'),
('novia', 'indonesia'),
('izzul', 'indonesia'),
('aldi', 'india'),
('amelia', 'malaysia'),
('devi dwi', 'jepang'),
('adelia', 'korea'),
('arum', 'jepang'); 
SELECT * FROM penulis;

INSERT INTO buku (judul_buku, id_penulis, harga, stok) VALUES
('7 prajurit bapak', 4, 32000.00 , 3),
('azzamine', 1, 50000.00 , 5),
('kebebasan finansial', 2, 63000.00 , 8),
('masih belajar', 5, 20000.00 , 1),
('seni hidup tenang', 6, 33000.00 , 7),
('toleransi dan perkauman', 3, 47000.00 , 3),
('seni memahami wanita', 8, 38000.00, 2);
SELECT * FROM buku;

--Buatkanlah sebuah VIEW dengan nama "viewBukuPenulis" yang menampilkan informasi
tentang buku beserta nama penulisnya. VIEW ini harus memiliki--
CREATE VIEW viewBukuPenulis AS
SELECT b.id_buku, b.judul_buku, b.harga, b.stok, p.nama_penulis, p.negara FROM buku b JOIN penulis p ON b.id_penulis = p.id_penulis;
SELECT * FROM viewBukuPenulis;

--Tampilkan 5 DATA pertama dari VIEW “viewBukuPenulis” tersebut dari harga Termurah
ke Termahal--
CREATE VIEW urut AS
SELECT * FROM viewBukuPenulis ORDER BY harga LIMIT 5;
SELECT * FROM urut;

--Buatkanlah STORED PROCEDURE untuk menambahkan DATA pada Tabel Penjualan yang bisa
memeriksa apakah id_buku yang menjadi kunci tamu dari Tabel Buku tersedia. Jika
id_buku TERSEDIA maka lakukan penambahan DATA ke dalam Tabel Penjualan dan
berikan peringatan result QUERY : “Penjualan/Alert berhasil ditambahkan” AS hasil, jika
TIDAK maka tampilkan hasil berupa peringatan “Id Buku Tidak Tersedia. Penjualan
gagal dilakukan!” AS hasil--
DELIMITER //
CREATE PROCEDURE tambah_penjualan(
    IN idbuku INT,
    IN tanggalpenjualan DATE,
    IN jumlahpenjualan INT
)
BEGIN
    DECLARE stok_buku INT;
    SELECT COUNT(*) INTO stok_buku
    FROM buku
    WHERE id_buku = idbuku AND stok >= jumlahpenjualan;
    IF stok_buku > 0 THEN
        INSERT INTO penjualan (id_buku, tanggal, jumlah)
        VALUES (idbuku, tanggalpenjualan, jumlahpenjualan);
        SELECT "Penjualan berhasil ditambahkan" AS hasil;
    ELSE
        SELECT "Id Buku Tidak Tersedia. Penjualan gagal dilakukan!" AS hasil;
    END IF;
END//
DELIMITER ;
CALL tambah_penjualan(1, '2024-05-09', 2);

--Buatkanlah VIEW “penjualanTerbanyak” yang isinya menampilkan judul buku, nama
penulis, total penjualan. Yang mana ketiga kolom tersebut diambil dari masing-masing
tabelnya menggunakan JOIN antar tabel. Lalu, kelompokkan berdasarkan id_buku dan
urutkan berdasarkan jumlah penjualan terbanyak. Tampilkan VIEW nya dengan maksimal
menampilkan 5 baris.--
CREATE VIEW penjualanTerbanyak AS
SELECT b.judul_buku, p.nama_penulis, SUM(pj.jumlah) AS total_penjualan FROM buku b JOIN penulis p ON b.id_penulis = p.id_penulis JOIN penjualan pj ON b.id_buku = pj.id_buku GROUP BY b.id_buku ORDER BY total_penjualan DESC LIMIT 5;
SELECT * FROM penjualanTerbanyak;

--Buatlah STORED PROCEDURE ”insertToBuku” untuk menambahkan buku baru ke dalam sistem dengan harga dan stok awal yang ditentukan. Pastikan untuk memeriksa apakah buku tersebut sudah ada dalam DATABASE sebelum menambahkannya--
DELIMITER //
CREATE PROCEDURE insertToBuku(
    IN judulbuku VARCHAR(255),
    IN idpenulis INT,
    IN hargabuku DECIMAL(10, 2),
    IN stokbuku INT
)
BEGIN
    DECLARE bukutersedia INT;
    SELECT COUNT(*) INTO bukutersedia
    FROM buku
    WHERE judul_buku = judulbuku;

    IF bukutersedia = 0 THEN
        INSERT INTO buku (judul_buku, id_penulis, harga, stok)
        VALUES (judulbuku, idpenulis, hargabuku, stokbuku);
        SELECT "Buku berhasil ditambahkan" AS hasil;
    ELSE
        SELECT "Buku sudah ada dalam database. Penambahan buku dibatalkan." AS hasil;
    END IF;
END//
DELIMITER ;
CALL insertToBuku('Judul Buku Baru', 1, 50000.00, 10);



