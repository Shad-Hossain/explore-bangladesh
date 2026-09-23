CREATE DATABASE IF NOT EXISTS explore_bangladesh CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE explore_bangladesh;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2026 at 01:06 PM
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
-- Database: `explore_bangladesh`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$xUJdZUNtqpkhZavxHqA2sOcpAIekHW4vOY8boq6wn6kOKa2UouPFm'),
(2, 'hello', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `attractions`
--

CREATE TABLE `attractions` (
  `attraction_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `attraction_name` varchar(100) NOT NULL,
  `distance_km` decimal(5,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `icon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `icon`) VALUES
(1, 'Mountain', '🏔️'),
(2, 'Sea', '🌊'),
(3, 'Heritage', '🏛️');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `destination_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `best_time_to_visit` varchar(150) DEFAULT NULL,
  `entry_fee` decimal(8,2) DEFAULT 0.00,
  `opening_hours` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `map_link` varchar(255) DEFAULT NULL,
  `safety_tips` text DEFAULT NULL,
  `is_outdoor` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`destination_id`, `name`, `category_id`, `district_id`, `description`, `best_time_to_visit`, `entry_fee`, `opening_hours`, `latitude`, `longitude`, `map_link`, `safety_tips`, `is_outdoor`, `created_at`) VALUES
(1, 'Sajek Valley', 1, 3, 'A cloud-kissed hill valley on the Bangladesh-India border, famous for rolling clouds and sunrise views.', 'October to March', 0.00, '24 hours', 23.3833000, 92.2833000, 'https://maps.google.com/?q=Sajek+Valley', 'Roads are steep; hire local guides for treks.', 1, '2026-09-06 14:34:48'),
(2, 'Nilgiri', 1, 2, 'A hilltop resort area in Bandarban offering panoramic views above the clouds.', 'November to February', 100.00, '9:00 AM - 5:00 PM', 21.8167000, 92.3667000, 'https://maps.google.com/?q=Nilgiri+Bandarban', 'Carry warm clothes; roads can be foggy.', 1, '2026-09-06 14:34:48'),
(3, 'Cox\'s Bazar Beach', 2, 1, 'The world\'s longest natural sea beach, stretching about 120 km along the Bay of Bengal.', 'November to February', 0.00, '24 hours', 21.4272000, 92.0058000, 'https://maps.google.com/?q=Cox%27s+Bazar+Beach', 'Avoid swimming during red-flag warnings and high tide.', 1, '2026-09-06 14:34:48'),
(4, 'Saint Martin Island', 2, 1, 'Bangladesh\'s only coral island, reachable by ship from Teknaf.', 'November to February', 0.00, '24 hours', 20.6280000, 92.3220000, 'https://maps.google.com/?q=Saint+Martin+Island', 'Ferries stop during monsoon; check sea conditions before travel.', 1, '2026-09-06 14:34:48'),
(5, 'Kuakata Sea Beach', 2, 7, 'Known as \"Sagar Kannya\", one of the few places to see both sunrise and sunset over the sea.', 'October to March', 0.00, '24 hours', 21.8153000, 90.1197000, 'https://maps.google.com/?q=Kuakata+Sea+Beach', 'Currents can be strong; swim only in marked zones.', 1, '2026-09-06 14:34:48'),
(6, 'Paharpur Buddhist Vihara', 3, 8, 'UNESCO World Heritage Site — ruins of one of the largest Buddhist monasteries south of the Himalayas.', 'October to March', 200.00, '9:00 AM - 6:00 PM', 25.0311000, 88.9773000, 'https://maps.google.com/?q=Paharpur', 'Stay on marked paths to protect the ruins.', 0, '2026-09-06 14:34:48'),
(7, 'Shat Gombuj Mosque', 3, 9, 'A 15th-century UNESCO World Heritage mosque in Bagerhat with 77 domes.', 'Year-round', 200.00, '9:00 AM - 5:00 PM', 22.6583000, 89.7500000, 'https://maps.google.com/?q=Shat+Gombuj+Mosque', 'Dress modestly; it is an active place of worship.', 0, '2026-09-06 14:34:48'),
(8, 'Keokradong', 1, 2, 'Bangladesh\'s third-highest peak, a steep 2,721 ft trek passing through dense forest with panoramic sunrise views over the hills and Myanmar border.', 'October to February', 0.00, '24 hours', 21.9500000, 92.5167000, 'https://maps.google.com/?q=Keokradong', 'Hire a local guide; trails can be slippery after rain and steep near the summit.', 1, '2026-09-22 19:43:47'),
(9, 'Boga Lake', 1, 2, 'A crater-shaped lake 45 km from Ruma, reached by a bumpy jeep ride and short climb, set among evergreen hills with a cool, tranquil atmosphere.', 'November to February', 0.00, '24 hours', 22.2616000, 92.2778000, 'https://maps.google.com/?q=Boga+Lake+Bandarban', 'Start early and carry water; the jeep track is rough and often muddy.', 1, '2026-09-22 19:43:47'),
(10, 'Alutila Cave', 1, 4, 'A mysterious 85-ft natural cave near Dighinala (also spelled Alutila), part of a scenic loop that includes the Alutila fissure and boulder rivers.', 'October to March', 50.00, '9:00 AM - 5:00 PM', 23.1400000, 92.0200000, 'https://maps.google.com/?q=Alutila+Cave', 'Carry a torch; the cave is dark inside and the approach path is uneven.', 1, '2026-09-22 19:43:47'),
(11, 'Dighinala', 1, 4, 'A quiet hill district dotted with waterfalls such as Tapchari and Sholokhali, plus tribal villages and the Sajek-adjacent scenic valleys.', 'October to March', 0.00, '24 hours', 23.2500000, 92.0500000, 'https://maps.google.com/?q=Dighinala', 'Hook the local guide network for falls; roads are narrow and winding.', 1, '2026-09-22 19:43:47'),
(12, 'Bichanakandi', 1, 6, 'A picturesque river confluence in Moulvibazar\'s tea country where the Bichanga Kandi stream rolls over smooth stone slabs between guava orchards.', 'October to March', 0.00, '24 hours', 24.3000000, 92.2000000, 'https://maps.google.com/?q=Bichanakandi', 'Avoid direct monsoon months when currents rise; swim only in calm shallow stretches.', 1, '2026-09-22 19:43:47'),
(13, 'Tanguar Haor', 1, 5, 'Bangladesh\'s largest haor (seasonal wetland) with hundreds of beels that flood each monsoon, a Ramsar site wintering thousands of migratory birds.', 'November to February', 100.00, 'Sunrise to sunset', 25.1000000, 91.6000000, 'https://maps.google.com/?q=Tanguar+Haor', 'Go with a certified local boatman; deep beels open suddenly and winter mornings are foggy.', 1, '2026-09-22 19:43:47'),
(14, 'Inani Beach', 2, 1, 'A quieter, 18-km golden-sand stretch south of Cox\'s Bazar fringed by hills and the famous Inani coral boulder fields.', 'November to February', 0.00, '24 hours', 21.2767000, 92.0307000, 'https://maps.google.com/?q=Inani+Beach', 'Respect red-flag warnings; rip currents appear near the rocky outcrops.', 1, '2026-09-22 19:43:47'),
(15, 'Moheshkhali Island', 2, 1, 'A hilly island in the Bay of Bengal reachable by scenic launch from Cox\'s Bazar, home to the hillside Adinath temple and vast salt pans.', 'November to March', 0.00, 'Sunrise to sunset', 21.5500000, 91.9500000, 'https://maps.google.com/?q=Moheshkhali', 'Check launch schedules and tide times; return launches can be limited.', 1, '2026-09-22 19:43:47'),
(16, 'Teknaf Peninsula', 2, 1, 'The southern tip of Bangladesh where the Naf River separates the mainland from Myanmar, with long sandy beaches and the Ukhia-Ramu green belt nearby.', 'November to March', 0.00, '24 hours', 20.8700000, 92.3000000, 'https://maps.google.com/?q=Teknaf', 'Avoid border-adjacent areas at night; keep travel documents handy.', 1, '2026-09-22 19:43:47'),
(17, 'Lalbagh Fort', 3, 11, 'A partially completed 17th-century Mughal fort complex whose exquisite three-domed mosque, tomb of Pari Bibi, and museum narrate the Dhaka of old.', 'November to February', 30.00, '8:30 AM - 5:00 PM (closed Friday lunch)', 23.7189000, 90.3884000, 'https://maps.google.com/?q=Lalbagh+Fort', 'Watch your belongings in the crowded museum halls; keep to the marked walkways.', 0, '2026-09-22 19:43:47'),
(18, 'Ahsan Manzil', 3, 11, 'The pink \"Nawab Palace\" of Old Dhaka on the Buriganga riverbank, a restored museum of domes, arched galleries, and Nawabi-era interiors.', 'November to February', 30.00, '10:00 AM - 5:00 PM (closed Thursday)', 23.7080000, 90.4070000, 'https://maps.google.com/?q=Ahsan+Manzil', 'Follow queue instructions; no bags are allowed in the galleries.', 0, '2026-09-22 19:43:47'),
(19, 'Sonargaon (Panam City)', 3, 10, 'The abandoned 19th-century merchant quarter of Panam with rows of weathered Indo-Saracenic and Gothic-era houses, plus the Folk Art Museum nearby.', 'November to February', 20.00, '9:00 AM - 5:00 PM', 23.6475000, 90.6026000, 'https://maps.google.com/?q=Panam+Nagar', 'Keep to restored buildings; some old structures are structurally weak.', 0, '2026-09-22 19:43:47'),
(20, 'National Martyrs\' Memorial', 3, 11, 'A soaring seven-stepped modernist monument at Savar honouring the 1971 Liberation War\'s martyrs, set in a vast calm green park.', 'November to March', 0.00, '8:00 AM - 6:00 PM', 23.9111000, 90.2722000, 'https://maps.google.com/?q=National+Martyrs+Memorial+Savar', 'Wear sunscreen; the approach walk across the plaza is long and unshaded.', 1, '2026-09-22 19:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `division_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `district_name`, `division_id`) VALUES
(1, 'Cox\'s Bazar', 1),
(2, 'Bandarban', 1),
(3, 'Rangamati', 1),
(4, 'Khagrachari', 1),
(5, 'Sylhet', 2),
(6, 'Moulvibazar', 2),
(7, 'Patuakhali', 3),
(8, 'Naogaon', 4),
(9, 'Bagerhat', 5),
(10, 'Narayanganj', 6),
(11, 'Dhaka', 6);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `division_id` int(11) NOT NULL,
  `division_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`division_id`, `division_name`) VALUES
(3, 'Barisal'),
(1, 'Chattogram'),
(6, 'Dhaka'),
(5, 'Khulna'),
(8, 'Mymensingh'),
(4, 'Rajshahi'),
(7, 'Rangpur'),
(2, 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `favourite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `food_item_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `suitable_weather` enum('Sunny','Rainy','Cold','Any') DEFAULT 'Any',
  `price` decimal(7,2) DEFAULT NULL,
  `item_rating` decimal(2,1) DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`food_item_id`, `restaurant_id`, `item_name`, `suitable_weather`, `price`, `item_rating`) VALUES
(1, 1, 'Grilled Fish BBQ', 'Sunny', 450.00, 4.5),
(2, 1, 'Hot Khichuri with Beef', 'Rainy', 250.00, 4.6),
(3, 2, 'Fresh Coconut Water', 'Sunny', 80.00, 4.3),
(4, 2, 'Squid Fry', 'Any', 350.00, 4.1),
(5, 3, 'Smoked Chicken BBQ Platter', 'Sunny', 520.00, 4.5),
(6, 3, 'Hill View Fried Rice', 'Any', 280.00, 4.3),
(7, 3, 'Bandarban Special Mutton Korma', 'Rainy', 460.00, 4.6),
(8, 4, 'Nilgiri Sunrise Breakfast', 'Sunny', 220.00, 4.4),
(9, 4, 'Smoked Beef Skewers', 'Any', 380.00, 4.5),
(10, 4, 'Continental Chicken Steak', 'Cold', 440.00, 4.2),
(11, 7, 'Kuakata Prawn Mash', 'Rainy', 560.00, 4.7),
(12, 7, 'Beachside BBQ Lobster', 'Sunny', 980.00, 4.8),
(13, 7, 'Grilled Pomfret', 'Any', 640.00, 4.6),
(14, 8, 'Paharpur Jhalmuri', 'Any', 40.00, 4.2),
(15, 8, 'Dam Aloo', 'Rainy', 90.00, 4.4),
(16, 8, 'Shingara Combo', 'Sunny', 60.00, 4.1),
(17, 9, 'Kacchi Biryani', 'Rainy', 420.00, 4.7),
(18, 9, 'Mughlai Paratha Set', 'Cold', 350.00, 4.3),
(19, 9, 'Roshmalai', 'Any', 110.00, 4.5),
(20, 10, 'Imported Ribeye Steak', 'Cold', 1450.00, 4.8),
(21, 10, 'Marine Drive Surf & Turf', 'Any', 1650.00, 4.7),
(22, 10, 'Chefu2019s Tasting Menu', 'Sunny', 1900.00, 4.9),
(23, 11, 'Coral Lagoon Grilled Fish', 'Sunny', 720.00, 4.6),
(24, 11, 'Island Coconut Shrimp', 'Any', 680.00, 4.5),
(25, 11, 'Surf & Turf Board', 'Cold', 1200.00, 4.7),
(26, 12, 'Boga Lake Hilsa Bhapa', 'Rainy', 480.00, 4.5),
(27, 12, 'Rui Fish Curry', 'Any', 360.00, 4.3),
(28, 12, 'Freshwater Crab Masala', 'Sunny', 540.00, 4.5);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `hotel_name` varchar(100) NOT NULL,
  `hotel_type` enum('Hotel','Resort','Guest House') DEFAULT 'Hotel',
  `price_range_min` decimal(8,2) DEFAULT NULL,
  `price_range_max` decimal(8,2) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 0.0,
  `contact_no` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `free_breakfast` tinyint(1) DEFAULT 0,
  `swimming_pool` tinyint(1) DEFAULT 0,
  `distance_from_center_km` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `destination_id`, `hotel_name`, `hotel_type`, `price_range_min`, `price_range_max`, `rating`, `contact_no`, `address`, `free_breakfast`, `swimming_pool`, `distance_from_center_km`) VALUES
(1, 3, 'Sayeman Beach Resort', 'Resort', 6000.00, 15000.00, 4.3, '01811-100001', 'Kolatoli Road, Cox\'s Bazar', 1, 1, 0.50),
(2, 3, 'Hotel Sea Crown', 'Hotel', 2500.00, 5000.00, 3.8, '01811-100002', 'Kolatoli, Cox\'s Bazar', 1, 0, 1.20),
(3, 4, 'Blue Marine Resort', 'Resort', 4000.00, 9000.00, 4.0, '01811-100003', 'St. Martin Island', 0, 0, 0.30),
(4, 1, 'Sajek Resort', 'Resort', 3000.00, 8000.00, 4.1, '01811-100004', 'Ruilui Para, Sajek', 1, 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_bookings`
--

