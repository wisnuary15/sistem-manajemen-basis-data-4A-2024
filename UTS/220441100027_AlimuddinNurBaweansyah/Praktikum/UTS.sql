create database toko_buku;
use toko_buku;

create table penulis (
IdPenulis int(10) primary key,
nama varchar(12),
negara varchar(12)
);

create table buku (
IdBuku int(10) primary key,
judul varchar(12),
IdPenulis int(10),
harga int(12),
stok int(12)
);

INSERT INTO penulis (IdPenulis, Nama, Negara)
VALUES 
   (001,"Alimuddin","Indonesia"),
   (002,"Rozikhin","Amerika"),
   (003,"Adelia","Belanda");
   
INSERT INTO buku (IdBuku, judul, IdPenulis,harga,stok)
VALUES 
   (100,"Bunga",001,15000,30),
   (200,"Negara",002,12000,20),
   (300,"Binatang",003,10000,12);

create table penjualan (
IdPenjualan int (10) primary key,
IdBuku int (10),
tanggal date,
jumlah int(14)
) ;

ALTER TABLE buku
ADD CONSTRAINT FK_BukuPenulis
FOREIGN KEY (IdPenulis) REFERENCES penulis(IdPenulis);

ALTER TABLE penjualan
ADD CONSTRAINT FK_BukuPenjulan
FOREIGN KEY (IdBuku) REFERENCES Buku(IdBuku);

CREATE VIEW viewBukuPenulis AS
SELECT
    b.judul AS 'Judul Buku',
    b.harga AS 'Harga',
    b.stok AS 'Stok',
    p.nama AS 'Nama Penulis',
    p.negara AS 'Negara Penulis'
FROM
    buku b
JOIN
    penulis p ON b.IdPenulis = p.IdPenulis;
    
    select * from viewbukupenulis;
    
    SELECT *
FROM viewBukuPenulis
ORDER BY Harga
LIMIT 5;


DELIMITER //

CREATE PROCEDURE tambahPenjualan (
    IN idBukuParam INT,
    IN tanggalParam DATE,
    IN jumlahParam INT,
    OUT hasil VARCHAR(100)
)
BEGIN
    DECLARE stokBuku INT;
    
  
    SELECT stok INTO stokBuku FROM buku WHERE IdBuku = idBukuParam;
    
   
    IF stokBuku IS NOT NULL AND stokBuku >= jumlahParam THEN
     
        INSERT INTO penjualan (IdBuku, tanggal, jumlah) VALUES (idBukuParam, tanggalParam, jumlahParam);
        
     
        SET hasil = 'Penjualan/Alert berhasil ditambahkan';
    ELSE
  
        SET hasil = 'Id Buku Tidak Tersedia. Penjualan gagal dilakukan!';
    END IF;
END //

DELIMITER ;
drop procedure tambahpenjualan;

CALL tambahPenjualan(100, '2024-05-10', 2, @hasil);


SELECT @hasil AS 'Hasil';
delete from penjualan;
select * from penjualan;

SET SQL_SAFE_UPDATES = 0;

DELIMITER //

CREATE PROCEDURE insertToBuku (
    IN idBukuParam INT,
    IN judulParam VARCHAR(50),
    IN idPenulisParam INT,
    IN hargaParam INT,
    IN stokParam INT,
    OUT hasil VARCHAR(100)
)
BEGIN
    DECLARE bukuExist INT;
    
    -- Periksa apakah buku dengan idBukuParam sudah ada dalam database
    SELECT COUNT(*) INTO bukuExist FROM buku WHERE IdBuku = idBukuParam;
    
    -- Jika buku sudah ada, tampilkan pesan kesalahan
    IF bukuExist > 0 THEN
        SET hasil = 'Buku dengan ID tersebut sudah ada dalam database. Penambahan gagal.';
    ELSE
        -- Jika buku belum ada, tambahkan buku baru ke dalam tabel Buku
        INSERT INTO buku (IdBuku, judul, IdPenulis, harga, stok) 
        VALUES (idBukuParam, judulParam, idPenulisParam, hargaParam, stokParam);
        
        SET hasil = 'Buku berhasil ditambahkan ke dalam sistem.';
    END IF;
END //

DELIMITER ;

CALL insertToBuku(101, 'Buku Baru', 1, 20000, 50, @hasil);

SELECT @hasil AS 'Hasil';


