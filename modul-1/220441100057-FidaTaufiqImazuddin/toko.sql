-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2024 at 07:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_pengembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_transaksi`, `id_barang`, `jumlah_pengembalian`) VALUES
(601, 401, 201, 2),
(602, 401, 201, 4),
(603, 402, 201, 6),
(604, 402, 201, 20),
(605, 403, 202, 1),
(606, 401, 201, 6),
(607, 406, 201, 4),
(608, 401, 206, 8),
(609, 401, 201, 1),
(610, 404, 201, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(80) NOT NULL,
  `harga_barang` bigint(20) DEFAULT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `harga_barang`, `stok`) VALUES
(201, 'Pepsoden', 20, 12000),
(202, 'Biskuat', 87, 12000),
(203, 'Sari Roti', 98, 12000),
(204, 'Indomie', 56, 12000),
(205, 'Sedap', 54, 12000),
(206, 'Coca cola', 50, 12000),
(207, 'Hilo', 22, 12000),
(208, 'Milo', 40, 12000),
(209, 'lays', 29, 12000),
(210, 'Taro', 10, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(80) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_tlp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_tlp`) VALUES
(301, 'Budi', 'Surabaya', '08146489'),
(302, 'Santoso', 'Surabaya', '08146466'),
(303, 'Susilo', 'Mojokerto', '08143356'),
(304, 'Slamet', 'Mojokerto', '08146653'),
(305, 'Widodo', 'Surakarta', '08146989'),
(306, 'Hadi', 'Lamongan', '08146411'),
(307, 'Susanto', 'Sidoarjo', '08146422'),
(308, 'Rina', 'Bangkalan', '08112456'),
(309, 'Joko', 'Malang', '08176457'),
(310, 'Setiawan', 'Kediri', '08141217');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id_pembayaran`, `tanggal`, `id_transaksi`, `id_pelanggan`, `id_supplier`) VALUES
(501, '2024-03-01', 401, 301, 101),
(502, '2024-03-02', 402, 302, 102),
(503, '2024-03-03', 403, 303, 103),
(504, '2024-03-04', 404, 304, 104),
(505, '2024-03-05', 405, 305, 105),
(506, '2024-03-06', 406, 306, 106),
(507, '2024-03-07', 407, 307, 107),
(508, '2024-03-08', 408, 308, 108),
(509, '2024-03-08', 409, 309, 109),
(510, '2024-03-11', 410, 310, 110);

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(80) NOT NULL,
  `alamat` varchar(80) NOT NULL,
  `no_tlp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_tlp`) VALUES
(101, 'FreshMart', 'Surabaya', '08123'),
(102, 'QuickMart', 'Mojokerto', '08134'),
(103, 'ValueMart', 'Surabaya', '08190'),
(104, 'SumberBerkah', 'Surakarta', '08187'),
(105, 'MegaMart', 'Banyuwangi', '08188'),
(106, 'DailyMart', 'Sidoarjo', '08109'),
(107, 'SuperMart', 'Sidoarjo', '08178'),
(108, 'MegaMart', 'Sampang', '08176'),
(109, 'EasyMart', 'Bangkalan', '08167'),
(110, 'FMart', 'Banyuwangi', '08134');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_transaksi` varchar(80) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `total_transaksi` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `tanggal`, `jenis_transaksi`, `id_pelanggan`, `id_supplier`, `total_transaksi`) VALUES
(401, '2024-03-22', 'Pembelian', 301, 101, 240000),
(402, '2024-03-25', 'Return', 302, 102, 44000),
(403, '2024-03-11', 'Return', 303, 103, 74000),
(404, '2024-03-09', 'Pembelian', 304, 104, 94000),
(405, '2024-03-08', 'Pembelian', 305, 105, 84000),
(406, '2024-03-12', 'Return', 306, 106, 72000),
(407, '2024-03-04', 'Pembelian', 307, 107, 26000),
(408, '2024-03-30', 'Pembelian', 308, 108, 15000),
(409, '2024-03-19', 'Pembelian', 309, 109, 30000),
(410, '2024-03-18', 'Pembelian', 310, 110, 40000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `transaksi_pembelian` (`id_transaksi`),
  ADD KEY `barang` (`id_barang`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `ketransaksi` (`id_transaksi`),
  ADD KEY `kepelanggan2` (`id_pelanggan`),
  ADD KEY `kesupplier2` (`id_supplier`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kepelanggan` (`id_pelanggan`),
  ADD KEY `kesupplier` (`id_supplier`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `barang` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_pembelian` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id_transaksi`);

--
-- Constraints for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `kepelanggan2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `kesupplier2` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`),
  ADD CONSTRAINT `ketransaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id_transaksi`);

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `kepelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `kesupplier` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
