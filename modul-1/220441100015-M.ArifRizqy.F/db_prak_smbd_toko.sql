--
-- Database: `db_prak_smbd_toko`
--

-- --------------------------------------------------------

--
-- Struktur tabel untuk `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id` varchar(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL
) ENGINE=InnoDB;

--
-- Pengisian data untuk `tb_barang`
--

INSERT INTO `tb_barang` (`id`, `nama_barang`) VALUES
('BRG0001', 'wafer cokolatos'),
('BRG0002', 'wafer wafello'),
('BRG0003', 'wafer tango'),
('BRG0004', 'wafer nabati'),
('BRG0005', 'biskuit roma sari kelapa'),
('BRG0006', 'biskuit biskuat'),
('BRG0007', 'biskuit monde'),
('BRG0008', 'biskuit regal'),
('BRG0009', 'malkist abon'),
('BRG0010', 'malkist kelapa kopyor');

-- --------------------------------------------------------

--
-- Struktur tabel untuk `tb_gudang`
--

CREATE TABLE `tb_gudang` (
  `id_pemasok` varchar(20) NOT NULL,
  `id_barang` varchar(20) NOT NULL,
  `stok` int NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB;

--
-- Pengisian data untuk `tb_gudang`
--

INSERT INTO `tb_gudang` (`id_pemasok`, `id_barang`, `stok`, `tgl`) VALUES
('SPL0006', 'BRG0001', 69, '2024-03-26'),
('SPL0006', 'BRG0002', 60, '2024-03-26'),
('SPL0006', 'BRG0003', 50, '2024-03-26'),
('SPL0006', 'BRG0004', 61, '2024-03-26'),
('SPL0006', 'BRG0005', 60, '2024-03-26'),
('SPL0006', 'BRG0006', 53, '2024-03-26'),
('SPL0006', 'BRG0007', 51, '2024-03-26'),
('SPL0006', 'BRG0008', 68, '2024-03-26'),
('SPL0006', 'BRG0009', 64, '2024-03-26'),
('SPL0006', 'BRG0010', 63, '2024-03-26');

-- --------------------------------------------------------

--
-- Struktur tabel untuk `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB;

--
-- Pengisian data untuk `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id`) VALUES
('P0001'),
('P0002'),
('P0003'),
('P0004'),
('P0005'),
('P0006'),
('P0007'),
('P0008'),
('P0009'),
('P0010');

-- --------------------------------------------------------

--
-- Struktur tabel untuk `tb_pemasok`
--

CREATE TABLE `tb_pemasok` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB;

--
-- Pengisian data untuk `tb_pemasok`
--

INSERT INTO `tb_pemasok` (`id`, `nama`) VALUES
('SPL0001', 'grosir jaya makmur'),
('SPL0002', 'grosir jaya jaya'),
('SPL0003', 'grosir sumber berkah'),
('SPL0004', 'cv. sinar mas'),
('SPL0005', 'cv. biskitop'),
('SPL0006', 'cv. mentari pagi'),
('SPL0007', 'pt. sidu'),
('SPL0008', 'pt. ajinomoto'),
('SPL0009', 'pt. pal'),
('SPL0010', 'grosir mak lima biadab');

-- --------------------------------------------------------

--
-- Struktur tabel untuk `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id_pelanggan` varchar(20) NOT NULL,
  `id_barang` varchar(20) NOT NULL,
  `harga` bigint NOT NULL,
  `qty` int NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB;

--
-- Pengisian data untuk `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id_pelanggan`, `id_barang`, `harga`, `qty`, `tgl`) VALUES
('P0001', 'BRG0001', 6000, 5, '2024-03-26'),
('P0001', 'BRG0002', 3000, 12, '2024-03-26'),
('P0001', 'BRG0003', 2000, 7, '2024-03-26'),
('P0001', 'BRG0004', 6000, 8, '2024-03-26'),
('P0001', 'BRG0005', 1000, 12, '2024-03-26'),
('P0001', 'BRG0006', 4000, 9, '2024-03-26'),
('P0001', 'BRG0007', 4000, 10, '2024-03-26'),
('P0001', 'BRG0008', 3000, 4, '2024-03-26'),
('P0001', 'BRG0009', 4000, 7, '2024-03-26'),
('P0001', 'BRG0010', 5000, 3, '2024-03-26');

-- --------------------------------------------------------

--
-- Struktur Tabel for table `tb_retur`
--

CREATE TABLE `tb_retur` (
  `id_pelanggan` varchar(20) NOT NULL,
  `id_barang` varchar(20) NOT NULL,
  `qty` int NOT NULL,
  `tgl` date NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB;

--
-- Pengisian data untuk `tb_retur`
--

INSERT INTO `tb_retur` (`id_pelanggan`, `id_barang`, `qty`, `tgl`, `catatan`) VALUES
('P0003', 'BRG0006', 1, '2024-03-26', 'barang kadaluarsa'),
('P0003', 'BRG0007', 1, '2024-03-26', 'barang kadaluarsa'),
('P0004', 'BRG0004', 2, '2024-03-26', 'barang kadaluarsa'),
('P0004', 'BRG0005', 2, '2024-03-26', 'barang kadaluarsa'),
('P0006', 'BRG0001', 1, '2024-03-26', 'barang kadaluarsa'),
('P0006', 'BRG0002', 3, '2024-03-26', 'barang kadaluarsa'),
('P0006', 'BRG0003', 3, '2024-03-26', 'barang kadaluarsa'),
('P0009', 'BRG0008', 2, '2024-03-26', 'barang kadaluarsa'),
('P0009', 'BRG0009', 1, '2024-03-26', 'barang kadaluarsa'),
('P0009', 'BRG0010', 1, '2024-03-26', 'barang kadaluarsa');

-- --------------------------------------------------------

--
-- Index untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id`);

--
-- Index untuk tabel `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD PRIMARY KEY (`id_pemasok`,`id_barang`);

--
-- Index untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Index untuk tabel `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Index untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id_pelanggan`,`id_barang`);

--
-- Index untuk tabel `tb_retur`
--
ALTER TABLE `tb_retur`
  ADD PRIMARY KEY (`id_pelanggan`,`id_barang`);

--
-- Constraints untuk tabel `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD CONSTRAINT `fk_gudang_barang` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_gudang_pemasok` FOREIGN KEY (`id_pemasok`) REFERENCES `tb_pemasok` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `fk_penjualan_barang` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_penjualan_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints untuk tabel `tb_retur`
--
ALTER TABLE `tb_retur`
  ADD CONSTRAINT `fk_retur_barang` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_retur_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- --------------------------------------------------------


-- 
-- Perintah berbahaya jangan dieksekusi
-- 
DROP DATABASE db_prak_smbd_toko;