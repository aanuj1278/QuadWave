-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 03:49 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quadwave`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `Eid` int(11) NOT NULL,
  `DOJ` datetime DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `EName` varchar(1500) DEFAULT NULL,
  `YOE` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `Eid`, `DOJ`, `Designation`, `EName`, `YOE`) VALUES
(11, 801, '2022-11-13 00:12:42', 'leader', 'anuj', 5),
(12, 802, '2022-11-13 00:12:59', 'caption', 'shyam', 5),
(13, 803, '2022-11-13 00:14:10', 'labour', 'kedar', 2);

-- --------------------------------------------------------

--
-- Table structure for table `emp_lookup`
--

CREATE TABLE `emp_lookup` (
  `id` int(10) NOT NULL,
  `Emp_id` int(10) NOT NULL,
  `Emp_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_lookup`
--

INSERT INTO `emp_lookup` (`id`, `Emp_id`, `Emp_name`) VALUES
(1, 801, 'anuj'),
(2, 802, 'shyam'),
(3, 803, 'kedar'),
(4, 804, 'manisha'),
(5, 805, 'naina'),
(6, 806, 'kana'),
(7, 807, 'lucky'),
(8, 808, 'Gopal agarwal'),
(9, 809, 'Rajesh kumar'),
(10, 810, 'Megha sharma'),
(11, 811, 'Mohit sharma');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Eid` (`Eid`);

--
-- Indexes for table `emp_lookup`
--
ALTER TABLE `emp_lookup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `emp_lookup`
--
ALTER TABLE `emp_lookup`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
