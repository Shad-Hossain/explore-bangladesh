CREATE DATABASE IF NOT EXISTS explore_bangladesh CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE explore_bangladesh;
SET NAMES utf8mb4;

-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: explore_bangladesh
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','$2y$10$xUJdZUNtqpkhZavxHqA2sOcpAIekHW4vOY8boq6wn6kOKa2UouPFm'),(2,'hello','hello');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attractions`
--

DROP TABLE IF EXISTS `attractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attractions` (
  `attraction_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `attraction_name` varchar(100) NOT NULL,
  `distance_km` decimal(5,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attraction_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attractions`
--

LOCK TABLES `attractions` WRITE;
/*!40000 ALTER TABLE `attractions` DISABLE KEYS */;
/*!40000 ALTER TABLE `attractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Mountain','🏔️'),(2,'Sea','🌊'),(3,'Heritage','🏛️');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinations` (
  `destination_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`destination_id`),
  KEY `idx_destinations_category` (`category_id`),
  KEY `idx_destinations_district` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
INSERT INTO `destinations` VALUES (1,'Sajek Valley',1,3,'A cloud-kissed hill valley on the Bangladesh-India border, famous for rolling clouds and sunrise views.','October to March',0.00,'24 hours',23.3833000,92.2833000,'https://maps.google.com/?q=Sajek+Valley','Roads are steep; hire local guides for treks.',1,'2026-09-06 14:34:48'),(2,'Nilgiri',1,2,'A hilltop resort area in Bandarban offering panoramic views above the clouds.','November to February',100.00,'9:00 AM - 5:00 PM',21.8167000,92.3667000,'https://maps.google.com/?q=Nilgiri+Bandarban','Carry warm clothes; roads can be foggy.',1,'2026-09-06 14:34:48'),(3,'Cox\'s Bazar Beach',2,1,'The world\'s longest natural sea beach, stretching about 120 km along the Bay of Bengal.','November to February',0.00,'24 hours',21.4272000,92.0058000,'https://maps.google.com/?q=Cox%27s+Bazar+Beach','Avoid swimming during red-flag warnings and high tide.',1,'2026-09-06 14:34:48'),(4,'Saint Martin Island',2,1,'Bangladesh\'s only coral island, reachable by ship from Teknaf.','November to February',0.00,'24 hours',20.6280000,92.3220000,'https://maps.google.com/?q=Saint+Martin+Island','Ferries stop during monsoon; check sea conditions before travel.',1,'2026-09-06 14:34:48'),(5,'Kuakata Sea Beach',2,7,'Known as \"Sagar Kannya\", one of the few places to see both sunrise and sunset over the sea.','October to March',0.00,'24 hours',21.8153000,90.1197000,'https://maps.google.com/?q=Kuakata+Sea+Beach','Currents can be strong; swim only in marked zones.',1,'2026-09-06 14:34:48'),(6,'Paharpur Buddhist Vihara',3,8,'UNESCO World Heritage Site — ruins of one of the largest Buddhist monasteries south of the Himalayas.','October to March',200.00,'9:00 AM - 6:00 PM',25.0311000,88.9773000,'https://maps.google.com/?q=Paharpur','Stay on marked paths to protect the ruins.',0,'2026-09-06 14:34:48'),(7,'Shat Gombuj Mosque',3,9,'A 15th-century UNESCO World Heritage mosque in Bagerhat with 77 domes.','Year-round',200.00,'9:00 AM - 5:00 PM',22.6583000,89.7500000,'https://maps.google.com/?q=Shat+Gombuj+Mosque','Dress modestly; it is an active place of worship.',0,'2026-09-06 14:34:48'),(8,'Keokradong',1,2,'Bangladesh\'s third-highest peak, a steep 2,721 ft trek passing through dense forest with panoramic sunrise views over the hills and Myanmar border.','October to February',0.00,'24 hours',21.9500000,92.5167000,'https://maps.google.com/?q=Keokradong','Hire a local guide; trails can be slippery after rain and steep near the summit.',1,'2026-09-22 19:43:47'),(9,'Boga Lake',1,2,'A crater-shaped lake 45 km from Ruma, reached by a bumpy jeep ride and short climb, set among evergreen hills with a cool, tranquil atmosphere.','November to February',0.00,'24 hours',22.2616000,92.2778000,'https://maps.google.com/?q=Boga+Lake+Bandarban','Start early and carry water; the jeep track is rough and often muddy.',1,'2026-09-22 19:43:47'),(10,'Alutila Cave',1,4,'A mysterious 85-ft natural cave near Dighinala (also spelled Alutila), part of a scenic loop that includes the Alutila fissure and boulder rivers.','October to March',50.00,'9:00 AM - 5:00 PM',23.1400000,92.0200000,'https://maps.google.com/?q=Alutila+Cave','Carry a torch; the cave is dark inside and the approach path is uneven.',1,'2026-09-22 19:43:47'),(11,'Dighinala',1,4,'A quiet hill district dotted with waterfalls such as Tapchari and Sholokhali, plus tribal villages and the Sajek-adjacent scenic valleys.','October to March',0.00,'24 hours',23.2500000,92.0500000,'https://maps.google.com/?q=Dighinala','Hook the local guide network for falls; roads are narrow and winding.',1,'2026-09-22 19:43:47'),(12,'Bichanakandi',1,6,'A picturesque river confluence in Moulvibazar\'s tea country where the Bichanga Kandi stream rolls over smooth stone slabs between guava orchards.','October to March',0.00,'24 hours',24.3000000,92.2000000,'https://maps.google.com/?q=Bichanakandi','Avoid direct monsoon months when currents rise; swim only in calm shallow stretches.',1,'2026-09-22 19:43:47'),(13,'Tanguar Haor',1,5,'Bangladesh\'s largest haor (seasonal wetland) with hundreds of beels that flood each monsoon, a Ramsar site wintering thousands of migratory birds.','November to February',100.00,'Sunrise to sunset',25.1000000,91.6000000,'https://maps.google.com/?q=Tanguar+Haor','Go with a certified local boatman; deep beels open suddenly and winter mornings are foggy.',1,'2026-09-22 19:43:47'),(14,'Inani Beach',2,1,'A quieter, 18-km golden-sand stretch south of Cox\'s Bazar fringed by hills and the famous Inani coral boulder fields.','November to February',0.00,'24 hours',21.2767000,92.0307000,'https://maps.google.com/?q=Inani+Beach','Respect red-flag warnings; rip currents appear near the rocky outcrops.',1,'2026-09-22 19:43:47'),(15,'Moheshkhali Island',2,1,'A hilly island in the Bay of Bengal reachable by scenic launch from Cox\'s Bazar, home to the hillside Adinath temple and vast salt pans.','November to March',0.00,'Sunrise to sunset',21.5500000,91.9500000,'https://maps.google.com/?q=Moheshkhali','Check launch schedules and tide times; return launches can be limited.',1,'2026-09-22 19:43:47'),(16,'Teknaf Peninsula',2,1,'The southern tip of Bangladesh where the Naf River separates the mainland from Myanmar, with long sandy beaches and the Ukhia-Ramu green belt nearby.','November to March',0.00,'24 hours',20.8700000,92.3000000,'https://maps.google.com/?q=Teknaf','Avoid border-adjacent areas at night; keep travel documents handy.',1,'2026-09-22 19:43:47'),(17,'Lalbagh Fort',3,11,'A partially completed 17th-century Mughal fort complex whose exquisite three-domed mosque, tomb of Pari Bibi, and museum narrate the Dhaka of old.','November to February',30.00,'8:30 AM - 5:00 PM (closed Friday lunch)',23.7189000,90.3884000,'https://maps.google.com/?q=Lalbagh+Fort','Watch your belongings in the crowded museum halls; keep to the marked walkways.',0,'2026-09-22 19:43:47'),(18,'Ahsan Manzil',3,11,'The pink \"Nawab Palace\" of Old Dhaka on the Buriganga riverbank, a restored museum of domes, arched galleries, and Nawabi-era interiors.','November to February',30.00,'10:00 AM - 5:00 PM (closed Thursday)',23.7080000,90.4070000,'https://maps.google.com/?q=Ahsan+Manzil','Follow queue instructions; no bags are allowed in the galleries.',0,'2026-09-22 19:43:47'),(19,'Sonargaon (Panam City)',3,10,'The abandoned 19th-century merchant quarter of Panam with rows of weathered Indo-Saracenic and Gothic-era houses, plus the Folk Art Museum nearby.','November to February',20.00,'9:00 AM - 5:00 PM',23.6475000,90.6026000,'https://maps.google.com/?q=Panam+Nagar','Keep to restored buildings; some old structures are structurally weak.',0,'2026-09-22 19:43:47'),(20,'National Martyrs\' Memorial',3,11,'A soaring seven-stepped modernist monument at Savar honouring the 1971 Liberation War\'s martyrs, set in a vast calm green park.','November to March',0.00,'8:00 AM - 6:00 PM',23.9111000,90.2722000,'https://maps.google.com/?q=National+Martyrs+Memorial+Savar','Wear sunscreen; the approach walk across the plaza is long and unshaded.',1,'2026-09-22 19:43:47');
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(50) NOT NULL,
  `division_id` int(11) NOT NULL,
  PRIMARY KEY (`district_id`),
  KEY `division_id` (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Cox\'s Bazar',1),(2,'Bandarban',1),(3,'Rangamati',1),(4,'Khagrachari',1),(5,'Sylhet',2),(6,'Moulvibazar',2),(7,'Patuakhali',3),(8,'Naogaon',4),(9,'Bagerhat',5),(10,'Narayanganj',6),(11,'Dhaka',6);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `division_id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(50) NOT NULL,
  PRIMARY KEY (`division_id`),
  UNIQUE KEY `division_name` (`division_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (3,'Barisal'),(1,'Chattogram'),(6,'Dhaka'),(5,'Khulna'),(8,'Mymensingh'),(4,'Rajshahi'),(7,'Rangpur'),(2,'Sylhet');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourites` (
  `favourite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`favourite_id`),
  UNIQUE KEY `user_id` (`user_id`,`destination_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (1,9,3,'2026-09-29 14:25:48'),(2,9,1,'2026-09-29 14:25:49'),(3,9,6,'2026-09-29 14:26:44');
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_items` (
  `food_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `suitable_weather` enum('Sunny','Rainy','Cold','Any') DEFAULT 'Any',
  `price` decimal(7,2) DEFAULT NULL,
  `item_rating` decimal(2,1) DEFAULT 0.0,
  PRIMARY KEY (`food_item_id`),
  KEY `restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_items`
--

LOCK TABLES `food_items` WRITE;
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` VALUES (1,1,'Grilled Fish BBQ','Sunny',450.00,4.5),(2,1,'Hot Khichuri with Beef','Rainy',250.00,4.6),(3,2,'Fresh Coconut Water','Sunny',80.00,4.3),(4,2,'Squid Fry','Any',350.00,4.1),(5,3,'Smoked Chicken BBQ Platter','Sunny',520.00,4.5),(6,3,'Hill View Fried Rice','Any',280.00,4.3),(7,3,'Bandarban Special Mutton Korma','Rainy',460.00,4.6),(8,4,'Nilgiri Sunrise Breakfast','Sunny',220.00,4.4),(9,4,'Smoked Beef Skewers','Any',380.00,4.5),(10,4,'Continental Chicken Steak','Cold',440.00,4.2),(11,7,'Kuakata Prawn Mash','Rainy',560.00,4.7),(12,7,'Beachside BBQ Lobster','Sunny',980.00,4.8),(13,7,'Grilled Pomfret','Any',640.00,4.6),(14,8,'Paharpur Jhalmuri','Any',40.00,4.2),(15,8,'Dam Aloo','Rainy',90.00,4.4),(16,8,'Shingara Combo','Sunny',60.00,4.1),(17,9,'Kacchi Biryani','Rainy',420.00,4.7),(18,9,'Mughlai Paratha Set','Cold',350.00,4.3),(19,9,'Roshmalai','Any',110.00,4.5),(20,10,'Imported Ribeye Steak','Cold',1450.00,4.8),(21,10,'Marine Drive Surf & Turf','Any',1650.00,4.7),(22,10,'Chefu2019s Tasting Menu','Sunny',1900.00,4.9),(23,11,'Coral Lagoon Grilled Fish','Sunny',720.00,4.6),(24,11,'Island Coconut Shrimp','Any',680.00,4.5),(25,11,'Surf & Turf Board','Cold',1200.00,4.7),(26,12,'Boga Lake Hilsa Bhapa','Rainy',480.00,4.5),(27,12,'Rui Fish Curry','Any',360.00,4.3),(28,12,'Freshwater Crab Masala','Sunny',540.00,4.5);
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_bookings`
--

DROP TABLE IF EXISTS `hotel_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `guests` int(11) DEFAULT 1,
  `total_price` decimal(9,2) DEFAULT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_bookings`
--

LOCK TABLES `hotel_bookings` WRITE;
/*!40000 ALTER TABLE `hotel_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_rooms`
--

DROP TABLE IF EXISTS `hotel_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total_rooms` int(11) DEFAULT 1,
  `available_rooms` int(11) DEFAULT 1,
  PRIMARY KEY (`room_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_rooms`
--

LOCK TABLES `hotel_rooms` WRITE;
/*!40000 ALTER TABLE `hotel_rooms` DISABLE KEYS */;
INSERT INTO `hotel_rooms` VALUES (1,1,'Deluxe Double',8000.00,20,12),(2,1,'Sea View Suite',15000.00,5,2),(3,2,'Standard Single',2500.00,15,9),(4,3,'Standard Double',4500.00,10,6),(5,4,'Cottage',5000.00,8,5);
/*!40000 ALTER TABLE `hotel_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `distance_from_center_km` decimal(5,2) DEFAULT 0.00,
  PRIMARY KEY (`hotel_id`),
  KEY `idx_hotels_destination` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,3,'Sayeman Beach Resort','Resort',6000.00,15000.00,4.3,'01811-100001','Kolatoli Road, Cox\'s Bazar',1,1,0.50),(2,3,'Hotel Sea Crown','Hotel',2500.00,5000.00,3.8,'01811-100002','Kolatoli, Cox\'s Bazar',1,0,1.20),(3,4,'Blue Marine Resort','Resort',4000.00,9000.00,4.0,'01811-100003','St. Martin Island',0,0,0.30),(4,1,'Sajek Resort','Resort',3000.00,8000.00,4.1,'01811-100004','Ruilui Para, Sajek',1,0,0.00);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `caption` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nearby_services`
--

DROP TABLE IF EXISTS `nearby_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nearby_services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `service_type` enum('Hospital','Medical Shop','Flower Shop','Police Station','ATM','Other') NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 0.0,
  `map_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nearby_services`
--

LOCK TABLES `nearby_services` WRITE;
/*!40000 ALTER TABLE `nearby_services` DISABLE KEYS */;
INSERT INTO `nearby_services` VALUES (1,3,'Hospital','Cox\'s Bazar Sadar Hospital','Hospital Road, Cox\'s Bazar',21.4360000,91.9800000,'0341-51235',3.9,'https://maps.google.com/?q=Cox%27s+Bazar+Sadar+Hospital'),(2,3,'Medical Shop','Lazz Pharma','Kolatoli Road',21.4210000,92.0080000,'01811-200001',4.0,'https://maps.google.com/?q=Lazz+Pharma+Coxs+Bazar');
/*!40000 ALTER TABLE `nearby_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `stars` tinyint(4) NOT NULL CHECK (`stars` between 1 and 5),
  `rated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `user_id` (`user_id`,`destination_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `map_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,3,'Sea Pearl Cafe','Seafood, Bengali','$$','Oceanfront grill house with fresh lobster and a rooftop deck.','10:00-23:00','photo-1517248135467-4c7edcad34c4','Marine Drive, Cox\'s Bazar',21.4200000,92.0100000,4.2,'https://maps.google.com/?q=Sea+Pearl+Cafe'),(2,4,'Coral Kitchen','Seafood','$','Island kitchen serving grilled squid, coconut water and local catch.','09:00-22:00','photo-1559742811-822873691df8','Saint Martin Island',20.6260000,92.3200000,4.0,'https://maps.google.com/?q=Coral+Kitchen'),(3,1,'Sajek Valley Dine','Bengali, Hill Cuisine','$','Rooftop seating with misty valley views and slow-cooked hilsa.','08:00û21:00','photo-1559339352-11d035aa65de',NULL,23.3833000,92.2833000,4.4,'https://maps.google.com/?q=Sajek+Valley+Dine'),(4,2,'Nilgiri Cloud Kitchen','Bengali, Continental','$','Hill-top cafe known for smoked BBQ platters and sunrise breakfasts.','07:00û22:00','photo-1552566626-52f8b828add9',NULL,21.8167000,92.3667000,4.1,'https://maps.google.com/?q=Nilgiri+Cloud+Kitchen'),(7,5,'Kuakata Sea Beach Grill','Seafood, BBQ','$$','Beachfront barbeque with sunset tables on the golden sands.','11:00û23:00','photo-1551218808-94e220e084d2',NULL,21.8153000,90.1197000,4.5,'https://maps.google.com/?q=Kuakata+Sea+Beach+Grill'),(8,6,'Paharpur Heritage Bites','Bengali, Street Food','$','Light snacks near the vihara ù dam aloo, jhalmuri and shingara.','09:00û20:00','photo-1560969184-10fe8719e047',NULL,25.0311000,88.9773000,3.9,'https://maps.google.com/?q=Paharpur+Heritage+Bites'),(9,7,'Shat Gombuj Mela Kitchen','Bengali, Halal','$','Family-run kitchen serving kacchi biryani and traditional sweets.','10:00û21:30','photo-1512058564366-18510be2db19',NULL,22.6583000,89.7500000,4.3,'https://maps.google.com/?q=Shat+Gombuj+Mela+Kitchen'),(10,3,'Marine Drive Steakhouse','Continental, BBQ','$$$','Fine dining with imported steaks, live jazz and sea views.','12:00û23:00','photo-1546069901-ba9599a7e63c',NULL,21.4350000,92.0200000,4.6,'https://maps.google.com/?q=Marine+Drive+Steakhouse'),(11,4,'Saint Martin Surf & Turf','Seafood, International','$$$','Resort fine-dining terrace pairing local catch with craft cocktails.','11:00û23:00','photo-1414235077428-338989a2e8c0',NULL,20.6320000,92.3180000,4.5,'https://maps.google.com/?q=Saint+Martin+Surf+Turf'),(12,1,'Boga Lake Kitchen','Bengali, Fish','$','Riverside hilsa and rui dishes at the base of Boga Lake.','08:00û20:00','photo-1504674900247-0877df9cc836',NULL,23.3220000,92.2410000,4.2,'https://maps.google.com/?q=Boga+Lake+Kitchen');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `review_text` text DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_ride_members`
--

DROP TABLE IF EXISTS `shared_ride_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_ride_members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `ride_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `ride_id` (`ride_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_ride_members`
--

LOCK TABLES `shared_ride_members` WRITE;
/*!40000 ALTER TABLE `shared_ride_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_ride_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_rides`
--

DROP TABLE IF EXISTS `shared_rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_rides` (
  `ride_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `pickup_point` varchar(150) NOT NULL,
  `drop_point` varchar(150) NOT NULL,
  `ride_datetime` datetime NOT NULL,
  `total_fare` decimal(8,2) DEFAULT NULL,
  `seats_total` int(11) DEFAULT 4,
  `seats_taken` int(11) DEFAULT 1,
  `status` enum('Open','Full','Completed','Cancelled') DEFAULT 'Open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ride_id`),
  KEY `destination_id` (`destination_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_rides`
--

LOCK TABLES `shared_rides` WRITE;
/*!40000 ALTER TABLE `shared_rides` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_rides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_bookings`
--

DROP TABLE IF EXISTS `ticket_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_bookings` (
  `ticket_booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `travel_date` date NOT NULL,
  `seats` int(11) DEFAULT 1,
  `total_price` decimal(9,2) DEFAULT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `weather_warning_shown` tinyint(1) DEFAULT 0,
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ticket_booking_id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_bookings`
--

LOCK TABLES `ticket_bookings` WRITE;
/*!40000 ALTER TABLE `ticket_bookings` DISABLE KEYS */;
INSERT INTO `ticket_bookings` VALUES (1,9,2,'2026-09-30',1,1200.00,'Confirmed',1,'2026-09-29 14:27:11');
/*!40000 ALTER TABLE `ticket_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL AUTO_INCREMENT,
  `transport_type` enum('Bus','Train','Flight','Launch','Car','Bike') NOT NULL,
  `operator_name` varchar(100) NOT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'Bus','Green Line Paribahan','01711-000000'),(2,'Bus','Shohagh Paribahan','01711-000001'),(3,'Launch','Keari Sindbad','01711-000002'),(4,'Train','Bangladesh Railway','01711-000003'),(5,'Flight','Novoair','01711-000004'),(6,'Car','DriveMe','01711-000010'),(7,'Bike','BikeXpress','01711-000011'),(8,'Bus','Ena Paribahan','01711-000012');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_routes`
--

DROP TABLE IF EXISTS `transport_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_routes` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `schedule_info` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `transport_id` (`transport_id`),
  KEY `idx_routes_destination` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_routes`
--

LOCK TABLES `transport_routes` WRITE;
/*!40000 ALTER TABLE `transport_routes` DISABLE KEYS */;
INSERT INTO `transport_routes` VALUES (1,1,3,'Dhaka',NULL,'8-9 hours',1200.00,'08:00','16:15',0,42,'Every 2 hours, 8 AM - 11 PM'),(2,3,4,'Teknaf','Cox\'s Bazar','2.5-3 hours',1200.00,'09:30','12:00',0,30,'Departs 9:30 AM (Nov-Feb only)'),(3,5,3,'Dhaka',NULL,'55 minutes',4500.00,'07:00','07:55',0,12,'3 flights daily'),(4,2,1,'Khagrachari',NULL,'3 hours (jeep)',800.00,'10:00','13:00',0,8,'Convoy system, 10 AM & 3 PM only'),(5,4,6,'Dhaka (Rajshahi line)','Naogaon','5-6 hours',350.00,'07:10','12:40',0,60,'Departs 7:10 AM daily'),(6,6,3,'Dhaka',NULL,'9-10 hours (private)',4800.00,NULL,NULL,1,4,'On demand, door-to-door'),(7,6,4,'Dhaka',NULL,'2 days (ferry+car)',9000.00,NULL,NULL,1,4,'On demand, includes ferry'),(8,7,11,'Khagrachari',NULL,'40 minutes',350.00,'08:00','08:40',0,2,'Daily, Khagrachari to Dighinala'),(9,8,3,'Dhaka',NULL,'8 hours (overnight AC)',1400.00,'20:30','04:45',0,40,'Overnight AC coach, daily'),(10,4,12,'Dhaka (Chittagong line)','Moulvibazar','4-5 hours',400.00,'06:50','11:20',0,60,'Daily except weekday lunch'),(11,5,13,'Dhaka',NULL,'50 minutes',3800.00,'09:00','09:50',0,12,'2 flights daily'),(12,3,5,'Dhaka','Barisal','8 hours (overnight)',1100.00,'22:00','06:00',0,35,'Night launch, daily'),(13,6,13,'Dhaka',NULL,'6 hours (car)',6000.00,NULL,NULL,1,4,'On demand, private drive');
/*!40000 ALTER TABLE `transport_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Farhan Kabir','farhan.kabir@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01767890123','2026-09-29 14:18:29'),(2,'Jannatul Ferdous','jannatul.ferdous@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01690123456','2026-09-29 14:18:29'),(3,'Sabrina Jahan Meem','meem.sabrina@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01878901234','2026-09-29 14:18:29'),(4,'Mehedi Hasan','mehedi.hasan@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01556789012','2026-09-29 14:18:29'),(5,'Nusrat Jahan','nusrat.jahan@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01823456789','2026-09-29 14:18:29'),(6,'Sagor Hossain','opusagorhossain@gmail.com','$2y$10$hCSpCw83b/aEw4SG3kpb6Ot/t7HD.dkv2yVmWu0AqAr2lPiC/zuSm','0111111111','2026-09-29 14:22:01'),(7,'Rakib Hossain','rakib.hossain@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01989012345','2026-09-29 14:18:29'),(8,'Sadia Islam','sadia.islam@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01645678901','2026-09-29 14:18:29'),(9,'Sagor Hossain','sagor.hossain@example.com','$2y$10$0CO.zXaiyJ6Qx6zNJFjWDuJ.OY/gc00Z2yMdMDSDhxC6Aj1rPNH6i','01637570459','2026-09-29 14:18:29'),(10,'Sakib Chowdhury','sakib.chowdhury@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01501234567','2026-09-29 14:18:29'),(11,'Tanvir Ahmed','tanvir.ahmed@example.com','$2y$10$ZknuKExj/cCz8zFl4C7z7eUBM0ZF6aFNBhTrmfxFlZ/Q/C.OI7mWG','01934567890','2026-09-29 14:18:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_logs`
--

DROP TABLE IF EXISTS `weather_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_logs` (
  `weather_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `forecast_date` date NOT NULL,
  `condition_main` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `temp_min` decimal(4,1) DEFAULT NULL,
  `temp_max` decimal(4,1) DEFAULT NULL,
  `rain_probability` decimal(5,2) DEFAULT NULL,
  `wind_speed` decimal(5,2) DEFAULT NULL,
  `weather_score` tinyint(4) DEFAULT NULL,
  `fetched_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`weather_log_id`),
  UNIQUE KEY `destination_id` (`destination_id`,`forecast_date`),
  KEY `idx_weather_destination_date` (`destination_id`,`forecast_date`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_logs`
--

LOCK TABLES `weather_logs` WRITE;
/*!40000 ALTER TABLE `weather_logs` DISABLE KEYS */;
INSERT INTO `weather_logs` VALUES (1,1,'2026-09-23','Thunderstorm',NULL,25.0,31.9,96.00,10.10,0,'2026-09-23 01:15:36'),(2,1,'2026-09-24','Thunderstorm',NULL,24.3,32.4,80.00,15.00,0,'2026-09-23 01:15:36'),(3,1,'2026-09-25','Drizzle',NULL,23.7,32.1,83.00,15.70,32,'2026-09-23 01:15:36'),(4,1,'2026-09-26','Drizzle',NULL,23.9,32.1,80.00,7.30,48,'2026-09-23 01:15:36'),(5,1,'2026-09-27','Drizzle',NULL,24.2,32.2,78.00,8.00,49,'2026-09-23 01:15:36'),(6,2,'2026-09-23','Drizzle',NULL,22.8,29.8,69.00,14.50,37,'2026-09-23 01:15:37'),(7,2,'2026-09-24','Thunderstorm',NULL,22.3,28.8,87.00,15.80,0,'2026-09-23 01:15:37'),(8,2,'2026-09-25','Rain',NULL,22.1,29.4,98.00,17.70,6,'2026-09-23 01:15:37'),(9,2,'2026-09-26','Drizzle',NULL,22.0,28.6,100.00,9.20,36,'2026-09-23 01:15:37'),(10,2,'2026-09-27','Drizzle',NULL,21.7,28.7,93.00,10.50,35,'2026-09-23 01:15:37'),(11,3,'2026-09-23','Thunderstorm',NULL,26.0,31.0,82.00,23.70,0,'2026-09-23 01:15:39'),(12,3,'2026-09-24','Thunderstorm',NULL,25.7,29.6,86.00,26.00,0,'2026-09-23 01:15:39'),(13,3,'2026-09-25','Drizzle',NULL,25.7,30.1,91.00,23.40,29,'2026-09-23 01:15:39'),(14,3,'2026-09-26','Drizzle',NULL,25.4,29.8,71.00,15.00,37,'2026-09-23 01:15:39'),(15,3,'2026-09-27','Drizzle',NULL,25.0,29.7,71.00,16.70,37,'2026-09-23 01:15:39'),(16,4,'2026-09-23','Rain',NULL,25.0,30.5,78.00,27.50,14,'2026-09-23 01:15:40'),(17,4,'2026-09-24','Thunderstorm',NULL,24.2,28.7,89.00,27.80,0,'2026-09-23 01:15:40'),(18,4,'2026-09-25','Drizzle',NULL,25.2,30.2,96.00,25.60,27,'2026-09-23 01:15:40'),(19,4,'2026-09-26','Drizzle',NULL,25.5,30.2,85.00,15.30,31,'2026-09-23 01:15:40'),(20,4,'2026-09-27','Clouds',NULL,25.2,29.8,70.00,18.20,47,'2026-09-23 01:15:40'),(21,5,'2026-09-23','Thunderstorm',NULL,26.3,28.9,100.00,35.60,0,'2026-09-23 01:15:41'),(22,5,'2026-09-24','Thunderstorm',NULL,26.2,29.4,100.00,33.20,0,'2026-09-23 01:15:41'),(23,5,'2026-09-25','Thunderstorm',NULL,26.4,28.9,98.00,31.50,0,'2026-09-23 01:15:41'),(24,5,'2026-09-26','Thunderstorm',NULL,26.2,29.5,84.00,19.90,0,'2026-09-23 01:15:41'),(25,5,'2026-09-27','Clouds',NULL,27.1,30.5,51.00,13.00,55,'2026-09-23 01:15:41'),(26,6,'2026-09-23','Thunderstorm',NULL,24.9,29.8,91.00,18.80,0,'2026-09-23 01:15:42'),(27,6,'2026-09-24','Thunderstorm',NULL,24.8,31.2,93.00,16.60,0,'2026-09-23 01:15:42'),(28,6,'2026-09-25','Thunderstorm',NULL,25.7,31.0,97.00,18.60,0,'2026-09-23 01:15:42'),(29,6,'2026-09-26','Drizzle',NULL,25.5,31.4,86.00,15.30,31,'2026-09-23 01:15:42'),(30,6,'2026-09-27','Clouds',NULL,25.0,32.2,49.00,7.90,70,'2026-09-23 01:15:42'),(31,7,'2026-09-23','Thunderstorm',NULL,24.6,29.1,100.00,22.00,0,'2026-09-23 01:15:43'),(32,7,'2026-09-24','Thunderstorm',NULL,24.6,27.7,100.00,20.50,0,'2026-09-23 01:15:43'),(33,7,'2026-09-25','Thunderstorm',NULL,24.1,28.9,100.00,17.70,0,'2026-09-23 01:15:43'),(34,7,'2026-09-26','Thunderstorm',NULL,24.7,31.3,94.00,15.70,0,'2026-09-23 01:15:43'),(35,7,'2026-09-27','Drizzle',NULL,24.7,33.6,82.00,9.70,41,'2026-09-23 01:15:43'),(36,13,'2026-09-23','Thunderstorm',NULL,24.8,31.7,98.00,11.10,0,'2026-09-23 01:15:51'),(37,13,'2026-09-24','Drizzle',NULL,25.8,33.8,55.00,12.20,45,'2026-09-23 01:15:51'),(38,13,'2026-09-25','Drizzle',NULL,24.9,32.1,68.00,9.10,49,'2026-09-23 01:15:51'),(39,13,'2026-09-26','Drizzle',NULL,25.1,31.5,51.00,6.80,60,'2026-09-23 01:15:51'),(40,13,'2026-09-27','Drizzle',NULL,25.6,32.6,61.00,9.30,52,'2026-09-23 01:15:51'),(41,8,'2026-09-23','Drizzle',NULL,20.4,27.4,99.00,14.30,25,'2026-09-23 01:15:44'),(42,8,'2026-09-24','Drizzle',NULL,20.1,26.9,93.00,16.20,28,'2026-09-23 01:15:44'),(43,8,'2026-09-25','Drizzle',NULL,20.1,27.2,100.00,15.40,25,'2026-09-23 01:15:44'),(44,8,'2026-09-26','Drizzle',NULL,19.5,26.5,93.00,9.60,38,'2026-09-23 01:15:44'),(45,8,'2026-09-27','Thunderstorm',NULL,20.4,26.2,90.00,9.80,0,'2026-09-23 01:15:44'),(46,9,'2026-09-23','Thunderstorm',NULL,25.1,31.8,98.00,9.90,0,'2026-09-23 01:15:46'),(47,9,'2026-09-24','Thunderstorm',NULL,24.7,31.7,88.00,15.10,0,'2026-09-23 01:15:46'),(48,9,'2026-09-25','Rain',NULL,24.6,32.3,93.00,14.30,8,'2026-09-23 01:15:46'),(49,9,'2026-09-26','Drizzle',NULL,24.6,31.7,90.00,12.30,31,'2026-09-23 01:15:46'),(50,9,'2026-09-27','Drizzle',NULL,24.9,31.8,87.00,12.90,30,'2026-09-23 01:15:46'),(51,10,'2026-09-23','Thunderstorm',NULL,25.2,31.5,95.00,11.60,0,'2026-09-23 01:15:48'),(52,10,'2026-09-24','Drizzle',NULL,25.0,32.0,80.00,13.70,33,'2026-09-23 01:15:48'),(53,10,'2026-09-25','Thunderstorm',NULL,24.1,31.5,93.00,15.40,0,'2026-09-23 01:15:48'),(54,10,'2026-09-26','Drizzle',NULL,24.5,31.9,67.00,10.50,45,'2026-09-23 01:15:48'),(55,10,'2026-09-27','Drizzle',NULL,24.6,32.4,57.00,9.20,53,'2026-09-23 01:15:48'),(56,11,'2026-09-23','Thunderstorm',NULL,25.0,31.7,95.00,9.00,0,'2026-09-23 01:15:49'),(57,11,'2026-09-24','Thunderstorm',NULL,24.6,32.3,80.00,14.20,0,'2026-09-23 01:15:49'),(58,11,'2026-09-25','Thunderstorm',NULL,23.9,31.8,93.00,11.70,0,'2026-09-23 01:15:49'),(59,11,'2026-09-26','Drizzle',NULL,24.2,31.8,67.00,10.40,45,'2026-09-23 01:15:49'),(60,11,'2026-09-27','Drizzle',NULL,24.2,32.3,57.00,9.40,52,'2026-09-23 01:15:49'),(61,12,'2026-09-23','Thunderstorm',NULL,25.1,31.5,96.00,11.50,0,'2026-09-23 01:15:50'),(62,12,'2026-09-24','Drizzle',NULL,24.7,32.7,75.00,13.40,35,'2026-09-23 01:15:50'),(63,12,'2026-09-25','Thunderstorm',NULL,23.7,32.0,81.00,13.50,0,'2026-09-23 01:15:50'),(64,12,'2026-09-26','Thunderstorm',NULL,24.5,31.9,75.00,7.50,0,'2026-09-23 01:15:50'),(65,12,'2026-09-27','Drizzle',NULL,25.0,31.8,65.00,7.70,54,'2026-09-23 01:15:50'),(66,14,'2026-09-23','Thunderstorm',NULL,25.4,31.0,82.00,22.80,0,'2026-09-23 01:15:52'),(67,14,'2026-09-24','Thunderstorm',NULL,25.2,29.5,86.00,23.70,0,'2026-09-23 01:15:52'),(68,14,'2026-09-25','Thunderstorm',NULL,25.2,29.9,91.00,20.90,0,'2026-09-23 01:15:52'),(69,14,'2026-09-26','Thunderstorm',NULL,24.9,30.1,71.00,12.90,0,'2026-09-23 01:15:52'),(70,14,'2026-09-27','Clouds',NULL,24.4,30.3,71.00,15.50,47,'2026-09-23 01:15:52'),(71,15,'2026-09-23','Thunderstorm',NULL,26.0,31.2,82.00,24.40,0,'2026-09-23 01:15:53'),(72,15,'2026-09-24','Thunderstorm',NULL,25.9,29.6,86.00,30.20,0,'2026-09-23 01:15:53'),(73,15,'2026-09-25','Rain',NULL,25.7,29.6,91.00,27.00,9,'2026-09-23 01:15:53'),(74,15,'2026-09-26','Drizzle',NULL,25.5,29.7,71.00,16.00,37,'2026-09-23 01:15:53'),(75,15,'2026-09-27','Drizzle',NULL,25.5,30.3,71.00,15.40,37,'2026-09-23 01:15:53'),(76,16,'2026-09-23','Rain',NULL,25.4,30.3,65.00,28.60,19,'2026-09-23 01:15:54'),(77,16,'2026-09-24','Thunderstorm',NULL,24.8,28.6,87.00,28.70,0,'2026-09-23 01:15:54'),(78,16,'2026-09-25','Thunderstorm',NULL,25.6,29.7,93.00,25.60,0,'2026-09-23 01:15:54'),(79,16,'2026-09-26','Drizzle',NULL,25.7,29.7,69.00,15.10,37,'2026-09-23 01:15:54'),(80,16,'2026-09-27','Clouds',NULL,25.7,29.8,43.00,18.40,58,'2026-09-23 01:15:54'),(81,17,'2026-09-23','Thunderstorm',NULL,25.7,31.6,91.00,16.40,0,'2026-09-23 01:15:55'),(82,17,'2026-09-24','Thunderstorm',NULL,25.4,31.4,90.00,15.70,0,'2026-09-23 01:15:55'),(83,17,'2026-09-25','Thunderstorm',NULL,25.5,31.1,100.00,18.00,0,'2026-09-23 01:15:55'),(84,17,'2026-09-26','Thunderstorm',NULL,25.1,32.1,94.00,12.00,0,'2026-09-23 01:15:55'),(85,17,'2026-09-27','Drizzle',NULL,25.7,32.3,69.00,5.30,52,'2026-09-23 01:15:55'),(86,18,'2026-09-23','Thunderstorm',NULL,25.7,31.6,91.00,16.40,0,'2026-09-23 01:15:56'),(87,18,'2026-09-24','Thunderstorm',NULL,25.4,31.4,90.00,15.70,0,'2026-09-23 01:15:56'),(88,18,'2026-09-25','Thunderstorm',NULL,25.5,31.1,100.00,18.00,0,'2026-09-23 01:15:56'),(89,18,'2026-09-26','Thunderstorm',NULL,25.1,32.1,94.00,12.00,0,'2026-09-23 01:15:56'),(90,18,'2026-09-27','Drizzle',NULL,25.7,32.3,69.00,5.30,52,'2026-09-23 01:15:56'),(91,19,'2026-09-23','Thunderstorm',NULL,25.8,30.5,91.00,14.90,0,'2026-09-23 01:15:57'),(92,19,'2026-09-24','Thunderstorm',NULL,25.2,30.5,90.00,18.40,0,'2026-09-23 01:15:57'),(93,19,'2026-09-25','Thunderstorm',NULL,25.2,31.0,100.00,17.70,0,'2026-09-23 01:15:57'),(94,19,'2026-09-26','Thunderstorm',NULL,24.9,31.3,94.00,12.80,0,'2026-09-23 01:15:57'),(95,19,'2026-09-27','Drizzle',NULL,25.5,32.1,69.00,5.80,52,'2026-09-23 01:15:57'),(96,20,'2026-09-23','Thunderstorm',NULL,25.7,31.5,97.00,17.90,0,'2026-09-23 01:15:58'),(97,20,'2026-09-24','Thunderstorm',NULL,25.1,31.4,88.00,23.90,0,'2026-09-23 01:15:58'),(98,20,'2026-09-25','Thunderstorm',NULL,25.3,31.3,100.00,16.50,0,'2026-09-23 01:15:58'),(99,20,'2026-09-26','Thunderstorm',NULL,25.3,31.8,90.00,16.60,0,'2026-09-23 01:15:58'),(100,20,'2026-09-27','Drizzle',NULL,25.2,32.2,57.00,5.30,57,'2026-09-23 01:15:58'),(286,4,'2026-09-29','Thunderstorm',NULL,25.0,31.4,100.00,13.60,0,'2026-09-29 14:26:54'),(287,4,'2026-09-30','Drizzle',NULL,24.4,27.9,98.00,11.50,30,'2026-09-29 14:26:54'),(288,4,'2026-10-01','Drizzle',NULL,24.5,29.2,84.00,11.60,35,'2026-09-29 14:26:54'),(289,4,'2026-10-02','Drizzle',NULL,24.9,29.3,88.00,12.70,30,'2026-09-29 14:26:54'),(290,4,'2026-10-03','Drizzle',NULL,24.4,29.6,69.00,16.20,37,'2026-09-29 14:26:54');
/*!40000 ALTER TABLE `weather_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-29 20:30:22
