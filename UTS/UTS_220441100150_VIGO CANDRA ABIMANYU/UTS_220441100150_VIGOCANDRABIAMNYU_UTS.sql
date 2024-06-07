CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE penulis(
id_penulis INT(10) NOT NULL,
nama VARCHAR (25) NOT NULL,
negara VARCHAR (30) NOT NULL,
PRIMARY KEY (id_penulis)
);

CREATE TABLE buku(
id_buku INT(10) NOT NULL,
judul VARCHAR (25) NOT NULL,
id_penulis INT (10) NOT NULL,
harga INT(20) NOT NULL,
stok INT(10) NOT NULL,
PRIMARY KEY (id_buku),
FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

CREATE TABLE penjualan(
id_penjualan INT(10) NOT NULL,
id_buku INT(10) NOT NULL,
tanggal DATE NOT NULL,
jumlah INT(20) NOT NULL,
PRIMARY KEY (id_penjualan),
FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);



ALTER TABLE toko_buku.buku ADD CONSTRAINT fk_id_penulis FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis);
ALTER TABLE toko_buku.penjualan ADD CONSTRAINT fk_id_buku FOREIGN KEY (id_buku) REFERENCES buku(id_buku);



INSERT INTO penulis VALUES
(001,'vigo','indonesia'),
(002,'lifi','malaysia'),
(105,'dhea', 'brunei'),
(106,'dhita', 'singapura')
;

SELECT *FROM  buku;

INSERT INTO buku VALUES
(121,'bumi',001,20000,5),
(122,'langit indah',002,10000,6),
(123,'muara pusaka', 105,50000,7),
(124,'siksa neraka', 106,25000,8)
;



INSERT INTO penjualan VALUES
(1215,121,'2024-09-07',4),
(1226,122,'2024-09-08',3),
(1237,123, '2024-09-09',2),
(1248,124, '2024-09-10',1)
;




CREATE VIEW viewBukuPenulis AS
SELECT a.judul, a.harga, a.stok, b.nama,b.negara
FROM buku a JOIN penulis b ON a.id_penulis = b.id_penulis
GROUP BY a.judul, a.harga, a.stok, b.nama,b.negara;

SELECT * FROM viewBukuPenulis



CREATE VIEW viewpenjualanTerbanyak5 AS
SELECT a.judul, c.id_buku, b.nama,COUNT(c.id_buku) AS jumlah_peminjaman
FROM buku a JOIN penulis b JOIN penjualan c ON a.id_penulis = b.id_penulis AND a.id_buku = c.id_buku
GROUP BY c.id_buku
HAVING COUNT(*) > 5;

SELECT * FROM viewpenjualanTerbanyak5



DELIMITER //
CREATE PROCEDURE insertobuku(
 
   IN id_buku INT(10) NOT NULL,
IN judul VARCHAR (25) NOT NULL,
IN id_penulis INT (10) NOT NULL,
IN harga INT(20) NOT NULL,
IN stok INT(10) NOT NULL

    )
BEGIN
	INSERT INTO buku
    VALUES (id_buku, judul, id_penulis, harga,stok);
END //
DELIMITER ;
CALL insertobuku(2222, 'yang indah', 001, 50000,2);



