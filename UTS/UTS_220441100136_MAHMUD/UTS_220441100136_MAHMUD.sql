CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE penulis(
idPenulis INT (10) NOT NULL,
NamaPenulis VARCHAR (50) NOT NULL,
Negara VARCHAR (50) NOT NULL,
PRIMARY KEY (idPenulis)
);

CREATE TABLE buku (
id_Buku INT (10) NOT NULL,
Judul VARCHAR(45) NOT NULL,
idPenulis INT (10) NOT NULL,
harga INT (10) NOT NULL,
stok INT(10) NOT NULL,
FOREIGN KEY (idPenulis) REFERENCES penulis(idPenulis),
PRIMARY KEY (id_Buku));

CREATE TABLE penjualan(
id_penjualan INT (10) NOT NULL,
id_Buku INT (10) NOT NULL,
jumlah INT(10) NOT NULL,
Tanggal DATE,
PRIMARY KEY (id_penjualan),
FOREIGN KEY (id_Buku) REFERENCES buku(id_Buku));


INSERT INTO penulis VALUES
(122,'Mahmud','indonesia'),
(123,'Lana','Jepang'),
(124,'Aldo','Indonesia');

INSERT INTO buku VALUES
(123,'Alpro',122,12000,30),
(124,'datamining',123,15000,30),
(125,'smbd',123,15000,30),
(126,'pbo',122,40000,30),
(127,'PBW',124,30000,30);

CREATE VIEW viewBukuPenulis
AS SELECT Judul, harga,stok,NamaPenulis,negara
FROM buku NATURAL JOIN penulis;


SELECT * FROM viewBukuPenulis GROUP BY harga; 

DELIMITER //
CREATE PROCEDURE insertToBuku(
IN id_Buku INT (10),
IN idPenulis INT (10),
IN harga INT (10),
IN stok INT (10),
IN Judul VARCHAR(50),
IN NamaPenulis VARCHAR (35))
BEGIN
INSERT INTO buku VALUES
(id_Buku, Judul, NamaPenulis, idPenulis, harga,stok,);
END //
DELIMITER ;
CALL addData (112, 'APAAJAH', 'Mustar', 133, 12000, 25);
