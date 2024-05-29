CREATE TABLE Penulis (
    id_penulis INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255),
    negara VARCHAR(255)
);

CREATE TABLE Buku(
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255),
    id_penulis int,
    harga int,
    stok int,
    FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

CREATE TABLE Penjualan (
    id_penjualan int AUTO_INCREMENT PRIMARY KEY,
    id_buku INT,
    tanggal Date,
    jumlah int,
    FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

INSERT INTO Penulis VALUES 
("", "Masashi Kishimoto", "Japan"),
("", "Budi Dwi", "Bangkot"),
("", "Alexander Graham Bell", "England");

INSERT INTO Buku VALUES
("", "Naruto Vol.5", 1, 45000, 5),
("", "Naruto VOL.6", 1, 45000, 5),
("", "Naruto Vol.7", 1, 45000, 5),
("", "Naruto Vol.8", 1, 45000, 5),
("", "ATOMIC HABITS", 2, 120000, 10),
("", "Cara Membuat Telepon", 3, 500000, 7),
("", "How to Incrased Accreditation", 2, 100000, 6);

CREATE VIEW viewBukuPenulis AS
SELECT judul Judul_Buku, harga, stok, nama Penulis, negara Negara_Penulis
FROM buku
join penulis ON buku.id_penulis = penulis.id_penulis;


select * from viewBukuPenulis
ORDER BY harga ASC
limit 5;

CREATE procedure tambahPenjualan(
    in id_b INT,
    in tgl date,
    in jml int,
    out hasil varchar(100)
)
BEGIN
    Declare cek_id INT;

    SELECT count(*) into cek_id from Buku WHERE id_buku = id_b;

    if cek_id > 0 then

        INSERT into Penjualan (id_buku, tanggal, jumlah)
        VALUES (id_b, tgl, jml);
        set hasil =  "Penjualan/Alert berhasil ditambahkan";
    else
        set hasil = "Id Buku Tidak Tersedia. Penjualan gagal dilakukan!";
    end if;
end


CREATE VIEW penjualanTerbanyak AS
SELECT Buku.judul AS Judul_Buku, Penulis.nama AS Nama_Penulis, SUM(Penjualan.jumlah) AS Total_Penjualan
FROM Penjualan
JOIN Buku ON Penjualan.id_buku = Buku.id_buku
JOIN Penulis ON Buku.id_penulis = Penulis.id_penulis
GROUP BY Penjualan.id_buku
ORDER BY Total_Penjualan DESC
LIMIT 5;