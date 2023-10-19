-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 19, 2023 at 04:22 AM
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
(6, 'RoBo Farm', 'https://websitehui.s3.ap-southeast-1.amazonaws.com/new_size/size_tall/size_square/icon_4.png', 'https://testconstruct3games.s3.ap-southeast-1.amazonaws.com/Test_RoboFarm/index.html');

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
  `typelistsuppost` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creditpromotion`
--

INSERT INTO `creditpromotion` (`id`, `agnetidcreate`, `repost`, `startpromotion`, `endpromotion`, `typebonus`, `bunus`, `maxbunus`, `valusbunus`, `groupuser`, `afterPromotion`, `receiving_data_type`, `valus_receiving`, `data_type`, `valus_day`, `numberoftimes_person`, `ipAddress_attempts`, `reset`, `withdrawalType`, `withdraw_data_type`, `withdraw_max`, `withdraw_valus`, `statuspromotion`, `promotiontype`, `namepromotion`, `leakedPro`, `receiving_data_typeI`, `receiving_data_typeII`, `data_typeI`, `data_typeII`, `resetI`, `resetII`, `withdrawalTypeII`, `withdrawalTypeIII`, `withdraw_valusII`, `withdraw_valusIII`, `status_topup`, `filename`, `details`, `passwordpromotion`, `promotionsupport`, `webtype`, `multiplier`, `typelistsuppost`) VALUES
(1, 2, 'ทั่วไป', '2023-10-17', '2023-10-17', 'Fixed rate', 100.00, 100.00, 100.00, 'NewMember', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', '', '', 0.00, 0, 'N', 'ฝาก', '', 'ค่าคงที่', '', '', '', '', '00.00.00', '00.00.00', '', '', 0, 0, 'N', NULL, NULL, 'cost-type-fxf0c', 'PG Soft,Askmebet', 'game', '1', 'undefined'),
(2, 2, 'ทั่วไป', '2023-10-17', '2023-10-17', 'Fixed rate', 100.00, 100.00, 100.00, 'NewMember', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', '', '', 0.00, 0, 'N', 'ฝาก', '', 'ค่าคงที่', '', '', '', '', '00.00.00', '00.00.00', '', '', 0, 0, 'N', NULL, NULL, 'cost-type-fxf0c', 'PG Soft,Askmebet', 'game', '1', 'undefined'),
(3, 2, 'ทั่วไป', '2023-10-17', '2023-10-17', 'Fixed rate', 100.00, 100.00, 100.00, 'NewMember', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', '', '', 0.00, 0, 'N', 'ฝาก', 'Aaa', 'ค่าคงที่', '', '', '', '', '00.00.00', '00.00.00', '', '', 0, 0, 'N', NULL, NULL, 'cost-type-fxf0c', 'PG Soft,Askmebet', 'game', '1', 'undefined'),
(4, 2, 'ทั่วไป', '2023-10-17', '2023-10-17', 'Fixed rate', 100.00, 100.00, 100.00, 'NewMember', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', '', '', 0.00, 0, 'N', 'ฝาก', 'Aaa', 'ค่าคงที่', 'รายวัน', '', '', '', '00.00.00', '00.00.00', '', '', 0, 0, 'N', NULL, NULL, 'cost-type-fxf0c', 'PG Soft,Askmebet', 'game', '1', 'undefined'),
(5, 2, 'ทั่วไป', '2023-10-18', '2023-10-18', 'Fixed rate', 100.00, 100.00, 10.00, 'NewMember', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', 'Turnover Fixed', '', 0.00, 0, 'N', 'ฝาก', 'เทสวิค', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'undefined', 'เทสวิคเทสวิคเทสวิค', 'cost-type-8o6q8', 'PG Soft', 'game', '1', 'UpGame'),
(6, 2, 'ทั่วไป', '2023-10-18', '2023-10-18', 'Fixed rate', 200.00, 200.00, 10.00, 'NewMember', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', 'Turnover Fixed', '', 0.00, 0, 'N', 'ฝาก', 'วิคเทส2ๅ', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'undefined', 'วิคเทส2วิคเทส2  วิคเทส2  วิคเทส2', 'cost-type-74fi4f', 'Slotxo,Joker123,Spade Gaming', 'game', '1', 'UpGame'),
(7, 2, 'ทั่วไป', '2023-10-18', '2023-10-18', 'Fixed rate', 300.00, 300.00, 10.00, 'New Member', '', 'ฝากเงินครั้งแรก', 0, '', 0, 0, 0, '00.00.00', 'Turnover Rate', '', 0.00, 0, 'Y', 'ฝาก', 'test12', 'ค่าคงที่', 'undefined', 'undefined', 'undefined', 'undefined', '00.00.00', '00.00.00', '', '', 0, 0, 'N', 'file_dateVal_1697638490919_banner3.jpg', 'test1 test 1\n\ndfdfd', 'cost-type-vutvd8', 'PG Soft,Slotxo,Joker123,Askmebet,Habanero,Spade Gaming,Micro Gaming,Simple Play,Live22,Evoplay,CQ9,Jili,Mannaplay,Funky Games,Yggdrasil Gaming,UPG Slot,Ameba,Ambslot,Netent2,Red Tiger,Dragon Gaming,Ace333,I8,WmSlot,Spinix,Ninja slot,918 Kiss,Pragmatic Play Slot,DOGZILLA', 'game', '3', 'undefined');

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
(2, 'ธนาคารไทยพาณิชย์', 'TOONTA', NULL, 'แก้ไขไม่ได้ เนื่องจากผูก Api', 0, 0, 0, '1839900569939', 'Sms', 'เปิดใช้งาน', 'Test', 100, 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'พีรวัส ขวัญแก้ว', 'นายพีรวัสขวัญแก้ว');

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
  `levelrole` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `agent_id`, `username`, `password`, `name`, `phonenumber`, `status`, `created_at`, `login_latest`, `ip_address`, `role`, `levelrole`) VALUES
(1, 2, 'number11', 'ef775988943825d2871e1cfa75473ec0', 'หมายเลข1', '0000000000', 'true', '2023-10-18 12:29:06', '2023-10-18 12:29:06', '000.00.0.0', 'บริการลูกค้า', 'สมาชิก,รายชื่อสมาชิก,เพิ่มสมาชิก');

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
(1, 'DOGZILLA', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 13, '2023-10-17'),
(2, 'DOGZILLA', 0.00, 10.00, 9.20, 0.80, 0.00, 8.40, 0.80, 0.00, 0.74, 0.80, 0.00, 0.06, 2, '2023-10-18');

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
(29, NULL, 'DOGZILLA', 'DOGZILLA', 'N', 92.00);

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
(1, 1, 'false'),
(1, 1, 'false'),
(1, 1, 'true'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 3, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(27, 1, 'false'),
(6, 3, 'false'),
(6, 1, 'false'),
(3, 1, 'false'),
(6, 1, 'false'),
(6, 2, 'false'),
(3, 3, 'false'),
(1, 1, 'false'),
(1, 1, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
(6, 3, 'false'),
(1, 1, 'false'),
(6, 4, 'false'),
(6, 3, 'false'),
(6, 4, 'false'),
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
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 2, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'false'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(3, 1, 'true'),
(7, 3, 'false'),
(7, 3, 'false'),
(7, 3, 'false'),
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
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'false'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'true'),
(5, 2, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 1, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 3, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(2, 2, 'false'),
(7, 3, 'false'),
(7, 3, 'false'),
(5, 1, 'false'),
(5, 3, 'false'),
(5, 4, 'false'),
(5, 3, 'false'),
(5, 4, 'false'),
(5, 3, 'false'),
(5, 4, 'false'),
(5, 3, 'false'),
(5, 4, 'false'),
(5, 3, 'false'),
(5, 3, 'false'),
(5, 2, 'false'),
(5, 3, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 1, 'false'),
(5, 2, 'false'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'true'),
(5, 3, 'false'),
(5, 4, 'false'),
(5, 3, 'false'),
(1, 1, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 4, 'true'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 1, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 2, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(9, 4, 'false'),
(9, 4, 'false'),
(9, 3, 'false'),
(1, 2, 'false'),
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
(1, 4, 'false');

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
(1, 'วิคเทส2', 'วิคเทส2วิคเทส2  วิคเทส2  วิคเทส2', 'file', 'image.png', '7bit', 'image/png', 'public/images', 'file_dateVal_1697538499799_image.png', 'public/images/file_dateVal_1697538499799_image.png', 686081);

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
(4, 'agent', 2, 5, 'agent01', 'Credit ก่อนหน้า   0\n              ', 'Credit ปัจจุบัน = 100มีการเปลี่ยนโดย agent ชื่อ agent01', '2023-10-18 16:45:15', '2023-10-18');

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
(1, 'Go Gold Planet', 934, 5720.00, 1275.23, '/img/thumbs/icontest1.png'),
(2, 'Lucky Bunny Gold', 5498, 82809.00, 87081.12, '/img/thumbs/icontest2.png'),
(3, 'CowBoys VS Aliens', 4673, 10827.00, 4827.40, '/img/thumbs/icontest3.png');

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

--
-- Dumping data for table `mastergroup`
--

INSERT INTO `mastergroup` (`id`, `agent_id`, `account_name`, `account_number`, `color`, `password`, `minwithdrawal`, `withdrawalday`, `nameaccoun`, `mindeposit`, `withdrawalsperday`, `groupmaster`, `depositaccount`, `secondaryaccount`, `secondaryaccountII`, `secondaryaccountIII`, `imgbank`, `status_delete`) VALUES
(1, 2, 'พีรวัส ขวัญแก้ว', '1839900569939', '#df0101', 'รหัส', 15.00, 10, 'คนโครตจน', 10.00, 100, 'NewMember', 'พีรวัส ขวัญแก้ว', '1839900569939', '', '', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'Y'),
(2, 2, 'พีรวัส ขวัญแก้ว', '1839900569939', '#000000', 'รหัส', 0.00, 0, 'New Member', 0.00, 0, 'NewMember', 'พีรวัส ขวัญแก้ว', '1839900569939', '', '', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'N'),
(3, 2, 'พีรวัส ขวัญแก้ว', '1839900569939', '#c33404', 'u5grl9', 0.00, 0, 'Bronze', 0.00, 0, 'NewMember', 'พีรวัส ขวัญแก้ว', '1839900569939', '', '', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'N'),
(4, 2, 'พีรวัส ขวัญแก้ว', '1839900569939', '#b0b0b0', 'รหัส', 0.00, 0, 'Silver', 0.00, 0, 'NewMember', 'พีรวัส ขวัญแก้ว', '1839900569939', '', '', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'N'),
(5, 2, 'พีรวัส ขวัญแก้ว', '1839900569939', '#bc9338', 'ycps0u', 0.00, 0, 'Gold', 0.00, 0, 'NewMember', 'พีรวัส ขวัญแก้ว', '1839900569939', '', '', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'N'),
(6, 2, 'พีรวัส ขวัญแก้ว', '1839900569939', '#5ce4ff', 'da47gd', 0.00, 0, 'Diamond', 0.00, 0, 'NewMember', 'พีรวัส ขวัญแก้ว', '1839900569939', '', '', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'N'),
(7, 2, 'พีรวัส ขวัญแก้ว', '1839900569939', '#0000ff', 'u2gav5', 500.00, 100000, 'Kit', 1.00, 10, 'NewMember', 'พีรวัส ขวัญแก้ว', '1839900569939', '', '', 'https://asset.cloudigame.co/build/admin/img/wt_theme/ezc/payment-logo-scb.png', 'N');

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
  `turnover_playuser` double(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `agent_id`, `username_agent`, `member_code`, `name`, `credit`, `bet_latest`, `username`, `password`, `status`, `status_delete`, `created_at`, `created_attime`, `updated_at`, `ip_address`, `browserlogin`, `customerGroup`, `userrank`, `lineid`, `note`, `currency`, `bank`, `accountName`, `accountNumber`, `phonenumber`, `lastName`, `recharge_times`, `bonususer`, `deposit`, `withdraw_member`, `latest_withdrawal`, `groupmember`, `turnover`, `total_top_up_amount`, `promotionuser`, `passwordpromotion`, `turnover_playuser`) VALUES
(1, 2, 'Toonta', '2', 'จิรกฤต', 899.20, 5.00, '0954789782', '52c69e3a57331081823331c4e69d3f2e', 'N', 'N', '2023-10-17', '2023-10-17 10:52:48', '2023-10-17 10:52:48', '192.168.80.5', 'Apple Safari', 'NewMember', 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'นาย จิรกฤต โชคพฤทธิ์กุล', '2892287535', '0954789782', 'จิรกฤต', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 10.00),
(3, 2, 'Toonta', '2', 'Kittisak', 0.00, 0.00, '0879914004', '8a6f2805b4515ac12058e79e66539be9', 'Y', 'N', '2023-10-18', NULL, '2023-10-18 14:47:55', NULL, NULL, 'Null', 'New Member', '', '', 'บาท', 'ธนาคารกสิกรไทย', 'Kittisak', '1100700320579', '0879914004', 'Null', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00),
(5, 2, 'Toonta', '2', 'นาย ประยุทธิ์ จันทร์โอชา', 100.00, 0.00, '0990825942', '1c8a0fb0f77321b2fea4124168f33eef', 'Y', 'N', '2023-10-18', '2023-10-18 15:27:37', '2023-10-18 15:27:37', '192.168.80.5', 'Google Chrome', NULL, 'NewMember', '', 'สมัครจากหน้าเว็บไซต์', 'บาท', 'ธนาคารไทยพาณิชย์', 'นาย ประยุทธิ์ จันทร์โอชา', '1234567910', '0990825942', 'นาย ประยุทธิ์ จันทร์โอชา', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00),
(6, 2, 'Toonta', '2', 'Kittisak', 0.00, 0.00, '0659150592', 'afdd0b4ad2ec172c586e2150770fbf9e', 'Y', 'N', '2023-10-19', NULL, '2023-10-19 01:34:57', NULL, NULL, 'Null', 'New Member', '', '', 'บาท', 'ธนาคารกสิกรไทย', 'Kittisak', '0102294078', '0659150592', 'Null', 0, 0, 0.00, 0.00, 0.00, 'NewMember', 0.00, 0.00, NULL, NULL, 0.00);

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
(1, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-17', '10:55:04'),
(2, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:34'),
(3, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:38'),
(4, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:41'),
(5, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:44'),
(6, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:47'),
(7, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:51'),
(8, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:54'),
(9, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '10:59:57'),
(10, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '11:00:01'),
(11, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'Mobile', 'NO', '2023-10-17', '11:00:04'),
(12, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-17', '11:01:13'),
(13, 1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, 'Google Chrome', 'PC', 'NO', '2023-10-17', '11:01:13'),
(14, 1, '0954789782', 'DOGZILLA', 5.00, 9.20, 904.20, 'Apple Safari', 'PC', 'NO', '2023-10-18', '19:50:39'),
(15, 1, '0954789782', 'DOGZILLA', 5.00, 0.00, 899.20, 'Apple Safari', 'PC', 'NO', '2023-10-18', '19:52:49');

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
(1, '0954789782', 0.00, 0.00, 0.00, 13, 0.00, 0.00, 0.00, 0.00, '2023-10-17'),
(2, '0954789782', 10.00, 9.20, 0.80, 2, 0.80, 0.00, 0.74, 0.06, '2023-10-18');

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
(1, '0954789782', 'DOGZILLA', 0.00, 0.00, 0.00, '2023-10-17', 13),
(2, '0954789782', 'DOGZILLA', 10.00, 9.20, 0.80, '2023-10-18', 2);

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
(1, 1, 2, 0.00, 0.00, '6,2,5,5,6,4,2,12,5,1,9,4,4,10,5', '', '', '0', 0.00, NULL, '2023-10-17 10:55:04', 'false', 'false'),
(2, 1, 3, 0.00, 0.00, '6,0,9,10,4,12,5,2,7,6,5,0,7,5,9', '', '', '0', 0.00, NULL, '2023-10-17 10:59:34', 'false', 'false'),
(3, 1, 3, 0.00, 0.00, '0,12,1,2,4,5,11,3,1,10,2,3,0,10,5', '', '', '0', 0.00, NULL, '2023-10-17 10:59:38', 'false', 'false'),
(4, 1, 3, 0.00, 0.00, '7,1,0,5,10,4,7,0,5,2,0,4,7,3,5', '', '', '0', 0.00, NULL, '2023-10-17 10:59:41', 'false', 'false'),
(5, 1, 3, 0.00, 0.00, '0,9,4,10,4,12,9,4,6,7,10,5,2,11,7', '', '', '0', 0.00, NULL, '2023-10-17 10:59:44', 'false', 'false'),
(6, 1, 3, 0.00, 0.00, '10,3,6,3,2,4,4,9,3,7,1,8,5,8,3', '', '', '0', 0.00, NULL, '2023-10-17 10:59:47', 'false', 'false'),
(7, 1, 3, 0.00, 0.00, '9,4,0,8,0,5,1,7,0,12,7,1,11,6,0', '', '', '0', 0.00, NULL, '2023-10-17 10:59:51', 'false', 'false'),
(8, 1, 3, 0.00, 0.00, '5,2,0,8,0,5,0,7,2,2,3,1,4,5,12', '', '', '0', 0.00, NULL, '2023-10-17 10:59:54', 'false', 'false'),
(9, 1, 3, 0.00, 0.00, '5,1,9,8,4,0,7,3,10,1,6,5,4,9,5', '', '', '0', 0.00, NULL, '2023-10-17 10:59:57', 'false', 'false'),
(10, 1, 3, 0.00, 0.00, '0,9,4,11,6,0,9,4,5,10,5,4,8,6,11', '', '', '0', 0.00, NULL, '2023-10-17 11:00:01', 'false', 'false'),
(11, 1, 3, 0.00, 0.00, '4,8,2,6,5,10,7,3,10,2,3,1,10,1,4', '', '', '0', 0.00, NULL, '2023-10-17 11:00:04', 'false', 'false'),
(12, 1, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'NpHQGclemq87n', '0', 0.00, NULL, '2023-10-17 11:00:30', 'false', 'false'),
(13, 1, 3, 0.00, 0.00, '0,5,7,6,0,9,2,3,5,8,6,4,1,4,7', '', '', '0', 0.00, NULL, '2023-10-17 11:01:13', 'false', 'false'),
(14, 1, 4, 0.00, 0.00, '12,0,10,5,9,0,2,5,4,3,7,10,0,9,4', '', '', '0', 0.00, NULL, '2023-10-17 11:01:13', 'false', 'false'),
(15, 1, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'm3reZm3oVmuuM', '0', 0.00, NULL, '2023-10-18 04:02:06', 'false', 'false'),
(16, 1, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'MME81SfpBNrUL', '0', 0.00, NULL, '2023-10-18 14:37:20', 'false', 'false'),
(17, 1, 0, 5.00, 9.20, '0,3', '0', 'zVlaustRBZKCS', '0', 904.20, NULL, '2023-10-18 19:50:24', 'false', 'false'),
(18, 1, 0, 5.00, 0.00, '1,2', '1', 'WHlpHM4zrMUOD', '0', 899.20, NULL, '2023-10-18 19:52:27', 'false', 'false'),
(19, 1, 0, 0.00, 0.00, '0,1,2,3,4', '0', 'epPgvnfF96jrt', '0', 0.00, NULL, '2023-10-18 19:52:55', 'false', 'false');

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `banknames`
--
ALTER TABLE `banknames`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comgogoldplanet`
--
ALTER TABLE `comgogoldplanet`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `commissionsubagent`
--
ALTER TABLE `commissionsubagent`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `creditpromotion`
--
ALTER TABLE `creditpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `depositaccount`
--
ALTER TABLE `depositaccount`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gamecamptotal`
--
ALTER TABLE `gamecamptotal`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gameweb`
--
ALTER TABLE `gameweb`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `imgpromotion`
--
ALTER TABLE `imgpromotion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logdaygame`
--
ALTER TABLE `logdaygame`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logedit`
--
ALTER TABLE `logedit`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `turnoverrepost`
--
ALTER TABLE `turnoverrepost`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_play`
--
ALTER TABLE `user_play`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
