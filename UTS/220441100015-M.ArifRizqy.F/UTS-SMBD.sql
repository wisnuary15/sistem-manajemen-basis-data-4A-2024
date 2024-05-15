-- ---------------------------------------------------
-- DDL - Data Definition Language
-- ---------------------------------------------------

CREATE DATABASE toko_buku;

USE toko_buku;

CREATE TABLE tb_penulis (
   id_penulis INT NOT NULL AUTO_INCREMENT,
   nama VARCHAR(50) NOT NULL,
   negara VARCHAR(30) NOT NULL,
   PRIMARY KEY (id_penulis)
) ENGINE = InnoDB;


CREATE TABLE tb_buku (
  id_buku INT NOT NULL AUTO_INCREMENT,
  id_penulis INT NOT NULL,
  judul VARCHAR(100) NOT NULL,
  harga INT NOT NULL,
  stok INT NOT NULL,
  PRIMARY KEY (id_buku)
) ENGINE = InnoDB;


CREATE TABLE penjualan (
  id_penjualan INT NOT NULL AUTO_INCREMENT,
  id_buku INT NOT NULL,
  tgl DATE NOT NULL,
  jumlah INT NOT NULL,
  PRIMARY KEY (id_penjualan)
) ENGINE = InnoDB;

ALTER TABLE penjualan
   ADD KEY fk_penjualan_buku (id_buku);

-- ---------------------------------------------------
-- DML - Data Manipulation Language
-- ---------------------------------------------------

INSERT INTO tb_penulis (nama, negara)
  VALUES 
    ('Agatha Christie', 'Inggris'),
    ('J.K. Rowling', 'Inggris'),
    ('Ernest Hemingway', 'Amerika Serikat'),
    ('Gabriel García Márquez', 'Kolombia'),
    ('Haruki Murakami', 'Jepang'),
    ('George Orwell', 'Inggris'),
    ('Jane Austen', 'Inggris'),
    ('Leo Tolstoy', 'Rusia'),
    ('Fyodor Dostoevsky', 'Rusia'),
    ('Chinua Achebe', 'Nigeria');

INSERT INTO tb_buku (id_penulis, judul, harga, stok)
  VALUES 
    (1, 'Murder on the Orient Express', 50000, 10),
    (2, "Harry Potter and the Sorcerer's Stone", 75000, 15),
    (3, 'The Old Man and the Sea', 60000, 8),
    (4, 'One Hundred Years of Solitude', 55000, 7),
    (5, 'Norwegian Wood', 65000, 12),
    (6, '1984', 50000, 9),
    (7, 'Pride and Prejudice', 70000, 14),
    (8, 'War and Peace', 80000, 6),
    (9, 'Crime and Punishment', 70000, 10),
    (10, 'Things Fall Apart', 65000, 8);

INSERT INTO penjualan (id_buku, tgl, jumlah)
  VALUES
    (1, '2024-05-01', 2),
    (2, '2024-05-02', 3),
    (3, '2024-05-03', 4),
    (4, '2024-05-04', 1),
    (5, '2024-05-05', 5),
    (6, '2024-05-06', 2),
    (7, '2024-05-07', 3),
    (8, '2024-05-08', 4),
    (9, '2024-05-09', 2),
    (10, '2024-05-10', 5),
    (1, '2024-05-11', 4),
    (2, '2024-05-12', 3),
    (3, '2024-05-13', 2),
    (4, '2024-05-14', 4),
    (5, '2024-05-15', 2),
    (6, '2024-05-16', 5),
    (7, '2024-05-17', 1),
    (8, '2024-05-18', 3),
    (9, '2024-05-19', 4),
    (10, '2024-05-20', 2);

-- ---------------------------------------------------
-- UTS
-- ---------------------------------------------------

CREATE VIEW vw_buku_penulis AS
  SELECT judul judul_buku, harga, stok, nama nama_penulis, negara negara_penulis
    FROM tb_buku
    JOIN tb_penulis
      ON tb_buku.id_penulis = tb_penulis.id_penulis;

SELECT * FROM vw_buku_penulis;

SELECT * FROM vw_buku_penulis ORDER BY harga ASC LIMIT 5;

CREATE PROCEDURE add_penjualan(IN kode_buku INT, IN tgl_jual DATE, IN qty INT)
BEGIN
  DECLARE result TEXT;
  
  IF (SELECT id_buku FROM tb_buku WHERE id_buku = kode_buku) THEN
    INSERT INTO penjualan (id_buku, tgl, jumlah)
    VALUES
      (kode_buku, tgl_jual, qty);

    SET result = 'Penjualan Berhasil ditambahkan';
  ELSE
    SET result = 'Kode buku tidak ditemukan';
  END IF;

  SELECT result;
END;

CALL add_penjualan(2, '2024-05-02', 3);

DROP PROCEDURE add_penjualan;

CREATE VIEW vw_penjualan_terbanyak AS
  SELECT judul judul_buku, nama nama_penulis, SUM(jumlah) total_penjualan
    FROM penjualan
    JOIN tb_buku
      ON penjualan.id_buku = tb_buku.id_buku
    JOIN tb_penulis
      ON tb_buku.id_penulis = tb_penulis.id_penulis
    GROUP BY judul_buku, nama_penulis
    ORDER BY total_penjualan DESC
    LIMIT 5;

SELECT * FROM vw_penjualan_terbanyak;

CREATE PROCEDURE insert_to_buku(IN judul_buku VARCHAR(100), IN kode_penulis INT)
BEGIN
  DECLARE result TEXT;
  
  IF 
    (SELECT judul FROM tb_buku WHERE judul = judul_buku)
    AND
    (SELECT id_penulis FROM tb_buku WHERE id_penulis = kode_penulis)
  THEN
    SET result = 'Buku sudah ada';
  ELSE
    INSERT INTO tb_buku (id_penulis, judul, harga, stok)
      VALUES
        (kode_penulis, judul_buku, 100000, 10);
    
    SET result = 'Buku berhasil ditambahkan';
  END IF;
  
  SELECT result;
END;

CALL insert_to_buku('The Old Man and the Sea', 3);

DROP PROCEDURE insert_to_buku;
