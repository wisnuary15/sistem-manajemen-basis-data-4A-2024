CREATE DATABASE toko_buku;

USE toko_buku;

CREATE TABLE penulis(
id_penulis INT (3) PRIMARY KEY NOT NULL,
nama_penulis VARCHAR (15) NOT NULL,
negara VARCHAR (15) NOT NULL
);

CREATE TABLE buku(
id_buku INT (3) PRIMARY KEY NOT NULL,
id_penulis INT (3) NOT NULL,
judul VARCHAR (15) NOT NULL,
harga INT (3) NOT NULL,
stok INT (3) NOT NULL
);
ALTER TABLE toko_buku.buku ADD CONSTRAINT fk_penulis FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis);


CREATE TABLE penjualan(
id_penjualan INT (3) PRIMARY KEY NOT NULL,
id_buku INT (3) NOT NULL,
tanggal DATE,
jumlah INT (3) NOT NULL
);
ALTER TABLE toko_buku.penjualan ADD CONSTRAINT fk_buku FOREIGN KEY (id_buku) REFERENCES buku(id_buku);



INSERT INTO penulis (id_penulis, nama_penulis, negara) VALUES
(1,'Rayhan','Indonesia'),
(2,'Sigma','portugal'),
(3,'Rafly','Jerman');


INSERT INTO buku (id_buku,id_penulis,judul,harga, stok) VALUES
(1,1,'Perjalanan seru',30000,3),
(2,2,'Gua Hantu',35000,2),
(3,3,'gen Z',40000,2);

INSERT INTO penjualan (id_penjualan,id_buku,tanggal, jumlah) VALUES
(1,1,'2022-05-17',2),
(2,2,'2022-05-30',1),
(3,3,'2022-05-25',2);


-- Soal2
CREATE VIEW viewBukuPenulis AS 
SELECT c.judul, c.harga, c.stok, d.nama_penulis, d.negara 
FROM buku c 
JOIN penulis d ON c.id_penulis = d.id_penulis  ;

-- soal3
CREATE VIEW viewBukuPenuliss
 AS SELECT g.nama_penulis,COUNT(h.harga)AS
Harga FROM penulis g INNER JOIN buku h ON g.id_penulis = h.id_penulis
ORDER BY Harga DESC ;



