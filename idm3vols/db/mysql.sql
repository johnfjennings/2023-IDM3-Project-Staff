-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2020 at 12:11 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmap`
--
CREATE DATABASE IF NOT EXISTS `bookmap` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;



USE `bookmap`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `Book` (
  `BookID` int(11) NOT NULL,
  `ISBN` varchar(50) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `Book` (`BookID`, `ISBN`, `Title`, `Author`, `Price`) VALUES
(1, 'A1234xr', 'Book r', 'lizxrr', 400.55),
(2, 'B1234', 'r', 'r', 4),
(5, '12388', 'book', 'alan', 789.99),
(7, 'f123', 'ffffff', 'ff', 678.99),
(8, 'q', 'wtitle', 'www', 7.99),
(9, 'zzzz', 'nnnn', 'nnnn', 7.99),
(10, '12345678', 'great', 'lizx', 60.99),
(11, '56565', 'book a', 'liz', 20.36),
(12, '9999', 'tom99', 'tom', 9.99),
(14, '5555', 'MyBook', 'jkjkj', 2.36),
(15, 'hs', 'sss', 'hs', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`BookID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `Book`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



GRANT ALL ON `bookmap`.* TO 'site_user'@'%' IDENTIFIED BY 'site_password';
