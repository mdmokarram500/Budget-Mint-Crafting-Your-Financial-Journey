-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2024 at 09:57 AM
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
-- Database: `budgetmint`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_integrations`
--

CREATE TABLE `bank_integrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `integration_key` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `budget_limit` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budgets`
--

INSERT INTO `budgets` (`id`, `user_id`, `category`, `budget_limit`, `created_at`) VALUES
(1, 1, 'fttd', 5666.00, '2024-04-27 19:12:53'),
(2, 1, 'Goa Trip', 21000.00, '2024-05-21 08:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `budget_categories`
--

CREATE TABLE `budget_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `colour` varchar(20) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_selectable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_categories`
--

INSERT INTO `budget_categories` (`id`, `category_name`, `icon`, `colour`, `short_description`, `created_at`, `user_selectable`) VALUES
(1, 'Home Goal', '🏠', '#FF5733', 'Saving for your dream home', '2024-05-22 22:52:07', 0),
(2, 'Car', '🚗', '#3366CC', 'Budgeting for your first car purchase', '2024-05-22 22:52:07', 0),
(3, 'Kids Education', '🎓', '#FFD700', 'Funding your children\'s education', '2024-05-22 22:52:07', 0),
(4, 'Travel', '✈️', '#2E8B57', 'Setting aside money for travel expenses', '2024-05-22 22:52:07', 0),
(5, 'Marriage Goal', '💒', '#FF1493', 'Saving for your wedding or a loved one\'s wedding', '2024-05-22 22:52:07', 0),
(6, 'Startup Fund', '💼', '#800080', 'Investing in your startup or business idea', '2024-05-22 22:52:07', 0),
(7, 'Retirement', '🌴', '#FF4500', 'Planning for retirement and financial independence', '2024-05-22 22:52:07', 0),
(8, 'Custom Goal', '🎯', '#000000', 'Create your own custom savings goal', '2024-05-22 22:52:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `budget_categories_custom_goal`
--

CREATE TABLE `budget_categories_custom_goal` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `colour` varchar(20) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_categories_custom_goal`
--

