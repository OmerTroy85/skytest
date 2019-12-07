-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2019 at 10:57 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
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
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Umar Admin 1', 'umaradmin@test.com', NULL, '$2y$10$C0UxYfGB/tsA0ZU8V9XiOuQbn1sXei0sD/qswQI4tD20zVa.woDqO', NULL, '2019-12-07 01:05:55', '2019-12-07 04:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `bloggers`
--

CREATE TABLE `bloggers` (
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
-- Dumping data for table `bloggers`
--

INSERT INTO `bloggers` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Umar Blogger 1', 'umarblogger@test.com', NULL, '$2y$10$hAFrHns.PfevIUdGncKfcury0xSpYt5f0W4rkA/36Zbe4t5JabQP6', NULL, '2019-12-07 01:13:05', '2019-12-07 04:30:12');

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
(3, '2019_12_06_125110_create_admins_table', 2),
(4, '2019_12_06_125128_create_bloggers_table', 2),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(8, '2016_06_01_000004_create_oauth_clients_table', 3),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
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
('147cc6b8516a4582c8cbdd6e309de8937bf15ef917254ee42f3a1b90407a1aed7b6398534c6ed5a1', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:28:55', '2019-12-07 02:28:55', '2020-12-07 07:28:55'),
('172757f948219309fb3896f3823cd5c7f115370e1911f4662107e8efdc8e6b1767533fca2971465c', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:43:00', '2019-12-07 01:43:00', '2020-12-07 06:43:00'),
('1c3977ef8ccc02e63d912a3fd353a0e964f03be18bc9eab8320d67eaede54ae6166844eb960c8bba', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:05:55', '2019-12-07 01:05:55', '2020-12-07 06:05:55'),
('260c5076f200cb72aeeaa9016656d46d9bb4238c111adc65116e19f909a873d3255b07e796023776', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:28:43', '2019-12-07 02:28:43', '2020-12-07 07:28:43'),
('2988dd3086a2630742404d5798d8b41fb6eef7bb9d03a2e12e0540767eacadcbc886f49a9d222a05', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:06:30', '2019-12-07 02:06:30', '2020-12-07 07:06:30'),
('2ec2cd9ecff2afe5bfb6ac849fac33c1242ae3f9efb2cd844ec9ad09614da2032ecedcd4df2728f1', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:38:33', '2019-12-07 02:38:33', '2020-12-07 07:38:33'),
('2ff3826df10e20af5eb2ffac1059c71fa6c75a09a884506220b09205ef95e95d18aa9437ccd7e719', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:13:50', '2019-12-07 02:13:50', '2020-12-07 07:13:50'),
('309a3754431ee42af2c578e6a808d3ccc3d7ee1c044a5f46430aaaf2245756889616ae39d0ec16b1', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:39:08', '2019-12-07 01:39:08', '2020-12-07 06:39:08'),
('37f20c555ef4be88e8b72ad1dca6eb4bf830faa70e2a20735d0ad0004c7d5eb05a932123407a9fb6', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:14:06', '2019-12-07 02:14:06', '2020-12-07 07:14:06'),
('383a69a0667bafa9c28a2306751d0750f954b8d5ed7deec9e2a191b264f17bf0f5cd0b84b216f1e9', 2, 1, 'MyApp', '[]', 0, '2019-12-07 00:44:49', '2019-12-07 00:44:49', '2020-12-07 05:44:49'),
('3d6da96664af4b44a72fea8b9940471d2f5b5d05ec79cdf1d03a09f6d34d3ddf293655ed97daf5a9', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:39:43', '2019-12-07 01:39:43', '2020-12-07 06:39:43'),
('54f1b1a0f21d431f63e0b1a0edd470f4e73d4e61af17a4b78fffbfdf9be9fcff8b1b0c9b427951d7', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:58:31', '2019-12-07 01:58:31', '2020-12-07 06:58:31'),
('5b87a824b74b90a075c783eacde3fe42e2bcb165fd7afa6d7b3898c2583076ec7d2e91a63b14cfc8', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:12:13', '2019-12-07 01:12:13', '2020-12-07 06:12:13'),
('650c902a99f973e2bed2c923e2e3a28c749b4167ac5aa1cd129bdd0fc5ee59536d634c42b405bee0', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:32:14', '2019-12-07 02:32:14', '2020-12-07 07:32:14'),
('6cd7e54747284ae462fbcace91c1a2148897097474b637ef1743a24460bd016587133bc796d83ebb', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:57:38', '2019-12-07 01:57:38', '2020-12-07 06:57:38'),
('6eaac2e7d3deb839a21384e06516666f211602552b7afad4cc8c7958a6e3ba11a44523f6263fc509', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:38:16', '2019-12-07 01:38:16', '2020-12-07 06:38:16'),
('746301749c1d04079170f5ac8e2efc93ee09c17021f10818114d7045d99a1f87f65a9d349b0bd1df', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:13:05', '2019-12-07 01:13:05', '2020-12-07 06:13:05'),
('82980399901a210668cdbda4f14b90b7d48102e954b00464099b6e7a5466292e1cecb5d871c18523', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:16:04', '2019-12-07 02:16:04', '2020-12-07 07:16:04'),
('87b51d76d0f21fb3113927ef02a463f82955d4ffc9e56323a2df518e460b9e5895614e821aaf6df4', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:15:06', '2019-12-07 02:15:06', '2020-12-07 07:15:06'),
('8aeed35045f1686453a36ca115699c0fc2b4543f769bb9f66e4842b19a84121b3ce2f11f00c5f905', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:36:35', '2019-12-07 02:36:35', '2020-12-07 07:36:35'),
('9670461287b1163cf53dd2cce3eedd3407c8b2361ce4ca0064e9e3036bf89ad8fe67c77d958d5743', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:42:41', '2019-12-07 01:42:41', '2020-12-07 06:42:41'),
('9bf0b7bc7a28fe6850d84a7327cecba5f54168e9c2014f0ac3182079a96237ae28689d23d881db04', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:09:49', '2019-12-07 02:09:49', '2020-12-07 07:09:49'),
('b3f3258992c8cd78ce81e2bd7ef2e718aebfeb89bc9a0ca74dce36300c805b6b692922aed43007e3', 1, 1, 'MyApp', '[]', 0, '2019-12-07 04:38:31', '2019-12-07 04:38:31', '2020-12-07 09:38:31'),
('bfadcdf298171c4473a9bc633cb8cd452120c2692bff70385429641b740cf3d33bde6fcd0e4a2560', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:41:49', '2019-12-07 01:41:49', '2020-12-07 06:41:49'),
('c5770a0b1970d3d07cff974531e794fcc65ffa8ad2967d7c9b927946d8fcda1f0bb403b27d3a1bde', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:01:57', '2019-12-07 02:01:57', '2020-12-07 07:01:57'),
('c5a7357ba7e8039318d2eadc47d127f4023d471ed11be17c83e3f0e64090e0a121884ff24e2e76c5', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:11:33', '2019-12-07 02:11:33', '2020-12-07 07:11:33'),
('ccf3b0f63dfb8308f8e2f590364d1143547c0923ce8acd603efac61ab16d0cb64563a643086dcf7d', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:35:37', '2019-12-07 02:35:37', '2020-12-07 07:35:37'),
('cd786c267093e48033daf7144331041e098c9c8de17fa71da499943363f8b069e994b5810eb7f9f5', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:43:49', '2019-12-07 01:43:49', '2020-12-07 06:43:49'),
('d4983046f6bc42dc606066cb1ab546ad45cb8cd50f1840c9d4956729703347e345f1a6791cbaf93f', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:49:12', '2019-12-07 01:49:12', '2020-12-07 06:49:12'),
('d4f06060f941d0a5f0f41c643be9415c9ba501cdf42834590f6ad9ab8f3685ab73f0521e02f01a06', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:12:58', '2019-12-07 02:12:58', '2020-12-07 07:12:58'),
('dde88f41db95f4ac8260082dd2aad22c1a03284249de34088b85f06e54578117e19b9702aca0a5fb', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:09:38', '2019-12-07 02:09:38', '2020-12-07 07:09:38'),
('e23eb1016db3a680617eaf32ad501ad9ef788498cabdd97880cbb7d2a1c1b587585441c467f96b76', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:59:41', '2019-12-07 01:59:41', '2020-12-07 06:59:41'),
('eec72a7efb284abbb9ab7c50b7e94a9679734e5ee47aa62987ac5f10036cb389c7837a12f2ac8deb', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:35:12', '2019-12-07 02:35:12', '2020-12-07 07:35:12'),
('f71bc6a2df05a56652c348af46fd5705edf919b06667f73882efc9f8292d7926ce0bb82a7f861d16', 2, 1, 'MyApp', '[]', 0, '2019-12-06 08:33:24', '2019-12-06 08:33:24', '2020-12-06 13:33:24'),
('fb9e0621fa7821c50b25c1ca28506a1b581f0a54ea8a868c7a97637443f1bad00bad05737d95cd48', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:12:05', '2019-12-07 02:12:05', '2020-12-07 07:12:05'),
('fc884b969c0333917688ea2cbfe3f67e4c06681c652eea34413ff9d818156bdaeec15c273df82600', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:38:16', '2019-12-07 01:38:16', '2020-12-07 06:38:16'),
('fd41e29b85818145cad36e3a737eb84d9e4ec4f34689f3a5e08a5cbe73770563fe423e480b468c87', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:17:30', '2019-12-07 02:17:30', '2020-12-07 07:17:30'),
('ff14eeccd33abef6e5f093b2bc14dede69bd83e3096f5fcd7902c18e8726102b98af3a53db1c17ab', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:10:13', '2019-12-07 01:10:13', '2020-12-07 06:10:13'),
('ffd140d229f0400b77fda83114c8c049b841fa1cdedb8ad1d8aeed955f78a73a12fbc39104a9efa6', 1, 1, 'MyApp', '[]', 0, '2019-12-07 01:39:59', '2019-12-07 01:39:59', '2020-12-07 06:39:59'),
('fff1116a20a765d62d614e4d2347c3af8dad7d0f5e46810fc142269fa30cc21fa1e22948e65f9c6d', 1, 1, 'MyApp', '[]', 0, '2019-12-07 02:35:19', '2019-12-07 02:35:19', '2020-12-07 07:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SkyTest:Umar-Pervaiz Personal Access Client', 'hVwmwvbNAJaRIbIBPvw4dKwptm5dyuAy9zBnKgqK', 'http://localhost', 1, 0, 0, '2019-12-06 08:21:49', '2019-12-06 08:21:49'),
(2, NULL, 'SkyTest:Umar-Pervaiz Password Grant Client', 'FEfeIUrniNWvWJP0eMn6nl3vgDNX7NOUVlgdMH5b', 'http://localhost', 0, 1, 0, '2019-12-06 08:21:49', '2019-12-06 08:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-12-06 08:21:49', '2019-12-06 08:21:49');

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
(2, 'Umar', 'umar@test.com', NULL, '$2y$10$uKNCZv20zMrJSKv5UpcnmeLrFUnq3bkK/zLMaoHHiG9ovv.Nmcom.', NULL, '2019-12-06 08:33:24', '2019-12-07 04:42:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bloggers`
--
ALTER TABLE `bloggers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bloggers_email_unique` (`email`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bloggers`
--
ALTER TABLE `bloggers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
