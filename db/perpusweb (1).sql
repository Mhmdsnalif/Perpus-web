-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2023 at 11:54 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(40) NOT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `notelp` varchar(13) DEFAULT NULL,
  `jk` varchar(30) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tgllahir` varchar(50) DEFAULT NULL,
  `umur` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_lengkap`, `notelp`, `jk`, `tempat`, `tgllahir`, `umur`, `alamat`, `foto`) VALUES
('A0001', 'Bintang R', '087754224567', 'Laki-laki', 'Surabaya', '04/23/2000', '20', 'Desa Sukatali, Kec Situraja', 'Screenshot_2023-07-1'),
('A0002', 'yuvens anggito', '087827817289', 'Laki-laki', 'Suarabaya', '04/14/2000', '20', 'Desa Cihanja, Kec ganeas', 'Screenshot_2023-07-1'),
('A0003', 'Muhammad Sufi', '089980089789', 'Laki-laki', 'Kediri', '04/12/2000', '20', 'Kediri', 'man.png'),
('A0004', 'Fahmi Amri', '085601019101', 'Laki-laki', 'Suarabaya', '07/11/2001', '21', 'Surabaya', 'man.png'),
('A0005', 'Ilyas Kurniawan', '08511019101', 'Laki-laki', 'Suarabaya', '06/19/2002', '21', 'Surabaya', 'man.png'),
('A0006', 'Ridwan Thoriq', '08670101010', 'Laki-laki', 'Malang', '06/20/2001', '21', 'Malang', 'man.png'),
('A0007', 'Faisal', '085702020201', 'Laki-laki', 'Suarabaya', '08/15/2002', '21', 'surabaya', 'man.png'),
('A0008', 'Iqbal Abd', '0812101010', 'Laki-laki', 'Suarabaya', '07/17/2002', '20', 'Surabaya', 'man.png');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(20) DEFAULT NULL,
  `id_kategori` varchar(20) DEFAULT NULL,
  `id_penerbit` varchar(20) DEFAULT NULL,
  `id_rak` varchar(20) DEFAULT NULL,
  `judul` varchar(60) DEFAULT NULL,
  `pengarang` varchar(60) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `jmlhal` int(4) DEFAULT NULL,
  `jmlbuku` int(4) DEFAULT NULL,
  `tahun` int(5) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `foto` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `id_penerbit`, `id_rak`, `judul`, `pengarang`, `isbn`, `jmlhal`, `jmlbuku`, `tahun`, `sinopsis`, `foto`) VALUES
('B0001', 'K0001', 'P0002', 'Rak-01', 'Lancar JavaScript', 'Jubile Enterprice', '12345678', 140, 6, 2019, '-', 'lancar_javascript.jpg'),
('B0002', 'K0001', 'P0002', 'Rak-01', 'Belajar Otodidak CodeIgniter', 'Budi Raharjo', '12345679', 130, 6, 2020, '-', 'belajar_codeigniter.jpg'),
('B0003', 'K0001', 'P0002', 'Rak-01', 'Pro PHP & Jquery 7 Hari', 'WARDANA', '12345681', 100, 5, 2020, '-', 'web_profesional_dengan_php_jquery.jpg'),
('B0004', 'K0006', 'P0004', 'Rak-04', 'Otodidak Web Programming', 'Muhammad Ibnu Sa\'ad', '123523453424', 100, 5, 2019, '-', 'ID_OWP2020MTH01WP.jpg'),
('B0005', 'K0001', 'P0004', 'Rak-01', 'Kontrol Versi dengan Git', 'Alex Xandra Albert Sim', '102901901', 63, 5, 2017, 'Buku ini memberikan penjelasan mengenai sebuah sistem kontrol versi yang sangat populer, git. Bagian awal buku menjelaskan dasar-dasar penggunaan git', 'gitBuku.png'),
('B0006', 'K0001', 'Muhammad Abib', 'Rak-04', 'Code Better In Delphi', 'Alister Christie', '10290112', 200, 4, 2020, '-', 'delphiBook.png'),
('B0007', 'K0001', 'P0004', 'Rak-04', 'Code Better In Delphi', 'Alister Christie', '10290112', 200, 4, 2020, '-', 'delphiBook1.png'),
('B0008', 'K0006', 'P0003', 'Rak-04', 'Machine Learning Q and AI', 'Sebastian Raschka', '10109209', 258, 3, 2021, 'Machine learning and AI are moving at a rapid pace', 's_hero.jpg'),
('B0009', 'K0001', 'P0003', 'Rak-04', 'Mastering C++ Network Automation', 'Justin Barbara', '10120102', 120, 3, 2019, '-', 's_hero_(1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `id_denda` varchar(50) NOT NULL,
  `denda` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `denda`
--

INSERT INTO `denda` (`id_denda`, `denda`) VALUES
('DND-01', '4000');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(20) DEFAULT NULL,
  `kategori` varchar(40) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`, `keterangan`) VALUES
('K0001', 'Programing', ''),
('K0002', 'Sains', ''),
('K0004', 'Pendidikan', ''),
('K0005', 'Pemula', ''),
('K0006', 'Informatika', '');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `id_anggota` varchar(5) DEFAULT NULL,
  `tempo` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `usr_input` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `tgl_pinjam`, `id_anggota`, `tempo`, `status`, `ket`, `usr_input`) VALUES
('PJM0001', '2023-07-27', 'A0003', '2023-07-30', 'Pinjam', '', 'Admin'),
('PJM0002', '2023-07-27', 'A0002', '2023-07-28', 'Kembali', '', 'Admin'),
('PJM0003', '2023-07-27', 'A0002', '2023-07-29', 'Pinjam', '', 'Admin'),
('PJM0005', '2023-07-29', 'A0002', '2023-08-01', 'Pinjam', '', 'sufi'),
('PJM0006', '2023-07-29', 'A0003', '2023-08-01', 'Pinjam', '', 'sufi'),
('PJM0007', '2023-07-29', 'A0001', '2023-08-01', 'Pinjam', '', 'Admin'),
('PJM0008', '2023-07-29', 'A0004', '2023-08-01', 'Pinjam', '', 'sufi'),
('PJM0009', '2023-07-29', 'A0006', '2023-08-02', 'Pinjam', '', 'sufi'),
('PJM0010', '2023-07-29', 'A0007', '2023-07-27', 'Kembali', '', 'sufi'),
('PJM0011', '2023-08-01', 'A0008', '2023-07-31', 'Kembali', '', 'sufi');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(20) DEFAULT NULL,
  `penerbit` varchar(60) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `penerbit`, `keterangan`) VALUES
('P0001', 'Gramedia Pustaka Utama', ''),
('P0002', 'Grasindo', ''),
('P0003', 'Noura Books', ''),
('P0004', 'Era Intermedia', ''),
('P0005', 'Bentang Pustaka', '');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_kembali` int(10) NOT NULL,
  `tgl_kembali` varchar(20) DEFAULT NULL,
  `id_pinjam` varchar(20) DEFAULT NULL,
  `id_denda` varchar(50) DEFAULT NULL,
  `terlambat` varchar(15) DEFAULT NULL,
  `denda` varchar(15) DEFAULT NULL,
  `id_admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_kembali`, `tgl_kembali`, `id_pinjam`, `id_denda`, `terlambat`, `denda`, `id_admin`) VALUES
