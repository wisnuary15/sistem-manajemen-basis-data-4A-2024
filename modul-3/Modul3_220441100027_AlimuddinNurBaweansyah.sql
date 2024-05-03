##NO 1
DELIMITER $$
CREATE PROCEDURE anggota(IN id VARCHAR(100))
BEGIN
SELECT * FROM anggota
WHERE id = IdAnggota;
END$$
DELIMITER ;
CALL anggota('A009');

##NO 2
DELIMITER $$
CREATE PROCEDURE peminjaman(IN idpeminjaman VARCHAR(100))
BEGIN
SELECT * FROM peminjaman
WHERE idpeminjaman = Kode_Peminjaman;
END$$
DELIMITER ;
CALL peminjaman('PM012');

#NO 3
DELIMITER $$
CREATE PROCEDURE peminjaman2(IN idpeminjam VARCHAR(100), IN
idBuku VARCHAR(100))
BEGIN
SELECT * FROM peminjaman
WHERE idpeminjam = IdAnggota AND idBuku = Kode_Buku;
END$$
DELIMITER ;
CALL peminjaman2('A008', 'B015');

#NO 4
DELIMITER $$
CREATE PROCEDURE book(IN Penerbit VARCHAR(100), IN Tahun
VARCHAR(100), IN `Status` VARCHAR(100))
BEGIN
SELECT * FROM buku
WHERE Penerbit = Penerbit_Buku AND Tahun = Tahun_Buku AND
`Status` = Status_Buku;
END$$
DELIMITER ;
CALL book('Bentang Pustaka', '2022', 'Tersedia');

#NO 5
DELIMITER $$
CREATE PROCEDURE CRUD(IN kunci VARCHAR(100), IN kodeBuku
VARCHAR(100))
BEGIN
IF kunci = "INSERT" then
begin
select * from buku;
INSERT INTO buku (Kode_Buku, Judul_Buku,
Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku,
Status_Buku, Klasifikasi_Buku) VALUES

('B017', 'Kampus Tercinta', 'Ansyah',
'Gramedia Pustaka Utama', '2014', '9', 'Tersedia', 'Sejarah');
end;
else
select * from buku;
end if;

IF kunci = "DELETE" THEN
BEGIN
SELECT * FROM buku;
DELETE FROM buku WHERE kodeBuku = Kode_Buku;
end;
else
select * from buku;
end if;
END$$
DELIMITER ;

drop procedure CRUD;
CALL CRUD('INSERT', 'B001');

#NO 6
DELIMITER $$
CREATE PROCEDURE jumlahBukuGramedia(OUT Total VARCHAR(100))
BEGIN
SELECT Judul_Buku, Pengarang_Buku, Penerbit_Buku,
SUM(Jumlah_Buku) AS `Jumlah Buku`
FROM buku
WHERE Penerbit_Buku = 'Pustaka Media'
GROUP BY Kode_Buku;
END$$
DELIMITER ;
CALL jumlahBukuGramedia(@Total);
SELECT @Total;

drop procedure jumlahBukuGramedia;

#NO 7

DELIMITER //
CREATE PROCEDURE jumlahpenerbit(
	IN namapenerbit VARCHAR(100),
	OUT total INT(100))
BEGIN
	SELECT COUNT(kode_buku)
	INTO total
	FROM buku WHERE penerbit_buku = namapenerbit;
END//
DELIMITER ;

CALL jumlahpenerbit('Gramedia Pustaka',@total);
SELECT @total;

drop procedure jumlahpenerbit;


## Coba 5

DELIMITER //
Create Procedure addPetugas(
in IdPetugas Varchar (10),
in Username varchar(100),
in Passwordd varchar(10),
in nama varchar(100))
Begin
Insert into petugas
Values (IdPetugas,Username,Passwordd,Nama);
select * from petugas;
end //
DELIMITER ;
drop procedure addPetugas;

call addPetugas('P017','admin16','pass888','Suryadi');

select * from petugas;

delete from petugas where nama = 'suryadi';

SET SQL_SAFE_UPDATES = 0;

## Coba 6
DELIMITER $$
CREATE PROCEDURE hitungJumlahPetugas(
    OUT jumlah INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah FROM petugas;
END$$
DELIMITER ;

CALL hitungJumlahPetugas(@jumlah);
SELECT @jumlah;

## COBA 7

DELIMITER $$
CREATE PROCEDURE hitungJumlahPetugas2(
    INOUT jumlah INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah FROM petugas;
END$$
DELIMITER ;
drop procedure hitungJumlahPetugas2;
CALL hitungJumlahPetugas2(@total2);
SELECT @total2;


