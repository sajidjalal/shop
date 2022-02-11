-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table shop.accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `transaction_type` enum('1','2') NOT NULL COMMENT '1: deposite,2:withdrawl',
  `old_balance` decimal(20,2) DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL,
  `deposite` decimal(20,2) DEFAULT NULL,
  `withdraw` decimal(20,2) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_by_ip_address` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shop.accounts: ~13 rows (approximately)
DELETE FROM `accounts`;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `user_id`, `transaction_type`, `old_balance`, `balance`, `deposite`, `withdraw`, `created_by`, `created_by_ip_address`, `created_at`, `updated_at`) VALUES
	(1, 4, '1', 0.00, 10000.00, 10000.00, 0.00, 2, '', '2022-01-18 00:52:57', '2022-01-18 01:09:44'),
	(2, 4, '2', 10000.00, 5000.00, 0.00, 5000.00, 2, '', '2022-01-18 00:52:57', '2022-01-19 01:12:49'),
	(3, 4, '1', 10000.00, 7000.00, 2000.00, 0.00, 2, '', '2022-01-18 00:52:57', '2022-01-19 09:44:26'),
	(4, 4, '1', NULL, 7012.00, 12.00, 0.00, 4, '127.0.0.1', '2022-01-19 09:56:57', '2022-01-19 09:56:57'),
	(5, 4, '1', NULL, 7035.00, 23.00, 0.00, 4, '127.0.0.1', '2022-01-19 09:57:09', '2022-01-19 09:57:09'),
	(6, 4, '2', NULL, 7034.00, 0.00, 1.00, 4, '127.0.0.1', '2022-01-19 10:02:25', '2022-01-19 10:02:46'),
	(7, 4, '2', NULL, 7032.00, 0.00, 2.00, 4, '127.0.0.1', '2022-01-19 10:03:54', '2022-01-19 10:03:54'),
	(8, 4, '2', NULL, 7030.00, 0.00, 2.00, 4, '127.0.0.1', '2022-01-19 10:16:26', '2022-01-19 10:16:26'),
	(9, 4, '2', NULL, 0.00, 0.00, 7030.00, 4, '127.0.0.1', '2022-01-19 10:17:58', '2022-01-19 10:17:58'),
	(10, 4, '1', NULL, 12.00, 12.00, 7030.00, 4, '127.0.0.1', '2022-01-19 10:18:21', '2022-01-19 10:18:21'),
	(11, 4, '2', NULL, 7.00, 0.00, 5.00, 4, '127.0.0.1', '2022-01-19 10:18:33', '2022-01-19 10:18:33'),
	(12, 4, '2', NULL, 2.00, 0.00, 5.00, 4, '127.0.0.1', '2022-01-19 10:18:46', '2022-01-19 10:18:46'),
	(13, 4, '2', NULL, 0.00, 0.00, 2.00, 4, '127.0.0.1', '2022-01-19 10:19:00', '2022-01-19 10:19:00');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Dumping structure for table shop.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) NOT NULL DEFAULT 0,
  `seal_name` varchar(250) NOT NULL DEFAULT '',
  `doi` date NOT NULL,
  `type` varchar(250) NOT NULL DEFAULT '',
  `use` varchar(250) NOT NULL DEFAULT '',
  `client` varchar(250) NOT NULL DEFAULT '',
  `isactive` int(2) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL DEFAULT 1,
  `created_by_ip_address` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shop.items: ~1 rows (approximately)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `number`, `seal_name`, `doi`, `type`, `use`, `client`, `isactive`, `created_by`, `created_by_ip_address`, `created_at`, `updated_at`) VALUES
	(1, 123456789112, 'ablc', '2022-02-12', 'type', 'use', 'client', 1, 1, '', '2022-02-12 00:51:18', '2022-02-12 00:53:07'),
	(2, 123456789113, 'ablc', '2022-02-12', 'type', 'use', 'client', 1, 2, '127.0.0.1', '2022-02-12 02:18:17', '2022-02-12 02:30:15');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table shop.role_type
DROP TABLE IF EXISTS `role_type`;
CREATE TABLE IF NOT EXISTS `role_type` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `isactive` int(2) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shop.role_type: ~4 rows (approximately)
DELETE FROM `role_type`;
/*!40000 ALTER TABLE `role_type` DISABLE KEYS */;
INSERT INTO `role_type` (`role_id`, `role_name`, `isactive`, `created_at`, `updated_at`) VALUES
	(1, 'super admin', 1, '2021-08-08 10:56:24', '2021-08-08 10:56:24'),
	(2, 'admin', 1, '2021-08-08 10:56:32', '2021-08-08 10:56:32'),
	(3, 'employer', 1, '2022-01-17 23:54:27', '2022-01-18 00:05:26'),
	(4, 'customer', 1, '2022-01-17 23:54:52', '2022-01-17 23:54:52');
/*!40000 ALTER TABLE `role_type` ENABLE KEYS */;

-- Dumping structure for table shop.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `emp_code` varchar(50) NOT NULL DEFAULT '',
  `account_type` enum('savings','current') DEFAULT NULL,
  `session_id` text NOT NULL,
  `mobile_number` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `profile_pic` varchar(50) NOT NULL DEFAULT '',
  `isactive` int(2) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL DEFAULT 1,
  `created_by_ip_address` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table shop.users: ~4 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `role_id`, `emp_code`, `account_type`, `session_id`, `mobile_number`, `password`, `first_name`, `email`, `profile_pic`, `isactive`, `created_by`, `created_by_ip_address`, `created_at`, `updated_at`) VALUES
	(1, 1, 'SE001', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiIyMTQ3NDgzNjQ3IiwiZmlyc3RfbmFtZSI6InN1cGVyIGFkbWluIiwiZW1haWwiOiJzdXBlckBhZG1pbi5jb20iLCJpYXQiOjE2Mjg0MDAwODcsImV4cCI6MTYyODQxODA4N30.J7rELiK-Uqsr_m_fQu9mB-WrUzvkVBt4V-RhxOy4314', '2147483647', 'super@admin.com', 'super admin', 'super@admin.com', '/public/layouts/assets/images/users/avatar-3.jpg', 1, 1, '', '2021-04-10 19:31:03', '2021-08-23 19:12:42'),
	(2, 2, 'E001', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQ0NjA0MjgzLCJleHAiOjE2NDQ2MjIyODN9.r0hoHx0o0GOLwv0WN3PU9n8i3wm1W5TiUuu_F5uh51k', '9325587960', 'admin@bank.com', 'Admin', 'admin@bank.com', 'https://i.stack.imgur.com/YQu5k.png', 1, 1, '', '2021-04-10 17:44:30', '2022-02-12 00:01:23'),
	(3, 3, '', NULL, '', '', '', '', '', '', 1, 1, '', '2022-01-18 00:34:49', '2022-01-18 08:30:25'),
	(4, 4, 'CUS001', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGJhbmsuY29tIiwiaWF0IjoxNjQyNTg0NTMyLCJleHAiOjE2NDI2MDI1MzJ9.17jyEIUmuD5JAJUxctPWUn5yVjciOehbgEzB0b64JEw', '9320001801', 'customer@bank.com', 'customer', 'customer@bank.com', '', 1, 1, '', '2022-01-18 00:35:09', '2022-01-19 10:28:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table shop.user_sessions
DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE IF NOT EXISTS `user_sessions` (
  `us_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `device_browser` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `is_disconnected` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y:Yes, N:No',
  `token` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`us_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

-- Dumping data for table shop.user_sessions: ~80 rows (approximately)
DELETE FROM `user_sessions`;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` (`us_id`, `user_id`, `ip`, `device_browser`, `type`, `is_disconnected`, `token`, `created_at`) VALUES
	(1, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsImVtYWlsIjoic2FqaWRqYWxhbDgwMTNAeWFob28uY29tIn0.-b9RNXUXq8VtewJDizZyYOOqaHEOhSCnl1sV4PC4PBE', '2021-07-26 05:01:03'),
	(2, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20ifQ.ucW_mL8U1E8HcnUZrVsH4I3d9M3oMzlpi-LcapHxQCA', '2021-07-26 05:54:34'),
	(3, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20ifQ.ucW_mL8U1E8HcnUZrVsH4I3d9M3oMzlpi-LcapHxQCA', '2021-07-26 16:48:22'),
	(4, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjcyNzQ1MDYsImV4cCI6MTYyNzI3NDUxNn0.P41D1pDBxt333RFEoRN-sMBko', '2021-07-26 17:11:46'),
	(5, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjcyNzQ1MDcsImV4cCI6MTYyNzI3NDUxN30.yWu32IdDicgV2RCyIartPXOGZ', '2021-07-26 17:11:47'),
	(6, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjczMTcxODcsImV4cCI6MTYyNzMxNzE5N30.VfDTvmWNGkFgBuAytEdL9P8QI', '2021-07-27 05:03:08'),
	(7, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjczMTc1OTIsImV4cCI6MTYyNzMzNTU5Mn0.N6P5DLQqgq4biyH1g5S_Z68WV', '2021-07-27 05:09:52'),
	(8, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjczNTg4NTAsImV4cCI6MTYyNzM3Njg1MH0.L4Y0j2UhvSvJg40AKA_w6Tm4i', '2021-07-27 16:37:30'),
	(9, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjczNTg4NTEsImV4cCI6MTYyNzM3Njg1MX0.aUP8gzFF65K4UqwA4qmKJp3vB', '2021-07-27 16:37:31'),
	(10, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2Mjc0MDI3NzMsImV4cCI6MTYyNzQyMDc3M30.G5EsMPmV13JET6SGoPxlgBhRp', '2021-07-28 04:49:33'),
	(11, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2Mjc0NDQ5MjQsImV4cCI6MTYyNzQ2MjkyNH0.Yp5ESh2_aVn9pWNX0TzRBFTgC', '2021-07-28 16:32:06'),
	(12, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2Mjc1MzEwNzIsImV4cCI6MTYyNzU0OTA3Mn0.of09spilRSjSBhYIJKdLzocJX', '2021-07-29 16:27:53'),
	(13, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjgzOTk4MTEsImV4cCI6MTYyODQxNzgxMX0.0BWa9onXnUpjfyhZ9w_3G2fez', '2021-08-08 17:46:52'),
	(14, 1, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsIm1vYmlsZV9udW1iZXIiOiI4ODg4ODg4ODg4IiwiZmlyc3RfbmFtZSI6InNhamlkIGphbGFsIiwiZW1haWwiOiJzYWppZGphbGFsODAxM0B5YWhvby5jb20iLCJpYXQiOjE2MjgzOTk4MTQsImV4cCI6MTYyODQxNzgxNH0.6Wrw1_KFmL4aJHNsIFf2zHuHe', '2021-08-08 17:46:54'),
	(15, 2, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiIyMTQ3NDgzNjQ3IiwiZmlyc3RfbmFtZSI6InN1cGVyIGFkbWluIiwiZW1haWwiOiJzdXBlckBhZG1pbi5jb20iLCJpYXQiOjE2Mjg0MDAwODcsImV4cCI6MTYyODQxODA4N30.J7rELiK-Uqsr_m_fQu9mB-WrUzvkVBt4V-Rhx', '2021-08-08 17:51:27'),
	(16, 2, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6Ijg4ODg4ODg4ODgiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODQwMDg3MCwiZXhwIjoxNjI4NDE4ODcwfQ.xrXQVv', '2021-08-08 18:04:31'),
	(17, 2, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODQxODkwNSwiZXhwIjoxNjI4NDM2OTA1fQ.bPfJb5', '2021-08-08 23:05:05'),
	(18, 2, '127.0.0.1', 'Chrome 92.0.4515.107', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODQzNzc3MSwiZXhwIjoxNjI4NDU1NzcxfQ._kbYFV', '2021-08-09 04:19:32'),
	(19, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODYwNzI5OCwiZXhwIjoxNjI4NjI1Mjk4fQ.ee3vRm', '2021-08-11 03:25:02'),
	(20, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODYwNzMwNywiZXhwIjoxNjI4NjI1MzA3fQ.G19uXh', '2021-08-11 03:25:07'),
	(21, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODYyMTg1MywiZXhwIjoxNjI4NjM5ODUzfQ.muLMGm', '2021-08-11 07:27:33'),
	(22, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODg2ODUyNSwiZXhwIjoxNjI4ODg2NTI1fQ.u3230T', '2021-08-14 03:58:50'),
	(23, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODg2ODUzMywiZXhwIjoxNjI4ODg2NTMzfQ.HXLfSN', '2021-08-14 03:58:54'),
	(24, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODg2ODUzNSwiZXhwIjoxNjI4ODg2NTM1fQ.tlLt7G', '2021-08-14 03:58:56'),
	(25, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODk2MTUwMiwiZXhwIjoxNjI4OTc5NTAyfQ.Eg7VeG', '2021-08-15 05:48:22'),
	(26, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODk2MTUwMywiZXhwIjoxNjI4OTc5NTAzfQ.QooDhA', '2021-08-15 05:48:23'),
	(27, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyODk5NzI0NSwiZXhwIjoxNjI5MDE1MjQ1fQ.SlcpJN', '2021-08-15 15:44:08'),
	(28, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTAzMzk3MSwiZXhwIjoxNjI5MDUxOTcxfQ.QURXK1', '2021-08-16 01:56:11'),
	(29, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTA1MTk4OCwiZXhwIjoxNjI5MDY5OTg4fQ.DkylrG', '2021-08-16 06:56:29'),
	(30, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTA4MDQ0OSwiZXhwIjoxNjI5MDk4NDQ5fQ.nPJzDm', '2021-08-16 14:50:49'),
	(31, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTA4NDcxNCwiZXhwIjoxNjI5MTAyNzE0fQ.j2DQMt', '2021-08-16 16:01:55'),
	(32, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTEyNDAxMSwiZXhwIjoxNjI5MTQyMDExfQ.txVwN3', '2021-08-17 02:56:52'),
	(33, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTEyNDA4NSwiZXhwIjoxNjI5MTQyMDg1fQ.IzZo0r', '2021-08-17 02:58:05'),
	(34, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTE0MjA3OCwiZXhwIjoxNjI5MTYwMDc4fQ.vfPobU', '2021-08-17 07:57:58'),
	(35, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTE0Mjc1NSwiZXhwIjoxNjI5MTYwNzU1fQ.TVdywL', '2021-08-17 08:09:16'),
	(36, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTI1OTg0MywiZXhwIjoxNjI5Mjc3ODQzfQ.KyfdiX', '2021-08-18 16:40:44'),
	(37, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTI3OTAyNSwiZXhwIjoxNjI5Mjk3MDI1fQ.R956Z9', '2021-08-18 22:00:26'),
	(38, 2, '127.0.0.1', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQHlhaG9vLmNvbSIsImlhdCI6MTYyOTI5NjM3MCwiZXhwIjoxNjI5MzE0MzcwfQ.auWd30', '2021-08-19 02:49:31'),
	(39, 2, '157.33.21.43', 'Chrome 92.0.4515.131', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTMwNjM4OSwiZXhwIjoxNjI5MzI0Mzg5fQ.MJao0I', '2021-08-19 02:06:29'),
	(40, 2, '152.57.10.251', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTMwNjQ4MCwiZXhwIjoxNjI5MzI0NDgwfQ.UibPny', '2021-08-19 02:08:00'),
	(41, 2, '117.204.132.218', 'Firefox 91.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTMzODkwMiwiZXhwIjoxNjI5MzU2OTAyfQ.lbGypj', '2021-08-19 11:08:22'),
	(42, 2, '1.187.61.182', 'Firefox 91.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTM3MTYwMiwiZXhwIjoxNjI5Mzg5NjAyfQ.Pjnl_9', '2021-08-19 20:13:22'),
	(43, 2, '152.57.8.106', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTM3NTk3NiwiZXhwIjoxNjI5MzkzOTc2fQ.Eebqz1', '2021-08-19 21:26:16'),
	(44, 2, '152.57.146.170', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTUzOTU3NywiZXhwIjoxNjI5NTU3NTc3fQ.iQFDhs', '2021-08-21 18:52:57'),
	(45, 2, '117.204.135.92', 'Firefox 91.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTYxMDY0OSwiZXhwIjoxNjI5NjI4NjQ5fQ.xPdpIG', '2021-08-22 14:37:30'),
	(46, 2, '117.204.135.92', 'Firefox 91.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTYxMDY1MywiZXhwIjoxNjI5NjI4NjUzfQ.zyVrBu', '2021-08-22 14:37:34'),
	(47, 2, '117.204.135.92', 'Firefox 91.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTYzODUzOSwiZXhwIjoxNjI5NjU2NTM5fQ.fbuI41', '2021-08-22 22:22:20'),
	(48, 2, '152.57.142.91', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoic2FqaWQgamFsYWwiLCJlbWFpbCI6InNhamlkamFsYWw4MDEzQGdtYWlsLmNvbSIsImlhdCI6MTYyOTY0OTYyNiwiZXhwIjoxNjI5NjY3NjI2fQ.s1wgNi', '2021-08-23 01:27:06'),
	(49, 2, '157.33.24.230', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYyOTY5Njk3OSwiZXhwIjoxNjI5NzE0OTc5fQ.oJULSAuDW6t6oetBwxLJHJ', '2021-08-23 14:36:19'),
	(50, 2, '117.204.135.222', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYyOTcwMzc3MiwiZXhwIjoxNjI5NzIxNzcyfQ.CnglDJiVyjs2D_ikCovRi5', '2021-08-23 16:29:32'),
	(51, 2, '157.33.24.230', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYyOTczODY2NCwiZXhwIjoxNjI5NzU2NjY0fQ.W_Tdh2S7H-R-dA4X5Pfk_s', '2021-08-24 02:11:04'),
	(52, 2, '106.77.6.194', 'Firefox 91.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYyOTgwMzE5NSwiZXhwIjoxNjI5ODIxMTk1fQ.iFp4tqVdACNvxDbwe0me3X', '2021-08-24 20:06:35'),
	(53, 2, '157.33.11.40', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYyOTk3MzY4MCwiZXhwIjoxNjI5OTkxNjgwfQ.joXJM_9nnAw-Hj4FOnpgji', '2021-08-26 19:28:00'),
	(54, 2, '152.57.154.107', 'Chrome 92.0.4515.159', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYzMDQyNzU3NywiZXhwIjoxNjMwNDQ1NTc3fQ.i3LL9HIwlfM5PtZqXF8mk_', '2021-09-01 01:32:57'),
	(55, 2, '152.57.191.41', 'Chrome 93.0.4577.82', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYzMjIwNzM4MCwiZXhwIjoxNjMyMjI1MzgwfQ.5NxYTP3lypQ1kUvAo2jxA_', '2021-09-21 15:56:20'),
	(56, 2, '117.204.141.124', 'Chrome 93.0.4577.63', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYzMjIyNzU1MSwiZXhwIjoxNjMyMjQ1NTUxfQ.urcattgP0iQOzEk8dpcEbf', '2021-09-21 21:32:31'),
	(57, 2, '49.36.105.233', 'Safari 604.1', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYzMjIyNzYyNCwiZXhwIjoxNjMyMjQ1NjI0fQ.9UTEtPaw9iEAkxGfapCFtq', '2021-09-21 21:33:45'),
	(58, 2, '49.36.106.167', 'Chrome 93.0.4577.82', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTYzMjY1Nzk4OCwiZXhwIjoxNjMyNjc1OTg4fQ.T9AJuYD_Ho1n2XpuJsabQw', '2021-09-26 21:06:32'),
	(59, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ0MjYzMSwiZXhwIjoxNjQyNDYwNjMxfQ.rciDZ4GYs2_4owAilbTAVn', '2022-01-18 04:03:51'),
	(60, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ0NDAxNSwiZXhwIjoxNjQyNDYyMDE1fQ.JxbvCGriU4uxTznTdk0h1-', '2022-01-18 04:26:55'),
	(61, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ0NDM0NSwiZXhwIjoxNjQyNDYyMzQ1fQ.vDZDLxIPwhssJ0v3380pba', '2022-01-18 04:32:25'),
	(62, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ0NTA2NywiZXhwIjoxNjQyNDYzMDY3fQ.nYvj39KchtgChwZkvHubFs', '2022-01-18 04:44:27'),
	(63, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', NULL, '2022-01-18 06:14:42'),
	(64, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', NULL, '2022-01-18 06:15:16'),
	(65, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', NULL, '2022-01-18 06:18:13'),
	(66, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', NULL, '2022-01-18 06:19:45'),
	(67, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', '', '2022-01-18 06:21:00'),
	(68, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTA4ODAsImV4cCI6MTY0MjQ2ODg4MH0.K', '2022-01-18 06:21:20'),
	(69, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTA4ODAsImV4cCI6MTY0MjQ2ODg4MH0.K', '2022-01-18 06:24:18'),
	(70, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', '', '2022-01-18 06:24:21'),
	(71, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', '', '2022-01-18 06:24:52'),
	(72, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTEyNTYsImV4cCI6MTY0MjQ2OTI1Nn0.w', '2022-01-18 06:27:36'),
	(73, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnpaWE56YVc5dVgybGtJam9pSWl3aWNtOXNaVjlwWkNJNklqSWlMQ0oxYzJWeVgybGtJam9pTWlJc0ltMXZZbWxzWlY5dWRXMWlaWElpT2lJNU16STFOVGczT1RZd0lpd2labWx5YzNSZ', '2022-01-18 06:27:44'),
	(74, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnpaWE56YVc5dVgybGtJam9pWlhsS01HVllRV2xQYVVwTFZqRlJhVXhEU21oaVIyTnBUMmxLU1ZWNlNURk9hVW81TG1WNVNucGFXRTU2WVZjNWRWZ3liR3RKYW05cFNXbDNhV050T1hOY', '2022-01-18 06:28:05'),
	(75, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTEzMzYsImV4cCI6MTY0MjQ2OTMzNn0.H', '2022-01-18 06:28:56'),
	(76, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnpaWE56YVc5dVgybGtJam9pSWl3aWNtOXNaVjlwWkNJNklqSWlMQ0oxYzJWeVgybGtJam9pTWlJc0ltMXZZbWxzWlY5dWRXMWlaWElpT2lJNU16STFOVGczT1RZd0lpd2labWx5YzNSZ', '2022-01-18 06:30:57'),
	(77, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnpaWE56YVc5dVgybGtJam9pWlhsS01HVllRV2xQYVVwTFZqRlJhVXhEU21oaVIyTnBUMmxLU1ZWNlNURk9hVW81TG1WNVNucGFXRTU2WVZjNWRWZ3liR3RKYW05cFNXbDNhV050T1hOY', '2022-01-18 06:31:32'),
	(78, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTE1ODIsImV4cCI6MTY0MjQ2OTU4Mn0.U', '2022-01-18 06:33:02'),
	(79, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTE1ODIsImV4cCI6MTY0MjQ2OTU4Mn0.U', '2022-01-18 06:34:13'),
	(80, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTE2NjUsImV4cCI6MTY0MjQ2OTY2NX0._', '2022-01-18 06:34:25'),
	(81, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTE2NjUsImV4cCI6MTY0MjQ2OTY2NX0._', '2022-01-18 06:35:18'),
	(82, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXNzaW9uX2lkIjoiIiwicm9sZV9pZCI6IjIiLCJ1c2VyX2lkIjoiMiIsIm1vYmlsZV9udW1iZXIiOiI5MzI1NTg3OTYwIiwiZmlyc3RfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkB0ZWNobWVyZ2UuY28iLCJpYXQiOjE2NDI0NTE3MjcsImV4cCI6MTY0MjQ2OTcyN30.N', '2022-01-18 06:35:27'),
	(83, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ1MTg0MiwiZXhwIjoxNjQyNDY5ODQyfQ.89KbVgvtOQY5uHmSMt5og8', '2022-01-18 06:37:23'),
	(84, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ1MTg0MiwiZXhwIjoxNjQyNDY5ODQyfQ.89KbVgvtOQY5uHmSMt5og8', '2022-01-18 06:43:03'),
	(85, 4, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGFiYy5jb20iLCJpYXQiOjE2NDI0NTIxOTAsImV4cCI6MTY0MjQ3MDE5MH0.Rbvi793eMRNYGz6CmHvhT', '2022-01-18 06:43:10'),
	(86, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ3NDE4MSwiZXhwIjoxNjQyNDkyMTgxfQ.px-03exYpVPv480ylRnsj9', '2022-01-18 12:49:41'),
	(87, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjQ3NTQ0OSwiZXhwIjoxNjQyNDkzNDQ5fQ.IxWCSzWMLqCHCcKuqvyFKi', '2022-01-18 13:10:49'),
	(88, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjUyMDU3MCwiZXhwIjoxNjQyNTM4NTcwfQ.PRhFKNqOALrsDyFsIj_nc_', '2022-01-19 01:42:50'),
	(89, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjUyMDU3MCwiZXhwIjoxNjQyNTM4NTcwfQ.PRhFKNqOALrsDyFsIj_nc_', '2022-01-19 02:32:11'),
	(90, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjUyMzU4MCwiZXhwIjoxNjQyNTQxNTgwfQ.SEpmC2D8qdKpzq0Z-G1yJo', '2022-01-19 02:33:00'),
	(91, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjUyNzA5MSwiZXhwIjoxNjQyNTQ1MDkxfQ.M6iaxaVSb2l69Q86PDOmUN', '2022-01-19 03:31:31'),
	(92, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjUyNzA5MSwiZXhwIjoxNjQyNTQ1MDkxfQ.M6iaxaVSb2l69Q86PDOmUN', '2022-01-19 04:53:28'),
	(93, 4, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGFiYy5jb20iLCJpYXQiOjE2NDI1MzIwODAsImV4cCI6MTY0MjU1MDA4MH0.ZL04_C0TBJ5Fe9__Elgrl', '2022-01-19 04:54:40'),
	(94, 4, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGFiYy5jb20iLCJpYXQiOjE2NDI1NjIwNjYsImV4cCI6MTY0MjU4MDA2Nn0.SIxfhKvw--wCN7NH-V_1g', '2022-01-19 13:14:27'),
	(95, 4, '127.0.0.1', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGFiYy5jb20iLCJpYXQiOjE2NDI1NjIwNjYsImV4cCI6MTY0MjU4MDA2Nn0.SIxfhKvw--wCN7NH-V_1g', '2022-01-19 14:51:53'),
	(96, 2, '127.0.0.1', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjU2NzkyMCwiZXhwIjoxNjQyNTg1OTIwfQ.DUGokudLjbAS2prfj7taSE', '2022-01-19 14:52:01'),
	(97, 2, '117.196.77.230', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjU3MjMzOSwiZXhwIjoxNjQyNTkwMzM5fQ.nQQnASsnUvV2t8D2b52YR0', '2022-01-19 11:35:39'),
	(98, 2, '117.196.77.230', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjU3MjMzOSwiZXhwIjoxNjQyNTkwMzM5fQ.nQQnASsnUvV2t8D2b52YR0', '2022-01-19 11:40:28'),
	(99, 4, '117.196.77.230', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGFiYy5jb20iLCJpYXQiOjE2NDI1NzI2MzgsImV4cCI6MTY0MjU5MDYzOH0.gTneKWjwxr6PF_3jk3Rx3', '2022-01-19 11:40:39'),
	(100, 4, '117.196.77.230', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGFiYy5jb20iLCJpYXQiOjE2NDI1NzI2MzgsImV4cCI6MTY0MjU5MDYzOH0.gTneKWjwxr6PF_3jk3Rx3', '2022-01-19 11:41:08'),
	(101, 2, '117.196.77.230', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjU3MjY3NiwiZXhwIjoxNjQyNTkwNjc2fQ.XM6cNtNF1HCn0z_ff5bI-l', '2022-01-19 11:41:16'),
	(102, 2, '117.196.77.230', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQHRlY2htZXJnZS5jbyIsImlhdCI6MTY0MjU3MjY3NiwiZXhwIjoxNjQyNTkwNjc2fQ.XM6cNtNF1HCn0z_ff5bI-l', '2022-01-19 11:42:37'),
	(103, 2, '117.196.77.230', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQyNTczODgyLCJleHAiOjE2NDI1OTE4ODJ9.6EUpdJMKCLI70rW6cWlYMp7wO5Pd', '2022-01-19 12:01:22'),
	(104, 2, '117.196.77.230', 'Chrome 97.0.4692.71', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQyNTczODgyLCJleHAiOjE2NDI1OTE4ODJ9.6EUpdJMKCLI70rW6cWlYMp7wO5Pd', '2022-01-19 12:03:45'),
	(105, 4, '110.173.187.106', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiNCIsInVzZXJfaWQiOiI0IiwibW9iaWxlX251bWJlciI6IjkzMjAwMDE4MDEiLCJmaXJzdF9uYW1lIjoiY3VzdG9tZXIiLCJlbWFpbCI6ImN1c3RvbWVyQGJhbmsuY29tIiwiaWF0IjoxNjQyNTg0NTMyLCJleHAiOjE2NDI2MDI1MzJ9.17jyEIUmuD5JAJUxctPW', '2022-01-19 14:58:52'),
	(106, 2, '110.173.187.106', 'Chrome 97.0.4692.71', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQyNTg0NTU3LCJleHAiOjE2NDI2MDI1NTd9.lSmLygIEk8rKrwUoIPwP9kP2vMH9', '2022-01-19 14:59:17'),
	(107, 2, '110.173.187.106', 'Firefox 96.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQyNTkxMTg3LCJleHAiOjE2NDI2MDkxODd9.jFHqPsDaL3wZbX2rx0m3Wd-eWIWW', '2022-01-19 16:49:47'),
	(108, 2, '110.173.187.106', 'Firefox 96.0', 'Logout', 'Y', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQyNTkxMTg3LCJleHAiOjE2NDI2MDkxODd9.jFHqPsDaL3wZbX2rx0m3Wd-eWIWW', '2022-01-19 17:32:02'),
	(109, 2, '117.199.29.138', 'Firefox 97.0', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQ0NTk5MTQ0LCJleHAiOjE2NDQ2MTcxNDR9.nB6aVybf4P28Gpljlr0cTgDpKId-', '2022-02-11 22:35:44'),
	(110, 2, '127.0.0.1', 'Chrome 98.0.4758.82', 'Login', 'N', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlX2lkIjoiMiIsInVzZXJfaWQiOiIyIiwibW9iaWxlX251bWJlciI6IjkzMjU1ODc5NjAiLCJmaXJzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluQGJhbmsuY29tIiwiaWF0IjoxNjQ0NjA0MjgzLCJleHAiOjE2NDQ2MjIyODN9.r0hoHx0o0GOLwv0WN3PU9n8i3wm1', '2022-02-12 00:01:23');
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