(17, '2023-07-29', 'PJM0002', NULL, '1 hari', 'Rp.3000', NULL),
(18, '2023-08-01', 'PJM0010', NULL, '5 hari', 'Rp.15000', NULL),
(19, '2023-08-01', 'PJM0011', NULL, '1 hari', 'Rp.4000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_user` varchar(20) NOT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `notelp` varchar(13) DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') DEFAULT NULL,
  `level` enum('Petugas','Kepala','Administrasi') DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_user`, `nama`, `email`, `pass`, `notelp`, `status`, `level`, `foto`) VALUES
('U0001', 'Admin', 'admin@gmail.com', 'admin123', '087892878222', 'Aktif', 'Administrasi', 'user.png'),
('U0003', 'sufi', 'sudigan@gmail.com', '123123', '089699706181', 'Aktif', 'Petugas', 'Screenshot_2023-07-25_213235.png');

-- --------------------------------------------------------

--
-- Table structure for table `p_buku`
--

CREATE TABLE `p_buku` (
  `id_pbuku` int(5) NOT NULL,
  `id_pinjam` varchar(50) DEFAULT NULL,
  `id_buku` varchar(50) DEFAULT NULL,
  `qty` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `p_buku`
--

INSERT INTO `p_buku` (`id_pbuku`, `id_pinjam`, `id_buku`, `qty`) VALUES
(61, 'PJM0001', 'B0004', '1'),
(62, 'PJM0002', 'B0004', '1'),
(63, 'PJM0003', 'B0004', '1'),
(67, 'PJM0005', 'B0002', '2'),
(68, 'PJM0006', 'B0003', '1'),
(69, 'PJM0007', 'B0003', '1'),
(70, 'PJM0008', 'B0008', '1'),
(71, 'PJM0008', 'B0005', '1'),
(72, 'PJM0009', 'B0007', '1'),
(73, 'PJM0010', 'B0008', '1'),
(74, 'PJM0011', 'B0009', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `id_rak` varchar(20) DEFAULT NULL,
  `rak` varchar(60) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`id_rak`, `rak`, `keterangan`) VALUES
('Rak-01', 'Khusus Pemula', ''),
('Rak-02', 'Khusus Pelajar', ''),
('Rak-03', 'Sastra', ''),
('Rak-04', 'Coding', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_kembali`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `p_buku`
--
ALTER TABLE `p_buku`
  ADD PRIMARY KEY (`id_pbuku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_kembali` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `p_buku`
--
ALTER TABLE `p_buku`
  MODIFY `id_pbuku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
