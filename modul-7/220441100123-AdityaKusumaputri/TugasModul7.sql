CREATE DATABASE mobil;
USE mobil;
DROP DATABASE mobil;
DROP DATABASE mobil;
CREATE TABLE mobil (
    id_mobil INT(20) PRIMARY KEY NOT NULL,
    platNo VARCHAR(10) NOT NULL,
    merk VARCHAR(50)NOT NULL,
    jenis VARCHAR(50)NOT NULL,
    harga_sewa INT (10) NOT NULL
);

INSERT INTO mobil VALUES
(101, 'S1111DA', 'Honda', 'Sedan', 600000),
(102, 'D1111TA', 'Toyota', 'Suv', 800000),
(103, 'L2346CA', 'Nissan', 'Crossover', 500000),
(104, 'AG1444VAL', 'Daihatsu', 'Mpv', 400000),
(105, 'L2768bm', 'Mercedes', 'Sedan', 900000);

CREATE TABLE pelanggan (
    id_pelanggan INT(20) PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    nik VARCHAR(16)NOT NULL,
    no_telp VARCHAR(15)NOT NULL,
    jenis_kelamin VARCHAR(10) NOT NULL
);

INSERT INTO pelanggan VALUES
(201, 'Ratna', 'Nganjuk', '3201123456786782', '085850080589', 'Perempuan'),
(202, 'Angga', 'Surabaya', '3201987654982598', '08129810933', 'Laki-laki'),
(203, 'Budi', 'Surabaya', '3201654312848765', '08127698721', 'Laki-Laki'),
(204, 'Alya', 'Sidoarjo', '3201654321098127', '08127612091', 'Perempuan'),
(205, 'Sinta', 'Surabaya', '3201654310938765', '08127651096', 'Perempuan');

CREATE TABLE peminjaman (
    id_pinjam INT(20) PRIMARY KEY NOT NULL,
    id_mobil INT(20)NOT NULL,
    id_pelanggan INT(20)NOT NULL,
    tgl_pinjam DATE,
    tgl_rencana_kembali DATE,
    tgl_kembali DATE,
    total_hari INT(20)NOT NULL,
    total_bayar INT(20)NOT NULL,
    denda INT(20)NOT NULL,
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

INSERT INTO peminjaman VALUES
(301, 101, 201, '2024-02-01', '2024-02-05', '2024-02-06', 6, 3600000, 100000),
(302, 102, 201, '2024-03-05', '2024-03-08', NULL, NULL, NULL, NULL),
(303, 103, 202, '2024-04-02', '2024-04-5', '2024-04-05', 4, 2000000, 0),
(304, 102, 204, '2024-05-10', '2024-05-15', NULL, NULL, NULL, NULL);


-- no 1
DELIMITER //
CREATE TRIGGER CekTglRencanaKembali
BEFORE INSERT ON peminjaman
FOR EACH ROW
BEGIN
    IF NEW.tgl_rencana_kembali < NEW.tgl_pinjam THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tanggal rencana kembali tidak boleh lebih awal dari tanggal pinjam';
    END IF;
END//
DELIMITER ;

SET SQL_SAFE_UPDATES = 0; -- misal niali 1 atau true, bersifat tidak boleh diinput secara manual

DROP TRIGGER CekTglRencanaKembali; 

INSERT INTO peminjaman VALUES -- insert data tdk valid (benar)
(306, 101, 202, '2024-05-12', '2024-05-11', '2024-05-14', 3, 1800000, 0);

INSERT INTO peminjaman VALUES -- insert data valid (salah)
(307, 101, 202, '2024-05-12', '2024-05-15', '2024-05-15', 3, 1800000, 0);


SELECT * FROM peminjaman;
-- no 2 
DELIMITER //
CREATE TRIGGER HitungPengembalian
BEFORE UPDATE ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE v_harga_sewa INT;
    DECLARE v_total_hari INT;
    DECLARE v_denda INT;
    DECLARE v_denda_perhari INT DEFAULT 100000; -- Contoh jumlah denda per hari

    -- Pastikan tgl_kembali baru tidak NULL dan tgl_kembali lama masih NULL
    IF NEW.tgl_kembali IS NOT NULL AND OLD.tgl_kembali IS NULL THEN
        -- Mengambil harga sewa per hari dari tabel MOBIL
        BEGIN
            DECLARE CONTINUE HANDLER FOR NOT FOUND
            BEGIN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mobil tidak ditemukan.';
            END;

            SELECT harga_sewa INTO v_harga_sewa
            FROM mobil 
            WHERE id_mobil = NEW.id_mobil;
        END;

        -- Menghitung total hari
        SET v_total_hari = DATEDIFF(NEW.tgl_kembali, NEW.tgl_pinjam);
        SET NEW.total_hari = v_total_hari;

        -- Menghitung total bayar
        SET NEW.total_bayar = v_total_hari * v_harga_sewa;

        -- Menghitung denda jika ada
        IF NEW.tgl_kembali > NEW.tgl_rencana_kembali THEN
            SET v_denda = DATEDIFF(NEW.tgl_kembali, NEW.tgl_rencana_kembali) * v_denda_perhari;
            SET NEW.denda = v_denda;
        ELSE
            SET NEW.denda = 0;
        END IF;
    END IF;
END//
DELIMITER ;


SET SQL_SAFE_UPDATES = 0;

UPDATE peminjaman
SET tgl_kembali = '2024-03-10'
WHERE id_pinjam = 302;
 SELECT * FROM peminjaman;
DROP TRIGGER HitungPengembalian;

-- no 3 
DELIMITER //
CREATE TRIGGER CekPanjangNik
BEFORE INSERT ON pelanggan
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.nik) <> 16 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Panjang NIK harus 16 digit.';
    END IF;
END//
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

INSERT INTO pelanggan VALUES -- data tidak valid (benar)
(206, 'Candra', 'Surabaya', '12345669', '08123565432', 'Perempuan');

DROP TRIGGER CekPanjangNik;

-- no 4
DELIMITER//
CREATE TRIGGER CekFormatPlatno
BEFORE INSERT ON mobil
FOR EACH ROW
BEGIN
    IF NOT LEFT(NEW.platNo, 1) REGEXP '[A-Z]' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Karakter pertama dan kedua pada platno harus huruf';
    END IF;
END//
DELIMITER;

SET SQL_SAFE_UPDATES = 0;

DROP TRIGGER CekFormatPlatno;

INSERT INTO mobil VALUES
(106, '16331DA', 'Honda', 'SUV', 500000);


