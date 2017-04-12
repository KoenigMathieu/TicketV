-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2017 at 02:51 PM
-- Server version: 5.5.42-log
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ticketV`
--

-- --------------------------------------------------------

--
-- Table structure for table `mise_a_jour`
--

CREATE TABLE `mise_a_jour` (
  `id_mise_a_jour` int(11) NOT NULL,
  `remarque` text COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `effectue` tinyint(4) DEFAULT '0',
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mise_a_jour`
--

INSERT INTO `mise_a_jour` (`id_mise_a_jour`, `remarque`, `date`, `version`, `effectue`, `id_projet`) VALUES
(2, 'Test', '2017-04-10 00:00:00', 'Maverick', 0, 7),
(3, 'Test test', '2012-01-01 00:00:00', 'Snow Leopard', 0, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  ADD PRIMARY KEY (`id_mise_a_jour`),
  ADD KEY `id_projet` (`id_projet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  MODIFY `id_mise_a_jour` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  ADD CONSTRAINT `mise_a_jour_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`);
