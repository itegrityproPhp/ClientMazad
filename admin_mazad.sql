-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 24, 2021 at 01:51 AM
-- Server version: 5.7.34
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_mazad`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) UNSIGNED NOT NULL,
  `advertiser_id` int(11) UNSIGNED DEFAULT NULL,
  `advertisement_plan_id` int(11) UNSIGNED DEFAULT NULL,
  `advertisement` varchar(225) DEFAULT NULL,
  `link` text,
  `start_date` varchar(225) DEFAULT NULL,
  `end_date` varchar(225) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `advertiser_id`, `advertisement_plan_id`, `advertisement`, `link`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 3, 'ZO9uuOIMND_1619103111.jpg', 'http://mazad.webzproject.com', '2021-05-12', '2021-09-09', '1', '2021-04-22 14:51:51', '2021-05-12 05:31:35', NULL),
(2, 3, 3, '4MXdUzUzog_1620215016.jpg', 'http://mazad.webzproject.com', '2021-05-20', '2021-09-17', '1', '2021-04-30 12:04:45', '2021-05-12 05:31:15', NULL),
(3, 3, 3, 'XttrNyo4an_1619785875.jpg', 'http://mazad.webzproject.com', '2021-04-30', '2021-05-07', '0', '2021-04-30 12:31:15', '2021-04-30 12:31:15', NULL),
(4, 3, 3, 'SbSgKup4Pk_1619785911.jpg', 'http://mazad.webzproject.com', '2021-04-30', '2021-05-07', '1', '2021-04-30 12:31:51', '2021-05-12 05:27:47', NULL),
(5, 3, 3, 'FyQ6v9iNrt_1619785982.jpg', 'http://mazad.webzproject.com', '2021-04-30', '2021-05-07', '1', '2021-04-30 12:33:02', '2021-05-12 05:26:11', NULL),
(6, 3, 4, 'Uk6EWpUdoD_1620214475.jpg', 'ssv.com.sa', '2021-05-19', '2021-08-17', '1', '2021-05-05 11:34:35', '2021-05-06 13:16:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_category`
--

CREATE TABLE `advertisement_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=image,2=video',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisement_category`
--

