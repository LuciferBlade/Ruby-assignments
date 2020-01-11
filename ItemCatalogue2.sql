-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 11, 2020 at 01:03 PM
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
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `value`, `date`, `status_id`, `location`) VALUES
(1, 'Medalionas', 157.75, '1865-06-13', 1, '605 Poor House Road, Deer Park, New York 11729'),
(2, 'Egiptietiška vaza', 699.95, '1714-12-24', 1, '648 NE. Indian Spring Lane, Plattsburgh, New York 12901'),
(3, 'Praito tukstantmečio Tesla Model S', 3855000.69, '1001-02-03', 5, '8 Illinois Dr., Point Pleasant Beach, New Jersey 08742'),
(4, 'Butelio kamštelis', 0.05, '2017-01-01', 1, '599 Rockaway Rd., Woodstock, Georgia 30188'),
(5, 'Dramblio kaulo šakutė', 3026.75, '1420-01-20', 1, '91 Windfall Rd., Kenosha, Wisconsin 53140'),
(6, 'Deimantiniai lošimo kauliukai', 360.2, '2016-03-20', 3, '50 Euclid Street, Sumter, South Carolina 29150'),
(7, 'Marmurinė kolona', 1700.6, '1100-06-06', 3, '9488 Fairview St., Little Falls, New Jersey 07424'),
(19, 'ananasas', 11.95, '2020-01-01', 3, 'Namie');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `status_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status_name`) VALUES
(1, 'Turimas'),
(2, 'Nurašytas'),
(3, 'Parduotas'),
(4, 'Kažkur anapus'),
(5, 'Gaunamas'),
(6, 'Atiduotas');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password_digest`) VALUES
(1, 'max@max.max', 'max', '$2a$12$9VUDYYZ6/T1sGoKrH0Aqpuw1DZ.2amC/mreB27hag4X/PbZdirMEK'),
(5, 'tom@tom.tom', 'tom', '$2a$12$ZM5wy09AElzxuki2TbYNueQVgLFkeFwr7uRih/0sE4t8PVc9Yzp1G'),
(6, 'one@one.one', 'one', '$2a$12$TURCJ0X2JOjMptr54c1ewO5c8YYpm/5i5v0Tqe6wnoGqzHN/xMrpu'),
(8, 'two@two.two', 'two', '$2a$12$6gzRq3uRn5t69SiLFc2E3O9.yQenj.uD3LcEBX5C8HYGO/e2oDalW'),
(10, 'ana@ana.ana', 'ana', '$2a$12$196dkhaKgJ.X.JBmhGCwo.lsO6bhmV9vQv/vs2w4vSIF13zDYRqbC'),
(11, 'ana2@ana2.ana2', 'ana2', '$2a$12$vBtUk2GubxmWD.xs03.GS.zhqs45Wazd4kxQXiOOwaXt7OYAVHH6m');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_item_status_ID` (`status_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `FK_item_status_ID` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
