-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2025 at 01:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `nama`, `harga`, `gambar`, `created_at`, `updated_at`) VALUES
(4, 'Nasi Goreng', 15000, '1737953489_nasgor.jpeg', '2025-01-26 21:51:29', '2025-01-29 06:24:29'),
(5, 'Rendang', 25000, '1738068481_Resep-Rendang-Daging-Sapi-Untuk-Lebaran-Gurih-dan-Nikmat-1200x900.jpg', '2025-01-26 21:53:51', '2025-01-28 05:48:01'),
(6, 'Nasi Campur', 25000, '1737953649_sego_campur.png', '2025-01-26 21:54:09', '2025-01-26 21:54:09'),
(7, 'Sate Ayam', 15000, '1737953701_sate-ayam.jpg', '2025-01-26 21:55:01', '2025-01-26 21:55:01'),
(8, 'Minuman Boba', 9000, '1737953755_boba.jpg', '2025-01-26 21:55:55', '2025-01-26 21:55:55'),
(9, 'Minuman Milk Shake', 10000, '1737953782_milk_shake.jpg', '2025-01-26 21:56:22', '2025-01-26 21:56:22'),
(10, 'Minuman Cendol', 7000, '1737953795_cendol.jpg', '2025-01-26 21:56:35', '2025-01-26 21:56:35'),
(11, 'Tempe Menjes', 13000, '1737953811_menjes.jpg', '2025-01-26 21:56:51', '2025-01-26 21:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000001_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_01_25_092615_create_items_table', 1),
(6, '2025_01_25_092625_create_orders_table', 1),
(7, '2025_01_25_092630_create_order_details_table', 1),
(8, '2025_01_27_062737_add_table_order_details', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `nomor_meja` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `status` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `id_kasir` bigint(20) UNSIGNED DEFAULT NULL,
  `id_waitress` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `nama_customer`, `nomor_meja`, `tanggal`, `waktu`, `status`, `total`, `id_kasir`, `id_waitress`, `created_at`, `updated_at`) VALUES
