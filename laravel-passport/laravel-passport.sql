-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2021 at 05:19 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-passport`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `creator_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Project Animation', NULL, NULL),
(2, 2, 'Project E-Commerce', '2021-06-18 07:59:59', '2021-06-23 08:16:00'),
(77, 2, 'Project Animate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `board_lists`
--

CREATE TABLE `board_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `board_members`
--

CREATE TABLE `board_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `board_members`
--

INSERT INTO `board_members` (`id`, `board_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-06-18 08:21:32', '2021-06-18 08:21:32'),
(2, 2, 2, '2021-06-18 08:21:32', '2021-06-18 08:21:32'),
(4, 1, 3, '2021-06-18 08:44:28', '2021-06-18 08:44:28'),
(5, 2, 3, '2021-06-18 08:47:44', '2021-06-18 08:47:44'),
(58, 77, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list_id` bigint(20) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL,
  `task` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_06_13_142336_create_boards_table', 1),
(10, '2021_06_14_164813_create_board_lists_table', 1),
(11, '2021_06_14_164830_create_cards_table', 1),
(12, '2021_06_14_164912_create_board_members_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('979dab9868a7098b6ca765e6f151379a437eda05df21b9f6e0b2e6dfad91c6818e875451795c0f15', 2, 1, 'auth-token', '[]', 0, '2021-06-23 07:11:33', '2021-06-23 07:11:33', '2022-06-23 14:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'wa7nO1wAAKHt538YeJ7qZy3eAC7igISZiirtvJkt', NULL, 'http://localhost', 1, 0, 0, '2021-06-14 12:05:01', '2021-06-14 12:05:01'),
(2, NULL, 'Laravel Password Grant Client', 'uYTC0oviaGTubFFd4ADLzhENkPPH4AuCFgR3hIKz', 'users', 'http://localhost', 0, 1, 0, '2021-06-14 12:05:02', '2021-06-14 12:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-14 12:05:02', '2021-06-14 12:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Fayyaz', 'f@test.com', NULL, '$2y$10$yfeFfQyCeGkPX1NfuDWhd./3rD9qmhbXnesPwm0klPVNM.oXjADq2', NULL, '2021-06-15 07:42:11', '2021-06-15 07:42:11'),
(2, 'ayyaz', 'a@test.com', NULL, '$2y$10$qJAvCdc.kX0R4Ux0gyqbauNuoQlh0AKvmJoUigODJkKg4qopbxULS', NULL, '2021-06-18 00:59:18', '2021-06-18 00:59:18'),
(3, 'yaz', 'y@test.com', NULL, '$2y$10$lpFPccBIZr0gXNjnUtsBC.0jPGkqGNguttoGpN/c3agvNJjbDEgOe', NULL, '2021-06-18 01:02:09', '2021-06-18 01:02:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boards_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `board_lists`
--
ALTER TABLE `board_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `board_lists_board_id_foreign` (`board_id`);

--
-- Indexes for table `board_members`
--
ALTER TABLE `board_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `board_members_board_id_foreign` (`board_id`),
  ADD KEY `board_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cards_list_id_foreign` (`list_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `board_lists`
--
ALTER TABLE `board_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `board_members`
--
ALTER TABLE `board_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boards`
--
ALTER TABLE `boards`
  ADD CONSTRAINT `boards_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `board_lists`
--
ALTER TABLE `board_lists`
  ADD CONSTRAINT `board_lists_board_id_foreign` FOREIGN KEY (`board_id`) REFERENCES `boards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `board_members`
--
ALTER TABLE `board_members`
  ADD CONSTRAINT `board_members_board_id_foreign` FOREIGN KEY (`board_id`) REFERENCES `boards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `board_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_list_id_foreign` FOREIGN KEY (`list_id`) REFERENCES `board_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
