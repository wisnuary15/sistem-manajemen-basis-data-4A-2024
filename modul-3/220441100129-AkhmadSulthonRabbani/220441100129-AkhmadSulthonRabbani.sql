CREATE SCHEMA perpustakaan;


DROP SCHEMA perpustakaan;

USE perpustakaan;

CREATE TABLE buku (
    Kode_Buku VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Judul_Buku VARCHAR(250) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Pengarang_Buku VARCHAR(300) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Penerbit_Buku VARCHAR(300) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Tahun_Buku VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Jumlah_Buku VARCHAR(50) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Status_Buku VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Klasifikasi_Buku VARCHAR(200) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    PRIMARY KEY (Kode_Buku)
);

CREATE TABLE petugas (
    `IdPetugas` VARCHAR(200) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    `Username` VARCHAR(200) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    `Password` VARCHAR(100) NOT NULL,
    `Nama` VARCHAR(250) NOT NULL DEFAULT 'ANONYMOUS',
    PRIMARY KEY (IdPetugas)
);

CREATE TABLE anggota (
    IdAnggota VARCHAR(250) NOT NULL DEFAULT 'Tidak Terdentifikasi',
    Nama_Anggota VARCHAR(250) NOT NULL DEFAULT 'Tidak Terdentifikasi',
    Angkatan_Anggota VARCHAR(250) NOT NULL DEFAULT 'Tidak Terdentifikasi',
    Tempat_Lahir_Anggota VARCHAR(250) NOT NULL DEFAULT 'Tidak Terdentifikasi',
    Tanggal_Lahir_Anggota DATE,
    No_Telp VARCHAR(20) NOT NULL DEFAULT '08-----------',
    Jenis_Kelamin VARCHAR(100) NOT NULL DEFAULT 'Tidak Ingin Menyebutkan',
    Status_Pinjam VARCHAR(150) NOT NULL DEFAULT 'Aktif',
    PRIMARY KEY (IdAnggota)
);

-- ALTER TA10E anggota MODIFY COLUMN No_Telp VARCHAR(100);

