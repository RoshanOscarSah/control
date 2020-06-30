-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 05:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `control`
--
CREATE DATABASE IF NOT EXISTS `control` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `control`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add profiles', 7, 'add_profiles'),
(26, 'Can change profiles', 7, 'change_profiles'),
(27, 'Can delete profiles', 7, 'delete_profiles'),
(28, 'Can view profiles', 7, 'view_profiles'),
(29, 'Can add recovery_keys', 8, 'add_recovery_keys'),
(30, 'Can change recovery_keys', 8, 'change_recovery_keys'),
(31, 'Can delete recovery_keys', 8, 'delete_recovery_keys'),
(32, 'Can view recovery_keys', 8, 'view_recovery_keys'),
(33, 'Can add song', 9, 'add_song'),
(34, 'Can change song', 9, 'change_song'),
(35, 'Can delete song', 9, 'delete_song'),
(36, 'Can view song', 9, 'view_song'),
(37, 'Can add songs', 10, 'add_songs'),
(38, 'Can change songs', 10, 'change_songs'),
(39, 'Can delete songs', 10, 'delete_songs'),
(40, 'Can view songs', 10, 'view_songs'),
(41, 'Can add metadata', 9, 'add_metadata'),
(42, 'Can change metadata', 9, 'change_metadata'),
(43, 'Can delete metadata', 9, 'delete_metadata'),
(44, 'Can view metadata', 9, 'view_metadata'),
(45, 'Can add song', 10, 'add_song'),
(46, 'Can change song', 10, 'change_song'),
(47, 'Can delete song', 10, 'delete_song'),
(48, 'Can view song', 10, 'view_song'),
(49, 'Can add case', 11, 'add_case'),
(50, 'Can change case', 11, 'change_case'),
(51, 'Can delete case', 11, 'delete_case'),
(52, 'Can view case', 11, 'view_case'),
(53, 'Can add case file', 12, 'add_casefile'),
(54, 'Can change case file', 12, 'change_casefile'),
(55, 'Can delete case file', 12, 'delete_casefile'),
(56, 'Can view case file', 12, 'view_casefile'),
(57, 'Can add album', 13, 'add_album'),
(58, 'Can change album', 13, 'change_album'),
(59, 'Can delete album', 13, 'delete_album'),
(60, 'Can view album', 13, 'view_album'),
(61, 'Can add albums', 13, 'add_albums'),
(62, 'Can change albums', 13, 'change_albums'),
(63, 'Can delete albums', 13, 'delete_albums'),
(64, 'Can view albums', 13, 'view_albums'),
(65, 'Can add artist', 14, 'add_artist'),
(66, 'Can change artist', 14, 'change_artist'),
(67, 'Can delete artist', 14, 'delete_artist'),
(68, 'Can view artist', 14, 'view_artist'),
(69, 'Can add search', 15, 'add_search'),
(70, 'Can change search', 15, 'change_search'),
(71, 'Can delete search', 15, 'delete_search'),
(72, 'Can view search', 15, 'view_search'),
(73, 'Can add artist_search', 15, 'add_artist_search'),
(74, 'Can change artist_search', 15, 'change_artist_search'),
(75, 'Can delete artist_search', 15, 'delete_artist_search'),
(76, 'Can view artist_search', 15, 'view_artist_search'),
(77, 'Can add model with image', 16, 'add_modelwithimage'),
(78, 'Can change model with image', 16, 'change_modelwithimage'),
(79, 'Can delete model with image', 16, 'delete_modelwithimage'),
(80, 'Can view model with image', 16, 'view_modelwithimage'),
(81, 'Can add library', 17, 'add_library'),
(82, 'Can change library', 17, 'change_library'),
(83, 'Can delete library', 17, 'delete_library'),
(84, 'Can view library', 17, 'view_library'),
(85, 'Can add recent', 18, 'add_recent'),
(86, 'Can change recent', 18, 'change_recent'),
(87, 'Can delete recent', 18, 'delete_recent'),
(88, 'Can view recent', 18, 'view_recent'),
(89, 'Can add playlist', 19, 'add_playlist'),
(90, 'Can change playlist', 19, 'change_playlist'),
(91, 'Can delete playlist', 19, 'delete_playlist'),
(92, 'Can view playlist', 19, 'view_playlist');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$180000$vnPofY1VS3My$vLQZnciDDDmms8OnAu9CBZ/lN0i2cQgFo9qOCt4WTCI=', NULL, 0, 'deguxi', 'Christen Collins', 'Janna Vega', 'mafa@mailinator.com', 0, 1, '2020-04-15 06:21:46.904534'),
(3, 'pbkdf2_sha256$180000$Ev6Gcv7g9ZiJ$K+l7qjM63qUHsAhe3U65qyRyKJ864Qog597AlH+UlZQ=', NULL, 0, 'cegonedyq', 'Melodie Velazquez', 'Lynn Duncan', 'libadepi@mailinator.com', 0, 1, '2020-04-15 06:23:09.510497'),
(5, 'pbkdf2_sha256$180000$Ha9o58qe7yfr$/njLY7urS/R80A8FPqiwI/VelmOIRlQwP752nXjaFvg=', NULL, 0, 'zexyqyci', 'Sophia Kramer', 'Cheyenne Pruitt', 'wununubype@mailinator.net', 0, 1, '2020-04-16 03:17:37.926231'),
(6, 'pbkdf2_sha256$180000$x5HpHBcawuyM$IF1Gwu7gVOgINnX9q0sEkjueg8jhXyKLKPRs/WDrjQE=', NULL, 0, 'jexufoqesu', 'Hop Bryan', 'Zeph Ellison', 'bicyjyxo@mailinator.com', 0, 1, '2020-04-16 03:23:16.311554'),
(7, 'pbkdf2_sha256$180000$kBSRK7IsCIEC$qE2QWw0rsMWlf2sBHjxGh0FDr3oO94hW4QwadzzQSMc=', NULL, 0, 'paxawilic', 'Marsden Clemons', 'Lee Vazquez', 'vuzaqovef@mailinator.com', 0, 1, '2020-04-16 03:23:43.859397'),
(8, 'pbkdf2_sha256$180000$SheqaMi8WWgq$o5DJl3OkJhacp0rQRnTQCbZKQNU9Y6e1oosrFicKs9E=', NULL, 0, 'siqymiwi', 'Fiona Chavez', 'Kathleen Tyler', 'bewa@mailinator.com', 0, 1, '2020-04-16 03:24:04.161815'),
(9, 'pbkdf2_sha256$180000$0pV5NuN85eOP$T1r6Uy3iEksuWpXQQjP3WwREGo09orjfaL25U5W+I/s=', NULL, 0, 'balodyvygo', 'Winifred Baird', 'Thor Cotton', 'xypuf@mailinator.com', 0, 1, '2020-04-16 03:43:22.260920'),
(10, 'pbkdf2_sha256$180000$XvKrQnSvzwnD$T5G5Ze2gay1d35anOwra4KZkZjaVI6PxQYTbn3SAaCE=', NULL, 0, 'qunugoha', 'Dorian Wright', 'Joseph Gonzalez', 'xavacehi@mailinator.com', 0, 1, '2020-04-16 03:51:24.491289'),
(11, 'pbkdf2_sha256$180000$9j4tAQFRlKh9$wShN+ppyO3qI1H0Lh6GcdLJ4IJXxKYcJZ+ivpu34eSs=', NULL, 0, 'sozerocy', 'Hayden Vang', 'Cain Walters', 'cojabugaly@mailinator.net', 0, 1, '2020-04-16 03:54:24.764995'),
(12, 'pbkdf2_sha256$180000$xDFj3aCaeudj$alWQv/f1gy0wECsPqRyHEog1DnXhLQGLc8Ee1cEmflE=', NULL, 0, 'micykur', 'Kiayada Miles', 'Beau Bishop', 'syhejozefi@mailinator.net', 0, 1, '2020-04-16 03:55:21.166061'),
(13, 'pbkdf2_sha256$180000$1I9CQUM04RZT$IrWuBvCnmpvgWl5saUi0LPk4ksODbwsQ2Go4x+465+I=', NULL, 0, 'nizepudu', 'Montana Donaldson', 'Iola Boyd', 'qoto@mailinator.net', 0, 1, '2020-04-16 10:06:33.429592'),
(14, 'pbkdf2_sha256$180000$hfFJJ5D07Vyb$LlOcAXyZ8Kc5ZWr7zYGVuyE2IlKDWHspyw1EYh+ek5Y=', NULL, 0, 'wisud', 'Sophia Jordan', 'Yeo Parks', 'zovywohym@mailinator.net', 0, 1, '2020-04-16 10:13:17.583674'),
(15, 'pbkdf2_sha256$180000$Muqarpinar3T$Sr0LZnPoC+tZo1UTqQ06B4PG4J5ZOBJgXv0VajkUsj8=', '2020-04-22 12:29:47.978749', 1, 'admin', '', '', 'RoshanSah729@gmail.com', 1, 1, '2020-04-17 01:41:41.071743'),
(16, 'pbkdf2_sha256$180000$rlkT10zExoTx$F82IjpRKpvAVfW1HNgH+9yjNevb8ypWMU9RkynV88/Q=', NULL, 0, 'qybifyhoz', 'Tiger Ayers', 'Shafira Cochran', 'myhi@mailinator.com', 0, 1, '2020-04-20 09:04:22.346902'),
(17, 'pbkdf2_sha256$180000$QAsyNcY8LKFh$/1k5REYr8O6GYZVg0th43Z6OW2m93dV1cRfm5CKM0XQ=', NULL, 0, 'bezubuqira', 'Serina Pruitt', 'Callum Macdonald', 'pydibovyju@mailinator.com', 0, 1, '2020-04-20 09:04:37.893978'),
(18, 'pbkdf2_sha256$180000$jzrpXDBwDUud$6TgMFefZHEz7q9vbgE4n2j3HVUI1udJmpXaK1ZWg6Bs=', NULL, 0, 'bikow', 'Wesley Briggs', 'Axel Massey', 'bely@mailinator.com', 0, 1, '2020-04-20 09:04:50.483331'),
(19, 'pbkdf2_sha256$180000$tcJnpKkfIut0$i9cdJQ9V/EacZkHwphdwdPquGXqbN0ITOEc1Md9aLm4=', NULL, 0, 'gycudusyf', 'Lesley Rocha', 'Karly Carey', 'pofadodof@mailinator.com', 0, 1, '2020-04-20 09:05:31.565810'),
(20, 'pbkdf2_sha256$180000$AYGV44GZbzdg$evPVu5kEj/4J97nGkD/o76kfU5hKPAkuoTicOColSao=', NULL, 0, 'loqybiheh', 'Regan Morgan', 'Bree Greene', 'mosygetyz@mailinator.net', 0, 1, '2020-04-20 09:05:43.249979'),
(21, 'pbkdf2_sha256$180000$i2A8ThGbNdOW$u90vdAihOxIxiuLr5iuxFLmnDzmli5MQkbWmRyiBrho=', NULL, 0, 'qufygof', 'Gretchen Lott', 'Ulla Nicholson', 'zefuxylufo@mailinator.net', 0, 1, '2020-04-20 09:06:17.953695'),
(22, 'pbkdf2_sha256$180000$b8kAuWas5OD2$7RmgkxTVz4e00TOSQBDzOFeOmkEmDQxQSIqxoS/+1fY=', NULL, 0, 'qizyhatu', 'Stone Waller', 'India Rosa', 'xugewemeda@mailinator.net', 0, 1, '2020-04-20 09:06:37.787699'),
(23, 'pbkdf2_sha256$180000$1o5FfQ5CV4ZH$jJ6ISfwxPtdx3i10NqqqOWl20V0VDTTUq54ct+movxY=', NULL, 0, 'fejil', 'Lucius Jackson', 'Jescie Chapman', 'kyto@mailinator.net', 0, 1, '2020-04-20 09:08:46.676852'),
(24, 'pbkdf2_sha256$180000$m2TxbfLePJsN$RzsyLaeczS/V8xTHmo+6VfJaNh5+S1BtzoSFf2QVDhE=', NULL, 0, 'hivirumyv', 'Josiah Bender', 'Lesley Gomez', 'gizufac@mailinator.com', 0, 1, '2020-04-20 09:08:58.685398'),
(25, 'pbkdf2_sha256$180000$2eLB3kiqOOKY$UocxCc/X6HmELHbIqsGKNiOhhpXdj28c0zCTATvtYCM=', '2020-05-03 16:45:59.868839', 0, 'aa', 'aa', 'aa', 'aa@mail.com', 0, 1, '2020-04-20 09:09:30.696370'),
(26, 'pbkdf2_sha256$180000$rzM0ZT8VVnBD$TyXMjvT53L0w3Go7E0zycbgECv99TRhcy7n4/vHs41A=', '2020-04-22 14:12:41.017688', 0, 'bb', 'Hoyt David', 'Lani Carroll', 'xogivak@mailinator.com', 0, 1, '2020-04-22 12:30:24.408225');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-04-17 02:44:50.485841', '1', 'song object (1)', 1, '[{\"added\": {}}]', 9, 15),
(2, '2020-04-17 02:57:58.588370', '1', 'songs object (1)', 1, '[{\"added\": {}}]', 10, 15),
(3, '2020-04-17 02:59:46.048342', '2', 'songs object (2)', 1, '[{\"added\": {}}]', 10, 15),
(4, '2020-04-17 03:00:26.265319', '1', 'songs object (1)', 3, '', 10, 15),
(5, '2020-04-17 04:02:37.479153', '4', 'song object (4)', 1, '[{\"added\": {}}]', 10, 15),
(6, '2020-04-17 04:10:30.266911', '6', 'song object (6)', 1, '[{\"added\": {}}]', 10, 15),
(7, '2020-04-17 08:20:19.621290', '7', 'song object (7)', 1, '[{\"added\": {}}]', 10, 15),
(8, '2020-04-17 15:13:08.818757', '10', 'song object (10)', 1, '[{\"added\": {}}]', 10, 15),
(9, '2020-04-18 02:01:28.891586', '10', 'song object (10)', 3, '', 10, 15),
(10, '2020-04-18 02:01:28.980571', '7', 'song object (7)', 3, '', 10, 15),
(11, '2020-04-18 02:01:29.049562', '6', 'song object (6)', 3, '', 10, 15),
(12, '2020-04-18 02:01:29.125548', '4', 'song object (4)', 3, '', 10, 15),
(13, '2020-04-18 02:01:29.513488', '2', 'song object (2)', 3, '', 10, 15),
(14, '2020-04-18 07:33:37.263196', '39', 'Et voluptas architecto quibusdam nostrum est omnis', 1, '[{\"added\": {}}]', 9, 15),
(15, '2020-04-18 07:35:57.207735', '41', 'Sint aperiam a sint in ut impedit vero amet in d', 1, '[{\"added\": {}}]', 9, 15),
(16, '2020-04-18 07:37:30.156935', '42', 'Qui in omnis ex veniam inventore', 1, '[{\"added\": {}}]', 9, 15),
(17, '2020-04-18 07:38:21.018430', '42', 'Qui in omnis ex veniam inventore', 3, '', 9, 15),
(18, '2020-04-18 07:38:21.114397', '41', 'Sint aperiam a sint in ut impedit vero amet in d', 3, '', 9, 15),
(19, '2020-04-18 07:38:21.292384', '40', '7 Days', 3, '', 9, 15),
(20, '2020-04-18 07:38:21.413424', '39', 'Et voluptas architecto quibusdam nostrum est omnis', 3, '', 9, 15),
(21, '2020-04-18 07:38:21.478355', '38', 'Here Without You', 3, '', 9, 15),
(22, '2020-04-18 07:38:21.583325', '37', '(Everything I Do) I Do It For You', 3, '', 9, 15),
(23, '2020-04-18 08:43:25.632525', '62', 'Nemo culpa labore enim nesciunt molestias invento', 1, '[{\"added\": {}}]', 9, 15),
(24, '2020-04-18 08:58:10.969860', '63', 'Ut ut non voluptas dicta quo aliqua Expedita volu', 1, '[{\"added\": {}}]', 9, 15),
(25, '2020-04-18 09:00:57.100419', '64', 'Labore est ipsa est laudantium sed', 1, '[{\"added\": {}}]', 9, 15),
(26, '2020-04-20 03:51:17.844196', '13', 'Maroon 5', 2, '[{\"changed\": {\"fields\": [\"Artist image\"]}}]', 14, 15),
(27, '2020-04-20 03:56:40.692182', '10', 'Anne-Marie', 2, '[{\"changed\": {\"fields\": [\"Artist image\"]}}]', 14, 15);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(13, 'music', 'albums'),
(14, 'music', 'artist'),
(15, 'music', 'artist_search'),
(11, 'music', 'case'),
(12, 'music', 'casefile'),
(17, 'music', 'library'),
(9, 'music', 'metadata'),
(16, 'music', 'modelwithimage'),
(19, 'music', 'playlist'),
(7, 'music', 'profiles'),
(18, 'music', 'recent'),
(8, 'music', 'recovery_keys'),
(10, 'music', 'song'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-04-14 12:01:32.495928'),
(2, 'auth', '0001_initial', '2020-04-14 12:01:34.488617'),
(3, 'admin', '0001_initial', '2020-04-14 12:01:43.993118'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-04-14 12:01:46.466729'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-14 12:01:46.568713'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-04-14 12:01:47.359608'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-04-14 12:01:48.365431'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-04-14 12:01:48.538403'),
(9, 'auth', '0004_alter_user_username_opts', '2020-04-14 12:01:48.588395'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-04-14 12:01:49.434926'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-04-14 12:01:49.469921'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-04-14 12:01:49.546929'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-04-14 12:01:49.681888'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-04-14 12:01:49.903013'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-04-14 12:01:50.069899'),
(16, 'auth', '0011_update_proxy_permissions', '2020-04-14 12:01:50.132890'),
(17, 'sessions', '0001_initial', '2020-04-14 12:01:50.678150'),
(18, 'music', '0001_initial', '2020-04-15 06:18:46.999743'),
(19, 'music', '0002_recovery_keys', '2020-04-15 07:05:40.754308'),
(20, 'music', '0003_profiles_gender', '2020-04-16 03:10:57.468694'),
(21, 'music', '0004_song', '2020-04-17 02:39:02.264378'),
(22, 'music', '0005_auto_20200417_0841', '2020-04-17 02:56:58.605375'),
(23, 'music', '0006_auto_20200417_0851', '2020-04-17 03:06:49.329237'),
(24, 'music', '0007_case_casefile', '2020-04-17 03:37:16.391617'),
(25, 'music', '0008_auto_20200417_0925', '2020-04-17 03:40:34.704980'),
(26, 'music', '0009_case_casefile', '2020-04-17 07:59:28.900784'),
(27, 'music', '0010_auto_20200417_1346', '2020-04-17 08:01:39.856764'),
(28, 'music', '0011_song_title', '2020-04-17 14:48:51.640595'),
(29, 'music', '0012_remove_song_title', '2020-04-17 15:12:53.698585'),
(30, 'music', '0013_auto_20200418_0851', '2020-04-18 03:06:36.787943'),
(31, 'music', '0014_delete_song', '2020-04-18 03:09:09.272174'),
(32, 'music', '0015_metadata_file', '2020-04-18 03:10:05.922017'),
(33, 'music', '0016_auto_20200418_0920', '2020-04-18 03:35:54.218819'),
(34, 'music', '0017_auto_20200418_0922', '2020-04-18 03:37:25.788239'),
(35, 'music', '0018_auto_20200418_0925', '2020-04-18 03:40:45.206927'),
(36, 'music', '0019_auto_20200418_0929', '2020-04-18 03:44:40.479091'),
(37, 'music', '0020_auto_20200418_0933', '2020-04-18 03:48:36.193408'),
(38, 'music', '0021_auto_20200418_0955', '2020-04-18 04:10:34.842950'),
(39, 'music', '0022_metadata_track_total', '2020-04-18 05:10:17.575511'),
(40, 'music', '0023_auto_20200418_1250', '2020-04-18 07:05:16.616012'),
(41, 'music', '0024_auto_20200418_1256', '2020-04-18 07:11:15.543546'),
(42, 'music', '0025_auto_20200418_1314', '2020-04-18 07:29:10.030211'),
(43, 'music', '0026_remove_metadata_audio_offset', '2020-04-18 07:29:51.498865'),
(44, 'music', '0027_auto_20200418_1320', '2020-04-18 07:35:16.653226'),
(45, 'music', '0028_auto_20200418_1321', '2020-04-18 07:36:52.628695'),
(46, 'music', '0029_auto_20200418_1424', '2020-04-18 08:40:02.929687'),
(47, 'music', '0030_auto_20200418_1442', '2020-04-18 08:57:54.250094'),
(48, 'music', '0031_auto_20200418_1516', '2020-04-18 09:31:24.741088'),
(49, 'music', '0032_album', '2020-04-19 02:48:16.993000'),
(50, 'music', '0033_auto_20200419_0857', '2020-04-19 03:12:32.717508'),
(51, 'music', '0034_albums_year', '2020-04-19 12:46:53.270838'),
(52, 'music', '0035_albums_date_modified', '2020-04-19 14:29:59.669349'),
(53, 'music', '0036_artist', '2020-04-19 14:39:01.156567'),
(54, 'music', '0037_artist_artist_image', '2020-04-19 14:58:05.652526'),
(55, 'music', '0038_auto_20200420_0940', '2020-04-20 03:55:16.409716'),
(56, 'music', '0039_search', '2020-04-20 04:08:30.752846'),
(57, 'music', '0040_auto_20200420_0953', '2020-04-20 04:08:59.040410'),
(58, 'music', '0041_modelwithimage', '2020-04-20 05:31:06.779838'),
(59, 'music', '0042_auto_20200420_1123', '2020-04-20 05:39:13.959831'),
(60, 'music', '0043_delete_modelwithimage', '2020-04-20 05:42:32.279271'),
(61, 'music', '0044_artist_artist_img_original', '2020-04-20 07:08:25.823325'),
(62, 'music', '0045_auto_20200420_2004', '2020-04-20 14:19:44.247963'),
(63, 'music', '0046_auto_20200420_2018', '2020-04-20 14:33:54.721242'),
(64, 'music', '0047_metadata_total_played', '2020-04-20 14:55:30.564682'),
(65, 'music', '0048_auto_20200420_2105', '2020-04-20 15:20:30.100268'),
(66, 'music', '0049_auto_20200421_0958', '2020-04-21 04:13:35.428347'),
(67, 'music', '0050_auto_20200421_1847', '2020-04-21 13:02:29.444254'),
(68, 'music', '0051_auto_20200421_1904', '2020-04-21 13:20:02.475067'),
(69, 'music', '0052_auto_20200421_1909', '2020-04-21 13:24:57.595062'),
(70, 'music', '0053_auto_20200421_1935', '2020-04-21 13:50:27.695572'),
(71, 'music', '0054_auto_20200422_0944', '2020-04-22 03:59:58.597413'),
(72, 'music', '0055_auto_20200422_0947', '2020-04-22 04:02:35.946024'),
(73, 'music', '0056_auto_20200422_1916', '2020-04-22 13:42:38.546576'),
(74, 'music', '0057_auto_20200422_1918', '2020-04-22 13:42:38.606567'),
(75, 'music', '0058_auto_20200422_1920', '2020-04-22 13:42:38.633561'),
(76, 'music', '0059_auto_20200422_1926', '2020-04-22 13:42:38.699573'),
(77, 'music', '0060_auto_20200422_1928', '2020-04-22 13:44:25.544273'),
(78, 'music', '0061_auto_20200422_1931', '2020-04-22 13:48:11.624351'),
(79, 'music', '0062_delete_library', '2020-04-22 13:49:50.785362'),
(80, 'music', '0063_library', '2020-04-22 13:50:28.582406'),
(81, 'music', '0064_recent', '2020-04-22 14:18:30.320697'),
(82, 'music', '0065_auto_20200422_2007', '2020-04-22 14:22:19.078039'),
(83, 'music', '0066_auto_20200422_2043', '2020-04-22 14:59:34.216129'),
(84, 'music', '0067_auto_20200422_2043', '2020-04-22 14:59:34.263018'),
(85, 'music', '0068_auto_20200422_2044', '2020-04-22 14:59:34.325518'),
(86, 'music', '0069_delete_recent', '2020-04-22 15:01:07.336862'),
(87, 'music', '0070_recent', '2020-04-22 15:01:42.404516'),
(88, 'music', '0071_playlist', '2020-04-23 15:28:44.978555');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('54uyqq1993dl4kvzlhwcsi4rhs4ukp8o', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:05:14.228174'),
('5is5nmcqorzvz06kvtfgvt52lsazp89x', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:05:13.574336'),
('9drsgg9w5uegi6d5nzdtsnnpo8xczqbq', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:05:13.768247'),
('ar9ok0yjid93o9izio3x86jjdfxq02hx', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:05:13.987213'),
('de8khx9154rsladrccin0lfebx1cbheb', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:21:59.119593'),
('dnlqppdydkcieq93s4mh5zdka769y19f', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:17:23.699090'),
('f4cqzr62jh659sji1htcdnuxjhu0jk2v', 'ZWE2ODgwOTdiMjQ1M2VkODU0ZTlhYzk1ZmI3ZmM3ZjZkMTcyZmE1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMzkxYjMyYWIxMGNjOTNkOGRjNGZmZjQzODAxMTdkYzE5YWNiYjMyIn0=', '2020-04-28 12:24:52.161108'),
('jm1imgwaub6ifsbzvytuhej5j9gmjeas', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:17:23.634167'),
('lcgnb5hlta6j4igjmvhaop55hk840oh4', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:14:03.970313'),
('ngmsyckhamgbt3afnzxsdx7hqsukpsh0', 'ZWM0NzhhOTcxODAyY2ZlMmEyMGRiODcwZmQ3ZjVjZGZmYzRhZTRiZDp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk2OGJiMDIwZTJjMjEzYzBkOTU2ZWM4ZjIzY2Q5ZjUyY2VhOTAyNCJ9', '2020-05-07 06:34:20.710147'),
('o2dpj7zi9t6ujldza87c4wxdkwrfz02e', 'ZWM0NzhhOTcxODAyY2ZlMmEyMGRiODcwZmQ3ZjVjZGZmYzRhZTRiZDp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk2OGJiMDIwZTJjMjEzYzBkOTU2ZWM4ZjIzY2Q5ZjUyY2VhOTAyNCJ9', '2020-05-07 06:46:51.256436'),
('oz80y978ei4uadtvz1w7ps6ftjm83guu', 'ZWE2ODgwOTdiMjQ1M2VkODU0ZTlhYzk1ZmI3ZmM3ZjZkMTcyZmE1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMzkxYjMyYWIxMGNjOTNkOGRjNGZmZjQzODAxMTdkYzE5YWNiYjMyIn0=', '2020-04-28 12:50:37.099815'),
('qgejdht6qz4vr4q5nv11mlckry7dy9ze', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:09:37.212627'),
('t16z2xytu1xsf6ayljn6kx3fy6urm52b', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:17:23.246036'),
('tmhq7hxnmte9855iyhoyy42lx9qxwn5k', 'ZWM0NzhhOTcxODAyY2ZlMmEyMGRiODcwZmQ3ZjVjZGZmYzRhZTRiZDp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDk2OGJiMDIwZTJjMjEzYzBkOTU2ZWM4ZjIzY2Q5ZjUyY2VhOTAyNCJ9', '2020-05-17 16:45:59.941811'),
('wois7zhajxhcubxt5n6ayrp2l66ul63o', 'YWEyODJlNzA4ZGVkMDI1Njg1NGJlZjNjYjJkMDEwZjkxMzMxYzg5NDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjAsXCJsb2dnZWQgb3V0IHN1Y2Nlc3NmdWxseVwiXV0ifQ==', '2020-04-28 13:09:37.295796');

-- --------------------------------------------------------

--
-- Table structure for table `music_albums`
--

CREATE TABLE `music_albums` (
  `id` int(11) NOT NULL,
  `artwork_name` varchar(100) DEFAULT NULL,
  `album` varchar(50) DEFAULT NULL,
  `album_artist` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `date_modified` date NOT NULL,
  `total_played` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_albums`
--

INSERT INTO `music_albums` (`id`, `artwork_name`, `album`, `album_artist`, `year`, `date_modified`, `total_played`) VALUES
(93, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_565.jpg', 'Waking Up the Neighbours', 'Bryan Adams', '1991', '2020-04-20', 55),
(94, 'ArianaGrande_DangerousWoman_Everyday_667.jpg', 'Dangerous Woman', 'Ariana Grande', '2016', '2020-04-20', 12),
(95, 'None_AHeadFullofDreams_AmazingDay_514.jpg', 'A Head Full of Dreams', 'None', '2015', '2020-04-20', 3),
(97, 'MachineGunKelly_BadThings-Single_BadThings_712.jpg', 'Bad Things - Single', 'Machine Gun Kelly', '2016', '2020-04-20', 1),
(98, 'JustinBieber_10,000Hours_10,000Hours_949.jpg', '10,000 Hours', 'Justin Bieber', '2019', '2020-04-20', 0),
(99, 'Coldplay_ARushofBloodtotheHead_Amsterdam_316.jpg', 'A Rush of Blood to the Head', 'Coldplay', '2002', '2020-04-20', 5),
(100, 'TaylorSwift_Reputation_Don\'tBlameMe_19.jpg', 'Reputation', 'Taylor Swift', '2017', '2020-04-20', 4),
(101, 'AlessiaCara_ThePainsofGrowing_7Days_598.jpg', 'The Pains of Growing', 'Alessia Cara', '2018', '2020-04-20', NULL),
(102, 'K\'naan_Troubadour_WavinFlag(Coca-ColaCelebration)_430.jpg', 'Troubadour', 'K\'naan', '2009', '2020-04-20', 8),
(103, 'None_24KMagic_24KMagic_721.jpg', '24K Magic', 'None', '2016', '2020-04-20', 56),
(104, 'JohnLegend_LoveintheFuture_AllofMe_982.jpg', 'Love in the Future', 'John Legend', '2013', '2020-04-20', 6),
(105, 'AlessiaCara_Everybody_1-800-273-8255ft.Logic,Khalid_628.jpg', 'Everybody', 'Alessia Cara', '2017', '2020-04-20', 75),
(106, '3DoorsDown_AwayFromTheSun_HereWithoutYou_886.jpg', 'Away From The Sun', '3 Doors Down', '2002', '2020-04-20', 33),
(107, 'None_VivaLaVida(Prospekt\'sMarchEdition)_42_49.jpg', 'Viva La Vida (Prospekt\'s March Edition)', 'None', '2008', '2020-04-20', NULL),
(108, 'Anne-Marie_SpeakYourMind_2002_805.jpg', 'Speak Your Mind', 'Anne-Marie', '2018', '2020-04-20', NULL),
(109, 'Coldplay_MyloXyloto_AHopefulTransmission_901.jpg', 'Mylo Xyloto', 'Coldplay', '2011', '2020-04-20', NULL),
(110, 'CarlyRaeJepsen_Kiss_CallMeMaybe_250.jpg', 'Kiss', 'Carly Rae Jepsen', '2013', '2020-04-20', NULL),
(111, 'EdSheeran_Divide(DeluxeEdition)_CastleOnTheHill_544.jpg', 'Divide (Deluxe Edition)', 'Ed Sheeran', '2017', '2020-04-20', NULL),
(112, 'None_OneMoreLight_BattleSymphony_196.jpg', 'One More Light', 'None', '2017', '2020-04-20', NULL),
(113, 'ADELE_19(DeluxeEdition)_BestforLast_247.jpg', '19 (Deluxe Edition)', 'ADELE', '2008', '2020-04-20', NULL),
(114, 'ChrisBrown_Royality_Backtosleep_115.jpg', 'Royality', 'Chris Brown', '2007', '2020-04-20', NULL),
(115, 'BebeRexha_AllYourFault:Pt.2_TheWayIAre(DancewithSomebody)[feat.LilWayne]_79.jpg', 'All Your Fault: Pt. 2', 'Bebe Rexha', '2017', '2020-04-21', NULL),
(116, 'LinkinPark_LivingThings_CastleofGlass_760.jpg', 'Living Things', 'Linkin Park', '2012', '2020-04-23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `music_artist`
--

CREATE TABLE `music_artist` (
  `id` int(11) NOT NULL,
  `artist_name` varchar(50) DEFAULT NULL,
  `date_modified` date NOT NULL,
  `artist_image` varchar(100) NOT NULL,
  `artist_img_original` varchar(100) DEFAULT NULL,
  `total_album` varchar(50) DEFAULT NULL,
  `total_played` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_artist`
--

INSERT INTO `music_artist` (`id`, `artist_name`, `date_modified`, `artist_image`, `artist_img_original`, `total_album`, `total_played`) VALUES
(105, 'Bryan Adams', '2020-04-20', 'tmp/artist/5833bad94091d5b5de72358736e1193b719a2886f0b.jpg', 'Bryan Adams583.jpg', '1', 100),
(106, 'Alessia Cara', '2020-04-20', 'tmp/artist/62856dcc0e8f919ea86b139b4ccd084439e10a8704e.jpg', 'Alessia Cara628.jpg', '2', 200),
(107, '3 Doors Down', '2020-04-20', 'tmp/artist/382ead4e883a59d30d8c157385aa531d3fe8e688fc0.jpg', '3 Doors Down382.jpg', '1', 50),
(108, 'None', '2020-04-20', 'tmp/artist/49c2781461d71e02a510b10c3c1866a12f3106b752.jpg', 'None49.jpg', '4', 0),
(109, 'Anne-Marie', '2020-04-20', 'tmp/artist/80576c6828a43e52bf5f9f04fc415b6f26777794b2c.jpg', 'Anne-Marie805.jpg', '5', 3),
(110, 'Coldplay', '2020-04-20', 'tmp/artist/901c942640d486338e4ae144a497f0cfd3f35ceb7af.jpg', 'Coldplay901.jpg', '2', 39),
(112, 'Carly Rae Jepsen', '2020-04-20', 'tmp/artist/838cae6fb01fab512f2047d40baffb3f8f561d1567d.jpg', 'Carly Rae Jepsen838.jpg', '1', 22),
(113, 'Ed Sheeran', '2020-04-20', 'tmp/artist/544f55cab0739390cf3b2c2f773b9c779b2f0ae8a99.jpg', 'Ed Sheeran544.jpg', '1', 37),
(114, 'ADELE', '2020-04-20', 'tmp/artist/247ccbe7b4fef679f821988c78dbd4734471834e3d9.jpg', 'ADELE247.jpg', '1', 35),
(115, 'Chris Brown', '2020-04-20', 'tmp/artist/115e153d6448b17ce97b2a79da70d64b89230c67053.jpg', 'Chris Brown115.jpg', '1', 36),
(116, 'Bebe Rexha', '2020-04-21', 'tmp/artist/79d7846ef6807a6a5e449997e9d11e5bd8b2d2576a.jpg', 'Bebe Rexha79.jpg', '1', NULL),
(117, 'Linkin Park', '2020-04-23', 'tmp/artist/7601685533969d5b68cbc630f991e873bd6467f1814.jpg', 'Linkin Park760.jpg', '1', 0),
(118, 'Taylor Swift', '2020-05-03', 'tmp/artist/46362b33d12e2b9a033cf77585f6e3d4b2c6b3a63a1.jpg', 'Taylor Swift463.jpg', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `music_artist_search`
--

CREATE TABLE `music_artist_search` (
  `id` int(11) NOT NULL,
  `search` varchar(500) NOT NULL,
  `created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_artist_search`
--

INSERT INTO `music_artist_search` (`id`, `search`, `created`) VALUES
(94, 'Bryan Adams', '2020-04-20 11:24:12.919315'),
(95, 'Ariana Grande', '2020-04-20 11:24:32.149974'),
(96, 'None', '2020-04-20 11:25:02.707771'),
(97, 'Arizona Zervas', '2020-04-20 11:25:25.305482'),
(98, 'Machine Gun Kelly', '2020-04-20 11:27:05.775376'),
(99, 'Justin Bieber', '2020-04-20 11:27:20.853568'),
(100, 'Coldplay', '2020-04-20 11:27:44.709804'),
(101, 'Taylor Swift', '2020-04-20 11:28:20.796165'),
(102, 'None', '2020-04-20 11:29:45.212445'),
(103, 'Alessia Cara', '2020-04-20 12:39:00.975912'),
(104, 'Bryan Adams', '2020-04-20 12:58:03.946214'),
(105, 'Alessia Cara', '2020-04-20 13:03:13.210108'),
(106, 'Bryan Adams', '2020-04-20 13:04:30.091991'),
(107, 'K\'naan', '2020-04-20 13:07:17.920836'),
(108, 'Bryan Adams', '2020-04-20 13:07:37.388621'),
(109, 'Alessia Cara', '2020-04-20 13:10:26.455309'),
(110, 'None', '2020-04-20 13:11:00.814051'),
(111, 'John Legend', '2020-04-20 13:11:20.215893'),
(112, 'Bryan Adams', '2020-04-20 13:12:17.855451'),
(113, 'Alessia Cara', '2020-04-20 13:12:34.382034'),
(114, '3 Doors Down', '2020-04-20 13:13:35.903832'),
(115, '3 Doors Down', '2020-04-20 13:14:17.917100');

-- --------------------------------------------------------

--
-- Table structure for table `music_library`
--

CREATE TABLE `music_library` (
  `id` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `albums_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `metadata_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_library`
--

INSERT INTO `music_library` (`id`, `date_added`, `albums_id`, `artist_id`, `metadata_id`, `profiles_id`) VALUES
(1, '0000-00-00', 108, 109, 359, 17),
(2, '2020-04-08', 113, 114, 370, 17),
(3, '2020-04-15', 101, 106, 357, 17),
(4, '2020-04-05', 114, 115, 371, 18);

-- --------------------------------------------------------

--
-- Table structure for table `music_metadata`
--

CREATE TABLE `music_metadata` (
  `id` int(11) NOT NULL,
  `artwork_name` varchar(100) DEFAULT NULL,
  `contributing_artists` varchar(50) DEFAULT NULL,
  `album` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `track_no` varchar(50) DEFAULT NULL,
  `album_artist` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `bitrate` varchar(50) DEFAULT NULL,
  `date_modified` date NOT NULL,
  `explicit` varchar(50) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `samplerate` varchar(50) DEFAULT NULL,
  `track_total` varchar(50) DEFAULT NULL,
  `total_played` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_metadata`
--

INSERT INTO `music_metadata` (`id`, `artwork_name`, `contributing_artists`, `album`, `genre`, `length`, `year`, `size`, `track_no`, `album_artist`, `title`, `bitrate`, `date_modified`, `explicit`, `file`, `samplerate`, `track_total`, `total_played`) VALUES
(326, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_565.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_565.mp3', '44100', '15', 15),
(327, 'ArianaGrande_DangerousWoman_Everyday_667.jpg', 'Ariana Grande feat. Future', 'Dangerous Woman', 'Pop', '194', '2016', 8244632, '9', 'Ariana Grande', 'Everyday', '320.0', '2020-04-20', '0', 'ArianaGrande_DangerousWoman_Everyday_667.mp3', '44100', NULL, 30),
(328, 'None_AHeadFullofDreams_AmazingDay_514.jpg', 'Coldplay', 'A Head Full of Dreams', 'Piano Rock', '271', '2015', 9653068, '9', 'None', 'Amazing Day', '256.0', '2020-04-20', '0', 'None_AHeadFullofDreams_AmazingDay_514.m4a', '44100', '11', NULL),
(329, 'ArizonaZervas_ROXANNE_ROXANNE_292.jpg', 'Arizona Zervas', 'ROXANNE', 'Pop', '163', '2019', 2132186, '1', 'Arizona Zervas', 'ROXANNE', '95.99765395894428', '2020-04-20', '0', 'ArizonaZervas_ROXANNE_ROXANNE_292.mp3', '48000', NULL, 20),
(330, 'ArianaGrande_DangerousWoman_Everyday_289.jpg', 'Ariana Grande feat. Future', 'Dangerous Woman', 'Pop', '194', '2016', 8244632, '9', 'Ariana Grande', 'Everyday', '320.0', '2020-04-20', '0', 'ArianaGrande_DangerousWoman_Everyday_289.mp3', '44100', NULL, NULL),
(331, 'MachineGunKelly_BadThings-Single_BadThings_712.jpg', 'Machine Gun Kelly & Camila Cabello', 'Bad Things - Single', 'Hip-Hop/Rap', '239', '2016', 9027340, '1', 'Machine Gun Kelly', 'Bad Things', '256.0', '2020-04-20', '0', 'MachineGunKelly_BadThings-Single_BadThings_712.m4a', '44100', '1', NULL),
(332, 'JustinBieber_10,000Hours_10,000Hours_949.jpg', 'Dan + Shay, Justin Bieber', '10,000 Hours', 'Country', '167', '2019', 6776007, '1', 'Justin Bieber', '10,000 Hours', '320.0', '2020-04-20', '0', 'JustinBieber_10,000Hours_10,000Hours_949.mp3', '44100', NULL, 10),
(333, 'Coldplay_ARushofBloodtotheHead_Amsterdam_316.jpg', 'Coldplay', 'A Rush of Blood to the Head', 'Alternative', '3:22', '2002', 10355475, '11', 'Coldplay', 'Amsterdam', '256.0', '2020-04-20', '0', 'Coldplay_ARushofBloodtotheHead_Amsterdam_316.m4a', '44100', '11', 8),
(334, 'TaylorSwift_Reputation_Don\'tBlameMe_19.jpg', 'Taylor Swift', 'Reputation', 'Pop', '2:12', '2017', 9667050, '4', 'Taylor Swift', 'Don\'t Blame Me', '318.399', '2020-04-20', 'True', 'TaylorSwift_Reputation_Don\'tBlameMe_19.m4a', '44100', '15', 55),
(335, 'None_AHeadFullofDreams_ArmyofOne_601.jpg', 'Coldplay', 'A Head Full of Dreams', 'Piano Rock', '376', '2015', 13301932, '8', 'None', 'Army of One', '256.0', '2020-04-20', '0', 'None_AHeadFullofDreams_ArmyofOne_601.m4a', '44100', '11', 1),
(336, 'AlessiaCara_ThePainsofGrowing_7Days_598.jpg', 'Alessia Cara', 'The Pains of Growing', 'Pop', '208', '2018', 7486431, '4', 'Alessia Cara', '7 Days', '256.0', '2020-04-20', '0', 'AlessiaCara_ThePainsofGrowing_7Days_598.m4a', '44100', '15', NULL),
(337, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_676.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_676.mp3', '44100', '15', 55),
(338, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_190.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '3:05', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_190.mp3', '44100', '15', 99),
(339, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_802.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_802.mp3', '44100', '15', 5),
(340, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_700.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_700.mp3', '44100', '15', NULL),
(341, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_496.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_496.mp3', '44100', '15', 53),
(342, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_340.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_340.mp3', '44100', '15', NULL),
(343, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_445.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_445.mp3', '44100', '15', 22),
(344, 'AlessiaCara_ThePainsofGrowing_7Days_769.jpg', 'Alessia Cara', 'The Pains of Growing', 'Pop', '208', '2018', 7486431, '4', 'Alessia Cara', '7 Days', '256.0', '2020-04-20', '0', 'AlessiaCara_ThePainsofGrowing_7Days_769.m4a', '44100', '15', 33),
(345, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_931.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_931.mp3', '44100', '15', NULL),
(346, 'K\'naan_Troubadour_WavinFlag(Coca-ColaCelebration)_430.jpg', 'K\'naan', 'Troubadour', 'Pop', '212', '2009', 7120491, '1', 'K\'naan', 'Wavin  Flag (Coca-Cola Celebration)', '256.0', '2020-04-20', '0', 'K\'naan_Troubadour_WavinFlag(Coca-ColaCelebration)_430.mp3', '44100', NULL, NULL),
(347, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_394.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_394.mp3', '44100', '15', NULL),
(348, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_220.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_220.mp3', '44100', '15', 12),
(349, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_22.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_22.mp3', '44100', '15', 22),
(350, 'AlessiaCara_ThePainsofGrowing_7Days_724.jpg', 'Alessia Cara', 'The Pains of Growing', 'Pop', '208', '2018', 7486431, '4', 'Alessia Cara', '7 Days', '256.0', '2020-04-20', '0', 'AlessiaCara_ThePainsofGrowing_7Days_724.m4a', '44100', '15', 11),
(351, 'None_24KMagic_24KMagic_721.jpg', 'Bruno Mars', '24K Magic', 'Chart Hits', '3:05', '2016', 7523761, '1', 'None', '24K Magic', '256.0', '2020-04-20', '0', 'None_24KMagic_24KMagic_721.m4a', '44100', '10', 75),
(352, 'JohnLegend_LoveintheFuture_AllofMe_982.jpg', 'John Legend', 'Love in the Future', 'Hip-Hop', '2:22', '2013', 10901155, '3', 'John Legend', 'All of Me', '320.0', '2020-04-20', '0', 'JohnLegend_LoveintheFuture_AllofMe_982.mp3', '44100', '20', 66),
(353, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_583.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_583.mp3', '44100', '15', 55),
(354, 'AlessiaCara_Everybody_1-800-273-8255ft.Logic,Khalid_628.jpg', 'Alessia Cara', 'Everybody', 'Hip-Hop/Rap', '250', '2017', 8305607, '10', 'Alessia Cara', '1-800-273-8255 ft.Logic, Khalid', '256.0', '2020-04-20', '0', 'AlessiaCara_Everybody_1-800-273-8255ft.Logic,Khalid_628.m4a', '44100', '14', 55),
(355, '3DoorsDown_AwayFromTheSun_HereWithoutYou_886.jpg', '3 Doors Down', 'Away From The Sun', 'Other', '3:33', '2002', 9598457, '6', '3 Doors Down', 'Here Without You', '320.0', '2020-04-20', '0', '3DoorsDown_AwayFromTheSun_HereWithoutYou_886.mp3', '44100', NULL, 77),
(356, '3DoorsDown_AwayFromTheSun_HereWithoutYou_382.jpg', '3 Doors Down', 'Away From The Sun', 'Other', '235', '2002', 9598457, '6', '3 Doors Down', 'Here Without You', '320.0', '2020-04-20', '0', '3DoorsDown_AwayFromTheSun_HereWithoutYou_382.mp3', '44100', NULL, NULL),
(357, 'AlessiaCara_ThePainsofGrowing_7Days_367.jpg', 'Alessia Cara', 'The Pains of Growing', 'Pop', '4:02', '2018', 7486431, '4', 'Alessia Cara', '7 Days', '256.0', '2020-04-20', '0', 'AlessiaCara_ThePainsofGrowing_7Days_367.m4a', '44100', '15', 98),
(358, 'None_VivaLaVida(Prospekt\'sMarchEdition)_42_49.jpg', 'Coldplay', 'Viva La Vida (Prospekt\'s March Edition)', '2000S', '3:07', '2008', 8277313, '4', 'None', '42', '256.0', '2020-04-20', '0', 'None_VivaLaVida(Prospekt\'sMarchEdition)_42_49.m4a', '44100', '10', 88),
(359, 'Anne-Marie_SpeakYourMind_2002_805.jpg', 'Anne-Marie', 'Speak Your Mind', 'Other', '3:02', '2018', 7634545, '5', 'Anne-Marie', '2002', '320.0', '2020-04-20', 'True', 'Anne-Marie_SpeakYourMind_2002_805.MP3', '44100', NULL, NULL),
(360, 'None_AHeadFullofDreams_AHeadFullofDreams_904.jpg', 'Coldplay', 'A Head Full of Dreams', 'Piano Rock', '223', '2015', 8416343, '1', 'None', 'A Head Full of Dreams', '256.0', '2020-04-20', '0', 'None_AHeadFullofDreams_AHeadFullofDreams_904.m4a', '44100', '11', NULL),
(361, 'Coldplay_MyloXyloto_AHopefulTransmission_901.jpg', 'Coldplay', 'Mylo Xyloto', 'Alternative', '33', '2011', 1704365, '12', 'Coldplay', 'A Hopeful Transmission', '256.0', '2020-04-20', '0', 'Coldplay_MyloXyloto_AHopefulTransmission_901.m4a', '44100', '17', NULL),
(362, 'AlessiaCara_ThePainsofGrowing_GirlNextDoor_457.jpg', 'Alessia Cara', 'The Pains of Growing', 'Pop', '202', '2018', 7238694, '12', 'Alessia Cara', 'Girl Next Door', '256.0', '2020-04-20', '0', 'AlessiaCara_ThePainsofGrowing_GirlNextDoor_457.m4a', '44100', '15', NULL),
(363, 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_715.jpg', 'Bryan Adams', 'Waking Up the Neighbours', 'Soundtrack', '395', '1991', 9800988, '12', 'Bryan Adams', '(Everything I Do) I Do It For You', '192.0', '2020-04-20', '0', 'BryanAdams_WakingUptheNeighbours_(EverythingIDo)IDoItForYou_715.mp3', '44100', '15', NULL),
(364, 'None_AHeadFullofDreams_ColourSpectrum_370.jpg', 'Coldplay', 'A Head Full of Dreams', 'Piano Rock', '60', '2015', 2498010, '10', 'None', 'Colour Spectrum', '256.0', '2020-04-20', '0', 'None_AHeadFullofDreams_ColourSpectrum_370.m4a', '44100', '11', NULL),
(365, 'CarlyRaeJepsen_Kiss_CallMeMaybe_250.jpg', 'Carly Rae Jepsen', 'Kiss', 'Pop', '3:05', '2013', 4823114, '23', 'Carly Rae Jepsen', 'Call Me Maybe', '192.0', '2020-04-20', 'True', 'CarlyRaeJepsen_Kiss_CallMeMaybe_250.mp3', '48000', '28', 88),
(366, 'Coldplay_MyloXyloto_MyloXyloto_706.jpg', 'Coldplay', 'Mylo Xyloto', 'Alternative', '3:55', '2011', 1961875, '1', 'Coldplay', 'Mylo Xyloto', '256.0', '2020-04-20', '0', 'Coldplay_MyloXyloto_MyloXyloto_706.m4a', '44100', '17', 88),
(367, 'CarlyRaeJepsen_Kiss_CallMeMaybe_838.jpg', 'Carly Rae Jepsen', 'Kiss', 'Pop', '2:55', '2013', 4823114, '23', 'Carly Rae Jepsen', 'Call Me Maybe', '192.0', '2020-04-20', '0', 'CarlyRaeJepsen_Kiss_CallMeMaybe_838.mp3', '48000', '28', 22),
(368, 'EdSheeran_Divide(DeluxeEdition)_CastleOnTheHill_544.jpg', 'Ed Sheeran', 'Divide (Deluxe Edition)', 'Pop / Folk Rock / Acoustic', '4.0:21.24896709066479', '2017', 10524362, '2', 'Ed Sheeran', 'Castle On The Hill', '320.0', '2020-04-20', 'True', 'EdSheeran_Divide(DeluxeEdition)_CastleOnTheHill_544.mp3', '44100', NULL, NULL),
(369, 'None_OneMoreLight_BattleSymphony_196.jpg', 'Linkin Park', 'One More Light', 'Pop Rock', '3.0:36.40781003958159', '2017', 8792371, '4', 'None', 'Battle Symphony', '320.0', '2020-04-20', '0', 'None_OneMoreLight_BattleSymphony_196.mp3', '44100', NULL, NULL),
(370, 'ADELE_19(DeluxeEdition)_BestforLast_247.jpg', 'ADELE', '19 (Deluxe Edition)', 'Pop', '4.0:18.577414965986407', '2008', 8694127, '2', 'ADELE', 'Best for Last', '256.0', '2020-04-20', '0', 'ADELE_19(DeluxeEdition)_BestforLast_247.m4a', '44100', '22', NULL),
(371, 'ChrisBrown_Royality_Backtosleep_115.jpg', 'Chris Brown', 'Royality', 'R B', '3:45', '2007', 5477458, '1', 'Chris Brown', 'Back to sleep', '192.0', '2020-04-20', '0', 'ChrisBrown_Royality_Backtosleep_115.mp3', '44100', '16', NULL),
(372, 'BebeRexha_AllYourFault:Pt.2_TheWayIAre(DancewithSomebody)[feat.LilWayne]_79.jpg', 'Bebe Rexha feat. Lil Wayne', 'All Your Fault: Pt. 2', 'Other', '3:7', '2017', 7628686, '3', 'Bebe Rexha', 'The Way I Are (Dance with Somebody) [feat. Lil Way', '320.0', '2020-04-21', 'False', 'BebeRexha_AllYourFault:Pt.2_TheWayIAre(DancewithSomebody)[feat.LilWayne]_79.mp3', '44100', NULL, NULL),
(373, 'AlessiaCara_Everybody_1-800-273-8255ft.Logic,Khalid_274.jpg', 'Alessia Cara', 'Everybody', 'Hip-Hop/Rap', '4:10', '2017', 8305607, '10', 'Alessia Cara', '1-800-273-8255 ft.Logic, Khalid', '256.0', '2020-04-23', 'False', 'AlessiaCara_Everybody_1-800-273-8255ft.Logic,Khalid_274.m4a', '44100', '14', 0),
(374, 'AlessiaCara_Everybody_1-800-273-8255ft.Logic,Khalid_847.jpg', 'Alessia Cara', 'Everybody', 'Hip-Hop/Rap', '4:10', '2017', 8305607, '10', 'Alessia Cara', '1-800-273-8255 ft.Logic, Khalid', '256.0', '2020-04-23', 'False', 'AlessiaCara_Everybody_1-800-273-8255ft.Logic,Khalid_847.m4a', '44100', '14', 0),
(375, '3DoorsDown_AwayFromTheSun_HereWithoutYou_727.jpg', '3 Doors Down', 'Away From The Sun', 'Other', '3:55', '2002', 9598457, '6', '3 Doors Down', 'Here Without You', '320.0', '2020-04-23', 'False', '3DoorsDown_AwayFromTheSun_HereWithoutYou_727.mp3', '44100', NULL, 0),
(376, 'AlessiaCara_ThePainsofGrowing_7Days_520.jpg', 'Alessia Cara', 'The Pains of Growing', 'Pop', '3:28', '2018', 7486431, '4', 'Alessia Cara', '7 Days', '256.0', '2020-04-23', 'False', 'AlessiaCara_ThePainsofGrowing_7Days_520.m4a', '44100', '15', 0),
(377, '3DoorsDown_AwayFromTheSun_HereWithoutYou_928.jpg', '3 Doors Down', 'Away From The Sun', 'Other', '3:55', '2002', 9598457, '6', '3 Doors Down', 'Here Without You', '320.0', '2020-04-23', 'False', '3DoorsDown_AwayFromTheSun_HereWithoutYou_928.mp3', '44100', NULL, 0),
(378, 'LinkinPark_LivingThings_CastleofGlass_760.jpg', 'Linkin Park', 'Living Things', 'Alternative rock,Nu metal,Rap rock,Alternative met', '3:23', '2012', 8187038, '6', 'Linkin Park', 'Castle of Glass', '320.0', '2020-04-23', 'False', 'LinkinPark_LivingThings_CastleofGlass_760.mp3', '44100', '12', 0),
(379, 'TaylorSwift_Reputation_Dress_463.jpg', 'Taylor Swift', 'Reputation', 'Pop', '3:50', '2017', 9454650, '12', 'Taylor Swift', 'Dress', '319.325', '2020-05-03', 'False', 'TaylorSwift_Reputation_Dress_463.m4a', '44100', '15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `music_playlist`
--

CREATE TABLE `music_playlist` (
  `id` int(11) NOT NULL,
  `playlist_name` varchar(50) DEFAULT NULL,
  `date_created` date NOT NULL,
  `albums_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `metadata_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_playlist`
--

INSERT INTO `music_playlist` (`id`, `playlist_name`, `date_created`, `albums_id`, `artist_id`, `metadata_id`, `profiles_id`) VALUES
(1, '1st', '2020-04-23', 111, 113, 368, 17),
(2, 'hello1', '2020-04-23', 111, 113, 368, 17),
(3, 'hello1', '2020-04-23', 99, 110, 333, 17),
(4, 'gfh', '2020-04-23', 111, 113, 368, 17),
(5, 'gfh', '2020-04-23', 111, 113, 368, 17),
(6, 'ertr', '2020-04-25', 111, 113, 368, 17),
(7, 'dg', '2020-04-25', 111, 113, 368, 16),
(8, 'aaja', '2020-05-02', 111, 113, 368, 17),
(9, 'aaja', '2020-05-02', 99, 110, 333, 17);

-- --------------------------------------------------------

--
-- Table structure for table `music_profiles`
--

CREATE TABLE `music_profiles` (
  `id` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `DoB` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_profiles`
--

INSERT INTO `music_profiles` (`id`, `Username`, `FirstName`, `LastName`, `Email`, `Password`, `DoB`, `Gender`) VALUES
(1, 'deguxi', 'Christen Collins', 'Janna Vega', 'mafa@mailinator.com', 'Pa$$w0rd!', '1993-10-13', '2020-04-16 03:10:56.814798+00:00'),
(2, 'cegonedyq', 'Melodie Velazquez', 'Lynn Duncan', 'libadepi@mailinator.com', 'Pa$$w0rd!', '1992-11-28', '2020-04-16 03:10:56.814798+00:00'),
(3, 'destiny2jannat', 'Roshan Oscar', 'Sah', 'RoshanSah729@gmail.com', 'adminnn', '1997-09-01', '2020-04-16 03:10:56.814798+00:00'),
(4, 'zexyqyci', 'Sophia Kramer', 'Cheyenne Pruitt', 'wununubype@mailinator.net', 'Pa$$w0rd!', '1992-02-09', ''),
(5, 'micykur', 'Kiayada Miles', 'Beau Bishop', 'syhejozefi@mailinator.net', 'Pa$$w0rd!', '2013-09-23', 'female'),
(6, 'nizepudu', 'Montana Donaldson', 'Iola Boyd', 'qoto@mailinator.net', 'Pa$$w0rd!', '1981-05-02', 'female'),
(7, 'wisud', 'Sophia Jordan', 'Yeo Parks', 'zovywohym@mailinator.net', 'Pa$$w0rd!', '1976-11-27', 'male'),
(8, 'qybifyhoz', 'Tiger Ayers', 'Shafira Cochran', 'myhi@mailinator.com', 'Pa$$w0rd!', '2018-12-01', 'female'),
(9, 'bezubuqira', 'Serina Pruitt', 'Callum Macdonald', 'pydibovyju@mailinator.com', 'Pa$$w0rd!', '1971-04-02', 'male'),
(10, 'bikow', 'Wesley Briggs', 'Axel Massey', 'bely@mailinator.com', 'Pa$$w0rd!', '2017-10-18', 'male'),
(11, 'gycudusyf', 'Lesley Rocha', 'Karly Carey', 'pofadodof@mailinator.com', 'Pa$$w0rd!', '2011-03-23', 'male'),
(12, 'loqybiheh', 'Regan Morgan', 'Bree Greene', 'mosygetyz@mailinator.net', 'Pa$$w0rd!', '1990-05-12', 'male'),
(13, 'qufygof', 'Gretchen Lott', 'Ulla Nicholson', 'zefuxylufo@mailinator.net', 'Pa$$w0rd!', '2007-07-02', 'male'),
(14, 'qizyhatu', 'Stone Waller', 'India Rosa', 'xugewemeda@mailinator.net', 'Pa$$w0rd!', '1991-05-24', 'male'),
(15, 'fejil', 'Lucius Jackson', 'Jescie Chapman', 'kyto@mailinator.net', 'Pa$$w0rd!', '2012-07-22', 'male'),
(16, 'hivirumyv', 'Josiah Bender', 'Lesley Gomez', 'gizufac@mailinator.com', 'Pa$$w0rd!', '1991-03-04', 'male'),
(17, 'aa', 'aa', 'aa', 'aa@mail.com', 'aa', '2020-04-05', 'male'),
(18, 'bb', 'Hoyt David', 'Lani Carroll', 'xogivak@mailinator.com', 'bb', '2016-07-14', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `music_recent`
--

CREATE TABLE `music_recent` (
  `id` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `albums_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `metadata_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_recent`
--

INSERT INTO `music_recent` (`id`, `date_added`, `albums_id`, `artist_id`, `metadata_id`, `profiles_id`) VALUES
(1, '2020-04-01', 111, 113, 368, 17),
(2, '2020-04-02', 106, 107, 356, 18),
(3, '2020-04-03', 99, 110, 333, 17);

-- --------------------------------------------------------

--
-- Table structure for table `music_recovery_keys`
--

CREATE TABLE `music_recovery_keys` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` int(11) NOT NULL,
  `valid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music_recovery_keys`
--

INSERT INTO `music_recovery_keys` (`id`, `email`, `token`, `valid`, `date`) VALUES
(1, 'RoshanSah729@gmail.com', 65384785, 0, '2020-04-15'),
(2, 'RoshanSah729@gmail.com', 9346330, 0, '2020-04-15'),
(3, 'RoshanSah729@gmail.com', 96167446, 0, '2020-04-15'),
(4, 'RoshanSah729@gmail.com', 23875174, 0, '2020-04-15'),
(5, 'RoshanSah729@gmail.com', 68970196, 0, '2020-04-15'),
(6, 'RoshanSah729@gmail.com', 46719361, 0, '2020-04-15'),
(7, 'RoshanSah729@gmail.com', 85813621, 0, '2020-04-15'),
(8, 'RoshanSah729@gmail.com', 58073914, 0, '2020-04-15'),
(10, 'RoshanSah729@gmail.com', 95195494, 0, '2020-04-16'),
(11, 'RoshanSah729@gmail.com', 89270572, 0, '2020-04-16'),
(12, 'RoshanSah729@gmail.com', 2226730, 0, '2020-04-16'),
(13, 'RoshanSah729@gmail.com', 56023876, 0, '2020-04-16'),
(14, 'RoshanSah729@gmail.com', 17998603, 0, '2020-04-16'),
(15, 'RoshanSah729@gmail.com', 73961497, 0, '2020-04-16'),
(16, 'RoshanSah729@gmail.com', 58711678, 0, '2020-04-16'),
(17, 'RoshanSah729@gmail.com', 12957229, 0, '2020-04-16'),
(18, 'RoshanSah729@gmail.com', 91479892, 0, '2020-04-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `music_albums`
--
ALTER TABLE `music_albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music_artist`
--
ALTER TABLE `music_artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music_artist_search`
--
ALTER TABLE `music_artist_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music_library`
--
ALTER TABLE `music_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_library_albums_id_250d7323_fk_music_albums_id` (`albums_id`),
  ADD KEY `music_library_artist_id_ec45f890_fk_music_artist_id` (`artist_id`),
  ADD KEY `music_library_metadata_id_8e6ceaf6_fk_music_metadata_id` (`metadata_id`),
  ADD KEY `music_library_profiles_id_0f063a84_fk_music_profiles_id` (`profiles_id`);

--
-- Indexes for table `music_metadata`
--
ALTER TABLE `music_metadata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music_playlist`
--
ALTER TABLE `music_playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_playlist_albums_id_65ea2885_fk_music_albums_id` (`albums_id`),
  ADD KEY `music_playlist_artist_id_8548813f_fk_music_artist_id` (`artist_id`),
  ADD KEY `music_playlist_metadata_id_c702eb94_fk_music_metadata_id` (`metadata_id`),
  ADD KEY `music_playlist_profiles_id_db9752e3_fk_music_profiles_id` (`profiles_id`);

--
-- Indexes for table `music_profiles`
--
ALTER TABLE `music_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music_recent`
--
ALTER TABLE `music_recent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_recent_albums_id_5fbe4bca_fk_music_albums_id` (`albums_id`),
  ADD KEY `music_recent_artist_id_ac61cdc3_fk_music_artist_id` (`artist_id`),
  ADD KEY `music_recent_metadata_id_9a0d0af0_fk_music_metadata_id` (`metadata_id`),
  ADD KEY `music_recent_profiles_id_25770d20_fk_music_profiles_id` (`profiles_id`);

--
-- Indexes for table `music_recovery_keys`
--
ALTER TABLE `music_recovery_keys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `music_albums`
--
ALTER TABLE `music_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `music_artist`
--
ALTER TABLE `music_artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `music_artist_search`
--
ALTER TABLE `music_artist_search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `music_library`
--
ALTER TABLE `music_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `music_metadata`
--
ALTER TABLE `music_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=380;

--
-- AUTO_INCREMENT for table `music_playlist`
--
ALTER TABLE `music_playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `music_profiles`
--
ALTER TABLE `music_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `music_recent`
--
ALTER TABLE `music_recent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `music_recovery_keys`
--
ALTER TABLE `music_recovery_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `music_library`
--
ALTER TABLE `music_library`
  ADD CONSTRAINT `music_library_albums_id_250d7323_fk_music_albums_id` FOREIGN KEY (`albums_id`) REFERENCES `music_albums` (`id`),
  ADD CONSTRAINT `music_library_artist_id_ec45f890_fk_music_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `music_artist` (`id`),
  ADD CONSTRAINT `music_library_metadata_id_8e6ceaf6_fk_music_metadata_id` FOREIGN KEY (`metadata_id`) REFERENCES `music_metadata` (`id`),
  ADD CONSTRAINT `music_library_profiles_id_0f063a84_fk_music_profiles_id` FOREIGN KEY (`profiles_id`) REFERENCES `music_profiles` (`id`);

--
-- Constraints for table `music_playlist`
--
ALTER TABLE `music_playlist`
  ADD CONSTRAINT `music_playlist_albums_id_65ea2885_fk_music_albums_id` FOREIGN KEY (`albums_id`) REFERENCES `music_albums` (`id`),
  ADD CONSTRAINT `music_playlist_artist_id_8548813f_fk_music_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `music_artist` (`id`),
  ADD CONSTRAINT `music_playlist_metadata_id_c702eb94_fk_music_metadata_id` FOREIGN KEY (`metadata_id`) REFERENCES `music_metadata` (`id`),
  ADD CONSTRAINT `music_playlist_profiles_id_db9752e3_fk_music_profiles_id` FOREIGN KEY (`profiles_id`) REFERENCES `music_profiles` (`id`);

--
-- Constraints for table `music_recent`
--
ALTER TABLE `music_recent`
  ADD CONSTRAINT `music_recent_albums_id_5fbe4bca_fk_music_albums_id` FOREIGN KEY (`albums_id`) REFERENCES `music_albums` (`id`),
  ADD CONSTRAINT `music_recent_artist_id_ac61cdc3_fk_music_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `music_artist` (`id`),
  ADD CONSTRAINT `music_recent_metadata_id_9a0d0af0_fk_music_metadata_id` FOREIGN KEY (`metadata_id`) REFERENCES `music_metadata` (`id`),
  ADD CONSTRAINT `music_recent_profiles_id_25770d20_fk_music_profiles_id` FOREIGN KEY (`profiles_id`) REFERENCES `music_profiles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
