-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2020 at 12:05 PM
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
-- Database: `anna_mail_codereview09`
--
CREATE DATABASE IF NOT EXISTS `anna_mail_codereview09` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `anna_mail_codereview09`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(35) DEFAULT NULL,
  `house_num` int(9) DEFAULT NULL,
  `door_num` int(9) DEFAULT NULL,
  `zip` int(15) DEFAULT NULL,
  `phone` int(15) DEFAULT NULL,
  `type` enum('sender','receiver','postoffice','districenter') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `street`, `house_num`, `door_num`, `zip`, `phone`, `type`) VALUES
(1, 'kampstrasse', 10, 2, 1200, 87348274, 'postoffice'),
(2, 'burgasse', 10, 1, 1700, 82423453, 'postoffice'),
(3, 'ringstrasse', 24, 13, 1100, 7323823, 'postoffice'),
(4, 'qualquerstrasse', 42, 16, 1500, 83711423, 'districenter'),
(5, 'tremstrasse', 74, 3, 1220, 2147483647, 'districenter'),
(6, 'maisumastrasse', 59, 29, 1900, 889493827, 'districenter'),
(7, 'outrastrasse', 652, 40, 1300, 87520294, 'sender'),
(8, 'naoparastrasse', 344, 38, 1400, 889058374, 'sender'),
(9, 'qualquerstrasse', 84, 30, 1210, 80392873, 'sender'),
(10, 'decimastrasse', 10, 10, 1000, 81010101, 'receiver'),
(11, 'naoacaboustrasse', 420, 2, 1700, 83828403, 'receiver'),
(12, 'acaboustrasse', 132, 51, 1800, 83939328, 'receiver');

-- --------------------------------------------------------

--
-- Table structure for table `distribution_center`
--

CREATE TABLE `distribution_center` (
  `distribution_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `phone_distribution` int(15) DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_receiver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distribution_center`
--

INSERT INTO `distribution_center` (`distribution_id`, `fk_address_id`, `phone_distribution`, `date_received`, `fk_package_id`, `fk_employee_id`, `fk_sender_id`, `fk_receiver_id`) VALUES
(1, 4, 38383838, '2018-02-09 10:11:50', 1, 1, 1, 1),
(2, 5, 33998764, '2019-10-10 08:45:03', 2, 2, 2, 2),
(3, 6, 30392846, '2010-04-22 08:54:30', 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `birth_date`, `hire_date`) VALUES
(1, 'Carlos', 'Britto', '1989-02-01', '2017-12-04'),
(2, 'Chico', 'Holanda', '1990-04-28', '2019-05-30'),
(3, 'Caetano', 'Veloso', '1977-01-15', '2018-10-16');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `weight` int(10) DEFAULT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_receiver_id` int(11) DEFAULT NULL,
  `fk_distribution_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `date_sent`, `weight`, `fk_sender_id`, `fk_receiver_id`, `fk_distribution_id`) VALUES
(1, '2018-02-07 11:32:10', 1, 1, 1, 1),
(2, '2019-10-08 08:15:03', 3, 2, 2, 2),
(3, '2010-04-20 10:05:40', 2, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post_office`
--

CREATE TABLE `post_office` (
  `post_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `phone_post` int(15) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office`
--

INSERT INTO `post_office` (`post_id`, `fk_address_id`, `phone_post`, `fk_package_id`, `fk_employee_id`) VALUES
(1, 1, 60795849, 1, 1),
(2, 2, 69472547, 2, 2),
(3, 3, 62535294, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `receiver_id` int(11) NOT NULL,
  `fk_address_id` int(11) NOT NULL,
  `first_name` varchar(35) DEFAULT NULL,
  `last_name` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`receiver_id`, `fk_address_id`, `first_name`, `last_name`) VALUES
(1, 10, 'Paulo', 'Domingues'),
(2, 11, 'Izabella', 'Freitas'),
(3, 12, 'Eunice', 'Carlota');

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `first_name` varchar(35) DEFAULT NULL,
  `last_name` varchar(35) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `fk_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_id`, `first_name`, `last_name`, `email`, `fk_address_id`) VALUES
(1, 'Anna', 'Costa', 'anna@gmail.com', 7),
(2, 'Pedro', 'Lima', 'pedro@gmail.com', 8),
(3, 'Maria', 'Bethania', 'maria@gmail.com', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `distribution_center`
--
ALTER TABLE `distribution_center`
  ADD PRIMARY KEY (`distribution_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`),
  ADD KEY `fk_distribution_id` (`fk_distribution_id`);

--
-- Indexes for table `post_office`
--
ALTER TABLE `post_office`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `distribution_center`
--
ALTER TABLE `distribution_center`
  ADD CONSTRAINT `distribution_center_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `distribution_center_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `distribution_center_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `distribution_center_ibfk_4` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `distribution_center_ibfk_5` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver` (`receiver_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver` (`receiver_id`),
  ADD CONSTRAINT `package_ibfk_4` FOREIGN KEY (`fk_distribution_id`) REFERENCES `distribution_center` (`distribution_id`);

--
-- Constraints for table `post_office`
--
ALTER TABLE `post_office`
  ADD CONSTRAINT `post_office_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `post_office_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `post_office_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