(6, 'pelanggan01', '03', '2024-01-07', '14:30:00', 'paid', 100000, NULL, 2, '2025-01-26 23:54:22', '2025-01-29 08:45:05'),
(12, 'someone', '03', '2025-01-27', '07:11:17', 'order', 90000, 3, 2, '2025-01-27 00:11:17', '2025-01-29 08:28:10'),
(13, 'sometwo', '03', '2025-01-28', '14:53:24', 'order', 89000, NULL, 2, '2025-01-28 07:53:24', '2025-01-29 08:29:15'),
(19, 'tes', '01', '2025-01-28', '15:05:00', 'order', 115000, NULL, 1, '2025-01-28 08:05:00', '2025-01-28 08:05:00'),
(22, 'Bagas', '03', '2025-01-28', '15:15:13', 'order', 0, NULL, 2, '2025-01-28 08:15:13', '2025-01-28 08:15:13'),
(23, 'tes2', '22', '2025-01-28', '15:15:46', 'order', 84000, NULL, 1, '2025-01-28 08:15:46', '2025-01-29 08:31:27'),
(24, 'Bagus', '02', '2025-01-29', '15:37:39', 'order', 175000, NULL, 1, '2025-01-29 08:37:39', '2025-01-29 08:37:39'),
(25, 'Bagus2', '033', '2025-01-29', '15:41:32', 'order', 65000, NULL, 1, '2025-01-29 08:41:32', '2025-01-29 08:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` bigint(20) UNSIGNED NOT NULL,
  `id_item` bigint(20) UNSIGNED NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_item`, `harga`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 6, 4, 16000, '1', '2025-01-26 23:54:22', '2025-01-26 23:54:22'),
(2, 6, 5, 25000, '1', '2025-01-26 23:54:22', '2025-01-26 23:54:22'),
(3, 6, 6, 25000, '1', '2025-01-26 23:54:22', '2025-01-26 23:54:22'),
(4, 6, 7, 15000, '1', '2025-01-26 23:54:22', '2025-01-26 23:54:22'),
(5, 6, 8, 9000, '1', '2025-01-26 23:54:22', '2025-01-26 23:54:22'),
(31, 12, 4, 16000, '1', '2025-01-27 00:11:17', '2025-01-27 00:11:17'),
(32, 12, 5, 25000, '1', '2025-01-27 00:11:17', '2025-01-27 00:11:17'),
(33, 12, 6, 25000, '1', '2025-01-27 00:11:17', '2025-01-27 00:11:17'),
(34, 12, 7, 15000, '1', '2025-01-27 00:11:17', '2025-01-27 00:11:17'),
(35, 12, 8, 9000, '1', '2025-01-27 00:11:17', '2025-01-27 00:11:17'),
(36, 13, 4, 15000, '1', '2025-01-28 07:53:24', '2025-01-28 07:53:24'),
(37, 13, 5, 25000, '1', '2025-01-28 07:53:24', '2025-01-28 07:53:24'),
(38, 13, 6, 25000, '1', '2025-01-28 07:53:24', '2025-01-28 07:53:24'),
(39, 13, 7, 15000, '1', '2025-01-28 07:53:24', '2025-01-28 07:53:24'),
(40, 13, 8, 9000, '1', '2025-01-28 07:53:24', '2025-01-28 07:53:24'),
(56, 19, 6, 25000, '1', '2025-01-28 08:05:00', '2025-01-28 08:05:00'),
(57, 19, 5, 25000, '1', '2025-01-28 08:05:00', '2025-01-28 08:05:00'),
(58, 19, 4, 15000, '1', '2025-01-28 08:05:00', '2025-01-28 08:05:00'),
(59, 22, 4, 15000, '1', '2025-01-28 08:15:13', '2025-01-28 08:15:13'),
(60, 22, 5, 25000, '2', '2025-01-28 08:15:13', '2025-01-28 08:15:13'),
(61, 22, 6, 25000, '1', '2025-01-28 08:15:13', '2025-01-28 08:15:13'),
(62, 22, 7, 15000, '2', '2025-01-28 08:15:13', '2025-01-28 08:15:13'),
(63, 22, 8, 9000, '3', '2025-01-28 08:15:13', '2025-01-28 08:15:13'),
(64, 23, 5, 25000, '1', '2025-01-28 08:15:46', '2025-01-28 08:15:46'),
(65, 23, 6, 25000, '2', '2025-01-28 08:15:46', '2025-01-28 08:15:46'),
(66, 23, 8, 9000, '1', '2025-01-28 08:15:46', '2025-01-28 08:15:46'),
(67, 24, 6, 25000, '5', '2025-01-29 08:37:39', '2025-01-29 08:37:39'),
(68, 24, 5, 25000, '2', '2025-01-29 08:37:39', '2025-01-29 08:37:39'),
(69, 25, 4, 15000, '1', '2025-01-29 08:41:32', '2025-01-29 08:41:32'),
(70, 25, 5, 25000, '2', '2025-01-29 08:41:32', '2025-01-29 08:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(7, 'App\\Models\\User', 3, 'token', '1efebf40da3af40aadbbc5f4d8fcadd9fb1f3966d4cbc75dca26b575728e2526', '[\"*\"]', '2025-01-27 01:30:55', '2025-01-26 20:02:58', '2025-01-27 01:30:55'),
(38, 'App\\Models\\User', 1, 'token', '84da6a66f52181e8dc4986a7e30176268ccf465b384212cb376d59f7269b8e77', '[\"*\"]', '2025-02-04 05:20:28', '2025-02-04 05:20:10', '2025-02-04 05:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Manager Bambang', 'manager@example.com', 'manager', '$2y$10$fYmB.nfcpdtuN4UeE9dXB.ovSCZ8w0aOpdZMkWYP4rvFR18LzVKD2', NULL, '2025-01-25 03:02:34', '2025-01-25 03:02:34'),
(2, 'Waitress Ani', 'waitress@example.com', 'waitress', '$2y$10$.BMJbs2fL.YQjPxSBy8Djun4ARWnXthrAncjNGrEp1yUkdwxAH2Va', NULL, '2025-01-25 03:02:34', '2025-01-25 03:02:34'),
(3, 'Kasir Juminten', 'kasir@example.com', 'kasir', '$2y$10$kLDHO7.w.HK28KFllkKno.21EaCQ8ynbuNlevEwGRshGDXhNR/Jf2', NULL, '2025-01-25 03:02:34', '2025-01-25 03:02:34'),
(4, 'Chef Juna', 'chef@example.com', 'chef', '$2y$10$S3QyrjyspOxxmDhKM8xy2OVgfTU5d1rm0L7rDx3HOCaUBe6fMzh0K', NULL, '2025-01-25 03:02:34', '2025-01-25 03:02:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_id_kasir_foreign` (`id_kasir`),
  ADD KEY `orders_id_waitress_foreign` (`id_waitress`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_id_order_foreign` (`id_order`),
  ADD KEY `order_details_id_item_foreign` (`id_item`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_id_kasir_foreign` FOREIGN KEY (`id_kasir`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_id_waitress_foreign` FOREIGN KEY (`id_waitress`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
