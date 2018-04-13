-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2017 at 04:17 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java`
--

-- --------------------------------------------------------

--
-- Table structure for table `filliaal`
--

CREATE TABLE `filliaal` (
  `filliaal_id` int(3) NOT NULL,
  `filliaal_adres` char(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filliaal`
--

INSERT INTO `filliaal` (`filliaal_id`, `filliaal_adres`) VALUES
(1, 'Coppenamestraat'),
(2, 'Leysweg'),
(3, 'Gravenstraat');

-- --------------------------------------------------------

--
-- Table structure for table `monteur`
--

CREATE TABLE `monteur` (
  `id` int(3) NOT NULL,
  `naam` char(250) NOT NULL,
  `adres` char(250) NOT NULL,
  `woonplaats` char(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monteur`
--

INSERT INTO `monteur` (`id`, `naam`, `adres`, `woonplaats`) VALUES
(1, 'Shayant Sital', 'Coppenamestraat', 'Paramaribo'),
(2, 'Zoe Jadi', 'Granmankondrestraat', 'Paramaribo');

-- --------------------------------------------------------

--
-- Table structure for table `rooster`
--

CREATE TABLE `rooster` (
  `rooster_id` int(3) NOT NULL,
  `datum` date NOT NULL,
  `filliaal_id` int(3) NOT NULL,
  `mont_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooster`
--

INSERT INTO `rooster` (`rooster_id`, `datum`, `filliaal_id`, `mont_id`) VALUES
(1, '2017-11-07', 1, 1),
(2, '2017-11-07', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filliaal`
--
ALTER TABLE `filliaal`
  ADD PRIMARY KEY (`filliaal_id`);

--
-- Indexes for table `monteur`
--
ALTER TABLE `monteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooster`
--
ALTER TABLE `rooster`
  ADD PRIMARY KEY (`rooster_id`),
  ADD KEY `filliaal_id` (`filliaal_id`),
  ADD KEY `werknemer_id` (`mont_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filliaal`
--
ALTER TABLE `filliaal`
  MODIFY `filliaal_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `monteur`
--
ALTER TABLE `monteur`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rooster`
--
ALTER TABLE `rooster`
  MODIFY `rooster_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rooster`
--
ALTER TABLE `rooster`
  ADD CONSTRAINT `rooster_ibfk_1` FOREIGN KEY (`filliaal_id`) REFERENCES `filliaal` (`filliaal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rooster_ibfk_2` FOREIGN KEY (`mont_id`) REFERENCES `monteur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
