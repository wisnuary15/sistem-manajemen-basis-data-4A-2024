-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 02 Bulan Mei 2024 pada 13.43
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama_anggota` varchar(20) DEFAULT NULL,
  `angkatan_anggota` varchar(6) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_telp` int(12) DEFAULT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `status_pinjam` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `angkatan_anggota`, `tempat_lahir`, `tanggal_lahir`, `no_telp`, `jenis_kelamin`, `status_pinjam`) VALUES
('A001', 'Herlina', '2019', 'Gresik', '2001-12-12', 1234, 'Perempuan', 'Pinjam'),
('A002', 'Rahma', '2019', 'Sidoarjo', '2001-11-12', 1235, 'Laki-Laki', 'Pinjam'),
('A003', 'Rahmi', '2020', 'Surabaya', '2002-10-12', 1236, 'Perempuan', 'Pinjam'),
('A004', 'Romo', '2019', 'Sumenep', '2001-09-12', 1237, 'Laki-Laki', 'Pinjam'),
('A005', 'Dila', '2020', 'Bangkalan', '2002-08-12', 1238, 'Perempuan', 'Pinjam'),
('A006', 'Dian', '2019', 'Pamekasan', '2001-07-12', 1239, 'Perempuan', 'Pinjam'),
('A007', 'Nita', '2020', 'Ponorogo', '2002-06-12', 1233, 'Perempuan', 'Pinjam'),
('A008', 'Sari', '2019', 'Situbondo', '2001-05-12', 1232, 'Perempuan', 'Pinjam'),
('A009', 'Shofa', '2020', 'Gresik', '2002-04-12', 1231, 'Perempuan', 'Pinjam'),
('A010', 'Thoriq', '2019', 'Mojokerto', '2001-03-12', 1230, 'Laki-Laki', 'Pinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `kode_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(25) DEFAULT NULL,
  `pengarang_buku` varchar(30) DEFAULT NULL,
  `penerbit_buku` varchar(30) DEFAULT NULL,
  `tahun_buku` varchar(5) DEFAULT NULL,
  `jumlah_buku` varchar(5) DEFAULT NULL,
  `status_buku` varchar(10) DEFAULT NULL,
  `klasifikasi_buku` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`kode_buku`, `judul_buku`, `pengarang_buku`, `penerbit_buku`, `tahun_buku`, `jumlah_buku`, `status_buku`, `klasifikasi_buku`) VALUES
