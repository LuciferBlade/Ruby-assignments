-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 17, 2019 at 04:07 AM
-- Server version: 5.7.28-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ItemCatalogue`
--

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Value` double DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ID`, `Name`, `Value`, `Date`, `StatusID`, `Location`) VALUES
(1, 'Medalionas', 157.75, '1865-06-13', 1, '605 Poor House Road, Deer Park, New York 11729'),
(2, 'Egiptietiška vaza', 699.95, '1714-12-24', 1, '648 NE. Indian Spring Lane, Plattsburgh, New York 12901'),
(3, 'Praito tukstantmečio Tesla Model S', 3855000.69, '1001-02-03', 5, '8 Illinois Dr., Point Pleasant Beach, New Jersey 08742'),
(4, 'Butelio kamštelis', 0.05, '2017-01-01', 1, '599 Rockaway Rd., Woodstock, Georgia 30188'),
(5, 'Dramblio kaulo šakutė', 3026.75, '1420-01-20', 1, '91 Windfall Rd., Kenosha, Wisconsin 53140'),
(6, 'Deimantiniai lošimo kauliukai', 360.2, '2016-03-20', 3, '50 Euclid Street, Sumter, South Carolina 29150'),
(7, 'Marmurinė kolona', 1700.6, '1100-06-06', 3, '9488 Fairview St., Little Falls, New Jersey 07424');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `StatusName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`ID`, `StatusName`) VALUES
(1, 'Turimas'),
(2, 'Nurašytas'),
(3, 'Parduotas'),
(5, 'Gaunamas'),
(6, 'Atiduotas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_item_status_ID` (`StatusID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_item_status_ID` FOREIGN KEY (`StatusID`) REFERENCES `status` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
