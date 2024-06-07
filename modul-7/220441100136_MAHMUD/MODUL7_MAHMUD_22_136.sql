CREATE DATABASE Rental_Mobil;
USE Rental_Mobil;

CREATE TABLE mobil(
id_mobil VARCHAR(10),
platno VARCHAR(15),
merk VARCHAR(20),
jenis VARCHAR(20),
harga_sewa_harian INT (10),
PRIMARY KEY (id_mobil)
);

CREATE TABLE pelanggan(
id_pelanggan VARCHAR(10),
nama VARCHAR(20),
alamat VARCHAR(10),
nik INT(20),
telp INT(15),
jenis_kelamin VARCHAR(10),
PRIMARY KEY (id_pelanggan)
);

CREATE TABLE peminjaman(
id_peminjaman VARCHAR(10),
id_mobil VARCHAR(10),
id_pelanggan VARCHAR(10),
tgl_pinjam DATE,
tgl_rencana_kembali DATE,
total_hari INT(10),
total_bayar VARCHAR(20),
tgl_kembali DATE,
denda VARCHAR(20),
PRIMARY KEY (id_peminjaman)
);

INSERT INTO mobil VALUES 
('001','m 111 ab','hrv','Sport Utility Vehicle','1.500.000'),
('002','m 112 ac','Xpander','mpv','2.500.000'),
('003','m 113 ad','Fortuner','Sport Utility Vehicle','2.500.000'),
('004','m 114 ae','Pajero','Sport Utility Vehicle','1.500.000'),
('006','m 115 af','Alphard','Minivan','3.500.000'),
('007','m 116 ag','macedes bens','mpv','4.500.000');
SELECT * FROM mobil;

INSERT INTO pelanggan VALUES 
('100','hendrawan','lampung',220011,083830997137,'laki-laki'),
('101','maulana','bojonegoro',220011,083830997131,'laki-laki'),
('103','isma','jombang',220011,08383099712,'perempuan'),
('104','putry dwi','lamongan',220011,083830997133,'perempuan'),
('105','rina','kediri',220011,083830997134,'perempuan'),
('106','herman','tuban',220011,083830997135,'laki-laki'),
('107','iskandar','surabaya',220011,083830997136,'laki-laki');
SELECT * FROM pelanggan;

INSERT INTO peminjaman VALUES 
('201','001','100','2024-04-04',2024-04-06,2,'3.000.000','2023-04-07','200.000'),
('202','002','101','2024-05-06',2024-05-08,2,'5.000.000','2023-05-08','0'),
('203','003','103','2024-05-25',2024-05-28,2,'5.000.000','2023-05-28','0'),
('204','004','104','2024-06-04',2024-06-06,2,'3.000.000','2023-06-07','200.000'),
('205','006','105','2024-06-10',2024-06-12,2,'7.000.000','2023-06-13','200.000'),
('206','007','106','2024-06-20',2024-06-22,2,'9.000.000','2023-06-022','0');

SELECT * FROM peminjaman;

-- no 1 --
DELIMITER //
CREATE TRIGGER cek_tgl BEFORE INSERT ON peminjaman
FOR EACH ROW 
        BEGIN 
                IF (new.tgl_pinjam > new.tgl_rencana_kembali) THEN
                        SIGNAL SQLSTATE '45000'
                        SET MESSAGE_TEXT='Tanggal rencana kembali lebih awal dari tanggal pinjam !!';
                END IF;
        END //
DELIMITER ;

-- tgl_rencana_kembali > awal dari tgl_pinjam
INSERT INTO peminjaman VALUE("pmj06","06","a06","2024-08-22","2024-08-24",2,1000000,"2024-08-25",300000);

SELECT * FROM peminjaman;

-- no 2 --
CREATE TABLE update_peminjaman (
  Id_Pinjam VARCHAR(11) NOT NULL,
  Total_Hari INT(11) NOT NULL,
  Total_Bayar INT(11) DEFAULT NULL,
  Tgl_Kembali DATE DEFAULT NULL,
  Denda INT(11) DEFAULT NULL,
  PRIMARY KEY (Id_Pinjam)
  );

DELIMITER //
  CREATE TRIGGER update_pengembalian AFTER INSERT ON update_peminjaman FOR EACH ROW
  BEGIN
          UPDATE peminjaman SET total_hari = new.total_hari, total_bayar = new.total_bayar,
          tgl_kembali = new.tgl_kembali, denda = new.denda WHERE id_peminjaman = new.Id_Pinjam;
END //
DELIMITER ;

INSERT INTO update_peminjaman VALUE("pmj02",3,1200000, "2023-05-30",200000);
SELECT * FROM update_peminjaman;
INSERT INTO update_peminjaman VALUE("pmj03",2,1000000, "2023-02-25", 250000);
SELECT * FROM update_peminjaman;


-- no 3 --
DELIMITER // 
CREATE TRIGGER cek_nik
        BEFORE INSERT ON pelanggan
   FOR EACH ROW
   BEGIN
       IF (new.nik REGEXP '[a-zA-Z]') OR (new.nik NOT REGEXP '[0-9]') OR (LENGTH(new.nik)<10)
       THEN SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT ="Panjang NIK harus sesuai dengan aturan yg berlaku !!";
END IF;
END //
DELIMITER ;

INSERT INTO pelanggan VALUES('108','Putry','mdr','64234567','0896789054','L');
INSERT INTO pelanggan VALUES('109','Yuni','gsk','64523890','0896789054','P');
INSERT INTO pelanggan VALUE('110','Andre','gsk','6456789023671','0852322303','P');
SELECT * FROM pelanggan;

-- no 4 --
DELIMITER //
CREATE TRIGGER validasi_platno 
        BEFORE INSERT ON mobil 
  FOR EACH ROW 
  BEGIN
     IF (new.platno NOT REGEXP '[a-zA-Z]') 
     THEN SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = "1/2 karakter awal plat nomor harus huruf !";
END IF;
END // 
DELIMITER ;

INSERT INTO mobil VALUE('06','22345','Ferarri', 'EXTRA', 5000000);
INSERT INTO mobil VALUE('06','JK 5544 DDN','Honda', 'Pajero', 5000000);
SELECT * FROM mobil;
DROP DATABASE Rental_Mobil;          