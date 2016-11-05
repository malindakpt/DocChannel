-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2016 at 12:33 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `docchannel`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE IF NOT EXISTS `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docId` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL,
  `weekDay` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `nextDate` date DEFAULT NULL,
  `patientNo` int(11) DEFAULT NULL,
  `maxPatients` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id`, `docId`, `hospitalId`, `weekDay`, `time`, `nextDate`, `patientNo`, `maxPatients`, `enabled`) VALUES
(1, 4, 1, 'Tuesday', '17:55', NULL, 0, 44, 0),
(2, 5, 1, 'Wednesday', '14:22', NULL, 0, 222, 0),
(3, 6, 2, 'Saturday', '15:55', NULL, 0, 41, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE IF NOT EXISTS `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `type`, `phone`) VALUES
(4, 'Waruna Amarasinghe', 2, '07711476576'),
(5, 'Malinda Kumarasinghe', 1, '032446387'),
(6, 'Sumudu Nisansala', 0, '0775092447');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID of the hospital',
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `phone`, `address`) VALUES
(1, 'ASIRI Hospital', '0112345623', '123'),
(2, 'Siyasi Hospitals', '03744231', '123'),
(3, 'Hemas Hospital, Wattala', '0776456778', 'Wattala');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `caption`) VALUES
(0, 'Dentist'),
(1, 'VOG'),
(2, 'SURGEN');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  `actName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `pwd`, `hospitalID`, `actName`) VALUES
('1', '1', 1, '0'),
('a', 'a', 1, 'Malinda Kumarasinghe');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
