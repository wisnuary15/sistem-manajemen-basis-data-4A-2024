-- View untuk mendapatkan data anggota yang hanya meminjam lebih dari 5 buku
CREATE VIEW tugas1 AS
SELECT a.nama_anggota, COUNT(b.kode_buku) AS jumlah_pinjam
FROM anggota a JOIN peminjaman b ON a.idanggota = b.idanggota
GROUP BY a.nama_anggota
HAVING COUNT(b.kode_buku) > 5;

CREATE VIEW tugas2 AS
SELECT a.nama, COUNT(b.kode_buku) AS jumlah_buku_terpinjam
FROM petugas a JOIN peminjaman b
ON a.idpetugas = b.idpetugas
GROUP BY a.nama;

CREATE VIEW tugas3 AS
SELECT a.nama, COUNT(b.kode_buku) AS jumlah_buku_terpinjam
FROM petugas a JOIN peminjaman b
ON a.idpetugas = b.idpetugas
GROUP BY a.nama
ORDER BY jumlah_buku_terpinjam DESC
LIMIT 1;

CREATE VIEW tugas4 AS
SELECT a.judul_buku AS buku_terbanyak_dipinjam, COUNT(b.kode_buku) AS jumlah
FROM buku a JOIN peminjaman b 
ON a.kode_buku = b.kode_buku
GROUP BY buku_terbanyak_dipinjam
ORDER BY jumlah DESC
LIMIT 1;
