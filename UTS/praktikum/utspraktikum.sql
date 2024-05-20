CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE IF NOT EXISTS penulis(
id_penulis INT(10) PRIMARY KEY NOT NULL,
nama VARCHAR(30) NOT NULL,
negara VARCHAR(30) NOT NULL
);

DESC penulis;


CREATE TABLE IF NOT EXISTS buku(
id_buku INT(10) PRIMARY KEY NOT NULL,
judul VARCHAR(30) NOT NULL,
id_penulis INT(10) NOT NULL,
harga INT(30) NOT NULL,
stok INT(30) NOT NULL,
FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis)
);

DROP TABLE buku;
DESC buku;

CREATE TABLE IF NOT EXISTS penjualan(
id_penjualan INT(10) PRIMARY KEY NOT NULL,
id_buku INT(10) NOT NULL,
tanggal DATE NOT NULL,
jumlah INT(30) NOT NULL,
FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);

INSERT INTO penulis VALUES 
(201, 'agung', 'indonesia'),
(202,'wahyu', 'inggris'),
(203,'dinda', 'jerman'),
(204, 'della', 'malaysia'),
(205,'rina', 'korea'),
(206,'lala', 'jepang');


INSERT INTO buku VALUES 
(301, 'kartika', 201, 20000, 5),
(302, 'bumi', 202, 50000, 5),
(303, 'manusia', 203, 70000, 7),
(304, 'cinta', 204, 80000, 4),
(305, 'dunia', 205, 90000, 8),
(306, 'malam', 206, 10000, 9);

-- no 2

CREATE VIEW viewBukuPenulis AS
SELECT b.judul, b.harga, b.stok, p.nama, p.negara, COUNT(*) AS data_buku_penulis
FROM buku b JOIN penulis p ON b.id_penulis = p.id_penulis
GROUP BY b.judul, b.harga, b.stok, p.nama, p.negara;

SELECT * FROM viewBukuPenulis;

-- no 3
CREATE VIEW viewBukuPenulis3 AS
SELECT b.judul, b.harga, b.stok, p.nama, p.negara, COUNT(*) AS data_buku_penulis
FROM buku b JOIN penulis p ON b.id_penulis = p.id_penulis
GROUP BY b.judul, b.harga, b.stok, p.nama, p.negara
ORDER BY harga ASC
LIMIT 5;


SELECT * FROM viewBukuPenulis3;

-- no 4

DELIMITER $$

CREATE PROCEDURE TambahdataPenjualan(
    IN in_id_penjualan INT,
    IN in_id_buku INT,
    IN in_tanggal DATE,
    IN in_jumlah INT
)
BEGIN
  
    DECLARE buku_tersedia INT;
    
    SELECT COUNT(*) INTO buku_tersedia
    FROM buku
    WHERE id_buku = in_id_buku;

    IF buku_tersedia > 0 THEN
       
        INSERT INTO penjualan (id_penjualan, id_buku, tanggal, jumlah)
        VALUES (in_id_penjualan, in_id_buku, in_tanggal, in_jumlah);
        
        SELECT 'alert berhasil ditambahkn' AS hasil;
    ELSE
       
        SELECT 'Id Buku Tidak Tersedia. Penjualn gagal dilakukan' AS hasil;
    END IF;
END$$

DELIMITER ;

CALL TambahdataPenjualan(101, 301, '2024-05-08', 3);
CALL TambahdataPenjualan(102, 302, '2024-04-07', 4);
CALL TambahdataPenjualan(103, 303, '2024-06-06', 6);
CALL TambahdataPenjualan(104, 304, '2024-08-05', 8);
CALL TambahdataPenjualan(105, 305, '2024-09-03', 9);


-- no 6

DELIMITER //
	CREATE PROCEDURE insert_buku (
		IN id_bk INT (10), 
		IN jdl VARCHAR (15),
		IN id_pnls INT (15),
		IN harga INT (15),
		IN stok INT (15))
	BEGIN 
	INSERT INTO buku VALUES (id_bk, jdl, id_pnls, harga, stok);
	END //
DELIMITER;

CALL insert_petugas (225, 'mimpiku', 333, 10000, 6);

