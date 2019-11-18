-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 18, 2019 at 02:31 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `symfony`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_880E0D76E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `roles`, `password`) VALUES
(1, 'email@email.com', '{\"role\": \"admin\"}', '$argon2i$v=19$m=65536,t=4,p=1$RGI2VTlOMUVnbEw2emNLTA$Q877+2InbSMMU2nPyOWOZivvOdVmwmMv9GaRCSjsyyQ'),
(2, 'johnperry@email.com', '{\"role\": \"admin\"}', '$argon2i$v=19$m=65536,t=4,p=1$b2lMWXMyRWVjRnEzbkw2OQ$ihQz+Pta04T9XZc5ja5mfJhAZpcaycuyvVb1hAMSnaY');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_code` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `discount_code`, `start_date`, `end_date`, `description`) VALUES
(1, 'FREE4U', '2019-07-01', '2019-09-30', 'Congratulations on earning free icecream, whatever your desire is our cost.'),
(2, '40%OFF', '2014-01-30', '2015-03-31', 'A Christmas present for all our loyal subscribers! Merry Christmas and a Happy New Year!?'),
(4, '50%OFF', '2014-01-01', '2014-01-01', 'Description');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_type` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image` longblob,
  `price` decimal(10,2) NOT NULL,
  `visibility` longtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `item_type`, `item_image`, `price`, `visibility`, `description`) VALUES
(1, 'Chocolate Heaven', 'Icecream', NULL, '2.89', 'Visible', 'A smooth, milky combination of dairy and coco created a heavenly chocolate flavour.'),
(2, 'Liquid Caramel', 'Sauce', NULL, '2.50', 'Visible', 'Smooth, sweet caramel. Love me some caramel.'),
(3, 'Small Cup', 'base', NULL, '5.00', NULL, 'When you want some icecream but you don;t want to burst your diet too much.'),
(4, 'Rainbow Sprinkles', 'topping', NULL, '2.89', NULL, 'Who doesn\'t love some rainbow sprinkles. Small pieces of crush to spice up your icecream.');

-- --------------------------------------------------------

--
-- Table structure for table `line_item`
--

DROP TABLE IF EXISTS `line_item`;
CREATE TABLE IF NOT EXISTS `line_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symfony_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `line_item`
--

