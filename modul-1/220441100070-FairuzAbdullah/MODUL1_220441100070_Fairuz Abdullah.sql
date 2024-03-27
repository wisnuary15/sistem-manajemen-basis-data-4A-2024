-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2024 at 05:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_swalayan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_Barang` int(11) NOT NULL,
  `Nama_Barang` varchar(100) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `Jumlah_Stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_Barang`, `Nama_Barang`, `Harga`, `Jumlah_Stok`) VALUES
(1, 'Sabun Mandi', 5000.00, 100),
(2, 'Shampoo', 10000.00, 50),
(3, 'Pasta Gigi', 8000.00, 80),
(4, 'Tisu Basah', 3000.00, 120),
(5, 'Minyak Goreng', 15000.00, 200),
(6, 'Gula Pasir', 12000.00, 150),
(7, 'Kopi Bubuk', 25000.00, 70),
(8, 'Teh Celup', 18000.00, 90),
(9, 'Beras', 30000.00, 100),
(10, 'Mie Instan', 5000.00, 120);

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `ID_Laporan` int(11) NOT NULL,
  `Tanggal_Laporan` date DEFAULT NULL,
  `Jenis_Laporan` varchar(100) DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`ID_Laporan`, `Tanggal_Laporan`, `Jenis_Laporan`, `Keterangan`) VALUES
(1, '2024-01-01', 'Stok', 'Laporan stok awal tahun. Stok saat ini: 100'),
(2, '2024-01-02', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 500000'),
(3, '2024-01-03', 'Stok', 'Koreksi stok. Stok setelah koreksi: 90'),
(4, '2024-01-04', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 600000'),
(5, '2024-01-05', 'Stok', 'Koreksi stok. Stok setelah koreksi: 95'),
(6, '2024-01-06', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 550000'),
(7, '2024-01-07', 'Stok', 'Koreksi stok. Stok setelah koreksi: 85'),
(8, '2024-01-08', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 700000'),
(9, '2024-01-09', 'Stok', 'Koreksi stok. Stok setelah koreksi: 100'),
(10, '2024-01-10', 'Penjualan', 'Penjualan harian. Pendapatan hari ini: Rp 750000');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID_Supplier` int(11) NOT NULL,
  `Nama_Supplier` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `No_Telepon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID_Supplier`, `Nama_Supplier`, `Alamat`, `No_Telepon`) VALUES
(1, 'Supplier A', 'Jl. Pahlawan No. 123', '081234567890'),
(2, 'Supplier B', 'Jl. Gatot Subroto No. 456', '085678901234'),
(3, 'Supplier C', 'Jl. Sudirman No. 789', '081234567891'),
(4, 'Supplier D', 'Jl. Diponegoro No. 1011', '085678901235'),
(5, 'Supplier E', 'Jl. Veteran No. 1213', '081234567892'),
(6, 'Supplier F', 'Jl. Asia Afrika No. 1415', '085678901236'),
(7, 'Supplier G', 'Jl. Merdeka No. 1617', '081234567893'),
(8, 'Supplier H', 'Jl. Majapahit No. 1819', '085678901237'),
(9, 'Supplier I', 'Jl. Raya No. 2021', '081234567894'),
(10, 'Supplier J', 'Jl. Gatot Kaca No. 2223', '085678901238');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_Transaksi` int(11) NOT NULL,
  `Jenis_Transaksi` varchar(50) DEFAULT NULL,
  `Waktu_Transaksi` date DEFAULT NULL,
  `Total_Harga` decimal(10,2) DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_Transaksi`, `Jenis_Transaksi`, `Waktu_Transaksi`, `Total_Harga`, `Keterangan`) VALUES
(1, 'POS / Penjualan : ke pelanggan', '2024-03-25', 25000.00, 'Transaksi penjualan barang A'),
(2, 'POS / Penjualan : ke pelanggan', '2024-03-25', 18000.00, 'Transaksi penjualan barang B'),
(3, 'Pengembalian barang / retur', '2024-03-25', 15000.00, 'Pengembalian barang C karena cacat'),
(4, 'Pengembalian barang / retur', '2024-03-26', 12000.00, 'Pengembalian barang D karena tidak sesuai pesanan'),
(5, 'Stok', '2024-03-26', NULL, 'Penyesuaian stok barang E setelah inventarisasi'),
(6, 'Stok', '2024-03-27', NULL, 'Penyesuaian stok barang F setelah pengecekan kualitas'),
(7, 'Pembelian barang dari supplier', '2024-03-27', 35000.00, 'Pembelian barang G dari Supplier J'),
(8, 'Pembelian barang dari supplier', '2024-03-28', 28000.00, 'Pembelian barang H dari Supplier I'),
(9, 'Koreksi stok', '2024-03-28', NULL, 'Koreksi stok setelah terjadi kehilangan'),
(10, 'Koreksi stok', '2024-03-29', NULL, 'Koreksi stok setelah barang rusak dalam penyimpanan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_Barang`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`ID_Laporan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID_Supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_Transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID_Barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `ID_Laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID_Supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_Transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