CREATE TABLE `hotel_bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `guests` int(11) DEFAULT 1,
  `total_price` decimal(9,2) DEFAULT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_rooms`
--

CREATE TABLE `hotel_rooms` (
  `room_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total_rooms` int(11) DEFAULT 1,
  `available_rooms` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_rooms`
--

INSERT INTO `hotel_rooms` (`room_id`, `hotel_id`, `room_type`, `price`, `total_rooms`, `available_rooms`) VALUES
(1, 1, 'Deluxe Double', 8000.00, 20, 12),
(2, 1, 'Sea View Suite', 15000.00, 5, 2),
(3, 2, 'Standard Single', 2500.00, 15, 9),
(4, 3, 'Standard Double', 4500.00, 10, 6),
(5, 4, 'Cottage', 5000.00, 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `caption` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nearby_services`
--

CREATE TABLE `nearby_services` (
  `service_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `service_type` enum('Hospital','Medical Shop','Flower Shop','Police Station','ATM','Other') NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 0.0,
  `map_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nearby_services`
--

INSERT INTO `nearby_services` (`service_id`, `destination_id`, `service_type`, `service_name`, `address`, `latitude`, `longitude`, `contact_no`, `rating`, `map_link`) VALUES
(1, 3, 'Hospital', 'Cox\'s Bazar Sadar Hospital', 'Hospital Road, Cox\'s Bazar', 21.4360000, 91.9800000, '0341-51235', 3.9, 'https://maps.google.com/?q=Cox%27s+Bazar+Sadar+Hospital'),
(2, 3, 'Medical Shop', 'Lazz Pharma', 'Kolatoli Road', 21.4210000, 92.0080000, '01811-200001', 4.0, 'https://maps.google.com/?q=Lazz+Pharma+Coxs+Bazar');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `stars` tinyint(4) NOT NULL CHECK (`stars` between 1 and 5),
  `rated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `restaurant_name` varchar(100) NOT NULL,
  `cuisines` varchar(255) DEFAULT NULL,
  `price_tier` enum('$','$$','$$$') NOT NULL DEFAULT '$$',
  `description` text DEFAULT NULL,
  `hours` varchar(40) DEFAULT '10:00û23:00',
  `image_url` varchar(255) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 0.0,
  `map_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurant_id`, `destination_id`, `restaurant_name`, `cuisines`, `price_tier`, `description`, `hours`, `image_url`, `address`, `latitude`, `longitude`, `rating`, `map_link`) VALUES
(1, 3, 'Sea Pearl Cafe', 'Seafood, Bengali', '$$', 'Oceanfront grill house with fresh lobster and a rooftop deck.', '10:00-23:00', 'photo-1517248135467-4c7edcad34c4', 'Marine Drive, Cox\'s Bazar', 21.4200000, 92.0100000, 4.2, 'https://maps.google.com/?q=Sea+Pearl+Cafe'),
(2, 4, 'Coral Kitchen', 'Seafood', '$', 'Island kitchen serving grilled squid, coconut water and local catch.', '09:00-22:00', 'photo-1559742811-822873691df8', 'Saint Martin Island', 20.6260000, 92.3200000, 4.0, 'https://maps.google.com/?q=Coral+Kitchen'),
(3, 1, 'Sajek Valley Dine', 'Bengali, Hill Cuisine', '$', 'Rooftop seating with misty valley views and slow-cooked hilsa.', '08:00û21:00', 'photo-1559339352-11d035aa65de', NULL, 23.3833000, 92.2833000, 4.4, 'https://maps.google.com/?q=Sajek+Valley+Dine'),
(4, 2, 'Nilgiri Cloud Kitchen', 'Bengali, Continental', '$', 'Hill-top cafe known for smoked BBQ platters and sunrise breakfasts.', '07:00û22:00', 'photo-1552566626-52f8b828add9', NULL, 21.8167000, 92.3667000, 4.1, 'https://maps.google.com/?q=Nilgiri+Cloud+Kitchen'),
(7, 5, 'Kuakata Sea Beach Grill', 'Seafood, BBQ', '$$', 'Beachfront barbeque with sunset tables on the golden sands.', '11:00û23:00', 'photo-1551218808-94e220e084d2', NULL, 21.8153000, 90.1197000, 4.5, 'https://maps.google.com/?q=Kuakata+Sea+Beach+Grill'),
(8, 6, 'Paharpur Heritage Bites', 'Bengali, Street Food', '$', 'Light snacks near the vihara ù dam aloo, jhalmuri and shingara.', '09:00û20:00', 'photo-1560969184-10fe8719e047', NULL, 25.0311000, 88.9773000, 3.9, 'https://maps.google.com/?q=Paharpur+Heritage+Bites'),
(9, 7, 'Shat Gombuj Mela Kitchen', 'Bengali, Halal', '$', 'Family-run kitchen serving kacchi biryani and traditional sweets.', '10:00û21:30', 'photo-1512058564366-18510be2db19', NULL, 22.6583000, 89.7500000, 4.3, 'https://maps.google.com/?q=Shat+Gombuj+Mela+Kitchen'),
(10, 3, 'Marine Drive Steakhouse', 'Continental, BBQ', '$$$', 'Fine dining with imported steaks, live jazz and sea views.', '12:00û23:00', 'photo-1546069901-ba9599a7e63c', NULL, 21.4350000, 92.0200000, 4.6, 'https://maps.google.com/?q=Marine+Drive+Steakhouse'),
(11, 4, 'Saint Martin Surf & Turf', 'Seafood, International', '$$$', 'Resort fine-dining terrace pairing local catch with craft cocktails.', '11:00û23:00', 'photo-1414235077428-338989a2e8c0', NULL, 20.6320000, 92.3180000, 4.5, 'https://maps.google.com/?q=Saint+Martin+Surf+Turf'),
(12, 1, 'Boga Lake Kitchen', 'Bengali, Fish', '$', 'Riverside hilsa and rui dishes at the base of Boga Lake.', '08:00û20:00', 'photo-1504674900247-0877df9cc836', NULL, 23.3220000, 92.2410000, 4.2, 'https://maps.google.com/?q=Boga+Lake+Kitchen');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `review_text` text DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shared_rides`
--

CREATE TABLE `shared_rides` (
  `ride_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `pickup_point` varchar(150) NOT NULL,
  `drop_point` varchar(150) NOT NULL,
  `ride_datetime` datetime NOT NULL,
  `total_fare` decimal(8,2) DEFAULT NULL,
  `seats_total` int(11) DEFAULT 4,
  `seats_taken` int(11) DEFAULT 1,
  `status` enum('Open','Full','Completed','Cancelled') DEFAULT 'Open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shared_ride_members`
--

CREATE TABLE `shared_ride_members` (
  `member_id` int(11) NOT NULL,
  `ride_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_bookings`
--

CREATE TABLE `ticket_bookings` (
  `ticket_booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `travel_date` date NOT NULL,
  `seats` int(11) DEFAULT 1,
  `total_price` decimal(9,2) DEFAULT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `weather_warning_shown` tinyint(1) DEFAULT 0,
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL,
  `transport_type` enum('Bus','Train','Flight','Launch','Car','Bike') NOT NULL,
  `operator_name` varchar(100) NOT NULL,
  `contact_no` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`transport_id`, `transport_type`, `operator_name`, `contact_no`) VALUES
(1, 'Bus', 'Green Line Paribahan', '01711-000000'),
(2, 'Bus', 'Shohagh Paribahan', '01711-000001'),
(3, 'Launch', 'Keari Sindbad', '01711-000002'),
(4, 'Train', 'Bangladesh Railway', '01711-000003'),
(5, 'Flight', 'Novoair', '01711-000004'),
(6, 'Car', 'DriveMe', '01711-000010'),
(7, 'Bike', 'BikeXpress', '01711-000011'),
(8, 'Bus', 'Ena Paribahan', '01711-000012');

-- --------------------------------------------------------

--
-- Table structure for table `transport_routes`
--

CREATE TABLE `transport_routes` (
  `route_id` int(11) NOT NULL,
  `transport_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `stop_over` varchar(100) DEFAULT NULL,
  `estimated_time` varchar(50) DEFAULT NULL,
  `estimated_cost` decimal(8,2) DEFAULT NULL,
  `departure_time` varchar(10) DEFAULT NULL,
  `arrival_time` varchar(10) DEFAULT NULL,
  `is_flexible` tinyint(1) NOT NULL DEFAULT 0,
  `seats_available` int(11) NOT NULL DEFAULT 0,
  `schedule_info` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_routes`
--

INSERT INTO `transport_routes` (`route_id`, `transport_id`, `destination_id`, `origin`, `stop_over`, `estimated_time`, `estimated_cost`, `departure_time`, `arrival_time`, `is_flexible`, `seats_available`, `schedule_info`) VALUES
(1, 1, 3, 'Dhaka', NULL, '8-9 hours', 1200.00, '08:00', '16:15', 0, 42, 'Every 2 hours, 8 AM - 11 PM'),
(2, 3, 4, 'Teknaf', 'Cox\'s Bazar', '2.5-3 hours', 1200.00, '09:30', '12:00', 0, 30, 'Departs 9:30 AM (Nov-Feb only)'),
(3, 5, 3, 'Dhaka', NULL, '55 minutes', 4500.00, '07:00', '07:55', 0, 12, '3 flights daily'),
(4, 2, 1, 'Khagrachari', NULL, '3 hours (jeep)', 800.00, '10:00', '13:00', 0, 8, 'Convoy system, 10 AM & 3 PM only'),
(5, 4, 6, 'Dhaka (Rajshahi line)', 'Naogaon', '5-6 hours', 350.00, '07:10', '12:40', 0, 60, 'Departs 7:10 AM daily'),
(6, 6, 3, 'Dhaka', NULL, '9-10 hours (private)', 4800.00, NULL, NULL, 1, 4, 'On demand, door-to-door'),
(7, 6, 4, 'Dhaka', NULL, '2 days (ferry+car)', 9000.00, NULL, NULL, 1, 4, 'On demand, includes ferry'),
(8, 7, 11, 'Khagrachari', NULL, '40 minutes', 350.00, '08:00', '08:40', 0, 2, 'Daily, Khagrachari to Dighinala'),
(9, 8, 3, 'Dhaka', NULL, '8 hours (overnight AC)', 1400.00, '20:30', '04:45', 0, 40, 'Overnight AC coach, daily'),
(10, 4, 12, 'Dhaka (Chittagong line)', 'Moulvibazar', '4-5 hours', 400.00, '06:50', '11:20', 0, 60, 'Daily except weekday lunch'),
(11, 5, 13, 'Dhaka', NULL, '50 minutes', 3800.00, '09:00', '09:50', 0, 12, '2 flights daily'),
(12, 3, 5, 'Dhaka', 'Barisal', '8 hours (overnight)', 1100.00, '22:00', '06:00', 0, 35, 'Night launch, daily'),
(13, 6, 13, 'Dhaka', NULL, '6 hours (car)', 6000.00, NULL, NULL, 1, 4, 'On demand, private drive');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weather_logs`
--

CREATE TABLE `weather_logs` (
  `weather_log_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `forecast_date` date NOT NULL,
  `condition_main` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `temp_min` decimal(4,1) DEFAULT NULL,
  `temp_max` decimal(4,1) DEFAULT NULL,
  `rain_probability` decimal(5,2) DEFAULT NULL,
  `wind_speed` decimal(5,2) DEFAULT NULL,
  `weather_score` tinyint(4) DEFAULT NULL,
  `fetched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weather_logs`
--

INSERT INTO `weather_logs` (`weather_log_id`, `destination_id`, `forecast_date`, `condition_main`, `description`, `temp_min`, `temp_max`, `rain_probability`, `wind_speed`, `weather_score`, `fetched_at`) VALUES
(1, 1, '2026-09-23', 'Thunderstorm', NULL, 25.0, 31.9, 96.00, 10.10, 0, '2026-09-23 01:15:36'),
(2, 1, '2026-09-24', 'Thunderstorm', NULL, 24.3, 32.4, 80.00, 15.00, 0, '2026-09-23 01:15:36'),
(3, 1, '2026-09-25', 'Drizzle', NULL, 23.7, 32.1, 83.00, 15.70, 32, '2026-09-23 01:15:36'),
(4, 1, '2026-09-26', 'Drizzle', NULL, 23.9, 32.1, 80.00, 7.30, 48, '2026-09-23 01:15:36'),
(5, 1, '2026-09-27', 'Drizzle', NULL, 24.2, 32.2, 78.00, 8.00, 49, '2026-09-23 01:15:36'),
(6, 2, '2026-09-23', 'Drizzle', NULL, 22.8, 29.8, 69.00, 14.50, 37, '2026-09-23 01:15:37'),
(7, 2, '2026-09-24', 'Thunderstorm', NULL, 22.3, 28.8, 87.00, 15.80, 0, '2026-09-23 01:15:37'),
(8, 2, '2026-09-25', 'Rain', NULL, 22.1, 29.4, 98.00, 17.70, 6, '2026-09-23 01:15:37'),
(9, 2, '2026-09-26', 'Drizzle', NULL, 22.0, 28.6, 100.00, 9.20, 36, '2026-09-23 01:15:37'),
(10, 2, '2026-09-27', 'Drizzle', NULL, 21.7, 28.7, 93.00, 10.50, 35, '2026-09-23 01:15:37'),
(11, 3, '2026-09-23', 'Thunderstorm', NULL, 26.0, 31.0, 82.00, 23.70, 0, '2026-09-23 01:15:39'),
(12, 3, '2026-09-24', 'Thunderstorm', NULL, 25.7, 29.6, 86.00, 26.00, 0, '2026-09-23 01:15:39'),
(13, 3, '2026-09-25', 'Drizzle', NULL, 25.7, 30.1, 91.00, 23.40, 29, '2026-09-23 01:15:39'),
(14, 3, '2026-09-26', 'Drizzle', NULL, 25.4, 29.8, 71.00, 15.00, 37, '2026-09-23 01:15:39'),
(15, 3, '2026-09-27', 'Drizzle', NULL, 25.0, 29.7, 71.00, 16.70, 37, '2026-09-23 01:15:39'),
(16, 4, '2026-09-23', 'Rain', NULL, 25.0, 30.5, 78.00, 27.50, 14, '2026-09-23 01:15:40'),
(17, 4, '2026-09-24', 'Thunderstorm', NULL, 24.2, 28.7, 89.00, 27.80, 0, '2026-09-23 01:15:40'),
(18, 4, '2026-09-25', 'Drizzle', NULL, 25.2, 30.2, 96.00, 25.60, 27, '2026-09-23 01:15:40'),
(19, 4, '2026-09-26', 'Drizzle', NULL, 25.5, 30.2, 85.00, 15.30, 31, '2026-09-23 01:15:40'),
(20, 4, '2026-09-27', 'Clouds', NULL, 25.2, 29.8, 70.00, 18.20, 47, '2026-09-23 01:15:40'),
(21, 5, '2026-09-23', 'Thunderstorm', NULL, 26.3, 28.9, 100.00, 35.60, 0, '2026-09-23 01:15:41'),
(22, 5, '2026-09-24', 'Thunderstorm', NULL, 26.2, 29.4, 100.00, 33.20, 0, '2026-09-23 01:15:41'),
(23, 5, '2026-09-25', 'Thunderstorm', NULL, 26.4, 28.9, 98.00, 31.50, 0, '2026-09-23 01:15:41'),
(24, 5, '2026-09-26', 'Thunderstorm', NULL, 26.2, 29.5, 84.00, 19.90, 0, '2026-09-23 01:15:41'),
(25, 5, '2026-09-27', 'Clouds', NULL, 27.1, 30.5, 51.00, 13.00, 55, '2026-09-23 01:15:41'),
(26, 6, '2026-09-23', 'Thunderstorm', NULL, 24.9, 29.8, 91.00, 18.80, 0, '2026-09-23 01:15:42'),
(27, 6, '2026-09-24', 'Thunderstorm', NULL, 24.8, 31.2, 93.00, 16.60, 0, '2026-09-23 01:15:42'),
(28, 6, '2026-09-25', 'Thunderstorm', NULL, 25.7, 31.0, 97.00, 18.60, 0, '2026-09-23 01:15:42'),
(29, 6, '2026-09-26', 'Drizzle', NULL, 25.5, 31.4, 86.00, 15.30, 31, '2026-09-23 01:15:42'),
(30, 6, '2026-09-27', 'Clouds', NULL, 25.0, 32.2, 49.00, 7.90, 70, '2026-09-23 01:15:42'),
(31, 7, '2026-09-23', 'Thunderstorm', NULL, 24.6, 29.1, 100.00, 22.00, 0, '2026-09-23 01:15:43'),
(32, 7, '2026-09-24', 'Thunderstorm', NULL, 24.6, 27.7, 100.00, 20.50, 0, '2026-09-23 01:15:43'),
(33, 7, '2026-09-25', 'Thunderstorm', NULL, 24.1, 28.9, 100.00, 17.70, 0, '2026-09-23 01:15:43'),
(34, 7, '2026-09-26', 'Thunderstorm', NULL, 24.7, 31.3, 94.00, 15.70, 0, '2026-09-23 01:15:43'),
(35, 7, '2026-09-27', 'Drizzle', NULL, 24.7, 33.6, 82.00, 9.70, 41, '2026-09-23 01:15:43'),
(36, 13, '2026-09-23', 'Thunderstorm', NULL, 24.8, 31.7, 98.00, 11.10, 0, '2026-09-23 01:15:51'),
(37, 13, '2026-09-24', 'Drizzle', NULL, 25.8, 33.8, 55.00, 12.20, 45, '2026-09-23 01:15:51'),
(38, 13, '2026-09-25', 'Drizzle', NULL, 24.9, 32.1, 68.00, 9.10, 49, '2026-09-23 01:15:51'),
(39, 13, '2026-09-26', 'Drizzle', NULL, 25.1, 31.5, 51.00, 6.80, 60, '2026-09-23 01:15:51'),
(40, 13, '2026-09-27', 'Drizzle', NULL, 25.6, 32.6, 61.00, 9.30, 52, '2026-09-23 01:15:51'),
(41, 8, '2026-09-23', 'Drizzle', NULL, 20.4, 27.4, 99.00, 14.30, 25, '2026-09-23 01:15:44'),
(42, 8, '2026-09-24', 'Drizzle', NULL, 20.1, 26.9, 93.00, 16.20, 28, '2026-09-23 01:15:44'),
(43, 8, '2026-09-25', 'Drizzle', NULL, 20.1, 27.2, 100.00, 15.40, 25, '2026-09-23 01:15:44'),
(44, 8, '2026-09-26', 'Drizzle', NULL, 19.5, 26.5, 93.00, 9.60, 38, '2026-09-23 01:15:44'),
(45, 8, '2026-09-27', 'Thunderstorm', NULL, 20.4, 26.2, 90.00, 9.80, 0, '2026-09-23 01:15:44'),
(46, 9, '2026-09-23', 'Thunderstorm', NULL, 25.1, 31.8, 98.00, 9.90, 0, '2026-09-23 01:15:46'),
(47, 9, '2026-09-24', 'Thunderstorm', NULL, 24.7, 31.7, 88.00, 15.10, 0, '2026-09-23 01:15:46'),
(48, 9, '2026-09-25', 'Rain', NULL, 24.6, 32.3, 93.00, 14.30, 8, '2026-09-23 01:15:46'),
(49, 9, '2026-09-26', 'Drizzle', NULL, 24.6, 31.7, 90.00, 12.30, 31, '2026-09-23 01:15:46'),
(50, 9, '2026-09-27', 'Drizzle', NULL, 24.9, 31.8, 87.00, 12.90, 30, '2026-09-23 01:15:46'),
(51, 10, '2026-09-23', 'Thunderstorm', NULL, 25.2, 31.5, 95.00, 11.60, 0, '2026-09-23 01:15:48'),
(52, 10, '2026-09-24', 'Drizzle', NULL, 25.0, 32.0, 80.00, 13.70, 33, '2026-09-23 01:15:48'),
(53, 10, '2026-09-25', 'Thunderstorm', NULL, 24.1, 31.5, 93.00, 15.40, 0, '2026-09-23 01:15:48'),
(54, 10, '2026-09-26', 'Drizzle', NULL, 24.5, 31.9, 67.00, 10.50, 45, '2026-09-23 01:15:48'),
(55, 10, '2026-09-27', 'Drizzle', NULL, 24.6, 32.4, 57.00, 9.20, 53, '2026-09-23 01:15:48'),
(56, 11, '2026-09-23', 'Thunderstorm', NULL, 25.0, 31.7, 95.00, 9.00, 0, '2026-09-23 01:15:49'),
(57, 11, '2026-09-24', 'Thunderstorm', NULL, 24.6, 32.3, 80.00, 14.20, 0, '2026-09-23 01:15:49'),
(58, 11, '2026-09-25', 'Thunderstorm', NULL, 23.9, 31.8, 93.00, 11.70, 0, '2026-09-23 01:15:49'),
(59, 11, '2026-09-26', 'Drizzle', NULL, 24.2, 31.8, 67.00, 10.40, 45, '2026-09-23 01:15:49'),
(60, 11, '2026-09-27', 'Drizzle', NULL, 24.2, 32.3, 57.00, 9.40, 52, '2026-09-23 01:15:49'),
(61, 12, '2026-09-23', 'Thunderstorm', NULL, 25.1, 31.5, 96.00, 11.50, 0, '2026-09-23 01:15:50'),
(62, 12, '2026-09-24', 'Drizzle', NULL, 24.7, 32.7, 75.00, 13.40, 35, '2026-09-23 01:15:50'),
(63, 12, '2026-09-25', 'Thunderstorm', NULL, 23.7, 32.0, 81.00, 13.50, 0, '2026-09-23 01:15:50'),
(64, 12, '2026-09-26', 'Thunderstorm', NULL, 24.5, 31.9, 75.00, 7.50, 0, '2026-09-23 01:15:50'),
(65, 12, '2026-09-27', 'Drizzle', NULL, 25.0, 31.8, 65.00, 7.70, 54, '2026-09-23 01:15:50'),
(66, 14, '2026-09-23', 'Thunderstorm', NULL, 25.4, 31.0, 82.00, 22.80, 0, '2026-09-23 01:15:52'),
(67, 14, '2026-09-24', 'Thunderstorm', NULL, 25.2, 29.5, 86.00, 23.70, 0, '2026-09-23 01:15:52'),
(68, 14, '2026-09-25', 'Thunderstorm', NULL, 25.2, 29.9, 91.00, 20.90, 0, '2026-09-23 01:15:52'),
(69, 14, '2026-09-26', 'Thunderstorm', NULL, 24.9, 30.1, 71.00, 12.90, 0, '2026-09-23 01:15:52'),
(70, 14, '2026-09-27', 'Clouds', NULL, 24.4, 30.3, 71.00, 15.50, 47, '2026-09-23 01:15:52'),
(71, 15, '2026-09-23', 'Thunderstorm', NULL, 26.0, 31.2, 82.00, 24.40, 0, '2026-09-23 01:15:53'),
(72, 15, '2026-09-24', 'Thunderstorm', NULL, 25.9, 29.6, 86.00, 30.20, 0, '2026-09-23 01:15:53'),
(73, 15, '2026-09-25', 'Rain', NULL, 25.7, 29.6, 91.00, 27.00, 9, '2026-09-23 01:15:53'),
(74, 15, '2026-09-26', 'Drizzle', NULL, 25.5, 29.7, 71.00, 16.00, 37, '2026-09-23 01:15:53'),
(75, 15, '2026-09-27', 'Drizzle', NULL, 25.5, 30.3, 71.00, 15.40, 37, '2026-09-23 01:15:53'),
(76, 16, '2026-09-23', 'Rain', NULL, 25.4, 30.3, 65.00, 28.60, 19, '2026-09-23 01:15:54'),
(77, 16, '2026-09-24', 'Thunderstorm', NULL, 24.8, 28.6, 87.00, 28.70, 0, '2026-09-23 01:15:54'),
(78, 16, '2026-09-25', 'Thunderstorm', NULL, 25.6, 29.7, 93.00, 25.60, 0, '2026-09-23 01:15:54'),
(79, 16, '2026-09-26', 'Drizzle', NULL, 25.7, 29.7, 69.00, 15.10, 37, '2026-09-23 01:15:54'),
(80, 16, '2026-09-27', 'Clouds', NULL, 25.7, 29.8, 43.00, 18.40, 58, '2026-09-23 01:15:54'),
(81, 17, '2026-09-23', 'Thunderstorm', NULL, 25.7, 31.6, 91.00, 16.40, 0, '2026-09-23 01:15:55'),
(82, 17, '2026-09-24', 'Thunderstorm', NULL, 25.4, 31.4, 90.00, 15.70, 0, '2026-09-23 01:15:55'),
(83, 17, '2026-09-25', 'Thunderstorm', NULL, 25.5, 31.1, 100.00, 18.00, 0, '2026-09-23 01:15:55'),
(84, 17, '2026-09-26', 'Thunderstorm', NULL, 25.1, 32.1, 94.00, 12.00, 0, '2026-09-23 01:15:55'),
(85, 17, '2026-09-27', 'Drizzle', NULL, 25.7, 32.3, 69.00, 5.30, 52, '2026-09-23 01:15:55'),
(86, 18, '2026-09-23', 'Thunderstorm', NULL, 25.7, 31.6, 91.00, 16.40, 0, '2026-09-23 01:15:56'),
(87, 18, '2026-09-24', 'Thunderstorm', NULL, 25.4, 31.4, 90.00, 15.70, 0, '2026-09-23 01:15:56'),
(88, 18, '2026-09-25', 'Thunderstorm', NULL, 25.5, 31.1, 100.00, 18.00, 0, '2026-09-23 01:15:56'),
(89, 18, '2026-09-26', 'Thunderstorm', NULL, 25.1, 32.1, 94.00, 12.00, 0, '2026-09-23 01:15:56'),
(90, 18, '2026-09-27', 'Drizzle', NULL, 25.7, 32.3, 69.00, 5.30, 52, '2026-09-23 01:15:56'),
(91, 19, '2026-09-23', 'Thunderstorm', NULL, 25.8, 30.5, 91.00, 14.90, 0, '2026-09-23 01:15:57'),
(92, 19, '2026-09-24', 'Thunderstorm', NULL, 25.2, 30.5, 90.00, 18.40, 0, '2026-09-23 01:15:57'),
(93, 19, '2026-09-25', 'Thunderstorm', NULL, 25.2, 31.0, 100.00, 17.70, 0, '2026-09-23 01:15:57'),
(94, 19, '2026-09-26', 'Thunderstorm', NULL, 24.9, 31.3, 94.00, 12.80, 0, '2026-09-23 01:15:57'),
(95, 19, '2026-09-27', 'Drizzle', NULL, 25.5, 32.1, 69.00, 5.80, 52, '2026-09-23 01:15:57'),
(96, 20, '2026-09-23', 'Thunderstorm', NULL, 25.7, 31.5, 97.00, 17.90, 0, '2026-09-23 01:15:58'),
(97, 20, '2026-09-24', 'Thunderstorm', NULL, 25.1, 31.4, 88.00, 23.90, 0, '2026-09-23 01:15:58'),
(98, 20, '2026-09-25', 'Thunderstorm', NULL, 25.3, 31.3, 100.00, 16.50, 0, '2026-09-23 01:15:58'),
(99, 20, '2026-09-26', 'Thunderstorm', NULL, 25.3, 31.8, 90.00, 16.60, 0, '2026-09-23 01:15:58'),
(100, 20, '2026-09-27', 'Drizzle', NULL, 25.2, 32.2, 57.00, 5.30, 57, '2026-09-23 01:15:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `attractions`
--
ALTER TABLE `attractions`
  ADD PRIMARY KEY (`attraction_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destination_id`),
  ADD KEY `idx_destinations_category` (`category_id`),
  ADD KEY `idx_destinations_district` (`district_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `division_id` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`division_id`),
  ADD UNIQUE KEY `division_name` (`division_name`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`favourite_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`destination_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`food_item_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `idx_hotels_destination` (`destination_id`);

--
-- Indexes for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `hotel_rooms`
--
ALTER TABLE `hotel_rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `nearby_services`
--
ALTER TABLE `nearby_services`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`destination_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `shared_rides`
--
ALTER TABLE `shared_rides`
  ADD PRIMARY KEY (`ride_id`),
  ADD KEY `destination_id` (`destination_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `shared_ride_members`
--
ALTER TABLE `shared_ride_members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `ride_id` (`ride_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ticket_bookings`
--
ALTER TABLE `ticket_bookings`
  ADD PRIMARY KEY (`ticket_booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`);

--
-- Indexes for table `transport_routes`
--
ALTER TABLE `transport_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `transport_id` (`transport_id`),
  ADD KEY `idx_routes_destination` (`destination_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `weather_logs`
--
ALTER TABLE `weather_logs`
  ADD PRIMARY KEY (`weather_log_id`),
  ADD UNIQUE KEY `destination_id` (`destination_id`,`forecast_date`),
  ADD KEY `idx_weather_destination_date` (`destination_id`,`forecast_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attractions`
--
ALTER TABLE `attractions`
  MODIFY `attraction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `division_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `favourite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `food_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_rooms`
--
ALTER TABLE `hotel_rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nearby_services`
--
ALTER TABLE `nearby_services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shared_rides`
--
ALTER TABLE `shared_rides`
  MODIFY `ride_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shared_ride_members`
--
ALTER TABLE `shared_ride_members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_bookings`
--
ALTER TABLE `ticket_bookings`
  MODIFY `ticket_booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transport_routes`
--
ALTER TABLE `transport_routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weather_logs`
--
ALTER TABLE `weather_logs`
  MODIFY `weather_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attractions`
--
ALTER TABLE `attractions`
  ADD CONSTRAINT `attractions_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `destinations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `destinations_ibfk_2` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`division_id`) ON DELETE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `food_items`
--
ALTER TABLE `food_items`
  ADD CONSTRAINT `food_items_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE;

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  ADD CONSTRAINT `hotel_bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `hotel_rooms` (`room_id`) ON DELETE CASCADE;

--
-- Constraints for table `hotel_rooms`
--
ALTER TABLE `hotel_rooms`
  ADD CONSTRAINT `hotel_rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `nearby_services`
--
ALTER TABLE `nearby_services`
  ADD CONSTRAINT `nearby_services_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `shared_rides`
--
ALTER TABLE `shared_rides`
  ADD CONSTRAINT `shared_rides_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shared_rides_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `shared_ride_members`
--
ALTER TABLE `shared_ride_members`
  ADD CONSTRAINT `shared_ride_members_ibfk_1` FOREIGN KEY (`ride_id`) REFERENCES `shared_rides` (`ride_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shared_ride_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_bookings`
--
ALTER TABLE `ticket_bookings`
  ADD CONSTRAINT `ticket_bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_bookings_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `transport_routes` (`route_id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_routes`
--
ALTER TABLE `transport_routes`
  ADD CONSTRAINT `transport_routes_ibfk_1` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_routes_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;

--
-- Constraints for table `weather_logs`
--
ALTER TABLE `weather_logs`
  ADD CONSTRAINT `weather_logs_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;