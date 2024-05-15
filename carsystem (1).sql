-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 08:30 AM
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
-- Database: `carsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `VIN` varchar(255) NOT NULL,
  `license_plate_number` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `color` varchar(255) NOT NULL,
  `fuel_type` enum('Gasoline','Diesel','Electric') NOT NULL,
  `transmission_type` enum('Automatic','Manual') NOT NULL,
  `status` enum('Available') NOT NULL DEFAULT 'Available',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `make`, `model`, `year`, `VIN`, `license_plate_number`, `price`, `color`, `fuel_type`, `transmission_type`, `status`, `quantity`, `created_at`, `updated_at`) VALUES
(8, 'Davis-Emard', 'quia', 2004, 'D8N5KEZTXYDV25YXE', 'WIE615', 48959.00, 'silver', 'Gasoline', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(9, 'Kuphal, Cartwright and Beer', 'suscipit', 2015, 'P3DMDF02N7MZDA3M0', 'WNF230', 46140.00, 'navy', 'Diesel', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(10, 'Kovacek LLC', 'nulla', 2011, 'EXDV7L549W1U96K1D', 'XNL943', 19391.00, 'yellow', 'Gasoline', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(11, 'Breitenberg Ltd', 'nihil', 2001, '3ZSHDDFWMWL2U696S', 'FSK491', 32210.00, 'blue', 'Electric', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(12, 'Wilderman Inc', 'itaque', 2023, 'FLYA0NAMST0P0LXJB', 'VIK609', 47555.00, 'navy', 'Diesel', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(13, 'Collier, O\'Hara and Schneider', 'tenetur', 2013, 'K4V2K6Y33XUZH6GRX', 'HFC730', 28525.00, 'yellow', 'Gasoline', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(14, 'Greenfelder Inc', 'error', 2014, 'NTDTYYUCSPYXBN4LE', 'HMX590', 11937.00, 'aqua', 'Gasoline', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(15, 'Windler, Gerlach and Hickle', 'cupiditate', 2017, 'ND8MY7M36LPN0F5VZ', 'FCL619', 35440.00, 'aqua', 'Gasoline', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(16, 'Gaylord Ltd', 'sit', 2020, '5UFD70950DALKJMEV', 'JGE916', 40096.00, 'navy', 'Diesel', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(17, 'Ferry Ltd', 'nemo', 2017, '8S8ZT1K8VRKK6XV8S', 'ZTA454', 19984.00, 'silver', 'Gasoline', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(18, 'Schoen Inc', 'velit', 2004, 'YRZ5D6BHR8VL71AZA', 'ZLQ967', 20328.00, 'fuchsia', 'Electric', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(19, 'Kuhlman PLC', 'consequatur', 2005, 'W0ZFX43RT5BHLNMHA', 'ARB866', 15957.00, 'fuchsia', 'Electric', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(20, 'Farrell-Bogan', 'et', 2020, '2CZKSAHTAM9B95KZU', 'NGW768', 40036.00, 'navy', 'Gasoline', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(21, 'Dicki, Considine and Watsica', 'perspiciatis', 2016, 'YXAMSK4LPJ09EWRC1', 'LZB629', 13102.00, 'purple', 'Diesel', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(22, 'Luettgen and Sons', 'voluptatem', 2008, 'WF8NLG642ZN668KJ5', 'ZAG969', 41613.00, 'blue', 'Gasoline', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(23, 'Denesik-Kuhlman', 'id', 2024, '8H4BMKD99VV0V5SEH', 'XCE163', 39286.00, 'gray', 'Electric', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(24, 'Torp, Hahn and Jaskolski', 'repudiandae', 2002, 'HSTJ89TWFG105TGXC', 'IDO389', 27045.00, 'gray', 'Electric', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(25, 'Ratke, Dietrich and Corkery', 'sed', 2024, 'F6EWSETCAYC3A05B7', 'QRA948', 30571.00, 'blue', 'Electric', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(26, 'Boehm-Sauer', 'nesciunt', 2001, 'L3ZKYZURJE58RFCGP', 'LYE715', 21798.00, 'blue', 'Electric', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(28, 'Oberbrunner-Stehr', 'occaecati', 2012, '35N1Z5291H067XX0C', 'OIS782', 15611.00, 'green', 'Electric', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(29, 'Homenick-Harber', 'dolor', 2023, 'WCAPTLWS91G25X6M6', 'TXJ837', 46168.00, 'lime', 'Diesel', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(30, 'Sipes Ltd', 'aut', 2020, 'YPMHMDSLHHJ8H751R', 'OIX427', 13385.00, 'lime', 'Electric', 'Manual', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(31, 'Graham Group', 'et', 2000, 'EYWBD5CTLD19H86R8', 'CJH045', 47083.00, 'navy', 'Gasoline', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(32, 'Langosh, Monahan and Mayer', 'ipsa', 2018, '7DVAGATDL9SAHD4X2', 'DCW038', 20174.00, 'olive', 'Electric', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(33, 'Heller-Wisoky', 'et', 2005, 'BHGFZFWTMDESVT00J', 'DAS508', 41079.00, 'black', 'Electric', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(34, 'Price Ltd', 'sint', 2019, 'BK03PDUMSWTAC8Z0T', 'UNE844', 23890.00, 'fuchsia', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(35, 'Batz-Bogisich', 'pariatur', 2012, '0UHTEBTNWWSTNUFMG', 'ZKE150', 16478.00, 'green', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(36, 'O\'Hara-Skiles', 'voluptatum', 2013, 'KPM48RZCGMNG742HU', 'QPD902', 35997.00, 'silver', 'Gasoline', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(37, 'Blanda, Cronin and Hayes', 'neque', 2023, 'H7HZZ0XBKHJEH4783', 'QIH627', 36576.00, 'aqua', 'Electric', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(38, 'Hansen-Armstrong', 'placeat', 2012, 'U9PMWKA6C5973VBT2', 'CYN270', 48940.00, 'fuchsia', 'Gasoline', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(39, 'Williamson Group', 'dolor', 2002, 'KHKZ40KTVG63NJZU0', 'HPI649', 22316.00, 'gray', 'Gasoline', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(40, 'Wyman, Zemlak and White', 'et', 2013, 'HDLT1DH4ZK0JF31YP', 'ZEZ400', 38642.00, 'aqua', 'Gasoline', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(41, 'Rolfson Ltd', 'autem', 2003, 'G33J6NC1JPDZNG1UD', 'ILE308', 35474.00, 'gray', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(42, 'DuBuque-Bauch', 'reprehenderit', 2005, '7DCG7268XAW6XSGX7', 'BLN418', 45086.00, 'lime', 'Electric', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(43, 'Jerde-Greenholt', 'fugit', 2007, '6EJC63LZ37LSAEM6Z', 'EEV232', 25371.00, 'lime', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(44, 'Murray, Dare and Doyle', 'voluptas', 2005, 'KKNHJ4S11DU1U4EWP', 'HJM091', 29670.00, 'gray', 'Electric', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(45, 'Kuvalis-Bechtelar', 'aperiam', 2014, 'A3J17FNE5VXGHMPP9', 'CJG870', 15592.00, 'teal', 'Diesel', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(46, 'Hermann, Klein and Heidenreich', 'hic', 2024, 'EAAUKPVGZA4X4XPV4', 'FAS727', 39011.00, 'purple', 'Diesel', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(47, 'Kunze PLC', 'itaque', 2002, '9NY0Z6NTW06AK6RP4', 'XEY428', 33621.00, 'green', 'Gasoline', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(48, 'Strosin Inc', 'labore', 2015, 'N0EP2XCBG5W7Z8APV', 'EQZ389', 34792.00, 'blue', 'Electric', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(49, 'Stracke-Reichel', 'ut', 2012, 'TMY1NP0SEPYKWMZFC', 'MHD006', 38822.00, 'yellow', 'Gasoline', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(50, 'Braun-Bogisich', 'sed', 2018, 'NUENTG3L1HBK390HC', 'FGV824', 14716.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(51, 'Reilly, Sanford and Bernier', 'vitae', 2007, '3MLC7ZJU8XW2CUZDD', 'ICZ281', 38383.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(52, 'Shanahan-Effertz', 'voluptas', 2022, 'C5KLSKRWY3B2JWT53', 'QUW599', 35020.00, 'fuchsia', 'Diesel', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(53, 'Becker Inc', 'hic', 2011, 'BVM3RKG3UL72A4NJM', 'RJB801', 41496.00, 'maroon', 'Gasoline', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(54, 'Kovacek LLC', 'sunt', 2016, 'LKV5FB4NXT4E1PP82', 'PEU907', 44460.00, 'yellow', 'Electric', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(55, 'Price, Romaguera and Smith', 'voluptas', 2007, 'A62TKKNGNCM2ZYSJU', 'EFT945', 42154.00, 'black', 'Electric', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(56, 'Johns, Anderson and Lowe', 'occaecati', 2010, 'LYD76Z0HXASWNC933', 'ZNY751', 29083.00, 'teal', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(57, 'Crist, Ankunding and Grant', 'quia', 2004, 'G2NXKJFU3SCHPC4M9', 'EEF730', 49225.00, 'teal', 'Diesel', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(58, 'Gerhold, Stroman and Maggio', 'aut', 2005, '5FV44JL5VMC5T6SHN', 'TYA912', 36891.00, 'purple', 'Electric', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(59, 'Heaney, Rogahn and McGlynn', 'fugiat', 2022, 'HGD8P93V62C9244G9', 'HMF827', 32696.00, 'blue', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(60, 'Nicolas, Pacocha and Kihn', 'officia', 2011, 'VJLY8FCMKZH2M7WPE', 'YMK489', 13880.00, 'gray', 'Diesel', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(61, 'Johnson Ltd', 'assumenda', 2021, 'E3VMJKF7S1PABZZUU', 'QLT584', 38404.00, 'teal', 'Gasoline', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(62, 'Muller Group', 'tempora', 2000, '9YPMTCK1SLM34435Y', 'VDY122', 29684.00, 'olive', 'Gasoline', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(63, 'Hudson-Halvorson', 'velit', 2010, '1F1KKZ2E4G1NWX520', 'XGD930', 22912.00, 'blue', 'Electric', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(64, 'Quitzon Inc', 'pariatur', 2003, '3NR94MAX7X0WLHFX3', 'TGQ707', 41335.00, 'fuchsia', 'Electric', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(65, 'Bartell-Pagac', 'perspiciatis', 2016, '0NG9R7LTBD15A7VPY', 'ALR305', 24131.00, 'olive', 'Gasoline', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(66, 'Hand, Ruecker and Ortiz', 'amet', 2008, 'F018N0S6LRC4KU0FP', 'QDX718', 31050.00, 'lime', 'Gasoline', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(67, 'Willms-Sporer', 'totam', 2007, '4Z3ZN3LEHLEHVTRVW', 'WOC286', 34762.00, 'teal', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(68, 'Runolfsdottir PLC', 'aut', 2021, 'BD5E71B8A5VR49NDA', 'INI646', 40790.00, 'gray', 'Diesel', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(69, 'Stanton-Hoppe', 'sunt', 2011, '4PM634LP9M33SD483', 'EII869', 25903.00, 'aqua', 'Gasoline', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(70, 'Swaniawski-Hammes', 'in', 2011, '8D6KW9B2G9XB20FC9', 'LJA648', 42934.00, 'maroon', 'Electric', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(71, 'Volkman PLC', 'provident', 2011, 'CYD10Y320F7GE7FY5', 'EMK921', 11320.00, 'teal', 'Gasoline', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(72, 'Bode PLC', 'fuga', 2007, 'NY6S1Y2CX1HSL3H95', 'KRD101', 23802.00, 'green', 'Diesel', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(73, 'Runte Group', 'facere', 2007, 'LLCR487NTXWLZFHWH', 'IKW550', 16259.00, 'white', 'Electric', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(74, 'Lakin, Mills and Cassin', 'officiis', 2011, '9F8C24Z0FJ4SF2580', 'PPL880', 26083.00, 'white', 'Gasoline', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(75, 'D\'Amore, Klocko and Rempel', 'quia', 2010, 'JXL594PN2JKCX4KYU', 'QEO737', 33705.00, 'aqua', 'Diesel', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(76, 'Bergnaum, Leannon and Stark', 'est', 2012, 'PZT42UZFM9TS3TED5', 'GKF336', 29812.00, 'yellow', 'Electric', 'Manual', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(77, 'Weber-Hansen', 'qui', 2022, 'XDGD2F777S5ZNJK2H', 'PQW711', 29674.00, 'navy', 'Electric', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(78, 'Kulas LLC', 'culpa', 2009, 'W2XCL8MASACCD13SN', 'FQQ484', 19773.00, 'silver', 'Diesel', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(79, 'Leannon PLC', 'perferendis', 2021, 'MZW6RNGPVHVA6ZM0P', 'BYX856', 25332.00, 'green', 'Gasoline', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(80, 'Hodkiewicz-Renner', 'optio', 2022, 'H9CZ61KNXBEGF8RSY', 'LGD860', 33041.00, 'fuchsia', 'Electric', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(81, 'Powlowski-Daniel', 'eveniet', 2023, 'XG22HBC18B4WDXM4A', 'IBC213', 23686.00, 'lime', 'Electric', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(82, 'Welch and Sons', 'quos', 2019, 'RZS4542HAWJSRCPPP', 'VGO656', 45876.00, 'teal', 'Electric', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(83, 'Welch-Tillman', 'commodi', 2017, 'MGLUHWRTMNVDWZRSE', 'GCV763', 31370.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(84, 'White Inc', 'quam', 2022, 'DN6AS55B953WH2AWJ', 'ROA576', 45658.00, 'navy', 'Diesel', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(85, 'Leffler Group', 'ab', 2020, 'TV3CGHBZUMCV2NDZ7', 'SAY458', 12696.00, 'white', 'Diesel', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(86, 'O\'Conner and Sons', 'et', 2007, 'B83EUH1EBVA0MJ4XW', 'XJN115', 26117.00, 'purple', 'Diesel', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(87, 'Flatley Inc', 'laborum', 2009, 'XUM4Z2A1U6KBKKTC5', 'PST667', 29428.00, 'navy', 'Gasoline', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(88, 'Bernier-Green', 'corrupti', 2003, '934DMMSZB7YUV1AF7', 'XWY039', 12125.00, 'silver', 'Gasoline', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(89, 'Streich, Mante and Prosacco', 'neque', 2021, 'ZZK6FWKRUDE5MS823', 'APD887', 17112.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(90, 'Shanahan, Davis and Abshire', 'officia', 2014, '9CXTY6UUN1WYX87M3', 'ONH713', 15089.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(91, 'Willms PLC', 'temporibus', 2014, 'P2TA3AMK5YLM0WKEY', 'QQU359', 12038.00, 'olive', 'Electric', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(92, 'Heller Group', 'distinctio', 2008, 'MELPG2SXYSC6UU4M8', 'WXB325', 29367.00, 'lime', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(93, 'Berge Group', 'accusantium', 2010, '41F712HVLC952L6EZ', 'JVU654', 41728.00, 'green', 'Electric', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(94, 'Cartwright Ltd', 'qui', 2008, 'X4US7THU2XUWLHGAY', 'WRT644', 28096.00, 'olive', 'Diesel', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(95, 'Hand-Roob', 'quo', 2022, 'VTYXGF8V3L11XRWMT', 'HNR791', 41617.00, 'fuchsia', 'Gasoline', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(96, 'Marquardt-Stamm', 'qui', 2005, 'KUSAXLSGLEUAH3T0V', 'MCO993', 43430.00, 'lime', 'Electric', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(97, 'Kautzer Group', 'illum', 2012, 'GC88DHUZ3TB3MUB25', 'DUX787', 11492.00, 'olive', 'Gasoline', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(98, 'Windler and Sons', 'commodi', 2024, 'BGXA3U2ZS1ENXX8FS', 'GCY861', 37954.00, 'white', 'Diesel', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(99, 'Zulauf-Leuschke', 'quis', 2014, '3U7S4W5BPKWCJGGZL', 'NOR992', 24774.00, 'white', 'Gasoline', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(100, 'Rolfson PLC', 'in', 2002, '77009RSPR636R7AW9', 'MKC357', 16340.00, 'white', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(101, 'Carter LLC', 'fuga', 2020, '6M5XU76YL7BCUXLZ7', 'ZKI710', 23478.00, 'fuchsia', 'Electric', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(102, 'Ortiz, Zulauf and Padberg', 'consectetur', 2015, 'P0WA9JTPSSV28BCAZ', 'GLH730', 24469.00, 'aqua', 'Diesel', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(103, 'Russel, Glover and Shanahan', 'quia', 2024, 'FXG1R74K0LB370VWN', 'HIY546', 41401.00, 'teal', 'Gasoline', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(104, 'Beatty, Nolan and Senger', 'odio', 2023, '8B58MWUUPKY60L84V', 'TXK950', 18125.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(105, 'Paucek, Rice and Crist', 'laudantium', 2010, 'S97SYFLJAUJY9Y8P6', 'VSX684', 23994.00, 'black', 'Electric', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(106, 'Hodkiewicz-Heaney', 'repellat', 2012, 'PTX8ZXA4WDLH26Y72', 'ITI483', 47552.00, 'purple', 'Gasoline', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(107, 'Schroeder, Klocko and Smith', 'itaque', 2022, '7JSFA2ATYSYMWC4ZR', 'HDH023', 33084.00, 'aqua', 'Electric', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(108, 'Robel-Oberbrunner', 'quae', 2003, 'WT4VLJ1KHY1LBX66W', 'RBY507', 29346.00, 'navy', 'Electric', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(109, 'Trantow Ltd', 'voluptatem', 2003, '1KT0EWS0PJS88N6WX', 'KJP115', 49111.00, 'blue', 'Electric', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(110, 'Feest PLC', 'ea', 2003, 'CA753Z8WFNJK52VN2', 'ZZA449', 32035.00, 'black', 'Gasoline', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(111, 'Bergnaum-Ferry', 'laboriosam', 2012, 'PS0Y4TC52U7RSP9RU', 'PPA888', 33946.00, 'green', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(112, 'Kessler-Nitzsche', 'facilis', 2024, 'KTCPY5L79ESL5YTZW', 'QUU126', 33952.00, 'gray', 'Diesel', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(113, 'Kling, Bernier and Lakin', 'itaque', 2010, '92K2RJCZ3CL68HD1U', 'YNA212', 13663.00, 'blue', 'Gasoline', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(114, 'Rosenbaum-O\'Kon', 'facere', 2024, '2HW3RH87UCR5JBF20', 'MCX055', 18445.00, 'white', 'Diesel', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(115, 'Larson-Grimes', 'magni', 2008, 'XAWDALSS8J9V7Y2RE', 'DHB379', 14734.00, 'lime', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(116, 'Spencer and Sons', 'optio', 2002, '3EMK8H166EZ4LKMZ9', 'FSK804', 42882.00, 'green', 'Electric', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(117, 'Lueilwitz Ltd', 'quod', 2011, 'N2DPW7586J5K73A1V', 'TSU149', 48567.00, 'olive', 'Gasoline', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(118, 'Robel and Sons', 'adipisci', 2002, 'UE8CPK4B511BUMPCT', 'MRW908', 33334.00, 'black', 'Electric', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(119, 'Ritchie, Christiansen and Bruen', 'fugit', 2011, '47YZK0GA088XVXWR5', 'YFN945', 21757.00, 'blue', 'Diesel', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(120, 'Schuster, Ernser and Rau', 'corporis', 2009, 'ZSHGRY1GGJW87L7K8', 'MHU095', 48167.00, 'teal', 'Electric', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(121, 'Marks, Rosenbaum and Harber', 'sunt', 2015, 'VR3FGMGDAF7S78HHR', 'UQA972', 47386.00, 'navy', 'Diesel', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(122, 'Connelly-Pacocha', 'officiis', 2023, '3DG55GWPBC04GNJ2P', 'THB858', 14249.00, 'gray', 'Diesel', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(123, 'Rogahn, Johnson and Farrell', 'facere', 2022, '42R78UNLJHVU81XB0', 'SRK531', 47352.00, 'black', 'Electric', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(124, 'Ortiz-Jakubowski', 'quos', 2017, 'G8CFTFVEBR0YLY75G', 'FWC751', 37226.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(125, 'Padberg, Christiansen and Stiedemann', 'quia', 2019, 'GKFJKENWBSNGMG3WC', 'VPQ312', 19287.00, 'white', 'Gasoline', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(126, 'Rogahn-Kling', 'at', 2013, 'TL2YM19DFH83Z9UY7', 'XDP715', 16592.00, 'aqua', 'Electric', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(127, 'McClure, Batz and Ernser', 'voluptatem', 2010, 'MKZRCR6DM5P9TX7RN', 'XOP023', 19101.00, 'white', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(128, 'Dickens Inc', 'ut', 2008, 'TGM34GECNGLL2ZZZK', 'TAS059', 14175.00, 'navy', 'Diesel', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(129, 'Upton, Borer and Green', 'et', 2018, 'L9CC92HMFFBEWJ34W', 'IYY692', 31468.00, 'lime', 'Gasoline', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(130, 'Goyette Group', 'temporibus', 2013, '3ZZJL146MKHF10Z0Z', 'YLQ439', 35312.00, 'olive', 'Diesel', 'Manual', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(131, 'Klocko-Monahan', 'quasi', 2010, '3165ET36NNUZACET8', 'TIN321', 10551.00, 'purple', 'Diesel', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(132, 'Cole Inc', 'beatae', 2012, 'HULAZSRXZV0CU3D7K', 'VRB318', 41653.00, 'black', 'Gasoline', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(133, 'Cummings, Dietrich and Goyette', 'et', 2017, '7TCADFX3B98K6F1Y6', 'AAQ064', 48050.00, 'silver', 'Electric', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(134, 'Kiehn LLC', 'quo', 2014, 'K10M577XH5HYHZKSD', 'ONW811', 45323.00, 'teal', 'Diesel', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(135, 'Ankunding LLC', 'aut', 2011, '4ZXDGA8AR1M9J0D5A', 'YHM470', 16928.00, 'fuchsia', 'Diesel', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(136, 'Stark Group', 'eaque', 2000, '3P2ZJHAB8L7Y9UDKZ', 'DHQ780', 17987.00, 'aqua', 'Gasoline', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(137, 'Bashirian LLC', 'doloribus', 2011, 'ET7R34WSV87EHUZBX', 'FTU098', 29389.00, 'lime', 'Diesel', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(138, 'Botsford, Quitzon and Bednar', 'ea', 2013, '51BJ1GC2RT2HX7EVP', 'FJV103', 32028.00, 'gray', 'Diesel', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(139, 'Mohr, Bosco and Rath', 'itaque', 2002, 'F8039DFRT6AS03J69', 'NLG367', 18830.00, 'lime', 'Electric', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(140, 'Gleichner-Gaylord', 'voluptatem', 2012, 'SH75GXVJKLDP9SSYM', 'WVA707', 16613.00, 'silver', 'Diesel', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(141, 'O\'Connell Group', 'ut', 2012, 'D4EHN1JV0PZBVHFTP', 'GLD576', 39707.00, 'silver', 'Gasoline', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(142, 'Rau-Waelchi', 'maiores', 2012, 'AP4RWGL8DYD6PNL4W', 'YXF422', 34903.00, 'teal', 'Diesel', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(143, 'Hoeger and Sons', 'saepe', 2004, 'BY4DUV8ASNA996LEE', 'OCU814', 33999.00, 'green', 'Gasoline', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(144, 'Johnston Group', 'aliquam', 2024, '3YNRH5ZRPSU8RB6TZ', 'IXB269', 23501.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(145, 'Eichmann, Emard and Reilly', 'nemo', 2007, 'HXLEE2E0CK33TKX3N', 'FGI907', 24305.00, 'purple', 'Electric', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(146, 'Ebert-Hartmann', 'quod', 2018, 'MV5DH1H6ZZKJU0GFW', 'OMN065', 44894.00, 'gray', 'Diesel', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(147, 'Ferry and Sons', 'consectetur', 2019, 'FPAUNC4DJZA0G4B3M', 'SUW435', 20549.00, 'silver', 'Gasoline', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(148, 'Daniel, Breitenberg and Erdman', 'eveniet', 2006, 'KKBMLBXVEV2Z0L4AC', 'NID558', 28726.00, 'lime', 'Diesel', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(149, 'Ratke Inc', 'error', 2024, 'F5Z4L9SUPS3CDJKP7', 'YPT916', 46082.00, 'green', 'Gasoline', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(150, 'Ernser-Pfannerstill', 'qui', 2004, '9KNWC9RSLCXLDZ68E', 'YFB754', 47765.00, 'lime', 'Electric', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(151, 'Botsford-Eichmann', 'temporibus', 2014, '62D0SUG0XB5H05SXM', 'HLE038', 48226.00, 'silver', 'Gasoline', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(152, 'Hickle, Schulist and Reilly', 'ut', 2017, 'CY530B7RR02FF5JCK', 'TDI282', 22427.00, 'olive', 'Diesel', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(153, 'Kemmer-Pfannerstill', 'vel', 2006, '9SA0WYJ46MY1G0PSU', 'WSI912', 16612.00, 'navy', 'Electric', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(154, 'Sporer, Bartell and Padberg', 'molestias', 2008, 'LA23P6B3Z5WV2A4KZ', 'FPV440', 45850.00, 'lime', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(155, 'Keebler-Hartmann', 'commodi', 2009, '110KDJP1PLNAX1CCS', 'GPF918', 21243.00, 'aqua', 'Diesel', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(156, 'Streich and Sons', 'et', 2002, '7A79DWDR9WF3A5CPB', 'ZQX711', 25181.00, 'maroon', 'Gasoline', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(157, 'Dach, Block and Kerluke', 'consequatur', 2013, '6CMCL4C07BVZADTX0', 'YEH156', 48396.00, 'green', 'Gasoline', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(158, 'Reinger LLC', 'est', 2015, 'SZERTJTZESZ1YRYLD', 'GIJ875', 13251.00, 'green', 'Diesel', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(159, 'Bogisich-Ward', 'omnis', 2001, '1FELRX4SWS2S61PUU', 'WFS469', 20135.00, 'gray', 'Diesel', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(160, 'Durgan, Cassin and Bergnaum', 'asperiores', 2019, 'FP59BKE0HCDJ7BZMY', 'QNE422', 41081.00, 'gray', 'Diesel', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(161, 'Bogan Inc', 'autem', 2002, 'AU6NPXULTZ090XDXV', 'KDD176', 34401.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(162, 'Klocko-Grimes', 'aut', 2005, 'LG4E8KX9RKHLZ8SVN', 'RON353', 43660.00, 'olive', 'Electric', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(163, 'Hintz-Kuphal', 'deserunt', 2021, '80WC7TSSA9ESJ9XLT', 'KAC961', 33598.00, 'green', 'Gasoline', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(164, 'Oberbrunner, Cassin and Rempel', 'debitis', 2005, 'MP6LWGT9TZPV2HCHC', 'UUT221', 27315.00, 'aqua', 'Diesel', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(165, 'Koch, Rolfson and Bailey', 'quaerat', 2013, 'X6KZY5X3SB75BUBGH', 'DER511', 33436.00, 'gray', 'Gasoline', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(166, 'Bahringer LLC', 'temporibus', 2007, 'CZES42NVNM75EPJ3T', 'GTN394', 33635.00, 'white', 'Diesel', 'Manual', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(167, 'Mueller Inc', 'voluptatem', 2001, 'K1BYGKAXFM7HAAG1G', 'OYY353', 16589.00, 'fuchsia', 'Gasoline', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(168, 'Bechtelar-Emard', 'deserunt', 2004, 'T6W3CA6K643H2Y1VU', 'TYY755', 14826.00, 'purple', 'Electric', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(169, 'Wilderman Ltd', 'consectetur', 2013, 'P5MGAJ4W578E9841X', 'WSV439', 20282.00, 'teal', 'Gasoline', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(170, 'Ankunding Group', 'et', 2016, 'MH9P7SR1Z9157R7WJ', 'VCR187', 35917.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(171, 'Stokes-Ruecker', 'temporibus', 2005, 'K0SNDG97P0KDKUSS5', 'TEV896', 48726.00, 'blue', 'Electric', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(172, 'Ondricka PLC', 'ab', 2012, 'ZTP8HZ4T65PL2ULA9', 'STF272', 42201.00, 'fuchsia', 'Gasoline', 'Manual', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(173, 'Lindgren, Cassin and Daugherty', 'voluptas', 2022, '9BUT2UUX1VWXNCKXD', 'QLT014', 49928.00, 'blue', 'Electric', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(174, 'Boehm-Klocko', 'fuga', 2001, 'VZARB1D9PH25U1GKV', 'RZN108', 17288.00, 'white', 'Gasoline', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(175, 'Auer Group', 'quibusdam', 2023, 'UTUSPRNRVC418ZHG6', 'QHY024', 41871.00, 'silver', 'Diesel', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(176, 'Barton Group', 'hic', 2002, 'RV5C84RKR6K9MZC4Y', 'BGA852', 16859.00, 'teal', 'Diesel', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(177, 'Dooley Group', 'dolorum', 2000, 'YGXRMY31518ETB2WS', 'HDF645', 45647.00, 'silver', 'Electric', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(178, 'Kling Ltd', 'qui', 2017, 'JH7PDVV3FZD8KUULU', 'XPC372', 10030.00, 'navy', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(179, 'Jast-Greenfelder', 'non', 2001, '69PN9YGG8AHWUWZNH', 'SEF327', 17977.00, 'maroon', 'Gasoline', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(180, 'Lang and Sons', 'perferendis', 2018, 'UA2GB4J56T1Z489TE', 'CID050', 30066.00, 'blue', 'Electric', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(181, 'Konopelski, Denesik and Baumbach', 'enim', 2015, 'K7WSUE9YMV6SAVELH', 'JJL315', 47684.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(182, 'Leffler, Halvorson and Gislason', 'ad', 2020, 'AJ43FRYXCR56NGEGL', 'IMH164', 48887.00, 'navy', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(183, 'Boyer LLC', 'ut', 2013, 'ZMUNCFY81D7LB997R', 'CYJ157', 41213.00, 'white', 'Gasoline', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(184, 'Bradtke Ltd', 'est', 2007, '4KHBBVYB2G7PLH6UZ', 'IYT577', 46184.00, 'fuchsia', 'Electric', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(185, 'Doyle-Durgan', 'consequatur', 2012, '2NRYXYKEYVERHBDST', 'BLK931', 27311.00, 'yellow', 'Electric', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(186, 'Shields-Kulas', 'sint', 2014, 'S6A2FA7G37PR5C2BR', 'PNN734', 26912.00, 'lime', 'Diesel', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(187, 'Schuster, Bauch and White', 'sed', 2015, '4S0EJA7ZN6Z4UFTUY', 'DPR091', 20845.00, 'gray', 'Gasoline', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(188, 'Wolf, West and McDermott', 'maiores', 2005, '3BKXM0JKBYFEYMAZ7', 'EPY090', 21436.00, 'blue', 'Diesel', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(189, 'Koch, Flatley and Boyer', 'ut', 2012, 'E5RUP8ZZ9ZUDFUXCN', 'OQH240', 33205.00, 'purple', 'Electric', 'Manual', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(190, 'Marks Inc', 'dolorem', 2007, 'R97R2KUMN03B04GTJ', 'CYD945', 15726.00, 'purple', 'Gasoline', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(191, 'Kohler-Bashirian', 'distinctio', 2007, 'Y123VAXYNFFFPB1MP', 'XFD556', 27167.00, 'purple', 'Diesel', 'Manual', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(192, 'Ratke, Willms and Jaskolski', 'et', 2006, 'HZUC89S46JH8P346J', 'KUK045', 40599.00, 'olive', 'Gasoline', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(193, 'Ryan-Klein', 'distinctio', 2020, 'VH7CG26LM0RYZN8UH', 'HNN165', 39125.00, 'black', 'Gasoline', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(194, 'Bartoletti Group', 'non', 2009, 'R0RKWHWVE5V5HNJUK', 'VJQ384', 30541.00, 'blue', 'Diesel', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(195, 'Macejkovic Inc', 'laudantium', 2024, 'X03357R82YW095293', 'RDR713', 42319.00, 'maroon', 'Diesel', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(196, 'Reinger and Sons', 'qui', 2016, 'ZR4F34AEX1ET3H6SB', 'ZHH001', 41179.00, 'teal', 'Diesel', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(197, 'Beahan-Brekke', 'at', 2001, 'YBWVFD3YA4PM2BXF2', 'RJG441', 49636.00, 'yellow', 'Electric', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(198, 'Russel, Huel and Mitchell', 'id', 2013, 'L39ZW898KE5G406C1', 'RKO365', 25021.00, 'aqua', 'Gasoline', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(199, 'Koepp, O\'Reilly and Kuphal', 'ducimus', 2001, 'RJ4XRJ5FGVYWR278X', 'QUY134', 40669.00, 'aqua', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(200, 'Leffler Group', 'tempora', 2019, 'B8L91CAC3JLDEUM4A', 'BZQ412', 19867.00, 'gray', 'Gasoline', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(201, 'Watsica, Fahey and Weber', 'quae', 2019, '200J5BU27E63BFFH4', 'NUS444', 19637.00, 'maroon', 'Electric', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(202, 'Schmeler Group', 'autem', 2000, '6F6J1ATKD9UCMV2HT', 'QSY986', 42917.00, 'purple', 'Gasoline', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(203, 'Baumbach, Kuphal and Grant', 'nobis', 2003, 'VZXTPJZM1MZBWD8YS', 'UST251', 25985.00, 'blue', 'Gasoline', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(204, 'Sporer, Barton and Mosciski', 'officiis', 2014, 'MK6B4W60PJ7CD6ED1', 'DEE871', 34261.00, 'navy', 'Electric', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(205, 'Volkman and Sons', 'nesciunt', 2019, '1Z46WRGZ2NUG0J2PE', 'HDA503', 29875.00, 'teal', 'Electric', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(206, 'Luettgen PLC', 'perspiciatis', 2002, 'S7SRA7205G5JV5A67', 'UVO549', 31194.00, 'teal', 'Electric', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(207, 'Donnelly-Stehr', 'reprehenderit', 2008, 'BMLA6DDX62M9NFVJG', 'VWN559', 39322.00, 'silver', 'Electric', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(208, 'Strosin LLC', 'optio', 2000, 'T9GJM41J1Z61DC406', 'BDE026', 11719.00, 'aqua', 'Diesel', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(209, 'Goldner-Cassin', 'ut', 2015, 'BPF4GNTAV64X1JESW', 'EKY351', 20797.00, 'green', 'Electric', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(210, 'Watsica, Roob and Rolfson', 'qui', 2009, '0GD3PD7B2ADUN3D6H', 'RZA701', 11695.00, 'black', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(211, 'Dach-McKenzie', 'similique', 2014, '0YXVGUVPG4TUC63T4', 'PCT377', 36703.00, 'gray', 'Gasoline', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(212, 'Halvorson, White and Yost', 'cum', 2021, 'CMPZJVJ24SM09C1PV', 'WAF918', 39165.00, 'fuchsia', 'Electric', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(213, 'Pollich and Sons', 'et', 2020, 'CDD24X9M9N9CYJNZG', 'XUY895', 48702.00, 'gray', 'Electric', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(214, 'Boehm Group', 'consequatur', 2006, 'UPFZ8PRG83AX6Y4HT', 'BZS344', 35812.00, 'silver', 'Gasoline', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(215, 'Fritsch, O\'Hara and Steuber', 'fugiat', 2012, 'LBBVHHGS4UVGAAYT7', 'GQG425', 12908.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(216, 'Pouros, Ruecker and Breitenberg', 'voluptate', 2002, 'J48HG3MVF3F232SYB', 'VSS340', 30549.00, 'yellow', 'Diesel', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(217, 'Okuneva, Wyman and Conn', 'placeat', 2011, '876LNB93EEFM96C9A', 'BBP927', 15154.00, 'teal', 'Electric', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(218, 'Trantow, Will and Willms', 'qui', 2002, 'JT34N9TWN7ZAHN8S5', 'ROO037', 17559.00, 'gray', 'Electric', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(219, 'Grimes LLC', 'odio', 2014, '5BE9G2PFJ3SM3EDAH', 'WCP744', 34674.00, 'yellow', 'Gasoline', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(220, 'Leannon-Dooley', 'dolorum', 2023, '93KJNDAJJZX70VS18', 'VBE795', 20545.00, 'blue', 'Electric', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(221, 'Bergstrom-Conroy', 'est', 2007, '26EEU5JSPWWY17ACM', 'YXJ909', 21622.00, 'green', 'Gasoline', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(222, 'Kub-Kling', 'quia', 2010, 'VBGE8FR3EE9138Y7Y', 'AFW633', 33316.00, 'purple', 'Gasoline', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(223, 'Gerlach, Boehm and Simonis', 'sunt', 2014, '29SZR9N4VS35DLWE6', 'YQX655', 42055.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(224, 'Moore-Pfannerstill', 'consectetur', 2012, 'XZU5ZV3ZDDE9VN4SV', 'QVM249', 28252.00, 'lime', 'Electric', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(225, 'Steuber-Windler', 'quasi', 2021, 'KBYAGSUNW00MY1HRE', 'AGT281', 38947.00, 'aqua', 'Diesel', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(226, 'Russel, Hyatt and Gusikowski', 'accusantium', 2012, 'SAHGVZZWASG1WB48B', 'FWH555', 27046.00, 'aqua', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(227, 'Homenick-Shields', 'delectus', 2014, 'VX4NEPER36DSZDVCX', 'RZT111', 22435.00, 'black', 'Electric', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(228, 'O\'Reilly LLC', 'cumque', 2022, 'C4BEHF56H66CG4H7A', 'MWB723', 32153.00, 'yellow', 'Electric', 'Manual', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(229, 'Reilly Group', 'fugit', 2016, '84ZK3RJW6B5350JP2', 'HRY027', 17270.00, 'blue', 'Electric', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(230, 'Brekke-O\'Kon', 'sunt', 2024, 'HYM74RK4609Y8BM3G', 'GNT288', 39613.00, 'lime', 'Diesel', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(231, 'Hansen-Fadel', 'autem', 2006, 'V5WMZ01RYGHSVWM3M', 'JNU399', 38926.00, 'green', 'Diesel', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(232, 'Mayer LLC', 'explicabo', 2017, 'GJV6XF0Z3AAC49HCL', 'XVZ691', 15266.00, 'olive', 'Gasoline', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(233, 'Thiel Group', 'libero', 2013, 'L27BRUYPX67STYUPW', 'TSL303', 13364.00, 'navy', 'Gasoline', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(234, 'Sauer-Krajcik', 'illo', 2021, 'WNVPEAVCT7TME9KWY', 'CVE325', 49761.00, 'navy', 'Electric', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(235, 'Kerluke, Cronin and Hermiston', 'officia', 2007, 'RH8XHNHBZ1VLX9UXD', 'BXO739', 20242.00, 'aqua', 'Diesel', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(236, 'Weissnat LLC', 'et', 2020, 'SWVCK3YHTUGSRHUWC', 'LAN755', 13998.00, 'olive', 'Gasoline', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(237, 'Senger, Haley and Shields', 'quas', 2000, '5SH981D5LDGJN355D', 'PBC318', 21011.00, 'silver', 'Diesel', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(238, 'Hirthe-Romaguera', 'temporibus', 2015, 'HNGJ0KY8MHHCEYYS2', 'VNO897', 18344.00, 'navy', 'Gasoline', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(239, 'Wehner Group', 'quia', 2003, 'FNMM70T0TYF9V9J59', 'FOM911', 30009.00, 'green', 'Gasoline', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(240, 'Simonis-Bartell', 'sunt', 2006, '229EW4KUZSMFA4V6W', 'IZK683', 22055.00, 'maroon', 'Diesel', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(241, 'Connelly-Vandervort', 'iure', 2009, 'AX8XSJBGVYJ8A294T', 'TOY623', 30384.00, 'blue', 'Diesel', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(242, 'Hettinger Inc', 'commodi', 2001, 'W4NRX01NPH4CEJR0X', 'XEV583', 21594.00, 'gray', 'Gasoline', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(243, 'Welch, Swaniawski and Crist', 'nostrum', 2011, 'ABMPMVV33J2KVY56F', 'AUV063', 24786.00, 'teal', 'Diesel', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(244, 'Haag, Crooks and Paucek', 'repellendus', 2016, '93LCXJ37SDDND56BT', 'KIX399', 24980.00, 'teal', 'Electric', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(246, 'Wolff-Gleichner', 'placeat', 2020, '6EPL9BY5EY7JC57GT', 'KQS464', 36657.00, 'silver', 'Gasoline', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(247, 'Rodriguez Inc', 'mollitia', 2004, 'XYE3JMW29TU6M53HE', 'UHO081', 35637.00, 'silver', 'Diesel', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(248, 'Bergstrom LLC', 'atque', 2007, 'P8CWF2DHH49TZTS3K', 'HFO263', 41988.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(249, 'Toy LLC', 'officiis', 2004, 'ZC9D7F6Y3YXRVAT08', 'DSW801', 24621.00, 'silver', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(250, 'Hettinger, Daugherty and Kovacek', 'corporis', 2004, '19JBHP84VD3C63A6Y', 'QVY329', 47733.00, 'white', 'Diesel', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(251, 'Klocko Inc', 'minima', 2012, 'F2P0LN24HP2AA0CWV', 'PCL126', 19086.00, 'lime', 'Diesel', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(252, 'Schumm PLC', 'suscipit', 2023, 'C8308U89KP5DKLCCR', 'FIY108', 41376.00, 'purple', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(253, 'Osinski-Monahan', 'velit', 2020, 'NLL2ELAZ4RLJLLVVY', 'CNS034', 45040.00, 'purple', 'Gasoline', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(254, 'Becker-Adams', 'maxime', 2007, 'GXFCUH6ABJ0DEUN2L', 'ICL973', 38972.00, 'blue', 'Electric', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(255, 'Kling-Purdy', 'voluptatem', 2012, 'WGC7KV3L6XGYVDVNZ', 'ZVE709', 10213.00, 'teal', 'Gasoline', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(256, 'Olson-Maggio', 'aspernatur', 2004, '70RMPZUPDXU0AFKS3', 'DZB536', 44739.00, 'white', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(257, 'Sauer, Bahringer and King', 'animi', 2015, 'B35TJUN2PZ4F8Z46P', 'IWA087', 24572.00, 'navy', 'Electric', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(258, 'Considine Ltd', 'voluptatem', 2008, 'GUWDY8S42R7SHXHFD', 'FMR696', 29420.00, 'green', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(259, 'McLaughlin-Walsh', 'ut', 2022, 'S6S83T2GHND7HB7SP', 'CFV663', 18262.00, 'maroon', 'Gasoline', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(260, 'Waters-Rolfson', 'possimus', 2021, 'URFLSFH9WRNF01UGK', 'IGH613', 25493.00, 'yellow', 'Gasoline', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(261, 'Pouros-Willms', 'nobis', 2001, '5W020YAZEUZUNPG5X', 'LMV203', 41660.00, 'black', 'Electric', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(262, 'Gleichner, Renner and Koch', 'aut', 2004, 'DX5YV8P7JNWM09P1Z', 'ASW053', 22985.00, 'lime', 'Gasoline', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(263, 'Runte Inc', 'error', 2017, 'PWJLEHXV9NTBZLD0F', 'OEX446', 42714.00, 'white', 'Electric', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(264, 'Kerluke, Bradtke and Herzog', 'provident', 2022, '3CBVN7ZJGRJHGKV6D', 'WEK782', 29377.00, 'white', 'Gasoline', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(265, 'Tillman, Deckow and Mann', 'occaecati', 2009, 'Z5M3JU0MUV1FYJUXL', 'DXF713', 13266.00, 'olive', 'Electric', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(266, 'Bradtke Ltd', 'sit', 2023, 'RPWA0BX1CFHDAX9BA', 'VXV055', 26130.00, 'silver', 'Electric', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(267, 'Pollich and Sons', 'illum', 2013, '6TNYFWSHVHN34DFZ2', 'QMI562', 38997.00, 'olive', 'Gasoline', 'Manual', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(268, 'Carter-Yundt', 'sunt', 2018, 'N78RXVKF6ZMHH777Y', 'DYK534', 40622.00, 'navy', 'Gasoline', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(269, 'Hirthe PLC', 'facere', 2012, 'RDYF2BVN4H8MWGNLU', 'TBO300', 28692.00, 'lime', 'Diesel', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(270, 'Botsford, Hand and Bode', 'eum', 2003, 'DFM6R3HDTLHCWCPDC', 'NMZ544', 17532.00, 'navy', 'Diesel', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(271, 'Upton-Stamm', 'est', 2013, '08L5UDXH2TGW3RUZP', 'FAP187', 18112.00, 'fuchsia', 'Electric', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(272, 'Blanda Ltd', 'aut', 2008, '8AA71VRFR866AK372', 'KAI359', 38752.00, 'silver', 'Electric', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(273, 'Schumm, Brown and Bayer', 'quis', 2009, 'E5SHMFKSH9PHK7B0L', 'XRR762', 30698.00, 'yellow', 'Electric', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(274, 'Fadel, Stokes and Rogahn', 'voluptas', 2001, 'FHXJGJEEC6TH6PENJ', 'BTU622', 10824.00, 'black', 'Gasoline', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(275, 'Moore, Kreiger and Johnson', 'accusantium', 2010, 'B4JGB791UJF01DAS9', 'RKG919', 10002.00, 'yellow', 'Diesel', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(276, 'Connelly and Sons', 'qui', 2019, '4KVHW41TDAREUH8EB', 'XVG655', 24470.00, 'teal', 'Diesel', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(277, 'Sipes, Balistreri and Mosciski', 'ut', 2010, '6H39EER1S4DPRDGLW', 'KRW476', 39677.00, 'green', 'Diesel', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(278, 'Fay, Moore and Turcotte', 'dolorem', 2005, 'C2DBG0TY0SV3LECJG', 'WYE351', 43327.00, 'fuchsia', 'Diesel', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(279, 'Bradtke-Will', 'consequatur', 2022, 'R7VCX841C900BEGY0', 'AQR418', 33236.00, 'purple', 'Electric', 'Manual', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(280, 'Ullrich, Kiehn and Swaniawski', 'cum', 2017, '2MUY6VXXZ4689UL0A', 'ECT584', 12770.00, 'maroon', 'Diesel', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(281, 'Kozey, Zulauf and Gislason', 'dolores', 2015, '2GJN3V96WPVTBMD34', 'YGP951', 14762.00, 'black', 'Electric', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(282, 'Hirthe-Will', 'occaecati', 2018, '7SYYBYAVLZ620JWEX', 'SWQ371', 36900.00, 'blue', 'Diesel', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(283, 'Koepp-Lueilwitz', 'dolor', 2003, 'YA8VE5YGSXRKU93E1', 'HDZ994', 40718.00, 'navy', 'Gasoline', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(284, 'Hettinger-Vandervort', 'et', 2010, '5CWPV6ALWYH6BZW9W', 'RQZ465', 27084.00, 'navy', 'Diesel', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(285, 'Welch-Dooley', 'repellendus', 2007, 'P6M7ZV9ZAFX1RH28B', 'FZI175', 47575.00, 'black', 'Electric', 'Manual', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(286, 'Tromp and Sons', 'inventore', 2022, '2WYKX1DNVESW2LNRD', 'USP087', 21758.00, 'teal', 'Electric', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(287, 'Hane PLC', 'officia', 2023, 'XRRTLF4L5KTVZL712', 'MOD087', 17368.00, 'black', 'Electric', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(288, 'Klocko Ltd', 'omnis', 2004, '8LNVVUZ0JFCY78S79', 'HHL182', 42541.00, 'aqua', 'Electric', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(289, 'Mraz-Johns', 'tenetur', 2021, 'GNE3V17BWWRK4C0TC', 'KEB798', 29525.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(290, 'Spencer, Osinski and Hyatt', 'sed', 2015, '6K3NGXB7F3AWVZYW3', 'IRN406', 45265.00, 'gray', 'Diesel', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48');
INSERT INTO `cars` (`id`, `make`, `model`, `year`, `VIN`, `license_plate_number`, `price`, `color`, `fuel_type`, `transmission_type`, `status`, `quantity`, `created_at`, `updated_at`) VALUES
(291, 'Klein Inc', 'aut', 2014, '0U6SHBWK66BFM6BZP', 'QGZ891', 25876.00, 'gray', 'Gasoline', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(292, 'Zieme, Bernier and Bartoletti', 'sed', 2006, '1Z85GEDXX8RRKGB7P', 'HLJ632', 25550.00, 'lime', 'Diesel', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(293, 'Zulauf, Monahan and Gusikowski', 'magnam', 2019, 'A748E13KNSPAKN88F', 'YNY815', 36698.00, 'olive', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(294, 'O\'Connell, Osinski and Dickens', 'iste', 2019, '0AMLHBZ74HSL1R80F', 'ENT118', 41681.00, 'silver', 'Electric', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(295, 'Gibson, Ziemann and Bayer', 'velit', 2000, '8492KS4JYKDRXE1BY', 'RVF788', 11702.00, 'blue', 'Gasoline', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(296, 'Berge-Harber', 'eveniet', 2020, 'VFN7C4GXJDPTHZTNV', 'DIG781', 45151.00, 'aqua', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(297, 'Gislason, Hansen and Kunze', 'nihil', 2000, '6E4TT0YNYRAJGGT1K', 'EKL509', 29910.00, 'olive', 'Gasoline', 'Automatic', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(298, 'Pfannerstill Group', 'in', 2018, 'NEP4EA0EPMBR1U642', 'HZD131', 41887.00, 'gray', 'Gasoline', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(299, 'Simonis-Rogahn', 'et', 2003, '8AKC7FDRLL4YZ4NLX', 'SVT833', 15067.00, 'fuchsia', 'Gasoline', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(300, 'Hickle Group', 'magni', 2002, 'J7NS2VF9VN8TNJUFY', 'SLR833', 13241.00, 'black', 'Gasoline', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(301, 'Greenholt, Boyer and Harvey', 'enim', 2015, 'SCWH9ZAH3PYM61WHM', 'OZG371', 48186.00, 'blue', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(302, 'O\'Keefe Inc', 'sint', 2015, '2VRDTNWWZX7A47MKE', 'MGO323', 16821.00, 'maroon', 'Diesel', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(303, 'Powlowski, Bergnaum and Schneider', 'et', 2005, 'JHLZEBLGBF9L6AWHF', 'GPM624', 29514.00, 'black', 'Electric', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(304, 'Brekke LLC', 'voluptatum', 2022, 'HSSWC3ZG2M1WWNVP0', 'GNH364', 27054.00, 'white', 'Diesel', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(305, 'Kozey Group', 'ut', 2004, 'FZUZ3U694U9B1L06T', 'VZS657', 34544.00, 'purple', 'Diesel', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(306, 'Yost Ltd', 'minus', 2007, 'K1V6RDCBPC05XP5FX', 'HLW036', 21600.00, 'navy', 'Diesel', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(307, 'Hill LLC', 'ipsa', 2016, 'T9MF2METGX173GF42', 'PAG566', 29432.00, 'navy', 'Diesel', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(308, 'Fahey-Leffler', 'autem', 2008, '5ZFTY95K62EY2UPM0', 'OXF661', 36460.00, 'black', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(309, 'Hyatt Group', 'quis', 2004, '9RV4CESGCYEBK6YU2', 'XET546', 29442.00, 'aqua', 'Gasoline', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(310, 'Blick-Runte', 'atque', 2000, 'GRFS0YSWM5WKMMVLZ', 'XMV404', 47326.00, 'lime', 'Gasoline', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(311, 'Ritchie-Kozey', 'ratione', 2011, 'TA8KPLFRVW211Z7CK', 'IPP072', 30395.00, 'white', 'Electric', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(312, 'Hansen-Mueller', 'sit', 2016, 'JMWLWZCM59PDHLYK2', 'ULS758', 43505.00, 'white', 'Diesel', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(313, 'Schimmel PLC', 'dolorem', 2021, 'VSHW746J6CJUZ2ZRC', 'PEC204', 10449.00, 'black', 'Gasoline', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(314, 'Bashirian PLC', 'rerum', 2019, 'X3U4Y623BE3TZ4UDG', 'EYX786', 24327.00, 'teal', 'Diesel', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(315, 'Lind, Marquardt and Paucek', 'a', 2019, 'D2WYDD7BB9U7VHJXV', 'MOO334', 22973.00, 'olive', 'Diesel', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(316, 'Bartoletti and Sons', 'modi', 2014, 'BX04WM1FE718U3Z5Z', 'ERZ869', 18784.00, 'purple', 'Diesel', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(317, 'Feeney, Bogisich and Ziemann', 'quidem', 2006, '2HYBU77S2ASKJLYJ3', 'KVG060', 36929.00, 'green', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(318, 'Kiehn Inc', 'vitae', 2023, 'J7CDNF8RLS98AGUB0', 'SFL391', 27810.00, 'white', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(319, 'Baumbach PLC', 'ut', 2015, '9MGMNM8U0JV3BZGFR', 'AIH891', 14375.00, 'aqua', 'Gasoline', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(320, 'Tillman-Krajcik', 'quaerat', 2010, 'WMJMT0EE98ERZZMNF', 'AGT371', 18878.00, 'black', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(321, 'Dickens, Kunde and Farrell', 'libero', 2003, 'VV38Y6G4PS0J8YDZT', 'DMA754', 49870.00, 'black', 'Electric', 'Manual', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(322, 'McCullough, Schmitt and Rice', 'omnis', 2009, 'XYJ0XRDDYS6DVM052', 'SBB024', 29881.00, 'black', 'Diesel', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(323, 'Stracke, Witting and Mosciski', 'voluptas', 2004, 'JGXF7HTPGTHL5ZTMR', 'KLU426', 33552.00, 'gray', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(324, 'Kreiger-Kuvalis', 'quo', 2010, 'B55VTTDH4BP9022HV', 'HRB542', 31622.00, 'blue', 'Electric', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(325, 'Schaden Ltd', 'necessitatibus', 2010, 'AR9W56ED13J330E8K', 'LZX081', 41307.00, 'black', 'Electric', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(326, 'Cummings, Boehm and Tillman', 'labore', 2022, 'RNLBD304SG9DFTL9L', 'LQX509', 49492.00, 'silver', 'Electric', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(327, 'Schowalter PLC', 'enim', 2013, 'GC3798HHYZX85Z3JG', 'EKX994', 31076.00, 'yellow', 'Gasoline', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(328, 'Cole-Bailey', 'qui', 2022, 'KJE3EVP50UY5DJE2T', 'OIK896', 26689.00, 'olive', 'Gasoline', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(329, 'Hills PLC', 'iure', 2008, '817109HEGAK572R70', 'RVU407', 21452.00, 'olive', 'Diesel', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(330, 'McClure, Hansen and Parisian', 'hic', 2004, 'VW5YKYJPXDSW9VHT9', 'BJD441', 37111.00, 'aqua', 'Electric', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(331, 'Romaguera-Crist', 'facere', 2020, 'Y2GU873KT6DAVN416', 'KPT933', 12856.00, 'purple', 'Electric', 'Automatic', 'Available', 17, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(332, 'Padberg-Grady', 'ipsam', 2004, 'F2ZC8S35Z1ST9UKHU', 'WGA115', 31157.00, 'maroon', 'Electric', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(333, 'Stark-Sauer', 'a', 2000, '8YT157RM10C93R9FT', 'XWH307', 40510.00, 'lime', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(334, 'Cartwright, Buckridge and Tillman', 'id', 2021, '7RSAWXUXH5CRU6HZ5', 'UDZ091', 48000.00, 'blue', 'Diesel', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(335, 'Rosenbaum, Altenwerth and Cummings', 'rerum', 2005, 'J7S81BSRH6CR6KEKP', 'LSK290', 33167.00, 'maroon', 'Diesel', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(336, 'Borer-Reinger', 'exercitationem', 2001, 'AAZ4LD745P47AGS0A', 'THU414', 49459.00, 'fuchsia', 'Diesel', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(337, 'DuBuque, Weber and Christiansen', 'quis', 2004, 'X4SHWXDJRT9YTFG71', 'UHA137', 30617.00, 'navy', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(338, 'Quigley, Padberg and Larson', 'iure', 2015, '6SF1BNZEWA4M2ENR7', 'JBU116', 35901.00, 'white', 'Gasoline', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(339, 'Goldner, Durgan and Kemmer', 'hic', 2020, 'A5F4VZZHY8X6SZP66', 'NPM996', 19086.00, 'navy', 'Diesel', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(340, 'Cassin, Nitzsche and Johns', 'consectetur', 2018, '985K77TH1GJLAZS61', 'GPH467', 38285.00, 'maroon', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(341, 'Kertzmann, Brown and Parisian', 'neque', 2008, '75JREDJDYAJDZWXUG', 'WTM582', 32449.00, 'navy', 'Gasoline', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(342, 'Bosco Group', 'nobis', 2010, 'AX7PL0HWDF21M89X6', 'GGK819', 39234.00, 'navy', 'Diesel', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(343, 'Fisher LLC', 'adipisci', 2011, 'C3PTZF9A0PEPWBUPF', 'EQF815', 22978.00, 'green', 'Electric', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(344, 'Roberts-Legros', 'accusantium', 2009, 'H86AVHJ643FFKFH20', 'GDY267', 20050.00, 'navy', 'Gasoline', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(345, 'Becker, Von and Hilpert', 'et', 2006, '4KFV1BDHRBVRLYTVM', 'HIK244', 36405.00, 'fuchsia', 'Electric', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(346, 'D\'Amore, Blick and Glover', 'praesentium', 2015, 'VVH1TTEDNAJUMYG09', 'AIB184', 42852.00, 'black', 'Diesel', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(347, 'Mayer-Dare', 'nam', 2006, '0G3B8GMUHT62BGPGS', 'WEW926', 36712.00, 'lime', 'Gasoline', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(348, 'Lockman-Dooley', 'deleniti', 2020, 'N3G4FZX0PM6X2W9K6', 'MSB586', 23516.00, 'navy', 'Electric', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(349, 'Erdman-Weissnat', 'sequi', 2024, 'SNE4L5TC7XDWR2DT5', 'YVM276', 28629.00, 'maroon', 'Diesel', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(350, 'Friesen, Quigley and Crooks', 'officiis', 2019, 'D90D6EUSXGVMHMV2S', 'XHG836', 43422.00, 'teal', 'Electric', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(351, 'Ferry-Stamm', 'ut', 2001, '9JAW512VL7VJAR412', 'UHN838', 39456.00, 'white', 'Electric', 'Manual', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(352, 'Nader, Kemmer and Wisoky', 'sed', 2017, 'ZEB5UWL5NHSMDHZA5', 'ATZ908', 48695.00, 'yellow', 'Gasoline', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(353, 'Boyer, Mitchell and Kessler', 'quisquam', 2001, 'V5RN12VKJJPPJLYGA', 'AJG315', 22490.00, 'purple', 'Diesel', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(354, 'Parker-Konopelski', 'illum', 2000, 'P3V0HB556VMPKEV99', 'NOS414', 11884.00, 'purple', 'Electric', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(355, 'Torphy, Labadie and Feest', 'porro', 2013, 'SMKT8YSAGKXH91ZLX', 'MBZ259', 14064.00, 'white', 'Gasoline', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(356, 'Reynolds, Rippin and Marvin', 'minima', 2012, 'NVRU2LFM0C76SUFJY', 'TEV562', 15781.00, 'lime', 'Electric', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(357, 'Metz-Strosin', 'nam', 2008, 'EH18SBJRHPHUDAGXC', 'TKD794', 17936.00, 'green', 'Electric', 'Manual', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(358, 'Schulist-Braun', 'voluptas', 2000, 'KRHP0EJL6GU35TTV7', 'HCS667', 24914.00, 'green', 'Electric', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(359, 'Rogahn Inc', 'qui', 2011, 'J3KY6HHX6CL965D0N', 'XSM644', 20106.00, 'silver', 'Diesel', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(360, 'Legros Inc', 'et', 2010, 'PE2PYLNCP3ULSDRWG', 'EXQ256', 35901.00, 'blue', 'Diesel', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(361, 'Nikolaus Ltd', 'in', 2022, 'HDUWBGE9914ZZUEWF', 'VUW292', 11033.00, 'olive', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(362, 'Gutmann-Botsford', 'et', 2013, 'K7GG81DYTV16UPXRH', 'VCA498', 32650.00, 'yellow', 'Electric', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(364, 'O\'Connell-Tromp', 'quod', 2009, 'ZEHACD2L1F22Y12TD', 'OOH278', 24845.00, 'fuchsia', 'Diesel', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(365, 'Ward LLC', 'et', 2013, 'YGTYWMB0DAT8K4XED', 'EIA925', 44739.00, 'purple', 'Electric', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(366, 'Hahn-Schmeler', 'dolorum', 2000, '3CP7GGERD1T1JE1UL', 'BMH179', 20929.00, 'black', 'Gasoline', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(367, 'Lubowitz-Kihn', 'aliquam', 2016, '7THMJRPV5EFYKH5FD', 'GIN674', 42635.00, 'fuchsia', 'Electric', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(368, 'Nitzsche-Wisoky', 'consequuntur', 2022, 'VXU7FJZGSXEG8RTLZ', 'IZE671', 48521.00, 'blue', 'Gasoline', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(369, 'Gibson, Nienow and Gorczany', 'velit', 2014, '8XBDX98DENDZJEZYB', 'QKH136', 17346.00, 'green', 'Diesel', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(370, 'Romaguera Group', 'fugiat', 2021, '8SG01MF5U41SKR0JY', 'LPS747', 22803.00, 'lime', 'Diesel', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(371, 'Bechtelar, Bartell and Bartoletti', 'beatae', 2008, 'ZYSHCHAWPHB582WTD', 'HZK824', 27648.00, 'fuchsia', 'Diesel', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(372, 'Bosco-Lemke', 'ad', 2015, '1K3WSJHM5DR0GMMH2', 'VOO626', 42294.00, 'yellow', 'Diesel', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(373, 'Schaefer, Mann and Walker', 'nam', 2016, 'NUNDWZ8NKAKJG02TB', 'VPX779', 40940.00, 'olive', 'Diesel', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(374, 'McDermott Ltd', 'provident', 2007, '3ED11XW7FTH33EJC1', 'CMT909', 26377.00, 'navy', 'Electric', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(375, 'Kunze Ltd', 'ut', 2002, '1ZPJRTBDNRCNF702J', 'JVR508', 15478.00, 'navy', 'Diesel', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(376, 'Kautzer, Oberbrunner and Auer', 'cum', 2020, 'MP01S153L233KKVMH', 'YFE889', 38632.00, 'white', 'Electric', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(377, 'Ryan Group', 'sed', 2007, 'SGSHRY9P80V2N980M', 'GMD873', 20208.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(378, 'McGlynn Group', 'eaque', 2015, '6ZJJ6BSM24NDR0A91', 'JSB282', 40607.00, 'white', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(379, 'Wunsch-Stroman', 'tenetur', 2010, 'LK8APTM99VR2FPY8K', 'SWR983', 10602.00, 'teal', 'Electric', 'Manual', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(380, 'Considine-Dare', 'voluptate', 2021, 'L35SCTVJX5W9M46AX', 'CVW862', 37355.00, 'gray', 'Diesel', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(381, 'Von PLC', 'sed', 2005, 'Z82806NXX7VG19GPD', 'MLE794', 46358.00, 'yellow', 'Diesel', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(382, 'Mohr PLC', 'a', 2003, 'ER2UPVVE1T7CHACX0', 'SBG451', 44010.00, 'teal', 'Gasoline', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(383, 'Bergstrom, Bechtelar and Mante', 'numquam', 2001, 'X7LFRJWM3P8JASFR3', 'TWX493', 32508.00, 'navy', 'Gasoline', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(384, 'Cassin, Emmerich and Little', 'accusamus', 2005, 'GY5DZXAH2VM5A60WU', 'MVV567', 30446.00, 'aqua', 'Gasoline', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(385, 'Feil PLC', 'omnis', 2024, 'DP02RU6E5BSNUX106', 'FYA428', 41618.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(386, 'Shields, Pfeffer and McCullough', 'hic', 2005, 'FB8BAUPZ8YVS34V44', 'VXO678', 39209.00, 'white', 'Diesel', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(387, 'Haley, Raynor and Lehner', 'consequatur', 2002, 'XZAH587VSRNX7XNEL', 'IHN156', 44450.00, 'olive', 'Diesel', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(388, 'Kutch and Sons', 'id', 2023, '5E3L4ZG9TS40DNR3U', 'HEB265', 21704.00, 'maroon', 'Gasoline', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(389, 'DuBuque Ltd', 'sunt', 2001, '5A0AAU4R63F77H3MZ', 'LWY150', 14885.00, 'teal', 'Electric', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(390, 'Gaylord, Ziemann and Runolfsson', 'sapiente', 2022, 'EZY5A0U406GG6EJA3', 'KKL344', 15033.00, 'lime', 'Diesel', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(391, 'Reynolds, Muller and Turcotte', 'molestias', 2008, '52JSCRZX80EUHH8R6', 'FMN714', 10918.00, 'gray', 'Gasoline', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(392, 'Ward, Crona and Gibson', 'modi', 2015, 'VTKFWXMU2BHDV64HS', 'UVW576', 46775.00, 'olive', 'Electric', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(393, 'Green Group', 'atque', 2023, 'KE57CXZXK1GFHJY1W', 'QYL161', 19781.00, 'aqua', 'Gasoline', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(394, 'Pfannerstill-Glover', 'fugit', 2006, '0DWH304D5U0KDLMY1', 'DTQ622', 20638.00, 'black', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(395, 'Larson PLC', 'necessitatibus', 2020, 'ZHA9BFWBY383FF1PU', 'QDY573', 49058.00, 'lime', 'Diesel', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(396, 'McKenzie-Macejkovic', 'fuga', 2023, 'JHUDVX995REHSCFMW', 'VUY346', 35800.00, 'green', 'Electric', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(397, 'Bosco, Wolf and Langosh', 'enim', 2021, '0K8MA2YURZ9JKX7KC', 'RTO585', 26712.00, 'navy', 'Diesel', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(398, 'Barton, Weissnat and Zieme', 'et', 2023, 'VU1CRUPZ60END1HPL', 'YHF497', 13892.00, 'teal', 'Diesel', 'Manual', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(399, 'Leuschke, Waelchi and Balistreri', 'voluptatem', 2005, 'S890UWA803R6CB5T4', 'VDP517', 15743.00, 'blue', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(400, 'Kerluke and Sons', 'et', 2006, '3X7PJ73VUM3UNPBHF', 'DSX361', 39869.00, 'gray', 'Diesel', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(401, 'Hirthe-Dicki', 'consequatur', 2002, 'EHNPVKFJJLVKNLKJV', 'ICC816', 46607.00, 'black', 'Electric', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(402, 'Padberg-Conroy', 'porro', 2009, 'T9XZ0CDVJ04TST51V', 'RSC378', 28375.00, 'gray', 'Gasoline', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(403, 'DuBuque-Ullrich', 'impedit', 2008, '01CZND767833AFTWJ', 'VDH451', 19728.00, 'black', 'Gasoline', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(404, 'Shanahan-Wilkinson', 'aut', 2014, '8D9VSLEKP04T1BVBV', 'LTA403', 40262.00, 'aqua', 'Gasoline', 'Automatic', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(405, 'Runolfsson LLC', 'voluptate', 2012, 'WKCKC6HBGAJVK054V', 'JGZ590', 44093.00, 'black', 'Diesel', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(406, 'Hagenes, Trantow and Larkin', 'eveniet', 2003, 'B1V0D123AS8YS7Y0U', 'XXW649', 43752.00, 'blue', 'Electric', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(407, 'Emmerich PLC', 'et', 2020, '223RZ5RW0BKJJYV7V', 'MXK516', 19791.00, 'lime', 'Gasoline', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(408, 'Welch-Dare', 'laboriosam', 2010, 'UWUSEHHL1A53BYL27', 'PUY080', 11796.00, 'aqua', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(409, 'Ryan, Lockman and Cremin', 'tenetur', 2009, '92HABG8GBNHZJN8S7', 'QRD493', 34979.00, 'maroon', 'Electric', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(410, 'McClure, Kerluke and Huel', 'nihil', 2010, 'JMW6MTBZBLBMV1DBG', 'PCI676', 41420.00, 'olive', 'Gasoline', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(411, 'Rath PLC', 'inventore', 2012, 'DTMELBBM9NNM6HZ24', 'BPR500', 32022.00, 'maroon', 'Electric', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(412, 'Veum-Mohr', 'quidem', 2019, 'GCFWBWL8TZEWV2WPK', 'MCZ622', 28829.00, 'yellow', 'Gasoline', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(413, 'Beatty, Marks and Lehner', 'ad', 2010, 'FG9GMWLZ2ZPP5LNMU', 'YQX172', 13036.00, 'white', 'Gasoline', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(414, 'Dietrich, Schimmel and Maggio', 'repudiandae', 2014, 'SCW09T3V7D39PNT78', 'QPL410', 42391.00, 'maroon', 'Electric', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(415, 'Reichert-Rau', 'provident', 2011, 'UVLTNHJNWK2XEP1PP', 'WBB107', 32686.00, 'white', 'Electric', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(416, 'Renner and Sons', 'molestiae', 2013, '7ZTVSSBY4VA4R3DGY', 'EBK334', 18738.00, 'green', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(417, 'O\'Hara-Wolff', 'laborum', 2020, '04DTFJV02ZYVZT6Y7', 'WUU186', 42802.00, 'green', 'Diesel', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(418, 'Klein-Rath', 'ut', 2010, 'XE5BJE2VYYG505256', 'DBB680', 20027.00, 'green', 'Diesel', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(419, 'Okuneva Inc', 'quis', 2008, 'CR0TB4A65CNDZKGE0', 'BUY777', 22526.00, 'yellow', 'Gasoline', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(420, 'Wehner, Renner and Fay', 'dolore', 2008, 'Z5GGYJBC8305N1T2J', 'YJR690', 15421.00, 'purple', 'Gasoline', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(421, 'O\'Keefe, Kautzer and Waelchi', 'qui', 2002, '5LXWUP4EMEDTDNCE4', 'ROZ683', 17169.00, 'aqua', 'Electric', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(422, 'Franecki LLC', 'voluptatibus', 2001, '3M7EH6HHZMTMZMTLN', 'IZI341', 36209.00, 'white', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(423, 'Wisoky and Sons', 'ut', 2017, '38TS4K3L5EEJK3KHA', 'FHK032', 33966.00, 'yellow', 'Gasoline', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(424, 'Paucek, Rath and Gislason', 'sed', 2014, 'JLDZK3MCA6P694804', 'UWK381', 43338.00, 'blue', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(425, 'Bradtke, Konopelski and Bernier', 'molestiae', 2005, 'ED6K3UJDEEG8R7VC6', 'JOD212', 22230.00, 'yellow', 'Gasoline', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(426, 'Hodkiewicz-Thompson', 'molestias', 2022, 'H0LZMCRP39FSJYCXJ', 'EJQ734', 34694.00, 'white', 'Diesel', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(427, 'Mante and Sons', 'expedita', 2008, 'YSE459D7ZHWK5JAU0', 'AQT014', 46125.00, 'white', 'Gasoline', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(428, 'Klocko-Franecki', 'eligendi', 2014, '0YF3EM8NET3LAP4YP', 'NDB797', 14179.00, 'white', 'Electric', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(429, 'Schoen and Sons', 'cupiditate', 2004, '3K0WH4NNNDP79TY3C', 'JEM970', 25567.00, 'silver', 'Diesel', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(430, 'Williamson, Parker and Koepp', 'ut', 2012, 'NH53GTRJ5J4EMBSB5', 'RIL716', 39093.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(431, 'Bechtelar-Zboncak', 'quis', 2019, '0LBRGPN91SSF177H8', 'GQF582', 28430.00, 'green', 'Gasoline', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(432, 'Stiedemann-Roberts', 'eveniet', 2017, 'V7P9EPKUP5W256TEC', 'UAE776', 28278.00, 'navy', 'Diesel', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(433, 'Schowalter, Legros and Gutmann', 'quaerat', 2007, '5LC8XJUCSF68N0M2N', 'DLW223', 32329.00, 'maroon', 'Diesel', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(434, 'Renner, Rosenbaum and Macejkovic', 'et', 2013, 'EBXR60YTKWD095L1X', 'DOX194', 27120.00, 'gray', 'Gasoline', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(435, 'Jast Group', 'repellendus', 2024, 'SU4G1T13MACAW9HXU', 'NIO047', 10484.00, 'blue', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(436, 'Powlowski, Parker and Hills', 'sed', 2018, 'R8JURDWXM1PMAHZ6X', 'NFV553', 15473.00, 'fuchsia', 'Gasoline', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(437, 'Gutmann, Kirlin and Raynor', 'numquam', 2022, 'FYTW8B04RGKYG1ZYV', 'TKV597', 29171.00, 'teal', 'Diesel', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(438, 'Bashirian, Ebert and Strosin', 'tenetur', 2002, '21W64G3FLS3LMZ9GL', 'SDL934', 48515.00, 'purple', 'Diesel', 'Manual', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(439, 'Ruecker, Keebler and Swift', 'sit', 2007, '6TDC1YBGH5FLG8K1Z', 'EPV941', 26628.00, 'gray', 'Diesel', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(440, 'Rippin, Herman and Swaniawski', 'iusto', 2016, 'GVWC4TR7WU9PS9JBZ', 'ITK923', 16131.00, 'fuchsia', 'Diesel', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(441, 'Conroy-Sawayn', 'perferendis', 2004, 'L9BJ116BLL1GEWTWL', 'JSZ978', 33075.00, 'yellow', 'Gasoline', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(442, 'Hickle, Nitzsche and Hickle', 'deleniti', 2013, '4X4AR8U2XZNMR4SX1', 'QGV880', 34629.00, 'black', 'Gasoline', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(443, 'Quigley PLC', 'delectus', 2000, '2029UM51815312RUC', 'SRM135', 42203.00, 'black', 'Gasoline', 'Manual', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(444, 'Schoen-Goyette', 'autem', 2003, 'WPFHHA1CAAY8RHKMP', 'IWL797', 11507.00, 'lime', 'Diesel', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(445, 'Yost, Smith and Johnston', 'ad', 2018, '8P75X0HH90E66G8L2', 'VGW833', 13492.00, 'fuchsia', 'Diesel', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(446, 'Bartoletti Inc', 'eligendi', 2008, '397V672D35830L02K', 'UFS668', 33694.00, 'teal', 'Diesel', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(447, 'Schaefer Inc', 'fuga', 2015, '6H7REBD8K4U2CFARY', 'LTK906', 10718.00, 'green', 'Diesel', 'Manual', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(448, 'Muller, Nikolaus and Schroeder', 'voluptatibus', 2006, 'RJ9CFN29LK2RD6K10', 'PGZ169', 39871.00, 'navy', 'Gasoline', 'Manual', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(450, 'D\'Amore, Hills and Marks', 'ea', 2023, '8M22P29MAPYN9G5N9', 'VBY702', 47123.00, 'navy', 'Diesel', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(451, 'McClure-Ryan', 'quo', 2022, 'DBLWAUY0S5D0V17E1', 'JVG039', 25872.00, 'olive', 'Gasoline', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(452, 'Rath PLC', 'est', 2015, '5R1H2XEB91H98JC43', 'EYW265', 12295.00, 'purple', 'Electric', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(453, 'Botsford, Osinski and Nienow', 'qui', 2008, '0BT6UKGC54LPR1421', 'JWQ166', 46159.00, 'green', 'Diesel', 'Manual', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(454, 'Collins Group', 'et', 2010, '1MDFB86X1BLFLLC8H', 'UFE452', 37924.00, 'blue', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(455, 'Mante, Hodkiewicz and Terry', 'omnis', 2002, 'N8EML69SYMF39K900', 'QKB173', 37036.00, 'white', 'Gasoline', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(456, 'Osinski, Gorczany and Schulist', 'amet', 2019, 'V36NG7LHHLEUPZJ3K', 'RIK156', 39507.00, 'olive', 'Diesel', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(457, 'Grant, Kling and Kuhlman', 'quibusdam', 2017, 'ZC8B879F4840G63BE', 'VFD286', 21498.00, 'yellow', 'Gasoline', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(458, 'Kshlerin, Padberg and Metz', 'voluptatem', 2019, 'M1G7FRAJS48P4CY45', 'YRT532', 13167.00, 'navy', 'Diesel', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(459, 'Wehner, Rogahn and Conn', 'voluptatem', 2004, '5L1XGBWBDR1BS86W7', 'GVF751', 29078.00, 'purple', 'Electric', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(460, 'Armstrong, Boehm and Raynor', 'culpa', 2002, 'Y8CKGKYJS8S3R5JRD', 'JMV104', 48085.00, 'olive', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(461, 'Beer LLC', 'ipsam', 2001, 'KV7L2L1VZH7PZTMXP', 'YCR373', 15008.00, 'maroon', 'Electric', 'Automatic', 'Available', 1, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(462, 'Hill, Heaney and Hansen', 'qui', 2013, '159FDN9FBJPMGPN30', 'WTN325', 25669.00, 'maroon', 'Diesel', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(463, 'Schumm-Kub', 'assumenda', 2012, 'H3XYP9CFNJVJJ6Z3U', 'PSD236', 45156.00, 'black', 'Diesel', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(464, 'Osinski Group', 'asperiores', 2012, 'HFKR3BMHNSDRFJY2D', 'RBN822', 28223.00, 'black', 'Electric', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(465, 'Bailey, Schroeder and Russel', 'et', 2020, '7BFU4VDCKXVEHRVAB', 'XFW699', 41485.00, 'blue', 'Electric', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(466, 'Daniel Group', 'quam', 2020, 'SBCSSDZX343H40MM1', 'AKA423', 10754.00, 'black', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(467, 'Heidenreich Ltd', 'quam', 2022, 'FMSXWD6ZLKAL1YM6K', 'CPG600', 43165.00, 'blue', 'Diesel', 'Automatic', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(468, 'Leannon, Moore and King', 'dolorem', 2022, 'JRK3Y7WLWX9W4EE1C', 'ZTX685', 30920.00, 'yellow', 'Diesel', 'Automatic', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(469, 'Larson, Block and Kulas', 'rerum', 2011, 'ZEH2MYDN5J4KR385X', 'GJF210', 32347.00, 'aqua', 'Diesel', 'Manual', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(470, 'Predovic-Lakin', 'aut', 2002, 'SPYLKFWWL5TMM0206', 'CPF010', 41041.00, 'aqua', 'Gasoline', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(471, 'Stanton, Runte and Christiansen', 'libero', 2003, 'JGRDV4FJCH1U33PL3', 'GNO287', 43728.00, 'blue', 'Diesel', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(472, 'Morar-Jenkins', 'accusamus', 2012, '7UBB57WV3M504CAV4', 'DOQ354', 46550.00, 'maroon', 'Electric', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(473, 'Leannon, Wiza and Lowe', 'occaecati', 2024, 'JZYNRP1YU5E2NZN45', 'RUT944', 40872.00, 'yellow', 'Diesel', 'Manual', 'Available', 18, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(474, 'Marvin-Mante', 'doloribus', 2023, '75KMV4LDPCA8CDCJZ', 'PZM521', 27391.00, 'yellow', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(475, 'Quigley Group', 'ipsum', 2002, 'LGG19BGWSRZZDN7LU', 'HEM997', 11391.00, 'gray', 'Gasoline', 'Manual', 'Available', 4, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(476, 'Howe-Kessler', 'itaque', 2014, 'W8M7Z4J3L80292570', 'XEV251', 47790.00, 'white', 'Diesel', 'Automatic', 'Available', 14, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(477, 'Howell and Sons', 'ullam', 2024, 'K7CB8WL9GYPPY6410', 'DYN457', 34461.00, 'yellow', 'Gasoline', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(478, 'Bailey Ltd', 'iste', 2011, '4740U43KHAN2AR45Z', 'ZZN375', 48630.00, 'maroon', 'Diesel', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(479, 'Predovic-McClure', 'qui', 2000, '05VYEW8HZJR5AAHCY', 'CVW757', 23689.00, 'lime', 'Gasoline', 'Automatic', 'Available', 19, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(480, 'Brown and Sons', 'enim', 2003, 'SWB1KDZ0F4CDZNWRA', 'KVM666', 11973.00, 'maroon', 'Electric', 'Automatic', 'Available', 8, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(481, 'Kirlin, Legros and Parisian', 'voluptatibus', 2011, '9VLG50FS0YEWP8AZL', 'FYV781', 31916.00, 'white', 'Electric', 'Manual', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(482, 'Farrell-Armstrong', 'dolor', 2021, 'J1CDF9VKZGDRRWCTG', 'SVF969', 38193.00, 'blue', 'Electric', 'Manual', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(483, 'Cormier-Hane', 'consequatur', 2013, '26XT34P9W4MG1XANA', 'XSC144', 27699.00, 'black', 'Electric', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(484, 'Greenfelder-Windler', 'aut', 2021, 'XZWPG692TLSV87SHW', 'KFN331', 25784.00, 'green', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(485, 'Dickens, Herzog and Medhurst', 'saepe', 2007, 'B4R8CJ530RDU6U49X', 'KYM335', 30172.00, 'olive', 'Electric', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(486, 'Terry-Roberts', 'aspernatur', 2016, 'KSAXH65CPAW7JSD29', 'NCP694', 30390.00, 'gray', 'Electric', 'Manual', 'Available', 5, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(487, 'Kris, Boyle and Harber', 'ut', 2010, '7WBBS7HJR0VBAD0RY', 'YUE902', 28367.00, 'purple', 'Gasoline', 'Automatic', 'Available', 15, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(488, 'Flatley LLC', 'tempora', 2011, 'ZFFGM4A9JS2V61AXC', 'ZID466', 40994.00, 'yellow', 'Electric', 'Automatic', 'Available', 11, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(489, 'Borer LLC', 'voluptatem', 2013, 'MXW4PL7BEP0TN3Z3R', 'SGJ845', 35564.00, 'teal', 'Electric', 'Automatic', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(490, 'Larkin, Hudson and Schumm', 'in', 2022, 'KF5NSF0UUK7BWPHP0', 'OQM136', 30823.00, 'purple', 'Gasoline', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(491, 'Erdman and Sons', 'repellat', 2010, 'S6E0DY2CLMRVDGY42', 'SFL629', 33334.00, 'navy', 'Electric', 'Automatic', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(492, 'Daugherty, Stanton and Watsica', 'autem', 2007, 'MM91KXUF8JEMLEJ1W', 'WCM099', 35667.00, 'aqua', 'Diesel', 'Manual', 'Available', 6, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(493, 'Jones Ltd', 'dolore', 2005, '31KXMEW1UHLPSUXED', 'PUY145', 37593.00, 'yellow', 'Electric', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(494, 'Kuvalis, Pouros and Jaskolski', 'reprehenderit', 2001, 'EHS9VVXXLKTST9JLK', 'LKC869', 37133.00, 'lime', 'Diesel', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(495, 'Stark Inc', 'dolorem', 2017, 'CLKBWN4S8TWMPPV0J', 'DVI930', 47155.00, 'navy', 'Diesel', 'Automatic', 'Available', 20, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(496, 'Franecki-Rippin', 'excepturi', 2024, 'XM79XPUL5KLZYG67W', 'MTK724', 43835.00, 'silver', 'Diesel', 'Automatic', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(497, 'Bayer-Schaden', 'quo', 2014, 'MEXNGSNYLJAR7D4FW', 'IQM615', 26696.00, 'gray', 'Gasoline', 'Manual', 'Available', 9, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(498, 'Hyatt, Eichmann and Windler', 'aut', 2004, '3GS4NR8WY1E5KT6SN', 'XZP656', 35110.00, 'purple', 'Electric', 'Automatic', 'Available', 10, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(499, 'Funk-Lesch', 'distinctio', 2003, 'ZG0SW390U05EVPR35', 'FAH536', 48084.00, 'fuchsia', 'Diesel', 'Manual', 'Available', 3, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(500, 'Conn, Davis and Hickle', 'in', 2003, 'CYG3FSNRB4ESZSZ4N', 'WFF609', 24475.00, 'blue', 'Gasoline', 'Automatic', 'Available', 7, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(501, 'Crist, Koelpin and Dicki', 'quis', 2021, 'CW69HNC4X1MUSSVR7', 'FMA143', 41750.00, 'silver', 'Gasoline', 'Manual', 'Available', 16, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(502, 'Ledner Group', 'consectetur', 2015, 'LLK3DVCHYWJ5KLS3N', 'DBB510', 38753.00, 'purple', 'Gasoline', 'Automatic', 'Available', 12, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(503, 'Hamill-Mitchell', 'nemo', 2002, 'J7879UT96DPN0A6P3', 'ZFT587', 25825.00, 'black', 'Gasoline', 'Automatic', 'Available', 13, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(504, 'Steuber, Nitzsche and Waters', 'aut', 2009, 'USY7MUFZ39JWWL85Y', 'EKC631', 11048.00, 'yellow', 'Electric', 'Automatic', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(505, 'Aufderhar and Sons', 'qui', 2016, 'BE7PLWK8211LU7LUR', 'FFW521', 27379.00, 'olive', 'Electric', 'Manual', 'Available', 2, '2024-05-14 08:37:48', '2024-05-14 08:37:48'),
(506, 'Toyota', 'Supra', 2022, '816382648', 'MAC2323', 9999999.00, 'Black', 'Electric', 'Automatic', 'Available', 3, '2024-05-14 09:23:31', '2024-05-14 09:23:31');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_13_101853_create_cars_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `profileFile` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `role`, `status`, `profileFile`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ramel', 'O.', 'Panis Jr.', 'rams@gmail.com', '09602948515', 'Admin', 'Active', NULL, NULL, '$2y$12$PSKSeIK27YebWNimiz4Ooe7Qmi5H/VXM2uab5.JJApeMgh/ctf6xW', NULL, '2024-05-14 10:31:00', '2024-05-14 10:31:00'),
(2, 'Matt Christopher', 'R.', 'Romawak', 'mcrromawak@gmail.com', '09602948515', 'Admin', 'Active', NULL, NULL, '$2y$12$rjDJbxrNgIS1wh1CEsxTp.hepUakl3VBcsJDvPPuSNAFSGUJP4L4a', NULL, '2024-05-14 10:36:15', '2024-05-14 10:36:15'),
(3, 'Andrew Philip', 'A.', 'Permejo', 'andrew@gmail.com', '09602948515', 'Admin', 'Active', NULL, NULL, '$2y$12$tnQAEHjCc6Cr60D893pOhOpOCGbaDnphDjoUMNTJhgMlf6rMT03s.', NULL, '2024-05-14 11:56:41', '2024-05-14 11:56:41'),
(4, 'Kyle', 'O.', 'Polidan', 'kyle@gmail.com', '09602948515', 'Admin', 'Active', NULL, NULL, '$2y$12$GhcJv.L33SMQX5miGPko3Oc899eL2Qt.YzgNQvzdPw.1i298zV9ca', NULL, '2024-05-14 12:11:34', '2024-05-14 12:11:34'),
(5, 'Maikes', 'O.', 'Ortul', 'maiks@gmail.com', '09602948515', 'Admin', 'Active', NULL, NULL, '$2y$12$/VWlZImucuNOgodYIvgK2O6y6.uKLsec1dLDsqwmPvabHR5MdAqWK', NULL, '2024-05-14 12:17:26', '2024-05-14 12:17:26'),
(6, 'Mich', 'M.', 'Raagas', 'mich@gmail.com', '09602948515', 'Admin', 'Active', NULL, NULL, '$2y$12$rMBlPxQVO3h.6BJetFpmEO4Ew4l9k49snQHm3q5JBmSbirxmGLzey', NULL, '2024-05-14 12:20:16', '2024-05-14 12:20:16'),
(7, 'Uly', 'D.', 'Duran', 'uly@gmail.com', '09602948515', 'Admin', 'Active', 'C:\\Users\\mcrro\\AppData\\Local\\Temp\\php3678.tmp', NULL, '$2y$12$o92kJGvQ5N/gmwNlcUxtsOTWQ8jAisR1hurbJNYj8ia6TWC8TDDU2', NULL, '2024-05-14 12:21:30', '2024-05-14 12:21:30'),
(8, 'Gillian', 'G.', 'Gillian', 'gillian@gmail.com', '09602948515', 'Admin', 'Active', 'uploads/1715718313_doh yolanda commemoration blue print.png', NULL, '$2y$12$8ynNwV57D2sAOXaoIE/wyOmkWfWgfgvkP.uOr5RDNUJlijggovyC2', NULL, '2024-05-14 12:25:13', '2024-05-14 12:25:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cars_vin_unique` (`VIN`),
  ADD UNIQUE KEY `cars_license_plate_number_unique` (`license_plate_number`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
