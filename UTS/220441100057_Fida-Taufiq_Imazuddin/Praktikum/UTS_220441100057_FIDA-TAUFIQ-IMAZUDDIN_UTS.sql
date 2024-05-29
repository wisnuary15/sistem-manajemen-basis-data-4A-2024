-- 1. ------------------------------------------------------------------------
CREATE DATABASE toko_buku;
USE toko_buku;

CREATE TABLE Penulis (
	 id_penulis INT PRIMARY KEY AUTO_INCREMENT,
	 nama VARCHAR (80),
	 negara VARCHAR (80)
	 
);

CREATE TABLE Buku (
	id_buku INT PRIMARY KEY AUTO_INCREMENT,
	judul VARCHAR (80),
	id_penulis INT,
	harga INT,
	stok INT	
);
ALTER TABLE Buku ADD CONSTRAINT pemilikbuku FOREIGN KEY (id_penulis) REFERENCES Penulis (id_penulis);

CREATE TABLE Penjualan (
	id_penjualan INT PRIMARY KEY AUTO_INCREMENT,
	id_buku INT,
	tanggal DATE,
	jumlah INT
);
ALTER TABLE Penjualan ADD CONSTRAINT penjualanbuku FOREIGN KEY (id_buku) REFERENCES Buku (id_buku);


INSERT INTO Penulis (nama, negara)VALUES
('Budi','Singapore'),
('Hartono','Indonesia'),
('Anton','Indonesia'),
('Max Vrestappen','Belanda');

INSERT INTO Penulis (nama, negara)VALUES
('Wulan','Singapore'),
('Andi','Indonesia');

SELECT * FROM Penulis;

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Buku Baik',1,80000,20),
('Buku A',2,75000,50),
('Buku B',3,100000,22),
('Buku C',4,50000,10);

INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES
('Buku D',5,90000,25),
('Buku E',6,10000,54);

SELECT * FROM Buku;

-- 2. ------------------------------------------------------------------------
CREATE VIEW viewBukuPenulis AS
SELECT b.judul AS judul_buku,
b.harga, b.stok,
p.nama AS nama_penulis,
p.negara AS negara_penulis
FROM Buku AS b
JOIN Penulis AS p ON b.id_penulis = p.id_penulis;

SELECT * FROM viewBukuPenulis;


-- 3. ------------------------------------------------------------------------
SELECT * FROM viewBukuPenulis
ORDER BY harga ASC
LIMIT 5;

-- 4. ------------------------------------------------------------------------
DELIMITER//
CREATE PROCEDURE tambahPenjualan (
	IN kode_buku INT,
	IN tanggalpenjualan DATE,
	IN jumlahpenjualan INT,
	OUT hasil VARCHAR (100)
	)
BEGIN
END//
DELIMITER;

-- 5. ------------------------------------------------------------------------


-- 6. ------------------------------------------------------------------------
DELIMITER//
CREATE PROCEDURE insertToBuku(
	IN judul_buku VARCHAR(80),
	IN kode_penulis INT,
	IN harga_buku INT,
	IN stok_buku INT,
	OUT hasil VARCHAR(100))
BEGIN
	DECLARE buku_ada INT;
	
	SELECT COUNT(*) INTO buku_ada FROM Buku WHERE judul = judul_buku;
	
	IF buku_ada > 0 THEN
		SET hasil ='gagal ditambahkan';
	ELSE
		INSERT INTO Buku (judul, id_penulis, harga, stok) VALUES (judul_buku,kode_penulis,harga_buku,stok_buku);
		SET hasil ='berhasil ditambahkan';
		
	END IF;
END//
DELIMITER;

CALL insertToBuku('Buku AAA', 1, 97000, 8, @hasil);
SELECT @hasil;

SELECT * FROM Buku;



