-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2018 at 04:30 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `name` text NOT NULL,
  `categoryDesc` text NOT NULL,
  `defaultCategory` int(11) NOT NULL DEFAULT '0',
  `defaultVideo` int(11) NOT NULL,
  `thumbnailSrc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`, `categoryDesc`, `defaultCategory`, `defaultVideo`, `thumbnailSrc`) VALUES
(12, 'Adventure', 'Adventure', 0, 642, '/videos/genre/poster/adventure.jpg'),
(28, 'Action', 'Action', 0, 642, '/videos/genre/poster/action.jpg'),
(878, 'Science Fiction', 'Science Fiction', 0, 642, '/videos/genre/poster/scifi.jpg'),
(10749, 'Romance', 'Romance', 0, 642, '/videos/genre/poster/romance.jpg'),
(9648, 'Mystery', 'Mystery', 0, 642, '/videos/genre/poster/mystery.jpg'),
(10402, 'Music', 'Music', 0, 642, '/videos/genre/poster/music.jpg'),
(27, 'Horror', 'Horror', 0, 642, '/videos/genre/poster/horror.jpg'),
(36, 'History', 'History', 0, 642, '/videos/genre/poster/history.jpg'),
(14, 'Fantasy', 'Fantasy', 0, 642, '/videos/genre/poster/fantasy.jpg'),
(10751, 'Family', 'Family', 0, 642, '/videos/genre/poster/family.jpg'),
(18, 'Drama', 'Drama', 0, 642, '/videos/genre/poster/drama.jpg'),
(99, 'Documentary', 'Documentary', 0, 642, '/videos/genre/poster/documentary.jpg'),
(80, 'Crime', 'Crime', 0, 642, '/videos/genre/poster/crime.jpg'),
(35, 'Comedy', 'Comedy', 0, 642, '/videos/genre/poster/comedy.jpg'),
(16, 'Animation', 'Animation', 0, 642, '/videos/genre/poster/animation.jpg'),
(10770, 'TV Movie', 'TV Movie', 0, 642, '/videos/genre/poster/tv.jpg'),
(53, 'Thriller', 'Thriller', 0, 642, '/videos/genre/poster/thriller.jpg'),
(10752, 'War', 'War', 0, 642, '/videos/genre/poster/war.jpg'),
(37, 'Western', 'Western', 0, 642, '/videos/genre/poster/western.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `videoId` int(255) NOT NULL,
  `title` text NOT NULL,
  `duration` int(155) NOT NULL,
  `videoSrc` varchar(255) NOT NULL,
  `posterSrc` varchar(255) NOT NULL,
  `thumbnailSrc` varchar(255) NOT NULL,
  `category` json NOT NULL,
  `ageLimit` int(155) NOT NULL,
  `videoDesc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD KEY `videoId` (`defaultVideo`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`videoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10771;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `videoId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=643;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