INSERT INTO `line_item` (`id`, `symfony_id`, `order_id`, `item_id`, `quantity`) VALUES
(1, 1, 3, 1, NULL),
(2, 2, 3, 2, NULL),
(3, 3, 3, 4, NULL),
(4, 4, 3, 3, NULL),
(5, 5, 8, 1, 1),
(6, 6, 8, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191106005901', '2019-11-06 00:59:29'),
('20191106055807', '2019-11-06 05:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `discount_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_name`, `user_id`, `discount_code`) VALUES
(1, 'Green Eggs and Ham', 39, 1),
(2, 'Happy Thoughts', 46, NULL),
(3, 'Sweet Revenge', 40, NULL),
(4, 'Chocolate Heaven', 40, NULL),
(5, 'Pumpkin Pie', 40, NULL),
(6, 'January Special', 38, NULL),
(7, 'Fudge Fun', 39, NULL),
(8, 'sweet savoury', 40, NULL),
(9, 'hello sweety', 38, NULL),
(10, 'Sweety', 41, NULL),
(11, 'Bread', 40, NULL),
(12, 'Febuary Special', 41, NULL),
(13, 'Happy Birthday', 2, 39),
(14, 'Green Eggs', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_num` int(11) DEFAULT NULL,
  `publish_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `order_id`, `user_id`, `vote_num`, `publish_date`) VALUES
(1, 5, 40, 22, '2019-09-17 00:00:00'),
(2, 8, 39, 33, '2019-09-17 00:00:00'),
(3, 11, 41, NULL, '2019-09-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `requestlog`
--

DROP TABLE IF EXISTS `requestlog`;
CREATE TABLE IF NOT EXISTS `requestlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_user_agent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `request_method` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requestlog`
--

INSERT INTO `requestlog` (`id`, `server_address`, `http_user_agent`, `request_time`, `request_method`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:19:59', 'GET'),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:19:59', 'GET'),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:19:59', 'GET'),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:19:59', 'GET'),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:19:59', 'GET'),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:20:29', 'POST'),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:20:37', 'POST'),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:22:11', 'GET'),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:22:11', 'GET'),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:22:11', 'GET'),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:22:11', 'GET'),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:22:11', 'GET'),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:22:30', 'POST'),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:23:46', 'POST'),
(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:25:52', 'GET'),
(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:26:51', 'GET'),
(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:26:53', 'GET'),
(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:26:53', 'GET'),
(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:26:53', 'GET'),
(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:26:53', 'GET'),
(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:26:53', 'GET'),
(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:30:15', 'GET'),
(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:30:15', 'GET'),
(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:30:15', 'GET'),
(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:30:15', 'GET'),
(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-06 07:30:15', 'GET'),
(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:23:03', 'GET'),
(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:23:03', 'GET'),
(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:23:03', 'GET'),
(30, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:23:03', 'GET'),
(31, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:23:03', 'GET'),
(32, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:24:10', 'POST'),
(33, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:11', 'GET'),
(34, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:11', 'GET'),
(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:11', 'GET'),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:11', 'GET'),
(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:11', 'GET'),
(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:21', 'GET'),
(39, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:40', 'GET'),
(40, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:40', 'GET'),
(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:40', 'GET'),
(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:40', 'GET'),
(43, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:40', 'GET'),
(44, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:25:57', 'GET'),
(45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:26:00', 'GET'),
(46, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:26:00', 'GET'),
(47, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:26:00', 'GET'),
(48, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:26:00', 'GET'),
(49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-10 23:26:00', 'GET'),
(50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-12 00:46:50', 'GET'),
(51, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-12 00:46:50', 'GET'),
(52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-12 00:46:50', 'GET'),
(53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-12 00:46:50', 'GET'),
(54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', '2019-11-12 00:46:50', 'GET');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` longtext COLLATE utf8mb4_unicode_ci,
  `email` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `role`) VALUES
(1, 'hanabel', 'Malekter', 'hahabel@malekter.com', '$2y$10$07Rn2KYgi2DS9l1WynQXbeN3MEPlUaXD/JzWdsTNjAxAZ0N/i6bei', 'user'),
(2, 'aubrey', 'stage', 'aubreystage@email.com', '$2y$10$26GPHU0ngbtIw.402byEreprn3WoycG8Q8Vo3wbru4gJZMrVZ9Uti', 'user'),
(3, 'Aubrey', 'Stage', 'aub.stage@email.com', '$2y$10$MH0HvEn66GcRAci8wShCe.C3/QtRTlPgefgKhNYt/L3Toh2AdAWLa', 'user'),
(4, 'Random', 'Stranger', 'random.stranger@email.com', '$2y$10$D4gcR58tClm8L2Ekkan1iO1DQi.be.6kn2T1YoQ0KodxVJXNwBiAK', 'user'),
(5, 'Jon', 'Doe', 'JonDoe@email.com', 'Hahahaha1', 'user'),
(6, 'Declan', 'Dylan', 'DecDyl@email.com', '$2y$10$BX3hjR9UWlhlvt8zzI1dHeUpi20WzdArDrxgWVuBNUq0dwMM8OkQi', 'user'),
(7, 'Hanabel', 'Killer', 'hana@killer.com', '$2y$10$74QQ121foDGdjFdkkQVqIeryp1njA8c5/Gc0/z8ZM7cQYTNxV6Wkm', 'user'),
(8, 'Hello', 'mate', 'hi@mail.com', '$2y$10$idG5I9l9FIKtmuza7t34Ou9SVCnlNGAjsgdrbliiYl7nxIZR1Yk/K', 'user'),
(9, 'l@', 'l@', 'no@ermail.com', '$2y$10$0m.XMyJHg8.QgK75D26GzO.5KkHskPssQm/y3VQb33Qckh4qi6agy', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