CREATE TABLE pengembalian (
    Kode_Kembali VARCHAR(100) NOT NULL DEFAULT 'Tidak Terdentifikasi',
    IdAnggota VARCHAR(250) NOT NULL DEFAULT 'Tidak Teridenfikasi',
    Kode_Buku VARCHAR(100) NOT NULL DEFAULT 'Tidak Teidentifikasi',
    IdPetugas VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Tgl_Pinjam DATE,
    Tgl_Kembali DATE,
    Denda VARCHAR(150) NOT NULL DEFAULT 'Tidak Boleh Meminjam Buku Selama 1 Bulan',
    PRIMARY KEY(Kode_Kembali),
    
    CONSTRAINT FK_BukuDikembalikan 
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    
    CONSTRAINT FK_PetugasPengembalian 
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    
    CONSTRAINT FK_AnggotaKembali 
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota) 
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    IdAnggota VARCHAR(250) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    IdPetugas VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR(100) NOT NULL DEFAULT 'Tidak Teridentifikasi',
    PRIMARY KEY(Kode_Peminjaman),
    
    CONSTRAINT FK_BukuDipinjam 
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    
    CONSTRAINT FK_PetugasPeminjaman 
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    
    CONSTRAINT FK_AnggotaPinjam 
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota) 
    ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES 
    ('10001', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Press', '2008', 5, 'Tersedia', 'Fiksi'),
    ('10002', 'Harry Potter and the Philosopher Stone', 'J.K. Rowling', '10oomsbury', '1997', 3, 'Dipinjam', 'Fiksi'),
    ('10003', 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', 2, 'Tersedia', 'Fiksi'),
    ('10004', 'Percy Jackson & the Olympians: The Lightning Thief', 'Rick Riordan', 'Miramax Books', '2005', 6, 'Tersedia', 'Fiksi'),
    ('10005', 'The Da Vinci Code', 'Dan Brown', 'Dou10eday', '2003', 1, 'Dipinjam', 'Fiksi'),
    ('10006', 'The Chronicles of Narnia: The Lion, The Witch and The Wardrobe', 'C.S. Lewis', 'Geoffrey 10es', '1950', 4, 'Tersedia', 'Fiksi'),
    ('10007', 'Animal Farm', 'George Orwell', 'Secker and Warburg', '1945', 8, 'Tersedia', 'Fiksi'),
    ('10008', '1984', 'George Orwell', 'Secker and Warburg', '1949', 7, 'Tersedia', 'Fiksi'),
    ('10009', 'The Lord of The Rings: The Fellowship of The Ring', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', 3, 'Dipinjam', 'Fiksi'),
    ('10010', 'The Catcher in The Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', 2, 'Tersedia', 'Fiksi');

SELECT * FROM buku;

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES 
    ("200001", 'Budi Santoso', '2018', 'Jakarta', '1998-05-10', '08123456789', 'L', 'Aktif'),
    ("200002", 'Dewi Rahayu', '2019', 'Bandung', '1999-07-15', '08234567890', 'P', 'Aktif'),
    ("200003", 'Rudi Hartono', '2020', 'Surabaya', '2000-02-23', '08345678901', 'L', 'Aktif'),
    ("200004", 'Siti Nurul Aini', '2021', 'Yogyakarta', '2001-09-30', '08456789012', 'P', 'Aktif'),
    ("200005", 'Yuni Indah', '2018', 'Medan', '1998-12-25', '08567890123', 'L', 'Aktif'),
    ("200006", 'Ahmad Hasanudin', '2019', 'Semarang', '1999-04-08', '08678901234', 'P', 'Aktif'),
    ("200007", 'Maya Dewi', '2020', 'Denpasar', '2000-11-17', '08789012345', 'L', 'Aktif'),
    ("200008", 'Tito Prasetyo', '2021', 'Malang', '2001-06-03', '08890123456', 'P', 'Aktif'),
    ("200009", 'Rina Mariani', '2018', 'Makassar', '1998-09-12', '08901234567', 'L', 'Aktif'),
    ("200010", 'Dwi Wahyuni', '2019', 'Palembang', '1999-03-28', '09012345678', 'P', 'Aktif'),
    ("200011", 'Riski Firmansyah', '2019', 'Bojonegoro', '2001-05-27', '09012345432', 'L', 'Tidak Aktif');

SELECT * FROM anggota;

INSERT INTO petugas (`IdPetugas`, `Username`, `Password`, `Nama`) VALUES
    ('300001', 'user300001', 'AIDDDDDDWWW', 'Andi Wijaya'),
    ('300002', 'user300002', 'password123', 'Fitriani Nurul'),
    ('300003', 'user300003', 'qwerty123', 'Hadi Santoso'),
    ('300004', 'user300004', 'iloveyou', 'Indra Perdana'),
    ('300005', 'user300005', 'P@ssw0rd', 'Joko Pramono'),
    ('300006', 'user300006', 'welcome123', 'Kusuma Dewi'),
    ('300007', 'user300007', 'letmein123', 'Lina Nurhasanah'),
    ('300008', 'user300008', 'admin123', 'Muhammad Farhan'),
    ('300009', 'user300009', 'password1', 'Indra Wijaya'),
    ('300010', 'user300010', '123456789', 'Nia Anggraini'),
    ('300011', 'user300011', 'abc123', 'Rizky Maulana'),
    ('300012', 'user300012', 'qazwsxedc', 'Budi Kurniawan'),
    ('300013', 'user300013', 'letsgo123', 'Larasati Dewi'),
    ('300014', 'user300014', 'test1234', 'Putri Ayu'),
    ('300015', 'user300015', 'password1234', 'Nurul Hidayati');

SELECT * FROM petugas;

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
    ('400001', '200004', '300015', '2023-03-17', '2023-03-21', '10001'),
    ('400002', '200008', '300013', '2023-02-12', '2023-02-15', '10002'),
    ('400003', '200002', '300009', '2023-05-03', '2023-05-05', '10003'),
    ('400004', '200003', '300001', '2023-04-07', '2023-04-10', '10001'),
    ('400005', '200001', '300002', '2023-01-20', '2023-01-22', '10004'),
    ('400006', '200001', '300004', '2023-06-14', '2023-06-16', '10002'),
    ('400007', '200007', '300012', '2023-08-29', '2023-08-31', '10005'),
    ('400008', '200009', '300005', '2023-07-10', '2023-07-14', '10003'),
    ('400009', '200004', '300008', '2023-05-01', '2023-05-05', '10004'),
    ('400010', '200001', '300003', '2023-04-18', '2023-04-21', '10001'),
    ('400011', '200003', '300014', '2023-09-05', '2023-09-07', '10005'),
    ('400012', '200002', '300006', '2023-02-20', '2023-02-24', '10001'),
    ('400013', '200006', '300015', '2023-07-25', '2023-07-27', '10002'),
    ('400014', '200010', '300011', '2023-03-15', '2023-03-19', '10003'),
    ('400015', '200005', '300007', '2023-05-09', '2023-05-12', '10001'),
    ('400016', '200008', '300010', '2023-08-01', '2023-08-05', '10004'),
    ('400017', '200005', '300013', '2023-09-10', '2023-09-14', '10005'),
    ('400018', '200003', '300001', '2023-11-07', '2023-11-10', '10001'),
    ('400019', '200001', '300004', '2023-10-18', '2023-10-20', '10002'),
    ('400020', '200004', '300002', '2023-12-24', '2023-12-27', '10004'),
    ('400021', '200004', '300010', '2023-08-01', '2023-08-05', '10004'),
    ('400022', '200004', '300013', '2023-09-10', '2023-09-14', '10005'),
    ('400023', '200004', '300001', '2023-11-07', '2023-11-10', '10001'),
    ('400024', '200004', '300004', '2023-10-18', '2023-10-20', '10002'),
    ('400025', '200004', '300002', '2023-12-24', '2023-12-27', '10004');

SELECT * FROM peminjaman;

INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('500001', '200004', '10001', '300015', '2023-03-17', '2023-03-21', 'Tidak Kena Denda'),
('500002', '200001', '10003', '300008', '2023-03-25', '2023-03-27', 'Tidak Kena Denda'),
('500003', '200002', '10002', '300010', '2023-03-28', '2023-03-30', '10000'),
('500004', '200003', '10005', '300011', '2023-03-20', '2023-03-22', 'Tidak Kena Denda'),
('500005', '200004', '10001', '300015', '2023-03-17', '2023-03-21', '50000'),
('500006', '200005', '10004', '300012', '2023-03-19', '2023-03-21', 'Tidak Kena Denda'),
('500007', '200006', '10003', '300012', '2023-03-23', '2023-03-24', '15000'),
('500008', '200007', '10002', '300014', '2023-03-22', '2023-03-23', 'Tidak Kena Denda'),
('500009', '200008', '10005', '300011', '2023-03-18', '2023-03-20', '20000'),
('500010', '200009', '10001', '300014', '2023-03-21', '2023-03-25', 'Tidak Kena Denda'),
('500011', '200010', '10004', '300009', '2023-03-29', '2023-03-30', '5000'),
('500012', '200002', '10003', '300002', '2023-03-18', '2023-03-19', 'Tidak Kena Denda'),
('500013', '200003', '10002', '300008', '2023-03-24', '2023-03-26', '25000'),
('500014', '200004', '10005', '300007', '2023-03-26', '2023-03-29', 'Tidak Kena Denda'),
('500015', '200005', '10001', '300006', '2023-03-20', '2023-03-22', '10000'),
('500016', '200006', '10004', '300005', '2023-03-27', '2023-03-28', 'Tidak Kena Denda'),
('500017', '200007', '10003', '300004', '2023-03-22', '2023-03-24', '30000'),
('500018', '200001', '10002', '300003', '2023-03-18', '2023-03-19', 'Tidak Kena Denda'),
('500019', '200009', '10005', '300002', '2023-03-23', '2023-03-26', '15000'),
('500020', '200010', '10001', '300009', '2023-03-29', '2023-03-31', 'Tidak Kena Denda');

--SOAL NO 1 MODUL3--

DROP PROCEDURE IF EXISTS `Angkatan Anggota`;
DELIMITER //
CREATE PROCEDURE `Angkatan Anggota` (IN angkt VARCHAR(100))
BEGIN
    IF angkt = '' THEN
        SET angkt = '2018';
    END IF;
    SELECT 
        ROW_NUMBER() OVER (ORDER BY anggota.Nama_Anggota) AS 'No',
        anggota.IdAnggota AS 'ID',
        anggota.Nama_Anggota AS 'Nama',
        anggota.Angkatan_Anggota AS 'Angkatan',
        anggota.Tempat_Lahir_Anggota AS 'Tempat_Lahir',
        anggota.Tanggal_Lahir_Anggota AS 'Tanggal_Lahir',
        anggota.No_Telp AS 'No_Telp',
        anggota.Jenis_Kelamin AS 'Jenis_Kelamin',
        anggota.Status_Pinjam AS 'Status_Pinjam',
        COUNT(DISTINCT peminjaman.Kode_Peminjaman) AS 'Buku Yang Dipinjam',
        COUNT(DISTINCT pengembalian.Kode_Kembali) AS 'Buku Yang Dikembalikan'
    FROM anggota INNER JOIN peminjaman USING (IdAnggota) INNER JOIN pengembalian USING (IdAnggota)
    GROUP BY anggota.IdAnggota HAVING anggota.Angkatan_Anggota = angkt;
END//
DELIMITER ;

CALL `Angkatan Anggota` ('2021');

--SOAL NO 2 MODUL3--
DROP PROCEDURE IF EXISTS `Ambil Petugas`;
DELIMITER //
CREATE PROCEDURE `Ambil Petugas`(IN idpet VARCHAR (10))
BEGIN
  SELECT * FROM petugas WHERE IdPetugas = idpet;
END //
DELIMITER ;

CALL `Ambil Petugas`('300001');


--SOAL NO3 MODUL 3--

DROP PROCEDURE IF EXISTS  `Ambil Buku`;
DELIMITER //
CREATE PROCEDURE `Ambil Buku` (IN judbook VARCHAR(30), IN penbook VARCHAR(30))
BEGIN 
    SELECT * FROM buku WHERE Judul_Buku LIKE CONCAT('%', judbook, '%') OR Penerbit_Buku LIKE CONCAT('%', penbook, '%');
END //
DELIMITER ;

CALL `Ambil Buku`('The Hunger Games','Scholastic Press');

--SOAL NO4 MODUL 3--

DROP PROCEDURE IF EXISTS  `Ambil Buku 2`;
DELIMITER //
CREATE PROCEDURE `Ambil Buku 2` (IN judbook VARCHAR(30), IN penbook VARCHAR(30), IN pengbook VARCHAR (30))
BEGIN 
    SELECT * FROM buku WHERE Judul_Buku LIKE CONCAT('%', judbook, '%')
    OR Penerbit_Buku LIKE CONCAT('%', penbook, '%')
    OR Pengarang_Buku LIKE CONCAT('%', pengbook, '%');
END //
DELIMITER ;

CALL `Ambil Buku 2`('The Hunger Games','Scholastic Press','Suzanne Collins');

--SOAL NO5 MODUL 3--

DROP PROCEDURE IF EXISTS tambah_petugas;
DELIMITER //
CREATE PROCEDURE tambah_petugas (
                                    IN idpetugas INT,
                                    IN usernamepetugas VARCHAR(200) ,
                                    IN passwordpetugas VARCHAR(100),
                                    IN namapetugas VARCHAR(250)
                                )
BEGIN
        INSERT INTO petugas (IdPetugas, Username, `Password`, Nama)
        VALUES (idpetugas, usernamepetugas, passwordpetugas, namapetugas);
    SELECT * FROM petugas;
END//
DELIMITER ;

CALL tambah_petugas('300017','angga', 'usecase123', 'Angga Dirga');


--SOAL NO6 MODUL 3--
DELIMITER // 
CREATE PROCEDURE estimasi_buku (OUT jumlahbuku INT ) 
BEGIN
    SELECT SUM(Jumlah_Buku) INTO jumlahbuku FROM buku;
END //
DELIMITER ;

CALL estimasi_buku (@jumlahbuku);
SELECT @jumlahbuku;

--SOAL NO7 MODUL3--
DELIMITER //
CREATE PROCEDURE ambildataanggota (
  IN IdAnggota_in VARCHAR(15),
  OUT IdAnggota_out VARCHAR(15), 
  OUT NamaAnggota_out VARCHAR(40),
  OUT Angkatan_out VARCHAR(10)
)
BEGIN
  SELECT IdAnggota, Nama_Anggota, Angkatan_Anggota INTO IdAnggota_out, NamaAnggota_out, Angkatan_out 
  FROM anggota 
  WHERE IdAnggota = IdAnggota_in;
END //
DELIMITER ;

CALL ambildataanggota ('200001',@IdAnggota_out, @NamaAnggota_out, @Angkatan_out);
SELECT @IdAnggota_out AS `Id Anggota`, @NamaAnggota_out AS `Nama Anggota`, @Angkatan_out AS `Angkatan`;