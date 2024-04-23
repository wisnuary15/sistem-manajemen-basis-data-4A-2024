-- Tugas Challenge (Asistensi Modul 2) --

CREATE DATABASE gudanglab;
USE gudanglab;

CREATE TABLE barang(
idBarang INT(2) AUTO_INCREMENT PRIMARY KEY,
namaBarang VARCHAR (10) NOT NULL,
jumlahBarang INT(2) NOT NULL
);

CREATE TABLE transaksi(
tglTransaksi DATE,
idTransaksi INT(3) AUTO_INCREMENT PRIMARY KEY,
idBarang INT(2),
keterangan VARCHAR (6)
);

ALTER TABLE transaksi ADD CONSTRAINT fktransaksi FOREIGN KEY (idBarang) REFERENCES barang(idBarang);

INSERT INTO barang (namaBarang,jumlahBarang) VALUES
('HDMI',5),
('Penghapus',6),
('Komputer',24),
('Mouse',15),
('Proyektor',3);
SELECT * FROM barang;

INSERT INTO transaksi (tglTransaksi,idBarang,keterangan) VALUES
('2024-01-01',1,'Keluar'),
('2024-01-02',1,'Keluar'),
('2024-01-02',1,'Keluar'),
('2024-01-02',2,'Keluar'),
('2024-01-02',2,'Keluar'),
('2024-01-03',3,'Masuk'),
('2024-01-03',4,'Keluar'),
('2024-01-04',1,'Masuk'),
('2024-01-04',1,'Masuk'),
('2024-01-04',2,'Keluar');
SELECT * FROM transaksi;

CREATE VIEW vw_detail AS
SELECT a.namaBarang AS Nama, b.keterangan AS Transaksi, 
    CONCAT(COUNT(b.keterangan), ' pcs') AS Jumlah
FROM barang a 
JOIN transaksi b ON a.idBarang = b.idBarang
GROUP BY a.namaBarang, b.keterangan;

SELECT * FROM vw_detail;