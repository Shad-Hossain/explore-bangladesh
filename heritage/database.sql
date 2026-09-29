CREATE DATABASE IF NOT EXISTS heritage_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE heritage_db;
SET NAMES utf8mb4;

-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: heritage_db
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'rifa','$2y$10$/x1g.j5Ne1kOvz6Uq9jXZeTWDxiBugBSWPjQGzwbsrKSJEPNXAhJ.');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`ad_id`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`partner_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (1,1,'15% Hotel Discount','Save 15% on selected hotel bookings.','2026-01-01','2027-12-31','Active'),(2,2,'Food Experience Offer','Enjoy traditional Bangladeshi food.','2026-01-01','2027-12-31','Active'),(3,3,'20% City Tour Offer','Save 20% on selected city tours.','2026-01-01','2027-12-31','Active'),(4,4,'12% Eco Lodge Offer','Save 12% on Sundarban Eco Lodge stays.','2026-03-01','2027-06-30','Active'),(5,5,'18% Trekking Offer','Save 18% on Hill Tracks trek packages.','2026-04-01','2027-08-31','Active'),(6,6,'Café Discount','8% off on select rooftop café orders.','2026-05-01','2027-05-31','Inactive');
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `service_provider` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,'2026-10-05','09:00:00','Confirmed','2026-09-29 13:45:06'),(2,1,2,'2026-10-06','14:00:00','Pending','2026-09-29 13:45:06'),(3,2,5,'2026-10-10','10:00:00','Confirmed','2026-09-29 13:45:06'),(4,3,3,'2026-11-01','08:30:00','Pending','2026-09-29 13:45:06'),(5,4,4,'2026-11-15','11:00:00','Cancelled','2026-09-29 13:45:06'),(6,5,1,'2026-12-20','09:30:00','Confirmed','2026-09-29 13:45:06');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heritage_plan`
--

DROP TABLE IF EXISTS `heritage_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heritage_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `selected_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`plan_id`),
  KEY `user_id` (`user_id`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `heritage_plan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `heritage_plan_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`partner_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heritage_plan`
--

LOCK TABLES `heritage_plan` WRITE;
/*!40000 ALTER TABLE `heritage_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `heritage_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner` (
  `partner_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT 'default-partner.jpg',
  `location` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `discount` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (1,'Heritage Grand Hotel','Hotel','default-partner.jpg',NULL,'Comfortable stay near heritage attractions.',15,1,'Active'),(2,'Old Dhaka Kitchen','Restaurant','default-partner.jpg',NULL,'Traditional Bangladeshi food experience.',10,1,'Active'),(3,'Dhaka City Tours','Tour Company','default-partner.jpg',NULL,'Easy guided city tour packages.',20,0,'Active'),(4,'Sundarban Eco Lodge','Hotel','default-partner.jpg',NULL,'Eco-friendly lodge near the mangrove forest.',12,0,'Active'),(5,'Chittagong Hill Tracks Tours','Tour Company','default-partner.jpg',NULL,'Adventurous trekking and tribal village tours.',18,1,'Active'),(6,'Rooftop Café Dhaka','Restaurant','default-partner.jpg',NULL,'Modern café with a heritage city view.',8,0,'Active');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_verification`
--

DROP TABLE IF EXISTS `provider_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_verification` (
  `verification_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `document_no` varchar(100) DEFAULT NULL,
  `status` enum('Pending','Verified','Rejected') DEFAULT 'Pending',
  PRIMARY KEY (`verification_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `provider_verification_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `service_provider` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_verification`
--

LOCK TABLES `provider_verification` WRITE;
/*!40000 ALTER TABLE `provider_verification` DISABLE KEYS */;
INSERT INTO `provider_verification` VALUES (1,1,'National ID','1234567890','Verified'),(2,2,'Passport','PA5678901','Verified'),(3,3,'National ID','0987654321','Pending'),(4,4,'Passport','PA1122334','Pending');
/*!40000 ALTER TABLE `provider_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `service_type` enum('Guide','Translator','Security Escort') NOT NULL,
  `languages` varchar(200) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `experience_years` int(11) DEFAULT 1,
  `location` varchar(150) DEFAULT NULL,
  `availability` varchar(100) DEFAULT 'Available',
  `verification_status` enum('Pending','Verified','Rejected') DEFAULT 'Pending',
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
/*!40000 ALTER TABLE `service_provider` DISABLE KEYS */;
INSERT INTO `service_provider` VALUES (1,'Rahim Ahmed','Guide','English, Bangla','01711111111',1500.00,1,NULL,'Available','Verified'),(2,'Karim Hasan','Translator','English, Arabic, Bangla','01822222222',1200.00,1,NULL,'Available','Verified'),(3,'Hasan Ali','Security Escort','English, Bangla','01933333333',2000.00,1,NULL,'Available','Pending'),(4,'Nadia Sultana','Guide','English, Hindi, Bangla','01644444444',1400.00,1,NULL,'Available','Verified'),(5,'Sadia Islam','Guide','English, Bangla, Japanese','01755555555',1800.00,1,NULL,'Available','Verified'),(6,'Tareq Mahmud','Translator','French, English, Bangla','01866666666',1500.00,1,NULL,'Available','Verified'),(7,'Rubina Begum','Security Escort','English, Bangla','01977777777',2200.00,1,NULL,'Available','Verified'),(8,'Arif Chowdhury','Guide','English, Bangla, Spanish','01688888888',1600.00,1,NULL,'Available','Pending'),(9,'Nusrat Jahan','Translator','English, Bangla, German','01599999999',1300.00,1,NULL,'Available','Pending');
/*!40000 ALTER TABLE `service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Demo User','demo@example.com'),(2,'Tania Rahman','tania.rahman@example.com'),(3,'Mizanur Khan','mizanur.khan@example.com'),(4,'Farzana Akter','farzana.akter@example.com'),(5,'Shakil Hossain','shakil.hossain@example.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
