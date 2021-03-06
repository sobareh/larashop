-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2020 at 11:30 AM
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
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `slug`, `description`, `author`, `publisher`, `cover`, `price`, `views`, `stock`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dasar Pemrograman Python 3 + Cd', 'dasar-pemrograman-python-3-cd', 'Buku yang sangat perlu dimiliki dan dibaca oleh siapa saja yang berminat mempelajari pemrograman Python. Dengan menggunakan pendekatan sederhana dan disertai banyak contoh, buku ini membuat pemrograman Python akan menjadi mudah dipelajari dan dikuasai oleh siapa saja. \r\nMateri-materi berikut dibahas di buku ini: Cara menginstalasi interpreter Python Penggunaan Python secara interaktif dan melalui skrip Pembuatan fungsi Struktur data berupa Iist, dictionary, tuple, dan set • Penanganan eksepsi • Pengenalan sejumlah pustaka seperti sys, os, math, time, dan pickle • Pembuatan kelas dan objek Penanganan file • Graphical User Interface (GUI) dengan tkinter', 'Abdul Kadir', 'Penerbit Andi', 'books-cover/MW4rS5MvgHKQnToAJ2yDfFher1JviFZvlqBZrGf1.jpeg', 149000.00, 0, 1, 'PUBLISH', 1, NULL, NULL, '2020-01-02 10:13:55', '2020-01-02 10:13:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'berisi nama file image saja tanpa path',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'sepatu-olahraga', 'sepatu-olahraga', 'category_images/V1xUaqw37K98N9jGeYXkXgu1p8DEYgDsvSSDnuX2.webp', 1, NULL, NULL, NULL, '2019-12-03 02:09:37', '2019-12-31 05:16:41'),
(2, 'celana kerja', 'celana-kerja', 'category_images/psIS7xNtP903O6WzG39aBHsRvGX9ovjTHvNDVIKo.jpeg', 1, NULL, NULL, NULL, '2019-12-03 02:14:23', '2019-12-31 05:13:37'),
(3, 'Sepatu Sniker', 'sepatu-sniker', 'category_images/nw5CN6qYL0mA8jf8MFHPhUW0ZePMxVBCx8hOUrj2.jpeg', 1, NULL, NULL, NULL, '2019-12-31 01:19:43', '2019-12-31 05:13:56'),
(4, 'Baju Berlari', 'baju-berlari', 'category_images/ILknYvz8D57mZjBuhkbaMytL6Yf9tVTVbUswO8M0.jpeg', 1, 1, NULL, NULL, '2019-12-31 02:07:49', '2019-12-31 05:15:11'),
(6, 'Celana Tidur', 'celana-tidur', 'category_images/2cNWOZyCzgV25sOMwpThciLROdxd7C0HaY2v7YjQ.jpeg', 1, 1, NULL, NULL, '2019-12-31 02:08:46', '2019-12-31 05:15:54'),
(7, 'Sepatu Lari', 'sepatu-lari', NULL, 1, NULL, NULL, NULL, '2019-12-31 04:08:30', '2019-12-31 05:15:26'),
(8, 'Buku Pemrograman', 'buku-pemrograman', 'category_images/jsIjPHyLg86OEdN9lIEOt3Ohsf6xy787xvgmmw2v.jpeg', 1, NULL, NULL, NULL, '2020-01-02 10:12:13', '2020-01-02 10:12:13');

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
(4, '2019_11_18_045121_penyesuaian_table_users', 2),
(5, '2019_11_21_120550_create_table_categories', 3),
(6, '2020_01_02_144443_create_books_table', 4),
(7, '2020_01_02_150610_create_book_category_table', 5);

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
(6, 'Andi Pribadi', 'pribadi@larashop.test', NULL, '$2y$10$/1p3.sJICMXmbyrqFH7Z1eoAwH4HIGt397fdWWoR8clvXwAMmaIGu', NULL, '2019-11-20 10:06:16', '2019-11-20 10:40:45', 'pribadi', '[\"STAFF\"]', 'Rantau Prapat', '081222224444', NULL, 'INACTIVE'),
(7, 'James Bikson', 'jbikson@laravel.test', NULL, '$2y$10$bFTs5niDllKdYfvTjwAZ6.kiO3/7SM2zK579iajlu4U7uHAcnQHx2', NULL, '2019-11-21 03:57:22', '2019-11-21 03:57:22', 'jamesbikson', '[\"CUSTOMER\"]', 'Jakarta', '081111111111', NULL, 'ACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

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
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
