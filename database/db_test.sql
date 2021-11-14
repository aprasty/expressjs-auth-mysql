-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2021 at 06:52 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

CREATE TABLE `authentication` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `secret_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authentication`
--

INSERT INTO `authentication` (`id`, `user_id`, `secret_id`, `created_at`, `updated_at`, `expires_at`) VALUES
('0738dac0e361768b6018617253dbc3f7dd585f66d8c5758c37', 1, 1, '2021-11-14 16:00:34', '2021-11-14 16:00:34', '2021-12-14 16:00:34'),
('38c99bbae5f2d3f26e1de31fe29594a0426a37d55cacaa3f86', 1, 1, '2021-11-14 16:50:39', '2021-11-14 16:50:39', '2021-12-14 16:50:39'),
('707f523ca2294ad633ba5ccb36ab123c9888ad9d148ff92633', 1, 1, '2021-11-14 14:55:29', '2021-11-14 14:55:29', '2021-12-14 14:55:29'),
('7277fb622b95e42bace370a01932cab48970dcfd26bd9ad087', 1, 1, '2021-11-14 14:54:19', '2021-11-14 14:54:19', '2021-12-14 14:54:19'),
('ecdc3f169f198915a5c86cc7273300e22b2f2d73c44614498d', 1, 1, '2021-11-14 16:00:49', '2021-11-14 16:00:49', '2021-12-14 16:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `secret`
--

CREATE TABLE `secret` (
  `id` int(10) UNSIGNED NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`permission`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `secret`
--

INSERT INTO `secret` (`id`, `secret`, `description`, `permission`, `created_at`, `updated_at`) VALUES
(1, '7f46165474d11ee5836777d85df2cdab', 'Mobile', '{}', '2018-12-25 10:10:10', '2018-12-25 10:10:10'),
(2, '3d4fe7a00bc6fb52a91685d038733d6f', 'Web', '{}', '2018-12-25 10:10:10', '2018-12-25 10:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aliek', 'admin@test.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'c88122189463ff94e2036947e9dc7b73f86bcc9d0c96cc919d1c176d3ae87732', '2021-11-13 18:01:39', '2021-11-13 18:01:39'),
(20, 'Aliek', 'admin@testing.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '342eab8e73acb0b6905880c302569931a222e97b08df7872c82af32f3be1a427', '2021-11-14 17:24:53', '2021-11-14 17:24:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication`
--
ALTER TABLE `authentication`
  ADD UNIQUE KEY `authentication_id_unique` (`id`),
  ADD KEY `authentication_secret_id_foreign` (`secret_id`),
  ADD KEY `authentication_user_id_foreign` (`user_id`);

--
-- Indexes for table `secret`
--
ALTER TABLE `secret`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `secret_secret_unique` (`secret`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `secret`
--
ALTER TABLE `secret`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authentication`
--
ALTER TABLE `authentication`
  ADD CONSTRAINT `authentication_secret_id_foreign` FOREIGN KEY (`secret_id`) REFERENCES `secret` (`id`),
  ADD CONSTRAINT `authentication_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
