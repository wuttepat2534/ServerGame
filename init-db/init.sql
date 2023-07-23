-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jul 23, 2023 at 02:45 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gggame`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `datetime_lastlogin` datetime DEFAULT NULL,
  `get_browser` longtext COLLATE utf8mb3_unicode_ci,
  `status` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_number` varchar(11) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `datetime_lastlogin`, `get_browser`, `status`, `status_delete`, `created_at`, `updated_at`, `contact_number`) VALUES
(1, 'admin', 'admin01', '$2a$12$txRrO/VE/XsEIurb9Gs.2.KZg0sw1SAjLMUzQgTad7X2UQ1mZOv1q', NULL, NULL, 'Y', 'Y', '2023-04-17 06:23:16', '2023-04-17 06:23:16', '0978454454'),
(2, 'admintest00', 'admintest', '$2a$12$U5KKkYIBfDy1XnM3lsyqEe3Rc/dCeRzluqkcHM4TSuKxkuK0g/7h2', NULL, NULL, 'Y', 'N', '2023-04-17 07:50:51', '2023-04-17 07:50:51', '0788751245'),
(3, 'admintest01', 'admintest01', '$2a$12$c3q0ErCOJt3Ww2bP9UESJ.EKcdzk4wlU7YM49aPw9s3Tvqv5noPWu', NULL, NULL, 'Y', 'N', '2023-04-17 09:27:54', '2023-04-17 09:27:54', '0854415621'),
(4, 'admintest02', 'admintest02', '$2a$12$8LBsaQ052PkMsjqYPRQkWu0Pn7nTIpchhoPeS3GOpNRDwhVVMcrei', NULL, NULL, 'Y', 'N', '2023-04-20 07:31:53', '2023-04-20 07:31:53', '0789445254'),
(5, 'admintest3', 'admintest3', '$2a$12$yhidiomnp6JDuMiW8e5A5u1tDZnPK4rASqO0bqy00wTSsKH5a4QU2', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:10', '2023-04-20 07:32:10', '0545453333'),
(6, 'admintest4', 'admintest4', '$2a$12$oaZ6eitByvwaai4Svr05YO.0QLR1VhH50D7oxwiPoACbEqCqxe962', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:18', '2023-04-20 07:32:18', '0990825941'),
(7, 'admintest05', 'admintest05', '$2a$12$Y4D0aE9P3f5lq6KSvOgN8u6lD6hC2pgZjiXn.uVvLpEkXZIfuzjnK', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:25', '2023-04-20 07:32:25', '0545453333'),
(8, 'admintest06', 'admintest06', '$2a$12$sbsgT9VBhV70cx6j2KUPfuK744bmo49nW7hKtgojcxlLmCixrcsOm', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:33', '2023-04-20 07:32:33', '0'),
(9, 'admin06', 'admin06', '$2a$12$IHq5WMEQy42pLWUkliwHbONcD/3AxRLuZ6fcTTILx5noX.H6VXIWi', NULL, NULL, 'Y', 'N', '2023-04-20 07:32:46', '2023-04-20 07:32:46', '0'),
(10, 'admin10', 'admin10', '$2a$12$.78r2Cnu8Fa6cazVev1dm.VvXIajjDfLPB87Qju9.0NU9bxRG5MGa', NULL, NULL, 'Y', 'N', '2023-04-20 07:33:00', '2023-04-20 07:33:00', '0'),
(11, 'admin11', 'admin11', '$2a$12$3rEnwyqClA7jLaY85Gg41.Qqv17IvrexIjVD3LWo93zJiTrXRd2Ri', NULL, NULL, 'Y', 'N', '2023-04-20 07:33:07', '2023-04-20 07:33:07', '0'),
(12, 'admin011', 'admin011', '$2a$12$PC3jgUNpwgb6OtpnxW4.gOVFSMwDB3rL5qu58fGWmVRGTX/Z5s5PO', NULL, NULL, 'Y', 'N', '2023-04-20 07:33:14', '2023-04-20 07:33:14', '0'),
(13, 'Admin012', 'Admin012', '$2a$12$eDFFTJAwv5Vv4bQXwbMcV.9C1wijhrKvLurvf.gjv1xV6PAqDgXOa', NULL, NULL, 'Y', 'N', '2023-04-20 13:59:53', '2023-04-20 13:59:53', '0'),
(14, 'adminhui', 'adminhui', '$2a$12$QNxyS1TZxB9slDNVli7RiOEr2w3n9yyfo2JK5GSz7PKrG1T6pP9BK', NULL, NULL, 'Y', 'N', '2023-04-24 19:03:48', '2023-04-24 19:03:48', '0'),
(15, 'หุ้ย01', 'huiadmin01', '$2a$12$dCHdgf1dSammHVJjXdoPj.MrBHi1L2uD6vHRI.ih.Ozm7SgYc7N9C', NULL, NULL, 'Y', 'N', '2023-04-25 03:57:44', '2023-04-25 03:57:44', '0'),
(16, 'adminHuiTest', 'adminHuiTest', '$2a$12$prb54Qvobxcic7l1L9TZ.eRoRFbh/vRwCGA/xRQ4jJ7VpHS58Sd5q', NULL, NULL, 'Y', 'N', '2023-04-26 08:01:11', '2023-04-26 08:01:11', '0990825964'),
(17, 'GGadmin', 'GGadmin', '$2a$12$tRreQ5jBpi006qaorG/RRuk0txL7KFNNvFYflglzzb7EtxDnqWYXe', NULL, NULL, 'Y', 'N', '2023-04-26 08:02:41', '2023-04-26 08:02:41', '0990825964'),
(18, 'GGadmin01', 'GGadmin01', '$2a$12$80tuRgfHVGlUkGbt4Z85ZuMe8GRMC2KOP7VnzAuT/vQyCp63.k.Ya', NULL, NULL, 'Y', 'N', '2023-04-26 08:09:05', '2023-04-26 08:09:05', '0990825941'),
(19, 'GGadmin02', 'GGadmin02', '$2a$12$K67OF9SPf1M//rAu1.d1pu2cKAgTnE/pGUeSWf71Rkuih8f8.9Szy', NULL, NULL, 'Y', 'N', '2023-04-26 08:10:52', '2023-04-26 08:10:52', '0990825964');

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` bigint UNSIGNED NOT NULL,
  `website_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `commission` float(15,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `website_name`, `name`, `username`, `password`, `status`, `status_delete`, `created_at`, `updated_at`, `contact_number`, `credit`, `commission`) VALUES
(1, NULL, 'agent001', 'agent111', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-18 10:01:41', '2023-04-18 10:01:41', '0778569255', 40000.00, 300.00),
(2, NULL, 'agent002', 'agent01', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-18 10:09:44', '2023-04-18 10:09:44', '0778888888', 10000.00, 200.00),
(3, NULL, 'undefined', 'agent03', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'Y', '2023-04-18 10:09:50', '2023-04-18 10:09:50', '0452342377', 30000.00, 0.00),
(4, NULL, 'agent04', 'agent04', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:05', '2023-04-20 10:50:05', '0883569875', 30254.00, 0.00),
(5, NULL, 'Bookiezz', 'agent05', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:11', '2023-04-20 10:50:11', '0545453333', 300000.00, 0.00),
(6, NULL, 'undefined', 'agent05', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:20', '2023-04-20 10:50:20', '0990825941', 40000.00, 300.00),
(7, NULL, 'agent055', 'agent055', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:27', '2023-04-20 10:50:27', '0943169915', 4500.00, 2055.00),
(8, NULL, 'agent066', 'agent066', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:35', '2023-04-20 10:50:35', NULL, 0.00, 1000.00),
(9, NULL, 'agent07', 'agent07', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:42', '2023-04-20 10:50:42', NULL, 0.00, 0.00),
(10, NULL, 'agent11', 'agent11', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:49', '2023-04-20 10:50:49', NULL, 0.00, 700.00),
(11, NULL, 'agent12', 'agent12', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:04', '2023-04-20 10:51:04', NULL, 0.00, 0.00),
(12, NULL, 'agent14', 'agent14', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:11', '2023-04-20 10:51:11', NULL, 0.00, 0.00),
(13, NULL, 'agent111', 'agent111', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:19', '2023-04-20 10:51:19', NULL, 0.00, 0.00),
(14, NULL, 'agent0234', 'agent0234', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 06:06:45', '2023-04-26 06:06:45', '0990854415', 50004.00, 0.00),
(15, NULL, 'fgdgdgd', 'dgdgdgd', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 06:08:52', '2023-04-26 06:08:52', '0555555555', 0.00, 250.00),
(16, NULL, 'GGagent01', 'GGagent01', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 08:12:31', '2023-04-26 08:12:31', '0990825964', 15000.00, 0.00),
(17, NULL, 'OstArifureta', 'ffffffff', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-05-19 07:24:57', '2023-05-19 07:24:57', '0998542263', 5020.00, 0.00),
(18, NULL, 'Ginga', 'UltramanGinga', '$2a$12$3GUX8XgasDzSwn/GtopoheRNkUb6QQMnG8pgNnA4C1xQ/6QQsH.hK', 'Y', 'N', '2023-05-24 16:39:20', '2023-05-24 16:39:20', '0838985624', 52300.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `allgame`
--

CREATE TABLE `allgame` (
  `id` bigint NOT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `linkgame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allgame`
--

INSERT INTO `allgame` (`id`, `namegame`, `img`, `linkgame`) VALUES
(1, 'Go Gold Planet', '/img/thumbs/icontest3.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_GoGoldPlanet/index.html'),
(2, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png\n', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_LuckyBunnyGold/index.html'),
(3, 'CowBoys VS Aliens', '/img/thumbs/icontest1.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_CowboyVSAlien/index.html');

-- --------------------------------------------------------

--
-- Table structure for table `comgogoldplanet`
--

CREATE TABLE `comgogoldplanet` (
  `id` bigint NOT NULL,
  `bet_gogold` float DEFAULT '0',
  `win_gogold` float DEFAULT '0',
  `bet_luckybunny` float(15,2) DEFAULT '0.00',
  `win_luckybunny` float(15,2) DEFAULT '0.00',
  `bet_aliens` float(15,2) DEFAULT '0.00',
  `win_aliens` float(15,2) DEFAULT '0.00',
  `commission` float(15,2) DEFAULT '0.00',
  `day` date DEFAULT NULL,
  `monthly` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comgogoldplanet`
--

INSERT INTO `comgogoldplanet` (`id`, `bet_gogold`, `win_gogold`, `bet_luckybunny`, `win_luckybunny`, `bet_aliens`, `win_aliens`, `commission`, `day`, `monthly`) VALUES
(1, 30, 7, 20.00, 0.00, 15.00, 9.00, 5.00, '2023-05-11', '2023-05-11'),
(2, 10, 5, 0.00, 0.00, 0.00, 0.00, 120.00, '2023-05-12', '2023-05-12'),
(3, 10, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-05-13', '2023-05-13'),
(4, 550, 336.002, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-05-16', '2023-05-16'),
(5, 3030, 158.333, 1520.00, 117.67, 0.00, 0.00, 0.00, '2023-05-17', '2023-05-17'),
(6, 1455, 951.033, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-05-18', '2023-05-18'),
(7, 198, 268.2, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-05-20', '2023-05-20'),
(8, 891, 1159.2, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-05-21', '2023-05-21'),
(9, 0, 0, 18.00, 13.20, 0.00, 0.00, 0.00, '2023-05-22', '2023-05-22'),
(10, 0, 0, 909.00, 1039.20, 0.00, 0.00, 0.00, '2023-05-25', '2023-05-25'),
(11, 0, 0, 1179.00, 775.80, 0.00, 0.00, 0.00, '2023-05-26', '2023-05-26'),
(12, 0, 0, 81.00, 16.50, 0.00, 0.00, 0.00, '2023-06-20', '2023-06-20'),
(13, 0, 0, 441.00, 144.90, 0.00, 0.00, 0.00, '2023-06-28', '2023-06-28'),
(14, 0, 0, 0.00, 0.00, 252.00, 0.05, 0.00, '2023-06-29', '2023-06-29'),
(15, 0, 0, 0.00, 0.00, 153.00, 1.51, 0.00, '2023-07-18', '2023-07-18'),
(16, 0, 0, 0.00, 0.00, 216.00, 30.00, 0.00, '2023-07-21', '2023-07-21'),
(17, 81, 17.4, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-07-22', '2023-07-22'),
(18, 0, 0, 0.00, 0.00, 144.00, 45.90, 0.00, '2023-07-23', '2023-07-23');

-- --------------------------------------------------------

--
-- Table structure for table `commissionsubagent`
--

CREATE TABLE `commissionsubagent` (
  `id` bigint NOT NULL,
  `idsub_agent` bigint DEFAULT NULL,
  `id_agent` bigint DEFAULT NULL,
  `game_id` float(15,2) DEFAULT NULL,
  `total` float(15,2) DEFAULT '0.00',
  `time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commissionsubagent`
--

INSERT INTO `commissionsubagent` (`id`, `idsub_agent`, `id_agent`, `game_id`, `total`, `time`) VALUES
(1, 2, 2, 1.00, 0.00, '2023-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `creditpromotion`
--

CREATE TABLE `creditpromotion` (
  `id` bigint NOT NULL,
  `agnetidcreate` int NOT NULL,
  `repost` enum('ทั่วไป','อีเวนท์') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ทั่วไป',
  `startpromotion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `endpromotion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `typebonus` enum('Percent','Fixed rate') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Percent',
  `bunus` float(15,2) NOT NULL DEFAULT '0.00',
  `maxbunus` float(15,2) NOT NULL,
  `valusbunus` float(15,2) NOT NULL,
  `groupuser` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'New',
  `afterPromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `receiving_data_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `valus_receiving` int DEFAULT '0',
  `data_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `valus_day` int NOT NULL DEFAULT '0',
  `numberoftimes_person` int NOT NULL,
  `ipAddress_attempts` int NOT NULL,
  `reset` time NOT NULL,
  `withdrawalType` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `withdraw_data_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'ไม่มี',
  `withdraw_max` float(15,2) NOT NULL DEFAULT '1.00',
  `withdraw_valus` int NOT NULL DEFAULT '1',
  `statuspromotion` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y',
  `promotiontype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `namepromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `leakedPro` enum('เปอร์เซ็นต์','ค่าคงที่') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'เปอร์เซ็นต์',
  `multiplier` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creditpromotion`
--

INSERT INTO `creditpromotion` (`id`, `agnetidcreate`, `repost`, `startpromotion`, `endpromotion`, `typebonus`, `bunus`, `maxbunus`, `valusbunus`, `groupuser`, `afterPromotion`, `receiving_data_type`, `valus_receiving`, `data_type`, `valus_day`, `numberoftimes_person`, `ipAddress_attempts`, `reset`, `withdrawalType`, `withdraw_data_type`, `withdraw_max`, `withdraw_valus`, `statuspromotion`, `promotiontype`, `namepromotion`, `leakedPro`, `multiplier`) VALUES
(1, 2, 'ทั่วไป', '2023-07-21T04:26:29.104Z', '2023-07-27T17:00:00.000Z', 'Percent', 30.00, 999.00, 100.00, '', 'New SCB', 'ฝากเงินครั้งแนก', 0, '', 0, 0, 0, '00:00:00', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'เติมเงินครั้งแรกรับไปเลย', 'ค่าคงที่', 3);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` bigint NOT NULL,
  `growshrink` int DEFAULT NULL,
  `fiatValue` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `linkgame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `growshrink`, `fiatValue`, `name`, `symbol`, `icon`, `linkgame`) VALUES
(1, 10, 3000, 'Go Gold Planet', 'LTC', '/img/thumbs/icontest3.png', NULL),
(2, 30, 1500, 'CowBoys VS Aliens', 'BTC', '/img/thumbs/icontest1.png', NULL),
(3, 40, 1000, 'Lucky Bunny Gold', 'ETH', '/img/thumbs/icontest2.png', NULL),
(4, 20, 2000, 'CowboyVsAlien', 'SOL', '/img/thumbs/solana.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gameweb`
--

CREATE TABLE `gameweb` (
  `id` bigint NOT NULL,
  `imglogo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password_img` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `active` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gameweb`
--

INSERT INTO `gameweb` (`id`, `imglogo`, `password_img`, `namegame`, `active`) VALUES
(1, 'https://superapi-products.s3-ap-southeast-1.amazonaws.com/logo/pgslot.webp', 'PGSOFT2', 'PG Soft', 'N'),
(2, 'https://alexanderdevenezuela.com/wp-content/uploads/2021/02/slot-xo.png', 'SLOTXO', 'Slotxo', 'N'),
(3, 'https://joker123.center/wp-content/uploads/2021/01/cropped-joker123-center-1024px.png', 'JOKER', 'Joker123', 'N'),
(4, 'https://superapi-products.s3-ap-southeast-1.amazonaws.com/logo/askmebet.webp', 'ASKMEBET', 'Askmebet', 'N'),
(5, 'https://casinodaddy.com/wp-content/uploads/2020/04/habanero-logo.png', 'HABANERO', 'Habanero', 'N'),
(6, 'https://www.slotsreview.games/wp-content/uploads/2020/09/tabPp8TY.png', 'SPADE', 'Spade Gaming', 'N'),
(7, 'https://onlinebingo.co.uk/wp-content/uploads/2022/08/microgaming.png', 'MICRO', 'Micro Gaming', 'N'),
(8, 'https://smartcasinoguide.com/app/uploads/2021/11/SimplePlay-games-icon.png', 'SIMPLEPLAY', 'Simple Play', 'N'),
(9, 'https://malaysialistings.s3.ap-south-1.amazonaws.com/listings/images63be4cb88319b.jpg', 'LIVE22', 'Live22', 'N'),
(10, 'https://goodluckmate.com/storage/attribute_value/d3dce8f6c19589bace8a9d293a271780/c/evoplay-games-250x250.png', 'EVOPLAY', 'Evoplay', 'N'),
(11, 'https://pgslot-game.io/wp-content/uploads/2021/08/CQ9-SLOT-min-1.png', 'CQ9V2', 'CQ9', 'N'),
(12, 'https://play-lh.googleusercontent.com/7KD9UI2qGFDKCqSvVK_9k03PzApNaFxhHeAbQzCZqRvxAiqVOLVS5Jr6MXKzkcFotzUp', 'JILI', 'Jili', 'N'),
(13, 'https://superslot247.com/wp-content/uploads/2022/06/%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%A2-mannaplay-%E0%B9%80%E0%B8%A7%E0%B9%87%E0%B8%9A-Superslot-%E0%B8%9F%E0%B8%A3%E0%B8%B5%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%94%E0%B8%B4%E0%B8%95.png', 'MANNA', 'Mannaplay', 'N'),
(14, 'https://www.atombetx888.com/images/bfgames/Funky%20Games.png', 'FUNKY', 'Funky Games', 'N'),
(15, 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/uj9tjvzkgifyr1nsyomj', 'YGGDRASIL', 'Yggdrasil Gaming', 'N'),
(16, 'https://apimain.fomobet88.com/images/1655903289.webp', 'UPG', 'UPG Slot', 'N'),
(17, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0jB977AuuUdyeQYZRVw25DzoOFCWZz7yMfd5GPujDIxe0SEwqngvMLMmvmLG6ZtSOC8o&usqp=CAU', 'AMEBA', 'Ameba', 'N'),
(18, 'https://fortuneox.net/wp-content/uploads/2022/12/gamecompanyamb.png', 'AMBSLOT2', 'Ambslot', 'N'),
(19, 'https://slotsmegacasino.pt/images/slots/hotline.jpg', 'NETENT2', 'Netent2', 'N'),
(20, 'https://pbs.twimg.com/profile_images/1495764482307637248/9yEFhc2D_400x400.jpg', 'REDTIGER', 'Red Tiger', 'N'),
(21, 'https://as2.ftcdn.net/v2/jpg/03/19/27/03/1000_F_319270375_1tXTAdn0eim324DADDtNJZZVBLIVYTLP.jpg', 'DRAGONGAMING', 'Dragon Gaming', 'N'),
(22, 'https://static.wixstatic.com/media/ce54f5_43d735b0df6c47cf8de3ab7ca74be105~mv2.png/v1/fill/w_269,h_267,al_c,lg_1,q_95,enc_auto/ace333.png', 'ACE333', 'Ace333', 'N'),
(23, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSokl0-jgqd5PRC_z88Q5m13kpMVH6YxTx88w&usqp=CAU', 'I8', 'I8', 'N'),
(24, 'https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/22/0a/37/220a37e4-f17f-0b02-e54e-4869308fc2fb/source/512x512bb.jpg', 'WMSLOT', 'WmSlot', 'N'),
(25, 'https://play-lh.googleusercontent.com/kyMC5UyPeJWaoju2AonX3StTnfZ5cse0MlkXheLzAdWnLeRG1u25X33Y59IuFLqnWQ', 'SPINIX', 'Spinix', 'N'),
(26, 'https://ninjaslot.co.in/wp-content/uploads/2022/11/imgninja.png', 'NINJA', 'Ninja slot', 'Y'),
(27, 'https://i1.sndcdn.com/avatars-5zP0dUayEzDDtX3G-zTczhA-t500x500.jpg', '918KISS', '918 Kiss', 'N'),
(28, 'https://cryptostec.com/wp-content/uploads/2022/05/pragmatic-play.jpeg', 'PRAGMATIC_SLOT', 'Pragmatic Play Slot', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `game_feespin`
--

CREATE TABLE `game_feespin` (
  `member_id` bigint DEFAULT '0',
  `game_id` bigint DEFAULT '0',
  `game_feespin` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_feespin`
--

INSERT INTO `game_feespin` (`member_id`, `game_id`, `game_feespin`) VALUES
(1, 1, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false'),
(1, 3, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `imgpromotion`
--

CREATE TABLE `imgpromotion` (
  `id` bigint NOT NULL,
  `namepromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `details` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fieldname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `originalname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `encoding` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mimetype` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `destination` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `size` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imgpromotion`
--

INSERT INTO `imgpromotion` (`id`, `namepromotion`, `details`, `fieldname`, `originalname`, `encoding`, `mimetype`, `destination`, `filename`, `path`, `size`) VALUES
(1, 'เติมเงินครั้งแรกรับไปเลย', 'เพียงผู้เล่นเติมเงินครั้งแรก ก็รับไปเลยโบนัส 30 % สูงสุด 1000 บาท เพียง เติมเงินขั้นต่ำ 100 บาทขึ้นไป', 'file', 'bannerdes.png', '7bit', 'image/png', 'public/images', 'file_dateVal_1689913799577_bannerdes.png', 'public/images/file_dateVal_1689913799577_bannerdes.png', 462439);

-- --------------------------------------------------------

--
-- Table structure for table `logdaygame`
--

CREATE TABLE `logdaygame` (
  `id` bigint NOT NULL,
  `game_id` bigint DEFAULT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'game',
  `play` int DEFAULT '0',
  `bet` float(15,2) DEFAULT '0.00',
  `win` float(15,2) DEFAULT '0.00',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logdaygame`
--

INSERT INTO `logdaygame` (`id`, `game_id`, `namegame`, `play`, `bet`, `win`, `icon`, `day`) VALUES
(1, 1, 'Go Gold Planet', 37, 1700.50, 42.83, '/img/thumbs/icontest3.png', '2023-05-15'),
(2, 2, 'Lucky Bunny Gold', 5000, 80000.00, 85000.00, '/img/thumbs/icontest2.png', '2023-05-15'),
(3, 3, 'CowBoys VS Aliens', 4500, 9000.00, 4000.00, '/img/thumbs/icontest1.png', '2023-05-15'),
(4, 1, 'Go Gold Planet', 37, 1600.00, 200.14, '/img/thumbs/icontest3.png', '2023-05-13'),
(5, 1, 'Go Gold Planet', 37, 1780.50, 90.65, '/img/thumbs/icontest3.png', '2023-05-14'),
(6, 3, 'CowBoys VS Aliens', 11, 9.00, 0.00, '/img/thumbs/icontest1.png', '2023-05-21'),
(14, 1, 'Go Gold Planet', 3, 27.00, 9.00, '/img/thumbs/icontest3.png', '2023-05-21'),
(15, 2, 'Lucky Bunny Gold', 2, 18.00, 13.20, '/img/thumbs/icontest2.png', '2023-05-22'),
(16, 2, 'Lucky Bunny Gold', 101, 909.00, 1039.20, '/img/thumbs/icontest2.png', '2023-05-25'),
(17, 2, 'Lucky Bunny Gold', 131, 1179.00, 775.80, '/img/thumbs/icontest2.png', '2023-05-26'),
(18, 2, 'Lucky Bunny Gold', 49, 441.00, 144.90, '/img/thumbs/icontest2.png', '2023-06-28'),
(19, 3, 'CowBoys VS Aliens', 28, 252.00, 84.00, '/img/thumbs/icontest1.png', '2023-06-29'),
(20, 3, 'CowBoys VS Aliens', 17, 153.00, 34.50, '/img/thumbs/icontest1.png', '2023-07-18'),
(21, 3, 'CowBoys VS Aliens', 24, 216.00, 30.00, '/img/thumbs/icontest1.png', '2023-07-21'),
(22, 1, 'Go Gold Planet', 9, 81.00, 17.40, '/img/thumbs/icontest3.png', '2023-07-22'),
(23, 3, 'CowBoys VS Aliens', 16, 144.00, 45.90, '/img/thumbs/icontest1.png', '2023-07-23');

-- --------------------------------------------------------

--
-- Table structure for table `logedit`
--

CREATE TABLE `logedit` (
  `id` bigint UNSIGNED NOT NULL,
  `edittype` enum('admin','agent','membet') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idedit` bigint DEFAULT NULL,
  `idmember` bigint DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editbefore` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `editafter` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logedit`
--

INSERT INTO `logedit` (`id`, `edittype`, `idedit`, `idmember`, `name`, `editbefore`, `editafter`, `created_at`) VALUES
(1, 'agent', 1, 1, 'member001', 'member_codemember001statusYcredit0\n                ', 'member_codemember001statusYcreditundefined', '2023-04-28 19:07:38'),
(2, 'agent', 1, 1, 'member001', 'member_code : member001,status : Y,credit : 0\n                ', 'member_code : member001,status : Y,credit : undefined', '2023-04-28 19:11:15'),
(3, 'agent', 1, 1, 'member001', 'member_code : member001,status : Y,credit : 0\n                ', 'member_code : member001,status : Y,credit : 10000', '2023-04-28 19:12:10'),
(4, 'agent', 1, 1, 'member001', 'member_code : member001, status : Y, credit : 10000\n                ', 'member_code : member001, status : Y, credit : 10000', '2023-04-28 19:13:33'),
(5, 'admin', 1, 1, 'member001', 'member_code : member001 , status : Y , credit : 10000\n                ', 'member_code : member001 , status : Y , credit : 10000', '2023-04-28 19:22:56'),
(6, 'admin', 1, 1, 'member001', 'member_code : member001 , status : Y , credit : 10000\n                ', 'member_code : member001 , status : Y , credit : 50000', '2023-04-28 19:35:08'),
(7, 'admin', 1, 1, 'member001', 'member_code : member001 , status : Y , credit : 50000\n                ', 'member_code : member1 , status : Y , credit : 50000', '2023-04-28 19:35:46'),
(8, 'admin', 1, 2, 'member002', 'member_code : member002 , status : Y , credit : 80000\n                ', 'member_code : undefined , status : Y , credit : 9000', '2023-05-15 14:59:25'),
(9, 'admin', 1, 1, 'member01', 'member_code : member1 , status : Y , credit : 9469.84\n                ', 'member_code : undefined , status : Y , credit : 9469.84', '2023-05-15 15:00:28'),
(10, 'admin', 1, 2, 'member02', 'member_code : undefined , status : Y , credit : 9000\n                ', 'member_code : undefined , status : Y , credit : 9000', '2023-05-15 15:10:12'),
(11, 'admin', 1, 3, 'member03', 'member_code : member03 , status : Y , credit : 0\n                ', 'member_code : undefined , status : Y , credit : ', '2023-05-15 15:16:16'),
(12, 'admin', 1, 4, 'member04', 'member_code : member004 , status : Y , credit : 0\n                ', 'member_code : undefined , status : Y , credit : 2000', '2023-05-15 15:18:03'),
(13, 'admin', 1, 3, 'member03', 'member_code : undefined , status : Y , credit : 0\n                ', 'member_code : undefined , status : Y , credit : 300', '2023-05-15 15:18:49'),
(14, 'admin', 1, 5, 'Member05', 'member_code : Test003 , status : Y , credit : 0\n                ', 'member_code : Test003 , status : Y , credit : 200', '2023-05-15 15:23:06'),
(15, 'admin', 0, 1, 'member001', 'member_code : member01 , status : Y , credit : 9469.84\n                ', 'member_code : member01 , status : Y , credit : 9469.84', '2023-05-15 18:38:07'),
(16, 'admin', 0, 1, 'member01', 'member_code : member01 , status : Y , credit : 9469.84\n                ', 'member_code : member01 , status : Y , credit : 9469.84', '2023-05-15 18:40:01'),
(17, 'admin', 0, 1, 'member001', 'member_code : member01 , status : Y , credit : 9469.84\n                ', 'member_code : member01 , status : Y , credit : 9469.84', '2023-05-15 18:42:23'),
(18, 'admin', 2, 1, 'member01', 'member_code : member01 , status : Y , credit : 9469.84\n                ', 'member_code : member01 , status : Y , credit : 9469.84', '2023-05-15 18:43:52'),
(19, 'admin', 0, 25, 'dogZillaMenber', 'member_code : memberDogzilla , status : Y , credit : 0\n                ', 'member_code : undefined , status : Y , credit : 4000', '2023-05-24 22:53:44'),
(20, 'admin', 0, 5, 'Member05', 'member_code : Test003 , status : Y , credit : 200\n                ', 'member_code : undefined , status : Y , credit : 2000', '2023-05-24 22:59:56'),
(21, 'admin', 0, 1, 'member01', 'member_code : member01 , status : Y , credit : 6534.91\n                ', 'member_code : undefined , status : Y , credit : 8000.32', '2023-05-24 23:04:46'),
(22, 'admin', 0, 0, 'undefined', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : undefined', '2023-07-16 01:26:03'),
(23, 'admin', 0, 0, 'undefined', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : undefined', '2023-07-16 01:27:36'),
(24, 'admin', 0, 0, 'member02', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 10171.17', '2023-07-16 01:28:05'),
(25, 'admin', 0, 0, 'member02', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 10171.17', '2023-07-16 01:30:12'),
(26, 'admin', 0, 0, 'member02', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 10171.17', '2023-07-16 01:31:45'),
(27, 'admin', 0, 0, 'member02', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 10171.17', '2023-07-16 01:33:57'),
(28, 'admin', 0, 0, 'member02', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 10171.17', '2023-07-16 01:34:31'),
(29, 'admin', 0, 0, 'member02', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 10171.17', '2023-07-16 01:46:45'),
(30, 'admin', 0, 1, 'member01', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 10610.4', '2023-07-16 01:49:38'),
(31, 'admin', 2, 27, 'พีรวัสTest', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 650', '2023-07-21 19:44:49'),
(32, 'admin', 2, 27, 'พีรวัสTest', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 650', '2023-07-21 19:46:27'),
(33, 'admin', 2, 27, 'พีรวัสTest', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 650', '2023-07-21 19:48:45'),
(34, 'admin', 2, 27, 'พีรวัสTestTest', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 650', '2023-07-21 19:54:32'),
(35, 'admin', 2, 27, 'พีรวัสTestTest', 'member_code : undefined , status : undefined , credit : undefined\n                ', 'member_code : undefined , status : undefined , credit : 650', '2023-07-21 19:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `logeditadmin`
--

CREATE TABLE `logeditadmin` (
  `id` bigint UNSIGNED NOT NULL,
  `edittype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `idedit` bigint DEFAULT NULL,
  `adminid` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editbefore` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editafter` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logeditadmin`
--

INSERT INTO `logeditadmin` (`id`, `edittype`, `idedit`, `adminid`, `name`, `editbefore`, `editafter`, `created_at`) VALUES
(1, 'admin', 2, 2, 'admintest00', 'name : admintest , status : Y , contact_number : 0788751245\n                  ', 'name : admintest00 , status : Y , contact_number : 0788751245', '2023-05-15 18:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `logeditagent`
--

CREATE TABLE `logeditagent` (
  `id` bigint UNSIGNED NOT NULL,
  `edittype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `idedit` bigint DEFAULT NULL,
  `agentid` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editbefore` varchar(300) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `editafter` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logeditagent`
--

INSERT INTO `logeditagent` (`id`, `edittype`, `idedit`, `agentid`, `name`, `editbefore`, `editafter`, `created_at`) VALUES
(1, 'admin', 1, 5, 'undefined', 'name : agent4 , status : Y , contact_number : 0795412658\n              ', 'name : undefined , status : Y , contact_number : 0795412658', '2023-05-02 10:37:25'),
(2, 'admin', 0, 5, 'undefined', 'name : undefined , status : Y , contact_number : 0795412658\n              ', 'name : undefined , status : Y , contact_number : 0545453333', '2023-05-04 23:44:22'),
(3, 'admin', 0, 3, 'undefined', 'name : agent02 , status : Y , contact_number : 0795412658\n              ', 'name : undefined , status : Y , contact_number : 0452342377', '2023-05-04 23:45:15'),
(4, 'admin', 0, 1, 'undefined', 'name : agent , status : Y , contact_number : 0998888888\n              ', 'name : undefined , status : Y , contact_number : 0778569266', '2023-05-04 23:46:16'),
(5, 'admin', 0, 1, 'undefined', 'name : undefined , status : Y , contact_number : 0778569266\n              ', 'name : undefined , status : Y , contact_number : 0778569255', '2023-05-04 23:46:45'),
(6, 'admin', 0, 1, 'undefined', 'name : undefined , status : Y , contact_number : 0778569255\n              ', 'name : undefined , status : Y , contact_number : 0778569255', '2023-05-04 23:47:45'),
(7, 'admin', 0, 1, 'undefined', 'name : undefined , status : Y , contact_number : 0778569255\n              ', 'name : undefined , status : Y , contact_number : 0778569255', '2023-05-04 23:48:05'),
(8, 'admin', 0, 1, 'agent01', 'name : undefined , status : Y , contact_number : 0778569255\n              ', 'name : agent01 , status : Y , contact_number : 0778569255', '2023-05-04 23:49:06'),
(9, 'admin', 1, 1, 'agent001', 'name : agent01 , status : Y , contact_number : 0778569255\n              ', 'name : agent001 , status : Y , contact_number : 0778569255', '2023-05-15 15:06:33'),
(10, 'admin', 1, 2, 'agent002', 'name : agent01 , status : Y , contact_number : 0778888888\n              ', 'name : agent002 , status : Y , contact_number : 0778888888', '2023-05-15 15:09:40'),
(11, 'admin', 2, 7, 'agent055', 'name : agent055 , status : Y , contact_number : 0943169915\n                ', 'name : agent055 , status : Y , contact_number : 0943169915', '2023-05-24 23:30:38'),
(12, 'admin', 2, 5, 'Bookiezz', 'name : undefined , status : Y , contact_number : 0545453333\n                ', 'name : Bookiezz , status : Y , contact_number : 0545453333', '2023-05-24 23:31:11'),
(13, 'admin', 2, 17, 'OstArifureta', 'name : kjkjkj , status : Y , contact_number : 0998542263\n                ', 'name : OstArifureta , status : Y , contact_number : 0998542263', '2023-05-24 23:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `logfinanceuser`
--

CREATE TABLE `logfinanceuser` (
  `id` bigint NOT NULL,
  `idUser` int NOT NULL,
  `accountName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accountNumber` int NOT NULL,
  `tpyefinance` enum('ถอน','ฝาก') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `balance` float(15,2) NOT NULL,
  `creditbonus` int DEFAULT '0',
  `transaction_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logfinanceuser`
--

INSERT INTO `logfinanceuser` (`id`, `idUser`, `accountName`, `accountNumber`, `tpyefinance`, `quantity`, `balance`, `creditbonus`, `transaction_date`) VALUES
(1, 27, 'พีรวัสTest', 2147483647, 'ฝาก', 500, 650.00, 150, '2023-07-20 20:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `loggame`
--

CREATE TABLE `loggame` (
  `id` bigint NOT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'game',
  `play` int DEFAULT '0',
  `bet` float(15,2) DEFAULT '0.00',
  `win` float(15,2) DEFAULT '0.00',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loggame`
--

INSERT INTO `loggame` (`id`, `namegame`, `play`, `bet`, `win`, `icon`) VALUES
(1, 'Go Gold Planet', 919, 5581.00, 1177.33, '/img/thumbs/icontest1.png'),
(2, 'Lucky Bunny Gold', 5498, 82809.00, 87081.12, '/img/thumbs/icontest2.png'),
(3, 'CowBoys VS Aliens', 4594, 9756.00, 4194.40, '/img/thumbs/icontest3.png');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` bigint UNSIGNED NOT NULL,
  `agent_id` bigint DEFAULT '0',
  `username_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `member_code` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `bet_latest` float(16,2) DEFAULT '0.00',
  `username` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `browserlogin` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `customerGroup` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userrank` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lineid` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `currency` varchar(11) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `bank` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountNumber` int NOT NULL,
  `phonenumber` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `recharge_times` int NOT NULL DEFAULT '0',
  `bonususer` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `agent_id`, `username_agent`, `member_code`, `name`, `credit`, `bet_latest`, `username`, `password`, `status`, `status_delete`, `created_at`, `updated_at`, `ip_address`, `browserlogin`, `customerGroup`, `userrank`, `lineid`, `note`, `currency`, `bank`, `accountName`, `accountNumber`, `phonenumber`, `lastName`, `recharge_times`, `bonususer`) VALUES
(1, 2, 'subAgent02', 'undefined', 'member01', 10175.40, 9.00, 'member001', '000000000', 'N', 'N', '2023-04-01 01:56:00', '2023-05-12 01:56:00', '192.168.1.41', 'Google Chrome', 'null', '', '', 'null', 'บาท', 'null', 'null', 0, '0', '', 0, 0),
(2, 2, 'subAgent02', 'member02', 'member02', 10171.17, 9.00, 'member00011', '123', 'Y', 'N', '2023-04-01 01:56:00', '2023-05-12 01:56:00', NULL, NULL, 'NEW ALL', 'Bronze', 'niranamhui', 'สร้างขึ้นเพื่อทดสอบ', 'บาท', 'ธนาคารไทยพาณิชย์', 'ซาวาดะ สึนะโยชิ', 1568996524, '788751245', 'TestTestTest', 0, 0),
(3, 2, 'subAgent02', 'member03', 'member03', 378.00, 9.00, 'member003', '25f9e794323b453885f5181f1b624d0b', 'Y', 'N', '2023-04-22 20:21:35', '2023-05-11 20:21:35', 'null', 'null', NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(4, 1, 'agent111', 'member04', 'member04', 2000.00, 0.00, 'member004', '25f9e794323b453885f5181f1b624d0b', 'Y', 'N', '2023-04-22 20:38:28', '2023-05-11 20:38:28', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(5, 3, 'agent03', 'undefined', 'Member05', 2000.00, 0.00, 'Test003', '25f9e794323b453885f5181f1b624d0b', 'Y', 'N', '2023-04-22 20:41:40', '2023-05-11 20:41:40', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(6, 4, '	\r\nagent04', 'member12', 'member12', 0.00, 0.00, 'member12', '1234', 'Y', 'N', '2023-04-24 07:21:08', '2023-05-12 07:21:08', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(7, 4, 'agent04', 'Member0005', 'Member0005', 0.00, 0.00, 'Member0005', '123456789', 'Y', 'N', '2023-05-01 08:27:04', '2023-05-12 01:56:00', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(8, 4, 'agent04', 'Member0006', 'Member0006', 0.00, 0.00, 'Member0006', 'Member0006', 'Y', 'N', '2023-05-01 08:27:33', '2023-05-12 01:56:00', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(9, 2, 'agent04', 'Member0007', 'Member0007', 0.00, 0.00, 'Member0007', 'Member0007', 'Y', 'N', '2023-05-02 08:27:57', '2023-05-12 01:56:00', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(10, 2, 'agent04', 'Member00010', 'Member00010', 0.00, 0.00, 'Member00010', '123456789', 'Y', 'N', '2023-05-01 08:27:04', '2023-05-11 20:21:35', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(11, 4, 'agent04', NULL, 'Member0011', 0.00, 0.00, 'Member0011', 'Member0011', 'Y', 'N', '2023-05-01 08:28:47', '2023-05-11 20:21:35', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(12, 4, 'agent04', 'Member0012', 'Member0012', 0.00, 0.00, 'Member0012', 'Member0012', 'Y', 'N', '2023-05-01 08:29:06', '2023-05-12 01:56:00', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(21, 1, 'undefined', 'Hui', 'หุ้ย01', 0.00, 0.00, 'huiadmin01', '123456789', 'Y', 'N', '2023-04-27 08:44:01', '2023-04-27 08:44:01', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(22, 1, 'undefined', 'Hui', 'หุ้ย01', 0.00, 0.00, 'huiadmin21', '123456789', 'Y', 'N', '2023-04-27 08:45:13', '2023-04-27 08:45:13', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(23, 1, 'agent', 'Hui', 'หุ้ย01', 0.00, 0.00, 'huiadmin2', '123456789', 'Y', 'N', '2023-04-27 08:45:56', '2023-04-27 08:45:56', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(24, 1, 'agent', 'Dertyuo01', 'Dertyuo01', 0.00, 0.00, 'Dertyuo01', '123456789', 'Y', 'N', '2023-04-27 08:53:13', '2023-04-27 08:53:13', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(25, 3, 'agent03', 'undefined', 'dogZillaMenber', 4000.00, 0.00, 'memberDogzilla', '25f9e794323b453885f5181f1b624d0b', 'Y', 'N', '2023-05-24 15:30:40', '2023-05-24 15:30:40', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(26, 5, 'agent05', 'UltramanOrb', 'KulanaiKai', 60000.00, 0.00, 'UltramanOrb', '4c93008615c2d041e33ebac605d14b5b', 'Y', 'N', '2023-05-24 16:02:00', '2023-05-24 16:02:00', NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, 0, '0', '', 0, 0),
(27, 2, 'agent01', 'undefined', 'พีรวัสTestTest', 650.00, 0.00, 'niranamhui', '61106506', 'N', 'N', '2023-07-16 10:20:06', '2023-07-16 10:20:06', 'null', 'null', 'NEW ALL', 'Bronze', 'NoobTest', 'สร้างขึ้นเพื่อการทดสอบ', 'บาท', 'ธนาคารไทยพาณิชย์', 'พีรวัสTest', 2147483647, '0990825942', 'นุเคราะห์ชีพTestTest', 1, 150),
(29, 2, 'agent01', '2', 'คุโรซากิ', 1000.00, 0.00, 'ironman', '25f9e794323b453885f5181f1b624d0b', 'N', 'N', '2023-07-16 11:24:17', '2023-07-16 11:24:17', NULL, NULL, 'NEW ALL', 'Bronze', 'WorkFromHome', 'TestTestTest', 'บาท', 'ธนาคารไทยพาณิชย์', 'อิจิโกะคุโรซากิ', 2147483647, '838985626', 'อิจิโกะ', 0, 0),
(30, 2, 'agent01', '2', 'hjklljlhujlh', 2000.00, 0.00, 'yuoip', 'cdc4a43766bedd38cc0ac9a007ef7b5a', 'Y', 'N', '2023-07-16 11:49:30', '2023-07-16 11:49:30', NULL, NULL, 'NEW ALL', 'Bronze', 'jkioujj', 'testtestest', 'บาท', 'ธนาคารไทยพาณิชย์', '1245621244', 2147483647, '1452111414', 'ljljjljljljlj', 0, 0),
(31, 2, 'agent01', '2', 'พีรวัส ขวัญแก้ว', 0.00, 0.00, 'niranamhuitest', '8006d0ab269ea94538b5be36aa74c3c6', 'Y', 'N', '2023-07-18 10:26:17', '2023-07-18 10:26:17', 'null', 'null', 'NEW ALL', 'Bronze', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'พีรวัส ขวัญแก้ว', 2147483647, '0990825942', 'พีรวัส ขวัญแก้ว', 0, 0),
(34, 2, 'agent01', '2', 'จิรกฤต โชคพฤทธิ์กุล', 0.00, 0.00, 'vickytest', 'ef775988943825d2871e1cfa75473ec0', 'Y', 'N', '2023-07-20 10:54:38', '2023-07-20 10:54:38', 'null', 'null', 'NEW ALL', 'Bronze', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'จิรกฤต โชคพฤทธิ์กุล', 1111111111, '0954789782', 'จิรกฤต โชคพฤทธิ์กุล', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `percentgame`
--

CREATE TABLE `percentgame` (
  `id` bigint NOT NULL,
  `subagent_id` bigint DEFAULT NULL,
  `gamename` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL,
  `img` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hold_percentage` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0%',
  `our_percentage` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0%',
  `monthly_total` float(15,2) DEFAULT '0.00',
  `monthly` date DEFAULT NULL,
  `status_game` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `percentgame`
--

INSERT INTO `percentgame` (`id`, `subagent_id`, `gamename`, `img`, `hold_percentage`, `our_percentage`, `monthly_total`, `monthly`, `status_game`) VALUES
(1, 2, 'Go Gold Planet', '/img/thumbs/icontest1.png', '60%', '30%', 3000.00, '2023-05-30', 'Y'),
(2, 2, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '60%', '30%', 15230.00, '2023-05-30', 'N'),
(3, 2, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-30', 'Y'),
(4, 1, 'Go Gold Planet', '/img/thumbs/icontest1.png', '6%', '84%', 3000.00, '2023-05-31', 'Y'),
(5, 1, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '5%', '85%', 15230.00, '2023-05-31', 'Y'),
(6, 1, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '8%', '82%', 4230.00, '2023-05-31', 'Y'),
(7, 3, 'Go Gold Planet', '/img/thumbs/icontest1.png', '23%', '67%', 3000.00, '2023-05-31', 'Y'),
(8, 3, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '11%', '79%', 15230.00, '2023-05-31', 'Y'),
(9, 3, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '80%', '10%', 4230.00, '2023-05-31', 'Y'),
(10, 4, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(11, 4, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(12, 4, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(13, 5, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(14, 5, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'N'),
(15, 5, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(16, 6, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(17, 6, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(18, 6, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(19, 7, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(20, 7, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(21, 7, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(22, 8, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(23, 8, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(24, 8, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(25, 9, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(26, 9, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(27, 9, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(28, 10, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(29, 10, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(30, 10, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(31, 11, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 3000.00, '2023-05-31', 'Y'),
(32, 11, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 15230.00, '2023-05-31', 'Y'),
(33, 11, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '60%', '30%', 4230.00, '2023-05-31', 'Y'),
(34, 12, 'Go Gold Planet', '/img/thumbs/icontest1.png', '33%', '57%', 0.00, '2023-06-01', 'Y'),
(35, 12, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '40%', '50%', 0.00, '2023-06-01', 'Y'),
(36, 12, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '50%', '40%', 0.00, '2023-06-01', 'Y'),
(37, 14, 'Go Gold Planet', '/img/thumbs/icontest1.png', '3%', '87%', 0.00, '2023-06-01', 'Y'),
(38, 14, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '1%', '89%', 0.00, '2023-06-01', 'Y'),
(39, 14, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '12%', '78%', 0.00, '2023-06-01', 'Y'),
(40, 15, 'Go Gold Planet', '/img/thumbs/icontest1.png', '40%', '50%', 0.00, '2023-06-01', 'Y'),
(41, 15, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '50%', '40%', 0.00, '2023-06-01', 'Y'),
(42, 15, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '55%', '35%', 0.00, '2023-06-01', 'Y'),
(43, 16, 'Go Gold Planet', '/img/thumbs/icontest1.png', '36%', '54%', 0.00, '2023-06-01', 'Y'),
(44, 16, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '43%', '47%', 0.00, '2023-06-01', 'Y'),
(45, 16, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '22%', '68%', 0.00, '2023-06-01', 'Y'),
(46, 17, 'Go Gold Planet', '/img/thumbs/icontest1.png', '22%', '68%', 0.00, '2023-06-01', 'Y'),
(47, 17, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '24%', '66%', 0.00, '2023-06-01', 'Y'),
(48, 17, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '31%', '59%', 0.00, '2023-06-01', 'Y'),
(49, 18, 'Go Gold Planet', '/img/thumbs/icontest1.png', '54%', '36%', 0.00, '2023-06-01', 'Y'),
(50, 18, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '30%', '60%', 0.00, '2023-06-01', 'Y'),
(51, 18, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '58%', '32%', 0.00, '2023-06-01', 'Y'),
(52, 19, 'Go Gold Planet', '/img/thumbs/icontest1.png', '54%', '36%', 0.00, '2023-06-01', 'Y'),
(53, 19, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '30%', '60%', 0.00, '2023-06-01', 'Y'),
(54, 19, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '58%', '32%', 0.00, '2023-06-01', 'Y'),
(55, 20, 'Go Gold Planet', '/img/thumbs/icontest1.png', '54%', '36%', 0.00, '2023-06-01', 'Y'),
(56, 20, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '30%', '60%', 0.00, '2023-06-01', 'Y'),
(57, 20, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '58%', '32%', 0.00, '2023-06-01', 'Y'),
(58, 21, 'Go Gold Planet', '/img/thumbs/icontest1.png', '50%', '40%', 0.00, '2023-06-02', 'Y'),
(59, 21, 'Lucky Bunny Gold', '/img/thumbs/icontest2.png', '50%', '40%', 0.00, '2023-06-02', 'Y'),
(60, 21, 'CowBoys VS Aliens', '/img/thumbs/icontest3.png', '50%', '40%', 0.00, '2023-06-02', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `subagent`
--

CREATE TABLE `subagent` (
  `id` bigint NOT NULL,
  `id_agent` bigint DEFAULT NULL,
  `ranksubAgent` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Agent',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `level` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'VVIP',
  `bettype` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '-',
  `responsibleperson` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '-',
  `created_at` timestamp NULL DEFAULT NULL,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Y',
  `creditsub` float(15,2) DEFAULT '0.00',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'N',
  `currencysubagent` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'บาท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subagent`
--

INSERT INTO `subagent` (`id`, `id_agent`, `ranksubAgent`, `username`, `password`, `name`, `contact_number`, `level`, `bettype`, `responsibleperson`, `created_at`, `last_login_date`, `last_login_ip`, `status`, `creditsub`, `status_delete`, `currencysubagent`) VALUES
(1, 1, 'Agent', 'subAgent01', '$2a$12$RNKvumGUJIeCnSjIssB8W.WYSWFzD7gwAXTSbRWrjE0LhLL6DoliS', 'hui007', '0990850209', 'VVIP', '-', '-', '2023-05-18 13:22:43', NULL, NULL, 'Y', 1000.00, 'N', 'บาท'),
(2, 2, 'Agent', 'subAgent02', '$2a$12$3TPuPaalyY5bFa.9TzPmYuVDwJbxlKvnbPUnHGOsXn7JrFJMCH6yu', 'hui04', '0838985628', 'VIP', '-', '-', '2023-05-19 07:57:01', NULL, NULL, 'Y', 35000.00, 'N', 'บาท'),
(3, 2, 'Agent', 'subAgent03', '$2a$12$TuAj5jOomr51yFjz6b52Fu2m4a.BxMgsmbqFqbpqlUHuU0Cu9T3X2', 'titan', '0897231865', 'VIP', '-', '-', '2023-05-19 13:09:06', NULL, NULL, 'Y', 300.00, 'N', 'บาท'),
(4, 1, 'Agent', 'SubAgentHui', '$2a$12$SDoEUude4tkzs4vCCLaIxehgU.LxAhHjHteo1M5Yo0vJNlU3DwkwG', 'NiranamHui', '0943169915', 'VVIP', '-', '-', '2023-05-24 15:02:52', NULL, NULL, 'Y', 600000.00, 'N', 'บาท'),
(5, 2, 'Reseller', 'KiritoSan', '$2a$12$qsHomIpiwmi2NB3osdqIluLKi6e0LH9bglyEstrIO87jUCZvTZkUm', 'asunayugi', '0990850246', 'VIP', '-', '-', '2023-05-24 15:08:01', NULL, NULL, 'Y', 600000.00, 'N', 'บาท'),
(6, 1, 'Agent', 'tyjghfhfghtfh', '$2a$12$1iYQAgZrDRwOLcUkFYsMsepO.U35alqGtx4FPoJ.iP1aQBRgyeM6a', 'Bodyslam', '0998542263', 'VIP', '-', '-', '2023-05-24 15:10:37', NULL, NULL, 'Y', 562222.00, 'N', 'บาท'),
(7, 1, 'Reseller', 'Ultraman', '$2a$12$G8Furw2tJGptIM8PdgoFyujOPILKL26qf0XkjccZgHLdsT.UG7YBy', 'Trigger', '0838985628', 'VVIP', '-', '-', '2023-05-24 15:13:43', NULL, NULL, 'Y', 42000.00, 'N', 'บาท'),
(8, 2, 'Agent', 'Supernova', '$2a$12$Du9EiKFnDYplQg2u07llKerficQUXGT96j19BHxAz0awGlJgaM.me', 'Kiba', '0838985624', 'Stater', '-', '-', '2023-05-24 18:52:15', NULL, NULL, 'Y', 56556.00, 'N', 'บาท'),
(9, 2, 'Agent', 'SupernovaMusic', '$2a$12$1lgDtd5ZmSySX0kpUkO1LOtK9SE9sdGVlj2MHHelXomhjzE5MO8oq', 'Kiba', '0838985624', 'Stater', '-', '-', '2023-05-24 18:54:51', NULL, NULL, 'Y', 56556.00, 'N', 'บาท'),
(10, 2, 'Agent', 'TaroUltraman', '$2a$12$GzxZIyRu56u8r4BkMH/LU.w96lcSGkNN6wXdgzA.cdqwzHoiTy1Fa', 'Taro', '0838985626', 'VIP', '-', '-', '2023-06-01 12:53:32', NULL, NULL, 'Y', 30000.00, 'N', 'บาท'),
(11, 2, 'Agent', 'TheFlash', '$2a$12$Dcs7qA2fVfl3oVS339vhpu6.XyMm3QM7Gyzlyz6aIiy/vOmTSjY9m', 'Flash', '0990850246', 'VIP', '-', '-', '2023-06-01 13:01:07', NULL, NULL, 'Y', 5000.00, 'N', 'บาท'),
(12, 2, 'Reseller', 'KingOrange', '$2a$12$zDUiBYErK8NH/.ZfmlaAO.86J1eeZl3STrCutODy2AVHN8ZcdADPW', 'King', '0998542263', 'Starter', '-', '-', '2023-06-01 13:07:08', NULL, NULL, 'Y', 60000.00, 'N', 'บาท'),
(13, 2, 'Agent', 'ghghghghg', '$2a$12$DQj9SaPKPreHpoy7yGSJL.IGfnsW2nRs.UWRqvXoNuqVZNNAP3bMi', 'kjkjkj', '0998542263', 'VVIP', '-', '-', '2023-06-01 13:14:22', NULL, NULL, 'Y', 3000.00, 'N', 'บาท'),
(14, 2, 'Agent', 'yhjhyjyjy', '$2a$12$9kh.WHVI0ugSNeokjTO7PeL9OIduEv4kpsw0h8O9fQutOUgP7Yz4S', 'huioo', '0838985626', 'Starter', '-', '-', '2023-06-01 13:14:22', NULL, NULL, 'Y', 50000.00, 'N', 'บาท'),
(15, 2, 'Agent', 'Ironmansaves', '$2a$12$2kBVKce.W1H6A/MzchX7z.dJ2iYsvHpymR1my4kx/7GTGzQSySoBe', 'ironman', '0897231865', 'VVIP', '-', '-', '2023-06-01 13:22:08', NULL, NULL, 'Y', 9999.00, 'N', 'บาท'),
(16, 2, 'Agent', 'Lomosonic', '$2a$12$td/Yd/EivI4/Htm/3rLzH.hj2HNkSFehPfNYkldZruz2WRM1Hzp66', 'Jetset', '0897231865', 'VIP', '-', '-', '2023-06-01 14:58:55', NULL, NULL, 'Y', 6000.00, 'N', 'บาท'),
(17, 2, 'Agent', 'OmenAcer', '$2a$12$Jv4YYiJq7EZ1Iyb.16MVc.9Mm6tBA4tn5mNnThPqc1Jf39A239cSG', 'Omen', '0838985626', 'VIP', '-', '-', '2023-06-01 15:03:26', NULL, NULL, 'Y', 60000.00, 'N', 'บาท'),
(18, 2, 'Agent', 'SamsungS1', '$2a$12$DBIW.vBbjMrQtNOxgY/M..hOTP90RoMbOd/atymMjL/ByX33lybrG', 'Samsung', '0990850246', 'VVIP', '-', '-', '2023-06-01 15:06:45', NULL, NULL, 'Y', 80000.00, 'N', 'บาท'),
(19, 1, 'Agent', 'RiderAamazons', '$2a$12$hKsEtGZ63GivHRDaD.pn/O2uMZCo0DXMHXHUHMkbhGzBBYlLuf1Y.', 'Aamazons', '0838985621', 'VIP', '-', '-', '2023-06-01 18:44:35', NULL, NULL, 'Y', 3000.00, 'N', 'บาท'),
(20, 1, 'Agent', 'niranam61106506', '$2a$12$RRq3/WydnJw0xL6syAaOwubhm.PHeq2TN6qSQl2epPaewvF/DZt2C', 'NiranamHui', '0990825942', 'VIP', '-', '-', '2023-06-01 18:48:31', NULL, NULL, 'Y', 100000.00, 'N', 'บาท'),
(21, 6, 'Agent', 'BladeBrave', '$2a$12$ODWJKEMS0oC.5GTXCQDEK.EPLiNe2AtONCtpsmYFK1KgH8B4ybK.q', 'Blade', '0897231865', 'VIP', '-', '-', '2023-06-01 18:57:09', NULL, NULL, 'Y', 60000.00, 'N', 'บาท');

-- --------------------------------------------------------

--
-- Table structure for table `user_play`
--

CREATE TABLE `user_play` (
  `id` bigint NOT NULL,
  `member_id` bigint DEFAULT '0',
  `game_id` bigint DEFAULT '0',
  `bet` float(16,2) DEFAULT '0.00',
  `win` float(16,2) DEFAULT '0.00',
  `tiles` longtext COLLATE utf8mb3_unicode_ci,
  `winline` longtext COLLATE utf8mb3_unicode_ci,
  `winstyle` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `winCount` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `get_browser` longtext COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `game_Buyfeespin` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'false',
  `game_feespin` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_play`
--

INSERT INTO `user_play` (`id`, `member_id`, `game_id`, `bet`, `win`, `tiles`, `winline`, `winstyle`, `winCount`, `credit`, `get_browser`, `created_at`, `game_Buyfeespin`, `game_feespin`) VALUES
(1, 1, 2, 10.00, 0.00, '10,1,4,9,4,11,2,7,0,0,6,3,8,5,5', '', NULL, NULL, 9292.01, NULL, '2023-05-17 11:10:46', 'false', 'false'),
(2, 1, 2, 10.00, 33.33, '8,0,10,9,6,4,6,2,6,3,6,4,9,0,6', '3,4,11,12,19,20', NULL, NULL, 9325.34, NULL, '2023-05-17 11:10:46', 'false', 'false'),
(3, 1, 2, 10.00, 0.00, '4,0,5,8,0,5,9,10,7,10,5,6,11,1,5', '', NULL, NULL, 9325.34, NULL, '2023-05-17 11:10:46', 'false', 'false'),
(1065, 1, 3, 9.00, 4.50, '5,12,6,2,9,10,0,5,3,12,3,3,4,11,9', '7,12,28', 'right3,right3,right3', '3', 10523.10, NULL, '2023-07-18 07:20:30', 'false', 'false'),
(1066, 1, 3, 9.00, 0.00, '2,0,8,6,10,6,1,8,9,2,0,4,6,9,8', '', '', '0', 10514.10, NULL, '2023-07-21 03:04:50', 'false', 'false'),
(1067, 1, 3, 9.00, 0.00, '1,10,6,0,6,10,2,1,0,6,9,6,9,7,5', '', '', '0', 10505.10, NULL, '2023-07-21 03:29:33', 'false', 'false'),
(1068, 1, 3, 9.00, 1.80, '7,5,1,1,0,9,2,1,1,5,1,1,8,5,9', '18,22', 'left3,left3', '2', 10497.90, NULL, '2023-07-21 03:29:38', 'false', 'false'),
(1069, 1, 3, 9.00, 0.00, '2,4,0,5,9,8,9,4,2,0,4,2,6,5,5', '', '', '0', 10488.90, NULL, '2023-07-21 04:09:33', 'false', 'false'),
(1070, 1, 3, 9.00, 4.50, '6,0,10,10,9,0,1,4,4,6,4,0,4,5,10', '3,9,29', 'right3,right3,right3', '3', 10484.40, NULL, '2023-07-21 04:09:38', 'false', 'false'),
(1071, 1, 3, 9.00, 0.00, '3,9,11,0,9,10,2,3,4,5,8,8,9,11,6', '', '', '0', 10475.40, NULL, '2023-07-21 04:09:43', 'false', 'false'),
(1072, 1, 3, 9.00, 1.50, '9,5,0,9,2,8,4,5,3,1,3,6,0,3,4', '12', 'right3', '1', 10467.90, NULL, '2023-07-21 04:09:46', 'false', 'false'),
(1073, 1, 3, 9.00, 0.00, '7,0,4,5,10,4,2,0,10,1,5,1,3,6,1', '', '', '0', 10458.90, NULL, '2023-07-21 04:09:51', 'false', 'false'),
(1074, 1, 3, 9.00, 3.00, '4,10,9,0,4,3,4,8,4,8,1,5,5,5,3', '3,19', 'left3,left3', '2', 10452.90, NULL, '2023-07-21 04:09:54', 'false', 'false'),
(1075, 1, 3, 9.00, 0.00, '1,3,0,4,5,2,5,8,4,5,6,1,10,8,4', '', '', '0', 10443.90, NULL, '2023-07-21 04:10:07', 'false', 'false'),
(1076, 1, 3, 9.00, 0.00, '8,12,3,2,4,7,10,1,2,1,5,6,8,7,7', '', '', '0', 10434.90, NULL, '2023-07-21 04:10:10', 'false', 'false'),
(1077, 1, 3, 9.00, 1.50, '6,7,7,2,4,4,3,5,4,5,1,1,7,8,5', '22', 'right3', '1', 10427.40, NULL, '2023-07-21 04:10:13', 'false', 'false'),
(1078, 1, 3, 9.00, 0.00, '6,3,0,5,0,6,3,5,10,3,2,6,4,6,9', '', '', '0', 10418.40, NULL, '2023-07-21 07:10:13', 'false', 'false'),
(1079, 1, 3, 9.00, 0.00, '1,2,8,0,6,10,5,3,10,4,7,9,5,6,10', '', '', '0', 10409.40, NULL, '2023-07-21 07:10:18', 'false', 'false'),
(1080, 1, 3, 9.00, 2.70, '8,10,5,2,3,0,0,8,5,3,2,0,1,9,3', '17,24,26', 'middle3,middle3,middle3', '3', 10403.10, NULL, '2023-07-21 07:10:21', 'false', 'false'),
(1081, 1, 3, 9.00, 0.00, '3,9,0,6,5,5,7,3,6,5,8,12,0,6,5', '', '', '0', 10394.10, NULL, '2023-07-21 07:10:30', 'false', 'false'),
(1082, 1, 3, 9.00, 0.00, '0,0,5,1,9,1,2,8,1,12,4,2,9,10,8', '', '', '0', 10385.10, NULL, '2023-07-21 07:10:32', 'false', 'false'),
(1083, 1, 3, 9.00, 0.00, '3,4,10,7,2,0,12,2,0,10,5,1,6,8,4', '', '', '0', 10376.10, NULL, '2023-07-21 07:10:34', 'false', 'false'),
(1084, 1, 3, 9.00, 4.50, '2,7,4,5,9,7,8,0,4,5,8,5,11,10,9', '19', 'right3', '1', 10371.60, NULL, '2023-07-21 07:10:38', 'false', 'false'),
(1085, 1, 3, 9.00, 0.00, '5,0,3,6,9,1,5,4,6,0,10,7,5,9,8', '', '', '0', 10362.60, NULL, '2023-07-21 07:14:58', 'false', 'false'),
(1086, 1, 3, 9.00, 4.50, '8,6,6,1,8,3,7,5,11,5,1,2,9,8,8', '3', 'left3', '1', 10358.10, NULL, '2023-07-21 07:15:01', 'false', 'false'),
(1087, 1, 3, 9.00, 0.00, '3,10,6,6,4,4,0,7,0,4,5,1,10,7,4', '', '', '0', 10349.10, NULL, '2023-07-21 07:15:04', 'false', 'false'),
(1088, 1, 3, 9.00, 0.00, '1,4,3,5,5,8,12,8,7,5,5,5,6,6,8', '', '', '0', 10340.10, NULL, '2023-07-21 07:15:09', 'false', 'false'),
(1089, 1, 3, 9.00, 6.00, '2,9,0,0,9,3,8,2,2,2,3,11,5,9,2', '2,6,18,22', 'right3,right3,right3,right3', '4', 10337.10, NULL, '2023-07-21 07:15:14', 'false', 'false'),
(1090, 1, 1, 9.00, 0.00, '1,12,6,5,10,4,4,4,3,12,1,0,0,6,11', '', '', '0', 10328.10, NULL, '2023-07-22 17:53:13', 'false', 'false'),
(1091, 1, 1, 9.00, 0.00, '1,1,9,3,7,5,0,7,12,6,3,3,5,2,7', '', '', '0', 10319.10, NULL, '2023-07-22 17:53:17', 'false', 'false'),
(1092, 1, 1, 9.00, 0.00, '5,8,8,1,1,5,0,8,2,2,5,10,3,4,1', '', '', '0', 10310.10, NULL, '2023-07-22 17:53:20', 'false', 'false'),
(1093, 1, 1, 9.00, 10.50, '10,2,8,2,2,12,7,2,6,2,3,7,0,1,5', '0,5,15,22,29', 'left3,middle3,left4,middle3,left3', '5', 10311.60, NULL, '2023-07-22 17:53:24', 'false', 'false'),
(1094, 1, 1, 9.00, 0.00, '3,5,5,4,2,4,9,2,1,6,1,2,4,3,5', '', '', '0', 10302.60, NULL, '2023-07-22 17:53:31', 'false', 'false'),
(1095, 1, 1, 9.00, 6.00, '11,3,2,6,12,2,6,0,1,3,5,4,10,5,6', '1,27', 'left3,left3', '2', 10299.60, NULL, '2023-07-22 17:53:34', 'false', 'false'),
(1096, 1, 1, 9.00, 0.00, '12,10,7,2,9,5,2,7,2,5,1,0,8,9,10', '', '', '0', 10290.60, NULL, '2023-07-22 17:53:41', 'false', 'false'),
(1097, 1, 1, 9.00, 0.00, '3,3,10,7,0,6,5,0,5,8,10,0,5,5,4', '', '', '0', 10281.60, NULL, '2023-07-22 17:53:44', 'false', 'false'),
(1098, 1, 1, 9.00, 0.90, '5,3,4,9,4,3,0,6,7,3,8,0,11,6,7', '17', 'right3', '1', 10273.50, NULL, '2023-07-22 17:53:48', 'false', 'false'),
(1099, 1, 3, 9.00, 0.00, '9,9,5,5,5,3,8,12,9,2,2,7,5,4,1', '', '', '0', 10264.50, NULL, '2023-07-23 05:34:48', 'false', 'false'),
(1100, 1, 3, 9.00, 0.00, '9,4,8,0,12,0,8,7,9,12,8,1,5,2,3', '', '', '0', 10255.50, NULL, '2023-07-23 05:35:03', 'false', 'false'),
(1101, 1, 3, 9.00, 0.00, '6,10,5,0,5,2,3,0,3,5,1,7,5,5,7', '', '', '0', 10246.50, NULL, '2023-07-23 05:36:35', 'false', 'false'),
(1102, 1, 3, 9.00, 0.00, '3,8,0,5,1,4,10,1,3,6,9,5,4,11,6', '', '', '0', 10237.50, NULL, '2023-07-23 05:36:39', 'false', 'false'),
(1103, 1, 3, 9.00, 0.00, '5,9,0,0,4,5,3,7,8,1,4,8,5,4,0', '', '', '0', 10228.50, NULL, '2023-07-23 06:19:50', 'false', 'false'),
(1104, 1, 3, 9.00, 6.00, '9,3,8,12,6,5,2,8,5,4,3,5,6,1,7', '2,7,13,28', 'middle3,middle3,middle3,middle3', '4', 10225.50, NULL, '2023-07-23 06:19:54', 'false', 'false'),
(1105, 1, 3, 9.00, 0.00, '12,8,10,5,1,0,8,3,5,3,4,2,6,1,10', '', '', '0', 10216.50, NULL, '2023-07-23 06:20:19', 'false', 'false'),
(1106, 1, 3, 9.00, 0.00, '5,7,0,2,12,1,0,1,3,5,9,0,5,4,5', '', '', '0', 10207.50, NULL, '2023-07-23 06:20:24', 'false', 'false'),
(1107, 1, 3, 9.00, 1.50, '1,9,10,3,4,0,4,3,8,4,5,12,4,5,12', '1', 'right3', '1', 10200.00, NULL, '2023-07-23 06:20:27', 'false', 'false'),
(1108, 1, 3, 9.00, 0.00, '8,7,10,3,7,9,5,9,1,10,3,0,0,5,5', '', '', '0', 10191.00, NULL, '2023-07-23 06:20:45', 'false', 'false'),
(1109, 1, 3, 9.00, 12.00, '8,5,0,9,4,4,11,9,1,8,11,7,8,3,2', '1,4,11,19', 'right3,middle3,middle3,right3', '4', 10194.00, NULL, '2023-07-23 06:20:47', 'false', 'false'),
(1110, 1, 3, 9.00, 0.90, '5,0,10,1,12,4,3,0,3,0,1,4,7,12,11', '22', 'right3', '1', 10185.90, NULL, '2023-07-23 06:20:57', 'false', 'false'),
(1111, 1, 3, 9.00, 0.00, '2,6,2,6,3,5,5,3,0,12,0,1,2,8,10', '', '', '0', 10176.90, NULL, '2023-07-23 06:21:14', 'false', 'false'),
(1112, 1, 3, 9.00, 4.50, '12,2,4,5,2,5,3,2,2,5,9,0,1,5,10', '0,12,29', 'left3,left3,left3', '3', 10172.40, NULL, '2023-07-23 06:21:16', 'false', 'false'),
(1113, 1, 3, 9.00, 0.00, '4,5,2,9,4,8,7,1,2,8,5,2,8,3,5', '', '', '0', 10163.40, NULL, '2023-07-23 06:21:33', 'false', 'false'),
(1114, 1, 3, 9.00, 21.00, '2,7,3,0,0,11,6,10,3,10,0,6,11,12,4', '2,5,17,24,26,28', 'left3,right3,right4,middle3,middle3,left3', '6', 10175.40, NULL, '2023-07-23 06:21:37', 'false', 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allgame`
--
ALTER TABLE `allgame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comgogoldplanet`
--
ALTER TABLE `comgogoldplanet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissionsubagent`
--
ALTER TABLE `commissionsubagent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creditpromotion`
--
ALTER TABLE `creditpromotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gameweb`
--
ALTER TABLE `gameweb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imgpromotion`
--
ALTER TABLE `imgpromotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logdaygame`
--
ALTER TABLE `logdaygame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logedit`
--
ALTER TABLE `logedit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logeditadmin`
--
ALTER TABLE `logeditadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logeditagent`
--
ALTER TABLE `logeditagent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logfinanceuser`
--
ALTER TABLE `logfinanceuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loggame`
--
ALTER TABLE `loggame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `percentgame`
--
ALTER TABLE `percentgame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subagent`
--
ALTER TABLE `subagent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_play`
--
ALTER TABLE `user_play`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `allgame`
--
ALTER TABLE `allgame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comgogoldplanet`
--
ALTER TABLE `comgogoldplanet`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `commissionsubagent`
--
ALTER TABLE `commissionsubagent`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `creditpromotion`
--
ALTER TABLE `creditpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gameweb`
--
ALTER TABLE `gameweb`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `imgpromotion`
--
ALTER TABLE `imgpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logdaygame`
--
ALTER TABLE `logdaygame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `logedit`
--
ALTER TABLE `logedit`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `logeditadmin`
--
ALTER TABLE `logeditadmin`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logeditagent`
--
ALTER TABLE `logeditagent`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `logfinanceuser`
--
ALTER TABLE `logfinanceuser`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loggame`
--
ALTER TABLE `loggame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `percentgame`
--
ALTER TABLE `percentgame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `subagent`
--
ALTER TABLE `subagent`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_play`
--
ALTER TABLE `user_play`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1115;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
