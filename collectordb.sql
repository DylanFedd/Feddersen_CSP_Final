-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2023 at 08:34 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collectordb`
--

-- --------------------------------------------------------

--
-- Table structure for table `collectorlist`
--

CREATE TABLE `collectorlist` (
  `CollectorItemID` int NOT NULL,
  `id` int NOT NULL,
  `ItemID` int NOT NULL,
  `ItemCollected` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collectorlist`
--

INSERT INTO `collectorlist` (`CollectorItemID`, `id`, `ItemID`, `ItemCollected`) VALUES
(1, 3, 1, 1),
(8, 3, 5, 0),
(9, 3, 2, 0),
(10, 3, 4, 0),
(12, 5, 1, 1),
(13, 5, 5, 0),
(14, 6, 8, 1),
(15, 6, 9, 0),
(16, 6, 10, 0),
(17, 5, 2, 1),
(18, 5, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ItemID` int NOT NULL,
  `ItemName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ItemBrand` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ItemID`, `ItemName`, `ItemBrand`) VALUES
(1, 'Tyranid Trygon', 'Warhammer 40k'),
(2, 'Tyranid Hive Guard', 'Warhammer 40k'),
(3, 'Star Wars Millennium Falcon', 'Lego'),
(4, 'Power Miners Crystal King', 'Lego'),
(5, 'Power Miners Magma Mech', 'Lego'),
(6, 'illustrator pikachu', 'Pokemon'),
(7, 'Leman Russ Tank', 'Warhammer 40k'),
(8, 'Optimus Prime Figure', 'Hasbro'),
(9, 'Megatron', 'Hasbro'),
(10, 'Starscream', 'Hasbro');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`) VALUES
(3, 't', 't', 't', '$2y$10$f4JMTVUGl6hcYaRLcKogdemJCtLnyjKF5UXIecCaKp/dL1OjyVeTK'),
(5, 'john', 'blue', 'johnb@yahoo.com', '$2y$10$ZvxSePyBl0S3X2zUxd41L..eVea2ADgtmhxruc6.2TzrcHr8k2YRe'),
(6, 'Tim', 'Ber', 'timb@yahoo.com', '$2y$10$H5OA3eqVaL4xGAsRG9j7oe5dxU.381aec1qygmu8o.vb5c8wDB.YW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collectorlist`
--
ALTER TABLE `collectorlist`
  ADD PRIMARY KEY (`CollectorItemID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collectorlist`
--
ALTER TABLE `collectorlist`
  MODIFY `CollectorItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
