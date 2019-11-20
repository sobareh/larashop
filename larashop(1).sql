-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2019 at 01:09 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larashop`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2019_11_18_045121_penyesuaian_table_users', 2);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `roles`, `address`, `phone`, `avatar`, `status`) VALUES
(1, 'Site Administrator', 'administrator@larashop.test', NULL, '$2y$10$UhgXDQn.aPdHb.CnzJQEO.4D32Go6YHfQJOt7YsKlXvkUZkjZxu7O', NULL, '2019-11-18 00:03:04', '2019-11-18 00:03:04', 'administrator', '[\"ADMIN\"]', 'Sarmili, Bintaro, Tangerang Selatan', NULL, '', 'ACTIVE'),
(2, 'Yashinta Widyastuti', 'yashintawidy@gmail.com', NULL, '$2y$10$0HtvZvQaPjBushFAY23ooO548F01nxab.4Ay7K3Z6kDuivBvvikqK', NULL, '2019-11-19 22:17:50', '2019-11-20 07:40:24', 'yashintawidy', '[\"STAFF\",\"CUSTOMER\"]', 'Jalan Masjid Al-Hikmah Bogor, Semplak, Bogor Barat, Indonesia', '085718098097', 'avatars/zCEHYxczpfjx6aouSB7eHD7jDbxkmOHJGwswSSO8.jpeg', 'ACTIVE'),
(4, 'Staff Accounting', 'accounting@larashop.test', NULL, '$2y$10$oimQsL/EIWjKpDwSVviNfuPCm.GQkkuTj1PIiSzNf5IAQtk7D6QAu', NULL, '2019-11-20 08:31:57', '2019-11-20 08:37:21', 'accounting101', '[\"STAFF\"]', 'Medan', '082170755588', 'avatars/WCVhCnHlQG9NowVXvrakWH8B6zqxkLrSx0K4DjDq.jpeg', 'ACTIVE'),
(5, 'Renzi Abaray', 'abaray@laravel.test', NULL, '$2y$10$0bfPHz9HRoGt1XmrTr0LZetk0aVEdqhJ55n0bAmJiSg7lFhOLuqfu', NULL, '2019-11-20 10:05:25', '2019-11-20 10:40:35', 'abaray', '[\"STAFF\"]', 'Sidikalang', '08111234111', NULL, 'INACTIVE'),
(6, 'Andi Pribadi', 'pribadi@larashop.test', NULL, '$2y$10$/1p3.sJICMXmbyrqFH7Z1eoAwH4HIGt397fdWWoR8clvXwAMmaIGu', NULL, '2019-11-20 10:06:16', '2019-11-20 10:40:45', 'pribadi', '[\"STAFF\"]', 'Rantau Prapat', '081222224444', NULL, 'INACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