INSERT INTO `advertisement_category` (`id`, `name`, `name_ar`, `status`, `type`, `created_at`, `updated_at`) VALUES
(4, 'Private for the Application', 'دعائي للموقع', '1', '2', '2021-03-17 16:20:55', '2021-03-17 16:20:55'),
(5, 'Private for the Application', 'دعائي للموقع', '1', '1', '2021-03-17 16:21:33', '2021-03-17 16:22:03'),
(6, 'Commercial', 'تجاري', '1', '1', '2021-03-17 16:22:21', '2021-03-17 16:22:21'),
(7, 'Commercial', 'تجاري', '1', '2', '2021-03-17 16:22:41', '2021-03-17 16:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_plan_times`
--

CREATE TABLE `advertisement_plan_times` (
  `id` int(11) UNSIGNED NOT NULL,
  `advertisement_category_id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) UNSIGNED NOT NULL,
  `currency` varchar(225) DEFAULT NULL,
  `plan_name` varchar(225) DEFAULT NULL,
  `days` varchar(225) DEFAULT NULL,
  `amount` varchar(225) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisement_plan_times`
--

INSERT INTO `advertisement_plan_times` (`id`, `advertisement_category_id`, `country_id`, `currency`, `plan_name`, `days`, `amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 6, 'SAR', '399 Plan', '200', '399', '1', '2021-03-15 09:57:04', '2021-05-12 05:30:41', NULL),
(3, 4, 6, 'SAR', 'Plan A+', '120', '100', '1', '2021-03-17 16:19:08', '2021-05-12 05:30:18', NULL),
(4, 6, 6, 'SAR', 'ربع سنوي', '90', '1000', '1', '2021-03-17 16:23:41', '2021-03-17 16:23:41', NULL),
(5, 5, 6, 'SAR', 'Basic', '100', '100', '1', '2021-03-31 13:43:35', '2021-05-12 05:29:58', NULL),
(6, 4, 6, 'SAR', '555', '100', '20', '1', '2021-05-05 11:36:18', '2021-05-12 05:29:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_points`
--

CREATE TABLE `advertisement_points` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_name` varchar(225) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `ads_point` varchar(225) DEFAULT NULL,
  `comment` text,
  `date` varchar(225) DEFAULT NULL,
  `point_status` enum('1','2') DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisement_points`
--

INSERT INTO `advertisement_points` (`id`, `user_name`, `phone_number`, `email`, `ads_point`, `comment`, `date`, `point_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Ganesh Dhamamde', '12345678', 'ganeshdhamande@gmail.com', '8', 'Comment', '2021-03-17', '2', '2021-03-15 09:07:06', '2021-05-05 11:44:11', NULL),
(3, 'Silicon Valley', '00966555555555', 'silicon@ssv.com.sa', '12', 'This is for silicon Valley only', '2021-05-12', '1', '2021-05-05 11:39:21', '2021-05-05 11:39:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `advertisers`
--

CREATE TABLE `advertisers` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) UNSIGNED NOT NULL,
  `advertisement_category_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `owner_name` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `landline_no` varchar(225) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisers`
--

INSERT INTO `advertisers` (`id`, `country_id`, `advertisement_category_id`, `name`, `owner_name`, `email`, `phone_number`, `landline_no`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 2, NULL, 'Ganesh Dhamande', 'Mr.Ashok', 'ganeshdhamande@gmail.com', '12345678', '12345678', '1', '2021-03-15 11:12:39', '2021-03-15 11:12:39', NULL),
(3, 6, NULL, 'samy', 'comapny', 'sdd@ff.com', '00965674547546', '0096656456345', '2', '2021-03-17 16:29:47', '2021-04-30 06:58:12', NULL),
(4, 6, 3, 'dsad', 'dssad', 'ee@gfg.b', '566', '324324', '1', '2021-05-05 11:35:40', '2021-05-05 11:35:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agent_task`
--

CREATE TABLE `agent_task` (
  `id` int(11) UNSIGNED NOT NULL,
  `agent_id` int(11) UNSIGNED DEFAULT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `fair_value` varchar(225) DEFAULT NULL,
  `highest_value` varchar(225) DEFAULT NULL,
  `minimum_value` varchar(225) DEFAULT NULL,
  `task_report` varchar(225) DEFAULT NULL,
  `task_report1` varchar(225) DEFAULT NULL,
  `status` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `accpted_date` datetime DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `task_submited_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agent_task`
--

INSERT INTO `agent_task` (`id`, `agent_id`, `property_id`, `fair_value`, `highest_value`, `minimum_value`, `task_report`, `task_report1`, `status`, `accpted_date`, `rejected_date`, `task_submited_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 214, 1, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 08:55:01', NULL, NULL, '2021-05-26 10:53:09', '2021-05-27 08:55:01', NULL),
(2, 214, 3, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 08:54:57', NULL, NULL, '2021-05-26 10:55:34', '2021-05-27 08:54:57', NULL),
(3, 214, 5, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 08:34:19', NULL, NULL, '2021-05-26 11:45:27', '2021-05-27 08:34:19', NULL),
(4, 214, 7, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 08:34:21', NULL, NULL, '2021-05-26 12:59:23', '2021-05-27 08:34:21', NULL),
(5, 232, 14, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2021-05-27 07:42:35', '2021-05-27 07:42:35', NULL),
(6, 239, 14, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 08:41:02', NULL, NULL, '2021-05-27 07:42:35', '2021-05-27 08:41:02', NULL),
(7, 214, 17, NULL, NULL, NULL, NULL, NULL, '4', NULL, NULL, NULL, '2021-05-27 12:13:45', '2021-05-27 12:30:51', NULL),
(8, 214, 18, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 12:40:08', NULL, NULL, '2021-05-27 12:33:22', '2021-05-27 12:40:08', NULL),
(9, 214, 19, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 12:48:09', NULL, NULL, '2021-05-27 12:45:03', '2021-05-27 12:48:09', NULL),
(10, 214, 20, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:03:54', NULL, NULL, '2021-05-27 12:50:23', '2021-05-27 13:03:54', NULL),
(11, 214, 21, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:05:54', NULL, NULL, '2021-05-27 01:03:42', '2021-05-27 13:05:54', NULL),
(12, 214, 22, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:06:16', NULL, NULL, '2021-05-27 01:05:40', '2021-05-27 13:06:16', NULL),
(13, 214, 23, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:10:34', NULL, NULL, '2021-05-27 01:09:12', '2021-05-27 13:10:34', NULL),
(14, 214, 24, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:12:42', NULL, NULL, '2021-05-27 01:12:15', '2021-05-27 13:12:42', NULL),
(15, 214, 25, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:14:14', NULL, NULL, '2021-05-27 01:14:05', '2021-05-27 13:14:14', NULL),
(16, 214, 26, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:16:18', NULL, NULL, '2021-05-27 01:16:09', '2021-05-27 13:16:18', NULL),
(17, 214, 27, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:18:57', NULL, NULL, '2021-05-27 01:18:24', '2021-05-27 13:18:57', NULL),
(18, 214, 28, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:21:34', NULL, NULL, '2021-05-27 01:21:18', '2021-05-27 13:21:34', NULL),
(19, 214, 29, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:23:50', NULL, NULL, '2021-05-27 01:22:59', '2021-05-27 13:23:50', NULL),
(20, 214, 30, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:26:54', NULL, NULL, '2021-05-27 01:26:45', '2021-05-27 13:26:54', NULL),
(21, 214, 31, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:28:56', NULL, NULL, '2021-05-27 01:28:50', '2021-05-27 13:28:56', NULL),
(22, 214, 32, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 01:34:34', NULL, NULL, '2021-05-27 01:33:01', '2021-05-27 13:34:34', NULL),
(23, 232, 33, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2021-05-27 01:38:35', '2021-05-27 01:38:35', NULL),
(24, 232, 34, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2021-05-27 01:41:20', '2021-05-27 01:41:20', NULL),
(25, 232, 35, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2021-05-27 01:43:38', '2021-05-27 01:43:38', NULL),
(26, 214, 37, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2021-05-30 05:06:22', '2021-05-30 05:06:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `apis`
--

CREATE TABLE `apis` (
  `id` int(11) NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `company_name` varchar(225) DEFAULT NULL,
  `description` text,
  `user_name` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apis`
--

INSERT INTO `apis` (`id`, `title`, `company_name`, `description`, `user_name`, `password`, `phone_number`, `email`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SMS1', 'Safa', 'SafaSms', 'Mazady', 'Mas4_fD%', '12345678', 'ganeshdhamande@gmail.com', '1', '2021-03-15 13:16:32', '2021-03-15 13:21:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) UNSIGNED NOT NULL,
  `heading` varchar(225) DEFAULT NULL,
  `heading_ar` varchar(225) DEFAULT NULL,
  `description` longtext,
  `description_ar` longtext,
  `banner_image` varchar(225) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `heading`, `heading_ar`, `description`, `description_ar`, `banner_image`, `created_at`, `updated_at`) VALUES
(1, 'SED UT PERSPICIACIATIS UNDE MNIS ISTE NATUS ERROR', 'SED UT PERSPICIACIATIS UNDE MNIS ISTE NATUS ERROR', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, '2021-01-02 11:59:51', '2021-01-02 11:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(1, 'All Auctions', 'كل الأصناف', '2021-03-17 22:08:49', '2021-03-17 22:55:56'),
(2, 'Bank Owned', 'مملوك للبنك', '2021-03-17 22:08:49', '2021-03-17 21:59:59'),
(3, 'Newly Foreclosed', 'مرهون حديثا', '2021-03-17 22:08:49', '2021-03-17 22:03:48'),
(4, 'Foreclosure/Trustee', 'الوصية /ارث', '2021-03-17 22:08:49', '2021-03-17 22:02:24'),
(5, 'Non Bank Owned', 'غير مرهون للبنك', '2021-03-17 22:08:49', '2021-03-17 22:02:44'),
(6, 'Retail', 'بيع بالتجزئة', '2021-03-17 22:08:49', '2021-03-17 22:01:30'),
(8, 'Disputed', 'مختلف عليه', '2021-03-17 22:08:49', '2021-03-17 22:08:49'),
(9, 'Normal', 'عادي', '2021-03-17 22:56:14', '2021-03-17 22:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) UNSIGNED DEFAULT NULL,
  `state_id` int(11) UNSIGNED DEFAULT NULL,
  `city_name` varchar(225) DEFAULT NULL,
  `city_name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `state_id`, `city_name`, `city_name_ar`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Hawalli', 'Hawalli', '2021-01-04 11:41:31', '2021-05-02 23:56:06'),
(2, 2, 1, 'Jahra', 'Jahra', '2021-01-04 11:41:31', '2021-05-02 23:56:09'),
(3, 2, 2, 'Al Asimah (Kuwait city)', 'Al Asimah (Kuwait city)', '2021-01-04 11:41:31', '2021-05-02 23:56:11'),
(4, 2, 2, 'Farwaniyah', 'Farwaniyah', '2021-02-03 09:17:15', '2021-05-02 23:56:14'),
(5, 2, NULL, 'Mubarak Al-Kabeer', 'Mubarak Al-Kabeer', '2021-02-03 09:17:26', '2021-02-26 14:25:30'),
(6, 6, NULL, 'Mecca', 'منطقة مكة المكرمة', '2021-02-03 09:17:37', '2021-03-17 15:58:23'),
(7, 5, 7, 'Indoree', 'Indoree', '2021-02-03 09:17:26', '2021-05-01 11:27:15'),
(8, 6, 11, 'Northern Boundaries', 'الحدود الشمالية', '2021-02-03 09:17:37', '2021-05-06 06:56:12'),
(9, 6, 11, 'Riyadh Zone', 'منطقة الرياض', '2021-03-16 11:46:08', '2021-05-06 06:56:18'),
(10, 6, NULL, 'Tabuk', 'تبوك', '2021-03-16 12:13:43', '2021-03-17 15:59:03'),
(11, 6, NULL, 'Dammam', 'المنطقة الشرقية', '2021-03-16 12:15:23', '2021-03-16 12:15:23'),
(12, 6, NULL, 'Najran', 'منطقة نجران', '2021-03-17 15:59:23', '2021-03-17 15:59:23'),
(13, 6, NULL, 'Jazan', 'منطقة جازان', '2021-03-17 15:59:42', '2021-03-17 15:59:42'),
(14, 6, NULL, 'ASEER', 'منطقة عسير', '2021-03-17 16:00:12', '2021-03-17 16:03:20'),
(15, 6, NULL, 'Alqaseem', 'القصيم', '2021-03-17 16:01:42', '2021-03-17 16:01:42'),
(16, 6, NULL, 'Amadina', 'المدينة المنورة.', '2021-03-17 16:02:56', '2021-03-17 16:02:56'),
(17, 6, NULL, 'Baha', 'الباحة', '2021-03-17 16:04:19', '2021-03-17 16:04:19'),
(18, 6, NULL, 'Aljouf', 'منطقة الجوف', '2021-03-17 16:04:41', '2021-03-17 16:04:41'),
(19, 6, NULL, 'Hael', 'منطقة حائل', '2021-03-17 16:06:04', '2021-03-17 16:06:04'),
(20, 6, 11, 'Ahsa', 'Ahsa', '2021-05-03 11:05:52', '2021-05-03 11:05:52'),
(21, 6, 6, 'Jeddah', 'جدة', '2021-05-22 06:51:11', '2021-05-22 06:51:11'),
(22, 6, 6, 'Mecca', 'مكة', '2021-05-22 06:51:31', '2021-05-22 06:51:31'),
(23, 6, 9, 'Riyadh', 'الرياض', '2021-05-22 06:51:54', '2021-05-22 06:51:54'),
(24, 6, 9, 'Kharj', 'الخرج', '2021-05-22 06:52:15', '2021-05-22 06:52:15'),
(25, 6, 9, 'Aflaj', 'الافلاج', '2021-05-22 06:52:37', '2021-05-22 06:52:37'),
(26, 6, 11, 'Dammam', 'الدمام', '2021-05-22 06:53:06', '2021-05-22 06:53:06'),
(27, 6, 11, 'Khubar', 'الخبر', '2021-05-22 06:53:26', '2021-05-22 06:53:26'),
(28, 6, 11, 'Ihsaa', 'الاحساء', '2021-05-22 06:53:46', '2021-05-22 06:53:46'),
(29, 6, 10, 'Tabuk', 'تبوك', '2021-05-22 06:54:09', '2021-05-22 06:54:09'),
(30, 6, 12, 'Najran', 'نجران', '2021-05-22 06:54:31', '2021-05-22 06:54:31'),
(31, 6, 13, 'Jeezan', 'جيزان', '2021-05-22 06:54:48', '2021-05-22 06:54:48'),
(32, 6, 14, 'Abha', 'ابها', '2021-05-22 06:55:16', '2021-05-22 06:55:16'),
(33, 6, 17, 'Baha', 'الباحة', '2021-05-22 06:56:19', '2021-05-22 06:56:19'),
(34, 6, 16, 'Almadina Almonawarah', 'المدينة المنورة', '2021-05-22 06:57:03', '2021-05-22 06:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(225) DEFAULT NULL,
  `heading` text,
  `heading_ar` text,
  `description` text,
  `description_ar` text,
  `image` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `type`, `heading`, `heading_ar`, `description`, `description_ar`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'section_1', '<p>MAZADY .... The ONLINE AUCTION APPLICATION</p>', '<p>تطبيق مزادي الالتروني</p>', '<p style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"color:#000033;\"><strong>It is the best application for a real public auction through the Internet in the Middle East, all you need to display your need and display it in a specific official public auction at a specific time, you find it in minutes, all you are looking for you request or find here InshaAllah</strong></span></span></p>', '<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><strong><span style=\"color:#000033;\">هو افضل تطبيق لمزاد علني حقيقي من خلال النت في الشرق الاوسط , كل ما تحتاجه لعرض حاجتك وعرضها بمزاد علني رسمي محدد بوقت معين , تجده هما بدقائق , كل ما تبحث عنه تطلبه او تجده هنا باذن الله</span></strong></span></p>', 'V1pjGzxZsT_1619180686.png', '2021-04-17 04:51:39', '2021-04-23 12:24:46', NULL),
(3, 'section_2', '<p>Why Peoples Love Mazady</p>', '<p>لماذا عملاؤنا يرتاحون مع مزادي</p>', '<p style=\"text-align: justify;\"><strong><span style=\"font-size:16px;\"><span style=\"color:#000033;\">As we are always looking to be the most Optimized&nbsp;</span></span></strong></p>', '<p><span style=\"font-size:16px;\"><strong><span style=\"color:#000033;\">لأننا دائما تسعى للأمثل</span></strong></span></p>', 'rBzAznPFGc_1618661788.png', '2021-04-17 09:35:45', '2021-04-22 18:17:46', NULL),
(4, 'section_3', 'Use Your Android or IOS  Device to Manage Everything', 'حمل التطبيق من الابل ستورز او الجوجل بلاي حالا وابدأ مشوارك التقني معنا', 'Use Your Android or IOS  Device to Manage Everything', 'حمل التطبيق من الابل ستورز او الجوجل بلاي حالا وابدأ مشوارك التقني معنا', 'NnsGoMCNVZ_1619010769.png', '2021-04-17 09:52:19', '2021-04-21 13:12:49', NULL),
(5, 'section_4', '<p>Share your Photos with Friends Easily</p>', '<p>شارك هذه اللقطات مع معارفك</p>', '<p style=\"text-align: justify;\"><span style=\"color:#000033;\"><strong>Objectively deliver professional value with diverse Online Auction .&nbsp;Collaboratively transition wireless customer service without goal-oriented catalysts for change. Collaboratively.</strong></span></p>', '<p style=\"text-align: justify;\"><strong><span style=\"font-size:16px;\">تقديم قيمة احترافية وبموضوعية مع الإستعداد لتقديم الخدمة المثل في كل وقت باذن الله. ننقل بشكل تعاوني خدمة العملاء عن بعد بدون اي حيود نحو تحقيق الهدف لضمان تامين حاجة عملائنا .</span></strong></p>', 'SU1VtGtRr6_1618932748.png', '2021-04-17 10:02:15', '2021-04-22 18:27:05', NULL),
(6, 'section_5', '<p><span style=\"color:#000033;\">Start Managing your Apps Business, more Faster</span></p>', '<p><span style=\"color:#000033;\">مع تطبيقنا استثماراتك ومزاداتك اسهل واسرع</span></p>', '<p style=\"text-align: justify;\"><strong><span style=\"color:#000033;\">Objectively deliver professional value with diverse web-readiness. Collaboratively transition wireless customer service without goal-oriented catalysts for change. Collaboratively.</span></strong></p>', '<p style=\"text-align: justify;\"><strong><span style=\"color:#000033;\"><span style=\"font-size:16px;\">Objectively deliver professional value with diverse web-readiness. Collaboratively transition wireless customer service without goal-oriented catalysts for change. Collaboratively.</span></span></strong></p>', 'Bt2lyTBGbe_1618934335.png', '2021-04-17 10:09:55', '2021-04-22 18:31:15', NULL),
(7, 'section_6', 'What Clients Say About Us', 'شاهدون على اعمالنا', 'Rapidiously morph transparent internal or \"organic\" sources whereas resource sucking e-business. Conveniently innovate compelling internal.', 'Rapidiously morph transparent internal or \"organic\" sources whereas resource sucking e-business. Conveniently innovate compelling internal.', NULL, '2021-04-17 10:17:50', '2021-04-19 11:37:53', NULL),
(8, 'section_7', '<h2><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">App ScreenShots Looks Awesome</font></font></h2>', '<h2><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">تطبيقنا من خلال شاشاته ولمساته السريعة</font></font></span></h2>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Credibly synthesize multimedia based networks vis-&agrave;-vis top-line growth strategies. </font></font></font></font></font></font></font></font></font></font></font></font></font></font></font><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Continually leverage existing worldwide interfaces</font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></p>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Credibly synthesize multimedia based networks vis-&agrave;-vis top-line growth strategies. </font></font></font></font></font></font></font></font></font></font></font></font></font></font></font><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Continually leverage existing worldwide interfaces</font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></font></p>', 'N25G9F7ln8_1619116371.jpg', '2021-04-17 10:30:58', '2021-04-23 18:53:02', NULL),
(9, 'section_8', 'Our Management Members', 'ادارتنا', 'Following reasons show advantages of adding AppCo to your lead pages, foster market positioning products without demos and checkouts.', 'Following reasons show advantages of adding AppCo to your lead pages, foster market positioning products without demos and checkouts.', NULL, '2021-04-17 10:44:26', '2021-04-19 11:37:02', NULL),
(10, 'section_9', '<h2 style=\"text-align: center;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Our Latest News from Saudi</font></font></font></font></h2>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">آخر اعمالنا واخبارنا</font></font></font></font></p>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Enthusiastically drive revolutionary opportunities before emerging leadership. </font></font></font><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Distinctively transform tactical methods of resource sucking core.</font></font></font></font></p>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Enthusiastically drive revolutionary opportunities before emerging leadership. </font></font></font><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Distinctively transform tactical methods of resource sucking core.</font></font></font></font></p>', 'hricA5MlFD_1618661902.png', '2021-04-17 10:52:40', '2021-04-23 11:50:38', NULL),
(11, 'section_10', '<p><span style=\"font-size:18px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Contact With Usasas</font></font></span></p>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">تواصل معنا</font></font></p>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">It&#39;s very easy to get in touch with us. </font><font style=\"vertical-align: inherit;\">Just use the contact form or pay us a visit for a coffee at the office. </font><font style=\"vertical-align: inherit;\">Dynamically innovate competitive technology after an expanded array of leadership.</font></font></p>', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">من السهل جدًا التواصل معنا. </font><font style=\"vertical-align: inherit;\">ما عليك سوى استخدام نموذج الاتصال أو قم بزيارتنا لتناول فنجان من القهوة في المكتب. </font><font style=\"vertical-align: inherit;\">اهلا وسهلا ابتكار تقني تنافسي بشكل ديناميكي بعد مجموعة موسعة من القيادة.</font></font></p>', 'wCAyKOCaj1_1618834128.jpg', '2021-04-17 11:03:54', '2021-04-23 11:43:03', NULL),
(12, 'section_11', 'Trusted by Companies', 'تطبيقنا ثقة لدى الكل  بعون الله', 'Rapidiously morph transparent internal or \"organic\" sources whereas resource sucking e-business. Conveniently innovate compelling internal.', 'Rapidiously morph transparent internal or \"organic\" sources whereas resource sucking e-business. Conveniently innovate compelling internal.', NULL, '2021-04-17 11:11:46', '2021-04-17 13:50:07', NULL),
(13, 'section_12', '<p><span style=\"color:#3498db;\">Resources</span></p>', '<p><span style=\"color:#3498db;\">مواردنا</span></p>', NULL, NULL, NULL, '2021-04-21 08:41:45', '2021-04-23 19:04:00', NULL),
(14, 'section_13', '<p><span style=\"color:#3498db;\">Company</span></p>', '<p><span style=\"color:#3498db;\">شركتنا</span></p>', NULL, NULL, NULL, '2021-04-21 08:42:07', '2021-04-23 19:03:15', NULL),
(15, 'section_14', '<p>Header</p>', '<p>الرأسية</p>', NULL, NULL, 'ozwN5NJ7ZK_1619114239.png', '2021-04-22 13:32:26', '2021-04-22 18:15:18', NULL),
(16, 'section_15', '<p><span style=\"color:#3498db;\">Location</span></p>', '<p><font color=\"#3498db\">موقع وعنوان الشركة</font></p>', NULL, NULL, NULL, '2021-04-24 05:04:16', '2021-04-24 23:37:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_content`
--

CREATE TABLE `cms_content` (
  `id` int(11) UNSIGNED NOT NULL,
  `cms_id` int(11) UNSIGNED NOT NULL,
  `title` text,
  `title_ar` text,
  `description` text,
  `description_ar` text,
  `image` varchar(225) DEFAULT NULL,
  `link` varchar(225) DEFAULT NULL,
  `first_name` varchar(225) DEFAULT NULL,
  `last_name` varchar(225) DEFAULT NULL,
  `role` varchar(225) DEFAULT NULL,
  `facebook_link` varchar(225) DEFAULT NULL,
  `twitter_link` varchar(225) DEFAULT NULL,
  `instagram_link` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms_content`
--

INSERT INTO `cms_content` (`id`, `cms_id`, `title`, `title_ar`, `description`, `description_ar`, `image`, `link`, `first_name`, `last_name`, `role`, `facebook_link`, `twitter_link`, `instagram_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 3, 'Saving your time and get accurate results', 'توفير الوقت والدقة في العمل', 'Build your online store’s trust using Social Proof & Urgency.', 'Build your online store’s trust using Social Proof & Urgency.', 'iQvPEYlA8H_1618652374.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 09:39:34', '2021-04-19 11:34:01', NULL),
(3, 3, 'Quick in taking Actions', 'سرعة التنفيذ', 'Build your online store’s trust using Social Proof & Urgency.', 'Build your online store’s trust using Social Proof & Urgency.', 'xfICSzfLmY_1618825404.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 09:39:34', '2021-04-19 11:32:38', NULL),
(4, 3, 'Secure Data', 'سرية المعلومة والحفاظ على الخصوصيات', 'Build your online store’s trust using Social Proof & Urgency.', 'سرية المعلومة والحفاظ على الخصوصيات بكل ثقة وامان', 'BGfiMyXC6p_1618825245.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 09:39:34', '2021-04-19 11:31:50', NULL),
(5, 4, 'Place your auction directly  in one touch', 'اطرح مزادك مباشرة وبلمسة واحدة', 'Place your auction directly  in one Touch', 'اطرح مزادك مباشرة وبلمسة واحدة', 'm4kScnn7ku_1618992742.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 09:53:20', '2021-04-21 08:12:22', NULL),
(6, 4, 'Buy your favorite Property through Direct Auction', 'اشتر ما شئت من خلال المزاد المباشر وخلال ساعات قليله', NULL, NULL, 'l4ksVDKDPp_1618992865.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 09:53:20', '2021-04-21 08:14:25', NULL),
(7, 4, 'Direct Rent', 'استأجار مباشر', 'Select what you want and rent with one touch', 'حدد ما تريد وقم باستئجارة بلمسه واحدة', 'MoofyMHF8P_1618993010.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 09:53:20', '2021-04-21 08:16:50', NULL),
(8, 8, 'Proactively syndicate', 'Proactively syndicate', NULL, NULL, '9sVLEAtqe4_1618989556.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 09:53:20', '2021-04-21 07:19:16', NULL),
(9, 5, 'Gallery of The  Application Screens', 'صور ايقونات', NULL, NULL, 'aMFQmcuaxh_1618993437.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:02:44', '2021-04-21 18:14:25', NULL),
(10, 5, 'Gallery of The  Application Screens', 'صور ايقونات', NULL, NULL, 'dGEmz2Wzy1_1618993377.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:02:44', '2021-04-21 18:14:57', NULL),
(11, 5, 'Icons Images', 'صور ايقونات', NULL, NULL, '5d75G7pMSb_1618993347.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:02:44', '2021-04-21 18:14:04', NULL),
(12, 5, NULL, 'صور ايقونات', NULL, NULL, 'NPUXZpXDHm_1618993319.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:02:44', '2021-04-21 18:15:15', NULL),
(13, 6, 'Google Play', 'نسخة الاندرويد', NULL, NULL, NULL, 'http://localhost:8000/backend/cms_content/create', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:11:10', '2021-04-21 14:23:18', NULL),
(14, 6, 'App Store', 'نسخة الايوس', NULL, NULL, NULL, 'http://localhost:8000/backend/cms_content/create', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:11:38', '2021-04-21 14:23:41', NULL),
(15, 7, NULL, NULL, 'Rapidiously develop user friendly growth strategies after extensive initiatives. Conveniently grow innovative benefits through fully tested deliverables. Rapidiously utilize focused platforms through end-to-end schemas.', 'Rapidiously develop user friendly growth strategies after extensive initiatives. Conveniently grow innovative benefits through fully tested deliverables. Rapidiously utilize focused platforms through end-to-end schemas.', 'C5KYW1vIIc_1618654823.jpg', NULL, 'Johns', 'Jakline', 'Staff Manager', NULL, NULL, NULL, '2021-04-17 10:20:23', '2021-04-17 10:20:23', NULL),
(16, 7, NULL, '<p>شاهد عيان</p>', '<p>Rapidiously develop</p>', '<p>Rapidiously develop</p>', 'U6oULAYblS_1619306962.jpeg', NULL, 'العربي', 'الأصيل', 'Staff Manager', NULL, NULL, NULL, '2021-04-17 10:20:23', '2021-04-24 23:29:22', NULL),
(17, 8, NULL, NULL, NULL, NULL, 'i5uO5l2K6u_1618989680.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:31:27', '2021-04-21 07:21:21', NULL),
(18, 8, NULL, 'صور', NULL, NULL, 'JkIIlWhcMv_1618989632.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:31:54', '2021-04-21 18:09:23', NULL),
(19, 8, NULL, 'المقطع السابع1', NULL, NULL, 'ibhPjcLNJ9_1618989595.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 10:32:11', '2021-04-21 07:19:55', NULL),
(20, 9, '<p>The CEO</p>', '<p>المدير التنفيذي</p>', '<p>The technical Manager for the Application</p>', '<p>الدكتور المهندس مصطفى الخشيني</p>', 'LKBiDChC7l_1620364587.jpg', NULL, 'Dr. Mustafa', 'Alkhusheiny', 'CEO', 'https://www.facebook.com/ssv.com.sa/', '@DrAlkhusheiny', 'http://localhost:8000/backend/cms_content/create', '2021-04-17 10:46:11', '2021-05-07 05:16:27', NULL),
(21, 9, NULL, 'المدير العام', NULL, 'السيد وليد القبيس', 'uNnc4kq6tc_1618757290.jpg', NULL, 'Waleed', 'Qubais', 'GM', 'https://www.facebook.com/saudi.mazad/', 'http://localhost:8000/backend/cms_content/create', 'http://localhost:8000/backend/cms_content/create', '2021-04-17 10:46:11', '2021-04-18 18:09:05', NULL),
(22, 9, 'Council Board Manager', 'رئيس مجلس الادارة', 'Dr. Mohammed Hijazi', 'الدكتور محمد حجازي', 'sImr1fkijq_1618919633.jpg', NULL, 'Dr. Mohammed', 'Hijazi', 'رئيس مجلس الادارة', 'http://localhost:8000/backend/cms_content/create', 'http://localhost:8000/backend/cms_content/create', 'http://localhost:8000/backend/cms_content/create', '2021-04-17 10:46:11', '2021-04-20 11:53:53', NULL),
(23, 9, '<p>Our Management</p>', '<p>ادارتنا</p>', NULL, NULL, 'RBXOA3cDTi_1619203364.png', 'www.Silicon-Valley.site', 'Eng. Abdulrahman', 'Alkhusheiny', 'Developer', 'http://localhost:8000/backend/cms_content/create', 'http://localhost:8000/backend/cms_content/create', 'http://localhost:8000/backend/cms_content/create', '2021-04-17 10:46:11', '2021-04-23 18:43:54', NULL),
(24, 10, 'Appropriately productize fully', 'فعاليات عالمية', 'Some quick example text to build on the card title and make up the bulk.', 'Some quick example text to build on the card title and make up the bulk.', '3IPCQJnukG_1618768786.jpg', NULL, NULL, NULL, 'Lefestyle', NULL, NULL, NULL, '2021-04-17 10:54:44', '2021-04-18 17:59:46', NULL),
(25, 10, 'Appropriately productize fully', 'المزاد من بعد', 'Some quick example text to build on the card title and make up the bulk.', 'Some quick example text to build on the card title and make up the bulk.', 'Y4H6MuQ2OL_1618757004.jpg', NULL, NULL, NULL, 'Lefestyle', NULL, NULL, NULL, '2021-04-17 10:54:44', '2021-04-18 14:43:24', NULL),
(26, 10, '<p>Kamel Racing</p>', '<p>صورة سباق الإبل</p>', '<p>Some quick example text to build on the card title and make up the bulk.</p>', '<p>صورة سباق النوق</p>', 'WgV0QVP8cc_1618756769.jpg', NULL, NULL, NULL, 'Lefestyle', NULL, NULL, NULL, '2021-04-17 10:54:44', '2021-04-24 23:25:28', NULL),
(27, 12, NULL, 'صورة باي بال', NULL, NULL, '5HSL2Myvfo_1619023144.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 11:13:37', '2021-04-21 16:39:04', NULL),
(28, 12, NULL, 'صورة باي بال', NULL, NULL, 'Bw8lBMoOmE_1619028087.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 11:13:37', '2021-04-21 18:01:27', NULL),
(29, 12, NULL, 'صورة باي بال', NULL, NULL, 'bkp5cPdfVm_1619023125.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 11:13:37', '2021-04-21 16:38:45', NULL),
(30, 12, NULL, 'صورة باي بال', NULL, NULL, 'rkM5EQq0sy_1619023010.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 11:13:37', '2021-04-21 16:37:59', NULL),
(31, 2, '<p>All what you need in ONE Touch</p>', '<p>كل ما تحتاجه في لمسه واحدة</p>', '<p>Mazady The Best Online Auction in the Miodl;e East</p>', '<p>مزادي تطبيق المزادات المباشر عبر النتب</p>', 'y6vrBV546R_1619102773.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 12:21:40', '2021-04-22 14:46:13', NULL),
(32, 11, 'connect', 'للتواصل', 'sasas', 'sasa', NULL, 'ass', 'sasasd', 'sasds', 'asdsasd', 'adada', 'daadd', 'adad', '2021-04-19 12:18:28', '2021-04-21 16:36:19', NULL),
(33, 8, '<p>Features</p>', '<p>الخصائص الفريدة</p>', NULL, NULL, 'JF471H6law_1619307052.png', '#features', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 08:43:22', '2021-04-24 23:30:52', NULL),
(34, 13, 'Screenshots', 'لقطات من الواقع', NULL, NULL, NULL, '#screenshots', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 08:43:47', '2021-04-21 16:35:42', NULL),
(35, 13, 'Team', 'فريق عملنا', NULL, NULL, NULL, '#team', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 08:44:18', '2021-04-21 14:21:34', NULL),
(36, 13, 'Contact Us', 'للتواصل معنا', NULL, NULL, NULL, '#contact', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 08:44:57', '2021-04-21 16:33:50', NULL),
(37, 14, '<p>About Us</p>', '<p>حول التطبيق</p>', '<p>ffffffffffffffffffffffffffffff</p>', '<p>ffffffffffffffffffffffffffffffff</p>', NULL, '#about', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 08:46:23', '2021-04-29 12:43:02', NULL),
(38, 14, '<p>Terms &amp; Conditions</p>', '<p>الشروط والاحكام</p>', NULL, NULL, NULL, 'http://mazad.webzproject.com/terms_condition', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 08:46:47', '2021-04-29 12:53:40', NULL),
(39, 14, '<p>Privacy Policy</p>', '<p>سياسة الخصوصية</p>', NULL, NULL, NULL, 'http://mazad.webzproject.com/privacy_policy', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 08:48:32', '2021-04-29 12:53:54', NULL),
(40, 15, '<p><span style=\"color:#3498db;\">Home</span></p>', '<p><span style=\"color:#3498db;\"><strong>الرئيسية</strong></span></p>', NULL, NULL, NULL, 'http://mazad.webzproject.com/#home', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 13:36:15', '2021-04-29 13:06:54', NULL),
(41, 15, '<p><span style=\"color:#3498db;\">About Us</span></p>', '<p><span style=\"color:#3498db;\"><strong>حول تطبيقنا</strong></span></p>', NULL, NULL, NULL, 'http://mazad.webzproject.com/#about', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 13:37:05', '2021-04-29 13:07:08', NULL),
(42, 15, '<p><span style=\"color:#3498db;\">Features</span></p>', '<p><span style=\"color:#3498db;\">ما يميزنا</span></p>', NULL, NULL, NULL, 'http://mazad.webzproject.com/#features', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 13:37:37', '2021-04-29 13:07:18', NULL),
(43, 15, '<p><span style=\"color:#3498db;\">Screenshots</span></p>', '<p><span style=\"color:#3498db;\">صور من الواقع</span></p>', NULL, NULL, NULL, 'http://mazad.webzproject.com/#screenshots', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 13:38:07', '2021-04-29 13:07:29', NULL),
(44, 15, '<p><span style=\"color:#3498db;\">Team</span></p>', '<p><span style=\"color:#3498db;\">فريق الإدارة</span></p>', NULL, NULL, NULL, 'http://mazad.webzproject.com/#team', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 13:38:47', '2021-04-29 13:07:40', NULL),
(45, 15, '<p><span style=\"color:#3498db;\">Contact Us</span></p>', '<p><span style=\"color:#3498db;\"><strong>تواصل معنا</strong></span></p>', NULL, '<p>اهلا ةسهلا بكم&nbsp;</p>', NULL, 'http://mazad.webzproject.com/#contact', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 13:39:17', '2021-04-29 13:07:50', NULL),
(46, 8, NULL, NULL, NULL, NULL, 'IDDAC45Pgp_1619116947.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 18:42:27', '2021-04-22 18:42:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=private,2=forced',
  `sender_id` int(11) UNSIGNED DEFAULT NULL,
  `receiver_id` int(11) UNSIGNED DEFAULT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `first_name` varchar(225) DEFAULT NULL,
  `last_name` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `comment` longtext,
  `role` enum('1','2','3','4') DEFAULT NULL,
  `replay_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=pending,1=replied',
  `replay` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `type`, `sender_id`, `receiver_id`, `property_id`, `first_name`, `last_name`, `email`, `comment`, `role`, `replay_status`, `replay`, `created_at`, `updated_at`) VALUES
(17, '1', 213, 213, 9, NULL, NULL, NULL, 'hello', NULL, '1', 'Hello My friend ,, you are welcome in Mazady', '2021-05-26 13:19:09', '2021-05-31 07:08:26'),
(18, '1', 213, 213, 9, NULL, NULL, NULL, 'I am interested in rent your apartment', NULL, '1', 'ok', '2021-05-26 13:19:28', '2021-05-28 05:31:49'),
(19, '1', 221, 213, 9, NULL, NULL, NULL, 'hello', NULL, '0', NULL, '2021-05-26 13:21:08', '2021-05-26 13:21:08'),
(20, '1', 221, 214, 9, NULL, NULL, NULL, 'hello', NULL, '0', NULL, '2021-05-26 13:21:48', '2021-05-26 13:21:48'),
(21, '1', 214, 214, 9, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 13:21:57', '2021-05-26 13:21:57'),
(22, '1', 214, 214, 9, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 13:22:28', '2021-05-26 13:22:28'),
(23, '1', 221, 214, 9, NULL, NULL, NULL, 'hello', NULL, '0', NULL, '2021-05-26 13:33:05', '2021-05-26 13:33:05'),
(24, '1', 214, 217, 8, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 14:03:36', '2021-05-26 14:03:36'),
(25, '1', 217, 217, 8, NULL, NULL, NULL, 'hello', NULL, '0', NULL, '2021-05-26 14:03:57', '2021-05-26 14:03:57'),
(26, '1', 214, 217, 8, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 14:04:02', '2021-05-26 14:04:02'),
(27, '1', 214, 217, 8, NULL, NULL, NULL, 'hello', NULL, '1', 'Hello Evaluator ...', '2021-05-26 14:05:41', '2021-05-31 07:17:32'),
(28, '1', 217, 217, 8, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 14:05:51', '2021-05-26 14:05:51'),
(29, '1', 214, 214, 9, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 14:07:10', '2021-05-26 14:07:10'),
(30, '1', 214, 214, 9, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 14:07:51', '2021-05-26 14:07:51'),
(31, '1', 214, 213, 10, NULL, NULL, NULL, 'hello', NULL, '0', NULL, '2021-05-26 14:31:40', '2021-05-26 14:31:40'),
(32, '1', 213, 213, 10, NULL, NULL, NULL, 'hello', NULL, '0', NULL, '2021-05-26 14:31:45', '2021-05-26 14:31:45'),
(33, '1', 214, 213, 10, NULL, NULL, NULL, 'hyy', NULL, '0', NULL, '2021-05-26 14:32:06', '2021-05-26 14:32:06'),
(34, '1', 213, 213, 10, NULL, NULL, NULL, 'ok', NULL, '0', NULL, '2021-05-26 14:32:19', '2021-05-26 14:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `contact_agents`
--

CREATE TABLE `contact_agents` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `agent_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `message` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_agents`
--

INSERT INTO `contact_agents` (`id`, `user_id`, `property_id`, `agent_id`, `name`, `phone_number`, `email`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, NULL, 'Gggy', '528', 'fff@hotmail.comdffr', 'dr', '2021-04-06 11:02:18', '2021-04-06 11:02:18', NULL),
(2, NULL, NULL, NULL, 'Sdd', '555', 'cfgg@gmail.com', 'cghu', '2021-04-27 10:02:34', '2021-04-27 10:02:34', NULL),
(3, NULL, NULL, NULL, 'Ashok', '85462338', 'sumit.itegrityproindia@gmail.com', 'vbznznznxbnzbbxjxjx', '2021-05-07 03:07:18', '2021-05-07 03:07:18', NULL),
(4, NULL, NULL, NULL, 'Hamzah', '5555555245', 'hamzah@ssv.com', 'Salam\nWhat is the offer please?', '2021-05-27 05:55:39', '2021-05-27 05:55:39', NULL),
(5, NULL, NULL, NULL, 'حمزة', '666666', 'dffg@ggmi.cim', 'سلام من اسماعيل', '2021-05-30 05:09:38', '2021-05-30 05:09:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone_number`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Ganesh', 'Dhamande', 'ganeshdhamande7@gmail.com', '9575164549', 'Con', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1', '2021-02-23 05:25:49', '2021-02-23 05:25:49'),
(2, 2, 'Ganesh', 'Dhamande', 'ganesh1@gmail.com', '123456789', 'Subject', 'Message', '1', '2021-03-12 05:09:16', '2021-03-12 05:09:16'),
(3, 100, 'Amit', 'mishra', 'amit.itegrityproindia@gmail.com', '9589105092', 'Subject', 'Message', '1', '2021-04-06 18:24:14', '2021-04-06 18:24:14'),
(4, 103, 'Mazad', 'Mazad', 'ssyyw@gmail.com', '7869152730', 'Hfdhgddhhddh', 'hfhfhf', '1', '2021-04-06 20:05:12', '2021-04-06 20:05:12'),
(5, 103, 'Mazad', 'Mazad', 'ssyyw@gmail.com', '7869152730', 'Vgg', 'uuuu', '1', '2021-04-08 02:07:02', '2021-04-08 02:07:02'),
(6, NULL, 'ddd', 'ddd', NULL, '4444', 'safsf', 'fassafsafsa', '1', '2021-04-23 20:42:16', '2021-04-23 20:42:16'),
(7, NULL, 'aa', 'aaa', NULL, '333', '333', '333', '1', '2021-04-24 01:25:44', '2021-04-24 01:25:44'),
(8, NULL, 'سشسشس', 'شسشسشس', NULL, 'سس', 'شسسش', 'dwdqw', '1', '2021-04-25 06:32:12', '2021-04-25 06:32:12'),
(9, 139, 'احند', 'ربيع', 'amd@gam.com', '0598799551', 'البر', 'لاالات', '1', '2021-04-26 05:48:41', '2021-04-26 05:48:41'),
(10, NULL, 'ffsf', 'fssf', NULL, 'fsaf', 'eq', 'e', '1', '2021-04-29 05:36:57', '2021-04-29 05:36:57'),
(11, NULL, 'T', 'T', NULL, '123', 'etsts', 'test', '1', '2021-04-29 13:32:36', '2021-04-29 13:32:36'),
(12, NULL, 'jbk', 'bbj', NULL, 'bj', 'bk', 'jbjk', '1', '2021-04-29 13:33:52', '2021-04-29 13:33:52'),
(13, NULL, 'Test', 'test', NULL, '2134568790', 'Testt', 'testtvtvtv message', '1', '2021-04-29 13:54:25', '2021-04-29 13:54:25'),
(14, NULL, 'bjb', 'kjbk', NULL, 'jk', 'bjbk', 'jbk', '1', '2021-04-29 13:57:05', '2021-04-29 13:57:05'),
(15, NULL, 'h', 'hvhjv', NULL, 'hvjhv', 'jvv', 'jhjhv', '1', '2021-04-29 14:11:01', '2021-04-29 14:11:01'),
(16, NULL, 'TT', 'TT', NULL, '89756465421', 'GSGD', 'GSGGSDGSD', '1', '2021-04-29 14:11:59', '2021-04-29 14:11:59'),
(17, NULL, 'TT', 'TT', NULL, '89756465421', 'GSGD', 'GSGGSDGSD', '1', '2021-04-29 14:13:14', '2021-04-29 14:13:14'),
(18, NULL, 'ADAd', 'DAd', NULL, '22', 'e12', 'wqqw', '1', '2021-04-29 19:14:54', '2021-04-29 19:14:54'),
(19, NULL, 'asas', 'as', NULL, 'sasasa', 'asass', 'sasas', '1', '2021-04-29 19:23:52', '2021-04-29 19:23:52'),
(20, 193, 'Hsjdjf', 'Bdjfkf', 'sumit.itegrityproindia@gmail.com', '6468656586', 'Ghxndjdj', 'bdnxkfk', '1', '2021-04-29 22:09:39', '2021-04-29 22:09:39');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_replay`
--

CREATE TABLE `contact_us_replay` (
  `id` int(11) UNSIGNED NOT NULL,
  `contact_us_id` int(11) UNSIGNED NOT NULL,
  `subject` text,
  `message` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us_replay`
--

INSERT INTO `contact_us_replay` (`id`, `contact_us_id`, `subject`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Ganesh Dhamande', 'Ganesh Dhamande', '2021-04-13 06:55:19', '2021-04-13 06:55:19', NULL),
(2, 1, 'Ganesh Dhamande', 'Ganesh Dhamande', '2021-04-13 06:55:46', '2021-04-13 06:55:46', NULL),
(3, 1, 'aa', 'aa', '2021-04-13 07:38:25', '2021-04-13 07:38:25', NULL),
(4, 2, 'solving', 'the problem was solved', '2021-05-07 05:49:01', '2021-05-07 05:49:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_name` varchar(225) DEFAULT NULL,
  `country_name_ar` varchar(225) DEFAULT NULL,
  `country_sort_name` varchar(225) DEFAULT NULL,
  `country_flag` varchar(225) DEFAULT NULL,
  `country_code` varchar(225) DEFAULT NULL,
  `currency_name` varchar(225) DEFAULT NULL,
  `currecy_symbol` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`, `country_name_ar`, `country_sort_name`, `country_flag`, `country_code`, `currency_name`, `currecy_symbol`, `created_at`, `updated_at`) VALUES
(5, 'India', 'India', 'IN', '3MHrxtLaZp_1614675747.jpg', '+91', 'INR', 'Rs', '2021-03-02 09:02:27', '2021-03-02 09:02:27'),
(6, 'Saudi Arabia', 'المملكة العربية السعودية', 'SA', 'x2jTYbNKwH_1615895052.png', '+966', 'ريال', 'SAR', '2021-03-16 11:44:12', '2021-03-16 11:45:05'),
(7, 'Jordan', 'شرق الاردن', 'JO', 'Tp1E7IJaoA_1615997359.png', '+962', 'دينار', 'JD', '2021-03-17 16:09:19', '2021-03-17 16:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_type` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '1=fixed,2=percent',
  `coupon_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `coupon_start_date` date DEFAULT NULL,
  `coupon_end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_type`, `coupon_value`, `coupon_start_date`, `coupon_end_date`, `created_at`, `updated_at`) VALUES
(4, 'CT10', '1', '10', '2021-03-02', '2021-03-31', '2021-03-02 06:04:51', '2021-03-02 06:04:51'),
(5, 'open123', '2', '10', '2021-03-23', '2021-03-26', '2021-03-22 19:25:15', '2021-03-22 19:25:15'),
(6, 'Opening', '1', '10', '2021-04-30', '2021-05-04', '2021-04-18 03:51:41', '2021-04-18 03:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `title`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Forget Password', 'Forget Password', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"http://localhost:8000/admin_assets/images/logo.png\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Please click on the below link to reset your password.</span></span></span></font></font></font></font></p>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\"><a href=\"{reset_url}\" style=\"color: #0185bd;\">Reset Password</a><br />\r\n									If you did not request a password reset, no further action is required.</span></font></div>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2018-09-05 15:25:15', '2020-12-24 00:57:56'),
(2, 'Account Activate', 'Account Activate', '<doctype html=\"\"><br />\r\n<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"http://localhost:8000/admin_assets/images/logo.png\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name}</span></font><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">,</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">&nbsp;Your account is activate with valid reason&nbsp;by online lab</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Email: {email}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><strong>Reason :</strong> {reason}</span></span></span></font></font></font></font></p>\r\n\r\n									<div style=\"line-height: 24px;\"><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> </font></div>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">Online Lab Team</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from Online Lab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; ( Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>\r\n</doctype>', '2018-11-17 06:32:28', '2020-12-24 02:02:46'),
(3, 'Account Deactivate', 'Account Deactivate', '<doctype html=\"\"><br />\r\n<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"http://localhost:8000/admin_assets/images/logo.png\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name}</span></font><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">,</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">&nbsp;Your account is deactivate with valid reason&nbsp;by online lab</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Email: {email}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><strong>Reason :</strong> {reason}</span></span></span></font></font></font></font></p>\r\n\r\n									<div style=\"line-height: 24px;\"><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> </font></div>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">Online Lab Team</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from Online Lab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; ( Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>\r\n</doctype>', '2019-01-30 06:51:02', '2020-12-24 02:13:08'),
(4, 'Vendor Password Send', 'Vendor Password Send', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"http://localhost:8000/admin_assets/images/logo.png\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">You lab is added by Online Lab please login this details.</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\">Email : {email}</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\">Password :{password}<br />\r\n									If you are not able to login with this login details, please contact the online lab.</span></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2020-12-24 01:28:47'),
(5, 'Profile Update', 'Profile Update', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"http://localhost:8000/admin_assets/images/logo.png\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15px;\">Your profile is update with valid reason&nbsp;by Online Lab</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\">Email : {email}</span></font><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\"><strong>Reason </strong>: {reason}</span></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2020-12-24 01:49:36');
INSERT INTO `email_template` (`id`, `title`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(6, 'Prescriptions  Assign', 'Prescriptions  Assign', '<doctype html=\"\"><br />\r\n<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name}</span></font><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">,</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Suggest Lab and Test/Package by onlineLab please check:-</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><strong>Lab Name :</strong> {lab_name}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><strong>Test/Package Name :</strong> {test_package_name}</span></span></span></font></font></font></font></p>\r\n\r\n									<div style=\"line-height: 24px;\"><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size:15px\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><strong>Url :</strong> </span></span></span></font></font></font></font><font style=\"font-size:15px\"><font size=\"4\"><font face=\"Arial, Helvetica, sans-serif\"><font color=\"#57697e\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><a href=\"{lab_url}\" style=\"color:#0185bd\">Lab Url </a></span></span></span></font></font></font></font><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> </font></div>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">Online Lab Team</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from Online Lab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; ( Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>\r\n</doctype>', '2018-11-17 06:32:28', '2021-02-04 04:19:58'),
(7, 'Prescriptions Reject', 'Prescriptions Reject', '<doctype html=\"\"><br />\r\n<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name}</span></font><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">,</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">&nbsp;Your prescriptions&nbsp;&nbsp;is rejected&nbsp; by online lab</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Email: {email}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><strong>Online Lab Note:</strong> {lab_not}</span></span></span></font></font></font></font></p>\r\n\r\n									<div style=\"line-height: 24px;\"><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> </font></div>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">Online Lab Team</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from Online Lab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; ( Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>\r\n</doctype>', '2019-01-30 06:51:02', '2020-12-24 07:08:59'),
(8, 'Add Booking', 'Add Booking', '<doctype html=\"\"><br />\r\n<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name}</span></font><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">,</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">&nbsp;Your booking created by&nbsp;&nbsp;online lab</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Email: {email}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Booking Id: {booking_id}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Total Amount: {total_amount}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> </font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">Online Lab Team</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from Online Lab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; ( Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>\r\n</doctype>', '2018-11-17 06:32:28', '2020-12-24 07:18:34'),
(9, 'Update Booking', 'Update Booking', '<doctype html=\"\"><br />\r\n<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name}</span></font><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">,</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">&nbsp;Your booking updated by&nbsp;&nbsp;online lab</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Email: {email}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Booking Id: {booking_id}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Total Amount: {total_amount}</span></span></span></font></font></font></font></p>\r\n\r\n									<p><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> </font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">Online Lab Team</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from Online Lab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; ( Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>\r\n</doctype>', '2019-01-30 06:51:02', '2020-12-24 07:30:24'),
(10, 'User Otp', 'User Otp', '<doctype html=\"\"><br />\r\n<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name}</span></font><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">,</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">&nbsp;Your otp is here</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\"><strong>Otp :</strong> {otp}</span></span></span></font></font></font></font><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> <!-- Order Number: {order_no}</br> --> </font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">Online Lab Team</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from Online Lab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; ( Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>\r\n</doctype>', '2019-01-30 06:51:02', '2020-12-29 04:27:59');
INSERT INTO `email_template` (`id`, `title`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(11, 'User Registration Password', 'User Registration Password', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Welcome to&nbsp;Online Lab, please login this details.</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\">Email : {email}</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\">Password :{password}<br />\r\n									If you are not able to login with this login details, please contact the online lab.</span></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2020-12-29 05:49:27'),
(12, 'User Prescription', 'User Prescription', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font style=\"\"><font style=\"\"><font style=\"\"><span style=\"color: rgb(87, 105, 126); font-family: Arial, Helvetica, sans-serif; font-size: 15px;\">Welcome to&nbsp;Online Lab, your prescription is submited in online web&nbsp;</span></font></font></font><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font color=\"#57697e\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">.</span></span></span></font></font></font></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;\">Email : {email}</span></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2020-12-29 23:59:41'),
(13, 'Customer Test Report', 'Customer Test Report', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15px;\">Your test reported generated by OnlineLab</span></font></p>\r\n\r\n									<p><font color=\"#57697e\"><font face=\"Arial, Helvetica, sans-serif\"><font size=\"4\"><font style=\"font-size: 15px;\"><span style=\"font-size:15px\"><span style=\"font-family:Arial, Helvetica, sans-serif\"><span style=\"color:#57697e\">Email : {email}</span></span></span></font></font></font></font><br />\r\n									<font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15px;\">Test/Package Name : {test_package_name}</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15px;\">Created Date : {created_date}</span></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2021-01-18 01:31:24'),
(14, 'Add Family Member By', 'Add Family Member By', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {family_member_name},</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15px;\">{user_name} had added you as family member.</span></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {family_member_email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2021-02-18 07:09:05'),
(15, 'Add Family Member', 'Add Family Member', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\"><span style=\"font-size: 15px;\">{family_member_name} added by you</span></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2021-01-18 06:31:14');
INSERT INTO `email_template` (`id`, `title`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(16, 'Test/Package Process Status', 'Test/Package Process Status', '<title></title>\r\n<div class=\"notification\" id=\"mailsub\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"min-width: 320px;\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td bgcolor=\"#eff3f8\">\r\n			<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table_width_100\" style=\"max-width: 680px; min-width: 300px;\" width=\"100%\">\r\n				<tbody>\r\n					<tr>\r\n						<td><!-- padding -->\r\n						<div style=\"height: 80px; line-height: 80px; font-size: 10px;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header -->\r\n					<tr>\r\n						<td bgcolor=\"#ffffff\">\r\n						<div style=\"\r\n    float: left;\r\n    width: 100%;\r\n    height: 5px;\r\n    background-color: #272727;\r\n\">&nbsp;</div>\r\n						<!-- padding -->\r\n\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ececec;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td>&nbsp;</td>\r\n									<td align=\"left\" valign=\"middle\"><!-- padding -->\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" class=\"mob_center\" valign=\"top\"><a color=\"#596167\" href=\"#\" size=\"3\" style=\"color: #596167;font-family: Arial, Helvetica, sans-serif;font-size: 13px;text-align: center;display: block;\" target=\"_blank\"><img alt=\"Def Camp\" border=\"0\" src=\"{logo_url}\" style=\"\" /></a></td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<div style=\"height: 20px; line-height: 20px; font-size: 10px; \">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						<!-- padding -->\r\n\r\n						<div style=\"height: 5px; line-height: 50px; font-size: 10px; border-top: 1px solid #ddd;\">&nbsp;</div>\r\n						</td>\r\n					</tr>\r\n					<!--header END--><!--content 1 -->\r\n					<tr>\r\n						<td bgcolor=\"#fbfcfd\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"line-height: 44px;margin-left: 15px;\">\r\n									<p><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"5\" style=\"font-size: 34px;\"><span style=\"font-family: Arial, Helvetica, sans-serif;font-size: 16px;color: #57697e;font-weight: 600;\">Hello {user_name},</span></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font color=\"#57697e\"><span style=\"font-size:15px\">Your {test_package_name} is {test_status} by {lab_name}</span></font></font></p>\r\n\r\n									<p><font face=\"Arial, Helvetica, sans-serif\"><font color=\"#57697e\"><span style=\"font-size:15px\">Description : {test_description}</span></font></font></p>\r\n									</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">With Regards,</span></font></div>\r\n\r\n									<div style=\"line-height: 24px;\"><font color=\"#57697e\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e; margin-left:15px;\">OnlineLabTeam</span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #ececec;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #000000; margin-left:15px; text-align:center;    font-weight: 600;\">This email was sent to {email} from OnlineLab.</span></font></div>\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #ececec;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr align=\"center\">\r\n									<td><!-- padding -->\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;     margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\"><font color=\"#ffffff\" face=\"Arial, Helvetica, sans-serif\" size=\"4\" style=\"font-size: 15px;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #ffffff; margin-left:15px; text-align:center;    font-weight: 600;\">&copy; (Online Lab) 2020-21. All rights reserved. </span></font></div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;    margin: 0px 15px;\r\n    background-color:  #272727;\">&nbsp;</div>\r\n\r\n									<div style=\"line-height: 24px;    margin: 0px 15px;\r\n    background-color:  #272727;padding-bottom: 20px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 15px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n								<tr>\r\n									<td>\r\n									<div style=\"border-top: 1px solid #000;margin: 0px 15px;\">&nbsp;</div>\r\n									<!-- padding -->\r\n\r\n									<div style=\"height: 10px; line-height: 40px; font-size: 10px;\">&nbsp;</div>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\" width=\"150\">\r\n							<tbody><!--<tr>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/fb.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/tweet.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n									<td align=\"left\" style=\"font-size:1px; line-height:1px;\" width=\"20\">&nbsp;</td>\r\n									<td align=\"center\" height=\"24\" width=\"24\">\r\n									<div class=\"imgpop\"><a href=\"#\" target=\"_blank\"><img alt=\"\" border=\"0\" height=\"24\" src=\"{img_url}/linked.png\" style=\"display:block; border:none; outline:none; text-decoration:none;\" width=\"24\" /> </a></div>\r\n									</td>\r\n								</tr>-->\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<!--content 1 END-->\r\n	</tbody>\r\n</table>\r\n</div>', '2019-02-19 12:35:31', '2021-01-22 05:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `facility_name` varchar(255) DEFAULT NULL,
  `facility_name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `facility_name`, `facility_name_ar`, `created_at`, `updated_at`) VALUES
(1, 'Test Facility ', 'مرفق الاختبار', NULL, NULL),
(2, 'Test Facility 2', 'مرفق الاختبار 2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) UNSIGNED NOT NULL,
  `faq_category_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `title_ar` varchar(225) DEFAULT NULL,
  `question` text,
  `question_ar` text,
  `answer` longtext,
  `answer_ar` longtext,
  `sequence` varchar(225) DEFAULT NULL,
  `type` enum('1','2','3') NOT NULL DEFAULT '3' COMMENT '1=auction,2=user,3=both',
  `status` enum('1','2') NOT NULL COMMENT '1=Active,2=Inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `faq_category_id`, `title`, `title_ar`, `question`, `question_ar`, `answer`, `answer_ar`, `sequence`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Faq1', 'Faq1', 'What is faq?', 'What is faq?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1', '1', '1', '2021-03-04 05:23:02', '2021-03-04 05:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

CREATE TABLE `faq_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `title_ar` varchar(225) DEFAULT NULL,
  `sequence` varchar(225) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq_category`
--

INSERT INTO `faq_category` (`id`, `title`, `title_ar`, `sequence`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Using the application', 'كيفية استخدام التطبيق', '10', '1', '2021-03-02 12:58:26', '2021-04-06 08:42:18'),
(3, 'Downloading the Application', 'حول تحميل التطبيق', '8', '1', '2021-03-02 13:03:26', '2021-03-17 16:12:31'),
(4, 'How can I create a new Auction', 'كيفية انشاء مزاد', '5', '1', '2021-03-17 16:13:58', '2021-03-17 16:13:58'),
(5, 'How can I bid', 'كيفية المشاركة في المزاد', '6', '1', '2021-03-17 16:14:42', '2021-03-17 16:14:42');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `title` text,
  `title_ar` text,
  `form` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `title`, `title_ar`, `form`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'first112', 'first12', 'O1hvIQ4xOT_1615629126.pdf', '2021-03-13 09:52:06', '2021-03-13 10:01:27', NULL),
(2, 'Direct offer', 'العرض المباشر', 'ZkBXZMe6lO_1617532918.pdf', '2021-04-04 10:41:58', '2021-04-04 10:41:58', NULL),
(3, 'Fair Value', 'القيمة العادلة', '5EKFoZfYdg_1617944455.pdf', '2021-04-09 05:00:55', '2021-04-17 20:55:59', NULL),
(4, 'Highest Value', 'القيمة العليا', '834nVxkgTI_1617944476.pdf', '2021-04-09 05:01:16', '2021-04-17 20:56:09', NULL),
(5, 'Minimum Value', 'القيمة الدنيا', 'QHEcGk98a7_1617944502.pdf', '2021-04-09 05:01:42', '2021-04-17 20:55:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `last_category`
--

CREATE TABLE `last_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `last_category`
--

INSERT INTO `last_category` (`id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(1, 'Last Category 1', 'Last Category 1', '2021-03-15 08:53:15', '2021-03-15 08:53:15'),
(2, 'Last Category 2', 'Last Category 2', '2021-03-15 08:53:23', '2021-03-15 08:53:23'),
(3, 'Last Category 3', 'Last Category 3', '2021-03-15 08:53:31', '2021-03-15 08:53:31'),
(4, 'Last Category 4', 'Last Category 4', '2021-03-15 08:53:49', '2021-03-15 08:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `leval_1`
--

CREATE TABLE `leval_1` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leval_1`
--

INSERT INTO `leval_1` (`id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(12, 'Real State', 'عقارات', '2021-03-31 09:57:15', '2021-04-01 13:50:06'),
(13, 'Lands', 'اراضي', '2021-04-01 13:49:55', '2021-04-01 13:49:55'),
(14, 'Cars and Trucks', 'سيارات وشاحنات', '2021-04-01 13:50:46', '2021-04-01 13:50:46'),
(15, 'Ships and Boats', 'سفن وقوارب', '2021-04-01 13:51:10', '2021-04-01 13:51:10'),
(16, 'Planes', 'طائراات', '2021-04-01 13:51:27', '2021-04-01 13:51:27'),
(17, 'Animals and Birds', 'حيونات وطيور', '2021-04-01 13:51:51', '2021-04-01 13:51:51'),
(18, 'Furnitures', 'أثاث', '2021-04-01 13:52:10', '2021-04-01 13:52:10'),
(19, 'Private collectibles', 'مقتنيات خاصة', '2021-04-01 13:52:37', '2021-04-01 13:54:15'),
(20, 'Jewelries', 'مجوهرات', '2021-04-01 13:54:44', '2021-04-01 13:54:44'),
(21, 'Factories and laboratories', 'مختبرات ومصانع', '2021-04-01 13:58:46', '2021-04-01 13:58:46'),
(22, 'Hospitals', 'مستشفيات', '2021-04-01 13:59:03', '2021-04-01 13:59:03'),
(23, 'Others', 'اخرى', '2021-04-01 13:59:33', '2021-04-01 13:59:33'),
(24, 'Malls', 'مولات', '2021-04-01 14:00:04', '2021-04-01 14:00:04'),
(25, 'Antiques', 'تحف', '2021-04-01 14:01:21', '2021-04-01 14:01:43'),
(26, 'Equipments', 'معدات', '2021-04-01 14:02:29', '2021-04-01 14:03:01'),
(27, 'Devices and Electronics', 'الكترونيات واجهزة', '2021-04-01 14:05:25', '2021-04-01 14:05:25'),
(28, 'Animal & Bird', 'Animal & Bird', '2021-04-10 12:12:27', '2021-04-10 12:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `level_2`
--

CREATE TABLE `level_2` (
  `id` int(11) UNSIGNED NOT NULL,
  `level_1_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_2`
--

INSERT INTO `level_2` (`id`, `level_1_id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(10, 12, 'Buildings', 'عمارات وبنايات', '2021-03-31 06:03:39', '2021-04-01 14:06:02'),
(11, 12, 'Compounds', 'مجمعات سكنية', '2021-04-01 14:06:37', '2021-04-01 14:06:37'),
(12, 12, 'Lands', 'اراضي', '2021-04-01 14:07:04', '2021-04-01 14:07:04'),
(13, 12, 'Apartments', 'شقق سكنية', '2021-04-01 14:07:41', '2021-04-01 14:07:41'),
(14, 12, 'Villa and Palces', 'فلل وقصور', '2021-04-01 14:08:22', '2021-04-01 14:08:58'),
(15, 28, 'Animals', 'Animals', '2021-04-10 12:13:12', '2021-04-10 12:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `level_3`
--

CREATE TABLE `level_3` (
  `id` int(11) UNSIGNED NOT NULL,
  `level_2_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_3`
--

INSERT INTO `level_3` (`id`, `level_2_id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(10, 10, 'Commercial', 'تجاري', '2021-03-31 06:23:41', '2021-04-01 14:11:11'),
(11, 10, 'Housing', 'سكني', '2021-04-01 14:11:41', '2021-04-01 14:12:16'),
(12, 12, 'organized within the municipality', 'منطم داخل البلدية', '2021-04-01 14:14:35', '2021-04-01 14:14:35'),
(13, 12, 'Rumored', 'مشاع', '2021-04-01 14:14:51', '2021-04-01 14:14:51'),
(14, 15, 'Horses', 'Horses', '2021-04-10 12:14:59', '2021-04-10 12:14:59');

-- --------------------------------------------------------

--
-- Table structure for table `level_4`
--

CREATE TABLE `level_4` (
  `id` int(11) UNSIGNED NOT NULL,
  `level_3_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_4`
--

INSERT INTO `level_4` (`id`, `level_3_id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(10, 10, 'Furniture Apartment', 'Furniture Apartment', '2021-03-31 06:43:07', '2021-03-31 10:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `level_5`
--

CREATE TABLE `level_5` (
  `id` int(11) UNSIGNED NOT NULL,
  `level_4_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_5`
--

INSERT INTO `level_5` (`id`, `level_4_id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(11, 10, 'Legal', 'رسمي', '2021-04-17 20:58:32', '2021-04-17 20:58:32'),
(12, 10, 'Family Service', 'اهلي', '2021-04-17 20:59:00', '2021-04-17 20:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_14_121733_update_users_table', 1),
(5, '2020_12_14_122917_create_roles_table', 1),
(6, '2020_12_14_123134_create_package_table', 1),
(7, '2020_12_14_123332_create_package_tests_table', 1),
(8, '2020_12_14_123428_create_tests_table', 1),
(9, '2020_12_14_123606_create_contact_us_table', 1),
(10, '2020_12_14_123958_create_prescriptions_table', 1),
(11, '2020_12_14_124256_create_category_table', 1),
(12, '2020_12_14_124410_create_family_members_table', 1),
(13, '2020_12_14_124548_create_lab_availability_table', 1),
(14, '2020_12_14_124656_create_reviews_table', 1),
(15, '2020_12_14_124907_create_lab_gallery_table', 1),
(16, '2020_12_14_125004_create_test_reports_table', 1),
(17, '2020_12_14_125126_create_coupons_table', 1),
(18, '2020_12_14_125640_create_bookings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `sender_id` varchar(225) DEFAULT NULL,
  `receiver_id` varchar(225) DEFAULT NULL,
  `notification_type` varchar(225) DEFAULT NULL,
  `title` varchar(225) DEFAULT NULL,
  `title_ar` varchar(225) DEFAULT NULL,
  `message` varchar(225) DEFAULT NULL,
  `message_ar` varchar(225) DEFAULT NULL,
  `json_data` text,
  `read_status` enum('0','1') NOT NULL DEFAULT '0',
  `notification_for` enum('admin','cron','user') NOT NULL DEFAULT 'admin',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `sender_id`, `receiver_id`, `notification_type`, `title`, `title_ar`, `message`, `message_ar`, `json_data`, `read_status`, `notification_for`, `created_at`, `updated_at`) VALUES
(1, '213', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Ashok Kumar</p>', '<p>New auction added by&nbsp; Ashok Kumar</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":213,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"property_id\":1}', '0', 'admin', '2021-05-26 10:53:09', '2021-05-26 10:53:09'),
(2, '214', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":214,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"property_id\":2}', '0', 'admin', '2021-05-26 10:55:02', '2021-05-26 10:55:02'),
(3, '213', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Ashok Kumar</p>', '<p>New auction added by&nbsp; Ashok Kumar</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":213,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"property_id\":3}', '0', 'admin', '2021-05-26 10:55:34', '2021-05-26 10:55:34'),
(4, '214', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":214,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"property_id\":4}', '0', 'admin', '2021-05-26 10:58:39', '2021-05-26 10:58:39'),
(5, '213', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Ashok Kumar</p>', '<p>New auction added by&nbsp; Ashok Kumar</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":213,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"property_id\":5}', '0', 'admin', '2021-05-26 11:45:27', '2021-05-26 11:45:27'),
(6, '214', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":214,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"property_id\":6}', '0', 'admin', '2021-05-26 12:51:53', '2021-05-26 12:51:53'),
(7, '213', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Ashok Kumar</p>', '<p>New auction added by&nbsp; Ashok Kumar</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":213,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Ashok Kumar<\\/p>\",\"property_id\":7}', '0', 'admin', '2021-05-26 12:59:23', '2021-05-26 12:59:23'),
(8, '214', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":214,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"property_id\":14}', '0', 'admin', '2021-05-27 07:42:35', '2021-05-27 07:42:35'),
(9, '3', '213', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":213,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '1', 'admin', NULL, '2021-05-27 08:26:36'),
(10, '3', '215', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":215,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(11, '3', '216', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":216,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(12, '3', '218', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":218,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(13, '3', '219', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":219,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(14, '3', '220', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":220,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(15, '3', '221', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":221,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(16, '3', '222', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":222,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(17, '3', '223', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":223,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(18, '3', '224', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":224,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(19, '3', '225', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":225,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(20, '3', '233', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":233,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(21, '3', '234', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":234,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(22, '3', '235', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":235,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(23, '3', '236', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":236,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(24, '3', '237', NULL, 'as', 'asfd', 'sadasd', 'fdsf', '{\"sender_id\":3,\"receiver_id\":237,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"as\",\"title_ar\":\"asfd\",\"message\":\"sadasd\",\"message_ar\":\"fdsf\"}', '0', 'admin', NULL, NULL),
(25, '3', '213', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":213,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '1', 'admin', NULL, '2021-05-27 08:26:40'),
(26, '3', '215', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":215,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(27, '3', '216', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":216,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '1', 'admin', NULL, '2021-05-27 12:17:42'),
(28, '3', '218', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":218,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(29, '3', '219', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":219,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(30, '3', '220', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":220,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(31, '3', '221', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":221,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(32, '3', '222', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":222,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(33, '3', '223', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":223,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(34, '3', '224', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":224,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(35, '3', '225', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":225,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(36, '3', '233', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":233,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(37, '3', '234', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":234,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(38, '3', '235', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":235,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(39, '3', '236', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":236,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(40, '3', '237', NULL, 'fttyuii', 'gfgfghf', 'gjhgjgjhg', 'gjghjgjh', '{\"sender_id\":3,\"receiver_id\":237,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"fttyuii\",\"title_ar\":\"gfgfghf\",\"message\":\"gjhgjgjhg\",\"message_ar\":\"gjghjgjh\"}', '0', 'admin', NULL, NULL),
(41, '3', '213', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":213,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(42, '3', '215', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":215,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(43, '3', '216', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":216,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(44, '3', '218', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":218,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(45, '3', '219', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":219,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(46, '3', '220', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":220,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(47, '3', '221', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":221,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(48, '3', '222', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":222,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(49, '3', '223', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":223,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(50, '3', '224', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":224,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(51, '3', '225', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":225,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(52, '3', '233', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":233,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(53, '3', '234', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":234,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(54, '3', '235', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":235,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(55, '3', '236', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":236,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(56, '3', '237', NULL, 'Happy EID', 'Happy Eid', 'Happy EIDHappy EIDHappy EIDHappy EID', 'Happy EIDHappy EIDHappy EID', '{\"sender_id\":3,\"receiver_id\":237,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Happy EID\",\"title_ar\":\"Happy Eid\",\"message\":\"Happy EIDHappy EIDHappy EIDHappy EID\",\"message_ar\":\"Happy EIDHappy EIDHappy EID\"}', '0', 'admin', NULL, NULL),
(57, '3', '215', NULL, 'Test From Admin', 'Test From Admin', 'Test From Admin MSG', 'Test From Admin MSG', '{\"sender_id\":3,\"receiver_id\":215,\"notification_type\":\"by_admin\",\"role\":\"2\",\"title\":\"Test From Admin\",\"title_ar\":\"Test From Admin\",\"message\":\"Test From Admin MSG\",\"message_ar\":\"Test From Admin MSG\"}', '0', 'admin', NULL, NULL),
(58, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":17}', '0', 'admin', '2021-05-27 12:13:45', '2021-05-27 12:13:45'),
(59, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":18}', '0', 'admin', '2021-05-27 12:33:22', '2021-05-27 12:33:22'),
(60, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":19}', '0', 'admin', '2021-05-27 12:45:03', '2021-05-27 12:45:03'),
(61, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":20}', '0', 'admin', '2021-05-27 12:50:23', '2021-05-27 12:50:23'),
(62, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":21}', '0', 'admin', '2021-05-27 13:03:42', '2021-05-27 13:03:42'),
(63, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":22}', '0', 'admin', '2021-05-27 13:05:40', '2021-05-27 13:05:40'),
(64, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":23}', '0', 'admin', '2021-05-27 13:09:12', '2021-05-27 13:09:12'),
(65, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":24}', '0', 'admin', '2021-05-27 13:12:15', '2021-05-27 13:12:15'),
(66, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":25}', '0', 'admin', '2021-05-27 13:14:05', '2021-05-27 13:14:05'),
(67, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":26}', '0', 'admin', '2021-05-27 13:16:09', '2021-05-27 13:16:09'),
(68, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":27}', '0', 'admin', '2021-05-27 13:18:24', '2021-05-27 13:18:24'),
(69, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":28}', '0', 'admin', '2021-05-27 13:21:18', '2021-05-27 13:21:18'),
(70, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":29}', '0', 'admin', '2021-05-27 13:22:59', '2021-05-27 13:22:59'),
(71, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":30}', '0', 'admin', '2021-05-27 13:26:45', '2021-05-27 13:26:45'),
(72, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":31}', '0', 'admin', '2021-05-27 13:28:50', '2021-05-27 13:28:50'),
(73, '216', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Archana Salvi</p>', '<p>New auction added by&nbsp; Archana Salvi</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":216,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Archana Salvi<\\/p>\",\"property_id\":32}', '0', 'admin', '2021-05-27 13:33:01', '2021-05-27 13:33:01'),
(74, '214', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":214,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"property_id\":33}', '0', 'admin', '2021-05-27 13:38:35', '2021-05-27 13:38:35'),
(75, '214', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":214,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"property_id\":34}', '0', 'admin', '2021-05-27 13:41:20', '2021-05-27 13:41:20'),
(76, '214', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '<p>New auction added by&nbsp; Roshani Nagpure</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":214,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Roshani Nagpure<\\/p>\",\"property_id\":35}', '0', 'admin', '2021-05-27 13:43:38', '2021-05-27 13:43:38'),
(77, '239', '3', 'new_auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; Hamza Dff</p>', '<p>New auction added by&nbsp; Hamza Dff</p>', '{\"notification_type\":\"new_auction\",\"sender_id\":239,\"receiver_id\":3,\"title\":\"New Auction\",\"title_ar\":\"New Auction Is Created\",\"message\":\"<p>New auction added by&nbsp; Hamza Dff<\\/p>\",\"message_ar\":\"<p>New auction added by&nbsp; Hamza Dff<\\/p>\",\"property_id\":37}', '0', 'admin', '2021-05-30 05:06:22', '2021-05-30 05:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `notification_template`
--

CREATE TABLE `notification_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `template_type` varchar(225) DEFAULT NULL,
  `template_type_name` varchar(255) DEFAULT NULL,
  `title` text,
  `title_ar` text,
  `content` longtext,
  `content_ar` longtext,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification_template`
--

INSERT INTO `notification_template` (`id`, `template_type`, `template_type_name`, `title`, `title_ar`, `content`, `content_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'new_auction', 'New Auction', 'New Auction', 'New Auction Is Created', '<p>New auction added by&nbsp; {user_name}</p>', '<p>New auction added by&nbsp; {user_name}</p>', '2021-04-05 05:54:04', '2021-05-25 06:34:25', NULL),
(2, 'update_auction', 'Update Auction', 'Update Auction', 'Update Auction', '<p>update auction by {user_name}</p>', '<p>update auction by {user_name}</p>', '2021-04-05 07:04:23', '2021-05-20 06:31:12', NULL),
(3, 'bid_added_on_auction', 'Bid Added On Auction', 'Bid Added Successfully', NULL, 'Your bid added successfully on Mazady', NULL, '2021-05-20 06:25:29', '2021-05-25 06:34:49', NULL),
(4, '15_min_before_auction_start', '15 Min Before Auction Start', 'Auction will be start in 15 min', NULL, 'Auction will be start in 15 min on Mazady', NULL, '2021-05-20 06:27:06', '2021-05-25 06:35:28', NULL),
(5, '15_min_before_auction_end', '15 Min Before Auction End', 'Auction will be End in 15 min', NULL, 'Auction will be End in 15 min on Mazady', NULL, '2021-05-20 06:27:15', '2021-05-25 06:36:03', NULL),
(6, 'auction_started', 'Auction Started', 'Auction is started', NULL, 'Auction is started on Mazady', NULL, '2021-05-20 06:27:33', '2021-05-25 06:35:44', NULL),
(7, 'auction_result', 'Auction Result', NULL, NULL, NULL, NULL, '2021-05-20 06:27:50', '2021-05-20 06:31:53', NULL),
(8, 'auction_winner_user', 'Auction Winner ( Winner Notification )', 'Your Bid Won', NULL, 'Your bid won auction on Mazady', NULL, '2021-05-20 06:28:19', '2021-05-25 06:35:07', NULL),
(9, 'payment_reminder', 'Payment Reminder', NULL, NULL, NULL, NULL, '2021-05-20 06:28:39', '2021-05-20 06:32:32', NULL),
(10, 'amount_add_wallet', 'Amount added to wallet', NULL, NULL, NULL, NULL, '2021-05-20 06:29:02', '2021-05-20 06:32:53', NULL),
(11, 'amount_deduct_wallet', 'Amount deduct from wallet', NULL, NULL, NULL, NULL, '2021-05-20 06:29:13', '2021-05-20 06:33:01', NULL),
(12, 'pending_request', 'Pending Request', NULL, NULL, NULL, NULL, '2021-05-20 06:29:28', '2021-05-20 06:33:07', NULL),
(13, 'approved_request', 'Approved Request', NULL, NULL, NULL, NULL, '2021-05-20 06:29:37', '2021-05-20 06:33:19', NULL),
(14, 'registration_success', 'Registration Successful', 'Registration Successful', NULL, 'You are successfully registered on Mazady', NULL, '2021-05-25 06:21:32', '2021-05-25 06:34:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `page_type` varchar(225) DEFAULT NULL,
  `title` text,
  `title_ar` text,
  `content` longtext,
  `content_ar` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_type`, `title`, `title_ar`, `content`, `content_ar`, `created_at`, `updated_at`) VALUES
(6, 'about_us', 'About Us', 'عنا', '<p>&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;</p>', '<p>&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;</p>', '2021-04-06 07:08:42', '2021-04-21 14:26:30'),
(7, 'About US', 'About Us', 'من نحن', '<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><b><span style=\"font-size:24.0pt\"><span style=\"font-family:&quot;online auction&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">About the Saudi-Mazad ِAuction application</span></span></span></b></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">The Saudi Auction application was created in 2019 based on the requirements of modern technology in electronic dealing in all aspects of life.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">This app includes two classes of auctions:</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">Private auction</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">It is an auction that enables any person or entity to offer any real estate, material or goods for auction, and the application provides the possibility of participating in the bidding by any person or entity according to the terms and regulations of the Kingdom of Saudi Arabia.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">Forced auction</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">&nbsp;As for the electronic forced auction, it is a smart way that enables the owner or buyer to buy and sell electronically by offering an auction in an organized manner and at a relatively low administrative cost, and enables the Ministry of Justice to manage the process of liquidating fixed and movable funds, whereby the process of preparing assets and evaluating them with the relevant authorities and from Then put it up for sale on the platform in electronic form that allows all participating individuals to enter and bid.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">According to the regulations of the Saudi Ministry of Justice, there are nine steps to organize the auction electronically; Represented in:</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">1- Attribution of the sale from the court.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">2- Entering auction and advertisement details.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">3- Registration of bidders online.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">4- Verify the eligibility of bidders and solvency in the system.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">5- Launching the auction.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">6- Awarding the auction and issuing the payment invoice.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">7- Send the minutes of sale to the judge via the sales agent electronically.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">8- Issuance of approval.</span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">9- Empty the property electronically from the judge.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:20px\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">All of these conditions are fully available in the application, in addition to the application for forced compulsion that includes several facilities for dealing between the judicial and resident sales agent, the administrative control representative and the buyer and the various justice and security departments in the Kingdom, all through one comprehensive platform.</span></span></span></span></span></span></p>', '<p align=\"right\" style=\"text-align:right; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><b><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:24.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">عن تطبيق مزاد السعودية &nbsp;الالكتروني&nbsp; </span></span></span></b></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">مزاد السعودية&nbsp; الالكتروني&nbsp; هو أحداث طريقة تسمح لتقديم عطاءات للسلع &nbsp;والعقارعلى الانترنت بدون برامج للتحميل او ادوات خاصة للشراء فقط عليك ان تصبح عضوا وتكون على استعداد لتقديم المزايدات والعطاءات</span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">وتم انشاء تطبيق مزاد السعودية عام&nbsp;2019 وذلك<span style=\"background:white\"> بناء على متطلبات التقنية الحديثة في التعامل الالكتروني في كل نواحي الحياة .</span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">فهذا التطبيق يشتمل على صنفين من المزادات هما:</span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><b><u><span lang=\"AR-SA\" style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:red\">المزاد الخاص </span></span></span></u></b></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">وهو مزاد يمكن اي شخص او جهة من طرح اي عقار او مادة او بضاعة للمزاد العلني , ويتيح التطبيق امكانية المشاركة في المزايدة من قبل اي شخص اوم كيان حسب شروط وانظمة المملكة العربية السعودية.</span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><b><u><span lang=\"AR-SA\" style=\"font-size:18.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:red\">المزاد الجبري </span></span></span></u></b></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">&nbsp;اما المزاد &nbsp;الجبري الالكتروني فهو طريقة ذكية تمكن المالك او الشاري من البيع والشراء الكترونيا من خلال طرح مزاد وبطريقة منظمة وبكلفة ادارية قليلة نسبيا ,&nbsp; و تمكّن وزارة العدل من إدارة عملية تصفية الأموال الثابتة والمنقولة ، حيث يتم إدارة عملية تهيئة الأصول وتقييمها مع الجهات ذات العلاقة ومن ثم طرحها للبيع في المنصة بشكل إلكتروني يتيح لجميع الأفراد المشاركين من الدخول والمزايدة</span></span></span><span dir=\"LTR\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;online auction&quot;,&quot;serif&quot;\"><span style=\"color:#212529\"> .</span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">وهناك حسب انظمة وزارة العدل السعودية تسع خطوات لتنظيم المزاد إلكترونياً؛ تتمثل في</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">:</span></span></span></span></span></span></span></span></p>\r\n\r\n<ol>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">إسناد البيع من المحكمة</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">إدخال تفاصيل المزاد والإعلان</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">تسجيل المزايدين إلكترونياً</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">التحقق من أهلية المزايدين والملاءة المالية في النظام</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">إنطلاق المزاد</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">ترسية المزاد وإصدار فاتورة السداد</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">إرسال محضر البيع للقاضي عبر وكيل البيع إلكترونياً</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">إصدار الموافقة</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n	<li dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">إفراغ العقار إلكترونياً من القاضي</span></span></span><span dir=\"LTR\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.</span></span></span></span></span></span></span></span></li>\r\n</ol>\r\n\r\n<p dir=\"RTL\" style=\"margin-right:48px; margin-bottom:20px; text-align:right\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span lang=\"AR-SA\" style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">وكل هذه الشروط متوفرة في التطبيق بشكل كامل اضافة الى ان التطبيق الخاص بالمزلاد الجبري يتضمن عدة تسهيلات للتعامل ما بين وكيل البيع القضائي والمقيم ومندوب الضبط الاداري والشاري وكنابات العدل والامانات المختلفة في المملكة وكل ذلك من خلال منصة واحدة شاملة.</span></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:20px\"><span style=\"font-size:12pt\"><span style=\"background:white\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:11.5pt\"><span style=\"font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;\"><span style=\"color:#333333\">.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></span></span></span></p>', '2021-04-06 07:49:42', '2021-04-17 20:45:03'),
(8, 'legal', 'Legal', 'الاشتراطات والاحكام', '<p>&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '<p>&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2021-04-06 09:45:43', '2021-04-21 14:27:11'),
(9, 'privacy_policy', 'Privacy Policy', 'سياسة الخصوصية', '<ul>\r\n	<li style=\"margin-left:8px\"><span style=\"font-size:11pt\"><span style=\"line-height:115%\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"line-height:115%\">Add the language file in admin please to be updated from time to time with best Arabic expression</span></span></span></span></span></li>\r\n	<li style=\"margin-bottom:13px; margin-left:8px\"><span style=\"font-size:11pt\"><span style=\"line-height:115%\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"line-height:115%\">The side list of the admin change its back ground color to be orange and black text color,&nbsp; please&nbsp; or white with orange text color ,,</span></span></span></span></span></li>\r\n	<li style=\"margin-bottom:13px; margin-left:8px\">\r\n	<figure class=\"easyimage easyimage-full\"><img alt=\"\" src=\"blob:http://mazad.webzproject.com/43c94323-aed9-4091-bfed-11c66ae2b403\" width=\"1024\" />\r\n	<figcaption></figcaption>\r\n	</figure>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '<p>&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2021-04-06 09:51:04', '2021-04-21 14:29:32'),
(10, 'terms_conditions', 'Terms and Conditions', 'الشروط والاحكام', '<figure class=\"easyimage easyimage-full\"><img alt=\"\" src=\"blob:https://mazad.webzproject.com/fc17d887-8b9f-4962-a640-1bfc410cb7ef\" width=\"1280\" />\r\n<figcaption></figcaption>\r\n</figure>\r\n\r\n<p align=\"right\" style=\"text-align:right; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><b><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:24.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">عن تطبيق مزاد السعودية &nbsp;الالكتروني&nbsp; </span></span></span></b></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">مزاد السعودية&nbsp; الالكتروني&nbsp; هو أحداث طريقة تسمح لتقديم عطاءات للسلع &nbsp;والعقارعلى الانترنت بدون برامج للتحميل او ادوات خاصة للشراء فقط عليك ان تصبح عضوا وتكون على استعداد لتقديم المزايدات والعطاءات</span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">وتم انشاء تطبيق مزاد السعودية عام&nbsp;2019 وذلك<span style=\"background:white\"> بناء على متطلبات التقنية الحديثة في التعامل الالكتروني في كل نواحي الحياة .</span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"background:white\"><span style=\"line-height:normal\"><span style=\"direction:rtl\"><span style=\"unicode-bidi:embed\"><span style=\"font-family:Calibri,sans-serif\"><span lang=\"AR-SA\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#212529\">فهذا التطبيق يشتمل على صنفين من المزادات هما:</span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p dir=\"RTL\" style=\"text-align:justify; margin-bottom:11px\">&nbsp;</p>\r\n\r\n<figure class=\"easyimage easyimage-full\"><img alt=\"\" src=\"blob:https://mazad.webzproject.com/12cc22fe-809b-4cfc-9197-826705868b67\" width=\"299\" />\r\n<figcaption></figcaption>\r\n</figure>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>\r\n\r\n<p>&nbsp;</p>', '<p>&quot;On the other hand, we denounce with righteous indignation and</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2021-04-06 09:52:35', '2021-06-17 05:55:28'),
(11, 'Privacy Policy', 'Privacy Policy', 'سياسة الخصوصية', '<p>Privacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy Policy</p>', '<p>Privacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy PolicyPrivacy Policy</p>', '2021-04-21 15:04:05', '2021-04-22 18:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `iban` varchar(225) DEFAULT NULL,
  `country_code` varchar(225) DEFAULT NULL,
  `check_digits` varchar(225) DEFAULT NULL,
  `bank_code` varchar(225) DEFAULT NULL,
  `bank_account_name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_address` text,
  `bank_account_number` varchar(225) DEFAULT NULL,
  `terminal_id` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `merchant_key` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `iban`, `country_code`, `check_digits`, `bank_code`, `bank_account_name`, `bank_name`, `bank_address`, `bank_account_number`, `terminal_id`, `password`, `merchant_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SA03 8000 0000 6080 1016 7519', 'SA', '03', '800', 'Mazady Pvt Ltd', 'Kuwait Bank', 'kuwait', '000000608010167519', 'TR123', 'PAss1234', 'AAAAAasasasasasasasasasasadafsdf', NULL, '2021-05-24 10:19:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `permission` text,
  `permission_ar` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission`, `permission_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Settings', NULL, '2021-04-13 09:12:48', '2021-04-14 07:47:54', NULL),
(3, 'Private Auction Home', NULL, '2021-04-13 11:24:23', '2021-04-14 06:46:26', NULL),
(4, 'Advertisement & ADS Home', 'Advertisement & Ads Home', '2021-04-13 11:24:45', '2021-04-14 06:42:34', NULL),
(5, 'Account Management', NULL, '2021-04-14 07:48:17', '2021-04-14 07:48:17', NULL),
(6, 'Countries/Areas &Cities', NULL, '2021-04-14 07:48:29', '2021-04-14 07:48:29', NULL),
(7, 'Tags/Gifts Management', NULL, '2021-04-14 07:48:46', '2021-04-14 07:48:46', NULL),
(8, 'Properties Management', NULL, '2021-04-14 07:48:57', '2021-04-14 07:48:57', NULL),
(9, 'Auction Management', NULL, '2021-04-14 07:49:09', '2021-04-14 07:49:09', NULL),
(10, 'Ratings', NULL, '2021-04-14 07:49:18', '2021-04-14 07:49:18', NULL),
(11, 'Comments', NULL, '2021-04-14 07:49:34', '2021-04-14 07:49:34', NULL),
(12, 'Comments', 'Comments', '2021-04-13 09:12:48', '2021-04-14 07:47:54', NULL),
(13, 'Refund Requests', 'Refund Requests', '2021-04-13 11:24:23', '2021-04-14 06:46:26', NULL),
(14, 'Wallets Management', 'Wallets Management', '2021-04-13 11:24:45', '2021-04-14 06:42:34', NULL),
(15, 'Moderating Conversations', 'Moderating Conversations', '2021-04-14 07:48:17', '2021-04-14 07:48:17', NULL),
(16, 'Auctions Notices', 'Auctions Notices', '2021-04-14 07:48:29', '2021-04-14 07:48:29', NULL),
(17, 'Coupons', 'Coupons', '2021-04-14 07:48:46', '2021-04-14 07:48:46', NULL),
(18, 'Web Management', 'Web Management', '2021-04-14 07:48:57', '2021-04-14 07:48:57', NULL),
(19, 'Category Type', 'Category Type', '2021-04-14 07:49:09', '2021-04-14 07:49:09', NULL),
(20, 'Case Of Property', 'Case Of Property', '2021-04-14 07:49:18', '2021-04-14 07:49:18', NULL),
(21, 'Payment Management', 'Payment Management', '2021-04-14 07:49:34', '2021-04-14 07:49:34', NULL),
(22, 'Enquiry Forms Management', 'Enquiry Forms Management', '2021-04-14 07:48:29', '2021-04-14 07:48:29', NULL),
(23, 'CMS Management', 'CMS Management', '2021-04-14 07:48:46', '2021-04-14 07:48:46', NULL),
(24, 'Reports Management', 'Reports Management', '2021-04-14 07:48:57', '2021-04-14 07:48:57', NULL),
(25, 'Contact Support Management', 'Contact Support Management', '2021-04-14 07:49:09', '2021-04-14 07:49:09', NULL),
(26, 'Auction Asset Type', 'Auction Asset Type', '2021-04-14 07:49:18', '2021-04-14 07:49:18', NULL),
(27, 'Alerts & Notifications Management', 'Alerts & Notifications Management', '2021-04-14 07:49:34', '2021-04-14 07:49:34', NULL),
(28, 'Notification Templates', 'Notification Templates', '2021-04-14 07:49:34', '2021-04-14 07:49:34', NULL),
(29, 'Marketing System Management', 'Marketing System Management', '2021-04-14 07:48:29', '2021-04-14 07:48:29', NULL),
(30, 'API Management', 'API Management', '2021-04-14 07:48:46', '2021-04-14 07:48:46', NULL),
(31, 'Properties Evaluation Management', 'Properties Evaluation Management', '2021-04-14 07:48:57', '2021-04-14 07:48:57', NULL),
(32, 'Administration & Settings', 'Administration & Settings', '2021-04-14 07:49:09', '2021-04-14 07:49:09', NULL),
(33, 'Users Training System', 'Users Training System', '2021-04-14 07:49:18', '2021-04-14 07:49:18', NULL),
(34, 'SMS Bank Management', 'SMS Bank Management', '2021-04-14 07:48:46', '2021-04-14 07:48:46', NULL),
(35, 'FAQ Management', 'FAQ Management', '2021-04-14 07:48:57', '2021-04-14 07:48:57', NULL),
(36, 'Server Monitoring', 'Server Monitoring', '2021-04-14 07:49:09', '2021-04-14 07:49:09', NULL),
(37, 'Locations Of Auctions', 'Locations Of Auctions', '2021-04-14 07:49:18', '2021-04-14 07:49:18', NULL),
(38, 'Logout', 'Logout', '2021-04-14 07:49:09', '2021-04-14 07:49:09', NULL),
(39, 'SMS Bank Management', 'SMS Bank Management', '2021-04-14 07:49:18', '2021-04-14 07:49:18', NULL),
(40, 'Offers', 'Offers', NULL, NULL, NULL),
(41, 'Rent Management', 'Rent Management', NULL, NULL, NULL),
(42, 'Facility Management', 'Facility Management', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_administration`
--

CREATE TABLE `permission_administration` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission_administration`
--

INSERT INTO `permission_administration` (`id`, `role_id`, `user_id`, `permission_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 9, NULL, 2, NULL, NULL, NULL),
(8, 9, NULL, 3, NULL, NULL, NULL),
(83, 11, NULL, 2, NULL, NULL, NULL),
(84, 11, NULL, 3, NULL, NULL, NULL),
(85, 11, NULL, 5, NULL, NULL, NULL),
(86, 11, NULL, 6, NULL, NULL, NULL),
(87, 11, NULL, 7, NULL, NULL, NULL),
(88, 11, NULL, 10, NULL, NULL, NULL),
(269, 1, NULL, 2, NULL, NULL, NULL),
(270, 1, NULL, 3, NULL, NULL, NULL),
(271, 1, NULL, 4, NULL, NULL, NULL),
(272, 1, NULL, 5, NULL, NULL, NULL),
(273, 1, NULL, 6, NULL, NULL, NULL),
(274, 1, NULL, 8, NULL, NULL, NULL),
(275, 1, NULL, 9, NULL, NULL, NULL),
(276, 1, NULL, 10, NULL, NULL, NULL),
(277, 1, NULL, 11, NULL, NULL, NULL),
(278, 1, NULL, 12, NULL, NULL, NULL),
(279, 1, NULL, 13, NULL, NULL, NULL),
(280, 1, NULL, 14, NULL, NULL, NULL),
(281, 1, NULL, 15, NULL, NULL, NULL),
(282, 1, NULL, 16, NULL, NULL, NULL),
(283, 1, NULL, 17, NULL, NULL, NULL),
(284, 1, NULL, 18, NULL, NULL, NULL),
(285, 1, NULL, 19, NULL, NULL, NULL),
(286, 1, NULL, 20, NULL, NULL, NULL),
(287, 1, NULL, 21, NULL, NULL, NULL),
(288, 1, NULL, 22, NULL, NULL, NULL),
(289, 1, NULL, 23, NULL, NULL, NULL),
(290, 1, NULL, 24, NULL, NULL, NULL),
(291, 1, NULL, 25, NULL, NULL, NULL),
(292, 1, NULL, 26, NULL, NULL, NULL),
(293, 1, NULL, 27, NULL, NULL, NULL),
(294, 1, NULL, 28, NULL, NULL, NULL),
(295, 1, NULL, 29, NULL, NULL, NULL),
(296, 1, NULL, 30, NULL, NULL, NULL),
(297, 1, NULL, 31, NULL, NULL, NULL),
(298, 1, NULL, 32, NULL, NULL, NULL),
(299, 1, NULL, 33, NULL, NULL, NULL),
(300, 1, NULL, 34, NULL, NULL, NULL),
(301, 1, NULL, 35, NULL, NULL, NULL),
(302, 1, NULL, 36, NULL, NULL, NULL),
(303, 1, NULL, 37, NULL, NULL, NULL),
(304, 1, NULL, 38, NULL, NULL, NULL),
(305, 1, NULL, 39, NULL, NULL, NULL),
(306, 1, NULL, 40, NULL, NULL, NULL),
(307, 1, NULL, 41, NULL, NULL, NULL),
(308, 1, NULL, 42, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1=property,2=auctions,''3''=rental_property',
  `property_type` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `level_1_id` int(11) UNSIGNED DEFAULT NULL,
  `level_2_id` int(11) UNSIGNED DEFAULT NULL,
  `level_3_id` int(11) UNSIGNED DEFAULT NULL,
  `level_4_id` int(11) UNSIGNED DEFAULT NULL,
  `level_5_id` int(11) UNSIGNED DEFAULT NULL,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `unit` varchar(225) DEFAULT NULL,
  `state_id` int(11) UNSIGNED DEFAULT NULL,
  `city_id` int(11) UNSIGNED DEFAULT NULL,
  `zipcode` varchar(225) DEFAULT NULL,
  `location` varchar(225) DEFAULT NULL,
  `lat` varchar(225) DEFAULT NULL,
  `lng` varchar(225) DEFAULT NULL,
  `evaluation` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  `security_deposit` varchar(225) DEFAULT NULL,
  `home_facts` varchar(225) DEFAULT NULL,
  `room_details` varchar(225) DEFAULT NULL,
  `build_year` varchar(255) DEFAULT NULL,
  `utility_details` varchar(225) DEFAULT NULL,
  `facility` varchar(225) DEFAULT NULL,
  `mobile_number` varchar(225) DEFAULT NULL,
  `available_date` varchar(225) DEFAULT NULL,
  `beds` varchar(225) DEFAULT NULL,
  `bathrooms` varchar(225) DEFAULT NULL,
  `short_description` text,
  `descprition` text,
  `squarefeet` varchar(225) DEFAULT NULL,
  `lease_duration` varchar(225) DEFAULT NULL,
  `conctact_information` varchar(225) DEFAULT NULL,
  `services` varchar(225) DEFAULT NULL,
  `terms_condtions` enum('0','1') NOT NULL DEFAULT '1',
  `logo` varchar(225) DEFAULT NULL,
  `title` varchar(225) DEFAULT NULL,
  `issue_place_of_document` varchar(225) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `last_category_id` int(11) DEFAULT NULL,
  `evaluator_city_id` int(11) DEFAULT NULL,
  `number` text COMMENT 'evaluator ids',
  `field` varchar(225) DEFAULT NULL,
  `date` varchar(225) DEFAULT NULL,
  `max_price` varchar(225) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `time` varchar(225) DEFAULT NULL,
  `property_value` varchar(225) DEFAULT NULL,
  `min_amount_bid` varchar(225) DEFAULT NULL COMMENT 'Bid Charges',
  `max_amount_bid` varchar(225) DEFAULT NULL,
  `land_size` varchar(225) DEFAULT NULL,
  `status` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `admin_status` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Pending,1=Accept,2=Canceled,3=Completed,4=Postponed,5=Incomplete Conditions,6=Wrong',
  `awarded_id` int(11) DEFAULT NULL,
  `accept_terms` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `type`, `property_type`, `user_id`, `level_1_id`, `level_2_id`, `level_3_id`, `level_4_id`, `level_5_id`, `category_id`, `address`, `unit`, `state_id`, `city_id`, `zipcode`, `location`, `lat`, `lng`, `evaluation`, `price`, `security_deposit`, `home_facts`, `room_details`, `build_year`, `utility_details`, `facility`, `mobile_number`, `available_date`, `beds`, `bathrooms`, `short_description`, `descprition`, `squarefeet`, `lease_duration`, `conctact_information`, `services`, `terms_condtions`, `logo`, `title`, `issue_place_of_document`, `country_id`, `sub_category_id`, `last_category_id`, `evaluator_city_id`, `number`, `field`, `date`, `max_price`, `start_date`, `end_date`, `start_time`, `end_time`, `time`, `property_value`, `min_amount_bid`, `max_amount_bid`, `land_size`, `status`, `admin_status`, `awarded_id`, `accept_terms`, `created_at`, `updated_at`) VALUES
(1, '2', NULL, 213, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 24, NULL, '19212, Saudi Arabia', '23.885941930590985', '45.079162046313286', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', NULL, NULL, NULL, NULL, '1', '72J9Qvnj6S_1622026389.jpg', 'Auction For Saudi', 'Saudi', 6, 1, 1, 6, '214', 'Saudi', '2021-05-26', '1000', '2021-05-26', '2021-05-26', '16:30:00', '17:00:00', '04:19PM', '25000', '2500', NULL, '2000 Squre Meter', '0', '1', NULL, '1', '2021-05-26 10:53:09', '2021-05-26 10:57:13'),
(2, '2', NULL, 214, 22, NULL, NULL, NULL, NULL, 2, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234512862784047', '76.39313891530037', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Stylish living spaces for business and leisure in some of the world’s favorite destinations', 'The essence of Radisson Blu is reflected in every aspect of who we are and what we do. We provide unparalleled service, comfort and style, while creating meaningful and memorable experiences.', NULL, NULL, NULL, NULL, '1', 'JXdiMyZshU_1622026502.jpg', 'Radisson hotel', 'Indore', 5, 1, 1, 7, '', 'Test', '2021-05-26', '271', '2021-05-26', '2021-09-30', '16:23:00', '16:23:00', '04:23PM', '5', '100', NULL, '20 Meter', '0', '6', NULL, '1', '2021-05-26 10:55:02', '2021-05-27 07:59:41'),
(3, '2', NULL, 213, 22, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 24, NULL, '156, Risi Nagar, Ada Bazar, Indore, Madhya Pradesh 452007, India', '22.71956881492173', '75.85772573947906', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', NULL, NULL, NULL, NULL, '1', 'DrY6IQrdcs_1622026534.jpg', 'Auction Second', 'India', 6, 1, 1, 6, '214', 'Goigle', '2021-05-26', '1000', '2021-05-26', '2021-05-26', '17:00:00', '23:24:00', '04:24PM', '30000', '3000', NULL, '1500 Squre Feet', '0', '1', NULL, '1', '2021-05-26 10:55:34', '2021-05-26 10:57:00'),
(4, '2', NULL, 214, 20, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23448306957071', '76.39316372573376', NULL, '238', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Chokhi Dhani is a luxury resort that showcases various colors, flavors and essence of Rajasthani culture and way of being. ', 'Chokhi Dhani is a luxury resort that showcases various colors, flavors and essence of Rajasthani culture and way of being. Chokhi Dhani literally means a special village and it is called so as it gives you a tangible feel of a Rajasthani village set up with a royal twist. Situated away from the hustle of city centers, it is situated in a peaceful location amidst greenery and foliage where you can enjoy some quality time with your loved ones. ', NULL, NULL, NULL, NULL, '1', 'aPPt0iBRaW_1622026719.jpg', 'choki ki dhani', 'Indore', 5, 1, 1, 7, '', 'Test', '2021-05-26', '734', '2021-05-26', '2021-09-30', '16:26:00', '16:26:00', '04:26PM', '5', '100', NULL, '10 Meter', '0', '1', NULL, '1', '2021-05-26 10:58:39', '2021-05-26 10:59:25'),
(5, '2', NULL, 213, 13, NULL, NULL, NULL, NULL, 4, NULL, NULL, 6, 23, NULL, 'Al-Suhaifah, Jeddah 22237, Saudi Arabia', '21.485810890733177', '39.1925048455596', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', NULL, NULL, NULL, NULL, '1', 'zCnSMYypq5_1622029527.jpg', 'Auction Three', 'Saudi', 6, 1, 1, 6, '214', 'Saudi First', '2021-05-26', '1000', '2021-05-26', '2021-05-26', '18:14:00', '19:14:00', '05:14PM', '3000', '300', NULL, '250 Meter', '0', '6', NULL, '1', '2021-05-26 11:45:27', '2021-05-27 07:59:31'),
(6, '2', NULL, 214, 26, NULL, NULL, NULL, NULL, 6, NULL, NULL, 7, 7, NULL, 'Punasa Rd, Punasa, Madhya Pradesh 450114, India', '22.23351230390415', '76.39176260679962', NULL, '67', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'nY32PUSCFc_1622033513.jpg', 'Auction property', 'Indore', 5, 1, 1, 7, '', 'Test', '2021-05-26', '642', '2021-05-26', '2021-06-30', '18:21:00', '18:21:00', '06:21PM', '3000', '50', NULL, '10 Meter', '0', '1', NULL, '1', '2021-05-26 12:51:53', '2021-05-26 13:01:44'),
(7, '2', NULL, 213, 13, NULL, NULL, NULL, NULL, 2, NULL, NULL, 6, 23, NULL, '19212, Saudi Arabia', '23.885941930590985', '45.079162046313286', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', NULL, NULL, NULL, NULL, '1', 'fJhcvQJknD_1622033963.jpg', 'Auction4', 'Saudi', 6, 1, 1, 6, '214', 'Saudi Area', '2021-05-28', '1000', '2021-05-26', '2021-05-27', '18:27:00', '18:27:00', '06:27PM', '20000', '200', NULL, '1500 Squre Feet', '0', '1', NULL, '1', '2021-05-26 12:59:23', '2021-05-26 13:01:37'),
(8, '1', NULL, 214, 22, NULL, NULL, NULL, NULL, 5, 'indore', NULL, NULL, 7, '452001', 'Punasa Rd, Punasa, Madhya Pradesh 450114, India', '22.23351230390415', '76.39176260679962', 'Evaluation', '3000', NULL, '5', NULL, NULL, 'test', 'gardan facility', '86336868676', NULL, '3', NULL, 'test', 'test', NULL, NULL, NULL, 'Car', '1', NULL, 'Test', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10 Meter', '0', '1', NULL, '1', '2021-05-26 13:12:39', '2021-05-26 14:02:12'),
(9, '3', NULL, 221, 13, NULL, NULL, NULL, NULL, 2, 'Jeddah Saudi Arabia', NULL, 9, 24, NULL, 'Jeddah Saudi Arabia', '21.485810890733177', '39.1925048455596', NULL, '2000', '5000', NULL, NULL, NULL, NULL, 'car parking free', NULL, '27/5/2021', '3', '2', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', NULL, '11', '9340254599', 'Car', '1', NULL, 'New House For Rent', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1200 Squre Feet', '0', '1', NULL, '1', '2021-05-26 13:14:24', '2021-05-26 13:15:15'),
(10, '1', NULL, 214, 26, NULL, NULL, NULL, NULL, 5, 'indore', NULL, NULL, 7, '452001', 'Narmadanagar - Punasa - Mundi Rd, Punasa, Madhya Pradesh 450114, India', '22.234885898106757', '76.39935795217752', 'Evaluation', '100', NULL, 'test', NULL, '1997', 'test', 'gardan facility', '97676766767', NULL, '3', NULL, 'test', 'test', NULL, NULL, NULL, 'Car', '1', NULL, 'Test', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10 Meter', '0', '1', NULL, '1', '2021-05-26 13:41:47', '2021-05-26 14:02:06'),
(11, '1', NULL, 213, 24, NULL, NULL, NULL, NULL, 6, 'aghjjj', NULL, NULL, 24, '455245', '193, Srinagar Kakad, Shree Nagar, Indore, Madhya Pradesh 452018, India', '22.729395532855985', '75.89272554963827', 'Evaluation', '25000', NULL, 'new building', NULL, '2005', 'fgg', 'gardan facility', '9340254599', NULL, '2', NULL, 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', NULL, NULL, NULL, 'Car', '1', NULL, 'Villa', NULL, NULL, NULL, NULL, NULL, '214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000 Squre Feet', '0', '1', NULL, '1', '2021-05-26 14:16:57', '2021-05-26 14:29:50'),
(12, '1', NULL, 213, 22, NULL, NULL, NULL, NULL, 6, 'fhshshs', NULL, NULL, 24, '452001', 'Al-Suhaifah, Jeddah 22237, Saudi Arabia', '21.485810890733177', '39.1925048455596', 'Evaluation', '25000', NULL, 'chsjdjd', NULL, '2005', 'ghdhdjd', 'gardan facility', '9340254599', NULL, '2', NULL, 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', 'Alphabet Inc. - Wikipedia\n\nAlphabet Inc. is an American multinational conglomerate headquartered in Mountain View, California. It was created through a restructuring', NULL, NULL, NULL, 'Car', '1', NULL, 'New Property For Sell', NULL, NULL, NULL, NULL, NULL, '214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1500 Squre Feet', '0', '1', NULL, '1', '2021-05-26 14:29:23', '2021-05-26 14:29:44'),
(13, '3', NULL, 228, 12, 10, NULL, NULL, NULL, 2, 'Al Bahah Saudi Arabia', NULL, 17, 33, NULL, 'Al Bahah Saudi Arabia', '20.021740642486712', '41.47127341479064', NULL, '1234', '12', NULL, NULL, NULL, NULL, 'parking', NULL, '16/6/2021', '4', '3', 'big apartment', 'good furnitured apadtment', NULL, '2', '555555565', 'Car', '1', NULL, 'Furnitured Apartment', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '250 Squre Meter', '0', '0', NULL, '1', '2021-05-27 05:47:46', '2021-05-27 05:47:46'),
(14, '2', NULL, 214, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.2343362758333', '76.39305241405964', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'Uw1VxXK4jc_1622101355.jpg', 'New Auction  For Biding', 'Indore', 5, 1, 1, 7, '232239', 'Test', '2021-05-27', '1000', '2021-05-27', '2021-06-30', '13:17:00', '13:12:00', '01:11PM', '100', '100', NULL, '10 Squre Feet', '0', '3', NULL, '1', '2021-05-27 07:42:35', '2021-05-27 07:59:08'),
(15, '1', NULL, 213, 22, NULL, NULL, NULL, NULL, 6, 'fhsjdj', NULL, NULL, 24, '45288', '192, Srinagar Kakad, Shree Nagar, Indore, Madhya Pradesh 452018, India', '22.729429549095116', '75.89271213859321', 'Evaluation', 'dgdhd', NULL, 'gxhhx', NULL, '2005', 'hdhjd', 'gardan facility', '897979', NULL, '3', NULL, 'bdjdjdk', 'hhhdjjf', NULL, NULL, NULL, 'Car', '1', NULL, 'Fhshdjd', NULL, NULL, NULL, NULL, NULL, '239214232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1200 Kilometer', '0', '0', NULL, '1', '2021-05-27 08:33:20', '2021-05-27 08:33:20'),
(16, '1', NULL, 216, 23, NULL, NULL, NULL, NULL, 5, 'indore', NULL, NULL, 7, '452001', 'Pocket G-27, Sector 3G, Rohini, Delhi, 110085, India', '28.704100080224276', '77.10250005126', 'Evaluation', '100', NULL, '3', NULL, '2020', 'test', 'gardan facility', '61646646161616', NULL, '3', NULL, 'test', 'test', NULL, NULL, NULL, 'Car', '1', NULL, 'Property', NULL, NULL, NULL, NULL, NULL, '214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20 Squre Feet', '0', '0', NULL, '1', '2021-05-27 12:11:29', '2021-05-27 12:11:29'),
(17, '2', NULL, 216, 22, NULL, NULL, NULL, NULL, 8, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234545449103898', '76.39312785118818', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'Hbv57pXJij_1622117625.jpg', 'Test', 'Indore', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '927', '2021-05-27', '2021-05-27', '17:43:00', '17:43:00', '05:43PM', '200', '100', NULL, '10 Squre Meter', '0', '0', NULL, '1', '2021-05-27 12:13:45', '2021-05-27 12:13:45'),
(18, '2', NULL, 216, 28, 15, 14, NULL, NULL, 6, NULL, NULL, 7, 7, NULL, 'Sanawad-Punasa-Mundi Main Rd, Punasa, Madhya Pradesh 450114, India', '22.23272805192289', '76.39819890260696', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'eEb43R8eZQ_1622118802.jpg', 'Test', 'Bzbzhz', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '552', '2021-05-27', '2021-05-27', '18:02:00', '18:02:00', '06:02PM', '100', '150', NULL, '20 Squre Feet', '0', '0', NULL, '1', '2021-05-27 12:33:22', '2021-05-27 12:33:22'),
(19, '2', NULL, 216, 27, NULL, NULL, NULL, NULL, 8, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23464475974623', '76.39309030026197', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'IwgrWeSEn3_1622119503.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '870', '2021-05-27', '2021-05-27', '18:14:00', '18:14:00', '06:14PM', '10', '20', NULL, '20 Squre Meter', '0', '0', NULL, '1', '2021-05-27 12:45:03', '2021-05-27 12:45:03'),
(20, '2', NULL, 216, 20, NULL, NULL, NULL, NULL, 8, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23448369026271', '76.39315132051706', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', '7FWnBzMfQ3_1622119823.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '846', '2021-05-27', '2021-05-27', '18:19:00', '18:19:00', '06:19PM', '180', '150', NULL, '10 Squre Feet', '0', '0', NULL, '1', '2021-05-27 12:50:23', '2021-05-27 12:50:23'),
(21, '2', NULL, 216, 26, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234525586967', '76.39313723891973', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'wEGzEgXJhj_1622120622.jpg', 'Bzbzbz', 'Zbbzbz', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '880', '2021-05-27', '2021-05-27', '18:33:00', '18:33:00', '06:33PM', '10', '10', NULL, '10 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:03:42', '2021-05-27 13:03:42'),
(22, '2', NULL, 216, 26, NULL, NULL, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234529621463782', '76.39309834688902', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'cgh7n7bWLP_1622120740.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '724', '2021-05-27', '2021-06-30', '18:34:00', '18:34:00', '06:34PM', '100', '100', NULL, '10 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:05:40', '2021-05-27 13:05:40'),
(23, '2', NULL, 216, 20, NULL, NULL, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23449951790802', '76.3931342214346', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gsgsgsgshsg', 'hdhdxh', NULL, NULL, NULL, NULL, '1', 'XWBLzgnpEp_1622120952.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '853', '2021-05-27', '2021-05-27', '18:38:00', '18:43:00', '06:38PM', '10', '10', NULL, '10 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:09:12', '2021-05-27 13:09:12'),
(24, '2', NULL, 216, 20, NULL, NULL, NULL, NULL, 8, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234535207689902', '76.39308158308269', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, '1', 'wenRpImnK6_1622121135.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '931', '2021-05-27', '2021-05-27', '18:41:00', '18:41:00', '06:41PM', '1000', '2000', NULL, '20 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:12:15', '2021-05-27 13:12:15'),
(25, '2', NULL, 216, 20, NULL, NULL, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23448493164673', '76.39317244291306', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bdhdhsjsj', 'dbbdbdb', NULL, NULL, NULL, NULL, '1', 'ANQO8BL4xs_1622121245.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '1000', '2021-05-27', '2021-06-30', '18:43:00', '18:43:00', '06:43PM', '2155', '8956', NULL, '10 Squre Meter', '0', '0', NULL, '1', '2021-05-27 13:14:05', '2021-05-27 13:14:05'),
(26, '2', NULL, 216, 20, NULL, NULL, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234471897114073', '76.39316238462925', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hdhhshdh', 'bdhdhd', NULL, NULL, NULL, NULL, '1', 'rrdG6QTQEg_1622121369.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '18:45:00', '18:45:00', '06:45PM', '100', '200', NULL, '20 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:16:09', '2021-05-27 13:16:09'),
(27, '2', NULL, 216, 21, NULL, NULL, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234484000608717', '76.39316473156214', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hdhdhddh', 'bddbhdhd', NULL, NULL, NULL, NULL, '1', 'WmoROK3btS_1622121503.jpg', 'Test', 'Test', 5, 1, 1, 7, '214', 'Test', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '18:47:00', '18:47:00', '06:48PM', '9595', '94944', NULL, '10 Kilometer', '0', '0', NULL, '1', '2021-05-27 13:18:23', '2021-05-27 13:18:23'),
(28, '2', NULL, 216, 28, NULL, NULL, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23448555233873', '76.39315333217384', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'zvbzbzhzhzhzg', 'xgxhxhy', NULL, NULL, NULL, NULL, '1', 'AX68ViTtdQ_1622121678.jpg', 'Hzzhhz', 'Zbbzbz', 5, 1, 1, 7, '214', 'Hzhzhz', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '18:50:00', '18:50:00', '06:50PM', '676767', '767676', NULL, '20 Squre Meter', '0', '0', NULL, '1', '2021-05-27 13:21:18', '2021-05-27 13:21:18'),
(29, '2', NULL, 216, 28, 15, 14, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23446786261562', '76.39316707849503', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bdhdhhdh', 'hdyys', NULL, NULL, NULL, NULL, '1', 'lutAFfOxFK_1622121779.jpg', 'Hdhdh', 'Bsbhs', 5, 1, 1, 7, '214', 'Hdhdhdy', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '18:52:00', '18:52:00', '06:52PM', '95646465', '95656', NULL, '20 Squre Meter', '0', '0', NULL, '1', '2021-05-27 13:22:59', '2021-05-27 13:22:59'),
(30, '2', NULL, 216, 28, 15, 14, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Sanawad-Punasa-Mundi Main Rd, Punasa, Madhya Pradesh 450114, India', '22.23272805192289', '76.39819890260696', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hdhdhdgdggdgsgshhss', 'dbhshdhdhdh', NULL, NULL, NULL, NULL, '1', 'ARe284Kdj3_1622122005.jpg', 'Hdjdjd', 'Hdhhs', 5, 1, 1, 7, '214', 'Bdhdhdh', '2021-05-27', '1000', '2021-05-27', '2021-05-31', '18:56:00', '18:56:00', '06:56PM', '95656', '9565', NULL, '10 Kilometer', '0', '0', NULL, '1', '2021-05-27 13:26:45', '2021-05-27 13:26:45'),
(31, '2', NULL, 216, 25, NULL, NULL, NULL, NULL, 2, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23455569051715', '76.39310840517282', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dhhdhdh', 'hshsys', NULL, NULL, NULL, NULL, '1', 'w3vc7Sol6H_1622122130.jpg', 'Gdhsh', 'Hdhdh', 5, 1, 1, 7, '214', 'Bdhdh', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '18:58:00', '18:58:00', '06:58PM', '6466464', '6566535', NULL, '20 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:28:50', '2021-05-27 13:28:50'),
(32, '2', NULL, 216, 20, NULL, NULL, NULL, NULL, 2, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234506966211086', '76.39307454228401', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dhhshdhd', 'shhshs', NULL, NULL, NULL, NULL, '1', 'GR8CFNoBZI_1622122381.jpg', 'Hdhsh', 'Bdbdhd', 5, 1, 1, 7, '214', 'Hdhdhd', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '19:02:00', '19:02:00', '07:02PM', '65656', '5634', NULL, '20 Squre Meter', '0', '0', NULL, '1', '2021-05-27 13:33:01', '2021-05-27 13:33:01'),
(33, '2', NULL, 214, 28, 15, 14, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.234478104034533', '76.3931231573224', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guffu', 'hhcuuf', NULL, NULL, NULL, NULL, '1', 'PZZjX4dKsy_1622122715.jpg', 'Ufgfu', 'Hcufuf', 5, 1, 1, 7, '232', 'Fjxutxutd', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '19:07:00', '19:07:00', '07:07PM', '09865', '986865', NULL, '50 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:38:35', '2021-05-27 13:38:35'),
(34, '2', NULL, 214, 23, NULL, NULL, NULL, NULL, 3, NULL, NULL, 7, 7, NULL, 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', '22.23442472450956', '76.39314495027065', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'btvtv', 'btvt', NULL, NULL, NULL, NULL, '1', 'yNcWSEqQZS_1622122880.jpg', '5g4f44f', 'Yhyg4t', 5, 1, 1, 7, '232', 'Tgg5', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '19:09:00', '19:09:00', '07:09PM', '9696', '699226', NULL, '58 Meter', '0', '0', NULL, '1', '2021-05-27 13:41:20', '2021-05-27 13:41:20'),
(35, '2', NULL, 214, 21, NULL, NULL, NULL, NULL, 9, NULL, NULL, 7, 7, NULL, 'Punasa Rd, Punasa, Madhya Pradesh 450114, India', '22.23351230390415', '76.39176260679962', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tcycyvuv', 'gcgcyc', NULL, NULL, NULL, NULL, '1', 'B0BbaLJpOu_1622123018.jpg', 'Vhyvgv', 'H Yvyv', 5, 1, 1, 7, '232', 'Hbubhv', '2021-05-27', '1000', '2021-05-27', '2021-05-27', '19:12:00', '19:12:00', '07:12PM', '66006', '696868', NULL, '9358 Squre Feet', '0', '0', NULL, '1', '2021-05-27 13:43:38', '2021-05-27 13:43:38'),
(36, '3', NULL, 239, 12, 13, NULL, NULL, NULL, 2, 'Riyadh 11564, Saudi Arabia', NULL, 9, 23, NULL, 'Riyadh 11564, Saudi Arabia', '24.713551649161143', '46.67529568076134', NULL, '1200', '100', NULL, NULL, NULL, NULL, 'غفاال', NULL, '11/5/2022', '5', '4', 'بيت', 'بوت صاو', NULL, '2', '666663', 'Car', '1', NULL, 'الرياض', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '500 Squre Meter', '0', '0', NULL, '1', '2021-05-30 04:56:56', '2021-05-30 04:56:56'),
(37, '2', NULL, 239, 28, 15, 14, NULL, NULL, 6, NULL, NULL, 6, 30, NULL, '4080 الكتاب، الملك عبدالعزيز، الرياض 12233 7605،، As Sulimaniyah, Riyadh 12233, Saudi Arabia', '24.697603754268343', '46.71981733292341', NULL, '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'مزاوده', 'وصق وصف', NULL, NULL, NULL, NULL, '1', 'bni78alUJt_1622351182.jpg', 'مزاد الروضه', 'الاردن', 6, 1, 1, 6, '214', 'الحيوانات', '2022-05-30', '1000', '2022-05-31', '2022-05-31', '08:04:00', '10:04:00', '08:02AM', '10000', '1000', NULL, 'null', '0', '0', NULL, '1', '2021-05-30 05:06:22', '2021-05-30 05:06:22'),
(38, '1', NULL, 239, 27, NULL, NULL, NULL, NULL, 6, 'الكهرباء', NULL, NULL, 23, '1242', 'Riyadh 12251, Saudi Arabia', '24.713551649161143', '46.67529568076134', 'Evaluation', '١٢٩٩٩', NULL, 'جميل', NULL, '2011', 'سياره', 'gardan facility', '33333333', NULL, '4', NULL, 'صببف', 'اهلا ٥', NULL, NULL, NULL, 'Car', '1', NULL, 'الرياض', NULL, NULL, NULL, NULL, NULL, '214232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1000 Squre Meter', '0', '0', NULL, '1', '2021-05-30 05:18:19', '2021-05-30 05:18:19');

-- --------------------------------------------------------

--
-- Table structure for table `property_bids`
--

CREATE TABLE `property_bids` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `date` varchar(225) NOT NULL,
  `time` varchar(225) NOT NULL,
  `place` varchar(225) DEFAULT NULL,
  `property_display` varchar(225) DEFAULT NULL,
  `awarded_buyer` varchar(225) DEFAULT NULL,
  `id_card` varchar(225) DEFAULT NULL,
  `intial_amount` int(100) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `check_number` varchar(225) DEFAULT NULL,
  `bank_name` varchar(225) DEFAULT NULL,
  `issue_on` varchar(225) DEFAULT NULL,
  `remaining_complete_amount` varchar(225) DEFAULT NULL,
  `within_working_days` varchar(225) DEFAULT NULL,
  `seller_name` varchar(225) DEFAULT NULL,
  `seller_card_number` varchar(225) DEFAULT NULL,
  `seller_card_date` varchar(225) DEFAULT NULL,
  `seller_source` varchar(225) DEFAULT NULL,
  `seller_signature` varchar(225) DEFAULT NULL,
  `seller_date` varchar(225) DEFAULT NULL,
  `buyer_name` varchar(225) DEFAULT NULL,
  `buyer_card_number` varchar(225) DEFAULT NULL,
  `buyer_card_date` varchar(225) DEFAULT NULL,
  `buyer_source` varchar(225) DEFAULT NULL,
  `buyer_signature` varchar(225) DEFAULT NULL,
  `buyer_date` varchar(225) DEFAULT NULL,
  `auction_sale_name` varchar(225) DEFAULT NULL,
  `auction_sale_card_number` varchar(225) DEFAULT NULL,
  `auction_sale_card_date` varchar(225) DEFAULT NULL,
  `auction_sale_source` varchar(225) DEFAULT NULL,
  `auction_sale_signature` varchar(225) DEFAULT NULL,
  `auction_sale_date` varchar(225) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0' COMMENT '0=pending,1=awarded',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_bids`
--

INSERT INTO `property_bids` (`id`, `user_id`, `property_id`, `date`, `time`, `place`, `property_display`, `awarded_buyer`, `id_card`, `intial_amount`, `tax`, `vat`, `check_number`, `bank_name`, `issue_on`, `remaining_complete_amount`, `within_working_days`, `seller_name`, `seller_card_number`, `seller_card_date`, `seller_source`, `seller_signature`, `seller_date`, `buyer_name`, `buyer_card_number`, `buyer_card_date`, `buyer_source`, `buyer_signature`, `buyer_date`, `auction_sale_name`, `auction_sale_card_number`, `auction_sale_card_date`, `auction_sale_source`, `auction_sale_signature`, `auction_sale_date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 214, 1, '2021-05-26', '04:19PM', '19212, Saudi Arabia', '19212, Saudi Arabia', 'Roshani', 'QUnPbpgQ96_1622028766.jpg', 2500, NULL, NULL, '6868', 'cut hcy', '2021-05-26', '855858', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-26 11:32:46', '2021-05-27 07:11:35', NULL),
(2, 213, 2, '2021-05-26', '04:23PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Ashok', '7Sgq7Tgv7b_1622029764.jpg', 200, NULL, NULL, '12333456585', 'saydi bank', '2021-05-26', '656566', 'fgh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 11:49:24', '2021-05-26 11:51:53', NULL),
(3, 217, 2, '2021-05-26', '04:23PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Amit', 'Pg9fWaVMMF_1622029895.jpg', 250, NULL, NULL, '797676', 'test', '2021-05-26', '5000', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 11:51:35', '2021-05-26 11:52:31', NULL),
(4, 216, 2, '2021-05-26', '04:23PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Archana', 'NPmG6oeBPR_1622031255.jpg', 100, NULL, NULL, '79979886868', 'test', '2021-05-26', '1000', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 12:14:15', '2021-05-26 12:14:15', NULL),
(5, 213, 2, '2021-05-26', '04:23PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Ashok', '19DqHCiy0W_1622031322.jpg', 100, NULL, NULL, '12333456585', 'saydi bank', '2021-05-26', '656566', 'fgh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 12:15:22', '2021-05-26 12:15:22', NULL),
(6, 217, 4, '2021-05-26', '04:26PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Amit', 'SOUw4etM5u_1622031357.jpg', 700, NULL, NULL, '98555555885', 'test', '2021-05-26', '2000', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 12:15:57', '2021-05-26 12:28:46', NULL),
(7, 216, 4, '2021-05-26', '04:26PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Archana', 'gOe5vHPYaZ_1622031437.jpg', 100, NULL, NULL, '67676767', 'test', '2021-05-26', '676', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 12:17:17', '2021-05-26 12:17:17', NULL),
(8, 221, 7, '2021-05-26', '06:27PM', '19212, Saudi Arabia', '19212, Saudi Arabia', 'Ashok', 'DYctPJKdns_1622034308.jpg', 500, NULL, NULL, '123456', 'zghj', '2021-05-27', '18800', 'wiggj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-26 13:05:08', '2021-05-26 13:08:02', NULL),
(9, 214, 7, '2021-05-26', '06:27PM', '19212, Saudi Arabia', '19212, Saudi Arabia', 'Roshani', 'SqSvYbtMyy_1622034342.jpg', 400, NULL, NULL, '4667766867676', 'test', '2021-05-26', '5757575775', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 13:05:42', '2021-05-26 13:06:14', NULL),
(10, 213, 6, '2021-05-26', '06:21PM', 'Punasa Rd, Punasa, Madhya Pradesh 450114, India', 'Punasa Rd, Punasa, Madhya Pradesh 450114, India', 'Ashok', 'ucBbZIpx8J_1622099814.jpg', 300, NULL, NULL, '967686', 'gjdjdjd', '2021-05-27', '69868', 'bjdjdkf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 07:16:54', '2021-05-27 07:32:37', NULL),
(11, 216, 6, '2021-05-26', '06:21PM', 'Punasa Rd, Punasa, Madhya Pradesh 450114, India', 'Punasa Rd, Punasa, Madhya Pradesh 450114, India', 'Archana', 'Bdz81Ld23M_1622099871.jpg', 150, NULL, NULL, '9898989', 'hxhx', '2021-05-27', '6565', 'hdhdh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-27 07:17:51', '2021-05-27 07:18:38', NULL),
(12, 213, 14, '2021-05-27', '01:11PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Ashok', 'fGiRn8kys8_1622101722.jpg', 300, NULL, NULL, '87676', 'vsdh', '2021-05-27', '99886', 'hdbjd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2021-05-27 07:48:42', '2021-05-27 07:56:00', NULL),
(13, 221, 14, '2021-05-27', '01:11PM', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Unnamed Road, Punasa, Madhya Pradesh 450114, India', 'Ashok', '7iU1V7xUBC_1622101936.jpg', 250, NULL, NULL, '122', 'arab', '2021-05-27', '15555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-27 07:52:16', '2021-05-27 07:54:57', NULL),
(14, 239, 7, '2021-05-26', '06:27PM', '19212, Saudi Arabia', '19212, Saudi Arabia', 'Hamza', 'VK5eaOBe6t_1622352543.jpg', 200, NULL, NULL, '122', 'العربي', '2021-05-31', '1222', '١٢٢٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2021-05-30 05:29:03', '2021-05-30 05:29:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_buyers`
--

CREATE TABLE `property_buyers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `date` varchar(225) NOT NULL,
  `time` varchar(225) NOT NULL,
  `place` varchar(225) DEFAULT NULL,
  `property_display` varchar(225) DEFAULT NULL,
  `awarded_buyer` varchar(225) DEFAULT NULL,
  `id_card` varchar(225) DEFAULT NULL,
  `intial_amount` varchar(225) DEFAULT NULL,
  `check_number` varchar(225) DEFAULT NULL,
  `bank_name` varchar(225) DEFAULT NULL,
  `issue_on` varchar(225) DEFAULT NULL,
  `remaining_complete_amount` varchar(225) DEFAULT NULL,
  `within_working_days` varchar(225) DEFAULT NULL,
  `seller_name` varchar(225) DEFAULT NULL,
  `seller_card_number` varchar(225) DEFAULT NULL,
  `seller_card_date` varchar(225) DEFAULT NULL,
  `seller_source` varchar(225) DEFAULT NULL,
  `seller_signature` varchar(225) DEFAULT NULL,
  `seller_date` varchar(225) DEFAULT NULL,
  `buyer_name` varchar(225) DEFAULT NULL,
  `buyer_card_number` varchar(225) DEFAULT NULL,
  `buyer_card_date` varchar(225) DEFAULT NULL,
  `buyer_source` varchar(225) DEFAULT NULL,
  `buyer_signature` varchar(225) DEFAULT NULL,
  `buyer_date` varchar(225) DEFAULT NULL,
  `auction_sale_name` varchar(225) DEFAULT NULL,
  `auction_sale_card_number` varchar(225) DEFAULT NULL,
  `auction_sale_card_date` varchar(225) DEFAULT NULL,
  `auction_sale_source` varchar(225) DEFAULT NULL,
  `auction_sale_signature` varchar(225) DEFAULT NULL,
  `auction_sale_date` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_follows`
--

CREATE TABLE `property_follows` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `other_user_id` int(11) UNSIGNED DEFAULT NULL,
  `follow_status` enum('0','1') NOT NULL COMMENT '0=unfollow,1=follow',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_follows`
--

INSERT INTO `property_follows` (`id`, `user_id`, `property_id`, `other_user_id`, `follow_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 213, 7, NULL, '1', '2021-05-26 13:00:10', '2021-05-26 13:00:10', NULL),
(2, 239, 7, NULL, '1', '2021-05-30 05:25:17', '2021-05-30 05:25:17', NULL),
(3, 239, 9, NULL, '1', '2021-05-30 06:24:10', '2021-05-30 06:24:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `image` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'U0JxY8oUSn_1622026389.png', NULL, NULL),
(2, 1, 'IE42pNtPg4_1622026389.png', NULL, NULL),
(3, 2, '8YzYjDDNTb_1622026502.jpg', NULL, NULL),
(4, 2, 'DyBpicEURJ_1622026502.jpg', NULL, NULL),
(5, 3, 'H1AHiNPfr1_1622026534.png', NULL, NULL),
(6, 3, 'fFd9brPn70_1622026534.png', NULL, NULL),
(7, 3, '7FOs0fTtiR_1622026534.png', NULL, NULL),
(8, 4, '9sn4P1KBzn_1622026719.jpeg', NULL, NULL),
(9, 5, 'ie38eOR5H5_1622029527.png', NULL, NULL),
(10, 5, 'DFtVSYwSUI_1622029527.png', NULL, NULL),
(11, 6, 'JQSkZLLr4B_1622033513.jpg', NULL, NULL),
(12, 7, 'RjN3ACZRk3_1622033963.png', NULL, NULL),
(13, 7, 'zZaXYuf11L_1622033963.png', NULL, NULL),
(14, 7, 'jSDTz9mFOx_1622033963.png', NULL, NULL),
(15, 8, 'pDUsXrA7mz_1622034759.jpg', NULL, NULL),
(16, 9, 'glPemjxI5F_1622034864.png', NULL, NULL),
(17, 10, '7eS38VR0HD_1622036507.jpg', NULL, NULL),
(18, 17, 'Ov0kHVkt36_1622038617.jpg', NULL, NULL),
(19, 11, 'mgaw4yUnR4_1622038617.jpg', NULL, NULL),
(20, 11, 'QLdq9lnypJ_1622038617.jpg', NULL, NULL),
(21, 12, 'E4OoAM1S65_1622039363.jpg', NULL, NULL),
(22, 12, 'hq3JQYr9hj_1622039363.jpg', NULL, NULL),
(23, 12, 'HjKTShxkOQ_1622039363.jpg', NULL, NULL),
(24, 12, 'Nb4A2VJxBd_1622039363.jpg', NULL, NULL),
(25, 15, '813m6bWAx3_1622104400.jpg', NULL, NULL),
(26, 15, 'scHYMJ2OOO_1622104400.jpg', NULL, NULL),
(27, 16, 'QfFOxPkYNZ_1622117489.jpg', NULL, NULL),
(28, 27, 'IfCAFqm8ay_1622121503.jpg', NULL, NULL),
(29, 28, 'TTOheyjhyo_1622121678.jpg', NULL, NULL),
(30, 29, '4SbR0XH8Cg_1622121779.jpg', NULL, NULL),
(31, 35, 'RwWlG7tANt_1622123018.jpg', NULL, NULL),
(32, 38, 'Q4R9SP8cvq_1622351899.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_likes`
--

CREATE TABLE `property_likes` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `like_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=unlike,1=like',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property_likes`
--

INSERT INTO `property_likes` (`id`, `user_id`, `property_id`, `like_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 214, 10, '1', '2021-05-26 14:13:02', '2021-05-26 14:13:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_make_an_offers`
--

CREATE TABLE `property_make_an_offers` (
  `id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(225) DEFAULT NULL,
  `second_name` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `offer_price` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `validation_date` date DEFAULT NULL,
  `accept_terms` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('pending','accept','reject') NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_make_offers`
--

CREATE TABLE `property_make_offers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `date` varchar(225) NOT NULL,
  `time` varchar(225) NOT NULL,
  `place` varchar(225) DEFAULT NULL,
  `property_display` varchar(225) DEFAULT NULL,
  `awarded_buyer` varchar(225) DEFAULT NULL,
  `id_card` varchar(225) DEFAULT NULL,
  `intial_amount` varchar(225) DEFAULT NULL,
  `check_number` varchar(225) DEFAULT NULL,
  `bank_name` varchar(225) DEFAULT NULL,
  `issue_on` varchar(225) DEFAULT NULL,
  `remaining_complete_amount` varchar(225) DEFAULT NULL,
  `within_working_days` varchar(225) DEFAULT NULL,
  `seller_name` varchar(225) DEFAULT NULL,
  `seller_card_number` varchar(225) DEFAULT NULL,
  `seller_card_date` varchar(225) DEFAULT NULL,
  `seller_source` varchar(225) DEFAULT NULL,
  `seller_signature` varchar(225) DEFAULT NULL,
  `seller_date` varchar(225) DEFAULT NULL,
  `buyer_name` varchar(225) DEFAULT NULL,
  `buyer_card_number` varchar(225) DEFAULT NULL,
  `buyer_card_date` varchar(225) DEFAULT NULL,
  `buyer_source` varchar(225) DEFAULT NULL,
  `buyer_signature` varchar(225) DEFAULT NULL,
  `buyer_date` varchar(225) DEFAULT NULL,
  `auction_sale_name` varchar(225) DEFAULT NULL,
  `auction_sale_card_number` varchar(225) DEFAULT NULL,
  `auction_sale_card_date` varchar(225) DEFAULT NULL,
  `auction_sale_source` varchar(225) DEFAULT NULL,
  `auction_sale_signature` varchar(225) DEFAULT NULL,
  `auction_sale_date` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_payments`
--

CREATE TABLE `property_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `type` enum('online','bank_transfer','cheque','wallet') NOT NULL DEFAULT 'online',
  `pp_txn_id` varchar(255) DEFAULT NULL COMMENT 'Autogenerate Unique id',
  `amount` varchar(255) DEFAULT '0',
  `pg_txn_id` varchar(255) DEFAULT NULL COMMENT 'payment gateway txn id',
  `cheque_image` varchar(255) DEFAULT NULL,
  `benificery_name` varchar(255) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `cheque_issue_date` varchar(255) DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT '0' COMMENT '0-pending,1-success,2-failed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property_payments`
--

INSERT INTO `property_payments` (`id`, `property_id`, `user_id`, `type`, `pp_txn_id`, `amount`, `pg_txn_id`, `cheque_image`, `benificery_name`, `cheque_no`, `cheque_issue_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'vPropertyId', '221', 'online', '1622035579', 'vAmount', '2114613148388344357', NULL, NULL, NULL, NULL, '0', '2021-05-26 20:26:19', '2021-05-26 20:26:19'),
(2, '10', '213', 'bank_transfer', '1622039743', '110', NULL, NULL, NULL, NULL, NULL, '0', '2021-05-26 21:35:43', '2021-05-26 21:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `property_refund_requests`
--

CREATE TABLE `property_refund_requests` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `property_bid_id` int(11) UNSIGNED DEFAULT NULL,
  `refund_amount` varchar(225) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=pending,1=refunded,2=rejected',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_refund_requests`
--

INSERT INTO `property_refund_requests` (`id`, `user_id`, `property_id`, `property_bid_id`, `refund_amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 213, 14, 12, '300', '0', '2021-05-28 05:34:06', '2021-05-28 05:34:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_saved_search`
--

CREATE TABLE `property_saved_search` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_status`
--

CREATE TABLE `property_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `status` varchar(225) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_status`
--

INSERT INTO `property_status` (`id`, `status`, `name`, `name_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '0', 'Pending', 'Pending', NULL, NULL, NULL),
(2, '1', 'Accept', 'Accept', NULL, NULL, NULL),
(3, '2', 'Canceled', 'Canceled', NULL, NULL, NULL),
(4, '3', 'Completed', 'Completed', NULL, NULL, NULL),
(5, '4', 'Postponed', 'Postponed', NULL, NULL, NULL),
(6, '5', 'Incomplete Conditions', 'Incomplete Conditions', NULL, NULL, NULL),
(7, '6', 'Wrong', 'Wrong', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(1, 'Auction`s Property', 'Auction`s Property', NULL, NULL),
(2, 'Residential', 'Residential', NULL, NULL),
(3, 'Commercial', 'Commercial', NULL, NULL),
(4, 'Land', 'Land', NULL, NULL),
(5, 'Specifications of the property', 'Specifications of the property', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Private,2=Forced',
  `sender_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` int(11) UNSIGNED DEFAULT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests_for_tour`
--

CREATE TABLE `requests_for_tour` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `timing` enum('morning','afternoon','evening') NOT NULL DEFAULT 'morning',
  `status` enum('pending','accept','reject') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests_for_tour`
--

INSERT INTO `requests_for_tour` (`id`, `property_id`, `user_id`, `name`, `phone_no`, `email`, `timing`, `status`, `created_at`, `updated_at`) VALUES
(1, '9', '214', 'Roshani', '6564646644', 'roshaniitegrityproindia@gmail.com', 'morning', 'accept', '2021-05-26 20:16:08', '2021-05-27 15:10:55'),
(2, '12', '239', 'Hamza', '0548855138', 'hamza@gmai.com', 'evening', 'pending', '2021-05-30 11:52:38', '2021-05-30 11:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `requests_to_apply`
--

CREATE TABLE `requests_to_apply` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `family_members` varchar(255) DEFAULT NULL,
  `status` enum('pending','accept','reject') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests_to_apply`
--

INSERT INTO `requests_to_apply` (`id`, `property_id`, `user_id`, `name`, `phone_no`, `email`, `nationality`, `family_members`, `status`, `created_at`, `updated_at`) VALUES
(1, '9', '214', 'Roshani', '6564649494', 'roshaniitegrityproindia@gmail.com', 'India', NULL, 'accept', '2021-05-26 20:16:29', '2021-05-26 20:18:15'),
(2, '9', '213', 'Ashok', '9340254997', 'sumit.itegrityproindia@gmail.com', 'Saudi Arabia', NULL, 'accept', '2021-05-26 20:17:37', '2021-05-26 20:18:22'),
(3, '8', '217', 'Jddjdj', '6568686', 'sumit@gmail.com', 'India', NULL, 'accept', '2021-05-26 21:02:48', '2021-05-26 21:03:02'),
(4, '10', '213', 'Agshs', '9340254566', 'sumit.itegrityproindia@gmail.com', 'Saudi Arabia', NULL, 'accept', '2021-05-26 21:30:47', '2021-05-26 21:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` enum('1','2','3','4') DEFAULT NULL COMMENT '1=private,2=forced,3=backends',
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `type`, `name`, `name_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '3', 'Admin', 'Admin', '2021-04-12 13:00:52', '2021-04-12 13:00:52', NULL),
(2, '1', 'Bidder', 'Bidder', NULL, NULL, NULL),
(3, '1', 'Auctioner', 'Auctioner', NULL, NULL, NULL),
(4, '1', 'Evaluator', 'Evaluator', NULL, NULL, NULL),
(7, '2', 'Banker', 'Banker', '2021-04-12 12:16:44', '2021-04-12 12:24:28', NULL),
(9, NULL, 'Owner', 'المالك', '2021-04-12 13:00:34', '2021-04-14 11:50:01', NULL),
(11, '3', 'Manager of Project', 'Manager of Project', '2021-04-12 13:01:23', '2021-04-12 13:01:23', NULL),
(12, NULL, 'Viewer', 'الناظر', '2021-04-12 13:01:50', '2021-04-14 11:50:35', NULL),
(13, '1', 'Manager', 'المدير المسؤول', '2021-04-13 13:35:55', '2021-04-14 11:49:40', NULL),
(14, '1', 'Aziz', 'Aziz', '2021-04-16 13:17:20', '2021-04-16 13:17:20', NULL),
(15, '1', 'DemoRole', 'Demorole', '2021-04-17 06:47:04', '2021-04-17 06:47:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `logo` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_ar` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `facebook_link` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest_link` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_footer` mediumtext COLLATE utf8mb4_unicode_ci,
  `vat_rate` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_broadcast_fee` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insurance_amount` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `judicial_agent_deal` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `evaluator_fee` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `market_share_deal` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `financial_recovery_marketer` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residents_deal` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auction_cancellation_fee` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_for_auction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_for_forced_auction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_for_sale_prop` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_for_rented_prop` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sett` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `auth_desc_app` text COLLATE utf8mb4_unicode_ci,
  `auth_desc_app_ar` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `role_id`, `logo`, `email`, `phone_number`, `address`, `address_ar`, `location`, `lat`, `lng`, `description`, `description_ar`, `facebook_link`, `twitter_link`, `instagram_link`, `pinterest_link`, `admin_footer`, `vat_rate`, `tax_rate`, `live_broadcast_fee`, `insurance_amount`, `judicial_agent_deal`, `evaluator_fee`, `market_share_deal`, `financial_recovery_marketer`, `residents_deal`, `auction_cancellation_fee`, `commission_for_auction`, `commission_for_forced_auction`, `commission_for_sale_prop`, `commission_for_rented_prop`, `notification_sett`, `auth_desc_app`, `auth_desc_app_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'fEVOC2tKpI_1619101750.png', 'mazad@gmail.com', '0556460990', 'Riyadh- Saudi Arabia', 'السعودية - الرياض', 'Rio de Janeiro, State of Rio de Janeiro, Brazil', '-22.9068467', '-43.1728965', 'Alsarh Almortafei for Commerce Est', 'مؤسسة الصرح المرتفع للتجارة', NULL, NULL, NULL, NULL, 'Copyright ©2021 Alsarh Almortafie Est', '5', '5', NULL, NULL, 'Auctioneer Deal', '100', '5%', NULL, NULL, '100', '1%', '2.5%', '1.5%', '10%', '1', '* I pledge and swear by God that I am the advertiser to pay the site’s commission, which is 1% of the sale value, whether the sale was made through the site or because of it.\r\n\r\n* I also pledge to pay the commission within 10 days of receiving the full amount of the sale.', '* اتعهد واقسم بالله أنا المعلن أن أدفع عمولة الموقع وهي 1% من قيمة البيع سواء تم البيع عن طريق الموقع أو بسببه.\r\n\r\n* كما أتعهد بدفع العمولة خلال 10 أيام من استلام كامل مبلغ المبايعة.\r\n\r\n\r\n\r\nملاحظة: عمولة الموقع هي على المعلن ولاتبرأ ذمة المعلن من العمولة إلا في حال دفعها.', NULL, '2021-05-31 06:36:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_media_chanels`
--

CREATE TABLE `social_media_chanels` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `description` text,
  `link` varchar(225) DEFAULT NULL,
  `user` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `responsible_person` varchar(225) DEFAULT NULL,
  `called_him` varchar(225) DEFAULT NULL,
  `mobile` varchar(225) DEFAULT NULL,
  `location` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `social_media_chanels`
--

INSERT INTO `social_media_chanels` (`id`, `title`, `description`, `link`, `user`, `password`, `responsible_person`, `called_him`, `mobile`, `location`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Title', 'Description', 'http://localhost:8000/backend/social_media_chanel/create', 'Ganesh', '123456789', 'Ankit', '16:12', '9575164549', 'Indore', '2021-04-03 06:42:50', '2021-04-03 06:42:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) UNSIGNED NOT NULL,
  `area_name` text,
  `area_name_ar` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `area_name`, `area_name_ar`, `created_at`, `updated_at`) VALUES
(1, 2, 'Hawalli', 'Hawalli', NULL, NULL),
(2, 2, 'Jahra', 'Jahra', NULL, NULL),
(3, 2, 'Al Asimah (Kuwait city)', 'Al Asimah (Kuwait city)', NULL, NULL),
(4, 2, 'Farwaniyah', 'Farwaniyah', NULL, NULL),
(5, 2, 'Mubarak Al-Kabeer', 'Mubarak Al-Kabeer', NULL, NULL),
(6, 6, 'Mecca', 'منطقة مكة المكرمة', NULL, NULL),
(7, 5, 'Indore', 'Indore', NULL, NULL),
(8, 6, 'Northern Boundaries', 'الحدود الشمالية', NULL, NULL),
(9, 6, 'Riyadh Zone', 'منطقة الرياض', NULL, NULL),
(10, 6, 'Tabuk', 'تبوك', NULL, NULL),
(11, 6, 'Eastern Zone', 'المنطقة الشرقية', NULL, '2021-05-22 06:57:54'),
(12, 6, 'Najran', 'منطقة نجران', NULL, NULL),
(13, 6, 'Jazan', 'منطقة جازان', NULL, NULL),
(14, 6, 'ASEER', 'منطقة عسير', NULL, NULL),
(15, 6, 'Alqaseem', 'القصيم', NULL, NULL),
(16, 6, 'Amadina', 'المدينة المنورة.', NULL, NULL),
(17, 6, 'Baha', 'الباحة', NULL, NULL),
(18, 6, 'Aljouf', 'منطقة الجوف', NULL, NULL),
(19, 6, 'Hael', 'منطقة حائل', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_us`
--

CREATE TABLE `subscribe_us` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(225) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `category_id`, `name`, `name_ar`, `created_at`, `updated_at`) VALUES
(1, 2, 'Sub Category 1', 'Sub Category 1', '2021-03-15 08:51:22', '2021-03-15 08:51:22'),
(2, 2, 'Sub Category 2', 'Sub Category 2', '2021-03-15 08:51:34', '2021-03-15 08:51:34'),
(3, 2, 'Sub Category 3', 'Sub Category 3', '2021-03-15 08:51:46', '2021-03-15 08:51:46'),
(4, 3, 'Sub Category 4', 'Sub Category 4', '2021-03-15 08:51:58', '2021-03-15 08:51:58'),
(5, 3, 'Sub Category 5', 'Sub Category 5', '2021-03-15 08:52:12', '2021-03-15 08:52:12'),
(6, 4, 'Sub Category 6', 'Sub Category 6', '2021-03-15 08:52:23', '2021-03-15 08:52:23'),
(7, 5, 'Sub Category 7', 'Sub Category 7', '2021-03-15 08:52:33', '2021-03-15 08:52:33'),
(8, 6, 'Sub Category 8', 'Sub Category 8', '2021-03-15 08:52:45', '2021-03-15 08:52:45'),
(9, 1, 'Sub Category 9', 'Sub Category 9', '2021-03-15 08:52:55', '2021-03-15 08:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `name_ar` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `name_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', NULL, NULL, NULL),
(2, '2', '2', NULL, NULL, NULL),
(3, '3', '3', NULL, NULL, NULL),
(4, '4', '4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=private,2=forced',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=admin,2=bidder,3=auctioner,4=evaluator',
  `representative_id` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_type` enum('facebook','google') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `individual_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=owner,2=company,3=agent',
  `first_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_verify_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '	1=male,2=female,3=other',
  `residence` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residence_permit` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_registry_number` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_registry` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date_of_registry` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registry_issue_city` int(11) DEFAULT NULL,
  `registry_city` int(11) DEFAULT NULL,
  `registry_issue_area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registry_copy` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_number` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_source` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_expire_date` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_image` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_personal_document` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourch_name_of_personal_document` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date_of_document` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_place_of_document` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_expire_date_of_document` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_copy` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality_of_certificate` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=saudi,2=non_saudi',
  `nationality_of_certificate_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_of_evaluator` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=outside_saudi,2=inside_saudi',
  `location_of_evaluator_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` enum('en','ar') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `notification` enum('on','off') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('web','android','ios') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `api_token` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_process_status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=register,1=otp_verify,2=email_proccess,3=registration_proccess_done',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `wallet_amount` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_no` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `role`, `representative_id`, `social_type`, `social_id`, `individual_type`, `first_name`, `second_name`, `third_name`, `surname_name`, `email`, `email_verified_at`, `phone_number`, `otp`, `otp_verify_at`, `password`, `profile_image`, `date_of_birth`, `gender`, `residence`, `residence_permit`, `company_name`, `company_registry_number`, `date_of_registry`, `expire_date_of_registry`, `registry_issue_city`, `registry_city`, `registry_issue_area`, `registry_copy`, `agency_number`, `agency_source`, `agency_expire_date`, `agency_image`, `nationality`, `type_of_personal_document`, `sourch_name_of_personal_document`, `issue_date_of_document`, `issue_place_of_document`, `issue_expire_date_of_document`, `document_copy`, `nationality_of_certificate`, `nationality_of_certificate_name`, `location_of_evaluator`, `location_of_evaluator_name`, `country_id`, `area_id`, `city_id`, `address`, `location`, `lat`, `lng`, `lang`, `notification`, `device_type`, `device_token`, `api_token`, `remember_token`, `registration_process_status`, `status`, `wallet_amount`, `identity_no`, `created_at`, `updated_at`) VALUES
(3, NULL, '1', NULL, NULL, NULL, NULL, 'Abdulaziz', 'Suboh', NULL, NULL, 'admin@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$Wq8h8cH.cJ3R7eZLwUyDJug0H6PXlbajJkgwjfVmLzd0cMT9ROTOe', 'DWRRwPDhl8_1618590251.jpg', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', NULL, 'web', NULL, NULL, NULL, '0', '1', NULL, NULL, NULL, '2021-04-16 23:24:11'),
(212, NULL, NULL, NULL, 'google', 'FD1HYCypuHSONdrkpQCBL1J5ypH3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'e8-8w-0kSE2Augtg-odJvY:APA91bH6rWSu_T37TYOqatrdmzusqNcFaXrSJr-OnxVTpOKOdjhuQd1BLjEN56sdzAraiJEcc6H_tcj8qDS3k7wHtGEFSH7NdZZeeaXcq3LEWCenrMju3_AqJr8MYsaIKYBDPMrETknl', '6938706183aa34f96fd8b89967a1e4f58f08980d15e740c58927d44c473f290e', NULL, '0', '1', NULL, NULL, '2021-05-26 17:38:14', '2021-06-12 12:33:04'),
(213, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Ashok', 'Kumar', 'Gehlot', 'Gehlot', 'sumit.itegrityproindia@gmail.com', NULL, '9340254599', '4777', '2021-05-26 10:39:35', '$2y$10$/8/VMFLw3.03xu/Afgxu6.K.b3YfrvSOm1eRqqo2VhS43Cz0m7Coi', 'uufikg4LFS_1622025694.png', '2003-05-15', NULL, '1', 'ncUJ93jloE_1622025694.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '9', '23', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'fsqnOkm8RDSWqXEE-G7-ry:APA91bFc6gWqOTFiN1qapx8lUXDnzTvkuHoeMfaU9kg5C-bOvAjQ6TeWXCmtUNscripGlFw_KZR03rRcPJh2AyIW02XCiaFAsXgvIORjFYcQTBMutwz4cm3Vo4o7Qmq3rgDoHT_PHrAq', 'eae9df5198606dad7ebc4b56580920926a1f9ec4db39b7dbd6327b2c0acb2e6d', NULL, '3', '1', NULL, NULL, '2021-05-26 17:39:30', '2021-05-27 14:41:07'),
(214, '1', '4', NULL, NULL, NULL, '3', 'Roshani', 'Nagpure', 'Roshni', 'Nagpure', 'roshaniitegrityproindia@gmail.com', NULL, '1234567890', '6766', '2021-05-26 10:40:39', '$2y$10$9Kx5FBcaiuze/I.ySyoSnemZvQIOo6oWLLTgLxGaqfExEEBZdfDKW', 'ttc1uliErG_1622025892.png', '2003-05-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'National Card', 'test', '2021-05-26', 'indore', NULL, 't1xA1YY203_1622025892.jpg', '1', NULL, '2', NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'd43jWzdeRMubnJEMW47E3K:APA91bFP_FDRMhfrMxVcXr-NswH1r4565hacGzx-v3BnNQ3wJf-a7iuwdp5GwDPvBKlk3NZZJlRxoQ7AVqi4OaW8wglLZpn9L3uHDDjTasKqPoCP9a_gsB8R0WAYA297gGj-rjlmYNBe', 'a692e005423043ea29711b42b5907112f021f7cc6637ca8d60c2b14284f29149', NULL, '3', '1', NULL, '55567755454', '2021-05-26 17:40:29', '2021-05-27 13:15:16'),
(215, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Sneh', 'Upadhyay', '.', '.', 'sneh.itegrityproindia@gmail.com', NULL, '7000198115', '2846', '2021-05-26 10:45:17', '$2y$10$ZVBYPbVdGrGdylUMwSA.9OyeHVnB3WpqFfrvQKVsbXEoc9fpeOnnW', '2qYjV0FIlh_1622026322.png', '1996-12-20', NULL, '1', 'auE1tDDO86_1622026322.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'f5rVbLJ5Qi6UMdc6N8p3GD:APA91bGZwz9AyA5VrLZ2ZJcbqOc62uIOgD9hcPAx6hT7SexdhkUGfC9IxqSUWRC0nM6VR_OntFOx8w-otV0MWU0LwOlOhmCLRyDTu9ukTt3axvpUJCKO_4wvwrOA2-3hFr3dMBop5_x4', '9391cb153f106024f5ba6a24030d92126c2efbfeac94e6aa2f37db0bedeebfbc', NULL, '3', '1', NULL, NULL, '2021-05-26 17:45:12', '2021-05-27 12:47:19'),
(216, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Archana', 'Salvi', 'Salvi', 'Archana', 'archana@gmail.com', NULL, '0123456789', '6767', '2021-05-26 11:09:59', '$2y$10$I0yMBaa5npqYQEwnfYU/ee.pr3r9NGeUmrJMdy/h2kPa9EPHPCVUq', 'tiEzks2tMr_1622027595.jpg', '1990-05-08', NULL, '1', 'Y59OZez1vL_1622027595.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'cU7fviakRq6xtAMVXfSMGk:APA91bGjzQxtU4CAcWCBbLw0jlOpDIQLehv79AuoaH0EaqntmbJ6s-TIt9WwRqVGuZ-G1SdRRp-B4BtfjOul0Gd2ietYua_LsMqD0aWCz3J0riJW40TrLEyb59yErfRRLhvbr1pYlnsX', 'bd5f1425f8aed992bac6f039ee4b210caf5b936e2a3e781aabc50ebcbb3cbd4b', NULL, '3', '1', NULL, NULL, '2021-05-26 18:09:56', '2021-05-27 19:09:32'),
(217, '1', '3', 'Auction agent', NULL, NULL, '3', 'Amit', 'Mushra', 'Amit', 'Mishra', 'amit.itegrityproindia@gmail.com', NULL, '2345678901', '3556', '2021-05-26 11:39:49', '$2y$10$cV8PWXvD/UsZ8kXu5VKYoOJWsu5qfwmvu9kkvvxV98i01P2xByhAG', '2Q8L2D29I8_1622029839.jpg', '1992-05-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8866855588', 'Test', '2021-05-26', 'WGZfh6IGl3_1622029839.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'druzDOZCRVGg0qVAXcc7Wt:APA91bGf_TUnddMy5qx5YfWc2Y3e0W0cKPii7BlUWqwUh6Nekret7AqKUoK5YW4AdWhpPTkgx5gu1ow4IuHVljCv5XSHcVZKrOt5n0RtWbsCQ-XDpsvAcfq9JEYBr8Ek_g98WB9AMynj', '19d77bdbbec062c86cc2855d5a98f35ed9dc06a5106251c88100d2674254fbb4', NULL, '3', '1', NULL, NULL, '2021-05-26 18:39:47', '2021-05-26 18:50:39'),
(218, '1', '2', NULL, NULL, NULL, '2', 'Sumit', 'Jonh', 'Cartor', 'Ojha', 'sumit.itegrityproindia@gmail.com', NULL, '987654321', '4722', '2021-05-26 12:34:42', NULL, NULL, '2003-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '9', '24', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'e0uGtFJDSsCTA7vWOSAl2g:APA91bF8UDrDAJ-egE2wfvlLT-_ly5pbGphi49eWhYVu4Sdhwgm5PqvVrwG95sziNBTwYFhJD7vTTtAyphYMvQCuLgnYHQnFwLmO1jzV0e6YYwkdSTaBXQcM_26aZQMTqEO-DBUUorLD', '73e73340194736fc87a199a0e58538d8d5d1ae7d71265cca93f201c26f0adf3e', NULL, '2', '1', NULL, NULL, '2021-05-26 19:34:29', '2021-05-26 19:35:15'),
(219, '1', '2', NULL, NULL, NULL, '2', 'Sumit', 'Ojha', 'Ojha', 'Sumit', 'sumit@gmail.com', NULL, '3456789012', '7943', NULL, NULL, NULL, '1996-05-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'frU0WxUxQ06F_1XpF7Ac1a:APA91bED8VCwwnPke-2wuujDWG6zyKEvOc5n_Z67Q7fODgjPIStNXYzI9Ul2MQz4vNIjEKYMFbFGWP5Mo6aHPSneHN_MbOlAzKwk8YAGddPDRNBdsYad9A9OxWHcPSvLfKyHQl6TqRls', '3644f60f2f9194cc0649d1ad82f7177e25d721cdffd0b227242229dca53cccfe', NULL, '2', '1', NULL, NULL, '2021-05-26 19:37:49', '2021-05-26 19:43:58'),
(220, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Ashok', 'Gehlot', 'Gehlot', 'Ashok', 'sumit.itegrityproindia@gmail.com', NULL, '123654987', '2817', '2021-05-26 12:41:08', '$2y$10$z/0rIWJef4/Jzok4XVjW6O/QN5GFLcnPDHK3oq5CYmb1lWC3weIMC', 'V9jxkL3jS1_1622032965.png', '2003-05-02', NULL, '1', 'eKG7MMhaYG_1622032965.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '9', '23', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'e0uGtFJDSsCTA7vWOSAl2g:APA91bF8UDrDAJ-egE2wfvlLT-_ly5pbGphi49eWhYVu4Sdhwgm5PqvVrwG95sziNBTwYFhJD7vTTtAyphYMvQCuLgnYHQnFwLmO1jzV0e6YYwkdSTaBXQcM_26aZQMTqEO-DBUUorLD', '4e7e16b3f343cfda4a2c6fe01a4d45e31c9331801eb6a3eed9d5c91ed5bb50d2', NULL, '3', '1', NULL, NULL, '2021-05-26 19:41:03', '2021-05-26 19:42:45'),
(221, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Ashok', 'Gehlot', 'Ashok', 'Gehlot', 'sumit.itegrityproindia2@gmail.com', NULL, '012345678', '9581', '2021-05-26 12:43:47', '$2y$10$wry79UW2Vv907V5c4f7L4emkknxlQbfpMS9myvQUw3k8Wd1/uyO7S', 'p8q4pihp9z_1622033098.png', '2003-05-01', NULL, '1', 'pJuQ21ILAg_1622033098.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', '123456', '427e16971357f457c9932f1654115b5f0720835a406821b98dc5406672f9b053', NULL, '3', '1', NULL, NULL, '2021-05-26 19:43:44', '2021-05-27 14:40:42'),
(222, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Ubyvy', 'Cycyyf', 'Uvycgc', 'Uvycyctc', 'sumit@56gmail.com', NULL, '085856588', '0988', '2021-05-26 12:46:55', '$2y$10$3Fl0cJjwUCUSF50m.1HGzeD9YPdSqV0MeaHqqDFyG6DwtW0GUMFjS', 'i0ESh0FASo_1622033271.jpeg', '2003-05-26', NULL, '1', 'VZBsEC4eqw_1622033271.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'cOQNEaXNTMCmu_zS7fyffC:APA91bGSq8WGZIBN8bYuUac1dgG1f-mhZJiWqZhH6Fnbg_u7E--NzZJno4xy578VUB2UahoSEh5hwejVIYV4RWAKdbg68qya74cBw3tceC8LFh1WufelHzjCAoWTWCP9fmerTn-uL8or', 'db2e73d32785883bed450a95098d937eda03d4c1f4d639fe6a617dc9723bbb86', NULL, '3', '1', NULL, NULL, '2021-05-26 19:46:51', '2021-05-26 19:47:51'),
(223, '1', '2', NULL, NULL, NULL, '2', 'Demo', 'Test', 'Shhshsh', 'Nagpure', 'roshanii@gmail.com', NULL, '7979897979', '4163', NULL, NULL, NULL, '2003-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'cOQNEaXNTMCmu_zS7fyffC:APA91bGSq8WGZIBN8bYuUac1dgG1f-mhZJiWqZhH6Fnbg_u7E--NzZJno4xy578VUB2UahoSEh5hwejVIYV4RWAKdbg68qya74cBw3tceC8LFh1WufelHzjCAoWTWCP9fmerTn-uL8or', 'b760dea18d28e90dbad19f03fc5681201b13af9f4048c7505980cae504a6ab36', NULL, '2', '1', NULL, NULL, '2021-05-27 12:23:19', '2021-05-27 12:26:55'),
(224, '1', '2', 'Bidder Company', NULL, NULL, '2', 'Yyvyv', 'Vggvg', 'Yvyv', 'Ygtvtv', 'sumit@gmail.com', NULL, '6928355858', '4799', '2021-05-27 05:32:50', 'ccff', '8xgdDlKjgq_1622093639.jpg', '2003-05-27', NULL, '1', 'GPH66cDGbB_1622093639.jpg', NULL, 'test', '2021-05-27', '2021-07-31', NULL, NULL, '7', 'ihUvvi9iAL_1622093639.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'fWZgX66tR26FklBhOieOML:APA91bGcrklZ8ngeYHiJ0uqty_roxfNOb3_vuiTAfTZTTKokhnEb7LHiReHH0OjPinop38hbKNOCghL-EjqMIadx37sSdpki42n9BP7Cy4GXDHAnJH_QyBol_By7UkYOKyC0D36UvJZa', '255a914c1ff31535fbca16641320ebbd7a667b30527e700f8510d61ed3c14c1c', NULL, '3', '1', NULL, NULL, '2021-05-27 12:32:47', '2021-05-27 12:33:59'),
(225, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Yyvyv', 'F ttxtx', 'Hcyc', 'Vggvg', 'sumit@gmail.com', NULL, '6835585585', '6069', '2021-05-27 05:34:27', '$2y$10$YN8W.9Ngu4hhj5zt0rij6eBt9Osn6Cyj7mzeAjtP8.sD2vtehsG7S', '9iMuCiSnUw_1622093696.jpg', '2003-05-07', NULL, '1', 'zBrysI2WRD_1622093696.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'fWZgX66tR26FklBhOieOML:APA91bGcrklZ8ngeYHiJ0uqty_roxfNOb3_vuiTAfTZTTKokhnEb7LHiReHH0OjPinop38hbKNOCghL-EjqMIadx37sSdpki42n9BP7Cy4GXDHAnJH_QyBol_By7UkYOKyC0D36UvJZa', '22ac5ceb12c933ca140e43f2d94e3fd3e1647f7c07b229a0cd210956d6372061', NULL, '3', '1', NULL, NULL, '2021-05-27 12:34:25', '2021-05-27 12:34:56'),
(226, '1', '3', 'Auction agent', NULL, NULL, '3', 'Yyvyv', 'Gxxfxg6', 'Test', 'F ttxtx', 'sumit@gmail.com', NULL, '3505033053', '2145', '2021-05-27 05:35:19', '$2y$10$dGhalVz8Rt7sD1jX8LL1HuPrZwwWiF90Ap6gdiPZ4qOplFWr8zWkS', 'kq9XTgXCTz_1622093757.jpeg', '2003-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '68585868', 'Ycyf', '2021-05-27', 'EI78HKpWnh_1622093757.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'fWZgX66tR26FklBhOieOML:APA91bGcrklZ8ngeYHiJ0uqty_roxfNOb3_vuiTAfTZTTKokhnEb7LHiReHH0OjPinop38hbKNOCghL-EjqMIadx37sSdpki42n9BP7Cy4GXDHAnJH_QyBol_By7UkYOKyC0D36UvJZa', 'c838af515ba3b95465800e2c07e05d4bf54a38608fe2b072961aaec8321eda70', NULL, '3', '1', NULL, NULL, '2021-05-27 12:35:17', '2021-05-27 12:35:57'),
(227, '1', '3', NULL, NULL, NULL, '2', 'Yyvyv', 'Yvycyc', 'Hvhvyf', 'Gxxfxg6', 'sumit@gmail.com', NULL, '583836868', '6594', '2021-05-27 05:36:20', NULL, NULL, '2003-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'fWZgX66tR26FklBhOieOML:APA91bGcrklZ8ngeYHiJ0uqty_roxfNOb3_vuiTAfTZTTKokhnEb7LHiReHH0OjPinop38hbKNOCghL-EjqMIadx37sSdpki42n9BP7Cy4GXDHAnJH_QyBol_By7UkYOKyC0D36UvJZa', 'c62ff1b73bcad4d92550e9e02554f21145141c7052c0b9af26f22a4259d079e8', NULL, '2', '1', NULL, NULL, '2021-05-27 12:36:18', '2021-05-27 12:36:28'),
(228, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'HamzH', 'Fahd', 'Fahd', 'Sareehy', 'hanzah@ssv.com.sa', NULL, '584456138', '2883', '2021-05-27 05:37:41', '$2y$10$K/PoRE7/s9xJTmNjdZMjnukDDCf1QFGn8LRLDaPiLcNseJaLFwtni', 'HsYP7vaLK9_1622093993.jpg', '1995-05-27', NULL, '1', 'zSKQD8Edqu_1622093993.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '17', '33', NULL, NULL, NULL, NULL, 'en', NULL, 'android', NULL, '3918270b1840514e85dbe34b35ac396ab94099bcaa0f3b0650fd9c0f038f9f92', NULL, '3', '1', NULL, NULL, '2021-05-27 12:37:37', '2021-05-27 12:39:53'),
(229, '1', '3', 'Auction Company', NULL, NULL, '2', 'Uhyfyf', 'Tcycy', 'Hvyvyc', 'Hvyctcrc', 'sumit@gmail.com', NULL, '8558236006', '0751', '2021-05-27 05:40:03', 'fyi if  fy', 'CGbW1yMFwb_1622094070.jpg', '2003-04-02', NULL, '1', 'e2AUGI6FKa_1622094070.jpg', NULL, '6ct6tcyfcy', '2021-05-27', '2021-06-30', 7, NULL, NULL, '8POvTJVnjP_1622094070.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'cn0qaLnJTYajX0IPMuxiTV:APA91bFJaAgw0Z1fMG1Oq0GG1Gtube-2Jk17J4HC_2wReL24myUo6BL_7_LQb5MM6CCE7l7GGJrYSlQ_uwkLUOOhIhfu6lXUn9moht7WXOk112DAdkeTTpEK0xnaSmwQlBrtCLE7wg9-', 'dba0d8f21a7fac035561dfbf98e51b0ed73e3984de5e5c552c990a27fa80e71a', NULL, '3', '1', NULL, NULL, '2021-05-27 12:40:00', '2021-05-27 12:41:10'),
(230, '1', '3', NULL, NULL, NULL, '1', 'Uhyfyf', 'Yfcg6ccgy', 'Hvtccr', 'Tcycy', 'sumit@gmail.com', NULL, '8068205220', '6221', NULL, NULL, NULL, '2003-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'cn0qaLnJTYajX0IPMuxiTV:APA91bFJaAgw0Z1fMG1Oq0GG1Gtube-2Jk17J4HC_2wReL24myUo6BL_7_LQb5MM6CCE7l7GGJrYSlQ_uwkLUOOhIhfu6lXUn9moht7WXOk112DAdkeTTpEK0xnaSmwQlBrtCLE7wg9-', 'ee7d18803613cc69f93422b23506480cac5a49ad0e77b5a9b0cf364bc1d5bd77', NULL, '2', '1', NULL, NULL, '2021-05-27 12:41:30', '2021-05-27 12:44:07'),
(231, '1', '3', 'Auction Owner', NULL, NULL, '1', 'Hbygygy', 'Ububyv', 'Buygyv', 'Hvyvvvy', 'sumit@gmail.com', NULL, '8038083808', '0844', '2021-05-27 05:47:23', '$2y$10$Ad7AZ4ZRrm2vzoLnfDJSKuvwezQYus4F8pUUJtOjObuUsCDFZP21S', 'R5uQrUEl2x_1622094481.jpg', '2003-05-27', NULL, '1', 'HEnKCDlOji_1622094481.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'exC1J-cdRJSGFjf2zLhv4P:APA91bFPjOBQODknzZ-waCCVQ6gJ4CSVHPbj2S4HU-NhOymGrSIwXMGJwAyDw3CND8OP0w1GMDjW-LSv73tPbYQziZnYu0ygy1GCEIAHGfLuNRiHQYvGmx9PxUPZlNjMwJhaJwkAy_vJ', '2b7b03213649142c1cc9115bb1e8cc21bf1197674b8e914d1aac68c2b67df91f', NULL, '3', '1', NULL, NULL, '2021-05-27 12:47:13', '2021-05-27 12:48:01'),
(232, '1', '4', NULL, NULL, NULL, '3', 'Hbygygy', 'Tcctgc', 'Hbyvtv', 'Ububyv', 'sumit@gmail.com', NULL, '685858858', '8642', '2021-05-27 05:48:21', '$2y$10$C07WgH0LFarrIR5VS8n6f.ggDbtR/zCZQeD5EObsiWpkUrP.JXGBa', 'uTV6ZRNqnu_1622094558.jpg', '2003-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'National Card', 'hvtctc', '2021-05-27', 'h vgvg', NULL, 'pTgZzFQCGn_1622094558.jpg', '1', NULL, '2', NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'exC1J-cdRJSGFjf2zLhv4P:APA91bFPjOBQODknzZ-waCCVQ6gJ4CSVHPbj2S4HU-NhOymGrSIwXMGJwAyDw3CND8OP0w1GMDjW-LSv73tPbYQziZnYu0ygy1GCEIAHGfLuNRiHQYvGmx9PxUPZlNjMwJhaJwkAy_vJ', '6a2a5602b19f899f32c00f11484290217106e233ca769a195dd13f86704fc36e', NULL, '3', '1', NULL, 'yctctc', '2021-05-27 12:48:19', '2021-05-27 12:49:18'),
(233, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Hbygygy', 'Yvyffyyf', 'Uvyvcy', 'Tcctgc', 'sumit@gmail.com', NULL, '8083250250', '3891', '2021-05-27 05:56:44', '$2y$10$rrWnP6pgn9aCSHyL870Igu9SfixERPgSCSzb0KbluXg0kfAWC3Nka', 'QQfOS6uWOw_1622095035.jpg', '2003-05-27', NULL, '1', 'doB4sFoGY6_1622095035.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'exC1J-cdRJSGFjf2zLhv4P:APA91bFPjOBQODknzZ-waCCVQ6gJ4CSVHPbj2S4HU-NhOymGrSIwXMGJwAyDw3CND8OP0w1GMDjW-LSv73tPbYQziZnYu0ygy1GCEIAHGfLuNRiHQYvGmx9PxUPZlNjMwJhaJwkAy_vJ', 'af0be3fa02a01b6f0124e312caad8bac3710a87dbc0d1f3cc915b9272f2e5e36', NULL, '3', '1', NULL, NULL, '2021-05-27 12:56:42', '2021-05-27 12:57:15'),
(234, '1', '2', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '6828227272', '8998', NULL, NULL, NULL, '2003-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'exC1J-cdRJSGFjf2zLhv4P:APA91bFPjOBQODknzZ-waCCVQ6gJ4CSVHPbj2S4HU-NhOymGrSIwXMGJwAyDw3CND8OP0w1GMDjW-LSv73tPbYQziZnYu0ygy1GCEIAHGfLuNRiHQYvGmx9PxUPZlNjMwJhaJwkAy_vJ', '03079d596b0a65da8848eea158dba958a7409b96348da2e3d2b29bd7ea5a0cc0', NULL, '1', '1', NULL, NULL, '2021-05-27 12:57:36', '2021-05-27 12:58:48'),
(235, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Sbbsbsbs', 'Zhzhhz', 'Zhzhzh', 'Shzhhzhz', 'sumit@gmail.com', NULL, '9897976768', '4846', '2021-05-27 06:03:15', '$2y$10$0QKsAfjjwwTFg7hZEs5cv.JCYyCYwrXGFxFGqMYoTlezXltLre/fK', 'f4huRawiQk_1622095455.png', '2003-05-27', NULL, '1', 'dpUlH74Kw7_1622095455.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'ePsUdn4BQPCDuo8Xslw3pA:APA91bFn6_RJc_QG8jfCrrWrdHdBEuL0Uli8JQaSTV-J9bStB1LNzxFS32K-xlqxnATA7IJDt-8CU7gBfXImBYKcagB0zu2_U9VKA5hsLJPq62fyNx8EzQLWKmBJSq8lxZ56Xmhi61q4', '293d4f9f5d32119204d5f7c32aa6f792ef2daae9058d1612e0ac37f99684cde8', NULL, '3', '1', NULL, NULL, '2021-05-27 13:02:55', '2021-05-27 13:04:15'),
(236, '1', '2', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '9797979767', '1976', '2021-05-27 06:04:43', NULL, NULL, '2003-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'ePsUdn4BQPCDuo8Xslw3pA:APA91bFn6_RJc_QG8jfCrrWrdHdBEuL0Uli8JQaSTV-J9bStB1LNzxFS32K-xlqxnATA7IJDt-8CU7gBfXImBYKcagB0zu2_U9VKA5hsLJPq62fyNx8EzQLWKmBJSq8lxZ56Xmhi61q4', '9141913c038ea0346598f1247964b202a599ec2ee283fe6117c64a4c19493e28', NULL, '1', '1', NULL, NULL, '2021-05-27 13:04:41', '2021-05-27 13:04:43'),
(237, '1', '2', NULL, NULL, NULL, '1', 'Sbbsbsbs', 'Ggvvv', 'Vvvbb', 'Zhzhhz', 'sumit@gmail.com', NULL, '96855005', '0281', NULL, NULL, NULL, '2003-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '7', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'ePsUdn4BQPCDuo8Xslw3pA:APA91bFn6_RJc_QG8jfCrrWrdHdBEuL0Uli8JQaSTV-J9bStB1LNzxFS32K-xlqxnATA7IJDt-8CU7gBfXImBYKcagB0zu2_U9VKA5hsLJPq62fyNx8EzQLWKmBJSq8lxZ56Xmhi61q4', '9eefabbb29133bc792a0366060a3873cf81e51b8993a5b06a79d9bf2160d9bf4', NULL, '2', '1', NULL, NULL, '2021-05-27 13:06:47', '2021-05-27 13:13:36'),
(238, '1', '2', 'Bidder Owner', NULL, NULL, '1', 'Hamza', 'Fahd', 'Ahmed', 'Samy', 'Nuy@ssv.com', NULL, '548856138', '5813', NULL, '$2y$10$ah4Pam7OSxT3hgEBNs4HneVhucNp2Fvr9SyfJT5zucAj.CXN5O3ca', 'tAbf4BdH5J_1622095878.png', '2003-05-01', NULL, '1', '1gYVMeDeRE_1622095878.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '9', '23', NULL, NULL, NULL, NULL, 'en', NULL, 'android', NULL, '3a8d8d31fc23319e613a7b50632204ea27f6dd1e88ec98097b2551ca2efabc36', NULL, '3', '1', NULL, NULL, '2021-05-27 13:08:36', '2021-05-30 13:56:57'),
(239, '1', '4', NULL, NULL, NULL, '3', 'Hamza', 'Dff', 'Dff', 'Fahd', 'Nuy@ssv.com', NULL, '548856132', '9669', '2021-05-27 06:44:21', '$2y$10$sedfMuuIFrk1jP8ughCbNeQ4CfzHjOZawO0PvT.IHd2aagA7wU.Vy', 'ZQoVwLM2ow_1622099792.jpg', '1983-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Iqama Card', 'jordan', '2021-04-14', 'jordan', NULL, 'NBtMZZkiGh_1622099792.png', '1', NULL, '2', NULL, '6', '15', '7', NULL, NULL, NULL, NULL, 'en', NULL, 'android', 'ctwmYdK2Q0im76eHFPWBJ-:APA91bHY67yXfsAa7ESg10T1IRYRWxPvXqc9LZYNegYnceM-38TDxHfZbiTMLHMQaH_iNjyRQBsgJWDJu9Tu73vBMrySpD_47TRvsK95IxtDBj4Up2FVRRA3nK2jISPYgEtc9AWxS24f', 'e35c5195ff623548b8a7d690bc3cfa41e9d9d9ccc84280f33eeabcfcc0cc1fa4', NULL, '3', '1', NULL, '456777888', '2021-05-27 13:44:18', '2021-06-14 15:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_trainings`
--

CREATE TABLE `user_trainings` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `title` text,
  `title_ar` text,
  `content` longtext,
  `content_ar` longtext,
  `media` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_trainings`
--

INSERT INTO `user_trainings` (`id`, `title`, `title_ar`, `content`, `content_ar`, `media`, `created_at`, `updated_at`, `deleted_at`) VALUES
(00000000001, 'Registration Process', 'كيفية التسجيل', '<p>asfsa</p>', '<p>fassaf</p>', 'ELIOTiBJB2_1617622571.mp4', '2021-04-05 11:36:11', '2021-04-05 11:36:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_tranctions`
--

CREATE TABLE `wallet_tranctions` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `tranction_type` enum('1','2','3') NOT NULL DEFAULT '1',
  `tranction_id` varchar(225) DEFAULT NULL,
  `type` enum('credit','debit') DEFAULT NULL,
  `current_amount` varchar(225) DEFAULT NULL,
  `credit_debit_amount` varchar(225) DEFAULT NULL,
  `remaining_amount` varchar(225) DEFAULT NULL,
  `title` text,
  `message` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement_category`
--
ALTER TABLE `advertisement_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement_plan_times`
--
ALTER TABLE `advertisement_plan_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement_points`
--
ALTER TABLE `advertisement_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisers`
--
ALTER TABLE `advertisers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_task`
--
ALTER TABLE `agent_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apis`
--
ALTER TABLE `apis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_content`
--
ALTER TABLE `cms_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_agents`
--
ALTER TABLE `contact_agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_replay`
--
ALTER TABLE `contact_us_replay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_category`
--
ALTER TABLE `faq_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `last_category`
--
ALTER TABLE `last_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leval_1`
--
ALTER TABLE `leval_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_2`
--
ALTER TABLE `level_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_3`
--
ALTER TABLE `level_3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_4`
--
ALTER TABLE `level_4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_5`
--
ALTER TABLE `level_5`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_template`
--
ALTER TABLE `notification_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_administration`
--
ALTER TABLE `permission_administration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_bids`
--
ALTER TABLE `property_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_buyers`
--
ALTER TABLE `property_buyers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_follows`
--
ALTER TABLE `property_follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_likes`
--
ALTER TABLE `property_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_make_an_offers`
--
ALTER TABLE `property_make_an_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_make_offers`
--
ALTER TABLE `property_make_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_payments`
--
ALTER TABLE `property_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_refund_requests`
--
ALTER TABLE `property_refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_saved_search`
--
ALTER TABLE `property_saved_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_status`
--
ALTER TABLE `property_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests_for_tour`
--
ALTER TABLE `requests_for_tour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests_to_apply`
--
ALTER TABLE `requests_to_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media_chanels`
--
ALTER TABLE `social_media_chanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe_us`
--
ALTER TABLE `subscribe_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_trainings`
--
ALTER TABLE `user_trainings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_tranctions`
--
ALTER TABLE `wallet_tranctions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `advertisement_category`
--
ALTER TABLE `advertisement_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `advertisement_plan_times`
--
ALTER TABLE `advertisement_plan_times`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `advertisement_points`
--
ALTER TABLE `advertisement_points`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisers`
--
ALTER TABLE `advertisers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `agent_task`
--
ALTER TABLE `agent_task`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `apis`
--
ALTER TABLE `apis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_content`
--
ALTER TABLE `cms_content`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `contact_agents`
--
ALTER TABLE `contact_agents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contact_us_replay`
--
ALTER TABLE `contact_us_replay`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `last_category`
--
ALTER TABLE `last_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leval_1`
--
ALTER TABLE `leval_1`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `level_2`
--
ALTER TABLE `level_2`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `level_3`
--
ALTER TABLE `level_3`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `level_4`
--
ALTER TABLE `level_4`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `level_5`
--
ALTER TABLE `level_5`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `notification_template`
--
ALTER TABLE `notification_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `permission_administration`
--
ALTER TABLE `permission_administration`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `property_bids`
--
ALTER TABLE `property_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `property_buyers`
--
ALTER TABLE `property_buyers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_follows`
--
ALTER TABLE `property_follows`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `property_likes`
--
ALTER TABLE `property_likes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_make_an_offers`
--
ALTER TABLE `property_make_an_offers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_make_offers`
--
ALTER TABLE `property_make_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_payments`
--
ALTER TABLE `property_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property_refund_requests`
--
ALTER TABLE `property_refund_requests`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_saved_search`
--
ALTER TABLE `property_saved_search`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_status`
--
ALTER TABLE `property_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests_for_tour`
--
ALTER TABLE `requests_for_tour`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `requests_to_apply`
--
ALTER TABLE `requests_to_apply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_media_chanels`
--
ALTER TABLE `social_media_chanels`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `subscribe_us`
--
ALTER TABLE `subscribe_us`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `user_trainings`
--
ALTER TABLE `user_trainings`
  MODIFY `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallet_tranctions`
--
ALTER TABLE `wallet_tranctions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
