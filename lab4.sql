-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2024 at 05:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab4`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `4mh21cs035`
-- (See below for the actual view)
--
CREATE TABLE `4mh21cs035` (
`subcode` char(7)
,`test1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `usn` varchar(10) NOT NULL,
  `ssid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`usn`, `ssid`) VALUES
('4MH20CS003', 101),
('4MH20CS023', 102),
('4MH20CS056', 103),
('4MH20CS076', 104),
('4MH20CS156', 105),
('4MH21CS035', 106),
('4MH21CS105', 107);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `subcode` char(7) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`subcode`, `title`, `sem`, `credits`) VALUES
('18CS51', 'ATC', 8, 6),
('18CS53', 'DBMS', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `usn` char(10) NOT NULL,
  `subcode` char(7) NOT NULL,
  `ssid` int(11) NOT NULL,
  `test1` int(11) NOT NULL,
  `test2` int(11) NOT NULL,
  `test3` int(11) NOT NULL,
  `finalia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`usn`, `subcode`, `ssid`, `test1`, `test2`, `test3`, `finalia`) VALUES
('4MH20CS003', '18CS51', 101, 28, 15, 23, 25.5),
('4MH20CS003', '18CS53', 101, 19, 30, 25, 27.5),
('4MH20CS056', '18CS51', 103, 17, 26, 21, 23.5),
('4MH20CS056', '18CS53', 103, 5, 10, 8, 9),
('4MH20CS076', '18CS51', 104, 27, 5, 10, 18.5),
('4MH20CS076', '18CS53', 104, 27, 5, 17, 22),
('4MH21CS035', '18CS51', 106, 28, 30, 30, 30),
('4MH21CS035', '18CS53', 106, 24, 30, 30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `ssid` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `sec` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`ssid`, `sem`, `sec`) VALUES
(101, 5, 'B'),
(102, 5, 'C'),
(103, 5, 'A'),
(104, 5, 'B'),
(105, 8, 'A'),
(106, 8, 'C'),
(107, 8, 'A'),
(108, 4, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `usn` varchar(10) NOT NULL,
  `sname` varchar(25) NOT NULL,
  `addess` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `sname`, `addess`, `phone`, `gender`) VALUES
('4MH20CS003', 'Sunny', 'kodagu', '5642', 'M'),
('4MH20CS023', 'Meghana', 'Dharwada', '4523', 'F'),
('4MH20CS056', 'pavan', 'banglore', '3456', 'M'),
('4MH20CS076', 'ravi', 'manglore', '8653', 'M'),
('4MH20CS156', 'smitha', 'Mandya', '1568', 'F'),
('4MH21CS035', 'Hemanth', 'Mysore', '8598', 'M'),
('4MH21CS105', 'surya', 'Delhi', '7895', 'M');

-- --------------------------------------------------------

--
-- Structure for view `4mh21cs035`
--
DROP TABLE IF EXISTS `4mh21cs035`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4mh21cs035`  AS SELECT `iamarks`.`subcode` AS `subcode`, `iamarks`.`test1` AS `test1` FROM `iamarks` WHERE `iamarks`.`usn` = '4MH21CS035' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`usn`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`subcode`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`usn`,`subcode`,`ssid`),
  ADD KEY `subcode` (`subcode`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`ssid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`);

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`subcode`) REFERENCES `course` (`subcode`),
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
