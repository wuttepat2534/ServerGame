-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 26, 2023 at 11:45 AM
-- Server version: 8.0.34
-- PHP Version: 8.2.8

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
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `datetime_lastlogin` datetime DEFAULT NULL,
  `get_browser` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
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
  `website_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `commission` float(15,2) DEFAULT '0.00',
  `tpye` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'agent',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `website_name`, `name`, `username`, `password`, `status`, `status_delete`, `created_at`, `updated_at`, `contact_number`, `credit`, `commission`, `tpye`, `role`) VALUES
(1, NULL, 'agent001', 'agent111', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-18 10:01:41', '2023-04-18 10:01:41', '0778569255', 40000.00, 300.00, 'agent', NULL),
(2, NULL, 'agent002', 'agent01', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-18 10:09:44', '2023-04-18 10:09:44', '0778888888', 10000.00, 200.00, 'agent', NULL),
(3, NULL, 'undefined', 'agent03', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'Y', '2023-04-18 10:09:50', '2023-04-18 10:09:50', '0452342377', 30000.00, 0.00, 'agent', NULL),
(4, NULL, 'agent04', 'agent04', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:05', '2023-04-20 10:50:05', '0883569875', 30254.00, 0.00, 'agent', NULL),
(5, NULL, 'Bookiezz', 'agent05', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:11', '2023-04-20 10:50:11', '0545453333', 300000.00, 0.00, 'agent', NULL),
(6, NULL, 'undefined', 'agent05', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:20', '2023-04-20 10:50:20', '0990825941', 40000.00, 300.00, 'agent', NULL),
(7, NULL, 'agent055', 'agent055', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:27', '2023-04-20 10:50:27', '0943169915', 4500.00, 2055.00, 'agent', NULL),
(8, NULL, 'agent066', 'agent066', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:35', '2023-04-20 10:50:35', NULL, 0.00, 1000.00, 'agent', NULL),
(9, NULL, 'agent07', 'agent07', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:42', '2023-04-20 10:50:42', NULL, 0.00, 0.00, 'agent', NULL),
(10, NULL, 'agent11', 'agent11', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:50:49', '2023-04-20 10:50:49', NULL, 0.00, 700.00, 'agent', NULL),
(11, NULL, 'agent12', 'agent12', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:04', '2023-04-20 10:51:04', NULL, 0.00, 0.00, 'agent', NULL),
(12, NULL, 'agent14', 'agent14', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:11', '2023-04-20 10:51:11', NULL, 0.00, 0.00, 'agent', NULL),
(13, NULL, 'agent111', 'agent111', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-20 10:51:19', '2023-04-20 10:51:19', NULL, 0.00, 0.00, 'agent', NULL),
(14, NULL, 'agent0234', 'agent0234', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 06:06:45', '2023-04-26 06:06:45', '0990854415', 50004.00, 0.00, 'agent', NULL),
(15, NULL, 'fgdgdgd', 'dgdgdgd', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 06:08:52', '2023-04-26 06:08:52', '0555555555', 0.00, 250.00, 'agent', NULL),
(16, NULL, 'GGagent01', 'GGagent01', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-04-26 08:12:31', '2023-04-26 08:12:31', '0990825964', 15000.00, 0.00, 'agent', NULL),
(17, NULL, 'OstArifureta', 'ffffffff', '$2a$12$lOTfpiqpS4UUw4OUD970seeZ0EfVWtQk/yYM0FBwqMx3zJzwfD1nC', 'Y', 'N', '2023-05-19 07:24:57', '2023-05-19 07:24:57', '0998542263', 5020.00, 0.00, 'agent', NULL),
(18, NULL, 'Ginga', 'UltramanGinga', '$2a$12$3GUX8XgasDzSwn/GtopoheRNkUb6QQMnG8pgNnA4C1xQ/6QQsH.hK', 'Y', 'N', '2023-05-24 16:39:20', '2023-05-24 16:39:20', '0838985624', 52300.00, 0.00, 'agent', NULL);

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
(1, 'Go Gold Planet', 'https://websitehui.s3.ap-southeast-1.amazonaws.com/new_size/size_tall/size_square/icon_3.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_GoGoldPlanet/index.html'),
(2, 'Lucky Bunny Gold', 'https://websitehui.s3.ap-southeast-1.amazonaws.com/new_size/size_tall/size_square/icon_2.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_LuckyBunnyGold/index.html'),
(3, 'CowBoys VS Aliens', 'https://websitehui.s3.ap-southeast-1.amazonaws.com/new_size/size_tall/size_square/icon_1.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_CowboyVSAlien/index.html'),
(4, 'Buunty Balloon', 'https://websitehui.s3.ap-southeast-1.amazonaws.com/new_size/size_tall/size_square/icon_5.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_BountyBalloon/index.html'),
(6, 'RoBo Farm', 'https://websitehui.s3.ap-southeast-1.amazonaws.com/new_size/size_tall/size_square/icon_4.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_RoboFarm/index.html'),
(7, 'Tower Rush', 'https://websitehui.s3.ap-southeast-1.amazonaws.com/new_size/size_tall/size_square/icon_06_1.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_TowerRush/index.html');

-- --------------------------------------------------------

--
-- Table structure for table `banknames`
--

CREATE TABLE `banknames` (
  `id` bigint UNSIGNED NOT NULL,
  `bankname_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bankname_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `banknames`
--