INSERT INTO `budget_categories_custom_goal` (`id`, `category_name`, `icon`, `colour`, `short_description`, `created_at`) VALUES
(1, 'Custom Goal', '🎯', '#000000', 'Create your own custom savings goal', '2024-05-22 22:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `budget_goals`
--

CREATE TABLE `budget_goals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `goal_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `current_progress` decimal(10,2) NOT NULL DEFAULT 0.00,
  `goals_status` enum('active','completed','expired') NOT NULL DEFAULT 'active',
  `notify_user` tinyint(1) NOT NULL DEFAULT 0,
  `notify_days_before` int(11) DEFAULT NULL,
  `notify_email` varchar(255) DEFAULT NULL,
  `notify_whatsapp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_goals`
--

INSERT INTO `budget_goals` (`id`, `user_id`, `category_id`, `goal_name`, `description`, `start_date`, `end_date`, `total_amount`, `current_progress`, `goals_status`, `notify_user`, `notify_days_before`, `notify_email`, `notify_whatsapp`, `created_at`) VALUES
(1, 1, 1, 'House Renovation', 'Renovate the living room and kitchen', '2024-05-01', '2024-07-31', 5000.00, 2000.00, 'active', 1, 7, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-04-15 04:30:00'),
(2, 1, 2, 'New Car Purchase', 'Buy a brand new SUV', '2024-06-15', '2024-12-31', 35000.00, 0.00, 'active', 0, NULL, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-05-10 09:00:00'),
(3, 1, 3, 'Children Education Fund', 'Save for children\'s college tuition', '2024-01-01', '2028-12-31', 20000.00, 5000.00, 'active', 1, 30, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-01-01 02:30:00'),
(4, 1, 4, 'European Vacation', 'Travel across Europe for 3 weeks', '2025-07-01', '2025-07-21', 8000.00, 8000.00, 'completed', 1, 14, 'mdmokrram500@gmail.com', '+91 9525601041', '2025-06-01 06:30:00'),
(5, 1, 5, 'Wedding Anniversary Celebration', 'Plan a romantic getaway for the anniversary', '2024-09-20', '2024-09-22', 1500.00, 2500.00, 'completed', 0, NULL, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-09-01 03:30:00'),
(6, 1, 6, 'Startup Investment', 'Invest in a promising tech startup', '2024-03-01', '2025-03-01', 10000.00, 5000.00, 'active', 1, 60, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-02-01 10:15:00'),
(7, 1, 7, 'Retirement Savings', 'Start saving for retirement', '2024-01-01', '2040-01-01', 100000.00, 30000.00, 'active', 1, 90, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-01-01 04:30:00'),
(8, 1, 8, 'Custom Travel Plan', 'Plan a customized trip to Asia', '2025-05-01', '2025-05-31', 5000.00, 2000.00, 'active', 1, 21, 'mdmokrram500@gmail.com', '+91 9525601041', '2025-04-01 06:00:00'),
(9, 1, 1, 'Garden Renovation', 'Redesign and renovate the backyard garden', '2024-04-01', '2024-06-30', 3000.00, 1000.00, 'active', 0, NULL, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-03-15 02:30:00'),
(10, 1, 2, 'Second Car Savings', 'Save up for purchasing a second car', '2024-08-01', '2025-12-31', 20000.00, 5000.00, 'active', 1, 45, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-07-01 08:30:00'),
(11, 1, 3, 'University Fund', 'Start a fund for children\'s university education', '2024-01-01', '2030-01-01', 25000.00, 8000.00, 'active', 1, 60, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-01-01 04:00:00'),
(12, 1, 4, 'Beach Vacation', 'Plan a relaxing beach vacation with family', '2024-07-15', '2024-07-30', 4000.00, 2000.00, 'completed', 0, NULL, 'mdmokrram500@gmail.com', '+91 9525601041', '2024-07-01 04:30:00');

--
-- Triggers `budget_goals`
--
DELIMITER $$
CREATE TRIGGER `populate_notify_email` BEFORE INSERT ON `budget_goals` FOR EACH ROW BEGIN
    DECLARE user_email VARCHAR(100);
    SELECT email INTO user_email FROM users WHERE id = NEW.user_id;
    SET NEW.notify_email = user_email;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `populate_notify_whatsapp` BEFORE INSERT ON `budget_goals` FOR EACH ROW BEGIN
    DECLARE user_whatsapp VARCHAR(15);
    SELECT whatsapp_number INTO user_whatsapp FROM user_profiles WHERE user_id = NEW.user_id;
    SET NEW.notify_whatsapp = user_whatsapp;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cashflow_forecasts`
--

CREATE TABLE `cashflow_forecasts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cashflow` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `Icon_url` varchar(255) DEFAULT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Icon_url`, `color_code`, `is_default`, `created_at`) VALUES
(1, 'Communication, PC', 'communication_icon.png', '#3498db', 1, '2024-05-16 12:57:50'),
(2, 'Financial Expenses', 'financial_icon.png', '#2ecc71', 1, '2024-05-16 12:57:50'),
(3, 'Food & Drinks', 'food_icon.png', '#e74c3c', 1, '2024-05-16 12:57:50'),
(4, 'Housing', 'housing_icon.png', '#f1c40f', 1, '2024-05-16 12:57:50'),
(5, 'Income', 'income_icon.png', '#9b59b6', 1, '2024-05-16 12:57:50'),
(6, 'Investments', 'investment_icon.png', '#1abc9c', 1, '2024-05-16 12:57:50'),
(7, 'Life & Entertainment', 'life_icon.png', '#e67e22', 1, '2024-05-16 12:57:50'),
(8, 'Others', 'others_icon.png', '#34495e', 1, '2024-05-16 12:57:50'),
(9, 'Shopping', 'shopping_icon.png', '#95a5a6', 1, '2024-05-16 12:57:50'),
(10, 'Transportation', 'transportation_icon.png', '#d35400', 1, '2024-05-16 12:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `collaborations`
--

CREATE TABLE `collaborations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `collaborator_id` int(11) NOT NULL,
  `permission` enum('view','edit') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_rates`
--

CREATE TABLE `currency_exchange_rates` (
  `id` int(11) NOT NULL,
  `base_currency` varchar(10) NOT NULL,
  `target_currency` varchar(10) NOT NULL,
  `exchange_rate` decimal(10,4) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_support`
--

CREATE TABLE `currency_support` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `exchange_rate` decimal(10,4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `category_type` enum('need','want') DEFAULT 'need',
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `amount`, `category_id`, `subcategory_id`, `category_type`, `description`, `date`, `created_at`) VALUES
(23, 2, 200.00, 0, 0, 'need', 'KFC', '2024-04-27', '2024-04-27 17:44:29'),
(29, 2, 8000.00, 0, 0, 'need', 'bs man keya', '2024-04-28', '2024-04-28 18:15:52'),
(99, 1, 5000.00, 2, 16, 'need', ' LIC', '2024-01-11', '2024-05-24 06:18:47'),
(100, 1, 5000.00, 2, 16, 'need', '  LIC', '2024-02-14', '2024-05-24 06:19:17'),
(101, 1, 5211.00, 4, 33, 'want', ' ', '2024-01-26', '2024-05-24 06:19:43'),
(102, 1, 2000.00, 7, 77, 'want', ' ', '2024-03-12', '2024-05-24 06:20:21'),
(103, 1, 7500.00, 3, 26, 'need', ' ', '2024-05-03', '2024-05-24 06:22:16'),
(104, 1, 6000.00, 3, 26, 'need', ' ', '2024-04-15', '2024-05-24 06:22:45'),
(105, 1, 1680.00, 2, 20, 'need', ' Home Tax', '2024-04-18', '2024-05-24 06:23:16'),
(106, 1, 5890.00, 9, 88, 'want', ' For Winter', '2024-06-12', '2024-05-24 06:24:24'),
(107, 1, 5621.00, 10, 105, 'need', ' ', '2024-07-22', '2024-05-24 06:25:11'),
(108, 1, 10000.00, 4, 35, 'need', ' ', '2024-08-20', '2024-05-24 06:25:58'),
(109, 1, 4500.00, 8, 86, 'need', 'PD Course', '2024-09-11', '2024-05-24 06:26:32'),
(110, 1, 15000.00, 9, 95, 'need', ' ', '2024-10-22', '2024-05-24 06:26:56'),
(111, 1, 5622.00, 4, 39, 'need', ' ', '2024-06-20', '2024-05-24 06:27:35'),
(112, 1, 9562.00, 3, 28, 'want', ' Zomato', '2024-07-08', '2024-05-24 06:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `date_received` date NOT NULL,
  `payment_method` enum('cash','credit_card','bank_transfer','paypal','crypto','other') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `recurring` tinyint(1) DEFAULT 0,
  `recurring_interval` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`id`, `user_id`, `amount`, `category_id`, `subcategory_name`, `description`, `date_received`, `payment_method`, `created_at`, `recurring`, `recurring_interval`, `notes`, `updated_at`) VALUES
(20, 1, 15000.00, 5, 54, 'SSM', '2024-01-05', 'cash', '2024-05-24 05:35:52', 1, '12', '', '2024-05-24 05:35:52'),
(21, 1, 5000.00, 5, 45, 'Website', '2024-01-17', 'bank_transfer', '2024-05-24 05:36:35', 0, '', '', '2024-05-24 05:36:35'),
(22, 1, 18560.00, 5, 45, 'Website', '2024-02-05', 'paypal', '2024-05-24 05:37:17', 0, '', '', '2024-05-24 05:37:17'),
(23, 1, 7500.00, 5, 51, 'Subject Name', '2024-02-20', 'cash', '2024-05-24 05:38:46', 1, '11', '', '2024-05-24 05:38:46'),
(24, 1, 2000.00, 5, 44, 'Arman', '2024-03-05', 'cash', '2024-05-24 05:42:36', 0, '', '', '2024-05-24 05:42:36'),
(25, 1, 1680.00, 5, 47, 'HDFC Bank', '2024-03-20', 'bank_transfer', '2024-05-24 05:44:46', 0, '', '', '2024-05-24 05:44:46'),
(26, 1, 3000.00, 5, 44, 'Bonus', '2024-04-05', 'paypal', '2024-05-24 02:30:00', 0, '', '', '2024-05-24 02:30:00'),
(27, 1, 5500.00, 5, 55, 'HDFC Bank', '2024-04-15', 'credit_card', '2024-05-24 02:40:00', 0, '', '', '2024-05-24 02:40:00'),
(28, 1, 12300.00, 5, 45, 'Website', '2024-04-20', 'bank_transfer', '2024-05-24 02:50:00', 1, '3', '', '2024-05-24 02:50:00'),
(29, 1, 9800.00, 5, 43, 'SSM', '2024-04-30', 'cash', '2024-05-24 03:00:00', 0, '', '', '2024-05-24 03:00:00'),
(30, 1, 6000.00, 5, 51, 'Website', '2024-05-05', 'paypal', '2024-05-24 03:10:00', 0, '', '', '2024-05-24 03:10:00'),
(31, 1, 13000.00, 5, 52, 'Subject Name', '2024-05-15', 'cash', '2024-05-24 03:20:00', 1, '6', '', '2024-05-24 03:20:00'),
(32, 1, 7200.00, 5, 50, 'Arman', '2024-05-25', 'bank_transfer', '2024-05-24 03:30:00', 0, '', '', '2024-05-24 03:30:00'),
(33, 1, 2100.00, 5, 46, 'HDFC Bank', '2024-05-30', 'credit_card', '2024-05-24 03:40:00', 0, '', '', '2024-05-24 03:40:00'),
(34, 1, 9200.00, 5, 54, 'SSM', '2024-06-05', 'cash', '2024-05-24 03:50:00', 1, '12', '', '2024-05-24 03:50:00'),
(35, 1, 17000.00, 5, 45, 'Website', '2024-06-15', 'bank_transfer', '2024-05-24 04:00:00', 0, '', '', '2024-05-24 04:00:00'),
(36, 1, 8600.00, 5, 51, 'Subject Name', '2024-06-20', 'paypal', '2024-05-24 04:10:00', 0, '', '', '2024-05-24 04:10:00'),
(37, 1, 11000.00, 5, 44, 'Arman', '2024-06-30', 'cash', '2024-05-24 04:20:00', 0, '', '', '2024-05-24 04:20:00'),
(38, 1, 9500.00, 5, 47, 'HDFC Bank', '2024-07-05', 'credit_card', '2024-05-24 04:30:00', 0, '', '', '2024-05-24 04:30:00'),
(39, 1, 12500.00, 5, 54, 'SSM', '2024-07-15', 'paypal', '2024-05-24 04:40:00', 1, '4', '', '2024-05-24 04:40:00'),
(40, 1, 5300.00, 5, 45, 'Website', '2024-07-25', 'bank_transfer', '2024-05-24 04:50:00', 0, '', '', '2024-05-24 04:50:00'),
(41, 1, 8800.00, 5, 51, 'Subject Name', '2024-07-30', 'cash', '2024-05-24 05:00:00', 0, '', '', '2024-05-24 05:00:00'),
(42, 1, 10200.00, 5, 44, 'Arman', '2024-08-05', 'credit_card', '2024-05-24 05:10:00', 0, '', '', '2024-05-24 05:10:00'),
(43, 1, 15400.00, 5, 47, 'HDFC Bank', '2024-08-15', 'paypal', '2024-05-24 05:20:00', 0, '', '', '2024-05-24 05:20:00'),
(44, 1, 7800.00, 5, 54, 'SSM', '2024-08-25', 'bank_transfer', '2024-05-24 05:30:00', 1, '5', '', '2024-05-24 05:30:00'),
(45, 1, 13500.00, 5, 45, 'Website', '2024-08-30', 'cash', '2024-05-24 05:40:00', 0, '', '', '2024-05-24 05:40:00'),
(46, 1, 11300.00, 5, 51, 'Subject Name', '2024-09-05', 'credit_card', '2024-05-24 05:50:00', 0, '', '', '2024-05-24 05:50:00'),
(47, 1, 14700.00, 5, 44, 'Arman', '2024-09-15', 'paypal', '2024-05-24 06:00:00', 0, '', '', '2024-05-24 06:00:00'),
(48, 1, 9100.00, 5, 47, 'HDFC Bank', '2024-09-25', 'bank_transfer', '2024-05-24 06:10:00', 0, '', '', '2024-05-24 06:10:00'),
(49, 1, 16800.00, 5, 54, 'SSM', '2024-09-30', 'cash', '2024-05-24 06:20:00', 1, '7', '', '2024-05-24 06:20:00'),
(50, 1, 13200.00, 5, 45, 'Website', '2024-10-05', 'credit_card', '2024-05-24 06:30:00', 0, '', '', '2024-05-24 06:30:00'),
(51, 1, 9200.00, 5, 51, 'Subject Name', '2024-10-15', 'paypal', '2024-05-24 06:40:00', 1, '2', '', '2024-05-24 06:40:00'),
(52, 1, 8500.00, 5, 44, 'Arman', '2024-10-25', 'bank_transfer', '2024-05-24 06:50:00', 0, '', '', '2024-05-24 06:50:00'),
(53, 1, 15300.00, 5, 47, 'HDFC Bank', '2024-10-30', 'cash', '2024-05-24 07:00:00', 0, '', '', '2024-05-24 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_access_logs`
--

CREATE TABLE `mobile_access_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `device_type` enum('iOS','Android') NOT NULL,
  `access_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `security_settings`
--

CREATE TABLE `security_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `encryption_key` varchar(255) DEFAULT NULL,
  `two_factor_auth_enabled` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `user_id` int(11) NOT NULL,
  `platform` enum('Facebook','YouTube','Instagram','TikTok','WeChat','Telegram','Snapchat') NOT NULL,
  `profile_link` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `SubcategoryID` int(11) NOT NULL,
  `SubcategoryName` varchar(255) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Icon_url` varchar(255) DEFAULT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`SubcategoryID`, `SubcategoryName`, `CategoryID`, `Icon_url`, `color_code`, `is_default`, `created_at`) VALUES
(1, 'Anti-Virus Software', 1, 'anti_virus_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(2, 'Cloud Storage', 1, 'cloud_storage_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(3, 'Domain, Hosting', 1, 'domain_hosting_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(4, 'Internet', 1, 'internet_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(5, 'Phone, Cell Phone', 1, 'phone_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(6, 'Postal Services', 1, 'postal_services_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(7, 'Software, Apps, Games', 1, 'software_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(8, 'Tech Gadgets', 1, 'tech_gadgets_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(9, 'Advisory', 2, 'advisory_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(10, 'Bank Charges', 2, 'bank_charges_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(11, 'Charges, Fees', 2, 'charges_fees_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(12, 'Child Support', 2, 'child_support_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(13, 'Credit Card Annual Fees', 2, 'credit_card_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(14, 'Fines', 2, 'fines_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(15, 'Financial Planning Services', 2, 'financial_planning_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(16, 'Insurances', 2, 'insurances_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(17, 'Investment Fees', 2, 'investment_fees_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(18, 'Legal Fees', 2, 'legal_fees_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(19, 'Loan, Interests', 2, 'loan_interests_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(20, 'Taxes', 2, 'taxes_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(21, 'Bakeries', 3, 'bakeries_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(22, 'Bar, Cafe', 3, 'bar_cafe_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(23, 'Dining Out', 3, 'dining_out_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(24, 'Farmers Market', 3, 'farmers_market_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(25, 'Food Delivery Services', 3, 'food_delivery_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(26, 'Groceries', 3, 'groceries_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(27, 'Meal Subscriptions', 3, 'meal_subscriptions_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(28, 'Restaurant, Fast Food', 3, 'restaurant_fast_food_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(29, 'Specialty Beverages', 3, 'specialty_beverages_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(30, 'Specialty Foods', 3, 'specialty_foods_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(31, 'Energy, Utilities', 4, 'energy_utilities_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(32, 'Home Cleaning Services', 4, 'home_cleaning_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(33, 'Home Decor', 4, 'home_decor_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(34, 'Home Improvement', 4, 'home_improvement_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(35, 'Home Security', 4, 'home_security_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(36, 'Home Warranty', 4, 'home_warranty_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(37, 'Maintenance, Repairs', 4, 'maintenance_repairs_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(38, 'Mortgage', 4, 'mortgage_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(39, 'Property Insurance', 4, 'property_insurance_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(40, 'Rent', 4, 'rent_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(41, 'Services', 4, 'services_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(42, 'Checks, Coupons', 5, 'checks_coupons_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(43, 'Child Support', 5, 'child_support_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(44, 'Dues & Grants', 5, 'dues_grants_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(45, 'Freelancing', 5, 'freelancing_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(46, 'Gifts', 5, 'gifts_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(47, 'Interests, Dividends', 5, 'interests_dividends_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(48, 'Lending, Renting', 5, 'lending_renting_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(49, 'Lottery, Gambling', 5, 'lottery_gambling_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(50, 'Refunds', 5, 'refunds_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(51, 'Rental Income', 5, 'rental_income_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(52, 'Royalties', 5, 'royalties_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(53, 'Sale', 5, 'sale_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(54, 'Salary', 5, 'salary_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(55, 'Wage, Invoices', 5, 'wage_invoices_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(56, 'Collections', 6, 'collections_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(57, 'Crowdfunding Investments', 6, 'crowdfunding_investments_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(58, 'Financial Investments', 6, 'financial_investments_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(59, 'Precious Metals', 6, 'precious_metals_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(60, 'Realty', 6, 'realty_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(61, 'Retirement Funds', 6, 'retirement_funds_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(62, 'Savings', 6, 'savings_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(63, 'Stocks & Bonds', 6, 'stocks_bonds_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(64, 'Vehicles, Chattels', 6, 'vehicles_chattels_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(65, 'Active Sport, Fitness', 7, 'active_sport_fitness_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(66, 'Alcohol, Tobacco', 7, 'alcohol_tobacco_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(67, 'Books, Audio Books', 7, 'books_audio_books_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(68, 'Charity, Gifts', 7, 'charity_gifts_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(69, 'Concerts & Live Events', 7, 'concerts_live_events_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(70, 'Culture, Sport Events', 7, 'culture_sport_events_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(71, 'Education, Development', 7, 'education_development_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(72, 'Health Care, Doctor', 7, 'health_care_doctor_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(73, 'Hobbies', 7, 'hobbies_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(74, 'Holiday, Trips, Hotels', 7, 'holiday_trips_hotels_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(75, 'Life Events', 7, 'life_events_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(76, 'Lottery, Gambling', 7, 'lottery_gambling_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(77, 'Museums & Exhibitions', 7, 'museums_exhibitions_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(78, 'Online Courses & Workshops', 7, 'online_courses_workshops_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(79, 'Streaming Subscriptions', 7, 'streaming_subscriptions_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(80, 'Theme Parks & Attractions', 7, 'theme_parks_attractions_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(81, 'TV, Streaming', 7, 'tv_streaming_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(82, 'Wellness, Beauty', 7, 'wellness_beauty_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(83, 'Emergency Fund Contributions', 8, 'emergency_fund_contributions_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(84, 'Missing', 8, 'missing_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(85, 'Miscellaneous Expenses', 8, 'miscellaneous_expenses_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(86, 'Personal Development Expenses', 8, 'personal_development_expenses_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(87, 'Unexpected Costs', 8, 'unexpected_costs_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(88, 'Clothes & Shoes', 9, 'clothes_shoes_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(89, 'Drugstore, Chemist', 9, 'drugstore_chemist_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(90, 'Electronics, Accessories', 9, 'electronics_accessories_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(91, 'Free Time', 9, 'free_time_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(92, 'Gifts, Joy', 9, 'gifts_joy_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(93, 'Health and Beauty', 9, 'health_beauty_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(94, 'Home, Garden', 9, 'home_garden_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(95, 'Jewels, Accessories', 9, 'jewels_accessories_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(96, 'Kids', 9, 'kids_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(97, 'Online Marketplaces', 9, 'online_marketplaces_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(98, 'Personal Care Products', 9, 'personal_care_products_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(99, 'Pets, Animals', 9, 'pets_animals_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(100, 'Specialty Stores', 9, 'specialty_stores_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(101, 'Stationery', 9, 'stationery_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(102, 'Vintage & Thrift Stores', 9, 'vintage_thrift_stores_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08'),
(103, 'Bicycle Expenses', 10, 'bicycle_expenses_icon.png', '#e67e22', 1, '2024-05-16 12:58:08'),
(104, 'Business Trips', 10, 'business_trips_icon.png', '#34495e', 1, '2024-05-16 12:58:08'),
(105, 'Long Distance', 10, 'long_distance_icon.png', '#3498db', 1, '2024-05-16 12:58:08'),
(106, 'Public Transport', 10, 'public_transport_icon.png', '#2ecc71', 1, '2024-05-16 12:58:08'),
(107, 'Ride-Sharing Services', 10, 'ride_sharing_icon.png', '#e74c3c', 1, '2024-05-16 12:58:08'),
(108, 'Taxi', 10, 'taxi_icon.png', '#f1c40f', 1, '2024-05-16 12:58:08'),
(109, 'Vehicle Registration Fees', 10, 'vehicle_registration_icon.png', '#9b59b6', 1, '2024-05-16 12:58:08'),
(110, 'Roadside Assistance Memberships', 10, 'roadside_assistance_icon.png', '#1abc9c', 1, '2024-05-16 12:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `tool_integrations`
--

CREATE TABLE `tool_integrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tool_name` varchar(100) NOT NULL,
  `integration_key` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `registration_device` varchar(255) DEFAULT NULL,
  `registration_network` varchar(255) DEFAULT NULL,
  `registration_location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `password`, `date_of_birth`, `country_code`, `mobile_number`, `registration_ip`, `registration_device`, `registration_network`, `registration_location`, `created_at`) VALUES
(1, 'md mokarram', 'superadmin', 'mdmokrram500@gmail.com', '$2y$10$KpcG2vf5n5yQ9MukWTQM3eDqoOOk5DKocVCNd4oyqbgf/QyhYg6Jy', '1998-12-08', '+91', '9525601041', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', NULL, NULL, '2024-04-26 23:36:31'),
(2, 'Archi Prasad', 'archipp', 'prasadarchi@gmail.com', '$2y$10$j6HnyWD9m4XpLQd/n54FVuBAZ6/pp9uKmuTAVqYVptCAa8CIqzaq6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-27 12:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(15) NOT NULL,
  `bio` text DEFAULT NULL,
  `privacy_setting` enum('public','logged_in','private') DEFAULT 'public',
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `theme_preference` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `relationship_status` enum('single','married','in_a_relationship','complicated') DEFAULT 'single',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `education` text DEFAULT NULL,
  `work_experience` text DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `birthplace` varchar(100) DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`user_id`, `profile_picture`, `whatsapp_number`, `bio`, `privacy_setting`, `last_updated`, `theme_preference`, `timezone`, `relationship_status`, `address`, `city`, `state`, `country`, `zip_code`, `education`, `work_experience`, `website`, `languages`, `birthplace`, `current_location`) VALUES
(1, 'my pic 320.jpg', '+91 9525601041', 'Web designer with over 10 years of experience in the industry.', 'public', '2024-05-23 21:17:16', 'dark', 'GMT+5:30', 'single', 'Doranda Darzee Mohalla', 'Ranchi', 'Jharkhand', 'India', '834002', 'B.tech', 'Software Engineer at FTM Company', 'https://www.example.com', 'English', 'Ranchi', 'Assam, India');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bank_integrations`
--
ALTER TABLE `bank_integrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `integration_key` (`integration_key`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `budget_categories`
--
ALTER TABLE `budget_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_categories_custom_goal`
--
ALTER TABLE `budget_categories_custom_goal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_goals`
--
ALTER TABLE `budget_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `cashflow_forecasts`
--
ALTER TABLE `cashflow_forecasts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `collaborations`
--
ALTER TABLE `collaborations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `collaborator_id` (`collaborator_id`);

--
-- Indexes for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_currency` (`base_currency`,`target_currency`);

--
-- Indexes for table `currency_support`
--
ALTER TABLE `currency_support`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `mobile_access_logs`
--
ALTER TABLE `mobile_access_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `security_settings`
--
ALTER TABLE `security_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`user_id`,`platform`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`SubcategoryID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `tool_integrations`
--
ALTER TABLE `tool_integrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`tool_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_integrations`
--
ALTER TABLE `bank_integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `budget_categories`
--
ALTER TABLE `budget_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `budget_categories_custom_goal`
--
ALTER TABLE `budget_categories_custom_goal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `budget_goals`
--
ALTER TABLE `budget_goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cashflow_forecasts`
--
ALTER TABLE `cashflow_forecasts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `collaborations`
--
ALTER TABLE `collaborations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_support`
--
ALTER TABLE `currency_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `mobile_access_logs`
--
ALTER TABLE `mobile_access_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `security_settings`
--
ALTER TABLE `security_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `SubcategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `tool_integrations`
--
ALTER TABLE `tool_integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bank_integrations`
--
ALTER TABLE `bank_integrations`
  ADD CONSTRAINT `bank_integrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `budgets`
--
ALTER TABLE `budgets`
  ADD CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `budget_goals`
--
ALTER TABLE `budget_goals`
  ADD CONSTRAINT `budget_goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `budget_goals_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `budget_categories` (`id`);

--
-- Constraints for table `cashflow_forecasts`
--
ALTER TABLE `cashflow_forecasts`
  ADD CONSTRAINT `cashflow_forecasts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collaborations`
--
ALTER TABLE `collaborations`
  ADD CONSTRAINT `collaborations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collaborations_ibfk_2` FOREIGN KEY (`collaborator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_support`
--
ALTER TABLE `currency_support`
  ADD CONSTRAINT `currency_support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `fk_income_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_income_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mobile_access_logs`
--
ALTER TABLE `mobile_access_logs`
  ADD CONSTRAINT `mobile_access_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `security_settings`
--
ALTER TABLE `security_settings`
  ADD CONSTRAINT `security_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_media`
--
ALTER TABLE `social_media`
  ADD CONSTRAINT `social_media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_profiles` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Constraints for table `tool_integrations`
--
ALTER TABLE `tool_integrations`
  ADD CONSTRAINT `tool_integrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
