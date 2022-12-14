-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 10, 2022 at 08:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `picture`, `email`, `password`, `phone`, `createdAt`) VALUES
(1, 'Mohamed Ismail', 'https://res.cloudinary.com/djhd6qba5/image/upload/v1653127020/Waraqa/mirurhydcw7biba5w4gu.png', 'admin@gmail.com', '$2a$10$rFyl/GVzazj76HmvXkayuOQ81btDmYwHMKMFN1QreB5CNBLlvv8I2', 11, '0000-00-00 00:00:00'),
(2, 'Mohamed Ismail', NULL, 'waraqaweb@gmail.com', '$2a$10$Qeqoi9fL/GjSLUd0K6YlNeGPSc2O9e998l0o9/xgvrBpqXzB3igvO', NULL, '2022-04-09 03:03:27'),
(3, 'Mohamed Ismail', NULL, 'mo7amed2225@gmail.com', '$2a$10$K8fPsoEZROp4sEz8k80Lt.oVSjwMMmYpBlfJghW5dyq4PsqPqwlGe', NULL, '2022-04-09 14:37:18'),
(4, 'Ahmed Ismail', NULL, 'a7med0122@gmail.com', '$2a$10$IlkWNBTybr5rvdJQCqv9we6iFGsVbDYUe.aTXD2chkHD6uWt0UDKy', NULL, '2022-04-12 02:07:41'),
(5, 'Lamiaa Ali', NULL, 'lamiaaali1997@gmail.com', '$2a$10$fBcTAP/CmulqO4O3GJ13iugrZ6cibihH2EP4TM3sMp1lvQstnnGxK', NULL, '2022-04-12 02:08:43'),
(6, 'taky', NULL, 'taky@admin.com', '$2a$10$wQFJe6y1aqKCJCRKcsYZmO7r6oN7Mih6bmlI7bxd3LWUBomvJz32O', NULL, '2022-07-10 11:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `scheduleID` int(11) DEFAULT NULL,
  `invoiceID` int(11) DEFAULT NULL,
  `guardianID` int(11) DEFAULT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `studentID` int(11) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `classTitle` varchar(50) DEFAULT NULL,
  `startingDate` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `guests` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `timeZone` varchar(100) NOT NULL,
  `countForTeacher` tinyint(4) NOT NULL DEFAULT 1,
  `countForStudent` tinyint(4) NOT NULL DEFAULT 1,
  `countOnInvoice` int(11) DEFAULT 1,
  `teacherReschedule` timestamp NULL DEFAULT NULL,
  `studentReschedule` timestamp NULL DEFAULT NULL,
  `reportReminded` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:Default(active), 1:Attended, 2: Cancelled by student, 3:Cancelled by teacher, 4: Missed by student, 5: Missed by teacher, 6: Cancelled by admin',
  `previousAssignment` tinyint(1) DEFAULT NULL COMMENT '1:Done, 2:Incomplete, 3:Missed, 4:Not assigned',
  `classPerformance` tinyint(1) DEFAULT NULL,
  `newAssignment` varchar(255) DEFAULT NULL,
  `supervisorNotes` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `scheduleID`, `invoiceID`, `guardianID`, `teacherID`, `studentID`, `subject`, `classTitle`, `startingDate`, `duration`, `guests`, `description`, `timeZone`, `countForTeacher`, `countForStudent`, `countOnInvoice`, `teacherReschedule`, `studentReschedule`, `reportReminded`, `status`, `previousAssignment`, `classPerformance`, `newAssignment`, `supervisorNotes`, `createdAt`) VALUES