INSERT INTO `banknames` (`id`, `bankname_code`, `bankname_name`, `images`, `status`, `status_delete`, `created_at`, `updated_at`) VALUES
(1, 'BBL', 'ธนาคารกรุงเทพ', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-bbl.png', 'Y', 'N', '2022-01-04 08:54:54', '2023-05-05 14:04:29'),
(2, 'KBANK', 'ธนาคารกสิกรไทย', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-kbank.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(3, 'SCB', 'ธนาคารไทยพาณิชย์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(4, 'BAY', 'ธนาคารกรุงศรีอยุธยา', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-bay.png', 'Y', 'N', '2022-01-04 08:54:54', '2023-05-05 12:19:41'),
(5, 'KTB', 'ธนาคารกรุงไทย', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-ktb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(6, 'TMB', 'ทหารไทย', '6.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(7, 'KKP', 'ธนาคารเกียรตินาคินภัทร', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-kk.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(8, 'CIMB', 'ธนาคารซีไอเอ็มบีไทย', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-cimb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(9, 'TISCO', 'ธนาคารทิสโก้', '9.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(10, 'TBANK', 'ธนาคารทหารไทยธนชาต', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-ttb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(11, 'LHBANK', 'แลนด์ แอนด์ เฮ้าส์', '11.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(12, 'UOB', 'ธนาคารยูโอบี', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.uob.co.th%2Fpersonal%2Findex.page&psig=AOvVaw2KddkKwBRjVK_cWM1YgvvI&ust=1690280164670000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMDwyriOp4ADFQAAAAAdAAAAABAE', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(13, 'STAN', 'สแตนดาร์ดชาร์เตอร์ด', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-sc.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(14, 'ICBC', 'ธนาคารไอซีบีซี (ไทย)', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-cimb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(15, 'GSB', 'ธนาคารออมสิน', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-gsb.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(16, 'GHBANK', 'ธนาคารอาคารสงเคราะห์', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-baac.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54'),
(17, 'IBANK', 'อิสลามแห่งประเทศไทย', '17.png', 'Y', 'N', '2022-01-04 08:54:54', '2022-01-04 08:54:54');

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
  `win_aliens` decimal(15,2) DEFAULT '0.00',
  `commission` float(15,2) DEFAULT '0.00',
  `day` date DEFAULT NULL,
  `monthly` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comgogoldplanet`
--

INSERT INTO `comgogoldplanet` (`id`, `bet_gogold`, `win_gogold`, `bet_luckybunny`, `win_luckybunny`, `bet_aliens`, `win_aliens`, `commission`, `day`, `monthly`) VALUES
(20, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-23', '2023-10-23'),
(21, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-10-24', '2023-10-24');

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
  `repost` enum('ทั่วไป','อีเวนท์') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'ทั่วไป',
  `startpromotion` date NOT NULL,
  `endpromotion` date NOT NULL,
  `typebonus` enum('Percent','Fixed rate') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Percent',
  `bunus` float(15,2) NOT NULL DEFAULT '0.00',
  `maxbunus` float(15,2) NOT NULL,
  `valusbunus` float(15,2) NOT NULL,
  `groupuser` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `afterPromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `receiving_data_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `valus_receiving` int NOT NULL,
  `data_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `valus_day` int NOT NULL,
  `numberoftimes_person` int NOT NULL,
  `ipAddress_attempts` int NOT NULL,
  `reset` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci NOT NULL,
  `withdrawalType` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `withdraw_data_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'ไม่มี',
  `withdraw_max` float(15,2) NOT NULL DEFAULT '1.00',
  `withdraw_valus` int NOT NULL DEFAULT '0',
  `statuspromotion` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y',
  `promotiontype` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `namepromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `leakedPro` enum('เปอร์เซ็นต์','ค่าคงที่') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'เปอร์เซ็นต์',
  `receiving_data_typeI` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `receiving_data_typeII` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_typeI` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_typeII` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `resetI` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `resetII` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `withdrawalTypeII` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `withdrawalTypeIII` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `withdraw_valusII` int NOT NULL DEFAULT '0',
  `withdraw_valusIII` int NOT NULL DEFAULT '0',
  `status_topup` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `passwordpromotion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `promotionsupport` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `webtype` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `multiplier` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `typelistsuppost` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantityI` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantityII` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creditpromotion`
--

INSERT INTO `creditpromotion` (`id`, `agnetidcreate`, `repost`, `startpromotion`, `endpromotion`, `typebonus`, `bunus`, `maxbunus`, `valusbunus`, `groupuser`, `afterPromotion`, `receiving_data_type`, `valus_receiving`, `data_type`, `valus_day`, `numberoftimes_person`, `ipAddress_attempts`, `reset`, `withdrawalType`, `withdraw_data_type`, `withdraw_max`, `withdraw_valus`, `statuspromotion`, `promotiontype`, `namepromotion`, `leakedPro`, `receiving_data_typeI`, `receiving_data_typeII`, `data_typeI`, `data_typeII`, `resetI`, `resetII`, `withdrawalTypeII`, `withdrawalTypeIII`, `withdraw_valusII`, `withdraw_valusIII`, `status_topup`, `filename`, `details`, `passwordpromotion`, `promotionsupport`, `webtype`, `multiplier`, `typelistsuppost`, `quantity`, `quantityI`, `quantityII`) VALUES
(1, 2, 'ทั่วไป', '2023-10-24', '2023-10-24', 'Percent', 100.00, 500.00, 5.00, '', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'โบนัสต้อนรับสมาชิกใหม่ 100%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 3000, 0, 'N', 'file_dateVal_1698219646822_banner01.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>สำหรับสมาชิกใหม่เท่านั้น</li><li>ฝากขั้นต่ำ 100 บาท จึงจะมีสิทธิ์รับโบนัส</li><li>สมาชิกต้องทำเทิร์น 5 เท่า จึงจะมีสิทธิ์ถอน-</li><li>ถอนสูงสุด 3000 บาท</li><li>ค่ายเกมส์ที่ร่วมรายการ PG Solf , Dogzilla เท่านั้น</li></ul><br>*<span style=\"color: rgb(0, 71, 178);\">หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</span>', 'cost-type-euyfxd', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', NULL, NULL, NULL),
(2, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', '', 'undefined', '', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', '- ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น\n- ฝากขั้นต่ำ 100 \n- โบนัสสูงสุด 300\n- เทิร์นโอเวอร์ 5 เท่า\n- ถอนได้สูงสุด 5,000 บาท\n- โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน\n- ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์\n\nตัวอย่างเทิร์นโอเวอร์ \nเงินฝากครั้งแรก = 300 บาท\nโบนัส = 30% x 300 บาท = 90 บาท\nยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท\n\n*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี! การตัดสินของทีมงานถือเป็นที่สิ้นสุด', 'cost-type-rk0b4f', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(3, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', '', 'undefined', '', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', '- ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น\n- ฝากขั้นต่ำ 100 \n- โบนัสสูงสุด 300\n- เทิร์นโอเวอร์ 5 เท่า\n- ถอนได้สูงสุด 5,000 บาท\n- โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน\n- ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์\n\nตัวอย่างเทิร์นโอเวอร์ \nเงินฝากครั้งแรก = 300 บาท\nโบนัส = 30% x 300 บาท = 90 บาท\nยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท\n\n*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี! การตัดสินของทีมงานถือเป็นที่สิ้นสุด', 'cost-type-rk0b4f', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(4, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', '', 'undefined', '', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', '- ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น\n- ฝากขั้นต่ำ 100 \n- โบนัสสูงสุด 300\n- เทิร์นโอเวอร์ 5 เท่า\n- ถอนได้สูงสุด 5,000 บาท\n- โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน\n- ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์\n\nตัวอย่างเทิร์นโอเวอร์ \nเงินฝากครั้งแรก = 300 บาท\nโบนัส = 30% x 300 บาท = 90 บาท\nยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท\n\n*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี! การตัดสินของทีมงานถือเป็นที่สิ้นสุด', 'cost-type-rk0b4f', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(5, 2, 'ทั่วไป', '2023-10-23', '2023-10-23', 'Percent', 10.00, 100.00, 5.00, '', '', 'ฝาก', 0, 'มากกว่า', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'ทุกยอดฝากรับโบนัส 10%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698219699144_banner02.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla เท่านั้น</li><li>ฝากขั้นต่ำ 100- โบนัสสูงสุด 100</li><li>เทิร์นโอเวอร์ 2 เท่า</li><li>โปรโมชั่นนี้รับได้ทั้งวัน</li><li>ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li></ul><br><span style=\"color: rgb(230, 0, 0);\">ตัวอย่างเทิร์นโอเวอร์</span><ul><li>เงินฝาก = 300 บาทโบนัส = 10% x 300 บาท = 30 บาท</li><li>ยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 30 ) x 2 = 660 บาท</li></ul><br><span style=\"color: rgb(107, 36, 178);\">*หากพบเห็นเจตนาในการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!</span>', 'cost-type-ckr26s', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '2', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', NULL, NULL, NULL),
(6, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', 'null', 'cost-type-co4j', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(7, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', 'null', 'cost-type-co4j', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(8, 2, 'ทั่วไป', '2023-10-20', '2023-10-20', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', 'ถอน', '', 5000, 0, 'N', 'null', 'null', 'cost-type-co4j', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '5', 'undefined', NULL, NULL, NULL),
(9, 2, 'ทั่วไป', '2023-10-23', '2023-10-23', 'Percent', 30.00, 300.00, 5.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'ฝากแรกของวันรับโบนัส 30%', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698219980588_banner03.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>ค่ายเกมส์ที่ร่วมรายการ PG Soft , Dogzilla</li><li>ฝากขั้นต่ำ 100 โบนัสสูงสุด 300</li><li>เทิร์นโอเวอร์ 5 เท่า</li><li>ถอนได้สูงสุด 5,000 บาท</li><li>โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน</li><li>ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li></ul><br><span style=\"color: rgb(230, 0, 0);\">ตัวอย่างเทิร์นโอเวอร์&nbsp;</span><ul><li>เงินฝากครั้งแรก = 300 บาท</li><li>โบนัส = 30% x 300 บาท = 90 บาท</li><li>ยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 300 + โบนัส 90 ) x 5 = 1,950 บาท</li></ul><br><span style=\"color: rgb(0, 102, 204);\">*หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส SANDWIN ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</span>', 'cost-type-bbzfz', 'DOGZILLA,PG Soft', 'game', '5', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', NULL, NULL, NULL),
(10, 2, 'ทั่วไป', '2023-10-23', '2023-10-23', 'Percent', 50.00, 100.00, 5.00, '', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'ค่ายใหม่มาแรง Dogzilla แจก 50%', 'ค่าคงที่', '', '', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698210909715_banner04.jpg', '<span style=\"color: rgb(230, 0, 0);\">เงื่อนไข</span><ul><li>ค่ายเกมส์ที่ร่วมรายการ Dogzilla</li><li>ฝากขั้นต่ำ 100- เทิร์นโอเวอร์ 5 เท่า</li><li>ถอนได้สูงสุด 5,000 บาท</li><li>โปรโมชั่นนี้รับได้ 1 ครั้ง / วัน</li><li>ห้ามซื้อฟรีสปิน ห้ามสะสมฟรีเกมส์</li></ul><br><span style=\"color: rgb(230, 0, 0);\">ตัวอย่างเทิร์นโอเวอร์&nbsp;</span><ul><li>เงินฝากครั้งแรก = 100 บาท</li><li>โบนัส = 50% x 100 บาท = 50 บาท</li><li>ยอดเงินที่ต้องทำการเทิร์นโอเวอร์ = ( เงินฝาก 100 + โบนัส 50 ) x 5 = 750 บาท</li></ul><br>*<span style=\"color: rgb(0, 71, 178);\">หากพบเห็นเจตนาในการล่าโปรโมชั่นหรือการใช้ช่องโหว่ใดๆ เพื่อเอื้อประโยชน์ให้กับผู้เล่นจากการรับเงินโบนัส TOONTA ขอสงวนสิทธิ์ในการระงับการจ่ายเงินและยิดเครดิตทั้งหมด ทุกกรณี!&nbsp;การตัดสินของทีมงานถือเป็นที่สิ้นสุด</span>', 'cost-type-l9it7', 'DOGZILLA,Joker123,PG Soft,Askmebet,Micro Gaming,Spade Gaming,Habanero,Red Tiger,Netent2,Ambslot,Ameba,UPG Slot,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Simple Play,Live22', 'game', '3', 'DOGZILLA', NULL, NULL, NULL),
(11, 2, 'ทั่วไป', '2023-10-24', '2023-10-24', 'Percent', 20.00, 100.00, 100.00, '', '', 'รายวัน', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'N', 'ฝาก', 'testesttesttetstest', 'เปอร์เซ็นต์', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1698122647698_banner4.jpg', 'undefined', 'cost-type-uvdvup', 'Micro Gaming,Simple Play,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '3', 'undefined', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `depositaccount`
--

CREATE TABLE `depositaccount` (
  `id` bigint NOT NULL,
  `bankName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ธนาคารไทยพาณิชย์',
  `webname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'TOONTA',
  `agent_id` bigint DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `billMatched` int NOT NULL DEFAULT '0',
  `complated` int NOT NULL DEFAULT '0',
  `accountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `algorithm` enum('Sms','Bot Bank','Bank API') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Sms',
  `activestatus` enum('เปิดใช้งาน','ปิดใช้งาน') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เปิดใช้งาน',
  `accountRocked` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `autorocker` int NOT NULL DEFAULT '0',
  `imgbank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nameAccount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `depositaccount`
--

INSERT INTO `depositaccount` (`id`, `bankName`, `webname`, `agent_id`, `status`, `balance`, `billMatched`, `complated`, `accountNumber`, `algorithm`, `activestatus`, `accountRocked`, `autorocker`, `imgbank`, `accountName`, `nameAccount`) VALUES
(1, 'ธนาคารไทยพาณิชย์', 'TOONTAA', NULL, 'แก้ไขไม่ได้ เนื่องจากผูก Api', 0, 0, 0, '18399569939', 'Sms', 'เปิดใช้งาน', 'Test', 300, 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'นาย พีรวัส ขวัญแก้ว', 'พีรวัสขวัญแก้ว'),
(2, 'ธนาคารไทยพาณิชย์', 'TOONTA', NULL, 'แก้ไขไม่ได้ เนื่องจากผูก Api', 0, 0, 0, '1839900569939', 'Sms', 'เปิดใช้งาน', 'Test', 100, 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'พีรวัส ขวัญแก้ว', 'นายพีรวัสขวัญแก้ว'),
(3, 'ธนาคารกสิกรไทย', 'TOONTA', NULL, 'แก้ไขไม่ได้ เนื่องจากผูก Api', 0, 0, 0, '1653149774', 'Sms', 'เปิดใช้งาน', 'Test', 0, 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-kbank.png', 'MS. MY HAY MAY -', 'MS. MY HAY MAY -');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint NOT NULL,
  `agent_id` bigint NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'true',
  `created_at` timestamp NOT NULL,
  `login_latest` timestamp NOT NULL,
  `ip_address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '000.00.0.0',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `levelrole` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tpye` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'พนักงาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `agent_id`, `username`, `password`, `name`, `phonenumber`, `status`, `created_at`, `login_latest`, `ip_address`, `role`, `levelrole`, `tpye`) VALUES
(1, 2, 'roottest', '25f9e794323b453885f5181f1b624d0b', 'โกโจ ซาโตรุ', '0000000000', 'true', '2023-10-20 14:49:43', '2023-10-20 14:49:43', '172.27.0.5', 'แอดมิน', 'สมาชิก,รายชื่อสมาชิก,แก้ไข,แก้ไขUser,รายงานการอัพเดทระบบ,กลุ่ม,รายงาน,ยอดได้เสีย,ยอดได้เสียรายเกม,รายงานการเล่นเกม,รายงานยอดแทงและยอดชนะ,รายงานยอดฝากถอนเงิน,รายงานยอดสมัครผู้เล่น,Dashboard', 'พนักงาน'),
(2, 2, 'victest', 'ef775988943825d2871e1cfa75473ec0', 'vic ทดสอบ', '0000000000', 'false', '2023-10-20 17:31:14', '2023-10-20 17:31:14', '172.22.0.4', 'ตรวจสอบ', 'ยอดได้เสีย,ยอดได้เสียรายเกม,รายงานการเล่นเกม,รายงานยอดสมัครผู้เล่น,รายงานยอดฝากถอนเงิน,รายงานยอดแทงและยอดชนะ,Dashboard,สมาชิก,รายชื่อสมาชิก,เพิ่มสมาชิก,กลุ่ม,สร้างกลุ่ม,แก้ไข,แสดงข้อมูล,ประวัติการทำรายการ,แก้ไขUser,เพิ่มเครดิต,ลดเครดิต,ฝากถอน,เปลี่ยนรหัสผ่าน,Ban,โปรโมชั่น,พนักงาน,รายชื่อพนักงาน,การเงิน,ฝาก,ถอน,รอการเช็คถอน,บัญชีฝาก,บัญชีถอน,รายงาน', 'พนักงาน');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` bigint NOT NULL,
  `growshrink` int DEFAULT NULL,
  `fiatValue` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
-- Table structure for table `gamecamptotal`
--

CREATE TABLE `gamecamptotal` (
  `id` bigint NOT NULL,
  `namegamecamp` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `grossComm` double(15,2) NOT NULL DEFAULT '0.00',
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `lose` double(15,2) NOT NULL DEFAULT '0.00',
  `commmember` double(15,2) NOT NULL DEFAULT '0.00',
  `totalmamber` double(15,2) NOT NULL DEFAULT '0.00',
  `w_l_agent` double(15,2) NOT NULL DEFAULT '0.00',
  `comm_agent` double(15,2) NOT NULL DEFAULT '0.00',
  `tatal_agent` double(15,2) NOT NULL DEFAULT '0.00',
  `w_l_commny` double(15,2) NOT NULL DEFAULT '0.00',
  `comm_commny` double(15,2) NOT NULL DEFAULT '0.00',
  `tatal_commny` double(15,2) NOT NULL DEFAULT '0.00',
  `roundplay` int NOT NULL DEFAULT '0',
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamecamptotal`
--

INSERT INTO `gamecamptotal` (`id`, `namegamecamp`, `grossComm`, `turnover`, `win`, `lose`, `commmember`, `totalmamber`, `w_l_agent`, `comm_agent`, `tatal_agent`, `w_l_commny`, `comm_commny`, `tatal_commny`, `roundplay`, `day`) VALUES
(1, 'DOGZILLA', 0.00, 80.00, 112.80, -32.80, 0.00, 145.60, -32.80, 0.00, -32.48, -32.80, 0.00, -0.32, 18, '2023-10-23'),
(2, 'DOGZILLA', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19, '2023-10-24'),
(3, 'DOGZILLA', 0.00, 3450.00, 1505.76, 1944.24, 0.00, -438.48, 1944.24, 0.00, 1924.79, 1944.24, 0.00, 19.45, 20, '2023-10-25'),
(4, 'PGSOFT2', 0.00, 1.00, 0.40, 0.60, 0.00, -0.20, 0.60, 0.00, 0.54, 0.60, 0.00, 0.06, 3, '2023-10-25'),
(5, 'DOGZILLA', 0.00, 260.00, 444.60, -184.60, 0.00, 629.20, -184.60, 0.00, -182.76, -184.60, 0.00, -1.84, 26, '2023-10-26'),
(6, 'SPINIX', 0.00, 0.00, 95.70, -95.70, 0.00, 191.40, -95.70, 0.00, -86.13, -95.70, 0.00, -9.57, 39, '2023-10-26');

-- --------------------------------------------------------

--
-- Table structure for table `gameweb`
--

CREATE TABLE `gameweb` (
  `id` bigint NOT NULL,
  `imglogo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password_img` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `namegame` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `active` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `percentagegame` double(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gameweb`
--

INSERT INTO `gameweb` (`id`, `imglogo`, `password_img`, `namegame`, `active`, `percentagegame`) VALUES
(1, 'https://superapi-products.s3-ap-southeast-1.amazonaws.com/logo/pgslot.webp', 'PGSOFT2', 'PG Soft', 'N', 90.00),
(2, 'https://alexanderdevenezuela.com/wp-content/uploads/2021/02/slot-xo.png', 'SLOTXO', 'Slotxo', 'N', 90.00),
(3, 'https://joker123.center/wp-content/uploads/2021/01/cropped-joker123-center-1024px.png', 'JOKER', 'Joker123', 'N', 90.00),
(4, 'https://superapi-products.s3-ap-southeast-1.amazonaws.com/logo/askmebet.webp', 'ASKMEBET', 'Askmebet', 'N', 90.00),
(5, 'https://casinodaddy.com/wp-content/uploads/2020/04/habanero-logo.png', 'HABANERO', 'Habanero', 'N', 90.00),
(6, 'https://www.slotsreview.games/wp-content/uploads/2020/09/tabPp8TY.png', 'SPADE', 'Spade Gaming', 'N', 90.00),
(7, 'https://onlinebingo.co.uk/wp-content/uploads/2022/08/microgaming.png', 'MICRO', 'Micro Gaming', 'N', 90.00),
(8, 'https://smartcasinoguide.com/app/uploads/2021/11/SimplePlay-games-icon.png', 'SIMPLEPLAY', 'Simple Play', 'N', 90.00),
(9, 'https://malaysialistings.s3.ap-south-1.amazonaws.com/listings/images63be4cb88319b.jpg', 'LIVE22', 'Live22', 'N', 90.00),
(10, 'https://goodluckmate.com/storage/attribute_value/d3dce8f6c19589bace8a9d293a271780/c/evoplay-games-250x250.png', 'EVOPLAY', 'Evoplay', 'N', 90.00),
(11, 'https://pgslot-game.io/wp-content/uploads/2021/08/CQ9-SLOT-min-1.png', 'CQ9V2', 'CQ9', 'N', 90.00),
(12, 'https://play-lh.googleusercontent.com/7KD9UI2qGFDKCqSvVK_9k03PzApNaFxhHeAbQzCZqRvxAiqVOLVS5Jr6MXKzkcFotzUp', 'JILI', 'Jili', 'N', 90.00),
(13, 'https://superslot247.com/wp-content/uploads/2022/06/%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%A2-mannaplay-%E0%B9%80%E0%B8%A7%E0%B9%87%E0%B8%9A-Superslot-%E0%B8%9F%E0%B8%A3%E0%B8%B5%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%94%E0%B8%B4%E0%B8%95.png', 'MANNA', 'Mannaplay', 'N', 90.00),
(14, 'https://www.atombetx888.com/images/bfgames/Funky%20Games.png', 'FUNKY', 'Funky Games', 'N', 90.00),
(15, 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/uj9tjvzkgifyr1nsyomj', 'YGGDRASIL', 'Yggdrasil Gaming', 'N', 90.00),
(16, 'https://apimain.fomobet88.com/images/1655903289.webp', 'UPG', 'UPG Slot', 'N', 90.00),
(17, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0jB977AuuUdyeQYZRVw25DzoOFCWZz7yMfd5GPujDIxe0SEwqngvMLMmvmLG6ZtSOC8o&usqp=CAU', 'AMEBA', 'Ameba', 'N', 90.00),
(18, 'https://fortuneox.net/wp-content/uploads/2022/12/gamecompanyamb.png', 'AMBSLOT2', 'Ambslot', 'N', 90.00),
(19, 'https://slotsmegacasino.pt/images/slots/hotline.jpg', 'NETENT2', 'Netent2', 'N', 90.00),
(20, 'https://pbs.twimg.com/profile_images/1495764482307637248/9yEFhc2D_400x400.jpg', 'REDTIGER', 'Red Tiger', 'N', 90.00),
(21, 'https://as2.ftcdn.net/v2/jpg/03/19/27/03/1000_F_319270375_1tXTAdn0eim324DADDtNJZZVBLIVYTLP.jpg', 'DRAGONGAMING', 'Dragon Gaming', 'N', 90.00),
(22, 'https://static.wixstatic.com/media/ce54f5_43d735b0df6c47cf8de3ab7ca74be105~mv2.png/v1/fill/w_269,h_267,al_c,lg_1,q_95,enc_auto/ace333.png', 'ACE333', 'Ace333', 'N', 90.00),
(23, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSokl0-jgqd5PRC_z88Q5m13kpMVH6YxTx88w&usqp=CAU', 'I8', 'I8', 'N', 90.00),
(24, 'https://is3-ssl.mzstatic.com/image/thumb/Purple111/v4/22/0a/37/220a37e4-f17f-0b02-e54e-4869308fc2fb/source/512x512bb.jpg', 'WMSLOT', 'WmSlot', 'N', 90.00),
(25, 'https://play-lh.googleusercontent.com/kyMC5UyPeJWaoju2AonX3StTnfZ5cse0MlkXheLzAdWnLeRG1u25X33Y59IuFLqnWQ', 'SPINIX', 'Spinix', 'N', 90.00),
(26, 'https://ninjaslot.co.in/wp-content/uploads/2022/11/imgninja.png', 'NINJA', 'Ninja slot', 'Y', 90.00),
(27, 'https://i1.sndcdn.com/avatars-5zP0dUayEzDDtX3G-zTczhA-t500x500.jpg', '918KISS', '918 Kiss', 'N', 90.00),
(28, 'https://cryptostec.com/wp-content/uploads/2022/05/pragmatic-play.jpeg', 'PRAGMATIC_SLOT', 'Pragmatic Play Slot', 'N', 90.00),
(29, NULL, 'DOGZILLA', 'DOGZILLA', 'Y', 99.00);

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
(6, 3, 'false'),
(6, 4, 'false'),
(5, 1, 'false'),
(6, 3, 'false'),
(5, 1, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(6, 3, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(3, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'false'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 3, 'true'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(7, 1, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 3, 'false');

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
(1, 'โบนัสต้อนรับสมาชิกใหม่', 'โบนัสสมาชิกใหม่รับ 100%\n- สำหรับสมาชิกใหม่เท่านั้น\n- ฝากขั้นต่ำ 100 บาท จึงจะมีสิทธิ์รับโบนัส\n- สมาชิกต้องทำเทิร์น 5 เท่า จึงจะมีสิทธิ์ถอน\n- ถอนสูงสุด 3000 บาท\n- ค่ายเกมส์ที่ร่วมรายการ PG Solf , Dogzilla เท่านั้น\n\n', 'file', '191066 (5).jpg', '7bit', 'image/jpeg', 'public/images', 'file_dateVal_1697775701115_191066 (5).jpg', 'public/images/file_dateVal_1697775701115_191066 (5).jpg', 89639),
(2, 'trtrtrtrtrt', 'ttttttttttttttttttttttttttttttttt\nrrrrrrrrrrrrrtrterwrwrwrwrwrwrrwwrrwrw\njtjjhjhjhjhhhhhhhhhhhhhjjrgsetstsgfcgx\ngfdxgxfgxgxfgazfgzsfzfzfgzdfzsfzsfz\nyersdgazfzsfzxgxdgxgxhhchchchchcfhk\nftuhcfhcfhchchcgzstfzsfxgxhxchchchff\nyhdrghxchchchchchchsydrfhchdyhdyd', 'file', 'banner3.jpg', '7bit', 'image/jpeg', 'public/images', 'file_dateVal_1697817835883_banner3.jpg', 'public/images/file_dateVal_1697817835883_banner3.jpg', 256147),
(3, 'testesttesttetstest', '555555555555555555555\n55555555555555555555\n5555555555555555555555555\n5555555555555555555555\n5555555555555555555555\n55555555555', 'file', 'banner4.jpg', '7bit', 'image/jpeg', 'public/images', 'file_dateVal_1698122647698_banner4.jpg', 'public/images/file_dateVal_1698122647698_banner4.jpg', 264305);

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
(1, 1, 'Go Gold Planet', 11, 0.00, 0.00, '/img/thumbs/icontest3.png', '2023-10-23'),
(2, 3, 'CowBoys VS Aliens', 11, 0.00, 0.00, '/img/thumbs/icontest1.png', '2023-10-23'),
(3, 2, 'Lucky Bunny Gold', 11, 0.00, 0.00, '/img/thumbs/icontest2.png', '2023-10-23'),
(4, 3, 'CowBoys VS Aliens', 11, 0.00, 0.00, '/img/thumbs/icontest1.png', '2023-10-24'),
(5, 1, 'Go Gold Planet', 11, 0.00, 0.00, '/img/thumbs/icontest3.png', '2023-10-24');

-- --------------------------------------------------------

--
-- Table structure for table `logedit`
--

CREATE TABLE `logedit` (
  `id` bigint UNSIGNED NOT NULL,
  `edittype` enum('admin','agent','member') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idedit` bigint DEFAULT NULL,
  `idmember` bigint DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editbefore` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editafter` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_attime` datetime DEFAULT NULL,
  `created_atdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logedit`
--

INSERT INTO `logedit` (`id`, `edittype`, `idedit`, `idmember`, `name`, `editbefore`, `editafter`, `created_attime`, `created_atdate`) VALUES
(1, 'agent', 2, 1, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-18 15:50:39', '2023-10-18'),
(2, 'agent', 2, 1, 'agent01', 'Credit ก่อนหน้า   1000\n              ', 'Credit ปัจจุบัน = 900มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-18 15:51:32', '2023-10-18'),
(3, 'agent', 2, 1, 'agent01', 'ชื่อจริง จิรกฤต นามสกุล จิรกฤต กลุ่มลูกค้า NewMember Renk NewMember username 0954789782 ไลน์ ', 'ชื่อจริง นาย จิรกฤต โชคพฤทธิ์กุล นามสกุล จิรกฤต กลุ่มลูกค้า NewMember Renk NewMember username 0954789782 ไลน์ แก้ไขโดย agent01', '2023-10-18 15:52:22', '2023-10-18'),
(4, 'agent', 2, 5, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 100มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-18 16:45:15', '2023-10-18'),
(5, 'agent', 2, 7, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-19 05:51:28', '2023-10-19'),
(6, 'agent', 2, 1, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 1000มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-19 16:03:58', '2023-10-19');

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

-- --------------------------------------------------------

--
-- Table structure for table `logfinanceuser`
--

CREATE TABLE `logfinanceuser` (
  `id` bigint NOT NULL,
  `bill_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '''111111111111111''',
  `numberbill` int NOT NULL DEFAULT '0',
  `idUser` int NOT NULL,
  `agent_id` bigint NOT NULL,
  `tpyefinance` enum('ถอน','ฝาก') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accountName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0999999999',
  `transaction_date` date NOT NULL,
  `time` time NOT NULL,
  `quantity` int NOT NULL,
  `creditbonus` int DEFAULT '0',
  `balance_before` float(15,2) NOT NULL DEFAULT '0.00',
  `balance` float(15,2) NOT NULL,
  `status` enum('ยังไม่เรียบร้อย','ทั้งหมด','รอ','ที่ยังไม่ผูก','สำเร็จ','ไม่สำเส็จ') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'สำเร็จ',
  `bank` enum('ธนาคารไทยพาณิชย์','ธนาคารกสิกรไทย','ธนาคารกรุงเทพ','ธนาคารกรุงไทย','ธนาคารกรุงศรีอยุธยา','ธนาคารเกียรตินาคินภัทร','ธนาคารซีไอเอ็มบี ไทย','ธนาคารทหารไทยธนชาต','ธนาคารยูโอบี','ธนาคารออมสิน','ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร','ธนาคารสแตนดาร์ดชาร์เตอร์ด (ไทย)','Agent') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ธนาคารไทยพาณิชย์',
  `imgBank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `destinationAccount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `destinationAccountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trans_ref` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เพิ่มจากเว็บAgent',
  `qrcodeData` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เพิ่มจากเว็บAgent',
  `nameimg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เพิ่มจากเว็บAgent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Go Gold Planet', 954, 5720.00, 1275.23, '/img/thumbs/icontest1.png'),
(2, 'Lucky Bunny Gold', 5508, 82809.00, 87081.12, '/img/thumbs/icontest2.png'),
(3, 'CowBoys VS Aliens', 4693, 10827.00, 4827.40, '/img/thumbs/icontest3.png');

-- --------------------------------------------------------

--
-- Table structure for table `mastergroup`
--

CREATE TABLE `mastergroup` (
  `id` bigint NOT NULL,
  `agent_id` bigint NOT NULL,
  `account_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `account_number` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#000000',
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `minwithdrawal` double(15,2) NOT NULL DEFAULT '0.00',
  `withdrawalday` int NOT NULL DEFAULT '0',
  `nameaccoun` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mindeposit` double(15,2) NOT NULL DEFAULT '0.00',
  `withdrawalsperday` int NOT NULL DEFAULT '0',
  `groupmaster` enum('NewMember','Bronze','Silver','Gold','Diamond') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NewMember',
  `depositaccount` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `secondaryaccount` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondaryaccountII` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondaryaccountIII` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imgbank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status_delete` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` bigint UNSIGNED NOT NULL,
  `agent_id` bigint DEFAULT '0',
  `username_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `member_code` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `bet_latest` float(16,2) DEFAULT '0.00',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `status_delete` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` date DEFAULT NULL,
  `created_attime` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `browserlogin` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `customerGroup` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userrank` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lineid` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `currency` varchar(11) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `bank` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountNumber` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phonenumber` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `recharge_times` int NOT NULL DEFAULT '0',
  `bonususer` int NOT NULL DEFAULT '0',
  `deposit` double(15,2) NOT NULL DEFAULT '0.00',
  `withdraw_member` double(15,2) NOT NULL DEFAULT '0.00',
  `latest_withdrawal` double(15,2) NOT NULL DEFAULT '0.00',
  `groupmember` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NewMember',
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `total_top_up_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `promotionuser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passwordpromotion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `turnover_playuser` double(15,2) NOT NULL DEFAULT '0.00',
  `tokenplaygame` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `agent_id`, `username_agent`, `member_code`, `name`, `credit`, `bet_latest`, `username`, `password`, `status`, `status_delete`, `created_at`, `created_attime`, `updated_at`, `ip_address`, `browserlogin`, `customerGroup`, `userrank`, `lineid`, `note`, `currency`, `bank`, `accountName`, `accountNumber`, `phonenumber`, `lastName`, `recharge_times`, `bonususer`, `deposit`, `withdraw_member`, `latest_withdrawal`, `groupmember`, `turnover`, `total_top_up_amount`, `promotionuser`, `passwordpromotion`, `turnover_playuser`, `tokenplaygame`) VALUES
(1, 2, 'agent01', '2', 'kit', 0.00, 0.00, '0879914004', '8a6f2805b4515ac12058e79e66539be9', 'Y', 'N', '2023-10-19', '2023-10-19 17:46:37', '2023-10-19 17:46:37', '172.22.0.4', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารกสิกรไทย', 'kit', '0102294078', '0879914004', 'kit', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00, NULL),
(2, 2, 'agent01', '2', 'victest', 1018.30, 0.00, '0954789782', '52c69e3a57331081823331c4e69d3f2e', 'Y', 'N', '2023-10-19', '2023-10-19 18:40:31', '2023-10-19 18:40:31', '192.168.0.5', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'victest', '0123456789', '0954789782', 'victest', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 6.00, NULL),
(3, 2, 'agent01', '2', 'ปฏิภาณ อุ่นในธรรม', 0.00, 0.00, '0925711362', '19ede66f218015fd9df85ac886488926', 'Y', 'N', '2023-10-20', '2023-10-20 10:50:40', '2023-10-20 10:50:40', '172.25.0.5', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารกสิกรไทย', 'ปฏิภาณ อุ่นในธรรม', '7442905791', '0925711362', 'ปฏิภาณ อุ่นในธรรม', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00, NULL),
(4, 2, 'agent01', '2', 'toon', 0.00, 0.00, '0835366936', 'e10adc3949ba59abbe56e057f20f883e', 'Y', 'N', '2023-10-23', '2023-10-23 03:45:26', '2023-10-23 03:45:26', 'null', 'null', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'toon', '1234567890', '0835366936', 'toon', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00, NULL),
(5, 2, 'agent01', '2', 'นาย พีรวัส ขวัญแก้ว', 1369.40, 20.00, '0990825942', '1c8a0fb0f77321b2fea4124168f33eef', 'Y', 'N', '2023-10-23', '2023-10-23 08:34:56', '2023-10-23 08:34:56', '172.30.0.4', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'นาย พีรวัส ขวัญแก้ว', '18396488647', '0990825942', 'นาย พีรวัส ขวัญแก้ว', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 80.00, NULL),
(6, 2, 'agent01', '2', 'นิธิธร', 10847.66, 10.00, '0951789155', 'cf8c105ec5b1554187508d61aa4a325d', 'Y', 'N', '2023-10-25', '2023-10-25 10:14:27', '2023-10-25 10:14:27', '192.168.64.4', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารกสิกรไทย', 'นิธิธร', '0373729485', '0951789155', 'นิธิธร', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 368.00, NULL);

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
-- Table structure for table `repostgame`
--

CREATE TABLE `repostgame` (
  `id` bigint NOT NULL,
  `iduser` bigint NOT NULL DEFAULT '0',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gameid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bet` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `balance_credit` double(15,2) NOT NULL DEFAULT '0.00',
  `get_browser` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `platform` enum('PC','Mobile') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Mobile',
  `trans_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NO',
  `created_atdate` date NOT NULL,
  `created_attime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repostgame`
--

INSERT INTO `repostgame` (`id`, `iduser`, `username`, `gameid`, `bet`, `win`, `balance_credit`, `get_browser`, `platform`, `trans_id`, `created_atdate`, `created_attime`) VALUES
(1, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:46:51'),
(2, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:46:54'),
(3, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:46:58'),
(4, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:49:36'),
(5, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:49:39'),
(6, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:17'),
(7, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:17'),
(8, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:22'),
(9, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:22'),
(10, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:26'),
(11, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:26'),
(12, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:28'),
(13, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:28'),
(14, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:31'),
(15, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:31'),
(16, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:35'),
(17, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '03:51:35'),
(18, 5, '0990825942', 'undefined', 20.00, 56.40, 980.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:18:32'),
(19, 5, '0990825942', 'DOGZILLA', 20.00, 56.40, 1149.20, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:31:24'),
(20, 5, '0990825942', 'DOGZILLA', 20.00, 0.00, 1205.60, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:31:46'),
(21, 5, '0990825942', 'DOGZILLA', 20.00, 56.40, 1145.60, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:52:23'),
(22, 5, '0990825942', 'DOGZILLA', 20.00, 0.00, 1202.00, 'Google Chrome', 'PC', 'NO', '2023-10-23', '17:54:21'),
(23, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:21'),
(24, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:25'),
(25, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:29'),
(26, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:36'),
(27, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:10:41'),
(28, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:00'),
(29, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:06'),
(30, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:10'),
(31, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:13'),
(32, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '11:12:16'),
(33, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:04'),
(34, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:04'),
(35, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:08'),
(36, 4, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '12:17:08'),
(37, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:38:31'),
(38, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:38:38'),
(39, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:39:15'),
(40, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:39:22'),
(41, 3, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-24', '13:39:25'),
(42, 6, '0951789155', 'DOGZILLA', 25.00, 125.00, 9975.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:23:18'),
(43, 2, '0954789782', 'DOGZILLA', 1500.00, 4.86, 998.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:25:42'),
(44, 6, '0951789155', 'DOGZILLA', 1200.00, 12.00, 10080.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:25:47'),
(45, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 10092.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:26:16'),
(46, 2, '0954789782', 'DOGZILLA', 2.00, 5.64, 1000.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:26:49'),
(47, 6, '0951789155', 'DOGZILLA', 400.00, 888.20, 10082.00, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:28:51'),
(48, 6, '0951789155', 'DOGZILLA', 200.00, 240.00, 10770.20, 'Google Chrome', 'PC', 'NO', '2023-10-25', '10:29:35'),
(49, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 10980.20, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:43:04'),
(50, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10998.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:43:47'),
(51, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11010.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:44:24'),
(52, 6, '0951789155', 'DOGZILLA', 5.00, 6.00, 11005.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '14:44:59'),
(53, 6, '0951789155', 'DOGZILLA', 3.00, 8.46, 11008.40, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:16:00'),
(54, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 10996.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:17:54'),
(55, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11008.66, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:18:39'),
(56, 6, '0951789155', 'DOGZILLA', 10.00, 50.00, 11016.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:45:02'),
(57, 6, '0951789155', 'DOGZILLA', 10.00, 38.00, 11026.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:47:15'),
(58, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11054.86, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:48:15'),
(59, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11073.06, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:49:21'),
(60, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11063.06, 'Google Chrome', 'PC', 'NO', '2023-10-25', '15:49:50'),
(61, 2, '0954789782', 'DOGZILLA', 5.00, 9.20, 1004.70, 'Apple Safari', 'PC', 'NO', '2023-10-25', '21:34:13'),
(62, 2, '0954789782', 'PGSOFT2', 1.00, 0.20, 1003.90, 'Google Chrome', 'PC', 'NO', '2023-10-25', '21:37:10'),
(63, 2, '0954789782', 'PGSOFT2', 0.00, 0.20, 1004.10, 'Google Chrome', 'PC', 'NO', '2023-10-25', '21:37:14'),
(64, 2, '0954789782', 'PGSOFT2', 0.00, 0.00, 1004.10, 'Google Chrome', 'PC', 'NO', '2023-10-25', '21:37:18'),
(65, 5, '0990825942', 'GAME', 0.00, 0.00, 1172.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAMIT3ARAGAAAAAAA', '2023-10-26', '03:41:58'),
(66, 5, '0990825942', 'GAME', 0.00, 0.00, 1172.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAAIAAAAA', '2023-10-26', '03:41:59'),
(67, 5, '0990825942', 'GAME', 0.00, 0.00, 1182.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIA23ARAGAAAAAAA', '2023-10-26', '03:42:03'),
(68, 5, '0990825942', 'GAME', 0.00, 0.00, 1182.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAAQAAAAA', '2023-10-26', '03:42:04'),
(69, 5, '0990825942', 'GAME', 0.00, 0.00, 1192.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAXJC3ARAGAAAAAAA', '2023-10-26', '03:42:09'),
(70, 5, '0990825942', 'GAME', 0.00, 0.00, 1192.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAAYAAAAA', '2023-10-26', '03:42:10'),
(71, 5, '0990825942', 'GAME', 0.00, 0.00, 1202.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAB3JK3ARAGAAAAAAA', '2023-10-26', '03:42:15'),
(72, 5, '0990825942', 'GAME', 0.00, 0.00, 1202.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABAAAAAA', '2023-10-26', '03:42:20'),
(73, 5, '0990825942', 'GAME', 0.00, 0.00, 1212.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABUZW3ARAGAAAAAAA', '2023-10-26', '03:42:24'),
(74, 5, '0990825942', 'GAME', 0.00, 0.00, 1212.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABIAAAAA', '2023-10-26', '03:42:24'),
(75, 5, '0990825942', 'GAME', 0.00, 0.00, 1222.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABUSO3ARAGAAAAAAA', '2023-10-26', '03:42:41'),
(76, 5, '0990825942', 'GAME', 0.00, 0.00, 1222.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABQAAAAA', '2023-10-26', '03:42:45'),
(77, 5, '0990825942', 'GAME', 0.00, 0.00, 1232.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABZMI3ARAGAAAAAAA', '2023-10-26', '03:43:24'),
(78, 5, '0990825942', 'GAME', 0.00, 0.00, 1232.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAABYAAAAA', '2023-10-26', '03:43:24'),
(79, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABVQV4ARAGAAAAAAA', '2023-10-26', '04:06:49'),
(80, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACAAAAAA', '2023-10-26', '04:06:50'),
(81, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAALBH4ARAGAAAAAAA', '2023-10-26', '04:07:02'),
(82, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACIAAAAA', '2023-10-26', '04:07:02'),
(83, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAABP4ARAGAAAAAAA', '2023-10-26', '04:07:07'),
(84, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACQAAAAA', '2023-10-26', '04:07:07'),
(85, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACC34ARAGAAAAAAA', '2023-10-26', '04:07:38'),
(86, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACYAAAAA', '2023-10-26', '04:07:38'),
(87, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABR5F4MRAGAAAAAAA', '2023-10-26', '04:17:33'),
(88, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAADQAAAAA', '2023-10-26', '04:17:33'),
(89, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFV24MRAGAAAAAAA', '2023-10-26', '04:17:47'),
(90, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAADYAAAAA', '2023-10-26', '04:17:47'),
(91, 5, '0990825942', 'GAME', 0.00, 0.00, 1342.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA42B4QRAGAAAAAAA', '2023-10-26', '04:19:19'),
(92, 5, '0990825942', 'GAME', 0.00, 0.00, 1342.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAEAAAAAA', '2023-10-26', '04:19:19'),
(93, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABXGM4URAGAAAAAAA', '2023-10-26', '04:23:47'),
(94, 5, '0990825942', 'GAME', 0.00, 0.00, 1332.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAEQAAAAA', '2023-10-26', '04:23:47'),
(95, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAQGX4URAGAAAAAAA', '2023-10-26', '04:23:54'),
(96, 5, '0990825942', 'GAME', 0.00, 0.00, 1322.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAEYAAAAA', '2023-10-26', '04:23:54'),
(97, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAVPF4URAGAAAAAAA', '2023-10-26', '04:24:03'),
(98, 5, '0990825942', 'GAME', 0.00, 0.00, 1312.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFAAAAAA', '2023-10-26', '04:24:04'),
(99, 5, '0990825942', 'GAME', 0.00, 0.00, 1302.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3HK4URAGAAAAAAA', '2023-10-26', '04:24:07'),
(100, 5, '0990825942', 'GAME', 0.00, 0.00, 1302.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFIAAAAA', '2023-10-26', '04:24:07'),
(101, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAALXP4URAGAAAAAAA', '2023-10-26', '04:24:10'),
(102, 5, '0990825942', 'GAME', 0.00, 0.00, 1292.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFQAAAAA', '2023-10-26', '04:24:13'),
(103, 5, '0990825942', 'GAME', 0.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAPAS4YRAGAAAAAAA', '2023-10-26', '04:24:33'),
(104, 5, '0990825942', 'GAME', 0.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFYAAAAA', '2023-10-26', '04:24:38'),
(105, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABDLA4YRAGAAAAAAA', '2023-10-26', '04:25:27'),
(106, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGAAAAAA', '2023-10-26', '04:25:31'),
(107, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3DZ4YRAGAAAAAAA', '2023-10-26', '04:25:44'),
(108, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGIAAAAA', '2023-10-26', '04:25:44'),
(109, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAIL54YRAGAAAAAAA', '2023-10-26', '04:25:46'),
(110, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGQAAAAA', '2023-10-26', '04:25:47'),
(111, 5, '0990825942', 'GAME', 0.00, 0.00, 1242.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAJEB4YRAGAAAAAAA', '2023-10-26', '04:25:49'),
(112, 5, '0990825942', 'GAME', 10.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAJMB4YRAGAAAAAAA', '2023-10-26', '04:25:49'),
(113, 5, '0990825942', 'GAME', 10.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAWMP4YRAGAAAAAAA', '2023-10-26', '04:25:59'),
(114, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAGYAAAAA', '2023-10-26', '04:26:00'),
(115, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA2424YRAGAAAAAAA', '2023-10-26', '04:26:07'),
(116, 5, '0990825942', 'GAME', 30.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAA3E24YRAGAAAAAAA', '2023-10-26', '04:26:07'),
(117, 5, '0990825942', 'GAME', 0.00, 0.00, 1282.00, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAHAAAAAA', '2023-10-26', '04:26:13'),
(118, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABUU5HY3RKAAAAAAA', '2023-10-26', '04:52:07'),
(119, 5, '0990825942', 'GAME', 0.00, 0.00, 1272.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAAIAAAAA', '2023-10-26', '04:52:07'),
(120, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAXVFHY3RKAAAAAAA', '2023-10-26', '04:52:12'),
(121, 5, '0990825942', 'GAME', 0.00, 0.00, 1262.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAAQAAAAA', '2023-10-26', '04:52:12'),
(122, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAQNKHY3RKAAAAAAA', '2023-10-26', '04:52:15'),
(123, 5, '0990825942', 'GAME', 0.00, 0.00, 1252.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAAYAAAAA', '2023-10-26', '04:52:16'),
(124, 5, '0990825942', 'GAME', 0.00, 0.00, 1242.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAAU5PHY3RKAAAAAAA', '2023-10-26', '04:52:19'),
(125, 5, '0990825942', 'GAME', 0.00, 0.00, 1242.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAABAAAAAA', '2023-10-26', '04:52:19'),
(126, 5, '0990825942', 'GAME', 0.00, 0.00, 1232.00, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABWVWHY3RKAAAAAAA', '2023-10-26', '04:52:23'),
(127, 5, '0990825942', 'GAME', 2.40, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABW5WHY3RKAAAAAAA', '2023-10-26', '04:52:24'),
(128, 5, '0990825942', 'GAME', 0.00, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAABIAAAAA', '2023-10-26', '04:52:24'),
(129, 5, '0990825942', 'GAME', 0.00, 0.00, 1224.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABGGXHY3RKAAAAAAA', '2023-10-26', '04:52:46'),
(130, 5, '0990825942', 'GAME', 10.00, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAABGOXHY3RKAAAAAAA', '2023-10-26', '04:52:46'),
(131, 5, '0990825942', 'GAME', 0.00, 0.00, 1234.40, 'Google Chrome', 'PC', 'AIBQACAANHKOCJQAAAAAABQAAAAA', '2023-10-26', '04:52:47'),
(132, 5, '0990825942', 'GAME', 0.00, 0.00, 734.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABF4S6ARAGAAAAAAA', '2023-10-26', '04:53:31'),
(133, 5, '0990825942', 'GAME', 20.00, 0.00, 754.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABGMS6ARAGAAAAAAA', '2023-10-26', '04:53:31'),
(134, 5, '0990825942', 'GAME', 4.00, 0.00, 758.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAPNH6ARAGAAAAAAA', '2023-10-26', '04:53:44'),
(135, 5, '0990825942', 'GAME', 10.00, 0.00, 768.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABJFP6ARAGAAAAAAA', '2023-10-26', '04:53:50'),
(136, 5, '0990825942', 'GAME', 180.00, 0.00, 948.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAB2WF6ARAGAAAAAAA', '2023-10-26', '04:54:03'),
(137, 5, '0990825942', 'GAME', 88.00, 0.00, 1036.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABRO36ARAGAAAAAAA', '2023-10-26', '04:54:17'),
(138, 5, '0990825942', 'GAME', 150.00, 0.00, 1186.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAPH46ARAGAAAAAAA', '2023-10-26', '04:54:37'),
(139, 5, '0990825942', 'GAME', 35.00, 0.00, 1221.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAACIP6ERAGAAAAAAA', '2023-10-26', '04:54:49'),
(140, 5, '0990825942', 'GAME', 28.00, 0.00, 1249.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAABRZW6ERAGAAAAAAA', '2023-10-26', '04:55:14'),
(141, 5, '0990825942', 'GAME', 84.00, 0.00, 1333.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAFSI6ERAGAAAAAAA', '2023-10-26', '04:55:25'),
(142, 5, '0990825942', 'GAME', 56.00, 0.00, 1389.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAB5KV6ERAGAAAAAAA', '2023-10-26', '04:55:33'),
(143, 5, '0990825942', 'GAME', 0.00, 0.00, 1389.40, 'Google Chrome', 'PC', 'AIBQAAQAF56DUJQAAAAAAHIAAAAA', '2023-10-26', '04:55:43'),
(144, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11053.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '05:16:38'),
(145, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11055.06, 'Google Chrome', 'PC', 'NO', '2023-10-26', '05:17:17'),
(146, 2, '0954789782', 'SPINIX', 0.00, 0.90, 1002.50, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:08'),
(147, 2, '0954789782', 'SPINIX', 0.00, 0.20, 1000.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:18'),
(148, 2, '0954789782', 'SPINIX', 0.00, 0.00, 997.70, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:24'),
(149, 2, '0954789782', 'SPINIX', 0.00, 0.20, 995.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:28'),
(150, 2, '0954789782', 'SPINIX', 0.00, 0.70, 993.60, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:33'),
(151, 2, '0954789782', 'SPINIX', 0.00, 4.30, 995.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:06:39'),
(152, 2, '0954789782', 'SPINIX', 0.00, 0.50, 993.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:07:21'),
(153, 2, '0954789782', 'SPINIX', 0.00, 0.00, 990.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:00'),
(154, 2, '0954789782', 'SPINIX', 0.00, 0.00, 987.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:05'),
(155, 2, '0954789782', 'SPINIX', 0.00, 0.00, 984.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:10'),
(156, 2, '0954789782', 'SPINIX', 0.00, 0.00, 981.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:16'),
(157, 2, '0954789782', 'SPINIX', 0.00, 56.00, 1034.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:27'),
(158, 2, '0954789782', 'SPINIX', 0.00, 4.00, 1038.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:33'),
(159, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1038.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:36'),
(160, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1035.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:48'),
(161, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1032.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:08:53'),
(162, 2, '0954789782', 'SPINIX', 0.00, 2.00, 1031.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:01'),
(163, 2, '0954789782', 'SPINIX', 0.00, 8.00, 1039.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:02'),
(164, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1039.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:04'),
(165, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1036.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:29'),
(166, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1034.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:33'),
(167, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1031.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:35'),
(168, 2, '0954789782', 'SPINIX', 0.00, 2.50, 1031.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:09:36'),
(169, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11073.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:12:15'),
(170, 6, '0951789155', 'DOGZILLA', 10.00, 50.00, 11063.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:21:08'),
(171, 6, '0951789155', 'DOGZILLA', 10.00, 38.00, 11093.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:28:11'),
(172, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11121.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:28:55'),
(173, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1029.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:23'),
(174, 2, '0954789782', 'SPINIX', 0.00, 2.00, 1028.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:27'),
(175, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1028.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:30'),
(176, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1026.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:34'),
(177, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1023.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:39'),
(178, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1021.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:44'),
(179, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1018.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:52'),
(180, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1016.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:53'),
(181, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1013.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:55'),
(182, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1011.40, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:56'),
(183, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1008.90, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:34:58'),
(184, 2, '0954789782', 'SPINIX', 0.00, 0.80, 1007.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:00'),
(185, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1007.20, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:01'),
(186, 2, '0954789782', 'SPINIX', 0.00, 10.00, 1014.70, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:04'),
(187, 2, '0954789782', 'SPINIX', 0.00, 3.60, 1018.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:05'),
(188, 2, '0954789782', 'SPINIX', 0.00, 0.00, 1018.30, 'Google Chrome', 'PC', 'NO', '2023-10-26', '06:35:07'),
(189, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11103.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:27:16'),
(190, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11083.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:29:03'),
(191, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11063.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:30:35'),
(192, 6, '0951789155', 'DOGZILLA', 10.00, 0.00, 11053.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '07:32:00'),
(193, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11043.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:00:40'),
(194, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11045.26, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:01:16'),
(195, 6, '0951789155', 'DOGZILLA', 10.00, 28.20, 11063.46, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:02:34'),
(196, 6, '0951789155', 'DOGZILLA', 10.00, 50.00, 11081.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:03:28'),
(197, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 11101.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:09:44'),
(198, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 11057.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:12:33'),
(199, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11039.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:42:27'),
(200, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 11041.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:43:02'),
(201, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 11027.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:46:02'),
(202, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11019.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:48:13'),
(203, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11021.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '08:48:55'),
(204, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 11023.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:04:48'),
(205, 6, '0951789155', 'DOGZILLA', 10.00, 16.20, 11025.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:05:37'),
(206, 6, '0951789155', 'DOGZILLA', 10.00, 21.80, 11031.86, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:17:52'),
(207, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10973.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '09:21:40'),
(208, 6, '0951789155', 'DOGZILLA', 10.00, 12.00, 10855.66, 'Google Chrome', 'PC', 'NO', '2023-10-26', '11:05:12');

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
-- Table structure for table `totalamountdaily`
--

CREATE TABLE `totalamountdaily` (
  `id` bigint NOT NULL,
  `agentid` bigint NOT NULL,
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `accountNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `billmatched` double(15,2) NOT NULL,
  `complated` double(15,2) NOT NULL,
  `balance` double(15,2) NOT NULL DEFAULT '0.00',
  `bankname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `typeaction` enum('ถอน','ฝาก') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imgbank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `totalturnoverrepost`
--

CREATE TABLE `totalturnoverrepost` (
  `id` bigint NOT NULL,
  `usernameuser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `lose` double(15,2) NOT NULL DEFAULT '0.00',
  `roundplay` int NOT NULL DEFAULT '0',
  `ag_winlose` double(15,2) NOT NULL DEFAULT '0.00',
  `ag_comm` double(15,2) NOT NULL DEFAULT '0.00',
  `ag_total` double(15,2) NOT NULL DEFAULT '0.00',
  `comny_total` double(15,2) NOT NULL DEFAULT '0.00',
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `totalturnoverrepost`
--

INSERT INTO `totalturnoverrepost` (`id`, `usernameuser`, `turnover`, `win`, `lose`, `roundplay`, `ag_winlose`, `ag_comm`, `ag_total`, `comny_total`, `day`) VALUES
(1, '0835366936', 0.00, 0.00, 0.00, 15, 0.00, 0.00, 0.00, 0.00, '2023-10-23'),
(2, '0990825942', 80.00, 112.80, -32.80, 4, -32.80, 0.00, -32.48, -0.32, '2023-10-23'),
(3, '0835366936', 0.00, 0.00, 0.00, 14, 0.00, 0.00, 0.00, 0.00, '2023-10-24'),
(4, '0925711362', 0.00, 0.00, 0.00, 5, 0.00, 0.00, 0.00, 0.00, '2023-10-24'),
(5, '0951789155', 1943.00, 1486.06, 456.94, 17, 456.94, 0.00, 452.36, 4.58, '2023-10-25'),
(6, '0954789782', 1508.00, 20.10, 1487.90, 6, 1487.90, 0.00, 1472.97, 14.93, '2023-10-25'),
(7, '0951789155', 260.00, 444.60, -184.60, 26, -184.60, 0.00, -182.76, -1.84, '2023-10-26'),
(8, '0954789782', 0.00, 95.70, -95.70, 39, -95.70, 0.00, -86.13, -9.57, '2023-10-26');

-- --------------------------------------------------------

--
-- Table structure for table `turnoverrepost`
--

CREATE TABLE `turnoverrepost` (
  `id` bigint NOT NULL,
  `usernameuser` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gamecamp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `turnover` double(15,2) NOT NULL DEFAULT '0.00',
  `win` double(15,2) NOT NULL DEFAULT '0.00',
  `lose` double(15,2) NOT NULL DEFAULT '0.00',
  `day` date NOT NULL,
  `roundplay` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turnoverrepost`
--

INSERT INTO `turnoverrepost` (`id`, `usernameuser`, `gamecamp`, `turnover`, `win`, `lose`, `day`, `roundplay`) VALUES
(1, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-10-23', 15),
(2, '0990825942', 'DOGZILLA', 80.00, 112.80, -32.80, '2023-10-23', 4),
(3, '0835366936', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-10-24', 14),
(4, '0925711362', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-10-24', 5),
(5, '0951789155', 'DOGZILLA', 1943.00, 1486.06, 456.94, '2023-10-25', 17),
(6, '0954789782', 'DOGZILLA', 1507.00, 19.70, 1487.30, '2023-10-25', 3),
(7, '0954789782', 'PGSOFT2', 1.00, 0.40, 0.60, '2023-10-25', 3),
(8, '0951789155', 'DOGZILLA', 260.00, 444.60, -184.60, '2023-10-26', 26),
(9, '0954789782', 'SPINIX', 0.00, 95.70, -95.70, '2023-10-26', 39);

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
  `tiles` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `winline` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `winstyle` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `winCount` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `credit` float(15,2) DEFAULT '0.00',
  `get_browser` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `game_Buyfeespin` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'false',
  `game_feespin` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_play`
--

INSERT INTO `user_play` (`id`, `member_id`, `game_id`, `bet`, `win`, `tiles`, `winline`, `winstyle`, `winCount`, `credit`, `get_browser`, `created_at`, `game_Buyfeespin`, `game_feespin`) VALUES
(1, 1, 1, 0.00, 0.00, '7,4,8,2,6,9,7,0,6,3,5,1,8,5,2', '', '', '0', 1000.00, NULL, '2023-10-19 16:04:35', 'false', 'false'),
(2, 1, 1, 0.00, 0.00, '5,2,8,1,0,2,1,0,7,11,0,6,4,7,5', '', '', '0', 1000.00, NULL, '2023-10-19 16:04:38', 'false', 'false'),
(3, 1, 1, 0.00, 0.00, '3,10,1,10,0,2,4,9,3,0,4,3,10,5,8', '', '', '0', 1000.00, NULL, '2023-10-19 16:04:42', 'false', 'false'),
(4, 1, 1, 9.00, 19.80, '1,5,11,0,6,5,5,4,9,0,4,8,4,5,12', '9,24,26,29', 'right3,left3,left3,right3', '4', 1010.80, NULL, '2023-10-19 16:04:53', 'false', 'false'),
(5, 1, 1, 9.00, 5.40, '5,0,1,2,8,0,7,2,5,4,3,5,4,9,5', '2', 'right3', '1', 1007.20, NULL, '2023-10-19 16:04:59', 'false', 'false'),
(6, 1, 1, 9.00, 0.00, '2,5,1,9,6,12,4,6,0,5,4,0,6,10,1', '', '', '0', 998.20, NULL, '2023-10-19 16:05:05', 'false', 'false'),
(7, 1, 1, 9.00, 0.00, '3,6,0,7,0,6,3,1,5,0,3,7,0,9,4', '', '', '0', 989.20, NULL, '2023-10-19 16:05:08', 'false', 'false'),
(8, 1, 1, 9.00, 0.00, '3,10,1,5,12,9,7,0,5,0,4,3,7,5,9', '', '', '0', 980.20, NULL, '2023-10-19 16:05:12', 'false', 'false'),
(9, 1, 1, 9.00, 0.00, '0,9,5,10,0,2,3,10,5,9,4,6,4,10,5', '', '', '0', 971.20, NULL, '2023-10-19 16:05:15', 'false', 'false'),
(10, 1, 1, 9.00, 0.00, '7,3,10,5,8,4,2,3,5,6,4,2,0,10,5', '', '', '0', 962.20, NULL, '2023-10-19 16:05:19', 'false', 'false'),
(11, 1, 1, 9.00, 0.00, '8,7,1,4,5,2,1,2,9,5,4,0,11,7,2', '', '', '0', 953.20, NULL, '2023-10-19 16:05:22', 'false', 'false'),
(12, 1, 1, 9.00, 6.90, '9,0,12,0,1,4,7,11,3,1,6,5,7,6,8', '0,15', 'right3,left3', '2', 951.10, NULL, '2023-10-19 16:05:25', 'false', 'false'),
(13, 2, 0, 5.00, 0.00, '0,1,2,3,4', '1', 'ZXFGnqiKpH2qt', '0', 995.00, NULL, '2023-10-19 16:12:32', 'false', 'false'),
(14, 4, 0, 0.00, 0.00, '3,4', '0', 'Kk7scNaFLKJdx', '0', 0.00, NULL, '2023-10-23 03:46:00', 'false', 'false'),
(15, 4, 1, 0.00, 0.00, '9,4,0,6,9,10,0,7,11,9,2,0,2,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:46:51', 'false', 'false'),
(16, 4, 1, 0.00, 0.00, '0,7,3,1,3,8,5,3,1,6,4,5,5,8,3', '', '', '0', 0.00, NULL, '2023-10-23 03:46:54', 'false', 'false'),
(17, 4, 1, 0.00, 0.00, '4,12,0,8,4,0,10,1,7,7,1,8,0,9,4', '', '', '0', 0.00, NULL, '2023-10-23 03:46:58', 'false', 'false'),
(18, 4, 1, 0.00, 0.00, '3,8,2,10,12,1,5,4,0,6,2,5,8,4,12', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(19, 4, 1, 0.00, 0.00, '12,3,6,8,3,10,0,4,1,12,2,1,5,6,5', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(20, 4, 1, 0.00, 0.00, '3,0,7,10,1,2,2,5,1,4,1,10,5,8,4', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(21, 4, 1, 0.00, 0.00, '3,8,2,2,9,5,9,5,1,2,5,4,4,5,6', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(22, 4, 1, 0.00, 0.00, '4,2,0,5,4,2,1,4,3,2,6,0,8,4,5', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(23, 4, 1, 0.00, 0.00, '5,0,1,1,0,5,5,7,10,2,1,9,6,10,8', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(24, 4, 1, 0.00, 0.00, '0,4,10,9,5,7,1,4,3,4,2,5,5,6,7', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(25, 4, 1, 0.00, 0.00, '9,12,6,3,4,9,12,0,2,9,12,2,3,10,5', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(26, 4, 1, 0.00, 0.00, '1,3,8,5,9,3,12,3,4,1,6,5,5,8,4', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(27, 4, 1, 0.00, 0.00, '9,0,3,8,0,5,5,1,7,6,5,3,5,8,4', '', '', '0', 0.00, NULL, '2023-10-23 03:47:04', 'false', 'false'),
(28, 4, 3, 0.00, 0.00, '4,2,0,5,4,1,3,4,5,5,11,6,3,8,11', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(29, 4, 3, 0.00, 0.00, '10,3,9,0,12,1,0,4,1,0,1,5,6,10,8', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(30, 4, 3, 0.00, 0.00, '2,9,0,5,0,4,0,12,2,10,3,9,2,3,10', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(31, 4, 3, 0.00, 0.00, '6,5,4,8,0,5,2,9,5,5,0,8,12,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(32, 4, 3, 0.00, 0.00, '4,7,10,2,6,2,1,7,6,5,5,10,7,8,2', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(33, 4, 3, 0.00, 0.00, '4,10,5,6,5,4,6,3,4,4,5,11,10,4,5', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(34, 4, 3, 0.00, 0.00, '2,2,9,6,2,9,1,0,3,1,9,0,8,2,7', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(35, 4, 3, 0.00, 0.00, '0,5,8,7,6,1,2,4,1,1,9,0,4,5,6', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(36, 4, 3, 0.00, 0.00, '7,5,4,1,2,5,5,1,7,3,4,5,9,1,6', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(37, 4, 3, 0.00, 0.00, '4,5,0,0,12,1,12,0,2,5,3,10,8,4,12', '', '', '0', 0.00, NULL, '2023-10-23 03:48:33', 'false', 'false'),
(38, 4, 2, 0.00, 0.00, '6,8,4,0,3,6,0,5,12,3,10,12,5,8,3', '', '', '0', 0.00, NULL, '2023-10-23 03:49:36', 'false', 'false'),
(39, 4, 2, 0.00, 0.00, '3,4,8,4,3,1,0,8,5,12,4,2,7,5,9', '', '', '0', 0.00, NULL, '2023-10-23 03:49:39', 'false', 'false'),
(40, 4, 2, 0.00, 0.00, '10,3,9,4,3,9,3,5,8,0,3,1,2,3,8', '11', '', '1', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(41, 4, 2, 0.00, 0.00, '7,0,4,2,0,12,1,9,6,5,11,6,6,7,5', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(42, 4, 2, 0.00, 0.00, '4,0,3,10,1,2,0,11,1,9,0,3,7,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(43, 4, 2, 0.00, 0.00, '5,1,12,2,9,5,0,2,1,10,4,2,2,3,8', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(44, 4, 2, 0.00, 0.00, '4,2,1,9,12,8,10,7,2,6,0,1,5,6,10', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(45, 4, 2, 0.00, 0.00, '8,10,7,12,1,2,4,0,5,0,4,1,6,7,5', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(46, 4, 2, 0.00, 0.00, '4,2,0,11,0,1,0,12,2,9,12,2,7,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(47, 4, 2, 0.00, 0.00, '5,9,2,5,4,2,5,1,9,1,3,0,5,10,4', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(48, 4, 2, 0.00, 0.00, '0,4,10,12,1,8,7,6,3,1,9,0,10,8,9', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(49, 4, 2, 0.00, 0.00, '0,4,0,2,6,2,12,3,4,12,2,1,10,8,9', '', '', '0', 0.00, NULL, '2023-10-23 03:50:33', 'false', 'false'),
(50, 4, 3, 0.00, 0.00, '8,5,2,0,9,1,5,10,2,2,3,1,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:17', 'false', 'false'),
(51, 4, 4, 0.00, 0.00, '5,12,4,0,7,2,9,4,6,5,1,4,8,6,11', '', '', '0', 0.00, NULL, '2023-10-23 03:51:17', 'false', 'false'),
(52, 4, 4, 0.00, 0.00, '1,5,11,5,6,4,9,3,10,6,5,0,5,2,11', '', '', '0', 0.00, NULL, '2023-10-23 03:51:22', 'false', 'false'),
(53, 4, 3, 0.00, 0.00, '7,0,5,8,4,3,5,12,8,5,4,0,12,6,2', '', '', '0', 0.00, NULL, '2023-10-23 03:51:22', 'false', 'false'),
(54, 4, 3, 0.00, 0.00, '3,4,8,11,6,0,0,7,11,5,1,6,3,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:51:26', 'false', 'false'),
(55, 4, 4, 0.00, 0.00, '5,9,0,8,3,5,10,1,7,11,9,2,9,5,11', '', '', '0', 0.00, NULL, '2023-10-23 03:51:26', 'false', 'false'),
(56, 4, 4, 0.00, 0.00, '10,4,3,6,9,10,0,1,2,5,8,0,5,8,0', '', '', '0', 0.00, NULL, '2023-10-23 03:51:28', 'false', 'false'),
(57, 4, 3, 0.00, 0.00, '6,2,5,6,12,5,10,5,1,4,5,9,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:28', 'false', 'false'),
(58, 4, 3, 0.00, 0.00, '11,8,7,2,4,5,2,5,4,4,6,2,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:31', 'false', 'false'),
(59, 4, 4, 0.00, 0.00, '1,6,3,2,8,0,4,2,5,4,2,5,6,0,10', '', '', '0', 0.00, NULL, '2023-10-23 03:51:31', 'false', 'false'),
(60, 4, 4, 0.00, 0.00, '8,4,10,2,4,7,5,1,8,5,8,0,8,5,2', '', '', '0', 0.00, NULL, '2023-10-23 03:51:35', 'false', 'false'),
(61, 4, 3, 0.00, 0.00, '7,3,10,2,1,3,3,10,6,3,1,9,6,8,5', '', '', '0', 0.00, NULL, '2023-10-23 03:51:35', 'false', 'false'),
(62, 4, 4, 0.00, 0.00, '4,0,5,5,7,3,6,8,2,1,9,0,11,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(63, 4, 4, 0.00, 0.00, '5,4,2,10,1,2,5,9,10,1,4,2,2,3,8', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(64, 4, 4, 0.00, 0.00, '0,3,0,0,5,4,5,12,0,5,11,6,4,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(65, 4, 4, 0.00, 0.00, '8,7,5,8,3,10,5,10,7,9,6,0,10,7,8', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(66, 4, 4, 0.00, 0.00, '1,12,10,6,1,2,10,2,5,12,1,6,4,5,6', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(67, 4, 4, 0.00, 0.00, '8,7,5,6,1,2,5,9,8,11,2,4,7,4,5', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(68, 4, 4, 0.00, 0.00, '2,7,0,12,1,8,9,8,7,4,7,5,9,10,7', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(69, 4, 4, 0.00, 0.00, '0,5,4,2,0,12,8,7,5,4,1,10,5,6,7', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(70, 4, 4, 0.00, 0.00, '7,10,5,9,12,8,12,3,4,2,1,4,3,10,5', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(71, 4, 4, 0.00, 0.00, '4,5,0,4,10,11,7,5,4,0,8,11,9,1,6', '', '', '0', 0.00, NULL, '2023-10-23 03:51:41', 'false', 'false'),
(72, 4, 4, 0.00, 0.00, '8,1,12,9,5,0,3,6,12,5,0,1,8,4,12', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(73, 4, 4, 0.00, 0.00, '5,0,1,1,0,2,1,0,12,5,6,9,1,6,7', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(74, 4, 4, 0.00, 0.00, '4,7,10,10,11,0,7,5,12,0,3,1,4,5,3', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(75, 4, 4, 0.00, 0.00, '0,3,1,1,2,8,1,0,3,4,2,1,6,5,11', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(76, 4, 4, 0.00, 0.00, '10,6,9,3,4,0,5,2,7,5,9,4,1,7,9', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(77, 4, 4, 0.00, 0.00, '8,7,5,6,9,5,4,5,12,2,1,4,11,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(78, 4, 4, 0.00, 0.00, '6,5,4,4,2,3,4,1,0,7,8,6,5,8,9', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(79, 4, 4, 0.00, 0.00, '5,4,2,4,9,12,1,7,6,1,0,4,0,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(80, 4, 4, 0.00, 0.00, '6,4,5,1,8,0,3,0,4,3,1,5,7,5,8', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(81, 4, 4, 0.00, 0.00, '10,5,8,12,8,3,0,12,2,6,0,1,11,2,3', '', '', '0', 0.00, NULL, '2023-10-23 03:52:10', 'false', 'false'),
(82, 4, 0, 20.00, 56.40, '2', '2,0,3', '5rrkRJ2JaIrxLFi', '2', 980.00, NULL, '2023-10-23 03:52:40', 'false', 'false'),
(83, 5, 6, 20.00, 0.00, '2', '3,1,0', '2gLpzNTxXyGDPZs', '2', 1165.60, NULL, '2023-10-23 17:18:32', 'false', 'false'),
(84, 5, 6, 20.00, 0.00, '0', '0', 'oKoW3s8rFNPifQV', '0', 1205.60, NULL, '2023-10-23 17:31:24', 'false', 'false'),
(85, 5, 6, 20.00, 0.00, '2', '0,1,3', 'BMAVHLUBzXPnUtK', '1', 1185.60, NULL, '2023-10-23 17:31:46', 'false', 'false'),
(86, 5, 6, 10.00, 0.00, '0', '1,3,2', 'WQzoMvNqhFPPG1K', '2', 1172.00, NULL, '2023-10-23 17:32:04', 'false', 'false'),
(87, 5, 6, 20.00, 56.40, '2', '1,0,2', 'Cqq79ng76ODDPZj', '2', 1145.60, NULL, '2023-10-23 17:47:49', 'false', 'false'),
(88, 5, 6, 20.00, 0.00, '0', '0', 'U3bQGGeMZUy3ECE', '0', 1202.00, NULL, '2023-10-23 17:52:23', 'false', 'false'),
(89, 5, 6, 20.00, 0.00, '2', '0,3', 'hzYUbAiUwzDtgpI', '4', 1182.00, NULL, '2023-10-23 17:54:21', 'false', 'false'),
(90, 5, 6, 20.00, 24.00, '2', '1,0,2', '1SaihB0ZLcsMCYQ', '1', 1369.40, NULL, '2023-10-23 17:54:37', 'false', 'true'),
(91, 4, 4, 0.00, 0.00, '7,5,1,3,5,4,1,6,8,4,5,6,3,10,5', '', '', '0', 0.00, NULL, '2023-10-24 10:58:53', 'false', 'false'),
(92, 4, 4, 0.00, 0.00, '0,3,0,2,7,6,6,8,2,5,2,1,6,5,11', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(93, 4, 4, 0.00, 0.00, '3,8,2,5,3,4,0,5,8,1,3,0,11,2,3', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(94, 4, 4, 0.00, 0.00, '4,2,2,10,2,6,3,4,0,2,1,4,5,11,2', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(95, 4, 4, 0.00, 0.00, '6,4,2,1,2,7,1,7,5,11,2,4,6,7,4', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(96, 4, 4, 0.00, 0.00, '0,3,8,0,12,1,0,2,1,9,6,0,3,8,4', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(97, 4, 4, 0.00, 0.00, '4,2,1,1,0,2,10,1,4,5,5,10,4,5,6', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(98, 4, 4, 0.00, 0.00, '5,0,4,9,5,0,4,5,12,1,10,3,10,7,8', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(99, 4, 4, 0.00, 0.00, '3,9,12,4,0,5,6,10,0,9,6,0,10,5,6', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(100, 4, 4, 0.00, 0.00, '10,3,9,3,4,9,7,6,3,10,7,8,10,7,8', '', '', '0', 0.00, NULL, '2023-10-24 10:58:54', 'false', 'false'),
(101, 4, 3, 0.00, 0.00, '3,10,1,12,2,1,1,2,9,0,4,3,11,7,5', '', '', '0', 0.00, NULL, '2023-10-24 11:10:21', 'false', 'false'),
(102, 4, 3, 0.00, 0.00, '4,10,2,3,6,5,5,10,2,7,2,5,5,11,6', '', '', '0', 0.00, NULL, '2023-10-24 11:10:25', 'false', 'false'),
(103, 4, 3, 0.00, 0.00, '3,4,8,8,0,5,0,6,5,1,5,3,11,7,2', '', '', '0', 0.00, NULL, '2023-10-24 11:10:29', 'false', 'false'),
(104, 4, 3, 0.00, 0.00, '1,5,11,4,0,10,10,5,1,3,5,1,5,4,9', '', '', '0', 0.00, NULL, '2023-10-24 11:10:36', 'false', 'false'),
(105, 4, 3, 0.00, 0.00, '4,3,2,0,3,6,0,7,11,0,3,7,7,5,9', '', '', '0', 0.00, NULL, '2023-10-24 11:10:41', 'false', 'false'),
(106, 4, 3, 0.00, 0.00, '12,3,6,4,9,12,0,2,4,4,1,10,0,5,8', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(107, 4, 3, 0.00, 0.00, '3,0,5,11,0,1,6,8,2,2,1,0,11,2,3', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(108, 4, 3, 0.00, 0.00, '3,8,2,12,8,3,3,4,0,2,8,2,10,7,8', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(109, 4, 3, 0.00, 0.00, '2,8,10,10,1,2,3,1,7,5,0,8,11,0,5', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(110, 4, 3, 0.00, 0.00, '5,0,4,6,2,9,5,8,2,5,11,6,4,12,2', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(111, 4, 3, 0.00, 0.00, '4,5,0,4,2,3,5,8,2,5,0,1,9,1,6', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(112, 4, 3, 0.00, 0.00, '2,9,0,9,5,7,5,12,0,9,6,0,8,2,7', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(113, 4, 3, 0.00, 0.00, '9,2,8,5,7,8,4,1,0,12,1,6,8,4,12', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(114, 4, 3, 0.00, 0.00, '9,0,3,0,5,6,5,2,7,2,1,4,7,5,3', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(115, 4, 3, 0.00, 0.00, '9,3,0,12,8,3,0,2,4,1,5,3,6,7,4', '', '', '0', 0.00, NULL, '2023-10-24 11:10:46', 'false', 'false'),
(116, 4, 1, 0.00, 0.00, '7,0,5,10,5,11,4,5,0,12,7,1,5,6,10', '', '', '0', 0.00, NULL, '2023-10-24 11:12:00', 'false', 'false'),
(117, 4, 1, 0.00, 0.00, '5,0,1,0,6,5,6,5,3,9,4,6,11,6,0', '', '', '0', 0.00, NULL, '2023-10-24 11:12:06', 'false', 'false'),
(118, 4, 1, 0.00, 0.00, '7,4,8,2,6,9,9,4,6,1,11,9,3,4,9', '', '', '0', 0.00, NULL, '2023-10-24 11:12:10', 'false', 'false'),
(119, 4, 1, 0.00, 0.00, '8,4,10,4,5,2,4,10,1,5,1,6,4,9,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:13', 'false', 'false'),
(120, 4, 1, 0.00, 0.00, '6,3,4,1,3,8,9,4,8,0,4,3,9,3,1', '', '', '0', 0.00, NULL, '2023-10-24 11:12:16', 'false', 'false'),
(121, 4, 1, 0.00, 0.00, '3,6,4,3,4,0,5,8,2,4,5,6,5,8,9', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(122, 4, 1, 0.00, 0.00, '4,0,5,5,7,8,2,3,5,10,4,2,5,9,11', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(123, 4, 1, 0.00, 0.00, '6,4,5,8,5,9,2,3,5,12,2,1,3,10,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(124, 4, 1, 0.00, 0.00, '8,10,7,8,5,0,4,5,12,2,4,5,10,4,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(125, 4, 1, 0.00, 0.00, '12,6,4,0,12,1,2,5,9,5,0,1,2,7,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(126, 4, 1, 0.00, 0.00, '5,1,12,7,3,5,4,0,5,6,9,3,8,9,10', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(127, 4, 1, 0.00, 0.00, '8,1,10,11,0,1,2,1,6,5,6,9,3,8,11', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(128, 4, 1, 0.00, 0.00, '4,0,3,4,2,3,5,7,10,12,2,1,2,3,8', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(129, 4, 1, 0.00, 0.00, '8,5,9,5,7,3,0,3,4,2,5,4,5,6,7', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(130, 4, 1, 0.00, 0.00, '3,1,11,9,5,0,12,0,2,0,4,1,10,4,5', '', '', '0', 0.00, NULL, '2023-10-24 11:12:22', 'false', 'false'),
(131, 4, 3, 0.00, 0.00, '8,7,9,5,0,7,12,8,2,9,0,4,8,5,2', '', '', '0', 0.00, NULL, '2023-10-24 12:17:04', 'false', 'false'),
(132, 4, 4, 0.00, 0.00, '0,5,3,0,10,5,4,7,0,11,9,2,10,1,4', '', '', '0', 0.00, NULL, '2023-10-24 12:17:04', 'false', 'false'),
(133, 4, 4, 0.00, 0.00, '5,0,1,5,10,4,0,8,5,7,10,5,5,12,6', '', '', '0', 0.00, NULL, '2023-10-24 12:17:08', 'false', 'false'),
(134, 4, 3, 0.00, 0.00, '12,4,3,3,1,10,5,0,9,8,6,4,7,5,4', '', '', '0', 0.00, NULL, '2023-10-24 12:17:08', 'false', 'false'),
(135, 3, 3, 0.00, 0.00, '2,8,7,12,5,8,4,8,1,10,7,2,11,6,0', '', '', '0', 0.00, NULL, '2023-10-24 13:38:31', 'false', 'false'),
(136, 3, 3, 0.00, 0.00, '7,3,10,11,6,0,5,3,1,0,3,7,6,8,5', '', '', '0', 0.00, NULL, '2023-10-24 13:38:38', 'false', 'false'),
(137, 3, 3, 0.00, 0.00, '7,1,0,2,1,3,10,1,7,9,4,6,2,11,7', '', '', '0', 0.00, NULL, '2023-10-24 13:39:15', 'false', 'false'),
(138, 3, 3, 0.00, 0.00, '2,0,9,10,5,11,4,6,5,3,9,0,5,12,6', '', '', '0', 0.00, NULL, '2023-10-24 13:39:22', 'false', 'false'),
(139, 3, 3, 0.00, 0.00, '3,5,9,0,6,5,7,0,2,6,2,0,0,10,5', '', '', '0', 0.00, NULL, '2023-10-24 13:39:25', 'false', 'false'),
(140, 2, 0, 1.00, 0.00, '1', '3,2,0', 'VY6zEXrui7rYKxP', '1', 999.00, NULL, '2023-10-25 10:11:43', 'false', 'false'),
(141, 5, 6, 10.00, 0.00, '3', '0', 'SCxRQkCQIwDjIUr', '7', 1162.00, NULL, '2023-10-25 10:12:36', 'false', 'false'),
(142, 5, 6, 10.00, 0.00, '0', '0', 'vKCd8at7FzW5cTL', '0', 1162.00, NULL, '2023-10-25 10:14:31', 'false', 'true'),
(143, 6, 0, 25.00, 125.00, '0', '2,0,3', 'HEUehmXkY4ZnPBf', '3', 9975.00, NULL, '2023-10-25 10:20:46', 'false', 'false'),
(144, 2, 6, 1.00, 4.86, '3', '2,3,1', 'Y3ymzOtr3gsDAEd', '2', 998.00, NULL, '2023-10-25 10:23:16', 'false', 'false'),
(145, 6, 6, 10.00, 0.00, '0', '1,3,2', '3nbqIGXzdYAlsMU', '2', 10090.00, NULL, '2023-10-25 10:23:18', 'false', 'false'),
(146, 6, 6, 10.00, 12.00, '3', '3,2,0', '9rB6NhSD9g3Lwpg', '1', 10080.00, NULL, '2023-10-25 10:24:08', 'false', 'false'),
(147, 2, 6, 2.00, 5.64, '3', '3,2,1', 'rH2kXlZY4vXS5lI', '2', 1000.86, NULL, '2023-10-25 10:25:42', 'false', 'false'),
(148, 6, 6, 1200.00, 0.00, '0', '0', 'IDrCz4nmAROYDOO', '0', 10092.00, NULL, '2023-10-25 10:25:47', 'false', 'false'),
(149, 6, 6, 10.00, 888.20, '3', '3,0,1', 'e0ukgLmiDMcbL0Y', '3', 10082.00, NULL, '2023-10-25 10:26:16', 'false', 'false'),
(150, 2, 6, 5.00, 0.00, '1', '0,3,2', 'iW8svoRxde1E3P8', '1', 1001.50, NULL, '2023-10-25 10:26:49', 'false', 'false'),
(151, 6, 6, 200.00, 240.00, '3', '3,0,1', 'U1JAP8SzjyljINu', '1', 10770.20, NULL, '2023-10-25 10:28:51', 'false', 'false'),
(152, 6, 6, 10.00, 0.00, '0', '3,2,1', '4PwPTGz4YUCj7l7', '1', 11000.20, NULL, '2023-10-25 10:29:35', 'false', 'false'),
(153, 2, 6, 1.00, 0.00, '0', '1,2,3', '8OoDXFIt9oiB8eI', '3', 1000.50, NULL, '2023-10-25 13:45:56', 'false', 'false'),
(154, 6, 6, 10.00, 0.00, '3', '1,2,0', 'v3bUVO5TjDUgaLN', '2', 10990.20, NULL, '2023-10-25 14:41:46', 'false', 'false'),
(155, 6, 6, 10.00, 28.20, '1', '2,3,1', 'W1rzXbm2TNotWWG', '2', 10980.20, NULL, '2023-10-25 14:42:19', 'false', 'false'),
(156, 6, 6, 10.00, 12.00, '2', '2,0,1', 'TFKKNg7Omu4Vr6A', '1', 10998.40, NULL, '2023-10-25 14:43:04', 'false', 'false'),
(157, 6, 6, 10.00, 0.00, '0', '0', 'vK2NaFHz5R9vBiC', '0', 11010.40, NULL, '2023-10-25 14:43:47', 'false', 'false'),
(158, 6, 6, 5.00, 6.00, '0', '0,3,1', 'ewnoPfe1Bk6dYYo', '1', 11005.40, NULL, '2023-10-25 14:44:24', 'false', 'false'),
(159, 6, 6, 3.00, 8.46, '0', '3,0,2', 'QIaKvzUf0S9Fc6B', '2', 11008.40, NULL, '2023-10-25 14:44:59', 'false', 'false'),
(160, 6, 6, 10.00, 0.00, '1', '3,0,2', 'Y3Rtncdr0TrHLtX', '2', 11006.86, NULL, '2023-10-25 15:16:00', 'false', 'false'),
(161, 6, 6, 10.00, 21.80, '0', '1,2,0', 'xXkSvyt1mSnXdtC', '3', 10996.86, NULL, '2023-10-25 15:16:35', 'false', 'false'),
(162, 6, 6, 10.00, 28.20, '1', '1,3,0', 'r2iWpZcVl2Gvd7z', '2', 11008.66, NULL, '2023-10-25 15:17:54', 'false', 'false'),
(163, 6, 6, 10.00, 0.00, '0', '3,2', 'jNLcAAIO1eqrb7E', '4', 11026.86, NULL, '2023-10-25 15:18:39', 'false', 'false'),
(164, 6, 6, 10.00, 50.00, '1', '0,1,2', 'FUr01tEmG3JAD6t', '3', 11016.86, NULL, '2023-10-25 15:43:53', 'false', 'false'),
(165, 6, 6, 10.00, 0.00, '1', '0,3,2', '0jwJWVXDvna04gu', '2', 11056.86, NULL, '2023-10-25 15:45:02', 'false', 'false'),
(166, 6, 6, 10.00, 0.00, '3', '1,2,0', 'YYXHvOiuODZME2g', '2', 11046.86, NULL, '2023-10-25 15:45:25', 'false', 'false'),
(167, 6, 6, 10.00, 0.00, '1', '0,3,2', '0ugvJGxTEobwvfA', '2', 11036.86, NULL, '2023-10-25 15:45:59', 'false', 'false'),
(168, 6, 6, 10.00, 38.00, '1', '0,1,3', 'xqOOxXPg6Y6xZYb', '3', 11026.86, NULL, '2023-10-25 15:46:28', 'false', 'false'),
(169, 6, 6, 10.00, 28.20, '2', '2,0,3', 'yCyOccVmUO9kH24', '2', 11054.86, NULL, '2023-10-25 15:47:15', 'false', 'false'),
(170, 6, 6, 10.00, 0.00, '3', '0,1,3', 'Fb0b4C0QZ3IImeL', '1', 11073.06, NULL, '2023-10-25 15:48:15', 'false', 'false'),
(171, 6, 6, 10.00, 0.00, '0', '1,0,3', 'W9rsugHlxdG7H9X', '1', 11063.06, NULL, '2023-10-25 15:49:21', 'false', 'false'),
(172, 6, 6, 10.00, 12.00, '3', '0,3,1', 'Lsu6npdSaOaqvh3', '1', 11053.06, NULL, '2023-10-25 15:49:50', 'false', 'false'),
(173, 2, 6, 1.00, 0.00, '0', '0', 'Ypt4S77ucGqu4CS', '0', 1000.50, NULL, '2023-10-25 17:23:07', 'false', 'true'),
(174, 2, 0, 5.00, 9.20, '0,1', '1', '8NYDV5T6YmnCK', '0', 1004.70, NULL, '2023-10-25 21:33:51', 'false', 'false'),
(175, 2, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'R2GercPzhnRex', '0', 0.00, NULL, '2023-10-25 21:34:23', 'false', 'false'),
(176, 6, 6, 10.00, 28.20, '1', '3,1,0', 'o3qHFqyCBYFJwVz', '2', 11055.06, NULL, '2023-10-26 05:16:38', 'false', 'false'),
(177, 6, 6, 10.00, 0.00, '2', '1,0,2', 'S2exGIz9jmeLoSK', '2', 11073.26, NULL, '2023-10-26 05:17:17', 'false', 'false'),
(178, 6, 6, 10.00, 50.00, '0', '1,3,0', 'QIBO5A9BcudkvSl', '3', 11063.26, NULL, '2023-10-26 06:12:15', 'false', 'false'),
(179, 6, 6, 10.00, 0.00, '2', '1,3,0', 's4WyA9Qw4qDXXad', '1', 11103.26, NULL, '2023-10-26 06:21:08', 'false', 'false'),
(180, 6, 6, 10.00, 38.00, '1', '1,2,3', 'HcVBapCXcEeAygJ', '3', 11093.26, NULL, '2023-10-26 06:22:09', 'false', 'false'),
(181, 6, 6, 10.00, 12.00, '3', '3,1,2', 'ww0nBG2VsYJsosg', '1', 11121.26, NULL, '2023-10-26 06:28:11', 'false', 'false'),
(182, 6, 6, 10.00, 0.00, '1', '2,0', 'ojPGUYSGtX6nklw', '4', 11123.26, NULL, '2023-10-26 06:28:55', 'false', 'false'),
(183, 6, 6, 10.00, 0.00, '3', '0,1,2', 'Vf1Dbd9nh1XKdhe', '2', 11113.26, NULL, '2023-10-26 07:25:43', 'false', 'false'),
(184, 6, 6, 10.00, 0.00, '3', '0,3', 'WHJjpW9bhbFIC4x', '4', 11103.26, NULL, '2023-10-26 07:26:11', 'false', 'false'),
(185, 6, 6, 10.00, 0.00, '1', '2,3,0', 'hANjdfLLStREbQH', '1', 11093.26, NULL, '2023-10-26 07:27:16', 'false', 'false'),
(186, 6, 6, 10.00, 0.00, '2', '2,0,1', 'PSzTMLJjmBYWmrB', '1', 11083.26, NULL, '2023-10-26 07:28:38', 'false', 'false'),
(187, 6, 6, 10.00, 0.00, '1', '3,0,2', '7psamYUgQGjJZYN', '2', 11073.26, NULL, '2023-10-26 07:29:03', 'false', 'false'),
(188, 6, 6, 10.00, 0.00, '0', '0,1,3', 'DrAAJCnzy147qiJ', '1', 11063.26, NULL, '2023-10-26 07:29:50', 'false', 'false'),
(189, 6, 6, 10.00, 0.00, '3', '3,2,0', 'pi94z1EvxEkBIUN', '3', 11053.26, NULL, '2023-10-26 07:30:35', 'false', 'false'),
(190, 6, 6, 10.00, 12.00, '1', '1,0,3', 'nIfrZXiTd4yvp1E', '1', 11043.26, NULL, '2023-10-26 07:32:00', 'false', 'false'),
(191, 6, 6, 10.00, 28.20, '2', '3,2,1', 'VA3hxM4272yKlDz', '2', 11045.26, NULL, '2023-10-26 08:00:40', 'false', 'false'),
(192, 6, 6, 10.00, 28.20, '3', '1,2,3', 'GzrHKcNDou5sXD7', '2', 11063.46, NULL, '2023-10-26 08:01:16', 'false', 'false'),
(193, 6, 6, 10.00, 50.00, '0', '0,1,2', '1IqxWf9fQSPB2fT', '3', 11081.66, NULL, '2023-10-26 08:02:34', 'false', 'false'),
(194, 6, 6, 10.00, 0.00, '3', '0,1,2', 'UcGxxvSXVXGVUpa', '1', 11121.66, NULL, '2023-10-26 08:03:28', 'false', 'false'),
(195, 6, 6, 10.00, 0.00, '2', '3,1,0', 'QccSYNMktG4BAdo', '1', 11111.66, NULL, '2023-10-26 08:05:35', 'false', 'false'),
(196, 6, 6, 10.00, 16.20, '1', '1,0,3', 'xbkhwMuXjMBwi0R', '2', 11101.66, NULL, '2023-10-26 08:05:53', 'false', 'false'),
(197, 6, 6, 10.00, 0.00, '3', '2,0,1', 'Q7CCm3khq9FIXut', '1', 11107.86, NULL, '2023-10-26 08:09:44', 'false', 'false'),
(198, 6, 6, 10.00, 0.00, '0', '2,3', '3NM8cm8DtS7zO2k', '4', 11097.86, NULL, '2023-10-26 08:09:57', 'false', 'false'),
(199, 6, 6, 10.00, 0.00, '2', '1,0,3', 'IKzaKTkluZMXxdN', '1', 11087.86, NULL, '2023-10-26 08:10:42', 'false', 'false'),
(200, 6, 6, 10.00, 0.00, '3', '2,1,0', 'IamtdIDp52ogukU', '2', 11077.86, NULL, '2023-10-26 08:10:56', 'false', 'false'),
(201, 6, 6, 10.00, 0.00, '1', '2,3,0', 'M2zRD1OPq350Kde', '2', 11067.86, NULL, '2023-10-26 08:11:20', 'false', 'false'),
(202, 6, 6, 10.00, 21.80, '2', '2,1,3', 'xYKf9PuQsUw88w0', '3', 11057.86, NULL, '2023-10-26 08:11:44', 'false', 'false'),
(203, 6, 6, 10.00, 0.00, '1', '2,3,0', 'RKxrzLkPzTxk2Pz', '1', 11069.66, NULL, '2023-10-26 08:12:33', 'false', 'false'),
(204, 6, 6, 10.00, 0.00, '1', '3,2', 'tVPKXLGImxpXnx5', '5', 11059.66, NULL, '2023-10-26 08:39:33', 'false', 'false'),
(205, 6, 6, 10.00, 0.00, '1', '2,0,3', 'qxxdWRVEOdtWVfu', '2', 11049.66, NULL, '2023-10-26 08:40:42', 'false', 'false'),
(206, 6, 6, 10.00, 12.00, '0', '1,3,0', 'q4vQrBLv27O4GOK', '1', 11039.66, NULL, '2023-10-26 08:41:53', 'false', 'false'),
(207, 6, 6, 10.00, 16.20, '3', '2,0,3', 'dkiLiliIikYFknK', '2', 11041.66, NULL, '2023-10-26 08:42:27', 'false', 'false'),
(208, 6, 6, 10.00, 0.00, '0', '1,2', 'pOKhpnegXtXZHJH', '5', 11047.86, NULL, '2023-10-26 08:43:02', 'false', 'false'),
(209, 6, 6, 10.00, 0.00, '3', '2,0,1', '0F15W4CBEuzoWnT', '3', 11037.86, NULL, '2023-10-26 08:43:56', 'false', 'false'),
(210, 6, 6, 10.00, 21.80, '3', '0,1,3', 'Khgd8vrXPef4I1c', '3', 11027.86, NULL, '2023-10-26 08:45:12', 'false', 'false'),
(211, 6, 6, 10.00, 0.00, '1', '3,2,0', '7l6aB1kSySJF7wC', '2', 11039.66, NULL, '2023-10-26 08:46:02', 'false', 'false'),
(212, 6, 6, 10.00, 0.00, '1', '2,0,3', '0wStbKTzn95dqLV', '2', 11029.66, NULL, '2023-10-26 08:46:28', 'false', 'false'),
(213, 6, 6, 10.00, 12.00, '3', '3,0,2', 'jI9eemq3TcEpQVG', '1', 11019.66, NULL, '2023-10-26 08:47:44', 'false', 'false'),
(214, 6, 6, 10.00, 12.00, '1', '3,0,1', 'If7Xpl39ABDPjdS', '1', 11021.66, NULL, '2023-10-26 08:48:13', 'false', 'false'),
(215, 6, 6, 10.00, 12.00, '1', '1,0,3', 'qDFhehDnUTCrvPl', '1', 11023.66, NULL, '2023-10-26 08:48:55', 'false', 'false'),
(216, 6, 6, 10.00, 16.20, '3', '0,3,2', 'E0k7h9FXjgRHfhS', '2', 11025.66, NULL, '2023-10-26 09:04:48', 'false', 'false'),
(217, 6, 6, 10.00, 21.80, '1', '1,3,2', 'dC22vVXFW0VuQvX', '3', 11031.86, NULL, '2023-10-26 09:05:37', 'false', 'false'),
(218, 6, 6, 10.00, 0.00, '2', '0,1,3', 'GRiax6VBgh4YDl1', '1', 11043.66, NULL, '2023-10-26 09:17:52', 'false', 'false'),
(219, 6, 6, 10.00, 0.00, '3', '2,1,0', 'W21pmYCR1oX6S2b', '1', 11033.66, NULL, '2023-10-26 09:19:04', 'false', 'false'),
(220, 6, 6, 10.00, 0.00, '1', '2,3,0', 'Gybgomg6CXWlb8n', '1', 11023.66, NULL, '2023-10-26 09:19:18', 'false', 'false'),
(221, 6, 6, 10.00, 0.00, '0', '2,1,3', 'KT1td04SKv5Y3Ru', '1', 11013.66, NULL, '2023-10-26 09:19:32', 'false', 'false'),
(222, 6, 6, 10.00, 0.00, '3', '1,0,2', 'TKW90axAOLnS0EJ', '1', 11003.66, NULL, '2023-10-26 09:19:46', 'false', 'false'),
(223, 6, 6, 10.00, 0.00, '2', '0,1,3', 'XLn4vBiczGWX4cz', '1', 10993.66, NULL, '2023-10-26 09:20:01', 'false', 'false'),
(224, 6, 6, 10.00, 0.00, '2', '3,1,0', 'SMRUa7a07LOay5P', '1', 10983.66, NULL, '2023-10-26 09:20:14', 'false', 'false'),
(225, 6, 6, 10.00, 12.00, '2', '1,0,2', 'J1vnAD5RsqMoqUs', '1', 10973.66, NULL, '2023-10-26 09:20:28', 'false', 'false'),
(226, 6, 6, 10.00, 0.00, '1', '2,3,0', 'OF7yXv5I5MdSQUy', '3', 10975.66, NULL, '2023-10-26 09:21:40', 'false', 'false'),
(227, 6, 6, 10.00, 0.00, '0', '1,3', '8TCWDTKtinqaKbY', '4', 10965.66, NULL, '2023-10-26 09:42:33', 'false', 'false'),
(228, 6, 6, 10.00, 0.00, '3', '0,1,2', 'FPKH9RASHGEeVpz', '2', 10955.66, NULL, '2023-10-26 09:43:54', 'false', 'false'),
(229, 6, 6, 10.00, 0.00, '3', '0,2,1', 'jGuz1CqGsZoozWi', '3', 10945.66, NULL, '2023-10-26 09:44:31', 'false', 'false'),
(230, 6, 6, 10.00, 0.00, '1', '3,2', 'aeUYvjzh3uLKst8', '4', 10935.66, NULL, '2023-10-26 09:47:03', 'false', 'false'),
(231, 6, 6, 10.00, 0.00, '3', '1,2', 'q4uX6fdlDcu6tMr', '5', 10925.66, NULL, '2023-10-26 10:39:30', 'false', 'false'),
(232, 6, 6, 10.00, 0.00, '3', '1,0', '1KEychGaxiihV9w', '4', 10915.66, NULL, '2023-10-26 10:41:10', 'false', 'false'),
(233, 6, 6, 10.00, 0.00, '0', '2,3', '3PPTfxkQhqnrXhU', '4', 10905.66, NULL, '2023-10-26 10:43:57', 'false', 'false'),
(234, 6, 6, 10.00, 0.00, '1', '0,2,3', '8PaL8C0PV47NO2v', '1', 10895.66, NULL, '2023-10-26 10:48:15', 'false', 'false'),
(235, 6, 6, 10.00, 0.00, '3', '0,2', '03imflwi4WGR5VB', '4', 10885.66, NULL, '2023-10-26 10:52:41', 'false', 'false'),
(236, 6, 6, 10.00, 0.00, '2', '1,3,0', 'Q4bDrJjnGNdxXGy', '2', 10875.66, NULL, '2023-10-26 10:54:40', 'false', 'false'),
(237, 6, 6, 10.00, 0.00, '3', '1,2', '6wFWfm6YiEl9ttl', '4', 10865.66, NULL, '2023-10-26 10:55:21', 'false', 'false'),
(238, 6, 6, 10.00, 12.00, '3', '3,0,2', 'V78XNAGCK46RVCi', '1', 10855.66, NULL, '2023-10-26 10:59:29', 'false', 'false'),
(239, 6, 6, 10.00, 0.00, '0', '1,3,2', 'kuZW1aDntHa0iNp', '3', 10857.66, NULL, '2023-10-26 11:05:12', 'false', 'false'),
(240, 6, 6, 10.00, 0.00, '1', '2,3,0', 'HTqe9aKKzNsaXGd', '1', 10847.66, NULL, '2023-10-26 11:05:44', 'false', 'false'),
(241, 6, 6, 10.00, 0.00, '0', '0', 'RJBXpJb8bN3MBDf', '0', 10847.66, NULL, '2023-10-26 11:05:59', 'false', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` bigint NOT NULL,
  `agent_id` bigint DEFAULT NULL,
  `bill_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `numberbill` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `accountName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `accountNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `transaction_date` date NOT NULL,
  `time` time NOT NULL,
  `bank` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status_withdraw` enum('success','in_progress','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'in_progress',
  `status_value` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'รอการอนุมัตื'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawalaccount`
--

CREATE TABLE `withdrawalaccount` (
  `id` bigint NOT NULL,
  `bankName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ธนาคารไทยพาณิชย์',
  `accountName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `accountNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `billmatched` int NOT NULL DEFAULT '0',
  `complated` int NOT NULL DEFAULT '0',
  `algorithm` enum('Sms','Bot Bank','Bank API') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Sms',
  `activestatus` enum('เปิดใช้งาน','ปิดใช้งาน') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'เปิดใช้งาน',
  `imgbank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nameAccount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `groupNewMember` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupBronze` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupSilver` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupGold` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `groupDiamond` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `auto_withdrawal` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `savingaccount` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `use_condition` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `for_promotion` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `billingpage` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `withdraw_over` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `banknames`
--
ALTER TABLE `banknames`
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
-- Indexes for table `depositaccount`
--
ALTER TABLE `depositaccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gamecamptotal`
--
ALTER TABLE `gamecamptotal`
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
-- Indexes for table `mastergroup`
--
ALTER TABLE `mastergroup`
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
-- Indexes for table `repostgame`
--
ALTER TABLE `repostgame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subagent`
--
ALTER TABLE `subagent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `totalamountdaily`
--
ALTER TABLE `totalamountdaily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `totalturnoverrepost`
--
ALTER TABLE `totalturnoverrepost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turnoverrepost`
--
ALTER TABLE `turnoverrepost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_play`
--
ALTER TABLE `user_play`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawalaccount`
--
ALTER TABLE `withdrawalaccount`
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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banknames`
--
ALTER TABLE `banknames`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comgogoldplanet`
--
ALTER TABLE `comgogoldplanet`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `commissionsubagent`
--
ALTER TABLE `commissionsubagent`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `creditpromotion`
--
ALTER TABLE `creditpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `depositaccount`
--
ALTER TABLE `depositaccount`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gamecamptotal`
--
ALTER TABLE `gamecamptotal`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gameweb`
--
ALTER TABLE `gameweb`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `imgpromotion`
--
ALTER TABLE `imgpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logdaygame`
--
ALTER TABLE `logdaygame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logedit`
--
ALTER TABLE `logedit`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logeditadmin`
--
ALTER TABLE `logeditadmin`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logeditagent`
--
ALTER TABLE `logeditagent`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logfinanceuser`
--
ALTER TABLE `logfinanceuser`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loggame`
--
ALTER TABLE `loggame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mastergroup`
--
ALTER TABLE `mastergroup`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `percentgame`
--
ALTER TABLE `percentgame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `repostgame`
--
ALTER TABLE `repostgame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `subagent`
--
ALTER TABLE `subagent`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `totalamountdaily`
--
ALTER TABLE `totalamountdaily`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `totalturnoverrepost`
--
ALTER TABLE `totalturnoverrepost`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `turnoverrepost`
--
ALTER TABLE `turnoverrepost`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_play`
--
ALTER TABLE `user_play`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawalaccount`
--
ALTER TABLE `withdrawalaccount`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
