-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aldaria_crystal
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_date` datetime NOT NULL,
  `user_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`booking_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES ('1899-01-19 01:14:07',NULL,''),('1999-01-19 02:14:07','fldkafhdklf',NULL),('2008-01-19 02:14:07','pablorr2@gmail.com',NULL),('2018-01-19 03:14:07',NULL,NULL),('2124-01-19 01:28:51','lajotalorenzo@gmail.com','undefined'),('2999-01-19 01:14:07',NULL,'slkjhaskjlfdbskjbfd');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(450) COLLATE utf8_unicode_ci NOT NULL,
  `user_real_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_join_date` datetime NOT NULL,
  `user_premium` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('a','1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75',NULL,'2024-03-01 19:35:46',NULL),('abc@gmail.com','ddaf35a193617abacc417349ae20413112e6fa4e89a97',NULL,'2024-02-28 01:07:25',NULL),('alba@gmail.com','1234',NULL,'0000-00-00 00:00:00',NULL),('hello@gmail.com','ddaf35a193617abacc417349ae20413112e6fa4e89a97',NULL,'2024-02-28 01:08:26',NULL),('lajotalorenzo@gmail.com','2a4135ef77dcbc0a8f7d159d7576cfb49ce165eba115fe02fb847952031df99d882cf3f331a63c0d4c0a050fb0e24aaead61b5e403b5b25bd02e6bca96629bde',NULL,'2024-03-03 12:10:30',NULL),('lego@gmail.com','undefined',NULL,'2024-02-27 21:05:14',NULL),('lgo@gmail.com','a2418b9c12503be4b54b45ee1c3c3cdeec1543b17c592',NULL,'2024-02-27 21:07:59',NULL),('pedro@gmail.com','1234',NULL,'2024-02-27 21:01:21',NULL),('pol@gmail.com','ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f',NULL,'2024-02-29 20:26:06',NULL),('polanski@gmail.com','2a4135ef77dcbc0a8f7d159d7576cfb49ce165eba115fe02fb847952031df99d882cf3f331a63c0d4c0a050fb0e24aaead61b5e403b5b25bd02e6bca96629bde',NULL,'2024-02-29 20:26:25',NULL),('redvelvetjewelsinfo@gmail.com','98ed007eafd903b3631982187bbb377bb651516403b7ae2924b9592c88e18e83597d95da5380715c55300b2a9c0aa420ee6e2b1e57b6f9ac5f880616eee22f58',NULL,'2024-03-03 12:11:15',NULL),('test','ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff',NULL,'2024-03-01 19:35:55',NULL),('test@gmail.com','ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff',NULL,'2024-02-28 01:17:51',NULL);
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

-- Dump completed on 2024-03-06 19:34:06