('B001', 'Laskar Pelangi', 'Andrea hirata', 'Bintang Pustaka', '2015', '20', 'Baru', 'Baik'),
('B002', 'Cinta Brontosaurus', 'Raditya Dika', 'Gagas Media', '2016', '30', 'Baru', 'Baik'),
('B003', 'Sepatu Dahlan', 'Khrisna Pabichara', 'Houra Books', '2017', '35', 'Baru', 'Baik'),
('B004', 'Dear Nathan', 'Erisca Febrianti', 'Best Media', '2019', '45', 'Baru', 'Baik'),
('B005', 'Sang Mimpi', 'Andrea hirata', 'Bintang Pustaka', '2019', '30', 'Baru', 'Baik'),
('B006', 'Motivasi Bob Sadino', 'Ayu Utami', 'Best Media', '2010', '20', 'Baru', 'Baik'),
('B007', 'Koala Kamal', 'Raditya Dika', 'Gagas Media', '2015', '15', 'Baru', 'Baik'),
('B008', 'Pantai dan Kehidupannya', 'Edy Karsono', 'PT. Indah jaya Adipratama', '2003', '10', 'Baru', 'Baik'),
('B009', 'Negeri 5 Menara', 'Ahmad Fuadi', 'PT. Gramedia Pustaka Utama', '2009', '25', 'Baru', 'Baik'),
('B010', 'Promise', 'Dwitasari', 'Loveable', '2018', '35', 'Baru', 'Baik');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `buku_terbanyak`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `buku_terbanyak` (
`kode_buku` varchar(10)
,`judul_buku` varchar(25)
,`pengarang_buku` varchar(30)
,`jumlah_dipinjam` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `kode_peminjaman` varchar(10) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_petugas` varchar(10) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `kode_buku` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`kode_peminjaman`, `id_anggota`, `id_petugas`, `tanggal_pinjam`, `tanggal_kembali`, `kode_buku`) VALUES
('P001', 'A010', 'PTG1', '2023-04-06', '2023-04-09', 'B010'),
('P002', 'A010', 'PTG2', '2023-04-07', '2022-04-30', 'B001'),
('P003', 'A010', 'PTG3', '2023-04-08', '2022-04-13', 'B002'),
('P004', 'A010', 'PTG4', '2023-04-09', '2022-04-13', 'B003'),
('P005', 'A010', 'PTG5', '2023-04-22', '2022-04-30', 'B003'),
('P006', 'A010', 'PTG5', '2023-04-22', '2022-04-30', 'B003'),
('P007', 'A008', 'PTG5', '2023-04-22', '2022-04-30', 'B003'),
('P008', 'A008', 'PTG5', '2023-04-22', '2022-04-30', 'B003'),
('P009', 'A007', 'PTG5', '2023-04-22', '2022-04-30', 'B005'),
('P010', 'A008', 'PTG5', '2022-04-22', '2022-04-30', 'B003');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `peminjam_terbanyak`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `peminjam_terbanyak` (
`id_anggota` varchar(10)
,`nama_anggota` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `kode_kembali` varchar(10) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `kode_buku` varchar(10) DEFAULT NULL,
  `id_petugas` varchar(10) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `denda` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengembalian`
--

INSERT INTO `pengembalian` (`kode_kembali`, `id_anggota`, `kode_buku`, `id_petugas`, `tanggal_pinjam`, `tanggal_kembali`, `denda`) VALUES
('PE001', 'A010', 'B010', 'PTG1', '2023-04-06', '2023-04-09', '0'),
('PE002', 'A010', 'B001', 'PTG2', '2023-04-07', '2022-04-30', '0'),
('PE003', 'A010', 'B002', 'PTG3', '2023-04-08', '2022-04-13', '0'),
('PE004', 'A010', 'B003', 'PTG4', '2023-04-09', '2022-04-13', '0'),
('PE005', 'A010', 'B003', 'PTG5', '2023-04-22', '2022-04-30', '0'),
('PE006', 'A010', 'B003', 'PTG5', '2023-04-22', '2022-04-30', '0'),
('PE007', 'A008', 'B003', 'PTG5', '2023-04-22', '2022-04-30', '0'),
('PE008', 'A008', 'B003', 'PTG5', '2023-04-22', '2022-04-30', '0'),
('PE009', 'A007', 'B005', 'PTG5', '2023-04-22', '2022-04-30', '0'),
('PE010', 'A008', 'B003', 'PTG5', '2022-04-22', '2022-04-30', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(10) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `pasword` varchar(15) DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `pasword`, `nama`) VALUES
('PTG1', 'Petugas 1', 'login', 'Izud'),
('PTG2', 'Petugas 2', 'login', 'Satria'),
('PTG3', 'Petugas 3', 'login', 'Imam'),
('PTG4', 'Petugas 4', 'login', 'Putra'),
('PTG5', 'Petugas 5', 'login', 'Irfan');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `petugas_peminjam_buku`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `petugas_peminjam_buku` (
`id_petugas` varchar(10)
,`nama` varchar(25)
,`tanggal_pinjam` date
,`jumlah_transaksi` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `buku_terbanyak`
--
DROP TABLE IF EXISTS `buku_terbanyak`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `buku_terbanyak`  AS SELECT `p`.`kode_buku` AS `kode_buku`, `b`.`judul_buku` AS `judul_buku`, `b`.`pengarang_buku` AS `pengarang_buku`, count(0) AS `jumlah_dipinjam` FROM (`buku` `b` join `peminjaman` `p` on(`p`.`kode_buku` = `b`.`kode_buku`)) GROUP BY `p`.`kode_buku` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `peminjam_terbanyak`
--
DROP TABLE IF EXISTS `peminjam_terbanyak`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `peminjam_terbanyak`  AS SELECT `peminjam`.`id_anggota` AS `id_anggota`, `namee`.`nama_anggota` AS `nama_anggota` FROM (`peminjaman` `peminjam` join `anggota` `namee` on(`peminjam`.`id_anggota` = `namee`.`id_anggota`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `petugas_peminjam_buku`
--
DROP TABLE IF EXISTS `petugas_peminjam_buku`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `petugas_peminjam_buku`  AS SELECT `tugas`.`id_petugas` AS `id_petugas`, `tugas`.`nama` AS `nama`, `pinjam`.`tanggal_pinjam` AS `tanggal_pinjam`, count(0) AS `jumlah_transaksi` FROM (`petugas` `tugas` join `peminjaman` `pinjam` on(`tugas`.`id_petugas` = `pinjam`.`id_petugas`)) GROUP BY `tugas`.`id_petugas` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`kode_peminjaman`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `kode_buku` (`kode_buku`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`kode_kembali`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `kode_buku` (`kode_buku`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`);

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
