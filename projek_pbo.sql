-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2022 at 02:02 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek_pbo`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Id_barang` int(11) NOT NULL,
  `Nama_barang` varchar(220) NOT NULL,
  `Jumlah` varchar(50) NOT NULL,
  `Harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`Id_barang`, `Nama_barang`, `Jumlah`, `Harga`) VALUES
(1, 'Celana Jeans', '10', '50000'),
(2, 'Baju Lengan Panjang', '5', '60000'),
(24, 'Topi', '5', '20000');

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang`
--

CREATE TABLE `detail_barang` (
  `kode_brg` int(11) NOT NULL,
  `Id_barang` int(11) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `size` varchar(20) NOT NULL,
  `warna` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_barang`
--

INSERT INTO `detail_barang` (`kode_brg`, `Id_barang`, `merk`, `size`, `warna`) VALUES
(1, 2, 'Baju', 'XL', 'Putih'),
(2, 1, 'Celana', '36', 'hitam'),
(3, 24, 'Gucci', 'XL', 'Putih');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `Id_pembayaran` int(11) NOT NULL,
  `Id_transaksi` int(11) NOT NULL,
  `tgl_bayar` varchar(100) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`Id_pembayaran`, `Id_transaksi`, `tgl_bayar`, `total`) VALUES
(1, 1, '08-02-2022', 5000),
(2, 1, '08-01-2022', 30000),
(6, 3, '10-01-2022', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `Id_pembeli` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jenis_kelamin` varchar(15) NOT NULL,
  `Kode_pos` int(11) NOT NULL,
  `Alamat` varchar(220) NOT NULL,
  `No_hp` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`Id_pembeli`, `Nama`, `Jenis_kelamin`, `Kode_pos`, `Alamat`, `No_hp`, `Email`) VALUES
(24, 'adlin', 'Laki-Laki', 2693, 'silo lama', '812345674', 'adlin@gmail.com'),
(26, 'Wisnu affansyah', 'Laki-Laki', 2963, 'Air Joman', '083162123112', 'wisnuaffansyah32@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `Id_transaksi` int(11) NOT NULL,
  `Id_barang` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `Id_pembeli` int(11) NOT NULL,
  `Tanggal` varchar(50) NOT NULL,
  `Keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`Id_transaksi`, `Id_barang`, `kode_barang`, `Id_pembeli`, `Tanggal`, `Keterangan`) VALUES
(1, 1, 1, 24, '08-01-2022', 'Anda Membeli Celana Jeans'),
(2, 2, 2, 24, '09-01-2022', 'Anda Membeli Baju Lengan Panjang'),
(3, 24, 3, 26, '10-01-2022', 'Anda Membeli Topi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Id_barang`);

--
-- Indexes for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD PRIMARY KEY (`kode_brg`),
  ADD KEY `id_barang` (`Id_barang`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`Id_pembayaran`),
  ADD KEY `Id_transaksi` (`Id_transaksi`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`Id_pembeli`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Id_transaksi`),
  ADD KEY `Id_barang` (`Id_barang`),
  ADD KEY `Id_pembeli` (`Id_pembeli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `Id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `detail_barang`
--
ALTER TABLE `detail_barang`
  MODIFY `kode_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `Id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `Id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `Id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD CONSTRAINT `detail_barang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`Id_barang`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`Id_transaksi`) REFERENCES `transaksi` (`Id_transaksi`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`Id_barang`) REFERENCES `barang` (`Id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`Id_pembeli`) REFERENCES `pembeli` (`Id_pembeli`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