(19, 2, 2, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-10 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(20, 2, 2, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-17 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 3, 1, NULL, NULL, '2022-04-27 08:04:01'),
(21, 2, 2, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-24 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(22, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-31 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(23, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-06-07 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(24, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-06-14 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(25, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-06-21 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(27, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-04 18:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 1, 4, 5, NULL, NULL, '2022-04-27 08:04:01'),
(28, 2, 2, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-11 18:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(29, 2, 2, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-18 18:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 3, 1, NULL, NULL, '2022-04-27 08:04:01'),
(30, 2, 2, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-05-25 18:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(31, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-06-01 18:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(32, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-06-08 18:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(33, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-06-15 18:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(34, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-06-22 18:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:04:01'),
(231, 16, 9, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-05-01 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(232, 16, 9, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-05-08 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(233, 16, 9, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-05-15 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, NULL, NULL, '2022-04-27 08:30:15'),
(234, 16, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-05-22 09:00:00', 90, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(235, 16, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-05-29 09:00:00', 90, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(236, 16, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-06-05 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(237, 16, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-06-12 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(238, 16, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-06-19 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(239, 16, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-06-26 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(240, NULL, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-04-27 08:30:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, NULL, '2022-04-27 08:30:39'),
(241, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-01 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(242, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-08 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(243, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-15 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(244, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-22 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(245, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-29 17:00:00', 60, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(246, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-05 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(247, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-12 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(248, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-19 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(249, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-26 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(250, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-04-30 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(251, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-07 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 5, NULL, NULL, '2022-04-27 08:35:33'),
(252, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-14 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(253, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-21 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(254, 17, 5, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-05-28 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(255, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-04 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(256, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-11 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(257, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-18 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(258, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-06-25 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:35:33'),
(278, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-08 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 5, NULL, NULL, '2022-04-27 08:38:50'),
(279, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-15 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, NULL, NULL, '2022-04-27 08:38:50'),
(280, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-22 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(281, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-29 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(282, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-05 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(283, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-12 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(284, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-19 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(285, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-26 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(286, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-04-27 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 4, 4, 5, NULL, NULL, '2022-04-27 08:38:50'),
(287, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-04 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(288, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-11 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(289, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-18 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(290, 19, 11, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-05-25 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(291, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-01 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(292, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-08 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(293, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-15 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(294, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-06-22 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-27 08:38:50'),
(494, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-07-03 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 07:18:10'),
(496, 29, 10, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-05-05 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(497, 29, 10, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-05-12 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(498, 29, 10, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-05-19 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(499, 29, 10, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-05-26 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(500, 29, NULL, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-06-02 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(501, 29, NULL, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-06-09 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(502, 29, NULL, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-06-16 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(503, 29, NULL, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-06-23 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(504, 29, NULL, NULL, 2, 48, 'Advanced arabic', 'Classical Arabic', '2022-06-30 06:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 09:29:04'),
(505, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-07-05 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:13:22'),
(506, 30, 18, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-01 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(507, 30, 18, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-08 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 2, 5, '???????????? ?????????? ?????????????? ?????????????? ???????? ?????????? ???? ???????? ????????????', NULL, '2022-04-28 11:21:18'),
(508, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-15 16:00:00', 30, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(509, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-22 16:00:00', 30, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(510, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-29 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(511, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-06-05 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(512, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-06-12 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(513, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-06-19 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(514, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-06-26 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(515, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-03 16:00:00', 30, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(516, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-10 16:00:00', 30, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 1, 1, 5, 'The same \n', NULL, '2022-04-28 11:21:18'),
(517, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-17 16:00:00', 30, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 1, 1, 5, 'The same', NULL, '2022-04-28 11:21:18'),
(518, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-24 16:00:00', 30, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(519, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-05-31 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(520, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-06-07 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(521, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-06-14 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(522, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-06-21 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(523, 31, NULL, NULL, 11, 100, 'Intro to classical books', 'Islamic Studies', '2022-05-01 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:23:15'),
(524, 31, NULL, NULL, 11, 100, 'Intro to classical books', 'Islamic Studies', '2022-05-08 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:23:15'),
(525, 31, NULL, NULL, 11, 100, 'Intro to classical books', 'Islamic Studies', '2022-05-15 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:23:15'),
(532, 31, NULL, NULL, 11, 100, 'Intro to classical books', 'Islamic Studies', '2022-05-04 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:23:15'),
(533, 31, NULL, NULL, 11, 100, 'Intro to classical books', 'Islamic Studies', '2022-05-11 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 4, 5, NULL, NULL, '2022-04-28 11:23:15'),
(534, 31, NULL, NULL, 11, 100, 'Intro to classical books', 'Islamic Studies', '2022-05-18 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:23:15'),
(540, 32, 20, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-03 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(541, 32, 20, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-10 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(542, 32, 20, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-17 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, NULL, NULL, '2022-04-28 11:24:45'),
(543, 32, 20, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-24 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(544, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-31 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(545, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-07 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(546, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-14 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(547, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-21 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(548, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-28 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(549, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-04-28 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 3, 5, 'None', 'None ', '2022-04-28 11:24:45'),
(550, 32, 20, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-05 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, NULL, NULL, '2022-04-28 11:24:45'),
(551, 32, 20, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-12 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, NULL, NULL, '2022-04-28 11:24:45'),
(552, 32, 20, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-19 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, '?????????????? ?????????????? ???? ???????? ????????????', NULL, '2022-04-28 11:24:45'),
(553, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-05-26 14:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(554, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-02 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(555, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-09 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(556, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-16 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(557, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-06-23 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:24:45'),
(559, 33, 21, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-10 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, '???????? ??????????????', NULL, '2022-04-28 11:26:02'),
(560, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-17 20:00:00', 60, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 1, 1, 5, '???????????? ???????? ?????????????? ???????????????? ??????????????', NULL, '2022-04-28 11:26:02'),
(561, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-24 20:00:00', 60, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(562, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-31 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(563, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-06-07 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(564, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-06-14 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(565, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-06-21 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(566, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-04-28 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 2, 5, 'Class not taken', NULL, '2022-04-28 11:26:02'),
(567, 33, 21, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-05 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 5, '?????? ???????? ??????????????', '?????? ???????????????? ???? ?????? ?????? ???????? ???????????? ???????? ???? ?????????? ?????? ?????????? ', '2022-04-28 11:26:02'),
(568, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-12 20:00:00', 60, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(569, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-19 20:00:00', 60, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(570, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-05-26 20:00:00', 60, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(571, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-06-02 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(572, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-06-09 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(573, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-06-16 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(574, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-06-23 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(576, 34, 21, NULL, 11, 59, 'Foundation level', 'Quran', '2022-05-10 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 2, 5, '', '', '2022-04-28 11:27:15'),
(577, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-05-17 21:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 1, 2, 5, NULL, NULL, '2022-04-28 11:27:15'),
(578, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-05-24 21:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(579, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-05-31 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(580, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-06-07 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(581, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-06-14 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(582, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-06-21 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(583, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-04-28 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 3, 5, 'None', 'None', '2022-04-28 11:27:15'),
(585, 34, 21, NULL, 11, 59, 'Foundation level', 'Quran', '2022-05-12 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 2, 5, '???????? ???????? ??????????????', NULL, '2022-04-28 11:27:15'),
(586, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-05-19 21:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(587, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-05-26 21:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(588, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-06-02 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(589, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-06-09 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(590, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-06-16 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(591, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-06-23 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(592, 35, 22, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-05-04 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:28:14'),
(593, 35, 22, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-05-11 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 5, NULL, NULL, '2022-04-28 11:28:14'),
(594, 35, 22, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-05-18 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:28:14'),
(595, 35, 22, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-05-25 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:28:14'),
(596, 35, NULL, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-06-01 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:28:14'),
(597, 35, NULL, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-06-08 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:28:14'),
(598, 35, NULL, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-06-15 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:28:14'),
(599, 35, NULL, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-06-22 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:28:14'),
(600, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-04-29 14:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:29:18'),
(601, 36, 23, NULL, 11, 42, 'Foundation level', 'Quran', '2022-05-06 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 5, '???? ??????????????', NULL, '2022-04-28 11:29:18'),
(602, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-05-13 14:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 1, 1, 5, NULL, NULL, '2022-04-28 11:29:18'),
(603, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-05-20 14:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:29:18'),
(604, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-05-27 14:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:29:18'),
(605, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-06-03 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:29:18'),
(606, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-06-10 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:29:18'),
(607, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-06-17 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:29:18'),
(608, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-06-24 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 11:29:18'),
(609, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-07-05 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-28 21:14:22'),
(610, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-07-05 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-29 14:18:11'),
(611, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-07-05 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-04-29 14:19:20'),
(619, 33, NULL, NULL, 11, 60, 'Pre-reading level', 'Quran', '2022-07-12 20:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-06 22:17:12'),
(620, 32, NULL, NULL, 11, 106, 'Intermediate arabic', 'Arabic Language', '2022-07-12 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-06 22:19:20'),
(621, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-07-01 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-06 22:21:08'),
(661, NULL, NULL, NULL, 2, 56, 'Foundation level', 'Billing', '2022-05-07 21:20:00', 60, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 0, 1, 4, 5, NULL, NULL, '2022-05-07 21:19:21'),
(662, NULL, NULL, NULL, 2, 52, 'Foundation level', 'Billing', '2022-05-07 21:20:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, NULL, '2022-05-07 21:19:45'),
(663, 39, NULL, NULL, 11, 113, 'Foundation level', 'Quran', '2022-05-11 20:00:00', 45, '', '', 'Africa/Cairo', 1, 0, 1, NULL, NULL, 1, 1, 4, 5, NULL, NULL, '2022-05-08 10:20:27'),
(674, NULL, 1, NULL, 2, 29, 'Foundation level', 'Quran', '2022-05-08 12:04:00', 60, '', '', 'Africa/Cairo', 0, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, NULL, '2022-05-08 12:04:00'),
(675, 17, NULL, NULL, 2, 44, 'Tajweed basics', 'Quran', '2022-07-03 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 12:16:19'),
(680, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-07-12 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 12:34:32'),
(709, 19, NULL, NULL, 2, 15, 'Tajweed basics', 'Quran', '2022-07-10 15:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 15:50:15'),
(710, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-05-10 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 3, 4, '?????? ??????????????', NULL, '2022-05-08 19:19:30'),
(711, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-05-17 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 2, 3, '?????????? ???????????? ???????? ???????? ?????????????? ?????? ?????????? 6', NULL, '2022-05-08 19:19:30'),
(712, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-05-24 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(713, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-05-31 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(714, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-07 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(715, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-14 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(716, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-21 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(717, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-28 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(718, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-07-05 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(719, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-05-14 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 2, 4, '?????????? ???????????? ?????????????? ??????????????\n???????? ???????? ?????????????? ?????? ?????????? ?????? 7', NULL, '2022-05-08 19:19:30'),
(720, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-05-21 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 2, 3, '?????? ???????? ?????????????? ?????? ?????????? ?????? 7', NULL, '2022-05-08 19:19:30'),
(721, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-05-28 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(722, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-04 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(723, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-11 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(724, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-18 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(725, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-06-25 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(726, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-07-02 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:19:30'),
(727, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-05-08 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 3, 'Practicing Ablution', NULL, '2022-05-08 19:20:59'),
(728, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-05-15 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 4, NULL, NULL, '2022-05-08 19:20:59'),
(729, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-05-22 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(730, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-05-29 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(731, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-05 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(732, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-12 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(733, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-19 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(734, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-26 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(735, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-07-03 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(736, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-05-14 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 2, 3, 1, NULL, NULL, '2022-05-08 19:20:59'),
(737, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-05-21 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 4, '???????? ?????? ???????? ???? ???????? ??????????', NULL, '2022-05-08 19:20:59'),
(738, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-05-28 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(739, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-04 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(740, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-11 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(741, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-18 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(742, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-06-25 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(743, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-07-02 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(744, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-05-08 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 3, 'Practicing Ablution ', NULL, '2022-05-08 19:22:29'),
(745, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-05-15 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 4, '?????? ???????? 9 ???? ???????? ??????', NULL, '2022-05-08 19:22:29'),
(746, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-05-22 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(747, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-05-29 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(748, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-05 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(749, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-12 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(750, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-19 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(751, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-26 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(752, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-07-03 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(753, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-05-14 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 2, 3, 1, NULL, NULL, '2022-05-08 19:22:29'),
(754, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-05-21 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 4, '???????? ?????? ?????? ???? ????????????', NULL, '2022-05-08 19:22:29'),
(755, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-05-28 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(756, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-04 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(757, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-11 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(758, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-18 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(759, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-06-25 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(760, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-07-02 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(761, 44, 6, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-05-14 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 3, '???????? ??????????????', NULL, '2022-05-08 19:24:44'),
(762, 44, 6, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-05-21 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 3, '?????? ???????? ??????????????', NULL, '2022-05-08 19:24:44'),
(763, 44, 6, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-05-28 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:24:44'),
(764, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-06-04 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:24:44'),
(765, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-06-11 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:24:44'),
(766, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-06-18 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:24:44'),
(767, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-06-25 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:24:44'),
(768, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-02 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:24:44'),
(769, 45, 6, NULL, 5, 72, 'Foundation level', 'Quran', '2022-05-14 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 3, '???????? ?????????? ?????????????? ??????????', NULL, '2022-05-08 19:25:06'),
(770, 45, 6, NULL, 5, 72, 'Foundation level', 'Quran', '2022-05-21 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 3, '?????? ???????? ??????????????', NULL, '2022-05-08 19:25:06'),
(771, 45, 6, NULL, 5, 72, 'Foundation level', 'Quran', '2022-05-28 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:25:06'),
(772, 45, NULL, NULL, 5, 72, 'Foundation level', 'Quran', '2022-06-04 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:25:06'),
(773, 45, NULL, NULL, 5, 72, 'Foundation level', 'Quran', '2022-06-11 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:25:06'),
(774, 45, NULL, NULL, 5, 72, 'Foundation level', 'Quran', '2022-06-18 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:25:06'),
(775, 45, NULL, NULL, 5, 72, 'Foundation level', 'Quran', '2022-06-25 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:25:06'),
(776, 45, NULL, NULL, 5, 72, 'Foundation level', 'Quran', '2022-07-02 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:25:06'),
(777, 46, 5, NULL, 5, 45, 'Foundation level', 'Quran', '2022-05-08 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 4, NULL, NULL, '2022-05-08 19:26:14'),
(778, 46, 5, NULL, 5, 45, 'Foundation level', 'Quran', '2022-05-15 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 4, NULL, NULL, '2022-05-08 19:26:14'),
(779, 46, 5, NULL, 5, 45, 'Foundation level', 'Quran', '2022-05-22 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(780, 46, 5, NULL, 5, 45, 'Foundation level', 'Quran', '2022-05-29 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(781, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-05 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(782, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-12 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(783, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-19 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(784, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-26 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(785, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-07-03 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(786, 46, 5, NULL, 5, 45, 'Foundation level', 'Quran', '2022-05-14 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 4, '?????? ?????????? 19 ???? ???????? ????????', NULL, '2022-05-08 19:26:14'),
(787, 46, 5, NULL, 5, 45, 'Foundation level', 'Quran', '2022-05-21 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(788, 46, 5, NULL, 5, 45, 'Foundation level', 'Quran', '2022-05-28 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(789, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-04 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(790, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-11 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(791, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-18 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(792, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-06-25 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(793, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-07-02 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:14'),
(794, 47, 5, NULL, 5, 46, 'Foundation level', 'Quran', '2022-05-08 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 3, NULL, NULL, '2022-05-08 19:26:45'),
(795, 47, 5, NULL, 5, 46, 'Foundation level', 'Quran', '2022-05-15 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 3, NULL, NULL, '2022-05-08 19:26:45'),
(796, 47, 5, NULL, 5, 46, 'Foundation level', 'Quran', '2022-05-22 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(797, 47, 5, NULL, 5, 46, 'Foundation level', 'Quran', '2022-05-29 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(798, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-05 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(799, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-12 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(800, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-19 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(801, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-26 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(802, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-07-03 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(803, 47, 5, NULL, 5, 46, 'Foundation level', 'Quran', '2022-05-14 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 4, '?????? ?????????? 14 ???? ???????? ????????', NULL, '2022-05-08 19:26:45');
INSERT INTO `classes` (`id`, `scheduleID`, `invoiceID`, `guardianID`, `teacherID`, `studentID`, `subject`, `classTitle`, `startingDate`, `duration`, `guests`, `description`, `timeZone`, `countForTeacher`, `countForStudent`, `countOnInvoice`, `teacherReschedule`, `studentReschedule`, `reportReminded`, `status`, `previousAssignment`, `classPerformance`, `newAssignment`, `supervisorNotes`, `createdAt`) VALUES
(804, 47, 5, NULL, 5, 46, 'Foundation level', 'Quran', '2022-05-21 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 3, '???????? ????????', NULL, '2022-05-08 19:26:45'),
(805, 47, 5, NULL, 5, 46, 'Foundation level', 'Quran', '2022-05-28 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(806, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-04 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(807, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-11 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(808, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-18 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(809, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-06-25 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(810, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-07-02 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:26:45'),
(811, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-09 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 3, 'revision', NULL, '2022-05-08 19:29:23'),
(812, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-16 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 2, 3, '???????????? ?????? ?????? ???? ??', NULL, '2022-05-08 19:29:23'),
(813, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-23 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(814, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-30 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(815, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-06 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(816, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-13 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(817, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-20 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(818, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-27 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(819, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-07-04 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(820, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-10 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 3, 'letters ?? ??', NULL, '2022-05-08 19:29:23'),
(821, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-17 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 2, 3, 1, NULL, NULL, '2022-05-08 19:29:23'),
(822, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-24 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(823, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-31 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(824, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-07 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(825, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-14 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(826, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-21 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(827, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-28 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(828, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-07-05 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(829, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-11 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 4, '???????????? ?? ?? ', NULL, '2022-05-08 19:29:23'),
(830, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-18 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(831, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-05-25 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(832, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-01 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(833, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-08 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(834, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-15 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(835, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-22 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(836, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-06-29 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(837, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-07-06 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:29:23'),
(838, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-05-10 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 3, 4, 'revision', NULL, '2022-05-08 19:30:27'),
(839, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-05-17 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(840, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-05-24 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(841, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-05-31 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(842, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-06-07 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(843, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-06-14 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(844, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-06-21 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(845, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-06-28 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(846, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-07-05 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(847, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-08 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 4, NULL, NULL, '2022-05-08 19:40:18'),
(848, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-15 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 4, '???????????? > ??', NULL, '2022-05-08 19:40:18'),
(849, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-22 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 4, '???????????? ?????? ?????? ??', NULL, '2022-05-08 19:40:18'),
(850, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-29 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(851, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-05 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(852, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-12 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(853, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-19 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(854, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-26 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(855, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-07-03 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(856, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-09 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 5, '?????? ???????????? ?? ?? ?? ?????????? ????????????', NULL, '2022-05-08 19:40:18'),
(857, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-16 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 4, '???????????? ???? ?????? ??', NULL, '2022-05-08 19:40:18'),
(858, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-23 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(859, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-05-30 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(860, 50, 25, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-06 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(861, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-13 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(862, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-20 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(863, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-06-27 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(864, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-07-04 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(866, 42, NULL, NULL, 5, 82, 'Pre-reading level', 'Arabic', '2022-07-10 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:44:06'),
(867, 43, NULL, NULL, 5, 83, 'Pre-reading level', 'Arabic', '2022-07-10 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:45:09'),
(868, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-07-10 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:46:26'),
(869, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-07-10 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-08 19:47:36'),
(871, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-07-18 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-09 18:54:58'),
(893, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-07-03 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-09 22:13:17'),
(911, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-07-12 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-10 16:46:35'),
(912, 49, NULL, NULL, 5, 29, 'Foundation level', 'Quran', '2022-07-12 17:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-10 18:03:00'),
(914, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-07-25 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-10 18:31:28'),
(917, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-08-01 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:32:04'),
(919, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-16 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 5, NULL, '???????????? ???? ???????????? - ?????????? ???????????????? ???? ?????????????? ', '2022-05-11 18:44:41'),
(920, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-23 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(921, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-30 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(922, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-06 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(923, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-13 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(924, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-20 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(925, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-27 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(926, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-07-04 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(927, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-17 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, '???????????? + ?????????? ?????? 14 ???????? ???? ?????? ???? ', '2022-05-11 18:44:41'),
(928, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-24 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(929, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-31 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(930, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-07 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(931, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-14 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(932, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-21 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(933, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-28 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(934, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-07-05 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(935, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-11 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, '???????? ???????????? ???????????? ???????????? ?? ???????????? - ?????????? ???????????? ?? ?????????????? ?????? ???????? ??????', '2022-05-11 18:44:41'),
(936, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-18 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, '???????????? ?????? ?????? ???????????? ???? ?????????????? ?????? ???????? ?????????? - ?????????? ?????????????? ?? ?????????????? ', '2022-05-11 18:44:41'),
(937, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-25 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(938, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-01 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(939, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-08 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(940, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-15 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(941, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-22 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(942, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-29 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(943, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-07-06 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(944, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-12 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 3, 4, 1, NULL, NULL, '2022-05-11 18:44:41'),
(945, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-19 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, '???????????? ?????? ???????? ???? ???????????????? ?????? ?????????? + ???? ??????????', '2022-05-11 18:44:41'),
(946, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-26 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(947, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-02 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(948, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-09 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(949, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-16 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(950, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-23 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(951, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-30 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(952, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-07-07 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(953, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-13 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 3, 4, 1, NULL, NULL, '2022-05-11 18:44:41'),
(954, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-20 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 4, NULL, '???????????? ???? ?????????? ?????? ?????????????? ', '2022-05-11 18:44:41'),
(955, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-27 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(956, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-03 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(957, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-10 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(958, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-17 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(959, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-06-24 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(960, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-07-01 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(961, 53, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-07-08 20:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(962, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-16 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 5, ' ???????????? ???????????? ???????? ( ?????????? ???????? ???????? )', '?????? ???????????? ?? 51 ?????? ?????????????? ', '2022-05-11 18:47:16'),
(963, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-23 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(964, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-30 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(965, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-06 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(966, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-13 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(967, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-20 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(968, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-27 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(969, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-07-04 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(970, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-07-11 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(971, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-17 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 4, '???????? ?????????? ??????????', '?????? ???????????? ?? 52 ?????? ?????????? ???? ???????????? ???????? - ?????????????? ???? 1:4 ', '2022-05-11 18:47:16'),
(972, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-24 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(973, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-31 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(974, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-07 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(975, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-14 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(976, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-21 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(977, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-28 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(978, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-07-05 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(979, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-11 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(980, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-18 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, '???????????? ?????????? ?????????? - ?????????? ?????? ?????????? ( ???????? ????????)', '?????? ???????????? ?? 52 ?????? ?????????? ?????????? ?????????? - ?????? ???????? ?????????????? ???????? ?? ???????? ', '2022-05-11 18:47:16'),
(981, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-05-25 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(982, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-01 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(983, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-08 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(984, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-15 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(985, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-22 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(986, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-06-29 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(987, 54, NULL, NULL, 9, 91, 'Foundation level', 'Quran', '2022-07-06 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:47:16'),
(988, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-16 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 3, ' ?????????? ???????? ???????? ???????????? ???????????? ???? ?????? ??- ???????????? ???????????? ???? ?? ?????? ?? ', '?????? ???????????? ?? 2 - ?????????? ???????????? ?? ?? ?? - ?????????? ???????????? ???? ?????? ?????? ?? ????????????', '2022-05-11 18:51:58'),
(989, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-23 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(990, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-30 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(991, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-06 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(992, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-13 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(993, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-20 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(994, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-27 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(995, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-07-04 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(996, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-17 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 4, 1, 1, NULL, NULL, '2022-05-11 18:51:58'),
(997, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-24 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(998, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-31 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(999, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-07 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1000, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-14 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1001, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-21 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1002, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-28 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1003, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-07-05 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1004, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-11 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 4, NULL, '?????????????? ?????? ?? ?? ?? ?? ?????????? ???? ?????????? - ?????????? ???????????? ???????? ??????????', '2022-05-11 18:51:58'),
(1005, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-18 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 4, '?????????? ???????????? ?????????? ???? ?????? ?????? ??????  ', '?????????? ???????????? ???? ?????? ?????? ?????? ???????????????? ?????????????? - ?????? ?????????? ', '2022-05-11 18:51:58'),
(1006, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-25 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1007, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-01 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1008, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-08 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1009, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-15 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1010, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-22 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1011, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-29 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1012, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-07-06 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1013, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-12 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 3, 4, 1, NULL, NULL, '2022-05-11 18:51:58'),
(1014, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-19 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 1, 4, NULL, '?????????? ???????????? ???? ?????? ?????? ?????? ( ?????????? + ?????????????? ??????????????) - ?????????? ???????????? ?? ?? ?? ?? ???????????????? ????????????????', '2022-05-11 18:51:58'),
(1015, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-05-26 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1016, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-02 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1017, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-09 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1018, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-16 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1019, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-23 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1020, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-06-30 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1021, 55, NULL, NULL, 9, 30, 'Foundation level', 'Quran', '2022-07-07 19:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(1022, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-05-16 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 4, 5, NULL, '???????? - ?????????? - ???????? -?????????? ?????????? - ???????? - ???????? - ????????????', '2022-05-11 18:54:49'),
(1023, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-05-23 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1024, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-05-30 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1025, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-06 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1026, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-13 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1027, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-20 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1028, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-27 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1029, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-07-04 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1030, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-05-11 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 4, NULL, '?????????????? ???? ???? ?????? ???????? ???????? -???????????? ??????????????/ ??????????????', '2022-05-11 18:54:49'),
(1031, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-05-18 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 5, NULL, '????????/ ?????????? - ?????????? / ????????- ???????? - ??????????/ ?????????? - ????????/???????? - ???????????? ', '2022-05-11 18:54:49'),
(1032, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-05-25 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1033, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-01 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1034, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-08 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1035, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-15 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1036, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-22 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1037, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-06-29 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1038, 56, NULL, NULL, 9, 55, 'Basic arabic', 'Colloquial Arabic', '2022-07-06 21:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(1039, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-05-11 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 1, 4, 2, NULL, '?????????? ?????????? ???? 1:3 - ?????????? 4 ?? 5 ????????', '2022-05-11 18:57:04'),
(1040, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-05-18 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 2, 4, 1, NULL, NULL, '2022-05-11 18:57:04'),
(1041, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-05-25 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1042, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-01 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1043, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-08 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1044, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-15 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1045, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-22 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1046, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-29 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1047, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-07-06 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1048, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-05-12 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 3, 4, 1, NULL, NULL, '2022-05-11 18:57:04'),
(1049, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-05-19 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 4, 4, 1, NULL, NULL, '2022-05-11 18:57:04'),
(1050, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-05-26 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1051, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-02 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1052, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-09 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1053, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-16 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1054, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-23 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1055, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-06-30 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1056, 57, NULL, NULL, 9, 56, 'Basic arabic', 'Colloquial Arabic', '2022-07-07 21:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(1057, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-05-17 22:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:58:18'),
(1065, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-05-13 22:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 18:58:18'),
(1096, 30, NULL, NULL, 11, 99, 'Foundation level', 'Quran', '2022-07-10 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 22:33:19'),
(1097, 35, NULL, NULL, 11, 102, 'Upper-intermediate arabic', 'Quran', '2022-06-29 18:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 22:41:17'),
(1099, 34, NULL, NULL, 11, 59, 'Foundation level', 'Quran', '2022-07-12 21:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-11 22:46:04'),
(1101, 60, 22, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-05-17 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1102, 60, 22, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-05-24 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1103, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-05-31 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1104, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-07 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1105, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-14 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1106, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-21 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1107, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-28 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1108, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-07-05 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1109, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-07-12 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1110, 60, 22, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-05-18 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1111, 60, 22, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-05-25 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1112, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-01 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1113, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-08 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1114, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-15 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1115, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-22 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1116, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-06-29 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1117, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-07-06 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1118, 60, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-07-13 13:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-12 09:52:13'),
(1119, NULL, NULL, NULL, 6, 102, 'Upper-intermediate arabic', 'Arabic', '2022-05-12 10:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 1, 1, 5, '?????????????? ?????? ???????????? ??????????', NULL, '2022-05-12 09:59:31'),
(1120, NULL, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-05-12 11:30:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 4, 4, 1, NULL, NULL, '2022-05-12 11:28:22'),
(1129, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-05-13 23:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-12 11:32:18'),
(1241, 36, NULL, NULL, 11, 42, 'Foundation level', 'Quran', '2022-07-08 14:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-14 02:14:49'),
(1292, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-09 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-14 18:26:38'),
(1294, 45, NULL, NULL, 5, 72, 'Foundation level', 'Quran', '2022-07-09 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-14 18:27:49'),
(1295, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-07-17 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-14 19:32:30'),
(1296, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-07-17 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-14 19:33:07'),
(1298, NULL, NULL, NULL, 9, 56, 'Tajweed basics', 'Quran', '2022-05-15 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 15:21:29'),
(1299, NULL, NULL, NULL, 9, 55, 'Tajweed basics', 'Arabic', '2022-05-15 16:00:00', 60, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 15:22:12'),
(1300, NULL, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-15 16:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 15:22:57'),
(1301, NULL, NULL, NULL, 9, 22, 'Tajweed basics', 'Quran', '2022-05-15 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 15:23:09'),
(1302, NULL, NULL, NULL, 9, 30, 'Tajweed basics', 'Quran', '2022-05-15 16:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 15:23:37'),
(1303, NULL, NULL, NULL, 9, 91, 'Tajweed basics', 'Quran', '2022-05-15 16:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 15:24:06'),
(1304, NULL, NULL, NULL, 9, 38, 'Tajweed basics', 'Quran', '2022-05-15 16:00:00', 120, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 3, 4, 1, NULL, NULL, '2022-05-15 15:24:29'),
(1358, 39, NULL, NULL, 11, 113, 'Foundation level', 'Quran', '2022-05-16 20:00:00', 45, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:04:52'),
(1367, 39, NULL, NULL, 11, 113, 'Foundation level', 'Quran', '2022-05-18 20:00:00', 45, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:04:52'),
(1394, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-05-18 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 4, 1, NULL, NULL, '2022-05-15 17:08:31'),
(1395, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-05-25 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1396, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-01 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1397, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-08 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1398, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-15 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1399, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-22 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1400, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-29 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1401, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-07-06 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1402, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-07-13 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1403, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-05-20 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 2, 4, 1, NULL, NULL, '2022-05-15 17:08:31'),
(1404, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-05-27 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1405, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-03 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1406, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-10 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1407, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-17 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31');
INSERT INTO `classes` (`id`, `scheduleID`, `invoiceID`, `guardianID`, `teacherID`, `studentID`, `subject`, `classTitle`, `startingDate`, `duration`, `guests`, `description`, `timeZone`, `countForTeacher`, `countForStudent`, `countOnInvoice`, `teacherReschedule`, `studentReschedule`, `reportReminded`, `status`, `previousAssignment`, `classPerformance`, `newAssignment`, `supervisorNotes`, `createdAt`) VALUES
(1408, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-06-24 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1409, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-07-01 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1410, 61, NULL, NULL, 9, 52, 'Tajweed basics', 'Quran', '2022-07-08 00:00:00', 30, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-15 17:08:31'),
(1449, 46, NULL, NULL, 5, 45, 'Foundation level', 'Quran', '2022-07-24 18:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 19:00:44'),
(1450, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-07-24 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-15 19:01:22'),
(1451, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-08-08 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-16 18:32:07'),
(1457, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-07-19 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-17 16:18:04'),
(1459, 48, NULL, NULL, 5, 18, 'Foundation level', 'Quran', '2022-08-15 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-17 18:04:07'),
(1464, 16, NULL, NULL, 2, 84, 'Intermediate arabic', 'Arabic', '2022-07-03 09:00:00', 90, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:23:03'),
(1465, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-05-24 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1466, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-05-31 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1467, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-07 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1468, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-14 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1469, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-21 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1470, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-28 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1471, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-07-05 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1472, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-07-12 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1473, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-05-20 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1474, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-05-27 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1475, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-03 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1476, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-10 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1477, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-17 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1478, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-06-24 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1479, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-07-01 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1480, 58, NULL, NULL, 9, 38, 'Qari program', 'Quran', '2022-07-08 22:00:00', 60, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-05-18 08:37:55'),
(1497, 2, NULL, NULL, 5, 93, 'Pre-reading level', 'Quran', '2022-07-26 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-21 09:05:37'),
(1502, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-16 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-21 18:27:40'),
(1503, 45, NULL, NULL, 5, 72, 'Foundation level', 'Quran', '2022-07-16 18:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-21 18:28:05'),
(1504, 47, NULL, NULL, 5, 46, 'Foundation level', 'Quran', '2022-07-31 19:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-05-21 19:01:33'),
(1515, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-07-17 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1516, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-07-24 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1517, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-07-31 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1518, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-08-07 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1519, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-08-14 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1520, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-07-18 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1521, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-07-25 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1522, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-08-01 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1523, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-08-08 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1524, 50, NULL, NULL, 5, 114, 'Foundation level', 'Arabic', '2022-08-15 20:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:29:31'),
(1534, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-07-19 17:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1535, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-07-26 17:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1536, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-08-02 17:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1537, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-08-09 17:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1538, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-08-16 17:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1539, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-07-23 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1540, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-07-30 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1541, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-08-06 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1542, 41, NULL, NULL, 5, 88, 'Intermediate arabic', 'Arabic', '2022-08-13 09:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:32:52'),
(1543, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-17 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1544, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-24 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1545, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-31 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1546, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-07 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1547, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-14 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1548, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-21 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1549, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-28 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1550, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-04 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1551, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-11 15:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1552, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-18 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1553, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-25 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1554, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-01 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1555, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-08 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1556, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-15 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1557, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-22 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1558, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-29 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1559, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-05 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1560, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-12 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1561, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-20 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1562, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-27 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1563, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-03 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1564, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-10 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1565, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-17 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1566, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-24 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1567, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-31 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1568, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-07 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1569, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-14 15:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1570, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-23 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1571, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-07-30 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1572, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-06 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1573, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-13 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1574, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-20 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1575, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-08-27 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1576, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-03 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1577, 65, NULL, NULL, 5, 36, 'Pre-reading level', 'Arabic', '2022-09-10 16:00:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:35:38'),
(1578, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-17 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1579, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-24 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1580, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-31 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1581, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-07 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1582, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-14 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1583, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-18 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1584, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-25 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1585, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-01 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1586, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-08 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1587, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-15 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1588, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-19 18:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1589, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-26 18:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1590, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-02 18:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1592, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-16 18:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1593, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-20 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1594, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-27 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1595, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-03 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1596, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-10 16:30:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1597, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-23 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1598, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-07-30 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1599, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-06 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1600, 66, NULL, NULL, 5, 82, 'Tajweed basics', 'Quran', '2022-08-13 16:00:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:51:04'),
(1601, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-17 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1602, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-24 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1603, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-31 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1604, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-07 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1605, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-14 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1606, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-18 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1607, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-25 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1608, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-01 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1609, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-08 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1610, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-15 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1611, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-19 19:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1612, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-26 19:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1613, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-02 19:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1614, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-09 19:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1615, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-16 19:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1616, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-20 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1617, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-27 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1618, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-03 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1619, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-10 17:15:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1620, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-23 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1621, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-07-30 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1622, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-06 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1623, 67, NULL, NULL, 5, 83, 'Tajweed basics', 'Quran', '2022-08-13 16:45:00', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:55:01'),
(1624, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-21 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1625, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-28 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1626, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-08-04 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1627, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-08-11 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1628, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-22 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1629, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-29 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1630, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-08-05 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1631, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-08-12 08:57:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1632, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-23 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1633, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-07-30 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1634, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-08-06 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1635, 44, NULL, NULL, 5, 70, 'Pre-reading level', 'Quran', '2022-08-13 17:30:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-17 08:57:57'),
(1649, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-02 17:46:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1650, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-09 17:46:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1651, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-16 17:46:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1652, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-23 17:46:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1653, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-04 17:44:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1654, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-11 17:44:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1655, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-18 17:44:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1656, 70, NULL, NULL, 10, 83, 'Khatmah program', 'ss', '2022-08-25 17:44:00', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-07-18 17:43:55'),
(1716, 74, NULL, NULL, 12, 116, 'Pre-reading level', 'dsa', '2022-08-23 10:31:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-08-09 18:31:04'),
(1717, 74, NULL, NULL, 12, 116, 'Pre-reading level', 'dsa', '2022-08-30 10:31:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-08-09 18:31:04'),
(1718, 74, NULL, NULL, 12, 116, 'Pre-reading level', 'dsa', '2022-09-06 10:31:00', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2022-08-09 18:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `classesreq`
--

CREATE TABLE `classesreq` (
  `id` int(11) NOT NULL,
  `classID` int(11) DEFAULT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `studentID` int(11) DEFAULT NULL,
  `guardianID` int(11) DEFAULT NULL COMMENT 'Notice : Not related yet (foreign key)',
  `teacherCancelReq` tinyint(1) DEFAULT NULL,
  `studentCancelReq` tinyint(1) DEFAULT NULL,
  `teacherReschedule` timestamp NULL DEFAULT NULL,
  `studentReschedule` timestamp NULL DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classesreq`
--

INSERT INTO `classesreq` (`id`, `classID`, `teacherID`, `studentID`, `guardianID`, `teacherCancelReq`, `studentCancelReq`, `teacherReschedule`, `studentReschedule`, `enable`, `createdAt`) VALUES
(1, 1026, NULL, 55, 66, NULL, 1, NULL, NULL, 1, '2022-06-12 21:32:15'),
(2, 1035, NULL, 55, 66, NULL, 1, NULL, NULL, 1, '2022-06-12 21:32:43'),
(3, 1519, NULL, 114, 77, NULL, 1, NULL, NULL, 1, '2022-08-10 18:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `process` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guardianinvoices`
--

CREATE TABLE `guardianinvoices` (
  `id` int(11) NOT NULL,
  `guardianID` int(11) DEFAULT NULL,
  `invoiceNumber` int(11) DEFAULT NULL,
  `transferFess` int(11) DEFAULT NULL,
  `extraAmount` int(11) DEFAULT NULL,
  `totalAmountPaid` int(11) DEFAULT NULL,
  `savedPaidHours` int(11) DEFAULT NULL,
  `paymentMethod` varchar(10) DEFAULT NULL,
  `paymentDate` timestamp NULL DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1:Paid 2: Unpaid',
  `active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Inactive\r\n1: Active',
  `isSeen` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not seen 1: seen	',
  `establishedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guardianinvoices`
--

INSERT INTO `guardianinvoices` (`id`, `guardianID`, `invoiceNumber`, `transferFess`, `extraAmount`, `totalAmountPaid`, `savedPaidHours`, `paymentMethod`, `paymentDate`, `paid`, `active`, `isSeen`, `establishedAt`, `createdAt`) VALUES
(1, 18, 0, 0, 0, 50, 300, 'PayPal', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 07:47:45', '2022-04-28 07:46:00'),
(2, 46, 0, 0, 0, 45, 270, 'PayPal', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 08:04:00', '2022-04-27 18:00:00'),
(3, 70, 0, 0, 0, 55, 330, 'PayPal', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 08:06:09', '2022-05-02 02:00:00'),
(4, 11, 0, 0, 0, 40, 240, 'PayPal', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 08:08:49', '2022-05-03 18:00:00'),
(5, 68, 457, 7, NULL, 128, 960, 'PayPal', '2022-05-14 00:00:00', 1, 1, 0, '2022-04-27 08:13:54', '2022-04-30 02:00:00'),
(6, 62, 471, 2, 0, 35, 210, 'PayPal ', '2022-05-12 00:00:00', 1, 1, 0, '2022-04-27 08:15:28', '2022-04-30 19:30:00'),
(7, 39, 0, 0, 0, 60, 360, 'PayPal ', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 08:17:11', '2022-04-30 18:00:00'),
(8, 42, 0, 0, 0, 15, 90, 'Bank', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 08:19:02', '2022-04-30 09:00:00'),
(9, 59, 0, 0, 0, 450, 270, 'PayPal', '2022-04-27 00:00:00', 1, 1, 0, '2022-04-27 08:25:06', '2022-05-01 09:00:00'),
(10, 27, 0, 0, 0, 160, 480, 'PayPal', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 08:36:22', '2022-04-28 06:00:00'),
(11, 10, 0, 0, 0, 130, 780, 'PayPal', '2022-05-08 00:00:00', 1, 1, 1, '2022-04-27 08:38:49', '2022-04-27 15:00:00'),
(12, 43, 0, 0, 0, 20, 120, 'PayPal ', '2022-05-07 00:00:00', 1, 1, 0, '2022-04-27 15:17:42', '2022-04-27 18:00:00'),
(13, 19, 452, 6, 15, 120, 330, 'PayPal', '2022-04-13 00:00:00', 1, 1, 0, '2022-04-27 15:24:28', '2022-04-27 19:30:00'),
(14, 15, 450, 9, 50, 190, 390, 'PayPal', '2022-04-13 00:00:00', 1, 1, 0, '2022-04-27 15:28:29', '2022-04-27 20:30:00'),
(15, 66, 465, 3, 0, 50, 270, 'Paypal', '2022-04-26 00:00:00', 1, 1, 0, '2022-04-27 15:34:58', '2022-04-27 21:30:00'),
(16, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 0, '2022-04-27 16:29:08', '2022-04-28 21:30:00'),
(17, 22, 0, 0, 0, 25, 150, 'PayPal', '2022-05-08 00:00:00', 1, 1, 0, '2022-04-27 16:31:43', '2022-04-28 22:00:00'),
(18, 48, 0, 0, 0, 10, 60, 'PayPal', '2022-05-12 00:00:00', 1, 1, 0, '2022-04-28 11:21:18', '2022-04-28 16:00:00'),
(19, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 0, '2022-04-28 11:23:15', '2022-04-28 17:00:00'),
(20, 54, 463, 0, 0, 52, 315, 'PayPal', '2022-05-12 00:00:00', 1, 1, 0, '2022-04-28 11:24:44', '2022-04-28 17:00:00'),
(21, 65, 0, 0, 0, 0, 210, 'PayPal', '2022-05-12 00:00:00', 1, 1, 0, '2022-04-28 11:26:02', '2022-04-28 20:00:00'),
(22, 55, 0, 4, 0, 80, 480, 'PayPal', '2022-05-12 00:00:00', 1, 1, 0, '2022-04-28 11:28:14', '2022-04-28 21:00:00'),
(23, 24, 0, 0, 0, 8, 45, 'PayPal ', '2022-05-12 00:00:00', 1, 1, 0, '2022-04-28 11:29:17', '2022-04-28 21:00:00'),
(24, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 0, '2022-05-08 10:20:26', '2022-05-11 20:00:00'),
(25, 77, 475, 3, 0, 55, 270, 'PayPal ', '2022-05-11 22:00:00', 1, 1, 1, '2022-05-08 19:40:17', '2022-05-08 19:41:00'),
(28, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, '2022-07-20 10:05:40', '2022-07-20 10:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  `paymentType` tinyint(1) DEFAULT 1 COMMENT '1:Prepaid(Default), 2:Postpaid',
  `paymentMethod` varchar(20) DEFAULT NULL,
  `hoursPrice` int(11) DEFAULT NULL,
  `transferPrice` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1:Active, 2:Inactive',
  `token` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guardians`
--

INSERT INTO `guardians` (`id`, `name`, `picture`, `birthday`, `email`, `password`, `language`, `phone`, `address`, `timeZone`, `paymentType`, `paymentMethod`, `hoursPrice`, `transferPrice`, `status`, `token`, `createdAt`) VALUES
(3, 'Faheem Hasan', NULL, '2022-04-13', 'faheem.hasan@gmail.com', '$2a$10$a2GW6E7smZ2wWq/X3qjhT.BAY9vcqGab2FPeUHz7iSUMONSlQZqgu', 'null', '+13473318323', 'New York, United States', 'Africa/Cairo', 1, 'Paypal', 10, NULL, 1, NULL, '2022-04-13 03:04:57'),
(4, 'Abdul-Rahaman Ismail', NULL, '2022-04-28', 'khomol@hotmail.com', '$2a$10$BrfKyhkHJcaBcYZ2rSh/7ui759vDRSfVS/ID7MZIJctuWyKTGwr0i', 'null', '+447832345464', 'London, United Kingdom', 'Europe/London', 1, 'null', NULL, NULL, 1, NULL, '2022-04-13 03:06:17'),
(5, 'Waleed Ashraf', NULL, NULL, 'hellowaleed@hotmail.com', '$2a$10$mopyO/AfI37bXWihh30Wme8lCzw9d7qE8TD8SBdQzRHlFNusUqdvi', NULL, '+971507635105', 'Dubai ,United Arab Emirates', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:07:40'),
(6, 'Sehrish Imdad', NULL, NULL, 'sehrishimdad@hotmail.com', '$2a$10$wIyVOgzqphVfHFH.VGjERuuf23ygffMFRprxFotqsbaOOnor1jxIW', NULL, '+447469944950', 'London, United Kingdom', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:09:52'),
(7, 'Sarah Mostafavi', NULL, NULL, 'smostafavi@gmail.com', '$2a$10$8qcw.CdQfP/88lvFIwM05u2/mjLjEWvwznOtR0hyqQ9UR7.q6cleu', NULL, 'smostafavi@gmail.com', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:12:11'),
(8, 'Alejandro Beck-Sosa', NULL, NULL, 'alejandrobecksosa@gmail.com', '$2a$10$.lpw/BrTbtWpkeKW7qm2RuHLAbG66fOsE58bKlaqhmg3cevjeNcRW', NULL, '+1 703 268 6117', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:14:08'),
(9, 'Saima Rizvi', NULL, NULL, 's_rizvi@sbcglobal.net', '$2a$10$.5988yHQUoQqAe6S4K3eU.XDwTF7nNnE/SoZCAdMu7ds89DBzcjpO', NULL, '+14056309536', '3509 NW 1730 Edemond Okalhoma 73012', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:17:27'),
(10, 'Ammon Winder', NULL, NULL, 'askchairmenkapow@gmail.com', '$2a$10$HcAsmAGibdeQkQTDinMYme59rjuIsdVV7wfZOSK.LKbB6moywC.Ui', NULL, '+1804 914 0739', 'Charlottesville, Virginia, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:20:08'),
(11, 'Anisa Abeytia', NULL, '2022-04-13', 'anisa@alumni.stanford.edu', '$2a$10$Gk06ioE3cXAC60r73OkZR.WBJwFMYjURZ6deVI.H8/wOu65s30BWm', 'null', '+1 626 782 3083', 'America/Los_Angeles', 'America/Los_Angeles', 1, 'null', NULL, NULL, 2, NULL, '2022-04-13 03:21:36'),
(12, 'Anu KMT', NULL, NULL, 'akemet@kemethuntlaw.com', '$2a$10$6PHMlsEMGOZPXHz6R0xT5ePah5F.8dRlsDq.0BJP/fY4PyHRvrabu', NULL, '+13018065122', 'America/Chicago', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:23:35'),
(13, 'Zehra Wamiq', NULL, NULL, 'zwamiq@gmail.com', '$2a$10$EL5ah.L8CY.jZjzrPJCAuOnhXQbQfnVYUkwYQTvedBioLN9UsZtLa', NULL, '+16102097146', 'United States, Pennsylvinia', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:25:27'),
(14, 'Awais Khan', NULL, NULL, 'mrawaisalikhan2006@gmail.com', '$2a$10$MeQ62JxAUmGtfjIVOJ59ruhkoUsCm1zK11a8OPfBx20dPN.JtGTdK', NULL, '+4407365063606', 'London, United Kingdom ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:27:00'),
(15, 'Sumayya Banu', NULL, NULL, 'sumzali2003@yahoo.com', '$2a$10$LlNt/WNT4XnZ5qU3.n1l8.KwvQIN/VyqkEFBrBO8PXTs8u4zAwF7O', NULL, '+14845881768	', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:31:56'),
(16, 'Saida Malik', NULL, NULL, 'nyapt@hotmail.com', '$2a$10$u.e4U1xMkNZYfz2u7DrdAuNsDUg2hKIxhfluIP5JQaXLCvAQ29SGy', NULL, '+12149846066', 'Chicago, Illinois, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:33:33'),
(17, 'Mostafa Kabaday', NULL, NULL, 'mkabadaya@gmail.com', '$2a$10$n2KEZqOdbhMOblR2eftq9uPO8ejn/hQnW7bPVQul/.tStXTyxq7Lu', NULL, '+19253214790', 'California, United states', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:35:25'),
(18, 'Barra Ibrahim', NULL, NULL, 'bibrahim914@gmail.com', '$2a$10$6al2.tXS06xfyAM8eCEa6eMuGB9SSJ8UOACUsuZWz6zk.gl2xry16', NULL, '+12679180012', 'New York, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:37:47'),
(19, 'Waad Beaute', NULL, NULL, 'wai2894@gmail.com', '$2a$10$7ZCx6YLmhdwu/m8xBcmmoOkbAD2jvyMyse0J2JE2Zpc0/WDYG0y/u', NULL, '+12672315867', 'New York, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:40:13'),
(20, 'Ayu Abdullah', NULL, NULL, 'ayuabdullah@gmail.com', '$2a$10$zYQMflTL9LyOwAMWBvJlR.SLpC3TvXI0sGEEfZneIzkLN5g/Ly8lG', NULL, '+60173453814', 'Kuala Lumpur, Asia', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:41:26'),
(21, 'Noman Haider', NULL, NULL, 'haider.syedn@gmail.com', '$2a$10$kjF5nAkzyBCtegcxPxwEeOvJnVzGEIKonNRQUU07lY2sdgHXma0nu', NULL, '+19018328220', 'Chicago, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:43:03'),
(22, 'Asma uddin', NULL, NULL, 'asmauddin@gmail.com', '$2a$10$ofi4iXFFlzaGeUitSZLvo.Lb/NlaiZHXe.9NI9Ot1qdCCFghYqC22', NULL, '+13054849926', 'Washington, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:45:56'),
(23, 'Danial Farooq', NULL, NULL, 'danialf64@gmail.com', '$2a$10$6Yqm8RMgzMOAJeFn5TperOdy9tAV.VDZKJz.FkKxGQMoL4EJ6o1k.', NULL, '+44 7576 725527', 'London, United Kingdom ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:47:07'),
(24, 'Fatema Ibrahim', NULL, NULL, 'liatris318@gmail.com', '$2a$10$HNuk4QWMLD5z3e40S.qxUuiMNR4I1/Nf6fZD7xfsaKsmCrRB2xSWO', NULL, '+14843589612', 'New York, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:50:56'),
(25, 'Saema Somalya', NULL, NULL, 'ssomalya@gmail.com', '$2a$10$k/xP0wPcbRagoAH/wuIf3OEHtgAkjRNn1UavaexSOHFyd6p0jcmcC', NULL, '+18566256363', 'Los Angeles, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:53:12'),
(26, 'Fouad Freude', NULL, NULL, 'mariofreude75@gmail.com', '$2a$10$m6VgKiYlltHoXeBGzXR2EOO4rEQb94Vq5jbvByWnwEt3YS08Cjf2S', NULL, '+525545679357', 'Mexico', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:54:21'),
(27, 'Gretchen Head', NULL, NULL, 'gretchen.head@yale-nus.edu.sg', '$2a$10$FtBNGEt/3hrjVcXhskmXje85K//nIexHh/VbflNFTPFAumWlsKpr2', NULL, '+6590262443', 'Singapore, Asia', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:55:20'),
(28, 'Tariq Sattar', NULL, NULL, 'drtariqsattar@gmail.com', '$2a$10$TFDWVkSyr1UcrNrZM3d5Xu8mA5knwWXFFhhffNno.u4Cculi/gG3m', NULL, '+14053145072', 'Chicago, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:56:33'),
(29, 'Majid Khan', NULL, NULL, 'Khanmajid246@yahoo.co.Uk', '$2a$10$itM3jhtAUWu0Kc68.M61puSbTdAubIBIeTQHGv60FdRdb/ngmNJQW', NULL, '+447808857620', 'London, United Kingdom ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:57:52'),
(30, 'Haroon Moghul', NULL, NULL, 'Moghul@gmail.com', '$2a$10$qDmaliYg3gysOW2HRyERz.nKe5BGfTwZY6Gt8TUhBZqO68fvCfE2m', NULL, '+15135687241', 'Los Angeles, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 03:59:03'),
(31, 'Hina Guezmir', NULL, NULL, 'lymphnode@live.com', '$2a$10$gpKDFo/e/1D2nyFWA8RMeucT50OuoEEhv2ZkS5TM4wm6KXLB.31R2', NULL, '+15044447832', 'Los Angeles, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 04:00:30'),
(32, 'Huda Almarashi', NULL, '2022-04-28', 'huda.almarashi@gmail.com', '$2a$10$2KZuAmm1NiJMCtt7HWgaxu2Q23AiTAzh0btudqGSi8uc8lHFWScw2', 'null', '+19519666126', 'California, United States ', 'America/Los_Angeles', 2, 'null', NULL, NULL, 2, NULL, '2022-04-13 04:13:15'),
(33, 'Wasif Khan', NULL, NULL, 'wasifkhan786@hotmail.com', '$2a$10$F3i5ePNEo4ZXgdvqz3hWpe9iXCirPLPdQZJEB2/Nm3bkKXaQYQIBW', NULL, '+44 7930 363826', 'London, United Kingdom', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:12:12'),
(34, 'Zineb Abousalama', NULL, NULL, 'zineb3@gmail.com', '$2a$10$WSGNosco0iP/iT9gRh8Wd.llpq0EHvfW2sQNloqEBMjwGukjmprra', NULL, '410765932151', 'Adliswil, Switzerland', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:14:43'),
(35, 'Sofia Ali-khan', NULL, NULL, 'sofianalikhan@gmail.com', '$2a$10$jhBNDPf/03i1RtUWuOJceOs4qGJbVTn1vHOdV04RKaihSNv120Vrm', NULL, '+12892595089', 'Canada', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:16:49'),
(36, 'Jake Brancatella', NULL, NULL, 'jakebrancatella128@gmail.com', '$2a$10$alaPrC3tsCPDKtvi6shdAOvid1eXciUr4Rb7VDrdKVg95.kpG5Nn2', NULL, '+12013106534', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:19:27'),
(37, 'Ali Jones', NULL, NULL, 'Akenyele@gmail.com', '$2a$10$BUAm1khBFxwsbdgvn9s1T.CsVjG4q.mVe6EtYUYS.brZVhimMjPyi', NULL, '+19375033135', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:21:46'),
(38, 'Kamal Southall', NULL, NULL, 'Southallgroup@gmail.com', '$2a$10$.osIfBY2jXN0Ls3NY0VmlORePFs/DUXW6bITt67sNgW26qOydukWi', NULL, '+15135466267', 'Chicago, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:23:04'),
(39, 'Namirah Qureshi', NULL, NULL, 'drjamshed@gmail.com', '$2a$10$14XleHQzDCA9JznVTNmRceBYpZoTXpeu4bCwPTlsWeb7Fr1AtT5E.', NULL, '+12025960902', 'Illinois, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:25:08'),
(40, 'Jamshaid Ashraf', NULL, NULL, 'jimshaid@hotmail.com', '$2a$10$tzRo60v9FC3aT.A49fZmkevrJegwZSsC0dtEoVeWQ8Q4jJZtyKCb6', NULL, '+923361448590', 'Lahore, Pakistan, Asia', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:27:59'),
(41, 'Khidre Elsherbiny', NULL, NULL, 'mariamhamdyz@gmail.com', '$2a$10$KbN7eLefBmKK1kFGUxjiiugPIqzrQGrlQ3YrUYZZNOBrVwkMBrS5q', NULL, '+14084399432', 'Los Angeles, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:32:56'),
(42, 'Hams Mohamed', NULL, '2022-04-19', 'hams83@gmail.com', '$2a$10$IDwkdz1zN7T/wtLnVs5PZuXqvwT/1K..wmGboZhTdSYb7nAGR8AZi', 'null', '+20165516987', 'Cairo, Egypt', 'Africa/Cairo', 1, 'null', NULL, NULL, 2, NULL, '2022-04-13 09:34:54'),
(43, 'Omar Mir', NULL, NULL, 'mariajqureshi@yahoo.com', '$2a$10$76A/ci9hVd87BDmjJenA6OrGywYbPuAtt9tC7Y5MKlGGvOI7WMqzi', NULL, '+19095681412', ' Los Angeles, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:36:18'),
(44, 'Zehra Hasan', NULL, '2022-04-28', 'zehrapaa@gmail.com', '$2a$10$x6dRMgZf6qRpQn1jSxf8d.GYdHf6Mt1pzc75AK9tKlktOzplk.Zdq', 'null', '+19173259642', 'New York, United States', 'America/New_York', 2, 'null', NULL, NULL, 2, NULL, '2022-04-13 09:37:47'),
(45, 'Muhammad Allan', NULL, NULL, 'zakiyyahjones1@gmail.com', '$2a$10$0dWFO9iLPUG6e9KrWbxqoeHLh.48JoV0fYeQCzfv7IPdEltXLQRjm', NULL, '+12027469840', 'Ohio, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:39:07'),
(46, 'Nazia Begum', NULL, NULL, 'Naz__17__@hotmail.com', '$2a$10$TB3/S7pKmojrqkbTys6FYOwYr/u0rDK6.rTtY7eV6ZfQlx6wEGQM2', NULL, '+447972837510', 'London, United Kingdom', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:40:26'),
(47, 'Nick Orzech', NULL, NULL, 'nickorzech1@gmail.com', '$2a$10$OIgTT3ypLtBhNQ8xpRAeQ.oCr0Areg2maocTeN4hj2hNPJk3UDQcC', NULL, '+15129192529', 'North Dakota - Center, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:51:15'),
(48, 'Noah Ali', NULL, NULL, 'drsaniajamshed@hmail.com', '$2a$10$rRTJCJPGcu4Iq7I5.jt2t.zACaOQjpNzpN9cB6iEVZmWwUGXgzQLi', NULL, '+44 7794 202125', 'London, United Kingdom', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:54:18'),
(49, 'Nourane Ismail', NULL, NULL, 'nouism97@hotmail.fr', '$2a$10$1.AcL6fTU2WY5TsVVmXiUOnzgvpRYt4umiF8CutHSkHFNlat08hz6', NULL, '+33634627301', 'Paris, France', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 09:55:43'),
(50, 'Nuh Mecci', NULL, NULL, 'worldbusinessstudios@gmail.com', '$2a$10$SKTSy9Nnw8iMWkMi/GJDVO1GLSWwkCX6ppMfGneqydlluCLuODDvS', NULL, '+13143097127', 'Chicago, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:00:33'),
(51, 'Omar Farooq', NULL, NULL, 'omar@eotd.xyz', '$2a$10$gWlB6VM1/ZTxLFB4yy/Qkudduxtz9qYoAZ6niHglv9/haMAsE3UnW', NULL, '+16469208978', 'Los Angeles, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:01:59'),
(52, 'Omar Hamoda', NULL, NULL, 'omarrocks922@gmail.com', '$2a$10$fTbz7YQQItGXQvZBfE2RxumfYxcIHGySxV7fFubMcobnEbuQfz.ue', NULL, '+18572696915', 'Chicago, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:03:24'),
(53, 'Omar Mahmood', NULL, NULL, 'omar3000@gmail.com', '$2a$10$hYtCxR0ZGHX5QNwNvASBUeEr/fSa1sEUNQS5bIqg1BpI/IiRcgERq', NULL, '+14808622211', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:05:16'),
(54, 'Ovamir Anjum', NULL, NULL, 'oganjum@gmail.com', '$2a$10$n.PnZcz55lIDvNob5N1ZvuOxYldCMQGO0h2hX3AzqElAXFJGZ9JmC', NULL, '+14192770024', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:06:46'),
(55, 'Rawan Ibrahim', NULL, '2022-08-02', 'rawan.ibrahim001@gmail.com', '$2a$10$bFGuKOl.QeUJwick6KiZVeoMM5QCdOvrvQGkPmWcjDK2qxB1hPRyi', 'null', '+12676943829', 'New York, United States', 'Africa/Cairo', 1, 'null', 5, 3, 2, NULL, '2022-04-13 10:08:12'),
(56, 'Sana Malik', NULL, NULL, 'sanam805@gmail.com', '$2a$10$fEtvdGeSnnzm/..4MoMNLuzWx50pezqu9hkp5qZElrHxFT1wfPhjW', NULL, '+17175801211', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:39:05'),
(57, 'Ayesha Mattu', NULL, NULL, 'ayesha_mattu@yahoo.com', '$2a$10$dRg75v4WaRPQrieYCKLo6.UzCCCd3eDmT5XZcsKhEJArierSXtgWm', NULL, '+14157224420', 'Anchorage, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:41:01'),
(58, 'Mohamed Asad', NULL, NULL, 'fahadasad1@gmail.com', '$2a$10$nklBiyGhFAChp/xBwdMVD.k6dMzsdFT6xasrjy302wRHDb5UABehG', NULL, '+13099897155', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:42:42'),
(59, 'Sadiuddin Saifuddin', NULL, NULL, 'sadiuddin@hotmail.com', '$2a$10$dr2ypRKn6yBoisEf71S9m.m24eC2guOAZdv9ckHZBmNq73VAKOwTu', NULL, '+61424852462', 'Sydney, Australia', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:45:53'),
(60, 'Tania Amin', NULL, '2022-04-28', 'Taniamun654@gmail.com', '$2a$10$B6id2ElvLK.b0xUCivkStOchutMSyIVbyTiLFQ/ejqp4bZtSFrWWW', 'null', '+15736736309', 'Dallas, Texas, United States', 'America/Chicago', 2, 'null', NULL, NULL, 2, NULL, '2022-04-13 10:47:58'),
(61, 'Sharif Randhawa', NULL, NULL, 'msharif124@gmail.com', '$2a$10$zr4QhBHkxwo7kV3pVJSsi.ThhA2U5pc73lxWnSuFaDfiMB02OPSpW', NULL, '+16073828329', ' Seneca Rd, New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:51:04'),
(62, 'Dahlia Jaffer', NULL, NULL, 'dahlia_jaffer@yahoo.com', '$2a$10$ZWCX4ybI4o2oif.k05QE0.LXtnnLFjfH11x95MECaQ8NaW3uMxI4K', NULL, '+19515006084', 'Los Angeles, ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:52:55'),
(63, 'Soaad Elbahwati', NULL, NULL, 'selbahwati@gmail.com', '$2a$10$oSnWgY8nWMFk07ORP1Iw7ex4Ant7UQ4TopOnc0ZRWP1USwnqN7Aq2', NULL, '+14847921276???', 'Philadelphia, United States ', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:54:39'),
(64, 'Sohail Khan', NULL, NULL, 'sakhan31@hotmail.com', '$2a$10$A8z1CFLwaDx8w7ykKJsIieqmoTjF9LZxZNC3BaTsODNvKohD4/aOS', NULL, '+4407745957575', 'London, United Kingdom', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:55:49'),
(65, 'Homayra Ziad', NULL, NULL, 'homayra@gmail.com', '$2a$10$9D7do.A1PnSUGyeIyrz/Gepf4eUS6SxUJPhTOAT2k9tHlKFiYP8sy', NULL, '+1571 594 3298', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:57:38'),
(66, 'Mostafa Habib', NULL, NULL, 'habib.mostafa@gmail.com', '$2a$10$dCpj0lWgAk/ayP2UE5SEdO8Q8kbuRxAA.tDJPD2Vfa1L0iPEPNAw2', NULL, '+15853548115', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 10:59:21'),
(67, 'Tasneef Mahammad', NULL, NULL, 'tasneefm@gmail.com', '$2a$10$hWlAkTXSCpFtO5QiLQIGAeEigwBfNO1UkM9H2CEczO.G49s6rYOmG', NULL, '+447896273337', 'London, United Kingdom', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 11:00:38'),
(68, 'Waseem Butt', NULL, '2022-04-16', 'suuper7@gmail.com', '$2a$10$QfsLx0YBUOTG8dIB5Oegw.a4xMdBE7iGro9cFS7PvBXYNVWqHmcZS', 'null', '+19513128633', 'Los Angeles, United States', 'Africa/Cairo', 1, 'null', NULL, NULL, 2, NULL, '2022-04-13 11:02:35'),
(69, 'Sarah Khorshed', NULL, NULL, 'sarah.khorshed@gmail.com', '$2a$10$brwaVgHFxPH1Jse4yMAEc.wmVMG9d9Db53e0ei2K6ZykRMHhBuSAC', NULL, '+13106581093', 'Los Angeles, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 11:04:29'),
(70, 'Rand Abbas', NULL, NULL, 'rand_abbas@yahoo.ca', '$2a$10$VrwJIxVzHrccL.FHhTW7L.OxSmVixV0dT5xf/RGbiHBhAI40T5op2', NULL, '+15593609357', 'Los Angeles, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 11:06:12'),
(71, 'Iftekhar Hussain', NULL, '2022-04-13', 'Iftekharus@yahoo.com', '$2a$10$ikD.y55upzCBT4NaR.ktzeE4snlkqGBdoLwfE8LlMbwxRRyJCCFc.', 'English', '+17326093230', 'Chicago, United States', 'Africa/Cairo', 1, 'null', NULL, NULL, 2, NULL, '2022-04-13 11:12:31'),
(72, 'Nabeel Khan', NULL, NULL, 'firdoszohan@yahoo.com', '$2a$10$LFcgHeG36oa5aAs93sdFeOaX.lD8BmpT1ZiGeAYJVPpfw7l16Dru6', NULL, '+14846866841', 'Chicago, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-13 11:14:13'),
(73, 'Bilal Ansari', NULL, NULL, 'bilal.w.ansari@gmail.com', '$2a$10$TTI45ycMJn9uSRaFf5bF4.P3zQP2AFJiXdg7YtRPYR4tJs34bLJ3G', NULL, '+18609678250', 'New York, United States', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-14 10:06:50'),
(74, 'Deen Ali', NULL, NULL, 'deen5719@outlook.com', '$2a$10$WwmjMWlusxj8BK.okB9eyuNJIilI3Zzc/UY4EELc89EDistyitNwS', NULL, '+447599652624', 'London, United Kingdom', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-04-14 10:14:04'),
(75, 'hoss sksk', NULL, NULL, 'hossamalsankary@gmail.com', '$2a$10$2ZPBfvMrUK7sEGpVlJ1VHuEFwW2zOXVedYXzaxryePWcjWJxoxce2', NULL, '010472899278', 'M2TUtYQBkQmxhZY', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-05-07 19:53:18'),
(76, 'Nadia Begum', NULL, '1999-03-09', 'nadiabegum1999@icloud.com', '$2a$10$0ZyLd9SnehgYkD5C87mM6uKQUJuLZCuW6Z6Y8CsqOBG1JMsM7kJdy', 'English', '447564919001', 'Sheffield State, South Yorkshire, United Kingdom', 'Europe/London', 1, 'Paypal', NULL, NULL, 2, NULL, '2022-05-08 10:15:18'),
(77, 'Samar Abbas', NULL, '2022-05-08', 'sabbas011@gmail.com', '$2a$10$kGdAlzro5MO79ozvSk5Yje8IeaYgp3M7y8zao8z226.80Dw7f8gFe', 'English', '19143464555', 'City: Harrison State: New York Country: United States', 'America/New_York', 1, 'PayPal', NULL, NULL, 2, NULL, '2022-05-08 19:32:46'),
(78, 'Guardian Test', NULL, '2022-05-13', 'g@gmail.com', '$2a$10$UfjIU/PqtIh7w5EBsjSmouYDtrUVU0L0Z1zJeeQfUubWj7WoUeA4i', 'Arabic', '18292000', 'Test', 'Africa/Lagos', 1, 'Paypal', 1, 0, 2, NULL, '2022-05-08 20:27:06'),
(79, 'Zaynab Abd El Nabi', NULL, NULL, 'zaynab@gmail.com', '$2a$10$ZX8aNLCV9JvL5O6Jin8rTeQ564n.pxctYRd1u38pVjcnCiKtk7oqO', NULL, '81286345', 'Lebanon', 'Asia/Beirut', 1, NULL, NULL, NULL, 2, NULL, '2022-06-18 10:43:44'),
(80, 'mm ms', NULL, NULL, 'engmaramismail2019@gmail.com', '$2a$10$WOMl8KCITPGOx3ZefqnOhu7irGPOFndeTX5rNfONPGY9opwBTE7fi', NULL, '059879635', 'egypt', 'Asia/Hebron', 1, NULL, NULL, NULL, 2, NULL, '2022-06-20 09:52:29'),
(81, 'Is Is', NULL, NULL, 'i@gmail.com', '$2a$10$6bQe1Z/6AURAU1KmGKI9wu4aJLMLUKRejsHxxy8tarY0IKHNlvGBG', NULL, '12345678', 'Plapla', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-06-26 15:55:30'),
(82, 'Taky Gad', NULL, NULL, 'taky@example.com', '$2a$10$XzHITmXM531sHWIRZ9zC4ujPb.Kszy.c6kDX9b/QnMSadnHNzImH.', NULL, '01097132814', 'Alex', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-06-28 16:22:46'),
(83, 'hosssam sj', NULL, NULL, 'hossam1@gmail.com', '$2a$10$z.SjofK0ZnOeJUjnrguUgeLA/MLvXnbqxOEk2.J.4HQupsoDTxKku', NULL, '2939379', 'hossam1@gmail.com', 'Africa/Cairo', 1, NULL, NULL, NULL, 2, NULL, '2022-07-16 16:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1: Request, 2:Class, 3:Invoice',
  `admin` tinyint(1) DEFAULT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `guardianID` int(11) DEFAULT NULL,
  `studentID` int(11) DEFAULT NULL,
  `adminMsg` varchar(800) DEFAULT NULL,
  `teacherMsg` varchar(800) DEFAULT NULL,
  `guardianMsg` varchar(800) DEFAULT NULL,
  `seenByAdmin` tinyint(4) NOT NULL DEFAULT 0,
  `seenByGuardian` tinyint(4) NOT NULL DEFAULT 0,
  `seenByTeacher` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `admin`, `teacherID`, `guardianID`, `studentID`, `adminMsg`, `teacherMsg`, `guardianMsg`, `seenByAdmin`, `seenByGuardian`, `seenByTeacher`, `createdAt`) VALUES
(18, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"11\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-12 23:51:06'),
(19, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"63\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-12 23:51:07'),
(299, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"276\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-20 13:06:07'),
(317, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"460\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-21 16:14:28'),
(318, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"469\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-21 16:14:28'),
(374, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"311\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-27 19:19:02'),
(375, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"336\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-27 19:31:25'),
(376, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"286\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-27 20:18:35'),
(377, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"370\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-27 20:32:40'),
(378, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"482\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-27 21:46:37'),
(391, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"549\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-28 20:59:54'),
(392, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"566\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-28 20:59:54'),
(393, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"583\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-28 21:00:12'),
(394, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"345\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-29 13:27:05'),
(395, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"379\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-29 13:27:06'),
(396, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"456\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-29 13:27:06'),
(397, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"600\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-29 14:16:54'),
(400, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"122\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 09:17:47'),
(401, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"140\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 09:17:47'),
(402, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"212\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 09:17:47'),
(403, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"122\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 09:17:47'),
(404, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"140\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 09:17:48'),
(405, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"212\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 09:17:48'),
(406, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"388\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 19:27:50'),
(407, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"422\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 19:27:51'),
(408, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"439\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 19:27:51'),
(409, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"612\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 19:33:33'),
(410, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"149\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 20:00:53'),
(411, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"158\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 20:00:53'),
(412, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"176\" is missing your report submission.', NULL, 0, 0, 1, '2022-04-30 20:00:53'),
(413, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"194\" is missing your report submission.', NULL, 0, 0, 0, '2022-04-30 20:00:53'),
(415, 3, NULL, 9, NULL, NULL, NULL, 'We\'d like to let you know that your invoice is now available on the Waraqa web platform; please for more details check bills section in your account.', NULL, 0, 0, 1, '2022-05-01 03:35:28'),
(416, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"295\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:51:59'),
(417, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"303\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:01'),
(418, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"312\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:01'),
(419, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"320\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:01'),
(420, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"328\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:01'),
(421, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"337\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:02'),
(422, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"354\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:02'),
(423, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"362\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:02'),
(424, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"371\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:02'),
(425, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"414\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:02'),
(426, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"431\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:02'),
(427, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"448\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:02'),
(428, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"474\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:03'),
(429, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"483\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 18:52:03'),
(432, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"506\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:12'),
(433, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"515\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:12'),
(434, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"523\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:12'),
(435, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"532\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:12'),
(436, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"540\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:12'),
(437, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"550\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:13'),
(438, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"558\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:13'),
(439, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"567\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:13'),
(440, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"575\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:13'),
(441, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"584\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:13'),
(442, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"592\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-05 21:25:13'),
(443, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"601\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-06 22:14:38'),
(444, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"389\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-06 22:18:21'),
(445, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"423\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-06 22:18:21'),
(446, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"457\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-06 22:18:22'),
(447, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"440\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-07 00:25:17'),
(450, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"231\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 18:48:10'),
(451, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"241\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 18:48:10'),
(452, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"250\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 18:48:10'),
(453, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"251\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 18:48:10'),
(454, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"277\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 18:48:10'),
(455, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"287\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 18:48:11'),
(456, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"496\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 18:48:11'),
(457, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"641\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-07 18:48:53'),
(459, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"18\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:44'),
(460, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"27\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:44'),
(461, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"35\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:45'),
(462, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"44\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:45'),
(463, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"88\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:45'),
(464, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"96\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:45'),
(465, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"105\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:45'),
(466, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"123\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:45'),
(467, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"131\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:46'),
(468, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"141\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:46'),
(469, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"167\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:46'),
(470, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"177\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:46'),
(471, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"185\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:46'),
(472, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"195\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:46'),
(473, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"203\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:47'),
(474, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"213\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-07 19:14:47'),
(475, 3, NULL, 5, NULL, NULL, NULL, 'We\'d like to let you know that your invoice is now available on the Waraqa web platform; please for more details check bills section in your account.', NULL, 0, 0, 0, '2022-05-07 19:14:47'),
(476, 1, 1, NULL, 75, NULL, 'hoss sksk has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 0, 0, '2022-05-07 19:53:18'),
(477, 2, 1, 2, 30, 56, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Safa Haroon\". <br> Foundation level start on Saturday, 7 May , 09:20 PM with the teacher \"Mohamed Ismail\" according to the following schedule: <br>Saturday, 7 May , 09:20 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Saturday, 7 May , 09:20 PM with the student \"Safa Haroon\" according to the following schedule: <br>Saturday, 7 May , 09:20 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Safa Haroon\". <br> Foundation level start on Saturday, 7 May , 09:20 PM with the teacher \"Mohamed Ismail\" according to the following schedule: <br>Saturday, 7 May , 09:20 PM<br>', 1, 0, 0, '2022-05-07 21:19:21'),
(478, 2, 1, 2, 30, 52, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Marya Haroon\". <br> Foundation level start on Saturday, 7 May , 09:20 PM with the teacher \"Mohamed Ismail\" according to the following schedule: <br>Saturday, 7 May , 09:20 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Saturday, 7 May , 09:20 PM with the student \"Marya Haroon\" according to the following schedule: <br>Saturday, 7 May , 09:20 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Marya Haroon\". <br> Foundation level start on Saturday, 7 May , 09:20 PM with the teacher \"Mohamed Ismail\" according to the following schedule: <br>Saturday, 7 May , 09:20 PM<br>', 1, 0, 0, '2022-05-07 21:19:45'),
(479, 1, 1, NULL, 76, NULL, 'Nadia Begum has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 1, 0, '2022-05-08 10:15:18'),
(480, 1, 1, NULL, 76, 113, 'Nadia Begum has added student Nadia Begum to his student list.', NULL, 'Nadia Begum has been added to your student list.', 1, 0, 0, '2022-05-08 10:18:56'),
(481, 2, 1, 11, 76, 113, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Nadia Begum\". <br> Foundation level start on Wednesday, 11 May , 08:00 PM with the teacher \"Fatema Elshafiey\" according to the following schedule: <br>Wednesday, 11 May , 08:00 PM<br>Wednesday, 11 May , 10:00 PM<br>Wednesday, 18 May , 10:00 PM<br>Wednesday, 25 May , 10:00 PM<br>Wednesday, 1 Jun , 10:00 PM<br>Wednesday, 8 Jun , 10:00 PM<br>Wednesday, 15 Jun , 10:00 PM<br>Wednesday, 22 Jun , 10:00 PM<br>Wednesday, 29 Jun , 10:00 PM<br>Wednesday, 6 Jul , 10:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Wednesday, 11 May , 08:00 PM with the student \"Nadia Begum\" according to the following schedule: <br>Wednesday, 11 May , 08:00 PM<br>Wednesday, 11 May , 10:00 PM<br>Wednesday, 18 May , 10:00 PM<br>Wednesday, 25 May , 10:00 PM<br>Wednesday, 1 Jun , 10:00 PM<br>Wednesday, 8 Jun , 10:00 PM<br>Wednesday, 15 Jun , 10:00 PM<br>Wednesday, 22 Jun , 10:00 PM<br>Wednesday, 29 Jun , 10:00 PM<br>Wednesday, 6 Jul , 10:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Nadia Begum\". <br> Foundation level start on Wednesday, 11 May , 08:00 PM with the teacher \"Fatema Elshafiey\" according to the following schedule: <br>Wednesday, 11 May , 08:00 PM<br>Wednesday, 11 May , 10:00 PM<br>Wednesday, 18 May , 10:00 PM<br>Wednesday, 25 May , 10:00 PM<br>Wednesday, 1 Jun , 10:00 PM<br>Wednesday, 8 Jun , 10:00 PM<br>Wednesday, 15 Jun , 10:00 PM<br>Wednesday, 22 Jun , 10:00 PM<br>Wednesday, 29 Jun , 10:00 PM<br>Wednesday, 6 Jul , 10:00 PM<br>', 1, 0, 0, '2022-05-08 10:20:28'),
(482, 2, 1, 2, 18, 29, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Barra Ibrahim\". <br> Foundation level start on Sunday, 8 May , 12:04 PM with the teacher \"Mohamed Ismail\" according to the following schedule: <br>Sunday, 8 May , 12:04 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Sunday, 8 May , 12:04 PM with the student \"Barra Ibrahim\" according to the following schedule: <br>Sunday, 8 May , 12:04 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Barra Ibrahim\". <br> Foundation level start on Sunday, 8 May , 12:04 PM with the teacher \"Mohamed Ismail\" according to the following schedule: <br>Sunday, 8 May , 12:04 PM<br>', 1, 0, 1, '2022-05-08 12:04:01'),
(483, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"232\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-08 15:48:03'),
(484, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"278\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-08 15:48:04'),
(485, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"168\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-08 18:42:15'),
(486, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"682\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-08 18:42:16'),
(487, 2, 1, 5, 42, 88, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Mia Mohamed\". <br> Intermediate arabic start on Sunday, 8 May , 07:20 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:20 PM<br>Tuesday, 10 May , 06:00 PM<br>Tuesday, 17 May , 06:00 PM<br>Tuesday, 24 May , 06:00 PM<br>Tuesday, 31 May , 06:00 PM<br>Tuesday, 7 Jun , 06:00 PM<br>Tuesday, 14 Jun , 06:00 PM<br>Tuesday, 21 Jun , 06:00 PM<br>Tuesday, 28 Jun , 06:00 PM<br>Tuesday, 5 Jul , 06:00 PM<br>Saturday, 14 May , 11:00 AM<br>Saturday, 21 May , 11:00 AM<br>Saturday, 28 May , 11:00 AM<br>Saturday, 4 Jun , 11:00 AM<br>Saturday, 11 Jun , 11:00 AM<br>Saturday, 18 Jun , 11:00 AM<br>Saturday, 25 Jun , 11:00 AM<br>Saturday, 2 Jul , 11:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Intermediate arabic start on Sunday, 8 May , 07:20 PM with the student \"Mia Mohamed\" according to the following schedule: <br>Sunday, 8 May , 07:20 PM<br>Tuesday, 10 May , 06:00 PM<br>Tuesday, 17 May , 06:00 PM<br>Tuesday, 24 May , 06:00 PM<br>Tuesday, 31 May , 06:00 PM<br>Tuesday, 7 Jun , 06:00 PM<br>Tuesday, 14 Jun , 06:00 PM<br>Tuesday, 21 Jun , 06:00 PM<br>Tuesday, 28 Jun , 06:00 PM<br>Tuesday, 5 Jul , 06:00 PM<br>Saturday, 14 May , 11:00 AM<br>Saturday, 21 May , 11:00 AM<br>Saturday, 28 May , 11:00 AM<br>Saturday, 4 Jun , 11:00 AM<br>Saturday, 11 Jun , 11:00 AM<br>Saturday, 18 Jun , 11:00 AM<br>Saturday, 25 Jun , 11:00 AM<br>Saturday, 2 Jul , 11:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Mia Mohamed\". <br> Intermediate arabic start on Sunday, 8 May , 07:20 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:20 PM<br>Tuesday, 10 May , 06:00 PM<br>Tuesday, 17 May , 06:00 PM<br>Tuesday, 24 May , 06:00 PM<br>Tuesday, 31 May , 06:00 PM<br>Tuesday, 7 Jun , 06:00 PM<br>Tuesday, 14 Jun , 06:00 PM<br>Tuesday, 21 Jun , 06:00 PM<br>Tuesday, 28 Jun , 06:00 PM<br>Tuesday, 5 Jul , 06:00 PM<br>Saturday, 14 May , 11:00 AM<br>Saturday, 21 May , 11:00 AM<br>Saturday, 28 May , 11:00 AM<br>Saturday, 4 Jun , 11:00 AM<br>Saturday, 11 Jun , 11:00 AM<br>Saturday, 18 Jun , 11:00 AM<br>Saturday, 25 Jun , 11:00 AM<br>Saturday, 2 Jul , 11:00 AM<br>', 1, 0, 0, '2022-05-08 19:19:30'),
(488, 2, 1, 5, 39, 82, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Leya Qureshi\". <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 06:00 PM<br>Sunday, 22 May , 06:00 PM<br>Sunday, 29 May , 06:00 PM<br>Sunday, 5 Jun , 06:00 PM<br>Sunday, 12 Jun , 06:00 PM<br>Sunday, 19 Jun , 06:00 PM<br>Sunday, 26 Jun , 06:00 PM<br>Sunday, 3 Jul , 06:00 PM<br>Saturday, 14 May , 06:00 PM<br>Saturday, 21 May , 06:00 PM<br>Saturday, 28 May , 06:00 PM<br>Saturday, 4 Jun , 06:00 PM<br>Saturday, 11 Jun , 06:00 PM<br>Saturday, 18 Jun , 06:00 PM<br>Saturday, 25 Jun , 06:00 PM<br>Saturday, 2 Jul , 06:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the student \"Leya Qureshi\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 06:00 PM<br>Sunday, 22 May , 06:00 PM<br>Sunday, 29 May , 06:00 PM<br>Sunday, 5 Jun , 06:00 PM<br>Sunday, 12 Jun , 06:00 PM<br>Sunday, 19 Jun , 06:00 PM<br>Sunday, 26 Jun , 06:00 PM<br>Sunday, 3 Jul , 06:00 PM<br>Saturday, 14 May , 06:00 PM<br>Saturday, 21 May , 06:00 PM<br>Saturday, 28 May , 06:00 PM<br>Saturday, 4 Jun , 06:00 PM<br>Saturday, 11 Jun , 06:00 PM<br>Saturday, 18 Jun , 06:00 PM<br>Saturday, 25 Jun , 06:00 PM<br>Saturday, 2 Jul , 06:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Leya Qureshi\". <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 06:00 PM<br>Sunday, 22 May , 06:00 PM<br>Sunday, 29 May , 06:00 PM<br>Sunday, 5 Jun , 06:00 PM<br>Sunday, 12 Jun , 06:00 PM<br>Sunday, 19 Jun , 06:00 PM<br>Sunday, 26 Jun , 06:00 PM<br>Sunday, 3 Jul , 06:00 PM<br>Saturday, 14 May , 06:00 PM<br>Saturday, 21 May , 06:00 PM<br>Saturday, 28 May , 06:00 PM<br>Saturday, 4 Jun , 06:00 PM<br>Saturday, 11 Jun , 06:00 PM<br>Saturday, 18 Jun , 06:00 PM<br>Saturday, 25 Jun , 06:00 PM<br>Saturday, 2 Jul , 06:00 PM<br>', 1, 0, 0, '2022-05-08 19:20:59'),
(489, 2, 1, 5, 39, 83, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Manahil Qureshi\". <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 06:45 PM<br>Sunday, 22 May , 06:45 PM<br>Sunday, 29 May , 06:45 PM<br>Sunday, 5 Jun , 06:45 PM<br>Sunday, 12 Jun , 06:45 PM<br>Sunday, 19 Jun , 06:45 PM<br>Sunday, 26 Jun , 06:45 PM<br>Sunday, 3 Jul , 06:45 PM<br>Saturday, 14 May , 06:45 PM<br>Saturday, 21 May , 06:45 PM<br>Saturday, 28 May , 06:45 PM<br>Saturday, 4 Jun , 06:45 PM<br>Saturday, 11 Jun , 06:45 PM<br>Saturday, 18 Jun , 06:45 PM<br>Saturday, 25 Jun , 06:45 PM<br>Saturday, 2 Jul , 06:45 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the student \"Manahil Qureshi\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 06:45 PM<br>Sunday, 22 May , 06:45 PM<br>Sunday, 29 May , 06:45 PM<br>Sunday, 5 Jun , 06:45 PM<br>Sunday, 12 Jun , 06:45 PM<br>Sunday, 19 Jun , 06:45 PM<br>Sunday, 26 Jun , 06:45 PM<br>Sunday, 3 Jul , 06:45 PM<br>Saturday, 14 May , 06:45 PM<br>Saturday, 21 May , 06:45 PM<br>Saturday, 28 May , 06:45 PM<br>Saturday, 4 Jun , 06:45 PM<br>Saturday, 11 Jun , 06:45 PM<br>Saturday, 18 Jun , 06:45 PM<br>Saturday, 25 Jun , 06:45 PM<br>Saturday, 2 Jul , 06:45 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Manahil Qureshi\". <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 06:45 PM<br>Sunday, 22 May , 06:45 PM<br>Sunday, 29 May , 06:45 PM<br>Sunday, 5 Jun , 06:45 PM<br>Sunday, 12 Jun , 06:45 PM<br>Sunday, 19 Jun , 06:45 PM<br>Sunday, 26 Jun , 06:45 PM<br>Sunday, 3 Jul , 06:45 PM<br>Saturday, 14 May , 06:45 PM<br>Saturday, 21 May , 06:45 PM<br>Saturday, 28 May , 06:45 PM<br>Saturday, 4 Jun , 06:45 PM<br>Saturday, 11 Jun , 06:45 PM<br>Saturday, 18 Jun , 06:45 PM<br>Saturday, 25 Jun , 06:45 PM<br>Saturday, 2 Jul , 06:45 PM<br>', 1, 0, 0, '2022-05-08 19:22:29'),
(490, 2, 1, 5, 62, 70, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Sinan Ahmed\". <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Saturday, 14 May , 07:30 PM<br>Saturday, 21 May , 07:30 PM<br>Saturday, 28 May , 07:30 PM<br>Saturday, 4 Jun , 07:30 PM<br>Saturday, 11 Jun , 07:30 PM<br>Saturday, 18 Jun , 07:30 PM<br>Saturday, 25 Jun , 07:30 PM<br>Saturday, 2 Jul , 07:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the student \"Sinan Ahmed\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Saturday, 14 May , 07:30 PM<br>Saturday, 21 May , 07:30 PM<br>Saturday, 28 May , 07:30 PM<br>Saturday, 4 Jun , 07:30 PM<br>Saturday, 11 Jun , 07:30 PM<br>Saturday, 18 Jun , 07:30 PM<br>Saturday, 25 Jun , 07:30 PM<br>Saturday, 2 Jul , 07:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Sinan Ahmed\". <br> Pre-reading level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Saturday, 14 May , 07:30 PM<br>Saturday, 21 May , 07:30 PM<br>Saturday, 28 May , 07:30 PM<br>Saturday, 4 Jun , 07:30 PM<br>Saturday, 11 Jun , 07:30 PM<br>Saturday, 18 Jun , 07:30 PM<br>Saturday, 25 Jun , 07:30 PM<br>Saturday, 2 Jul , 07:30 PM<br>', 1, 0, 0, '2022-05-08 19:24:44'),
(491, 2, 1, 5, 62, 72, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Sundus Ahmed\". <br> Foundation level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Saturday, 14 May , 08:00 PM<br>Saturday, 21 May , 08:00 PM<br>Saturday, 28 May , 08:00 PM<br>Saturday, 4 Jun , 08:00 PM<br>Saturday, 11 Jun , 08:00 PM<br>Saturday, 18 Jun , 08:00 PM<br>Saturday, 25 Jun , 08:00 PM<br>Saturday, 2 Jul , 08:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Sunday, 8 May , 07:30 PM with the student \"Sundus Ahmed\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Saturday, 14 May , 08:00 PM<br>Saturday, 21 May , 08:00 PM<br>Saturday, 28 May , 08:00 PM<br>Saturday, 4 Jun , 08:00 PM<br>Saturday, 11 Jun , 08:00 PM<br>Saturday, 18 Jun , 08:00 PM<br>Saturday, 25 Jun , 08:00 PM<br>Saturday, 2 Jul , 08:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Sundus Ahmed\". <br> Foundation level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Saturday, 14 May , 08:00 PM<br>Saturday, 21 May , 08:00 PM<br>Saturday, 28 May , 08:00 PM<br>Saturday, 4 Jun , 08:00 PM<br>Saturday, 11 Jun , 08:00 PM<br>Saturday, 18 Jun , 08:00 PM<br>Saturday, 25 Jun , 08:00 PM<br>Saturday, 2 Jul , 08:00 PM<br>', 1, 0, 0, '2022-05-08 19:25:06'),
(492, 2, 1, 5, 68, 45, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Farah Waseem\". <br> Foundation level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 08:30 PM<br>Sunday, 22 May , 08:30 PM<br>Sunday, 29 May , 08:30 PM<br>Sunday, 5 Jun , 08:30 PM<br>Sunday, 12 Jun , 08:30 PM<br>Sunday, 19 Jun , 08:30 PM<br>Sunday, 26 Jun , 08:30 PM<br>Sunday, 3 Jul , 08:30 PM<br>Saturday, 14 May , 08:30 PM<br>Saturday, 21 May , 08:30 PM<br>Saturday, 28 May , 08:30 PM<br>Saturday, 4 Jun , 08:30 PM<br>Saturday, 11 Jun , 08:30 PM<br>Saturday, 18 Jun , 08:30 PM<br>Saturday, 25 Jun , 08:30 PM<br>Saturday, 2 Jul , 08:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Sunday, 8 May , 07:30 PM with the student \"Farah Waseem\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 08:30 PM<br>Sunday, 22 May , 08:30 PM<br>Sunday, 29 May , 08:30 PM<br>Sunday, 5 Jun , 08:30 PM<br>Sunday, 12 Jun , 08:30 PM<br>Sunday, 19 Jun , 08:30 PM<br>Sunday, 26 Jun , 08:30 PM<br>Sunday, 3 Jul , 08:30 PM<br>Saturday, 14 May , 08:30 PM<br>Saturday, 21 May , 08:30 PM<br>Saturday, 28 May , 08:30 PM<br>Saturday, 4 Jun , 08:30 PM<br>Saturday, 11 Jun , 08:30 PM<br>Saturday, 18 Jun , 08:30 PM<br>Saturday, 25 Jun , 08:30 PM<br>Saturday, 2 Jul , 08:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Farah Waseem\". <br> Foundation level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 08:30 PM<br>Sunday, 22 May , 08:30 PM<br>Sunday, 29 May , 08:30 PM<br>Sunday, 5 Jun , 08:30 PM<br>Sunday, 12 Jun , 08:30 PM<br>Sunday, 19 Jun , 08:30 PM<br>Sunday, 26 Jun , 08:30 PM<br>Sunday, 3 Jul , 08:30 PM<br>Saturday, 14 May , 08:30 PM<br>Saturday, 21 May , 08:30 PM<br>Saturday, 28 May , 08:30 PM<br>Saturday, 4 Jun , 08:30 PM<br>Saturday, 11 Jun , 08:30 PM<br>Saturday, 18 Jun , 08:30 PM<br>Saturday, 25 Jun , 08:30 PM<br>Saturday, 2 Jul , 08:30 PM<br>', 1, 0, 0, '2022-05-08 19:26:14'),
(493, 2, 1, 5, 68, 46, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Danial Waseem\". <br> Foundation level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 09:00 PM<br>Sunday, 22 May , 09:00 PM<br>Sunday, 29 May , 09:00 PM<br>Sunday, 5 Jun , 09:00 PM<br>Sunday, 12 Jun , 09:00 PM<br>Sunday, 19 Jun , 09:00 PM<br>Sunday, 26 Jun , 09:00 PM<br>Sunday, 3 Jul , 09:00 PM<br>Saturday, 14 May , 09:00 PM<br>Saturday, 21 May , 09:00 PM<br>Saturday, 28 May , 09:00 PM<br>Saturday, 4 Jun , 09:00 PM<br>Saturday, 11 Jun , 09:00 PM<br>Saturday, 18 Jun , 09:00 PM<br>Saturday, 25 Jun , 09:00 PM<br>Saturday, 2 Jul , 09:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Sunday, 8 May , 07:30 PM with the student \"Danial Waseem\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 09:00 PM<br>Sunday, 22 May , 09:00 PM<br>Sunday, 29 May , 09:00 PM<br>Sunday, 5 Jun , 09:00 PM<br>Sunday, 12 Jun , 09:00 PM<br>Sunday, 19 Jun , 09:00 PM<br>Sunday, 26 Jun , 09:00 PM<br>Sunday, 3 Jul , 09:00 PM<br>Saturday, 14 May , 09:00 PM<br>Saturday, 21 May , 09:00 PM<br>Saturday, 28 May , 09:00 PM<br>Saturday, 4 Jun , 09:00 PM<br>Saturday, 11 Jun , 09:00 PM<br>Saturday, 18 Jun , 09:00 PM<br>Saturday, 25 Jun , 09:00 PM<br>Saturday, 2 Jul , 09:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Danial Waseem\". <br> Foundation level start on Sunday, 8 May , 07:30 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:30 PM<br>Sunday, 15 May , 09:00 PM<br>Sunday, 22 May , 09:00 PM<br>Sunday, 29 May , 09:00 PM<br>Sunday, 5 Jun , 09:00 PM<br>Sunday, 12 Jun , 09:00 PM<br>Sunday, 19 Jun , 09:00 PM<br>Sunday, 26 Jun , 09:00 PM<br>Sunday, 3 Jul , 09:00 PM<br>Saturday, 14 May , 09:00 PM<br>Saturday, 21 May , 09:00 PM<br>Saturday, 28 May , 09:00 PM<br>Saturday, 4 Jun , 09:00 PM<br>Saturday, 11 Jun , 09:00 PM<br>Saturday, 18 Jun , 09:00 PM<br>Saturday, 25 Jun , 09:00 PM<br>Saturday, 2 Jul , 09:00 PM<br>', 1, 0, 0, '2022-05-08 19:26:45'),
(494, 2, 1, 5, 18, 29, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Barra Ibrahim\". <br> Foundation level start on Sunday, 8 May , 07:31 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:31 PM<br>Tuesday, 10 May , 07:00 PM<br>Tuesday, 17 May , 07:00 PM<br>Tuesday, 24 May , 07:00 PM<br>Tuesday, 31 May , 07:00 PM<br>Tuesday, 7 Jun , 07:00 PM<br>Tuesday, 14 Jun , 07:00 PM<br>Tuesday, 21 Jun , 07:00 PM<br>Tuesday, 28 Jun , 07:00 PM<br>Tuesday, 5 Jul , 07:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Sunday, 8 May , 07:31 PM with the student \"Barra Ibrahim\" according to the following schedule: <br>Sunday, 8 May , 07:31 PM<br>Tuesday, 10 May , 07:00 PM<br>Tuesday, 17 May , 07:00 PM<br>Tuesday, 24 May , 07:00 PM<br>Tuesday, 31 May , 07:00 PM<br>Tuesday, 7 Jun , 07:00 PM<br>Tuesday, 14 Jun , 07:00 PM<br>Tuesday, 21 Jun , 07:00 PM<br>Tuesday, 28 Jun , 07:00 PM<br>Tuesday, 5 Jul , 07:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Barra Ibrahim\". <br> Foundation level start on Sunday, 8 May , 07:31 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:31 PM<br>Tuesday, 10 May , 07:00 PM<br>Tuesday, 17 May , 07:00 PM<br>Tuesday, 24 May , 07:00 PM<br>Tuesday, 31 May , 07:00 PM<br>Tuesday, 7 Jun , 07:00 PM<br>Tuesday, 14 Jun , 07:00 PM<br>Tuesday, 21 Jun , 07:00 PM<br>Tuesday, 28 Jun , 07:00 PM<br>Tuesday, 5 Jul , 07:00 PM<br>', 1, 0, 0, '2022-05-08 19:30:27'),
(495, 1, 1, NULL, 77, NULL, 'Samar Abbas has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 0, 0, '2022-05-08 19:32:46'),
(496, 1, 1, NULL, 77, 114, 'Samar Abbas has added student Jena A to his student list.', NULL, 'Jena A has been added to your student list.', 1, 0, 0, '2022-05-08 19:37:46'),
(497, 2, 1, 5, 77, 114, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Jena A\". <br> Foundation level start on Sunday, 8 May , 07:41 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:41 PM<br>Sunday, 15 May , 05:00 PM<br>Sunday, 22 May , 05:00 PM<br>Sunday, 29 May , 05:00 PM<br>Sunday, 5 Jun , 05:00 PM<br>Sunday, 12 Jun , 05:00 PM<br>Sunday, 19 Jun , 05:00 PM<br>Sunday, 26 Jun , 05:00 PM<br>Sunday, 3 Jul , 05:00 PM<br>Monday, 9 May , 10:00 PM<br>Monday, 16 May , 10:00 PM<br>Monday, 23 May , 10:00 PM<br>Monday, 30 May , 10:00 PM<br>Monday, 6 Jun , 10:00 PM<br>Monday, 13 Jun , 10:00 PM<br>Monday, 20 Jun , 10:00 PM<br>Monday, 27 Jun , 10:00 PM<br>Monday, 4 Jul , 10:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Sunday, 8 May , 07:41 PM with the student \"Jena A\" according to the following schedule: <br>Sunday, 8 May , 07:41 PM<br>Sunday, 15 May , 05:00 PM<br>Sunday, 22 May , 05:00 PM<br>Sunday, 29 May , 05:00 PM<br>Sunday, 5 Jun , 05:00 PM<br>Sunday, 12 Jun , 05:00 PM<br>Sunday, 19 Jun , 05:00 PM<br>Sunday, 26 Jun , 05:00 PM<br>Sunday, 3 Jul , 05:00 PM<br>Monday, 9 May , 10:00 PM<br>Monday, 16 May , 10:00 PM<br>Monday, 23 May , 10:00 PM<br>Monday, 30 May , 10:00 PM<br>Monday, 6 Jun , 10:00 PM<br>Monday, 13 Jun , 10:00 PM<br>Monday, 20 Jun , 10:00 PM<br>Monday, 27 Jun , 10:00 PM<br>Monday, 4 Jul , 10:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Jena A\". <br> Foundation level start on Sunday, 8 May , 07:41 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 8 May , 07:41 PM<br>Sunday, 15 May , 05:00 PM<br>Sunday, 22 May , 05:00 PM<br>Sunday, 29 May , 05:00 PM<br>Sunday, 5 Jun , 05:00 PM<br>Sunday, 12 Jun , 05:00 PM<br>Sunday, 19 Jun , 05:00 PM<br>Sunday, 26 Jun , 05:00 PM<br>Sunday, 3 Jul , 05:00 PM<br>Monday, 9 May , 10:00 PM<br>Monday, 16 May , 10:00 PM<br>Monday, 23 May , 10:00 PM<br>Monday, 30 May , 10:00 PM<br>Monday, 6 Jun , 10:00 PM<br>Monday, 13 Jun , 10:00 PM<br>Monday, 20 Jun , 10:00 PM<br>Monday, 27 Jun , 10:00 PM<br>Monday, 4 Jul , 10:00 PM<br>', 1, 0, 0, '2022-05-08 19:40:18'),
(498, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"727\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-08 19:41:01'),
(499, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"744\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-08 19:41:01'),
(500, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"777\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-08 19:41:01'),
(501, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"794\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-08 19:41:02'),
(502, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"847\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-08 19:41:02'),
(503, 1, 1, NULL, 78, NULL, 'Guardian Test has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 1, 0, '2022-05-08 20:27:06'),
(504, 1, 1, 12, NULL, NULL, 'Teacher test has registered as a Teacher.', 'Your account has been created successfully.<br> \n                Complete your registration and add your information.', NULL, 1, 0, 0, '2022-05-08 20:31:29'),
(505, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"296\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-09 18:01:08'),
(506, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"811\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-09 18:53:00'),
(508, 1, 1, 12, NULL, NULL, 'Teacher \"Teacher test\" has completed his information.', 'Your information has been updated successfully.', NULL, 1, 0, 0, '2022-05-09 20:38:37'),
(510, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"355\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-09 21:31:14'),
(511, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"475\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-09 21:31:14'),
(512, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"507\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-09 22:11:52'),
(513, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"524\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-09 22:11:53'),
(514, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"541\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-10 14:05:23'),
(515, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"19\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-10 16:04:18'),
(516, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"710\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-10 16:04:18'),
(517, 2, 1, 9, 66, 55, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Tameema Mostafa\". <br> Basic arabic start on Wednesday, 11 May , 04:39 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 04:39 PM<br>Monday, 16 May , 11:00 PM<br>Monday, 23 May , 11:00 PM<br>Monday, 30 May , 11:00 PM<br>Monday, 6 Jun , 11:00 PM<br>Monday, 13 Jun , 11:00 PM<br>Monday, 20 Jun , 11:00 PM<br>Monday, 27 Jun , 11:00 PM<br>Monday, 4 Jul , 11:00 PM<br>Wednesday, 11 May , 11:00 PM<br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Basic arabic start on Wednesday, 11 May , 04:39 PM with the student \"Tameema Mostafa\" according to the following schedule: <br>Wednesday, 11 May , 04:39 PM<br>Monday, 16 May , 11:00 PM<br>Monday, 23 May , 11:00 PM<br>Monday, 30 May , 11:00 PM<br>Monday, 6 Jun , 11:00 PM<br>Monday, 13 Jun , 11:00 PM<br>Monday, 20 Jun , 11:00 PM<br>Monday, 27 Jun , 11:00 PM<br>Monday, 4 Jul , 11:00 PM<br>Wednesday, 11 May , 11:00 PM<br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Tameema Mostafa\". <br> Basic arabic start on Wednesday, 11 May , 04:39 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 04:39 PM<br>Monday, 16 May , 11:00 PM<br>Monday, 23 May , 11:00 PM<br>Monday, 30 May , 11:00 PM<br>Monday, 6 Jun , 11:00 PM<br>Monday, 13 Jun , 11:00 PM<br>Monday, 20 Jun , 11:00 PM<br>Monday, 27 Jun , 11:00 PM<br>Monday, 4 Jul , 11:00 PM<br>Wednesday, 11 May , 11:00 PM<br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>', 1, 0, 0, '2022-05-10 16:39:56'),
(518, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"242\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-10 16:42:21'),
(519, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"516\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-10 17:09:15'),
(521, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"449\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 17:46:40'),
(522, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"623\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 17:46:40'),
(525, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"313\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 18:03:18'),
(526, 2, 1, 9, 66, 55, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Tameema Mostafa\". <br> Basic arabic start on Wednesday, 11 May , 07:30 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Monday, 16 May , 11:00 PM<br>Monday, 23 May , 11:00 PM<br>Monday, 30 May , 11:00 PM<br>Monday, 6 Jun , 11:00 PM<br>Monday, 13 Jun , 11:00 PM<br>Monday, 20 Jun , 11:00 PM<br>Monday, 27 Jun , 11:00 PM<br>Monday, 4 Jul , 11:00 PM<br>Wednesday, 11 May , 11:00 PM<br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Basic arabic start on Wednesday, 11 May , 07:30 PM with the student \"Tameema Mostafa\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Monday, 16 May , 11:00 PM<br>Monday, 23 May , 11:00 PM<br>Monday, 30 May , 11:00 PM<br>Monday, 6 Jun , 11:00 PM<br>Monday, 13 Jun , 11:00 PM<br>Monday, 20 Jun , 11:00 PM<br>Monday, 27 Jun , 11:00 PM<br>Monday, 4 Jul , 11:00 PM<br>Wednesday, 11 May , 11:00 PM<br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Tameema Mostafa\". <br> Basic arabic start on Wednesday, 11 May , 07:30 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Monday, 16 May , 11:00 PM<br>Monday, 23 May , 11:00 PM<br>Monday, 30 May , 11:00 PM<br>Monday, 6 Jun , 11:00 PM<br>Monday, 13 Jun , 11:00 PM<br>Monday, 20 Jun , 11:00 PM<br>Monday, 27 Jun , 11:00 PM<br>Monday, 4 Jul , 11:00 PM<br>Wednesday, 11 May , 11:00 PM<br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>', 0, 0, 0, '2022-05-11 18:54:50'),
(527, 2, 1, 9, 30, 56, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Safa Haroon\". <br> Basic arabic start on Wednesday, 11 May , 07:30 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Wednesday, 11 May , 11:30 PM<br>Wednesday, 18 May , 11:30 PM<br>Wednesday, 25 May , 11:30 PM<br>Wednesday, 1 Jun , 11:30 PM<br>Wednesday, 8 Jun , 11:30 PM<br>Wednesday, 15 Jun , 11:30 PM<br>Wednesday, 22 Jun , 11:30 PM<br>Wednesday, 29 Jun , 11:30 PM<br>Wednesday, 6 Jul , 11:30 PM<br>Thursday, 12 May , 11:30 PM<br>Thursday, 19 May , 11:30 PM<br>Thursday, 26 May , 11:30 PM<br>Thursday, 2 Jun , 11:30 PM<br>Thursday, 9 Jun , 11:30 PM<br>Thursday, 16 Jun , 11:30 PM<br>Thursday, 23 Jun , 11:30 PM<br>Thursday, 30 Jun , 11:30 PM<br>Thursday, 7 Jul , 11:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Basic arabic start on Wednesday, 11 May , 07:30 PM with the student \"Safa Haroon\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Wednesday, 11 May , 11:30 PM<br>Wednesday, 18 May , 11:30 PM<br>Wednesday, 25 May , 11:30 PM<br>Wednesday, 1 Jun , 11:30 PM<br>Wednesday, 8 Jun , 11:30 PM<br>Wednesday, 15 Jun , 11:30 PM<br>Wednesday, 22 Jun , 11:30 PM<br>Wednesday, 29 Jun , 11:30 PM<br>Wednesday, 6 Jul , 11:30 PM<br>Thursday, 12 May , 11:30 PM<br>Thursday, 19 May , 11:30 PM<br>Thursday, 26 May , 11:30 PM<br>Thursday, 2 Jun , 11:30 PM<br>Thursday, 9 Jun , 11:30 PM<br>Thursday, 16 Jun , 11:30 PM<br>Thursday, 23 Jun , 11:30 PM<br>Thursday, 30 Jun , 11:30 PM<br>Thursday, 7 Jul , 11:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Safa Haroon\". <br> Basic arabic start on Wednesday, 11 May , 07:30 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Wednesday, 11 May , 11:30 PM<br>Wednesday, 18 May , 11:30 PM<br>Wednesday, 25 May , 11:30 PM<br>Wednesday, 1 Jun , 11:30 PM<br>Wednesday, 8 Jun , 11:30 PM<br>Wednesday, 15 Jun , 11:30 PM<br>Wednesday, 22 Jun , 11:30 PM<br>Wednesday, 29 Jun , 11:30 PM<br>Wednesday, 6 Jul , 11:30 PM<br>Thursday, 12 May , 11:30 PM<br>Thursday, 19 May , 11:30 PM<br>Thursday, 26 May , 11:30 PM<br>Thursday, 2 Jun , 11:30 PM<br>Thursday, 9 Jun , 11:30 PM<br>Thursday, 16 Jun , 11:30 PM<br>Thursday, 23 Jun , 11:30 PM<br>Thursday, 30 Jun , 11:30 PM<br>Thursday, 7 Jul , 11:30 PM<br>', 0, 0, 0, '2022-05-11 18:57:04');
INSERT INTO `notifications` (`id`, `type`, `admin`, `teacherID`, `guardianID`, `studentID`, `adminMsg`, `teacherMsg`, `guardianMsg`, `seenByAdmin`, `seenByGuardian`, `seenByTeacher`, `createdAt`) VALUES
(528, 2, 1, 9, 22, 38, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Zaynab Ahmed\". <br> Qari program start on Wednesday, 11 May , 07:30 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Tuesday, 17 May , 12:00 AM<br>Tuesday, 24 May , 12:00 AM<br>Tuesday, 31 May , 12:00 AM<br>Tuesday, 7 Jun , 12:00 AM<br>Tuesday, 14 Jun , 12:00 AM<br>Tuesday, 21 Jun , 12:00 AM<br>Tuesday, 28 Jun , 12:00 AM<br>Tuesday, 5 Jul , 12:00 AM<br>Friday, 13 May , 12:00 AM<br>Friday, 20 May , 12:00 AM<br>Friday, 27 May , 12:00 AM<br>Friday, 3 Jun , 12:00 AM<br>Friday, 10 Jun , 12:00 AM<br>Friday, 17 Jun , 12:00 AM<br>Friday, 24 Jun , 12:00 AM<br>Friday, 1 Jul , 12:00 AM<br>Friday, 8 Jul , 12:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Qari program start on Wednesday, 11 May , 07:30 PM with the student \"Zaynab Ahmed\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Tuesday, 17 May , 12:00 AM<br>Tuesday, 24 May , 12:00 AM<br>Tuesday, 31 May , 12:00 AM<br>Tuesday, 7 Jun , 12:00 AM<br>Tuesday, 14 Jun , 12:00 AM<br>Tuesday, 21 Jun , 12:00 AM<br>Tuesday, 28 Jun , 12:00 AM<br>Tuesday, 5 Jul , 12:00 AM<br>Friday, 13 May , 12:00 AM<br>Friday, 20 May , 12:00 AM<br>Friday, 27 May , 12:00 AM<br>Friday, 3 Jun , 12:00 AM<br>Friday, 10 Jun , 12:00 AM<br>Friday, 17 Jun , 12:00 AM<br>Friday, 24 Jun , 12:00 AM<br>Friday, 1 Jul , 12:00 AM<br>Friday, 8 Jul , 12:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Zaynab Ahmed\". <br> Qari program start on Wednesday, 11 May , 07:30 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 11 May , 07:30 PM<br>Tuesday, 17 May , 12:00 AM<br>Tuesday, 24 May , 12:00 AM<br>Tuesday, 31 May , 12:00 AM<br>Tuesday, 7 Jun , 12:00 AM<br>Tuesday, 14 Jun , 12:00 AM<br>Tuesday, 21 Jun , 12:00 AM<br>Tuesday, 28 Jun , 12:00 AM<br>Tuesday, 5 Jul , 12:00 AM<br>Friday, 13 May , 12:00 AM<br>Friday, 20 May , 12:00 AM<br>Friday, 27 May , 12:00 AM<br>Friday, 3 Jun , 12:00 AM<br>Friday, 10 Jun , 12:00 AM<br>Friday, 17 Jun , 12:00 AM<br>Friday, 24 Jun , 12:00 AM<br>Friday, 1 Jul , 12:00 AM<br>Friday, 8 Jul , 12:00 AM<br>', 0, 0, 0, '2022-05-11 18:58:19'),
(530, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"533\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 22:31:40'),
(531, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"559\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 22:31:40'),
(532, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"576\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 22:31:41'),
(533, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"593\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 22:31:41'),
(534, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"663\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-11 22:31:41'),
(535, 2, 1, 6, 55, 102, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Rawan Ibrahim\". <br> Upper-intermediate arabic start on Thursday, 12 May , 10:00 AM with the teacher \"Ahmed Ismail\" according to the following schedule: <br>Thursday, 12 May , 10:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Upper-intermediate arabic start on Thursday, 12 May , 10:00 AM with the student \"Rawan Ibrahim\" according to the following schedule: <br>Thursday, 12 May , 10:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Rawan Ibrahim\". <br> Upper-intermediate arabic start on Thursday, 12 May , 10:00 AM with the teacher \"Ahmed Ismail\" according to the following schedule: <br>Thursday, 12 May , 10:00 AM<br>', 0, 0, 0, '2022-05-12 09:59:32'),
(536, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"642\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-12 10:00:58'),
(537, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"979\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-12 10:00:58'),
(538, 2, 0, 6, NULL, NULL, NULL, 'We would like to inform you that class number: \"1119\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-12 10:01:56'),
(539, 2, 1, 9, 22, 38, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Zaynab Ahmed\". <br> Qari program start on Thursday, 12 May , 11:30 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Thursday, 12 May , 11:30 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Qari program start on Thursday, 12 May , 11:30 AM with the student \"Zaynab Ahmed\" according to the following schedule: <br>Thursday, 12 May , 11:30 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Zaynab Ahmed\". <br> Qari program start on Thursday, 12 May , 11:30 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Thursday, 12 May , 11:30 AM<br>', 0, 0, 0, '2022-05-12 11:28:22'),
(540, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1120\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-12 11:30:17'),
(541, 2, 1, 9, 30, 52, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Marya Haroon\". <br> Tajweed basics start on Friday, 13 May , 11:31 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Friday, 13 May , 11:31 AM<br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Friday, 13 May , 11:31 AM with the student \"Marya Haroon\" according to the following schedule: <br>Friday, 13 May , 11:31 AM<br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Marya Haroon\". <br> Tajweed basics start on Friday, 13 May , 11:31 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Friday, 13 May , 11:31 AM<br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>', 0, 0, 1, '2022-05-12 11:32:18'),
(542, 2, 0, 12, NULL, NULL, NULL, 'We would like to inform you that class number: \"1074\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-13 10:32:23'),
(543, 1, 1, 12, NULL, NULL, 'Teacher \"Teacher test\" has completed his information.', 'Your information has been updated successfully.', NULL, 1, 0, 0, '2022-05-13 10:32:32'),
(544, 1, 1, 12, NULL, NULL, 'Teacher \"Teacher test\" has completed his information.', 'Your information has been updated successfully.', NULL, 1, 0, 0, '2022-05-13 10:38:14'),
(559, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"944\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-13 22:35:10'),
(560, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"953\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-13 22:35:10'),
(561, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1048\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-13 22:35:11'),
(562, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1065\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-13 22:35:11'),
(563, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"551\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-14 02:08:34'),
(564, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"568\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-14 02:08:34'),
(565, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"585\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-14 02:08:34'),
(566, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"602\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-14 02:08:35'),
(567, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1129\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-14 08:07:21'),
(578, 2, 1, 9, 30, 56, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Safa Haroon\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the student \"Safa Haroon\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Safa Haroon\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 0, 0, 0, '2022-05-15 15:21:29'),
(579, 2, 1, 9, 66, 55, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Tameema Mostafa\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the student \"Tameema Mostafa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Tameema Mostafa\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 0, 1, 0, '2022-05-15 15:22:12'),
(580, 2, 1, 9, 15, 22, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Ayaan Ahmed\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the student \"Ayaan Ahmed\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Ayaan Ahmed\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 0, 0, 0, '2022-05-15 15:22:57'),
(581, 2, 1, 9, 15, 22, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Ayaan Ahmed\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the student \"Ayaan Ahmed\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Ayaan Ahmed\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 0, 0, 0, '2022-05-15 15:23:09'),
(582, 2, 1, 9, 19, 30, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Celine E\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the student \"Celine E\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Celine E\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 0, 0, 0, '2022-05-15 15:23:37'),
(583, 2, 1, 9, 43, 91, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Madinah Mir\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the student \"Madinah Mir\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Madinah Mir\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 0, 0, 0, '2022-05-15 15:24:06'),
(584, 2, 1, 9, 22, 38, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Zaynab Ahmed\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the student \"Zaynab Ahmed\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Zaynab Ahmed\". <br> Tajweed basics start on Sunday, 15 May , 04:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Sunday, 15 May , 04:00 PM<br>', 0, 0, 0, '2022-05-15 15:24:29'),
(585, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"728\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-15 16:02:32'),
(586, 2, 1, 9, 30, 52, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 11:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>Wednesday, 13 Jul , 11:00 PM<br>Friday, 20 May , 11:00 PM<br>Friday, 27 May , 11:00 PM<br>Friday, 3 Jun , 11:00 PM<br>Friday, 10 Jun , 11:00 PM<br>Friday, 17 Jun , 11:00 PM<br>Friday, 24 Jun , 11:00 PM<br>Friday, 1 Jul , 11:00 PM<br>Friday, 8 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Wednesday, 18 May , 11:00 PM with the student \"Marya Haroon\" according to the following schedule: <br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>Wednesday, 13 Jul , 11:00 PM<br>Friday, 20 May , 11:00 PM<br>Friday, 27 May , 11:00 PM<br>Friday, 3 Jun , 11:00 PM<br>Friday, 10 Jun , 11:00 PM<br>Friday, 17 Jun , 11:00 PM<br>Friday, 24 Jun , 11:00 PM<br>Friday, 1 Jul , 11:00 PM<br>Friday, 8 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 11:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>Wednesday, 13 Jul , 11:00 PM<br>Friday, 20 May , 11:00 PM<br>Friday, 27 May , 11:00 PM<br>Friday, 3 Jun , 11:00 PM<br>Friday, 10 Jun , 11:00 PM<br>Friday, 17 Jun , 11:00 PM<br>Friday, 24 Jun , 11:00 PM<br>Friday, 1 Jul , 11:00 PM<br>Friday, 8 Jul , 11:00 PM<br>', 0, 0, 0, '2022-05-15 16:19:00'),
(587, 2, 1, 9, 30, 52, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Marya Haroon\". <br> One Juz Surah start on Wednesday, 18 May , 12:50 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 12:50 PM<br>Wednesday, 25 May , 12:50 PM<br>Wednesday, 1 Jun , 12:50 PM<br>Wednesday, 8 Jun , 12:50 PM<br>Wednesday, 15 Jun , 12:50 PM<br>Wednesday, 22 Jun , 12:50 PM<br>Wednesday, 29 Jun , 12:50 PM<br>Wednesday, 6 Jul , 12:50 PM<br>Wednesday, 13 Jul , 12:50 PM<br>Friday, 20 May , 12:50 PM<br>Friday, 27 May , 12:50 PM<br>Friday, 3 Jun , 12:50 PM<br>Friday, 10 Jun , 12:50 PM<br>Friday, 17 Jun , 12:50 PM<br>Friday, 24 Jun , 12:50 PM<br>Friday, 1 Jul , 12:50 PM<br>Friday, 8 Jul , 12:50 PM<br>Friday, 15 Jul , 12:50 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> One Juz Surah start on Wednesday, 18 May , 12:50 PM with the student \"Marya Haroon\" according to the following schedule: <br>Wednesday, 18 May , 12:50 PM<br>Wednesday, 25 May , 12:50 PM<br>Wednesday, 1 Jun , 12:50 PM<br>Wednesday, 8 Jun , 12:50 PM<br>Wednesday, 15 Jun , 12:50 PM<br>Wednesday, 22 Jun , 12:50 PM<br>Wednesday, 29 Jun , 12:50 PM<br>Wednesday, 6 Jul , 12:50 PM<br>Wednesday, 13 Jul , 12:50 PM<br>Friday, 20 May , 12:50 PM<br>Friday, 27 May , 12:50 PM<br>Friday, 3 Jun , 12:50 PM<br>Friday, 10 Jun , 12:50 PM<br>Friday, 17 Jun , 12:50 PM<br>Friday, 24 Jun , 12:50 PM<br>Friday, 1 Jul , 12:50 PM<br>Friday, 8 Jul , 12:50 PM<br>Friday, 15 Jul , 12:50 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Marya Haroon\". <br> One Juz Surah start on Wednesday, 18 May , 12:50 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 12:50 PM<br>Wednesday, 25 May , 12:50 PM<br>Wednesday, 1 Jun , 12:50 PM<br>Wednesday, 8 Jun , 12:50 PM<br>Wednesday, 15 Jun , 12:50 PM<br>Wednesday, 22 Jun , 12:50 PM<br>Wednesday, 29 Jun , 12:50 PM<br>Wednesday, 6 Jul , 12:50 PM<br>Wednesday, 13 Jul , 12:50 PM<br>Friday, 20 May , 12:50 PM<br>Friday, 27 May , 12:50 PM<br>Friday, 3 Jun , 12:50 PM<br>Friday, 10 Jun , 12:50 PM<br>Friday, 17 Jun , 12:50 PM<br>Friday, 24 Jun , 12:50 PM<br>Friday, 1 Jul , 12:50 PM<br>Friday, 8 Jul , 12:50 PM<br>Friday, 15 Jul , 12:50 PM<br>', 0, 0, 0, '2022-05-15 16:50:44'),
(588, 2, 1, 9, 30, 52, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 11:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>Wednesday, 13 Jul , 11:00 PM<br>Friday, 20 May , 11:00 PM<br>Friday, 27 May , 11:00 PM<br>Friday, 3 Jun , 11:00 PM<br>Friday, 10 Jun , 11:00 PM<br>Friday, 17 Jun , 11:00 PM<br>Friday, 24 Jun , 11:00 PM<br>Friday, 1 Jul , 11:00 PM<br>Friday, 8 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Wednesday, 18 May , 11:00 PM with the student \"Marya Haroon\" according to the following schedule: <br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>Wednesday, 13 Jul , 11:00 PM<br>Friday, 20 May , 11:00 PM<br>Friday, 27 May , 11:00 PM<br>Friday, 3 Jun , 11:00 PM<br>Friday, 10 Jun , 11:00 PM<br>Friday, 17 Jun , 11:00 PM<br>Friday, 24 Jun , 11:00 PM<br>Friday, 1 Jul , 11:00 PM<br>Friday, 8 Jul , 11:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 11:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 11:00 PM<br>Wednesday, 25 May , 11:00 PM<br>Wednesday, 1 Jun , 11:00 PM<br>Wednesday, 8 Jun , 11:00 PM<br>Wednesday, 15 Jun , 11:00 PM<br>Wednesday, 22 Jun , 11:00 PM<br>Wednesday, 29 Jun , 11:00 PM<br>Wednesday, 6 Jul , 11:00 PM<br>Wednesday, 13 Jul , 11:00 PM<br>Friday, 20 May , 11:00 PM<br>Friday, 27 May , 11:00 PM<br>Friday, 3 Jun , 11:00 PM<br>Friday, 10 Jun , 11:00 PM<br>Friday, 17 Jun , 11:00 PM<br>Friday, 24 Jun , 11:00 PM<br>Friday, 1 Jul , 11:00 PM<br>Friday, 8 Jul , 11:00 PM<br>', 0, 0, 0, '2022-05-15 16:55:04'),
(589, 2, 1, 11, 76, 113, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Nadia Begum\". <br> Foundation level start on Monday, 16 May , 08:00 PM with the teacher \"Fatema Elshafiey\" according to the following schedule: <br>Monday, 16 May , 08:00 PM<br>Monday, 23 May , 08:00 PM<br>Monday, 30 May , 08:00 PM<br>Monday, 6 Jun , 08:00 PM<br>Monday, 13 Jun , 08:00 PM<br>Monday, 20 Jun , 08:00 PM<br>Monday, 27 Jun , 08:00 PM<br>Monday, 4 Jul , 08:00 PM<br>Monday, 11 Jul , 08:00 PM<br>Wednesday, 18 May , 08:00 PM<br>Wednesday, 25 May , 08:00 PM<br>Wednesday, 1 Jun , 08:00 PM<br>Wednesday, 8 Jun , 08:00 PM<br>Wednesday, 15 Jun , 08:00 PM<br>Wednesday, 22 Jun , 08:00 PM<br>Wednesday, 29 Jun , 08:00 PM<br>Wednesday, 6 Jul , 08:00 PM<br>Wednesday, 13 Jul , 08:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Monday, 16 May , 08:00 PM with the student \"Nadia Begum\" according to the following schedule: <br>Monday, 16 May , 08:00 PM<br>Monday, 23 May , 08:00 PM<br>Monday, 30 May , 08:00 PM<br>Monday, 6 Jun , 08:00 PM<br>Monday, 13 Jun , 08:00 PM<br>Monday, 20 Jun , 08:00 PM<br>Monday, 27 Jun , 08:00 PM<br>Monday, 4 Jul , 08:00 PM<br>Monday, 11 Jul , 08:00 PM<br>Wednesday, 18 May , 08:00 PM<br>Wednesday, 25 May , 08:00 PM<br>Wednesday, 1 Jun , 08:00 PM<br>Wednesday, 8 Jun , 08:00 PM<br>Wednesday, 15 Jun , 08:00 PM<br>Wednesday, 22 Jun , 08:00 PM<br>Wednesday, 29 Jun , 08:00 PM<br>Wednesday, 6 Jul , 08:00 PM<br>Wednesday, 13 Jul , 08:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Nadia Begum\". <br> Foundation level start on Monday, 16 May , 08:00 PM with the teacher \"Fatema Elshafiey\" according to the following schedule: <br>Monday, 16 May , 08:00 PM<br>Monday, 23 May , 08:00 PM<br>Monday, 30 May , 08:00 PM<br>Monday, 6 Jun , 08:00 PM<br>Monday, 13 Jun , 08:00 PM<br>Monday, 20 Jun , 08:00 PM<br>Monday, 27 Jun , 08:00 PM<br>Monday, 4 Jul , 08:00 PM<br>Monday, 11 Jul , 08:00 PM<br>Wednesday, 18 May , 08:00 PM<br>Wednesday, 25 May , 08:00 PM<br>Wednesday, 1 Jun , 08:00 PM<br>Wednesday, 8 Jun , 08:00 PM<br>Wednesday, 15 Jun , 08:00 PM<br>Wednesday, 22 Jun , 08:00 PM<br>Wednesday, 29 Jun , 08:00 PM<br>Wednesday, 6 Jul , 08:00 PM<br>Wednesday, 13 Jul , 08:00 PM<br>', 0, 0, 0, '2022-05-15 17:04:52'),
(590, 2, 1, 9, 30, 52, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 01:00 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>Friday, 15 Jul , 01:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Wednesday, 18 May , 01:00 AM with the student \"Marya Haroon\" according to the following schedule: <br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>Friday, 15 Jul , 01:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 01:00 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>Friday, 15 Jul , 01:00 AM<br>', 0, 0, 0, '2022-05-15 17:06:29'),
(591, 2, 1, 9, 30, 52, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 12:00 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 12:00 AM<br>Wednesday, 25 May , 12:00 AM<br>Wednesday, 1 Jun , 12:00 AM<br>Wednesday, 8 Jun , 12:00 AM<br>Wednesday, 15 Jun , 12:00 AM<br>Wednesday, 22 Jun , 12:00 AM<br>Wednesday, 29 Jun , 12:00 AM<br>Wednesday, 6 Jul , 12:00 AM<br>Wednesday, 13 Jul , 12:00 AM<br>Friday, 20 May , 12:00 AM<br>Friday, 27 May , 12:00 AM<br>Friday, 3 Jun , 12:00 AM<br>Friday, 10 Jun , 12:00 AM<br>Friday, 17 Jun , 12:00 AM<br>Friday, 24 Jun , 12:00 AM<br>Friday, 1 Jul , 12:00 AM<br>Friday, 8 Jul , 12:00 AM<br>Friday, 15 Jul , 12:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Wednesday, 18 May , 12:00 AM with the student \"Marya Haroon\" according to the following schedule: <br>Wednesday, 18 May , 12:00 AM<br>Wednesday, 25 May , 12:00 AM<br>Wednesday, 1 Jun , 12:00 AM<br>Wednesday, 8 Jun , 12:00 AM<br>Wednesday, 15 Jun , 12:00 AM<br>Wednesday, 22 Jun , 12:00 AM<br>Wednesday, 29 Jun , 12:00 AM<br>Wednesday, 6 Jul , 12:00 AM<br>Wednesday, 13 Jul , 12:00 AM<br>Friday, 20 May , 12:00 AM<br>Friday, 27 May , 12:00 AM<br>Friday, 3 Jun , 12:00 AM<br>Friday, 10 Jun , 12:00 AM<br>Friday, 17 Jun , 12:00 AM<br>Friday, 24 Jun , 12:00 AM<br>Friday, 1 Jul , 12:00 AM<br>Friday, 8 Jul , 12:00 AM<br>Friday, 15 Jul , 12:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Marya Haroon\". <br> Tajweed basics start on Wednesday, 18 May , 12:00 AM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Wednesday, 18 May , 12:00 AM<br>Wednesday, 25 May , 12:00 AM<br>Wednesday, 1 Jun , 12:00 AM<br>Wednesday, 8 Jun , 12:00 AM<br>Wednesday, 15 Jun , 12:00 AM<br>Wednesday, 22 Jun , 12:00 AM<br>Wednesday, 29 Jun , 12:00 AM<br>Wednesday, 6 Jul , 12:00 AM<br>Wednesday, 13 Jul , 12:00 AM<br>Friday, 20 May , 12:00 AM<br>Friday, 27 May , 12:00 AM<br>Friday, 3 Jun , 12:00 AM<br>Friday, 10 Jun , 12:00 AM<br>Friday, 17 Jun , 12:00 AM<br>Friday, 24 Jun , 12:00 AM<br>Friday, 1 Jul , 12:00 AM<br>Friday, 8 Jul , 12:00 AM<br>Friday, 15 Jul , 12:00 AM<br>', 1, 0, 0, '2022-05-15 17:08:31'),
(593, 1, 1, NULL, 78, 116, 'Guardian Test has added student Student Ttest to his student list.', NULL, 'Student Ttest has been added to your student list.', 1, 0, 0, '2022-05-15 17:22:39'),
(594, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Foundation level start on Tuesday, 17 May , 11:00 PM with the teacher \"Teacher test\" according to the following schedule: <br>Tuesday, 17 May , 11:00 PM<br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>Friday, 15 Jul , 01:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Tuesday, 17 May , 11:00 PM with the student \"Student Ttest\" according to the following schedule: <br>Tuesday, 17 May , 11:00 PM<br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>Friday, 15 Jul , 01:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Foundation level start on Tuesday, 17 May , 11:00 PM with the teacher \"Teacher test\" according to the following schedule: <br>Tuesday, 17 May , 11:00 PM<br>Wednesday, 18 May , 01:00 AM<br>Wednesday, 25 May , 01:00 AM<br>Wednesday, 1 Jun , 01:00 AM<br>Wednesday, 8 Jun , 01:00 AM<br>Wednesday, 15 Jun , 01:00 AM<br>Wednesday, 22 Jun , 01:00 AM<br>Wednesday, 29 Jun , 01:00 AM<br>Wednesday, 6 Jul , 01:00 AM<br>Wednesday, 13 Jul , 01:00 AM<br>Friday, 20 May , 01:00 AM<br>Friday, 27 May , 01:00 AM<br>Friday, 3 Jun , 01:00 AM<br>Friday, 10 Jun , 01:00 AM<br>Friday, 17 Jun , 01:00 AM<br>Friday, 24 Jun , 01:00 AM<br>Friday, 1 Jul , 01:00 AM<br>Friday, 8 Jul , 01:00 AM<br>Friday, 15 Jul , 01:00 AM<br>', 1, 0, 1, '2022-05-15 17:30:27'),
(595, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Tajweed basics start on Wednesday, 18 May , 11:01 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 18 May , 11:01 PM<br>Wednesday, 25 May , 11:01 PM<br>Wednesday, 1 Jun , 11:01 PM<br>Wednesday, 8 Jun , 11:01 PM<br>Wednesday, 15 Jun , 11:01 PM<br>Wednesday, 22 Jun , 11:01 PM<br>Wednesday, 29 Jun , 11:01 PM<br>Wednesday, 6 Jul , 11:01 PM<br>Wednesday, 13 Jul , 11:01 PM<br>Friday, 20 May , 11:01 PM<br>Friday, 27 May , 11:01 PM<br>Friday, 3 Jun , 11:01 PM<br>Friday, 10 Jun , 11:01 PM<br>Friday, 17 Jun , 11:01 PM<br>Friday, 24 Jun , 11:01 PM<br>Friday, 1 Jul , 11:01 PM<br>Friday, 8 Jul , 11:01 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Tajweed basics start on Wednesday, 18 May , 11:01 PM with the student \"Student Ttest\" according to the following schedule: <br>Wednesday, 18 May , 11:01 PM<br>Wednesday, 25 May , 11:01 PM<br>Wednesday, 1 Jun , 11:01 PM<br>Wednesday, 8 Jun , 11:01 PM<br>Wednesday, 15 Jun , 11:01 PM<br>Wednesday, 22 Jun , 11:01 PM<br>Wednesday, 29 Jun , 11:01 PM<br>Wednesday, 6 Jul , 11:01 PM<br>Wednesday, 13 Jul , 11:01 PM<br>Friday, 20 May , 11:01 PM<br>Friday, 27 May , 11:01 PM<br>Friday, 3 Jun , 11:01 PM<br>Friday, 10 Jun , 11:01 PM<br>Friday, 17 Jun , 11:01 PM<br>Friday, 24 Jun , 11:01 PM<br>Friday, 1 Jul , 11:01 PM<br>Friday, 8 Jul , 11:01 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Tajweed basics start on Wednesday, 18 May , 11:01 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 18 May , 11:01 PM<br>Wednesday, 25 May , 11:01 PM<br>Wednesday, 1 Jun , 11:01 PM<br>Wednesday, 8 Jun , 11:01 PM<br>Wednesday, 15 Jun , 11:01 PM<br>Wednesday, 22 Jun , 11:01 PM<br>Wednesday, 29 Jun , 11:01 PM<br>Wednesday, 6 Jul , 11:01 PM<br>Wednesday, 13 Jul , 11:01 PM<br>Friday, 20 May , 11:01 PM<br>Friday, 27 May , 11:01 PM<br>Friday, 3 Jun , 11:01 PM<br>Friday, 10 Jun , 11:01 PM<br>Friday, 17 Jun , 11:01 PM<br>Friday, 24 Jun , 11:01 PM<br>Friday, 1 Jul , 11:01 PM<br>Friday, 8 Jul , 11:01 PM<br>', 1, 0, 1, '2022-05-15 17:34:25'),
(596, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"508\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 02:31:14'),
(597, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"525\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 02:31:15'),
(598, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1298\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 17:48:57'),
(599, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1299\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 17:48:57'),
(600, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1300\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 17:48:57'),
(601, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1301\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 17:48:57'),
(602, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1302\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 17:48:58'),
(603, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1303\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 17:48:58'),
(604, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1304\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 17:48:58'),
(605, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"812\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-16 18:31:19'),
(606, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"919\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-16 21:01:16'),
(607, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1022\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-16 21:01:17'),
(608, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"20\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-17 16:17:02'),
(609, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"711\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-17 16:17:02'),
(610, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"971\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-17 18:08:06'),
(611, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"233\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 08:21:48'),
(612, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"243\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 08:21:48'),
(613, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"252\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 08:21:48'),
(614, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"279\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 08:21:49'),
(615, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"288\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 08:21:49'),
(616, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"497\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 08:21:49'),
(617, 2, 1, 9, 22, 38, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Zaynab Ahmed\". <br> Qari program start on Tuesday, 24 May , 10:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Tuesday, 24 May , 10:00 PM<br>Tuesday, 31 May , 10:00 PM<br>Tuesday, 7 Jun , 10:00 PM<br>Tuesday, 14 Jun , 10:00 PM<br>Tuesday, 21 Jun , 10:00 PM<br>Tuesday, 28 Jun , 10:00 PM<br>Tuesday, 5 Jul , 10:00 PM<br>Tuesday, 12 Jul , 10:00 PM<br>Friday, 20 May , 10:00 PM<br>Friday, 27 May , 10:00 PM<br>Friday, 3 Jun , 10:00 PM<br>Friday, 10 Jun , 10:00 PM<br>Friday, 17 Jun , 10:00 PM<br>Friday, 24 Jun , 10:00 PM<br>Friday, 1 Jul , 10:00 PM<br>Friday, 8 Jul , 10:00 PM<br>Friday, 15 Jul , 10:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Qari program start on Tuesday, 24 May , 10:00 PM with the student \"Zaynab Ahmed\" according to the following schedule: <br>Tuesday, 24 May , 10:00 PM<br>Tuesday, 31 May , 10:00 PM<br>Tuesday, 7 Jun , 10:00 PM<br>Tuesday, 14 Jun , 10:00 PM<br>Tuesday, 21 Jun , 10:00 PM<br>Tuesday, 28 Jun , 10:00 PM<br>Tuesday, 5 Jul , 10:00 PM<br>Tuesday, 12 Jul , 10:00 PM<br>Friday, 20 May , 10:00 PM<br>Friday, 27 May , 10:00 PM<br>Friday, 3 Jun , 10:00 PM<br>Friday, 10 Jun , 10:00 PM<br>Friday, 17 Jun , 10:00 PM<br>Friday, 24 Jun , 10:00 PM<br>Friday, 1 Jul , 10:00 PM<br>Friday, 8 Jul , 10:00 PM<br>Friday, 15 Jul , 10:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Zaynab Ahmed\". <br> Qari program start on Tuesday, 24 May , 10:00 PM with the teacher \"Samah Khalifa\" according to the following schedule: <br>Tuesday, 24 May , 10:00 PM<br>Tuesday, 31 May , 10:00 PM<br>Tuesday, 7 Jun , 10:00 PM<br>Tuesday, 14 Jun , 10:00 PM<br>Tuesday, 21 Jun , 10:00 PM<br>Tuesday, 28 Jun , 10:00 PM<br>Tuesday, 5 Jul , 10:00 PM<br>Tuesday, 12 Jul , 10:00 PM<br>Friday, 20 May , 10:00 PM<br>Friday, 27 May , 10:00 PM<br>Friday, 3 Jun , 10:00 PM<br>Friday, 10 Jun , 10:00 PM<br>Friday, 17 Jun , 10:00 PM<br>Friday, 24 Jun , 10:00 PM<br>Friday, 1 Jul , 10:00 PM<br>Friday, 8 Jul , 10:00 PM<br>Friday, 15 Jul , 10:00 PM<br>', 1, 0, 0, '2022-05-18 08:37:56'),
(618, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"517\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 14:01:00'),
(619, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"542\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 14:01:02'),
(620, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"560\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 14:01:02'),
(621, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"577\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 14:01:02'),
(622, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"1358\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 14:01:02'),
(623, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"839\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 15:53:48'),
(624, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1057\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 17:57:49'),
(625, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1394\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 17:57:49'),
(626, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"980\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 18:31:35'),
(628, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"594\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-18 22:27:16'),
(630, 2, 0, 6, NULL, NULL, NULL, 'We would like to inform you that class number: \"1101\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-19 09:19:20'),
(631, 2, 0, 6, NULL, NULL, NULL, 'We would like to inform you that class number: \"1110\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-19 09:19:20'),
(632, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"289\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-19 14:50:29'),
(633, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"498\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-19 14:50:29'),
(634, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"552\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-19 20:38:24'),
(635, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"569\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-19 20:38:24'),
(636, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"29\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-20 09:14:37'),
(637, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"29\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-20 09:14:54'),
(638, 2, 0, 12, NULL, NULL, NULL, 'We would like to inform you that class number: \"1432\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-20 09:15:42'),
(639, 2, 0, 12, NULL, NULL, NULL, 'We would like to inform you that class number: \"1432\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-20 09:17:48'),
(640, 2, 0, 12, NULL, NULL, NULL, 'We would like to inform you that class number: \"1432\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-20 09:28:37'),
(641, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1403\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-20 20:05:53'),
(642, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"29\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-21 09:05:06'),
(643, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"720\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-21 09:05:06'),
(644, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"830\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-21 09:05:06'),
(645, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"586\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-21 09:07:54'),
(646, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"603\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-21 09:07:55'),
(647, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1473\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-21 10:25:04'),
(648, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"737\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-21 16:03:00'),
(649, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"754\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-21 16:49:00'),
(650, 2, 0, 12, NULL, NULL, NULL, 'We would like to inform you that class number: \"1441\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-22 08:17:44'),
(651, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"787\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-22 15:01:51'),
(652, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"849\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-22 15:01:52'),
(653, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"729\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-22 16:46:52'),
(654, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"746\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-22 16:46:53'),
(655, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"234\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-23 09:51:45'),
(656, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"244\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-23 09:51:46'),
(657, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"253\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-23 09:51:46'),
(658, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"280\" is missing your report submission.', NULL, 0, 0, 1, '2022-05-23 09:51:46'),
(659, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"509\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-23 13:18:49'),
(660, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"963\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-23 20:25:35'),
(661, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"989\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-23 20:25:35'),
(662, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"920\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 14:37:37'),
(663, 2, 0, 9, NULL, NULL, NULL, 'We would like to inform you that class number: \"1023\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 14:37:38'),
(664, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"21\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 16:18:52'),
(665, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"712\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 16:18:52'),
(666, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"779\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 16:18:52'),
(667, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"796\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 16:18:52'),
(668, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"813\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 16:18:52'),
(669, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"858\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-24 16:18:53'),
(670, 2, 0, 12, NULL, NULL, NULL, 'We would like to inform you that class number: \"1433\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-26 12:34:30'),
(672, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"510\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:30'),
(673, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"518\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:31'),
(674, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"543\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:31'),
(675, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"553\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:31'),
(676, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"561\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:31'),
(677, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"570\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:31'),
(678, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"578\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:31'),
(679, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"587\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:31'),
(680, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"595\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:32'),
(681, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"604\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-29 22:15:32'),
(682, 2, 0, 12, NULL, NULL, NULL, 'We would like to inform you that class number: \"1442\" is missing your report submission.', NULL, 0, 0, 0, '2022-05-31 13:17:41'),
(684, 1, 1, 9, 66, 55, '\"Mostafa Habib\" requested to cancel Mon, 13 Jun 2022, 21:00\'s class\'s number : \"1026\" with the teacher \"Samah Khalifa\" ', '\"Mostafa Habib\" requested to cancel Mon, 13 Jun 2022, 21:00\'s class\'s number : \"1026\" with the teacher \"Samah Khalifa\" ', '\"Mostafa Habib\" requested to cancel Mon, 13 Jun 2022, 21:00\'s class\'s number : \"1026\" with the teacher \"Samah Khalifa\" ', 0, 0, 0, '2022-06-12 21:32:16');
INSERT INTO `notifications` (`id`, `type`, `admin`, `teacherID`, `guardianID`, `studentID`, `adminMsg`, `teacherMsg`, `guardianMsg`, `seenByAdmin`, `seenByGuardian`, `seenByTeacher`, `createdAt`) VALUES
(685, 1, 1, 9, 66, 55, '\"Mostafa Habib\" requested to cancel Wed, 15 Jun 2022, 21:00\'s class\'s number : \"1035\" with the teacher \"Samah Khalifa\" ', '\"Mostafa Habib\" requested to cancel Wed, 15 Jun 2022, 21:00\'s class\'s number : \"1035\" with the teacher \"Samah Khalifa\" ', '\"Mostafa Habib\" requested to cancel Wed, 15 Jun 2022, 21:00\'s class\'s number : \"1035\" with the teacher \"Samah Khalifa\" ', 1, 0, 0, '2022-06-12 21:32:43'),
(688, 1, 1, NULL, 79, NULL, 'Zaynab Abd El Nabi has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 1, 0, '2022-06-18 10:43:45'),
(689, 1, 1, NULL, 80, NULL, 'mm ms has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 1, 0, '2022-06-20 09:52:30'),
(690, 1, 1, NULL, 80, 117, 'mm ms has added student mm msss to his student list.', NULL, 'mm msss has been added to your student list.', 1, 0, 0, '2022-06-20 10:37:07'),
(692, 1, 1, NULL, 81, NULL, 'Is Is has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 0, 0, '2022-06-26 15:55:30'),
(693, 1, 1, NULL, 82, NULL, 'Taky Gad has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 1, 0, '2022-06-28 16:22:46'),
(694, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"235\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(695, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"236\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(696, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"237\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(697, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"238\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(698, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"239\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(699, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"245\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(700, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"246\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(701, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"247\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(702, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"248\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(703, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"249\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(704, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"254\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(705, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"255\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(706, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"256\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(707, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"257\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(708, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"258\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(709, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"281\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(710, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"282\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(711, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"283\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(712, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"284\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(713, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"285\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(714, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"290\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(715, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"291\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(716, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"292\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(717, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"293\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(718, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"294\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(719, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"494\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(720, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"499\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(721, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"500\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(722, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"501\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(723, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"502\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(724, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"503\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(725, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"504\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(726, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"675\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(727, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"1464\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-07 16:52:20'),
(728, 2, 0, 2, NULL, NULL, NULL, 'We would like to inform you that class number: \"709\" is missing your report submission.', NULL, 0, 0, 0, '2022-07-13 17:31:09'),
(729, 1, 1, 17, NULL, NULL, 'hossa@gmail.com hossa@gmail.com has registered as a Teacher.', 'Your account has been created successfully.<br> \n                Complete your registration and add your information.', NULL, 0, 0, 0, '2022-07-16 16:30:51'),
(730, 1, 1, NULL, 83, NULL, 'hosssam sj has registered as a Guardian.', NULL, 'Your account has been created successfully.<br>\n                Complete your registration and add students details now.', 1, 1, 0, '2022-07-16 16:32:31'),
(731, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Foundation level start on Monday, 18 Jul , 06:00 AM with the teacher \"Teacher test\" according to the following schedule: <br>Monday, 18 Jul , 06:00 AM<br>Friday, 22 Jul , 08:05 AM<br>Friday, 29 Jul , 08:05 AM<br>Friday, 5 Aug , 08:05 AM<br>Friday, 12 Aug , 08:05 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Monday, 18 Jul , 06:00 AM with the student \"Student Ttest\" according to the following schedule: <br>Monday, 18 Jul , 06:00 AM<br>Friday, 22 Jul , 08:05 AM<br>Friday, 29 Jul , 08:05 AM<br>Friday, 5 Aug , 08:05 AM<br>Friday, 12 Aug , 08:05 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Foundation level start on Monday, 18 Jul , 06:00 AM with the teacher \"Teacher test\" according to the following schedule: <br>Monday, 18 Jul , 06:00 AM<br>Friday, 22 Jul , 08:05 AM<br>Friday, 29 Jul , 08:05 AM<br>Friday, 5 Aug , 08:05 AM<br>Friday, 12 Aug , 08:05 AM<br>', 0, 1, 0, '2022-07-17 06:00:33'),
(732, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Foundation level start on Monday, 18 Jul , 06:01 AM with the teacher \"Teacher test\" according to the following schedule: <br>Monday, 18 Jul , 06:01 AM<br>Monday, 18 Jul , 08:07 AM<br>Monday, 25 Jul , 08:07 AM<br>Monday, 1 Aug , 08:07 AM<br>Monday, 8 Aug , 08:07 AM<br>Monday, 15 Aug , 08:07 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Monday, 18 Jul , 06:01 AM with the student \"Student Ttest\" according to the following schedule: <br>Monday, 18 Jul , 06:01 AM<br>Monday, 18 Jul , 08:07 AM<br>Monday, 25 Jul , 08:07 AM<br>Monday, 1 Aug , 08:07 AM<br>Monday, 8 Aug , 08:07 AM<br>Monday, 15 Aug , 08:07 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Foundation level start on Monday, 18 Jul , 06:01 AM with the teacher \"Teacher test\" according to the following schedule: <br>Monday, 18 Jul , 06:01 AM<br>Monday, 18 Jul , 08:07 AM<br>Monday, 25 Jul , 08:07 AM<br>Monday, 1 Aug , 08:07 AM<br>Monday, 8 Aug , 08:07 AM<br>Monday, 15 Aug , 08:07 AM<br>', 0, 0, 0, '2022-07-17 06:01:57'),
(733, 2, 1, 5, 77, 114, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Jena A\". <br> Foundation level start on Sunday, 17 Jul , 03:00 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 17 Jul , 03:00 PM<br>Sunday, 24 Jul , 03:00 PM<br>Sunday, 31 Jul , 03:00 PM<br>Sunday, 7 Aug , 03:00 PM<br>Sunday, 14 Aug , 03:00 PM<br>Monday, 18 Jul , 08:00 PM<br>Monday, 25 Jul , 08:00 PM<br>Monday, 1 Aug , 08:00 PM<br>Monday, 8 Aug , 08:00 PM<br>Monday, 15 Aug , 08:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Sunday, 17 Jul , 03:00 PM with the student \"Jena A\" according to the following schedule: <br>Sunday, 17 Jul , 03:00 PM<br>Sunday, 24 Jul , 03:00 PM<br>Sunday, 31 Jul , 03:00 PM<br>Sunday, 7 Aug , 03:00 PM<br>Sunday, 14 Aug , 03:00 PM<br>Monday, 18 Jul , 08:00 PM<br>Monday, 25 Jul , 08:00 PM<br>Monday, 1 Aug , 08:00 PM<br>Monday, 8 Aug , 08:00 PM<br>Monday, 15 Aug , 08:00 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Jena A\". <br> Foundation level start on Sunday, 17 Jul , 03:00 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Sunday, 17 Jul , 03:00 PM<br>Sunday, 24 Jul , 03:00 PM<br>Sunday, 31 Jul , 03:00 PM<br>Sunday, 7 Aug , 03:00 PM<br>Sunday, 14 Aug , 03:00 PM<br>Monday, 18 Jul , 08:00 PM<br>Monday, 25 Jul , 08:00 PM<br>Monday, 1 Aug , 08:00 PM<br>Monday, 8 Aug , 08:00 PM<br>Monday, 15 Aug , 08:00 PM<br>', 0, 0, 0, '2022-07-17 08:29:31'),
(734, 2, 1, 5, 42, 88, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Mia Mohamed\". <br> Intermediate arabic start on Tuesday, 19 Jul , 05:00 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Tuesday, 19 Jul , 05:00 PM<br>Tuesday, 26 Jul , 05:00 PM<br>Tuesday, 2 Aug , 05:00 PM<br>Tuesday, 9 Aug , 05:00 PM<br>Tuesday, 16 Aug , 05:00 PM<br>Saturday, 23 Jul , 09:00 AM<br>Saturday, 30 Jul , 09:00 AM<br>Saturday, 6 Aug , 09:00 AM<br>Saturday, 13 Aug , 09:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Intermediate arabic start on Tuesday, 19 Jul , 05:00 PM with the student \"Mia Mohamed\" according to the following schedule: <br>Tuesday, 19 Jul , 05:00 PM<br>Tuesday, 26 Jul , 05:00 PM<br>Tuesday, 2 Aug , 05:00 PM<br>Tuesday, 9 Aug , 05:00 PM<br>Tuesday, 16 Aug , 05:00 PM<br>Saturday, 23 Jul , 09:00 AM<br>Saturday, 30 Jul , 09:00 AM<br>Saturday, 6 Aug , 09:00 AM<br>Saturday, 13 Aug , 09:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Mia Mohamed\". <br> Intermediate arabic start on Tuesday, 19 Jul , 05:00 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Tuesday, 19 Jul , 05:00 PM<br>Tuesday, 26 Jul , 05:00 PM<br>Tuesday, 2 Aug , 05:00 PM<br>Tuesday, 9 Aug , 05:00 PM<br>Tuesday, 16 Aug , 05:00 PM<br>Saturday, 23 Jul , 09:00 AM<br>Saturday, 30 Jul , 09:00 AM<br>Saturday, 6 Aug , 09:00 AM<br>Saturday, 13 Aug , 09:00 AM<br>', 0, 0, 0, '2022-07-17 08:31:12'),
(735, 2, 1, 5, 42, 88, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Mia Mohamed\". <br> Intermediate arabic start on Tuesday, 19 Jul , 05:00 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Tuesday, 19 Jul , 05:00 PM<br>Tuesday, 26 Jul , 05:00 PM<br>Tuesday, 2 Aug , 05:00 PM<br>Tuesday, 9 Aug , 05:00 PM<br>Tuesday, 16 Aug , 05:00 PM<br>Saturday, 23 Jul , 09:00 AM<br>Saturday, 30 Jul , 09:00 AM<br>Saturday, 6 Aug , 09:00 AM<br>Saturday, 13 Aug , 09:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Intermediate arabic start on Tuesday, 19 Jul , 05:00 PM with the student \"Mia Mohamed\" according to the following schedule: <br>Tuesday, 19 Jul , 05:00 PM<br>Tuesday, 26 Jul , 05:00 PM<br>Tuesday, 2 Aug , 05:00 PM<br>Tuesday, 9 Aug , 05:00 PM<br>Tuesday, 16 Aug , 05:00 PM<br>Saturday, 23 Jul , 09:00 AM<br>Saturday, 30 Jul , 09:00 AM<br>Saturday, 6 Aug , 09:00 AM<br>Saturday, 13 Aug , 09:00 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Mia Mohamed\". <br> Intermediate arabic start on Tuesday, 19 Jul , 05:00 PM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Tuesday, 19 Jul , 05:00 PM<br>Tuesday, 26 Jul , 05:00 PM<br>Tuesday, 2 Aug , 05:00 PM<br>Tuesday, 9 Aug , 05:00 PM<br>Tuesday, 16 Aug , 05:00 PM<br>Saturday, 23 Jul , 09:00 AM<br>Saturday, 30 Jul , 09:00 AM<br>Saturday, 6 Aug , 09:00 AM<br>Saturday, 13 Aug , 09:00 AM<br>', 0, 0, 0, '2022-07-17 08:32:52'),
(736, 2, 1, 5, 62, 70, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Sinan Ahmed\". <br> Pre-reading level start on Thursday, 21 Jul , 08:57 AM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Thursday, 21 Jul , 08:57 AM<br>Thursday, 28 Jul , 08:57 AM<br>Thursday, 4 Aug , 08:57 AM<br>Thursday, 11 Aug , 08:57 AM<br>Friday, 22 Jul , 08:57 AM<br>Friday, 29 Jul , 08:57 AM<br>Friday, 5 Aug , 08:57 AM<br>Friday, 12 Aug , 08:57 AM<br>Saturday, 23 Jul , 05:30 PM<br>Saturday, 30 Jul , 05:30 PM<br>Saturday, 6 Aug , 05:30 PM<br>Saturday, 13 Aug , 05:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Pre-reading level start on Thursday, 21 Jul , 08:57 AM with the student \"Sinan Ahmed\" according to the following schedule: <br>Thursday, 21 Jul , 08:57 AM<br>Thursday, 28 Jul , 08:57 AM<br>Thursday, 4 Aug , 08:57 AM<br>Thursday, 11 Aug , 08:57 AM<br>Friday, 22 Jul , 08:57 AM<br>Friday, 29 Jul , 08:57 AM<br>Friday, 5 Aug , 08:57 AM<br>Friday, 12 Aug , 08:57 AM<br>Saturday, 23 Jul , 05:30 PM<br>Saturday, 30 Jul , 05:30 PM<br>Saturday, 6 Aug , 05:30 PM<br>Saturday, 13 Aug , 05:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Sinan Ahmed\". <br> Pre-reading level start on Thursday, 21 Jul , 08:57 AM with the teacher \"Lamiaa Ali\" according to the following schedule: <br>Thursday, 21 Jul , 08:57 AM<br>Thursday, 28 Jul , 08:57 AM<br>Thursday, 4 Aug , 08:57 AM<br>Thursday, 11 Aug , 08:57 AM<br>Friday, 22 Jul , 08:57 AM<br>Friday, 29 Jul , 08:57 AM<br>Friday, 5 Aug , 08:57 AM<br>Friday, 12 Aug , 08:57 AM<br>Saturday, 23 Jul , 05:30 PM<br>Saturday, 30 Jul , 05:30 PM<br>Saturday, 6 Aug , 05:30 PM<br>Saturday, 13 Aug , 05:30 PM<br>', 0, 0, 0, '2022-07-17 08:57:57'),
(737, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Foundation level start on Wednesday, 20 Jul , 02:30 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 20 Jul , 02:30 PM<br>Saturday, 23 Jul , 04:34 PM<br>Saturday, 30 Jul , 04:34 PM<br>Saturday, 6 Aug , 04:34 PM<br>Saturday, 13 Aug , 04:34 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Wednesday, 20 Jul , 02:30 PM with the student \"Student Ttest\" according to the following schedule: <br>Wednesday, 20 Jul , 02:30 PM<br>Saturday, 23 Jul , 04:34 PM<br>Saturday, 30 Jul , 04:34 PM<br>Saturday, 6 Aug , 04:34 PM<br>Saturday, 13 Aug , 04:34 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Foundation level start on Wednesday, 20 Jul , 02:30 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 20 Jul , 02:30 PM<br>Saturday, 23 Jul , 04:34 PM<br>Saturday, 30 Jul , 04:34 PM<br>Saturday, 6 Aug , 04:34 PM<br>Saturday, 13 Aug , 04:34 PM<br>', 1, 0, 0, '2022-07-18 14:30:34'),
(738, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Intermediate start on Monday, 18 Jul , 03:17 PM with the teacher \"Teacher test\" according to the following schedule: <br>Monday, 18 Jul , 03:17 PM<br>Sunday, 24 Jul , 05:18 PM<br>Sunday, 31 Jul , 05:18 PM<br>Sunday, 7 Aug , 05:18 PM<br>Sunday, 14 Aug , 05:18 PM<br>Monday, 18 Jul , 05:18 PM<br>Monday, 25 Jul , 05:18 PM<br>Monday, 1 Aug , 05:18 PM<br>Monday, 8 Aug , 05:18 PM<br>Monday, 15 Aug , 05:18 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Intermediate start on Monday, 18 Jul , 03:17 PM with the student \"Student Ttest\" according to the following schedule: <br>Monday, 18 Jul , 03:17 PM<br>Sunday, 24 Jul , 05:18 PM<br>Sunday, 31 Jul , 05:18 PM<br>Sunday, 7 Aug , 05:18 PM<br>Sunday, 14 Aug , 05:18 PM<br>Monday, 18 Jul , 05:18 PM<br>Monday, 25 Jul , 05:18 PM<br>Monday, 1 Aug , 05:18 PM<br>Monday, 8 Aug , 05:18 PM<br>Monday, 15 Aug , 05:18 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Intermediate start on Monday, 18 Jul , 03:17 PM with the teacher \"Teacher test\" according to the following schedule: <br>Monday, 18 Jul , 03:17 PM<br>Sunday, 24 Jul , 05:18 PM<br>Sunday, 31 Jul , 05:18 PM<br>Sunday, 7 Aug , 05:18 PM<br>Sunday, 14 Aug , 05:18 PM<br>Monday, 18 Jul , 05:18 PM<br>Monday, 25 Jul , 05:18 PM<br>Monday, 1 Aug , 05:18 PM<br>Monday, 8 Aug , 05:18 PM<br>Monday, 15 Aug , 05:18 PM<br>', 1, 0, 0, '2022-07-18 15:16:39'),
(739, 2, 1, 10, 39, 83, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Manahil Qureshi\". <br> Khatmah program start on Friday, 29 Jul , 05:42 PM with the teacher \"Asmaa Ibrahem\" according to the following schedule: <br>Friday, 29 Jul , 05:42 PM<br>Tuesday, 2 Aug , 07:46 PM<br>Tuesday, 9 Aug , 07:46 PM<br>Tuesday, 16 Aug , 07:46 PM<br>Tuesday, 23 Aug , 07:46 PM<br>Thursday, 4 Aug , 07:44 PM<br>Thursday, 11 Aug , 07:44 PM<br>Thursday, 18 Aug , 07:44 PM<br>Thursday, 25 Aug , 07:44 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Khatmah program start on Friday, 29 Jul , 05:42 PM with the student \"Manahil Qureshi\" according to the following schedule: <br>Friday, 29 Jul , 05:42 PM<br>Tuesday, 2 Aug , 07:46 PM<br>Tuesday, 9 Aug , 07:46 PM<br>Tuesday, 16 Aug , 07:46 PM<br>Tuesday, 23 Aug , 07:46 PM<br>Thursday, 4 Aug , 07:44 PM<br>Thursday, 11 Aug , 07:44 PM<br>Thursday, 18 Aug , 07:44 PM<br>Thursday, 25 Aug , 07:44 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Manahil Qureshi\". <br> Khatmah program start on Friday, 29 Jul , 05:42 PM with the teacher \"Asmaa Ibrahem\" according to the following schedule: <br>Friday, 29 Jul , 05:42 PM<br>Tuesday, 2 Aug , 07:46 PM<br>Tuesday, 9 Aug , 07:46 PM<br>Tuesday, 16 Aug , 07:46 PM<br>Tuesday, 23 Aug , 07:46 PM<br>Thursday, 4 Aug , 07:44 PM<br>Thursday, 11 Aug , 07:44 PM<br>Thursday, 18 Aug , 07:44 PM<br>Thursday, 25 Aug , 07:44 PM<br>', 1, 0, 0, '2022-07-18 17:43:55'),
(740, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Foundation level start on Wednesday, 20 Jul , 04:11 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 20 Jul , 04:11 PM<br>Friday, 22 Jul , 06:16 PM<br>Friday, 29 Jul , 06:16 PM<br>Friday, 5 Aug , 06:16 PM<br>Friday, 12 Aug , 06:16 PM<br>Friday, 19 Aug , 06:16 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Wednesday, 20 Jul , 04:11 PM with the student \"Student Ttest\" according to the following schedule: <br>Wednesday, 20 Jul , 04:11 PM<br>Friday, 22 Jul , 06:16 PM<br>Friday, 29 Jul , 06:16 PM<br>Friday, 5 Aug , 06:16 PM<br>Friday, 12 Aug , 06:16 PM<br>Friday, 19 Aug , 06:16 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Foundation level start on Wednesday, 20 Jul , 04:11 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 20 Jul , 04:11 PM<br>Friday, 22 Jul , 06:16 PM<br>Friday, 29 Jul , 06:16 PM<br>Friday, 5 Aug , 06:16 PM<br>Friday, 12 Aug , 06:16 PM<br>Friday, 19 Aug , 06:16 PM<br>', 0, 0, 0, '2022-07-19 16:11:18'),
(741, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Foundation level start on Wednesday, 20 Jul , 04:25 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 20 Jul , 04:25 PM<br>Friday, 22 Jul , 06:30 PM<br>Friday, 29 Jul , 06:30 PM<br>Friday, 5 Aug , 06:30 PM<br>Friday, 12 Aug , 06:30 PM<br>Friday, 19 Aug , 06:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Foundation level start on Wednesday, 20 Jul , 04:25 PM with the student \"Student Ttest\" according to the following schedule: <br>Wednesday, 20 Jul , 04:25 PM<br>Friday, 22 Jul , 06:30 PM<br>Friday, 29 Jul , 06:30 PM<br>Friday, 5 Aug , 06:30 PM<br>Friday, 12 Aug , 06:30 PM<br>Friday, 19 Aug , 06:30 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Foundation level start on Wednesday, 20 Jul , 04:25 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 20 Jul , 04:25 PM<br>Friday, 22 Jul , 06:30 PM<br>Friday, 29 Jul , 06:30 PM<br>Friday, 5 Aug , 06:30 PM<br>Friday, 12 Aug , 06:30 PM<br>Friday, 19 Aug , 06:30 PM<br>', 0, 0, 0, '2022-07-19 16:26:05'),
(742, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Pre-reading level start on Sunday, 24 Jul , 10:05 AM with the teacher \"Teacher test\" according to the following schedule: <br>Sunday, 24 Jul , 10:05 AM<br>Sunday, 31 Jul , 10:05 AM<br>Sunday, 7 Aug , 10:05 AM<br>Sunday, 14 Aug , 10:05 AM<br>Monday, 25 Jul , 10:05 AM<br>Monday, 1 Aug , 10:05 AM<br>Monday, 8 Aug , 10:05 AM<br>Monday, 15 Aug , 10:05 AM<br>Wednesday, 20 Jul , 10:06 AM<br>Wednesday, 27 Jul , 10:06 AM<br>Wednesday, 3 Aug , 10:06 AM<br>Wednesday, 10 Aug , 10:06 AM<br>Wednesday, 17 Aug , 10:06 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Pre-reading level start on Sunday, 24 Jul , 10:05 AM with the student \"Student Ttest\" according to the following schedule: <br>Sunday, 24 Jul , 10:05 AM<br>Sunday, 31 Jul , 10:05 AM<br>Sunday, 7 Aug , 10:05 AM<br>Sunday, 14 Aug , 10:05 AM<br>Monday, 25 Jul , 10:05 AM<br>Monday, 1 Aug , 10:05 AM<br>Monday, 8 Aug , 10:05 AM<br>Monday, 15 Aug , 10:05 AM<br>Wednesday, 20 Jul , 10:06 AM<br>Wednesday, 27 Jul , 10:06 AM<br>Wednesday, 3 Aug , 10:06 AM<br>Wednesday, 10 Aug , 10:06 AM<br>Wednesday, 17 Aug , 10:06 AM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Pre-reading level start on Sunday, 24 Jul , 10:05 AM with the teacher \"Teacher test\" according to the following schedule: <br>Sunday, 24 Jul , 10:05 AM<br>Sunday, 31 Jul , 10:05 AM<br>Sunday, 7 Aug , 10:05 AM<br>Sunday, 14 Aug , 10:05 AM<br>Monday, 25 Jul , 10:05 AM<br>Monday, 1 Aug , 10:05 AM<br>Monday, 8 Aug , 10:05 AM<br>Monday, 15 Aug , 10:05 AM<br>Wednesday, 20 Jul , 10:06 AM<br>Wednesday, 27 Jul , 10:06 AM<br>Wednesday, 3 Aug , 10:06 AM<br>Wednesday, 10 Aug , 10:06 AM<br>Wednesday, 17 Aug , 10:06 AM<br>', 0, 0, 0, '2022-07-20 10:07:18'),
(743, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"511\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:54'),
(744, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"512\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:54'),
(745, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"513\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:54'),
(746, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"514\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:54'),
(747, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"519\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:54'),
(748, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"520\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:54'),
(749, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"521\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(750, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"522\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(751, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"544\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(752, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"545\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(753, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"546\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(754, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"547\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(755, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"548\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(756, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"554\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(757, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"555\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:55'),
(758, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"556\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:57'),
(759, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"557\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:57'),
(760, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"562\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:57'),
(761, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"563\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:57'),
(762, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"564\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:57'),
(763, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"565\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:57'),
(764, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"571\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:58'),
(765, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"572\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:58'),
(766, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"573\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:58'),
(767, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"574\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:15:59'),
(768, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"579\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:00'),
(769, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"580\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:00'),
(770, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"581\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:00'),
(771, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"582\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:00'),
(772, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"588\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:00'),
(773, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"589\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:00'),
(774, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"590\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:02'),
(775, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"591\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:02'),
(776, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"596\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:02'),
(777, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"597\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:03'),
(778, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"598\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:03'),
(779, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"599\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:04'),
(780, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"605\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:04'),
(781, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"606\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:06'),
(782, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"607\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:06'),
(783, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"608\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:08'),
(784, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"609\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:09'),
(785, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"610\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:09'),
(786, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"611\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:09'),
(787, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"619\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:09'),
(788, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"620\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:10'),
(789, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"621\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:12'),
(790, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"893\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:13'),
(791, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"1096\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:13'),
(792, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"1097\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:14'),
(793, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"1099\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:15'),
(794, 2, 0, 11, NULL, NULL, NULL, 'We would like to inform you that class number: \"1241\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:16:16'),
(795, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"22\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:08'),
(796, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"23\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:08'),
(797, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"24\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:09'),
(798, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"25\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:09'),
(799, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"30\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:10'),
(800, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"31\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:10'),
(801, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"32\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:10'),
(802, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"33\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(803, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"34\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(804, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"505\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(805, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"680\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(806, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"713\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(807, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"714\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(808, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"715\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(809, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"716\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(810, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"717\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:11'),
(811, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"718\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:12'),
(812, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"721\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:12'),
(813, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"722\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:12'),
(814, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"723\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:12'),
(815, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"724\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:13'),
(816, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"725\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:14'),
(817, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"726\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:14'),
(818, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"730\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:14'),
(819, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"731\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:14'),
(820, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"732\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:14'),
(821, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"733\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:16'),
(822, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"734\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:16'),
(823, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"735\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:16'),
(824, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"738\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:16'),
(825, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"739\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:17'),
(826, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"740\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:17'),
(827, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"741\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:17'),
(828, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"742\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:18'),
(829, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"743\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:18'),
(830, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"747\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:19'),
(831, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"748\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:19'),
(832, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"749\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:19'),
(833, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"749\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:31'),
(834, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"750\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:32'),
(835, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"751\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:33'),
(836, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"752\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:33'),
(837, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"755\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:33'),
(838, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"756\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:33'),
(839, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"757\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:34'),
(840, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"758\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:34'),
(841, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"759\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:34'),
(842, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"760\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:35'),
(843, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"763\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:35'),
(844, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"764\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:35'),
(845, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"765\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:36'),
(846, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"766\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:37'),
(847, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"767\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:37'),
(848, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"768\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:37'),
(849, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"771\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:37'),
(850, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"772\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:37'),
(851, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"773\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:37'),
(852, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"774\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:38'),
(853, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"775\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:39'),
(854, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"776\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:39'),
(855, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"780\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:39'),
(856, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"781\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:39'),
(857, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"782\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:40'),
(858, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"783\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:40'),
(859, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"784\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:40'),
(860, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"785\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:40'),
(861, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"788\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:41'),
(862, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"789\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:42'),
(863, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"790\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:42'),
(864, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"791\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:42'),
(865, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"792\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:42'),
(866, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"793\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:44'),
(867, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"797\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:44'),
(868, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"798\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:44'),
(869, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"799\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:44'),
(870, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"800\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:44'),
(871, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"801\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:45'),
(872, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"802\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:47'),
(873, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"805\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:47'),
(874, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"806\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:47'),
(875, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"807\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:48'),
(876, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"808\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:48'),
(877, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"809\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:48'),
(878, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"810\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:48'),
(879, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"814\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:50'),
(880, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"815\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:50'),
(881, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"816\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:50'),
(882, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"817\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:50'),
(883, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"818\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:50'),
(884, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"819\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:50'),
(885, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"822\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:51'),
(886, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"823\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:52'),
(887, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"824\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:52'),
(888, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"825\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:52'),
(889, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"826\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:53'),
(890, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"827\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:53'),
(891, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"828\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:53'),
(892, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"831\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:54'),
(893, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"832\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:55'),
(894, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"833\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:55'),
(895, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"834\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:55');
INSERT INTO `notifications` (`id`, `type`, `admin`, `teacherID`, `guardianID`, `studentID`, `adminMsg`, `teacherMsg`, `guardianMsg`, `seenByAdmin`, `seenByGuardian`, `seenByTeacher`, `createdAt`) VALUES
(896, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"835\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:55'),
(897, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"836\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:55'),
(898, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"837\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:56'),
(899, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"840\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:56'),
(900, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"841\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:57'),
(901, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"842\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:57'),
(902, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"843\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:57'),
(903, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"844\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:58'),
(904, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"845\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:58'),
(905, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"846\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:18:59'),
(906, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"850\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:00'),
(907, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"851\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:00'),
(908, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"852\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:00'),
(909, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"853\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:01'),
(910, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"854\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:01'),
(911, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"855\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:01'),
(912, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"859\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:01'),
(913, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"860\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:01'),
(914, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"861\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:01'),
(915, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"862\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:01'),
(916, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"863\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:02'),
(917, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"864\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:03'),
(918, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"866\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:04'),
(919, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"867\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:04'),
(920, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"868\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:04'),
(921, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"869\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:05'),
(922, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"871\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:05'),
(923, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"911\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:05'),
(924, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"912\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:05'),
(925, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"914\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:05'),
(926, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"917\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:07'),
(927, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1292\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:08'),
(928, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1294\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:08'),
(929, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1295\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:08'),
(930, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1296\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:08'),
(931, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1449\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:08'),
(932, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1450\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:10'),
(933, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1451\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:10'),
(934, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1457\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:10'),
(935, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1497\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:11'),
(936, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1502\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:12'),
(937, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1503\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:12'),
(938, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1504\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:12'),
(939, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1515\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:13'),
(940, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1516\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:13'),
(941, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1517\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:13'),
(942, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1518\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:13'),
(943, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1520\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:14'),
(944, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1521\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:15'),
(945, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1522\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:15'),
(946, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1523\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:16'),
(947, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1534\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:17'),
(948, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1535\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:19'),
(949, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1536\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:19'),
(950, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1539\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:19'),
(951, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1540\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:19'),
(952, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1541\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:19'),
(953, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1543\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:20'),
(954, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1544\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:22'),
(955, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1545\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(956, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1546\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(957, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1552\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(958, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1553\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(959, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1554\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(960, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1555\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(961, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1561\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(962, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1562\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:23'),
(963, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1563\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:24'),
(964, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1570\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:24'),
(965, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1571\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:24'),
(966, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1572\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:25'),
(967, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1578\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:26'),
(968, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1579\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:26'),
(969, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1580\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:26'),
(970, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1581\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:26'),
(971, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1583\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:26'),
(972, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1584\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:26'),
(973, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1585\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:28'),
(974, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1586\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:28'),
(975, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1588\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:28'),
(976, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1589\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:29'),
(977, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1590\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:29'),
(978, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1593\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:29'),
(979, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1594\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:30'),
(980, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1595\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:31'),
(981, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1597\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:31'),
(982, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1598\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:31'),
(983, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1599\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:31'),
(984, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1601\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:33'),
(985, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1602\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:33'),
(986, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1603\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:33'),
(987, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1604\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:33'),
(988, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1606\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:33'),
(989, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1607\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:34'),
(990, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1608\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:34'),
(991, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1609\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:34'),
(992, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1611\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:35'),
(993, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1612\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:36'),
(994, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1613\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:36'),
(995, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1616\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:36'),
(996, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1617\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:37'),
(997, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1618\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:39'),
(998, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1620\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:39'),
(999, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1621\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:39'),
(1000, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1622\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:39'),
(1001, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1624\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:39'),
(1002, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1625\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:40'),
(1003, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1626\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:40'),
(1004, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1628\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:40'),
(1005, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1629\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:42'),
(1006, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1630\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:44'),
(1007, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1632\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:19:44'),
(1008, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1633\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:20:05'),
(1009, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1634\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 12:20:06'),
(1010, 1, 1, 8, NULL, NULL, 'Teacher \"Abdullah Omar\" has completed his information.', 'Your information has been updated successfully.', NULL, 0, 0, 0, '2022-08-09 12:57:33'),
(1011, 1, 1, 8, NULL, NULL, 'Teacher \"Abdullah Omar\" has completed his information.', 'Your information has been updated successfully.', NULL, 0, 0, 0, '2022-08-09 12:57:41'),
(1012, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1537\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 17:17:22'),
(1013, 2, 0, 10, NULL, NULL, NULL, 'We would like to inform you that class number: \"1649\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 17:21:15'),
(1014, 2, 0, 10, NULL, NULL, NULL, 'We would like to inform you that class number: \"1653\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 17:21:15'),
(1015, 2, 0, 10, NULL, NULL, NULL, 'We would like to inform you that class number: \"1650\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-09 18:22:07'),
(1016, 2, 1, 12, 78, 116, 'Admin \"Mohamed Ismail\" has added a new class for the student \"Student Ttest\". <br> Pre-reading level start on Wednesday, 10 Aug , 08:30 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 10 Aug , 08:30 PM<br>Tuesday, 16 Aug , 12:31 PM<br>Tuesday, 23 Aug , 12:31 PM<br>Tuesday, 30 Aug , 12:31 PM<br>Tuesday, 6 Sep , 12:31 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for you. <br> Pre-reading level start on Wednesday, 10 Aug , 08:30 PM with the student \"Student Ttest\" according to the following schedule: <br>Wednesday, 10 Aug , 08:30 PM<br>Tuesday, 16 Aug , 12:31 PM<br>Tuesday, 23 Aug , 12:31 PM<br>Tuesday, 30 Aug , 12:31 PM<br>Tuesday, 6 Sep , 12:31 PM<br>', 'Admin \"Mohamed Ismail\" has added a new class for \"Student Ttest\". <br> Pre-reading level start on Wednesday, 10 Aug , 08:30 PM with the teacher \"Teacher test\" according to the following schedule: <br>Wednesday, 10 Aug , 08:30 PM<br>Tuesday, 16 Aug , 12:31 PM<br>Tuesday, 23 Aug , 12:31 PM<br>Tuesday, 30 Aug , 12:31 PM<br>Tuesday, 6 Sep , 12:31 PM<br>', 0, 0, 0, '2022-08-09 18:31:04'),
(1017, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1564\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-10 17:20:19'),
(1018, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1596\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-10 17:20:19'),
(1019, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1614\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-10 17:20:19'),
(1020, 2, 0, 5, NULL, NULL, NULL, 'We would like to inform you that class number: \"1619\" is missing your report submission.', NULL, 0, 0, 0, '2022-08-10 17:20:19'),
(1021, 1, 1, 5, 77, 114, '\"Samar Abbas\" requested to cancel Sun, 14 Aug 2022, 17:00\'s class\'s number : \"1519\" with the teacher \"Lamiaa Ali\" ', '\"Samar Abbas\" requested to cancel Sun, 14 Aug 2022, 17:00\'s class\'s number : \"1519\" with the teacher \"Lamiaa Ali\" ', '\"Samar Abbas\" requested to cancel Sun, 14 Aug 2022, 17:00\'s class\'s number : \"1519\" with the teacher \"Lamiaa Ali\" ', 0, 0, 0, '2022-08-10 18:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `periodicevaluations`
--

CREATE TABLE `periodicevaluations` (
  `id` int(11) NOT NULL,
  `meetingDate` timestamp NULL DEFAULT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `studentID` int(11) DEFAULT NULL,
  `teacherPerformance` varchar(255) DEFAULT NULL,
  `studentPerformance` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reportsubjects`
--

CREATE TABLE `reportsubjects` (
  `id` int(11) NOT NULL,
  `classID` int(11) DEFAULT NULL,
  `reportSubject` varchar(80) DEFAULT NULL,
  `subjectType` varchar(40) DEFAULT NULL,
  `revisedTopics` varchar(100) DEFAULT NULL,
  `grammar` varchar(100) DEFAULT NULL,
  `recentRevision` varchar(100) DEFAULT NULL,
  `oldRevision` varchar(100) DEFAULT NULL,
  `newVerses` varchar(100) DEFAULT NULL,
  `surah` varchar(100) DEFAULT NULL,
  `verse` varchar(100) DEFAULT NULL,
  `lessonProgress` varchar(100) DEFAULT NULL,
  `lessonTopic` varchar(100) DEFAULT NULL,
  `report` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:Default, 1:report added'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reportsubjects`
--

INSERT INTO `reportsubjects` (`id`, `classID`, `reportSubject`, `subjectType`, `revisedTopics`, `grammar`, `recentRevision`, `oldRevision`, `newVerses`, `surah`, `verse`, `lessonProgress`, `lessonTopic`, `report`) VALUES
(1, 240, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ?????????? ?????????????? ???????? ?????????????? ?????????????? ????????????', 1),
(5, 286, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(8, 566, 'Arabic language', '', NULL, 'None', NULL, NULL, NULL, NULL, NULL, 'None', 'None ', 1),
(9, 549, 'Quran memorization', '', NULL, NULL, 'None', 'None', 'None ', NULL, NULL, NULL, NULL, 1),
(10, 583, 'Quran memorization', '', NULL, NULL, 'None', 'None', 'None', NULL, NULL, NULL, NULL, 1),
(18, 567, 'Quran memorization', '', NULL, NULL, '???? ?????????? ?????? ?????????????? ', '???????? ??????????????', '???????? ??????????????', NULL, NULL, NULL, NULL, 1),
(19, 550, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ?????????????? ?????????? ????????????', 1),
(20, 601, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ?????????????? ?????????????? ???????????? ?????????? ????????????', 1),
(24, 661, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(25, 662, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(28, 674, 'Revision / Test', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(29, 251, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(34, 27, 'Revision / Test', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(36, 278, 'Revision / Test', '', 'Revising Izhar and Iqlab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(37, 847, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ?? ?? ??', 1),
(38, 727, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, 'Al-Anfaal', '41', NULL, 'Ablution - Reading Quran', 1),
(39, 744, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, 'Fatir', 'End of surat Fatir', NULL, 'Ablution - Reading Quran', 1),
(40, 794, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, 'Al-Hujurat', 'End of the Surah', NULL, 'Reading arabic words and Quran', 1),
(41, 777, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, 'al-Hujurat', 'End of the Surah', NULL, 'Reading Quran - Revising rules of Noon Sakinah', 1),
(43, 811, 'Arabic language', '', NULL, 'the different shapes of the letters till letter ??', NULL, NULL, NULL, NULL, NULL, 'till letter ??', 'revising the letters', 1),
(45, 856, 'Arabic language', '', NULL, '???????????? ?????? ?????? ?? ', NULL, NULL, NULL, NULL, NULL, '???????????? ?????? ?????? ?? ', '???????????? ?? ?? ?? ', 1),
(48, 507, 'Quran memorization', '', NULL, NULL, '?????????? ???????????? ????????????', '?????? ???? ?????????? ??????????????', '?????? ?????????? ???? ???????? ???????????? ', NULL, NULL, NULL, NULL, 1),
(49, 710, 'Arabic language', '', NULL, '?????? ??????????????', NULL, NULL, NULL, NULL, NULL, '?????? ??????????????', '?????? ??????????????', 1),
(50, 838, 'Arabic language', '', NULL, 'revision', NULL, NULL, NULL, NULL, NULL, 'revision', 'revision on ???????? ?????????? ????????????', 1),
(52, 820, 'Arabic language', '', NULL, 'letters ?? ??', NULL, NULL, NULL, NULL, NULL, 'letters ?? ??', 'letters ?? ??', 1),
(55, 829, 'Arabic language', '', NULL, '???????????? ?? ?? ', NULL, NULL, NULL, NULL, NULL, '???????????? ?? ?? ', '???????????? ?? ?? ', 1),
(57, 1004, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ??????????', 1),
(58, 935, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????? ', NULL, NULL, '???????? ????????????', 1),
(59, 1030, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???????? ', 1),
(60, 1039, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????????? ', NULL, NULL, '?????????? ??????????', 1),
(61, 516, 'Quran memorization', '', NULL, NULL, '???????? ?????????? ???????????? ????????????', '???????? ?????????? ??????????????', '???????? ?????????? ???????????? ???????? ?????????? ???? ???????? ????????????', NULL, NULL, NULL, NULL, 1),
(62, 593, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???????????? ???? ???????? ???????? ????????????', 1),
(63, 559, 'Quran memorization', '', NULL, NULL, '???????? ?????????????? ', '?????? ???????? ????????????', '???????? ??????????????', NULL, NULL, NULL, NULL, 1),
(64, 576, 'Quran memorization', '', NULL, NULL, '???????? ?????????? ????????????', '???????? ?????????? ???????????? ??????????', '???????? ??????????', NULL, NULL, NULL, NULL, 1),
(65, 663, 'Quran memorization', '', NULL, NULL, NULL, '???????? ?????????????? ????????????????', '???????? ??????????', NULL, NULL, NULL, NULL, 1),
(66, 1119, 'Arabic language', '', NULL, '', NULL, NULL, NULL, NULL, NULL, '??????????', '???????? ????????', 1),
(67, 1120, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1),
(68, 1013, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(69, 953, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(70, 1048, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(71, 944, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(72, 602, 'Quran memorization', '', NULL, NULL, '???????? ???????????????? ????????????????', '?????????? ?????????????? ???????? ????????????', '???????? ????????????', NULL, NULL, NULL, NULL, 1),
(73, 585, 'Quran memorization', '', NULL, NULL, '???????? ?????????? ???????????? ????????????', '???????? ?????????? ??????????????', '?????? ?? ???????? ???? ???????? ??????????????', NULL, NULL, NULL, NULL, 1),
(74, 551, 'Arabic language', '', NULL, '???? ?????? ????????', NULL, NULL, NULL, NULL, NULL, '?????????? ?????? ?????? ??????????????', '?????????? ????????????', 1),
(75, 533, 'Islamic studies', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '?????????? ????????????', 1),
(76, 719, 'Arabic language', '', NULL, '?????????? ???????????? ?????????????? ??????????????', NULL, NULL, NULL, NULL, NULL, '?????????? ???????????? ?????????????? ??????????????', '?????????? ???????????? ?????????????? ??????????????', 1),
(77, 736, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'did not attend', 1),
(78, 761, 'Quran memorization', '', NULL, NULL, '???????? ??????????????', '???????? ??????????????', '???????? ??????????????', NULL, NULL, NULL, NULL, 1),
(79, 753, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(80, 769, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '???????? ?????????? ?????????????? ??????????', '???????? ?????????? ?????????????? ??????????', NULL, '???????? ?????????? ?????????????? ??????????', 1),
(81, 786, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????? ?????????? 19 ???? ???????? ????????', '?????? ?????????? 19 ???? ???????? ????????', NULL, '?????? ?????????? 19 ???? ???????? ????????', 1),
(82, 803, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????? ?????????? 14 ???? ???????? ????????', '?????? ?????????? 14 ???? ???????? ????????', NULL, '?????? ?????????? 14 ???? ???????? ????????', 1),
(83, 848, 'Arabic language', '', NULL, '???????????? > ??', NULL, NULL, NULL, NULL, NULL, '???????????? > ??', '???????????? > ??', 1),
(84, 745, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????? ???????? 9 ???? ???????? ??????', '?????? ???????? 9 ???? ???????? ??????', NULL, '?????? ???????? 9 ???? ???????? ??????', 1),
(85, 728, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '??????????????', '???????? ?????????????? ?????? ?????????? ?????? 53', NULL, '???????? ?????????????? ?????? ?????????? ?????? 53', 1),
(86, 778, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '??????????????', '7', NULL, '?????????? ??????????', 1),
(87, 795, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '????????', '25', NULL, '???????????? ', 1),
(88, 812, 'Arabic language', '', NULL, '???????????? ?????? ?????? ???? ??', NULL, NULL, NULL, NULL, NULL, '???????????? ?????? ?????? ???? ??', '???????????? ?????? ?????? ???? ??', 1),
(89, 962, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ?????????? ', 1),
(90, 988, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????? ???????????????? ', 1),
(91, 1304, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(92, 857, 'Arabic language', '', NULL, '???????????? ???? ?????? ??', NULL, NULL, NULL, NULL, NULL, '???????????? ???? ?????? ??', '???????????? ???? ?????? ??', 1),
(93, 1022, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ?????????? ????????', 1),
(94, 919, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '???????????????? ', NULL, NULL, '???????????? ', 1),
(95, 20, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(96, 711, 'Arabic language', '', NULL, '?????????? ?????????? ????????????', NULL, NULL, NULL, NULL, NULL, '?????????? ???????????? ???????? ???????? ?????????????? ?????? ?????????? 6', '?????????? ?????????? ????????????', 1),
(97, 821, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(98, 971, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, ' ??????????????', NULL, NULL, '??????????', 1),
(99, 996, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(100, 927, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????? ????', NULL, NULL, ' ???????????? ', 1),
(101, 279, 'Quran memorization', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(102, 233, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(103, 1394, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(104, 980, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ?????????? ?????????? ', 1),
(105, 1005, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????? ???????????????? ?? ?????????????? ?????????????? ', 1),
(106, 1040, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(107, 1031, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ?????????? ????????', 1),
(108, 936, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '??????????', NULL, NULL, '???????????? ', 1),
(109, 577, 'Quran memorization', '', NULL, NULL, '???????? ?????????? ??????????????', '???????? ?????????? ???????????? ????????????', '???????? ????????', NULL, NULL, NULL, NULL, 1),
(110, 560, 'Quran memorization', '', NULL, NULL, '???????? ?????????????? ??????????????', '???????? ?????????? ??????????????', '?????? ?? ???????? ???? ???????? ???????????????? ', NULL, NULL, NULL, NULL, 1),
(111, 517, 'Quran memorization', '', NULL, NULL, ' ?????? ???? ?? ?? ?? ?? ???????? ?????????? ????????????', '???????? ???? ?????? ???? ??????', '???????? ???????????? ???????? ???? ?? ?? ??', NULL, NULL, NULL, NULL, 1),
(112, 542, 'Arabic language', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ?????????? ?????????? ?????????? ?????????? ?????? ?????????? ?????????? ???????????? ???? ???????????? ?????????????? ???????? ?????????? ', 1),
(113, 1014, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???????????? ', 1),
(114, 945, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????? ???? ', NULL, NULL, '???? ??????????', 1),
(115, 1049, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(116, 954, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, '?????? ???? ', NULL, NULL, '???????????? ', 1),
(117, 1403, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(118, 29, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(119, 552, 'Arabic language', '', NULL, '?????????? ?????????? ????????????', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(120, 720, 'Arabic language', '', NULL, '?????????? ????????????', NULL, NULL, NULL, NULL, NULL, '???????????? ?????? ?????????? ???????????? ???????????? ?????? ??????????????', '?????????? ????????????', 1),
(121, 737, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, '???????? ?????? ???????? ???? ???????? ??????????', NULL, '???????? ????????????', 1),
(122, 754, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, '???????? ?????? ?????? ???? ????????????', NULL, '???????? ????????????', 1),
(123, 762, 'Quran memorization', '', NULL, NULL, NULL, '?????? ???????? ??????????????', '?????? ???????? ??????????????', NULL, NULL, NULL, NULL, 1),
(124, 770, 'Quran memorization', '', NULL, NULL, NULL, '?????? ???????? ??????????????', '?????? ???????? ??????????????', NULL, NULL, NULL, NULL, 1),
(125, 804, 'Quran recitation', '', NULL, NULL, NULL, NULL, NULL, NULL, '???????? ????????', NULL, '???????? ????????', 1),
(126, 849, 'Arabic language', '', NULL, '???????????? ?????? ?????? ??', NULL, NULL, NULL, NULL, NULL, '???????????? ?????? ?????? ??', '???????????? ?????? ?????? ??', 1);

-- --------------------------------------------------------

--
-- Table structure for table `scheduledclasses`
--

CREATE TABLE `scheduledclasses` (
  `id` int(11) NOT NULL,
  `guardianID` int(11) DEFAULT NULL,
  `studentID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classTitle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `guests` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeZone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countForTeacher` tinyint(1) DEFAULT NULL,
  `countForStudent` tinyint(1) DEFAULT NULL,
  `payEvery` int(11) DEFAULT NULL,
  `Sun` timestamp NULL DEFAULT NULL,
  `Mon` timestamp NULL DEFAULT NULL,
  `Tue` timestamp NULL DEFAULT NULL,
  `Wed` timestamp NULL DEFAULT NULL,
  `Thu` timestamp NULL DEFAULT NULL,
  `Fri` timestamp NULL DEFAULT NULL,
  `Sat` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scheduledclasses`
--

INSERT INTO `scheduledclasses` (`id`, `guardianID`, `studentID`, `teacherID`, `subject`, `classTitle`, `duration`, `guests`, `description`, `timeZone`, `countForTeacher`, `countForStudent`, `payEvery`, `Sun`, `Mon`, `Tue`, `Wed`, `Thu`, `Fri`, `Sat`, `createdAt`) VALUES
(2, 46, 93, 5, 'Pre-reading level', 'Quran', 45, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, NULL, '2022-04-27 09:00:00', '2022-04-27 18:00:00', NULL, NULL, NULL, '2022-04-27 08:04:00'),
(16, 59, 84, 2, 'Intermediate arabic', 'Arabic', 90, '', '', 'Africa/Cairo', 1, 1, NULL, '2022-04-27 09:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 08:30:15'),
(17, 68, 44, 2, 'Tajweed basics', 'Quran', 60, '', '', 'Africa/Cairo', 1, 1, NULL, '2022-04-27 17:00:00', NULL, NULL, NULL, NULL, NULL, '2022-04-27 17:00:00', '2022-04-27 08:35:33'),
(19, 10, 15, 2, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-27 08:38:49'),
(29, 27, 48, 2, 'Advanced arabic', 'Classical Arabic', 120, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, '2022-04-28 06:00:00', NULL, NULL, '2022-04-28 09:29:04'),
(30, 48, 99, 11, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-28 11:21:18'),
(31, 49, 100, 11, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-28 11:23:15'),
(32, 54, 106, 11, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-28 11:24:44'),
(33, 65, 60, 11, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-28 11:26:02'),
(34, 65, 59, 11, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-28 11:27:15'),
(35, 55, 102, 11, 'Upper-intermediate arabic', 'Quran', 60, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, '2022-04-28 18:00:00', NULL, NULL, NULL, '2022-04-28 11:28:14'),
(36, 24, 42, 11, 'Foundation level', 'Quran', 45, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-28 14:00:00', NULL, '2022-04-28 11:29:17'),
(39, 76, 113, 11, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-08 10:20:27'),
(41, 42, 88, 5, 'Intermediate arabic', 'Arabic', 45, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, '2022-07-17 17:00:00', NULL, NULL, NULL, '2022-07-17 09:00:00', '2022-05-08 19:19:30'),
(42, 39, 82, 5, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-08 19:20:59'),
(43, 39, 83, 5, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-08 19:22:29'),
(44, 62, 70, 5, 'Pre-reading level', 'Quran', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, NULL, NULL, '2022-07-17 08:57:00', '2022-07-17 08:57:00', '2022-07-17 17:30:00', '2022-05-08 19:24:44'),
(45, 62, 72, 5, 'Foundation level', 'Quran', 30, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-08 18:00:00', '2022-05-08 19:25:06'),
(46, 68, 45, 5, 'Foundation level', 'Quran', 30, '', '', 'Africa/Cairo', 1, 1, NULL, '2022-05-08 18:30:00', NULL, NULL, NULL, NULL, NULL, '2022-05-08 18:30:00', '2022-05-08 19:26:14'),
(47, 68, 46, 5, 'Foundation level', 'Quran', 30, '', '', 'Africa/Cairo', 1, 1, NULL, '2022-05-08 19:00:00', NULL, NULL, NULL, NULL, NULL, '2022-05-08 19:00:00', '2022-05-08 19:26:45'),
(48, 11, 18, 5, 'Foundation level', 'Quran', 30, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, '2022-05-08 18:00:00', '2022-05-08 18:00:00', '2022-05-08 18:00:00', NULL, NULL, NULL, '2022-05-08 19:29:23'),
(49, 18, 29, 5, 'Foundation level', 'Quran', 60, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, NULL, '2022-05-08 17:00:00', NULL, NULL, NULL, NULL, '2022-05-08 19:30:27'),
(50, 77, 114, 5, 'Foundation level', 'Arabic', 30, '', '', 'Africa/Cairo', 1, 1, 1, '2022-07-17 15:00:00', '2022-07-17 20:00:00', NULL, NULL, NULL, NULL, NULL, '2022-05-08 19:40:18'),
(53, 15, 22, 9, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 18:44:41'),
(54, 43, 91, 9, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 18:47:15'),
(55, 19, 30, 9, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 18:51:58'),
(56, 66, 55, 9, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 18:54:49'),
(57, 30, 56, 9, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 18:57:04'),
(58, 22, 38, 9, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 18:58:18'),
(59, 78, 115, 12, NULL, NULL, NULL, NULL, NULL, 'Africa/Lagos', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-11 19:52:39'),
(60, 55, 102, 6, 'Upper-intermediate arabic', 'Arabic', 60, '', '', 'Africa/Cairo', 1, 1, NULL, NULL, NULL, '2022-05-12 13:30:00', '2022-05-12 13:30:00', NULL, NULL, NULL, '2022-05-12 09:52:13'),
(61, 30, 52, 9, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 11:32:18'),
(65, 70, 36, 5, 'Pre-reading level', 'Arabic', 30, '', '', 'Africa/Cairo', 1, 1, 2, '2022-07-17 15:30:00', '2022-07-17 16:00:00', NULL, '2022-07-17 15:00:00', NULL, NULL, '2022-07-17 16:00:00', '2022-07-17 08:35:38'),
(66, 39, 82, 5, 'Tajweed basics', 'Quran', 45, '', '', 'Africa/Cairo', 1, 1, 1, '2022-07-17 16:00:00', '2022-07-17 16:30:00', '2022-07-17 18:30:00', '2022-07-17 16:30:00', NULL, NULL, '2022-07-17 16:00:00', '2022-07-17 08:51:04'),
(67, 39, 83, 5, 'Tajweed basics', 'Quran', 45, '', '', 'Africa/Cairo', 1, 1, 1, '2022-07-17 16:45:00', '2022-07-17 17:15:00', '2022-07-17 19:15:00', '2022-07-17 17:15:00', NULL, NULL, '2022-07-17 16:45:00', '2022-07-17 08:55:01'),
(70, 39, 83, 10, 'Khatmah program', 'ss', 60, 'ss', 'asasas', 'Africa/Cairo', 1, 1, 1, NULL, NULL, '2022-07-18 17:46:00', NULL, '2022-07-18 17:44:00', NULL, NULL, '2022-07-18 17:43:55'),
(73, 78, 116, 12, NULL, NULL, NULL, NULL, NULL, 'Africa/Cairo', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-20 10:05:40'),
(74, 78, 116, 12, 'Pre-reading level', 'dsa', 30, '', '', 'Africa/Cairo', 1, 1, 1, NULL, NULL, '2022-08-09 10:31:00', NULL, NULL, NULL, NULL, '2022-08-09 18:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `guardianID` int(11) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `attendedHours` int(11) DEFAULT 0,
  `email` varchar(100) NOT NULL,
  `birthday` date DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `timeZone` varchar(100) DEFAULT NULL,
  `initialAssessment` varchar(255) DEFAULT NULL,
  `startingDate` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1: Active 2: Inactive 3:Vacation',
  `token` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `guardianID`, `picture`, `name`, `attendedHours`, `email`, `birthday`, `language`, `phone`, `address`, `timeZone`, `initialAssessment`, `startingDate`, `status`, `token`, `createdAt`) VALUES
(5, 3, NULL, 'Aatif Hasan', 0, 'faheem.hasan@gmail.com', '2022-04-13', 'English', '+13473318323', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 11:32:15'),
(6, 3, NULL, 'Ealhan Hasan', 0, ' faheem.hasan@gmail.com', '2022-04-13', 'English', '+13473318323', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 11:34:32'),
(7, 4, NULL, 'Abdul-Rahaman Ismail', 0, 'khomol@hotmail.com', '2022-04-13', 'English', '+447832345464', 'khomol@hotmail.com', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 11:38:16'),
(8, 5, NULL, 'Abdullah Waleed', 0, 'hellowaleed@hotmail.com', '2022-04-13', 'English', '+971507635105', '', 'Asia/Dubai', 'null', NULL, 1, NULL, '2022-04-13 11:40:52'),
(9, 6, NULL, 'Aiza Khan', 0, 'sehrishimdad@hotmail.com', '2022-04-13', 'English', '+447469944950', '', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 11:42:36'),
(10, 6, NULL, 'Zayyan Khan', 0, 'sehrishimdad@hotmail.com', '2022-04-13', 'English', '+447469944950', '', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 11:43:11'),
(11, 7, NULL, 'Ala Mostafavi', 0, 'smostafavi@gmail.com', '2022-04-13', 'English', '+15106843068', '', 'America/New_York', NULL, NULL, 2, NULL, '2022-04-13 11:47:07'),
(12, 7, NULL, 'Lena Mostafavi', 0, ' smostafavi@gmail.com', '2022-04-13', 'English', '+15106843068', '', 'America/New_York', 'null', NULL, 2, NULL, '2022-04-13 11:47:33'),
(13, 8, NULL, 'Alejandro Beck-Sosa', 0, 'alejandrobecksosa@gmail.com	', '2022-04-13', 'English', '+1 703 268 6117', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 11:55:28'),
(14, 9, NULL, 'Ali Rizvi	', 0, ' s_rizvi@sbcglobal.net', '2022-04-13', 'English', ' 4056309536', 'United States', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 12:01:11'),
(15, 10, NULL, 'Ammon Winder', 0, ' askchairmenkapow@gmail.com', '2022-04-13', 'English', '+1804 914 0739', 'United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 12:05:03'),
(16, 60, NULL, 'Faraz Nawaz', 0, 'Ameenlala@yahoo.com', '2022-04-13', 'English', '+91 60056 06780', 'Afghanistan', 'Asia/Kolkata', 'null', NULL, 1, NULL, '2022-04-13 12:09:22'),
(17, 60, NULL, 'Fawaz Nawaz', 0, 'Ameenlala@yahoo.com', '2022-04-12', 'English', '+91 60056 06780', 'Afghanistan', 'Asia/Kolkata', 'null', NULL, 1, NULL, '2022-04-13 12:10:41'),
(18, 11, NULL, 'Asmaa yamani', 0, ' anisa@alumni.stanford.edu', '2009-01-01', 'English', '+1 626 782 3083', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:16:16'),
(19, 12, NULL, 'Anu	 KMT', 0, 'Anukemet@hotmail.com', '2022-04-13', 'English', '+13018065122', 'United States', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 12:19:12'),
(20, 13, NULL, 'Asad   Sultan', 0, 'zwamiq@gmail.com', '2007-09-25', 'English', '+16102097146', 'United States', 'America/New_York', NULL, NULL, 2, NULL, '2022-04-13 12:21:34'),
(21, 14, NULL, 'Awais  Khan', 0, 'mrawaisalikhan2006@gmail.com', '2022-04-13', 'English', '+4407365063606', 'United Kingdom', 'Europe/London', NULL, NULL, 2, NULL, '2022-04-13 12:23:51'),
(22, 15, NULL, 'Ayaan Ahmed', 0, 'sumzali2003@yahoo.com', '2007-07-25', 'English', '+14845881768', 'United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 12:26:20'),
(23, 16, NULL, 'Ayaan Malik', 0, ' nyapt@hotmail.com', '2022-04-13', 'English', '+12149846066', 'United States', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 12:28:15'),
(24, 17, NULL, 'Ayla Mostafa', 0, 'mkabadaya@gmail.com', '2022-04-13', 'English', '+19253214790', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:30:42'),
(25, 17, NULL, 'Tulay Mostafa', 0, 'mkabadaya@gmail.com', '2022-04-13', 'English', '+19253214790', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:31:15'),
(26, 17, NULL, 'Laila Mostafa', 0, 'mkabadaya@gmail.com', '2022-04-13', 'English', '+19253214790', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:31:36'),
(27, 72, NULL, 'Zoya Nabeel', 0, 'nabeelhk@gmail.com', '2022-04-13', 'English', '+15126329990', '', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 12:33:08'),
(28, 72, NULL, 'Zorayz Nabeel', 0, ' nabeelhk@gmail.com', '2022-04-13', 'English', '+15126329990', '', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 12:33:30'),
(29, 18, NULL, 'Barra Ibrahim', 0, ' bibrahim914@gmail.com', '1997-09-14', 'English', '2679180012', 'United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 12:34:43'),
(30, 19, NULL, 'Celine E', 0, 'wai2894@gmail.com', '2016-10-28', 'English', ' 2672315867', ' United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 12:38:00'),
(31, 71, NULL, 'Zohan Iftekhar', 0, 'firdoszohan@yahoo.com	', '2022-04-13', 'English', '+14846866841', '', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 12:38:51'),
(32, 20, NULL, 'Dash Hamza', 0, ' ayuabdullah@gmail.com', '2022-04-13', 'English', '+60173453814', 'Singapore', 'Asia/Singapore', 'null', NULL, 1, NULL, '2022-04-13 12:39:54'),
(33, 71, NULL, 'Aayaan Rizwan', 0, 'rinzyyy@gmail.com', '2022-04-13', 'English', '+17326924131', '', 'America/Chicago', 'null', NULL, 3, NULL, '2022-04-13 12:40:24'),
(34, 71, NULL, 'Zain Rizwan', 0, ' rinzyyy@gmail.com', '2022-04-13', 'English', '+17326924131', '', 'America/Chicago', 'null', NULL, 3, NULL, '2022-04-13 12:41:24'),
(35, 21, NULL, 'Noman  Haider', 0, 'haider.syedn@gmail.com', '2022-04-13', 'English', '+1 (901) 832-8220', 'United States', 'America/Chicago', NULL, NULL, 2, NULL, '2022-04-13 12:43:30'),
(36, 70, NULL, 'Zahra Markwith', 0, 'rand_abbas@yahoo.ca', '2022-04-13', 'English', '+15593609357', '', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:45:14'),
(37, 22, NULL, 'Eesa Ahmed', 0, 'asmauddin@gmail.com', '2022-04-13', 'English', '+13054849926', 'United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 12:45:41'),
(38, 22, NULL, 'Zaynab Ahmed', 0, ' asmauddin@gmail.com', '2022-04-13', 'English', '+13054849926', 'United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 12:46:42'),
(39, 69, NULL, 'Yaseen Farag', 0, 'sarah.khorshed@gmail.com', '2011-02-16', 'English', '+13106581093', '', 'America/Los_Angeles', 'null', NULL, 3, NULL, '2022-04-13 12:48:39'),
(40, 23, NULL, 'Danial Farooq', 0, 'danialf64@gmail.com', '2022-04-13', 'English', '+44 7576 725527', 'United Kingdom', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 12:49:53'),
(41, 23, NULL, 'Fatimah Farooq', 0, 'danialf64@gmail.com', '2022-04-13', 'English', '+44 7576 725527', 'United Kingdom', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 12:51:11'),
(42, 24, NULL, 'Fatema Ibrahim', 0, ' liatris318@gmail.com', '1995-11-03', 'English', '484-358-9612', 'United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 12:54:05'),
(43, 25, NULL, 'Fatima Kaukab', 0, 'ssomalya@gmail.com', '2014-12-30', 'English', '856-625-6363', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:56:19'),
(44, 68, NULL, 'Waseem Butt', 0, 'suuper7@gmail.com', '2022-04-13', 'English', '+19513128633', '', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:57:09'),
(45, 68, NULL, 'Farah Waseem', 0, 'suuper7@gmail.com', '2022-04-13', 'English', '+19513128633', '', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:58:25'),
(46, 68, NULL, 'Danial Waseem', 0, 'suuper7@gmail.com', '2022-04-13', 'English', '+19513128633', '', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 12:58:41'),
(47, 26, NULL, 'Fouad  Freude', 0, 'mariofreude75@gmail.com', '2022-04-13', 'English', '+525545679357', 'United States', 'America/New_York', NULL, NULL, 2, NULL, '2022-04-13 12:59:12'),
(48, 27, NULL, 'Gretchen Head', 0, 'gretchen.head@yale-nus.edu.sg', '2022-04-13', 'English', '+6590262443', ' Singapore', 'Asia/Singapore', 'null', NULL, 1, NULL, '2022-04-13 13:00:55'),
(49, 28, NULL, 'Haaris Sattar', 0, 'drtariqsattar@gmail.com', '2022-04-13', 'English', ' +14053145072', 'United States', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 13:07:51'),
(50, 29, NULL, 'Hadiya Majid', 0, 'Khanmajid246@yahoo.co.Uk', '2022-04-13', 'English', '0447808857620', 'United Kingdom', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 13:11:08'),
(51, 67, NULL, 'Tasneef Mahammad', 0, 'tasneefm@gmail.com', '2022-04-13', 'English', '+447896273337', '', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 13:11:59'),
(52, 30, NULL, 'Marya Haroon', 0, 'Moghul@gmail.com', '2022-04-13', 'English', '+15135687241', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:12:57'),
(53, 30, NULL, 'Reiza Haroon', 0, ' Moghul@gmail.com', '2022-04-13', 'English', '+15135687241', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:13:22'),
(54, 30, NULL, 'Haroon Moghul', 0, ' Moghul@gmail.com', '2022-04-13', 'English', '+15135687241', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:14:13'),
(55, 66, NULL, 'Tameema Mostafa', 0, 'habib.mostafa@gmail.com', '2022-04-13', 'English', '+15853548115', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 13:14:27'),
(56, 30, NULL, 'Safa Haroon', 0, ' Moghul@gmail.com', '2022-04-13', 'English', '+15135687241', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:14:42'),
(57, 31, NULL, 'Hina Guezmir', 0, ' lymphnode@live.com', '2022-04-13', 'English', '+15044447832', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:17:46'),
(58, 31, NULL, 'Marwa Noman', 0, ' lymphnode@live.com', '2022-04-13', 'English', '+15044447832', ' United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:18:43'),
(59, 65, NULL, 'Ibrahim Ali', 0, 'homayra@gmail.com', '2022-04-13', 'English', '+1571 594 3298', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 13:18:49'),
(60, 65, NULL, 'Ayah Nur', 0, ' homayra@gmail.com', '2022-04-13', 'English', '+1571 594 3298', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 13:19:28'),
(61, 32, NULL, 'Huda Almarashi', 0, ' huda.almarashi@gmail.com', '2022-04-13', 'English', ' +19519666126', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:20:53'),
(62, 32, NULL, 'Kareem Jaffer', 0, 'huda.almarashi@gmail.com', '2022-04-13', 'English', ' +19519666126', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:21:43'),
(63, 64, NULL, 'Sohail Khan', 0, 'sakhan31@hotmail.com', '2022-04-13', 'English', '+4407745 957 575', '', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 13:21:54'),
(64, 33, NULL, 'Ibrahiem Wasif', 0, 'wasifkhan786@hotmail.com', '2022-04-13', 'English', ' +44 7930 363826', ' London, United Kingdom', 'Europe/London', 'null', NULL, 3, NULL, '2022-04-13 13:23:55'),
(65, 33, NULL, 'Essa Wasif', 0, 'wasifkhan786@hotmail.com', '2022-04-13', 'English', ' +44 7930 363826', ' London, United Kingdom', 'Europe/London', 'null', NULL, 3, NULL, '2022-04-13 13:24:32'),
(66, 63, NULL, 'Soaad Elbahwati', 0, 'selbahwati@gmail.com', '2022-04-13', 'English', '+14847921276???', '', 'America/New_York', NULL, NULL, 2, NULL, '2022-04-13 13:25:47'),
(67, 34, NULL, 'Ilyas A', 0, 'zineb3@gmail.com', '2022-04-13', 'English', ' 410765932151', 'Adliswil, Switzerland', 'Europe/Istanbul', 'null', NULL, 1, NULL, '2022-04-13 13:27:18'),
(68, 34, NULL, 'Zayd A', 0, ' zineb3@gmail.com', '2022-04-13', 'English', ' 410765932151', 'Adliswil, Switzerland', 'Europe/Istanbul', 'null', NULL, 1, NULL, '2022-04-13 13:27:44'),
(69, 35, NULL, 'Jahan Nadeem', 0, 'sofianalikhan@gmail.com', '2022-04-13', 'English', '+12892595089', 'Canada', 'Canada/Eastern', 'null', NULL, 1, NULL, '2022-04-13 13:30:58'),
(70, 62, NULL, 'Sinan Ahmed', 0, 'dahlia_jaffer@yahoo.com', '2022-04-13', 'English', '+19515006084', '', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:31:00'),
(71, 35, NULL, 'Isa Nadeem', 0, 'sofianalikhan@gmail.com', '2022-04-13', 'English', '+12892595089', 'Canada', 'Canada/Eastern', 'null', NULL, 1, NULL, '2022-04-13 13:31:30'),
(72, 62, NULL, 'Sundus Ahmed', 0, 'dahlia_jaffer@yahoo.com', '2022-04-13', 'English', '+19515006084', '', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:31:48'),
(73, 36, NULL, 'Jake Brancatella', 0, 'jakebrancatella128@gmail.com', '1991-01-28', 'English', '+12013106534', ' United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 13:35:01'),
(74, 61, NULL, 'Sharif Randhawa', 0, 'msharif124@gmail.com', '2022-04-13', 'English', '+16073828329', '', 'America/New_York', 'null', NULL, 3, NULL, '2022-04-13 13:36:13'),
(75, 37, NULL, 'Amira Jones', 0, ' Akenyele@gmail.com', '2022-04-13', 'English', '9375033135', 'United States', 'America/New_York', 'null', NULL, 3, NULL, '2022-04-13 13:36:40'),
(76, 37, NULL, 'Omar Ali', 0, 'Akenyele@gmail.com', '2022-04-13', 'English', '9375033135', 'United States', 'America/New_York', 'null', NULL, 3, NULL, '2022-04-13 13:36:58'),
(77, 37, NULL, 'Jebril Ali', 0, 'Akenyele@gmail.com', '2022-04-13', 'English', '9375033135', 'United States', 'America/New_York', 'null', NULL, 3, NULL, '2022-04-13 13:37:20'),
(78, 60, NULL, 'Hafeey Shah', 0, 'Taniamun654@gmail.com', '2022-04-13', 'English', '+15736736309	', '', 'America/North_Dakota/Center', 'null', NULL, 1, NULL, '2022-04-13 13:38:20'),
(79, 38, NULL, 'Kamal Southall', 0, 'Southallgroup@gmail.com', '2022-04-13', 'English', '+15135466267', 'United States', 'America/Chicago', 'null', NULL, 3, NULL, '2022-04-13 13:39:06'),
(80, 60, NULL, 'Zayyan Shah', 0, ' Taniamun654@gmail.com', '2022-04-13', 'English', '+15736736309	', '', 'America/North_Dakota/Center', 'null', NULL, 1, NULL, '2022-04-13 13:39:53'),
(81, 60, NULL, 'Mohamed Amin', 0, ' Taniamun654@gmail.com', '2022-04-13', 'English', '+15736736309	', '', 'Asia/Kolkata', 'null', NULL, 2, NULL, '2022-04-13 13:42:16'),
(82, 39, NULL, 'Leya Qureshi', 0, 'drjamshed@gmail.com', '2022-04-13', 'English', '+12025960902', ' Illinois, United States', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 13:42:38'),
(83, 39, NULL, 'Manahil Qureshi', 0, ' drjamshed@gmail.com', '2022-04-13', 'English', '+12025960902', ' Illinois, United States', 'America/Chicago', 'null', NULL, 1, NULL, '2022-04-13 13:43:03'),
(84, 59, NULL, 'Sadiuddin Saifuddin', 0, 'sadiuddin@hotmail.com', '2022-04-13', 'English', '+61424852462', '', 'Australia/Sydney', 'null', NULL, 1, NULL, '2022-04-13 13:44:40'),
(85, 58, NULL, 'Saad Mohamed', 0, 'fahadasad1@gmail.com', '2022-04-13', 'English', '+13099897155', 'fahadasad1@gmail.com', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 13:47:48'),
(86, 40, NULL, 'Mahdi  Jamshaid', 0, 'jimshaid@hotmail.com', '2007-05-25', 'English', '+923361448590', 'Pakistan', 'Asia/Karachi', NULL, NULL, 2, NULL, '2022-04-13 13:48:33'),
(87, 41, NULL, 'Marwan Ahmed', 0, 'mariamhamdyz@gmail.com', '2013-04-20', 'English', '+1 (408) 439-9432', ' United States', 'America/Los_Angeles', 'null', NULL, 3, NULL, '2022-04-13 13:51:16'),
(88, 42, NULL, 'Mia Mohamed', 0, 'hams83@gmail.com', '2022-04-13', 'Arabic', '+20165516987', 'Cairo Egypt', 'Africa/Cairo', 'null', NULL, 1, NULL, '2022-04-13 13:53:04'),
(89, 43, NULL, 'Omar Mir', 0, 'mariajqureshi@yahoo.com', '2022-04-13', 'English', '+19095681412', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:54:53'),
(90, 43, NULL, 'Maria Mir', 0, 'mariajqureshi@yahoo.com', '2022-04-13', 'English', '+19095681412', 'United States', 'America/Los_Angeles', 'null', NULL, 2, NULL, '2022-04-13 13:55:21'),
(91, 43, NULL, 'Madinah Mir', 0, 'mariajqureshi@yahoo.com', '2022-04-13', 'English', '+19095681412', 'United States', 'America/Los_Angeles', 'null', NULL, 1, NULL, '2022-04-13 13:55:46'),
(92, 44, NULL, 'Zehraa Hassan', 0, 'zehrapaa@gmail.com', '2022-04-13', 'English', '+19173259642', 'United States', 'America/New_York', 'null', NULL, 3, NULL, '2022-04-13 13:57:22'),
(93, 46, NULL, 'Nazia Begum', 0, 'Naz__17__@hotmail.com', '2022-04-13', 'English', '+447972837510', 'United Kingdom', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 14:00:06'),
(94, 57, NULL, 'Rumi Randy', 0, 'ayesha_mattu@yahoo.com', '2022-04-13', 'English', '+14157224420', '', 'America/Anchorage', NULL, NULL, 2, NULL, '2022-04-13 14:01:04'),
(95, 45, NULL, 'Muhammad  Allan', 0, ' zakiyyahjones1@gmail.com', '2022-04-13', 'English', '+12027469840', 'United States', 'America/New_York', NULL, NULL, 2, NULL, '2022-04-13 14:01:48'),
(96, 47, NULL, 'Nick Orzech', 0, 'nickorzech1@gmail.com', '2022-04-13', 'English', '+15129192529', 'United States', 'America/North_Dakota/Center', 'null', NULL, 1, NULL, '2022-04-13 14:07:25'),
(97, 56, NULL, 'Rayyaan Mohiuddin', 0, 'sanam805@gmail.com', '2022-04-13', 'English', '+17175801211', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 14:08:26'),
(98, 56, NULL, 'Inaya Mohiuddin', 0, 'sanam805@gmail.com', '2022-04-13', 'English', '+17175801211', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 14:09:05'),
(99, 48, NULL, 'Noah Ali', 0, 'drsaniajamshed@hmail.com', '2016-10-31', 'English', ' +44 7794 202125', 'United Kingdom', 'Europe/London', 'null', NULL, 1, NULL, '2022-04-13 14:10:18'),
(100, 49, NULL, 'Nourane Ismail', 0, 'nouism97@hotmail.fr', '1997-09-28', 'English', '+33634627301', 'France', 'Europe/Paris', 'null', NULL, 1, NULL, '2022-04-13 14:12:19'),
(101, 50, NULL, 'Nuh Mecci', 0, 'worldbusinessstudios@gmail.com', '2022-04-13', 'English', ' +13143097127', 'United States', 'America/Chicago', NULL, NULL, 2, NULL, '2022-04-13 14:13:56'),
(102, 55, NULL, 'Rawan Ibrahim', 0, 'rawan.ibrahim001@gmail.com', '1994-10-25', 'English', '+12676943829', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 14:14:22'),
(103, 51, NULL, 'Omar  Farooq', 0, 'omar@eotd.xyz', '1990-08-13', 'English', '+16469208978', 'United States', 'America/Los_Angeles', NULL, NULL, 2, NULL, '2022-04-13 14:15:37'),
(104, 55, NULL, 'Noah Mohamed', 0, 'rawan.ibrahim001@gmail.com', '2022-04-13', 'English', '+12676943829', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 14:15:49'),
(105, 52, NULL, 'Omar Hamoda', 0, 'omarrocks922@gmail.com', '2022-04-13', 'English', '+1 (857) 269-6915', 'United States', 'America/Chicago', 'null', NULL, 3, NULL, '2022-04-13 14:17:12'),
(106, 54, NULL, 'Rahma Anjum', 0, 'rahmaanjum@gmail.com', '2022-04-13', 'English', '+1 4198198796', '', 'America/New_York', 'null', NULL, 1, NULL, '2022-04-13 14:19:48'),
(107, 54, NULL, 'Ahmed Anjum', 0, 'oganjum@gmail.com', '2022-04-13', 'English', '+1 4198198796', '', 'America/New_York', 'null', NULL, 2, NULL, '2022-04-13 14:20:08'),
(108, 53, NULL, 'Hadi Mahmood', 0, 'omar3000@gmail.com', '2022-04-13', 'English', '+14808622211', '', 'Asia/Karachi', 'null', NULL, 1, NULL, '2022-04-13 14:22:54'),
(109, 53, NULL, 'Ibrahim Mahmood', 0, ' omar3000@gmail.com', '2022-04-13', 'English', '+14808622211', '', 'Asia/Karachi', 'null', NULL, 1, NULL, '2022-04-13 14:23:15'),
(110, 73, NULL, 'Bilal Ansari', 0, 'bilal.w.ansari@gmail.com', '2022-04-14', 'English', '+18609678250', 'New York', 'America/New_York', NULL, NULL, 2, NULL, '2022-04-14 10:08:31'),
(111, 74, NULL, 'Deen Ali', 0, 'deen5719@outlook.com', '2022-04-14', 'English', '+447599652624', 'London, United Kingdom', 'Europe/London', NULL, NULL, 2, NULL, '2022-04-14 10:15:08'),
(113, 76, NULL, 'Nadia Begum', 0, 'nadiabegum1999@icloud.com', '1999-03-09', 'English', '+44 7564 919001', ' Sheffield, South Yorkshire, United Kingdom', 'Europe/London', 'null', NULL, 1, NULL, '2022-05-08 10:18:56'),
(114, 77, NULL, 'Jena A', 0, 'sabbas011@gmail.com', '2014-01-16', 'English', '+19143464555', 'Harrison, New York, United States', 'America/New_York', 'null', NULL, 1, NULL, '2022-05-08 19:37:46'),
(116, 78, NULL, 'Student Ttest', 60, 's@gmail.com', '2022-05-15', 'Arabiic', '999292002', 'test', 'Africa/Algiers', 'null', NULL, 1, NULL, '2022-05-15 17:22:39'),
(117, 80, NULL, 'mm msss', 0, 'm@gmail.com', '2022-06-15', 'english', '058976', 'egypt', 'Africa/Cairo', NULL, NULL, 2, NULL, '2022-06-20 10:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `teacherinvoices`
--

CREATE TABLE `teacherinvoices` (
  `id` int(11) NOT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `invoiceNumber` int(11) DEFAULT NULL,
  `cancelationReq` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `paidHours` int(11) DEFAULT NULL,
  `paymentMethod` varchar(20) DEFAULT NULL,
  `totalAmountPaid` int(11) DEFAULT NULL,
  `paymentDate` timestamp NULL DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1:Piad 2:Unpaid',
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `activatedAt` timestamp(1) NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacherinvoices`
--

INSERT INTO `teacherinvoices` (`id`, `teacherID`, `invoiceNumber`, `cancelationReq`, `bonus`, `paidHours`, `paymentMethod`, `totalAmountPaid`, `paymentDate`, `paid`, `active`, `activatedAt`, `createdAt`) VALUES
(1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-27 07:47:45'),
(2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-27 07:49:12'),
(3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-27 08:04:00'),
(4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-27 08:06:10'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, '2022-05-07 19:14:47.5', '2022-04-27 08:08:10'),
(6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-27 15:17:42'),
(7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-27 15:24:29'),
(8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-27 15:28:29'),
(9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, '2022-05-01 03:35:28.2', '2022-04-27 15:34:58'),
(10, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-28 11:21:18'),
(11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-04-28 11:23:15'),
(12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-05-01 03:35:28'),
(13, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, '2022-05-07 19:14:47');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `hours` int(11) DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `language` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `timeZone` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `classLink` varchar(100) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `beneficiaryCountry` varchar(10) DEFAULT NULL,
  `accountCurrency` varchar(5) DEFAULT NULL,
  `swiftCode` varchar(100) DEFAULT NULL,
  `branchName` varchar(80) DEFAULT NULL,
  `bankName` varchar(80) DEFAULT NULL,
  `iban` varchar(80) DEFAULT NULL,
  `accountNumber` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1: Active 2: Inactive 3:Vacation',
  `token` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `picture`, `name`, `hours`, `birthday`, `email`, `password`, `language`, `phone`, `address`, `timeZone`, `description`, `classLink`, `bonus`, `paymentMethod`, `beneficiaryCountry`, `accountCurrency`, `swiftCode`, `branchName`, `bankName`, `iban`, `accountNumber`, `status`, `token`, `createdAt`) VALUES
(2, 'https://res.cloudinary.com/djhd6qba5/image/upload/v1649731751/Waraqa/y1pw6uctzlk3uyhzxyc7.png', 'Mohamed Ismail', 0, '1994-10-30', 'mo7amed2225@gmail.com', '$2a$10$6BlCUjeAzAQs2Z3k2virUu.0BhNlisM.GDWsLRhVqZnzXZGjQpRC.', 'English', '01030663326', 'Alexandria, Egypt', 'Africa/Cairo', 'test1', 'https://us04web.zoom.us/j/7874054018?pwd=UDJzdFpZVWlUYWxGa2ZmeDE3WHp0UT09', 0, 'Bank account', 'Egypt', 'EGP', '0', '0', 'United Bank -Egypt', '0', 0, 1, NULL, NULL),
(3, NULL, 'Mohamed Foda', 0, '2022-04-13', 'fodafoda34@gmail.com', '$2a$10$mCmkgwSlrU447vhmARSlluVdu93R03YMn25WQJOlUWvV4M30v.rbW', 'null', '01011539544', 'Nasr City, Cairo', 'Africa/Cairo', 'null', 'null', NULL, 'Bank Account', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(4, NULL, 'Asmaa Ouda', 0, '2022-04-13', 'xtra6006@gmail.com', '$2a$10$MTGmk7F7ON6bLhL.AdTVs.lKhu8IqE7rPM4n4PPeXdOD54/z2dosG', 'null', '01100882630', '22222222', 'Africa/Cairo', 'description', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(5, NULL, 'Lamiaa Ali', 0, '1997-09-14', 'lamiaaali1997@gmail.com', '$2a$10$pns4Ctdq4c09QrGqQS5Id..hR/ER/AcID7lAp9hSLwfnaxUI4gJbi', 'null', '01203211908', 'Alexandria, Egypt', 'Africa/Cairo', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(6, NULL, 'Ahmed Ismail', 0, '1991-02-26', 'a7med0122@gmail.com', '$2a$10$Yw7TMQOHMjR8zDhA4M/HW.K0yvRQ.6TkOr64kHiw01D.CMZUHIKXK', 'null', '01011209655', 'Alex', 'Africa/Cairo', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, 6861855, NULL),
(7, NULL, 'Mostafa Emad', 0, '2022-04-13', 'mostafa3235644@gmail.com', '$2a$10$Xl7VQCd5U.rDVJ1qtKez3ey8LMkp4SpgNfayELNdUv4OHrYkh6KPK', 'null', '01124583499', 'Egypt, Dakahlia, Mansoura city ', 'Africa/Cairo', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(8, NULL, 'Abdullah Omar', 0, '2022-04-15', 'abdullahomar2011@gmail.com', '$2a$10$4DjKmWW.na8zcHk751iHGO7cuEGLXwFHWnqaGXzvYOF.zHoaWkTfm', 'Arabic, English', '01008214371', 'Anfast_Allahun road', 'Africa/Cairo', 'Description', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(9, NULL, 'Samah Khalifa', 0, '2022-04-16', 'samahkhalifa@hotmail.com', '$2a$10$OUJ.jcmYAgtBdESR3.lOaO5ESVY8fxonzt8k1A8jYFTN2acCgUJXm', 'null', '01551521684', '???????????? - ???????????? - ?? ???????? ??????????????????', 'Africa/Cairo', 'null', '  https://us02web.zoom.us/j/9243437874?pwd=M0VVVzh5QkdITWw3NzBTSHJraG1TQT09  ', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(10, NULL, 'Asmaa Ibrahem', 0, '2022-04-19', 'asmaaibrahem449@gmail.com', '$2a$10$NDY7TA/DPmxOejGgAkvk0usRD8qJHF3VQ2Xfmm8uHWzxwg9.SnO42', 'null', '01225854156', 'PortSaid, Egypt', 'Africa/Cairo', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(11, NULL, 'Fatema Elshafiey', 0, '2022-04-19', 'fatemaelshafiey@yahoo.com', '$2a$10$OG/IeKxgYZ4z1KiTiTAA4.xIqoSI8A.cdTdjn8pD7gLo7P3CGHMQS', 'null', '01010074049', 'Al-merag city - Al-esraa street', 'Africa/Cairo', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, NULL, NULL),
(12, NULL, 'Teacher test', 60, '2022-05-09', 't@gmail.com', '$2a$10$ESiDodMK3rW5MkRH0a7Ip.IgfhVIFVOuMYLOHEUesSkpFnVOBZy1q', 'null', '9292920', 'test', 'Africa/Lagos', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 1, 2473471, NULL),
(17, NULL, 'hossa@gmail.com hossa@gmail.com', 0, NULL, 'hossam@gmail.com', '$2a$10$fWODFjUHyDtEtweatjc3DOSXbZVFp1Jt1LlikpzW2IY5hK69rSdXq', NULL, '01072222', 'hossam@gmail.com', 'Africa/Cairo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `waitlist`
--

CREATE TABLE `waitlist` (
  `id` int(11) NOT NULL,
  `responsible` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `contactMethod` varchar(20) DEFAULT NULL,
  `contactInfo` varchar(20) DEFAULT NULL,
  `contactDate` timestamp NULL DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `waitlist`
--

INSERT INTO `waitlist` (`id`, `responsible`, `name`, `contactMethod`, `contactInfo`, `contactDate`, `notes`, `createdAt`) VALUES
(1, 'Mohamed Ismail', 'Roderick McClary El', 'Messenger', '', '2022-04-14 12:18:00', '', '2022-04-14 10:18:48'),
(4, 'adsds', 'adsdas', 'asddsa', 'ads', '2022-08-10 11:37:00', '', '2022-08-10 11:37:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ctrel` (`teacherID`),
  ADD KEY `csrel` (`studentID`),
  ADD KEY `icsrel` (`invoiceID`),
  ADD KEY `screl` (`scheduleID`),
  ADD KEY `gcrel` (`guardianID`);

--
-- Indexes for table `classesreq`
--
ALTER TABLE `classesreq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trrel` (`teacherID`),
  ADD KEY `srrel` (`studentID`),
  ADD KEY `ccrrel` (`classID`),
  ADD KEY `gcrrel` (`guardianID`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guardianinvoices`
--
ALTER TABLE `guardianinvoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `girel` (`guardianID`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gnrel` (`guardianID`),
  ADD KEY `tnrel` (`teacherID`),
  ADD KEY `snrel` (`studentID`);

--
-- Indexes for table `periodicevaluations`
--
ALTER TABLE `periodicevaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `esrel` (`teacherID`),
  ADD KEY `essrel` (`studentID`);

--
-- Indexes for table `reportsubjects`
--
ALTER TABLE `reportsubjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crrel` (`classID`);

--
-- Indexes for table `scheduledclasses`
--
ALTER TABLE `scheduledclasses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gssrel` (`guardianID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gsrel` (`guardianID`);

--
-- Indexes for table `teacherinvoices`
--
ALTER TABLE `teacherinvoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tirel` (`teacherID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waitlist`
--
ALTER TABLE `waitlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1719;

--
-- AUTO_INCREMENT for table `classesreq`
--
ALTER TABLE `classesreq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardianinvoices`
--
ALTER TABLE `guardianinvoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1022;

--
-- AUTO_INCREMENT for table `periodicevaluations`
--
ALTER TABLE `periodicevaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reportsubjects`
--
ALTER TABLE `reportsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `scheduledclasses`
--
ALTER TABLE `scheduledclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `teacherinvoices`
--
ALTER TABLE `teacherinvoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `waitlist`
--
ALTER TABLE `waitlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `csrel` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `ctrel` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `gcrel` FOREIGN KEY (`guardianID`) REFERENCES `guardians` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `icsrel` FOREIGN KEY (`invoiceID`) REFERENCES `guardianinvoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `screl` FOREIGN KEY (`scheduleID`) REFERENCES `scheduledclasses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `classesreq`
--
ALTER TABLE `classesreq`
  ADD CONSTRAINT `ccrrel` FOREIGN KEY (`classID`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gcrrel` FOREIGN KEY (`guardianID`) REFERENCES `guardians` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `srrel` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trrel` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guardianinvoices`
--
ALTER TABLE `guardianinvoices`
  ADD CONSTRAINT `girel` FOREIGN KEY (`guardianID`) REFERENCES `guardians` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `gnrel` FOREIGN KEY (`guardianID`) REFERENCES `guardians` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `snrel` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tnrel` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `periodicevaluations`
--
ALTER TABLE `periodicevaluations`
  ADD CONSTRAINT `esrel` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `essrel` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reportsubjects`
--
ALTER TABLE `reportsubjects`
  ADD CONSTRAINT `crrel` FOREIGN KEY (`classID`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scheduledclasses`
--
ALTER TABLE `scheduledclasses`
  ADD CONSTRAINT `gssrel` FOREIGN KEY (`guardianID`) REFERENCES `guardians` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `gsrel` FOREIGN KEY (`guardianID`) REFERENCES `guardians` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacherinvoices`
--
ALTER TABLE `teacherinvoices`
  ADD CONSTRAINT `tirel` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
