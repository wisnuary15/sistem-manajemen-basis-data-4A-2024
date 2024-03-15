-- Buat tabel
CREATE TABLE Mahasiswa (
    id INT PRIMARY KEY,
    nama VARCHAR(50),
    jurusan VARCHAR(50),
    angkatan INT
);

-- Masukkan data ke dalam tabel
INSERT INTO Mahasiswa (id, nama, jurusan, angkatan) VALUES
(1, 'John Doe', 'Teknik Informatika', 2020),
(2, 'Jane Doe', 'Manajemen Bisnis', 2019),
(3, 'Michael Smith', 'Akuntansi', 2021);

-- Tampilkan semua data dari tabel Mahasiswa
SELECT * FROM Mahasiswa;
