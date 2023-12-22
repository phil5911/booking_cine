-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: cinebooker_db
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_date` date NOT NULL,
  `booking_hours` time NOT NULL,
  `type_payment` varchar(50) NOT NULL,
  `id_Reservation_Line` int NOT NULL,
  `id_Session` int DEFAULT NULL,
  `id_customer` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Reservation_Line` (`id_Reservation_Line`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`id_Reservation_Line`) REFERENCES `reservation_line` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (4,'2023-05-01','12:00:00','carte visa, paypal',1,NULL,NULL),(6,'2023-05-02','11:00:00','carte visa, paypal',1,NULL,NULL),(7,'2023-05-03','11:00:00','carte visa, paypal',1,NULL,NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `id_Users` int NOT NULL,
  `id_Movie_Theatres` int NOT NULL,
  `id_Cities` int NOT NULL,
  `id_cinema` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Users` (`id_Users`),
  KEY `id_Movie_Theatres` (`id_Movie_Theatres`),
  KEY `id_Cities` (`id_Cities`),
  CONSTRAINT `cinemas_ibfk_1` FOREIGN KEY (`id_Users`) REFERENCES `users` (`id`),
  CONSTRAINT `cinemas_ibfk_2` FOREIGN KEY (`id_Movie_Theatres`) REFERENCES `movie_theatres` (`id`),
  CONSTRAINT `cinemas_ibfk_3` FOREIGN KEY (`id_Cities`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (3,'cinema_palace','8 place du tertre','75000','paris',1,2,1,NULL),(4,'cinema_rex','4 rue du tram','94410','Maison-Alfort',2,2,2,NULL),(5,'cinema_des_étoiles','4 rue Marechal-Joffre','93800','Epinay sur seine',3,2,3,NULL),(6,'cinema_gaumont','1 rue du parc','95300','Pontoise',4,2,4,NULL),(7,'cinema_stars','1 place neuve','75106','Montparnasse',5,2,5,NULL);
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Montparnasse','75106'),(2,'Maison-Alfort','94410'),(3,'Epinay sur seine','93800'),(4,'Pontoise','95300'),(5,'Paris','75000');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `id_Bookings` int NOT NULL,
  `id_Price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Bookings` (`id_Bookings`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`id_Bookings`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Doe','hélene',30,'helene@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',4,NULL),(3,'Dupont','John',20,'john@gmail.com','44011a51f70a067c690dfb9959cdab5d7c37a28044f7604f047fd9dafb45cd02',6,NULL),(4,'Richard','Eric',13,'eric@gmail.com','c998dcf76bf0154678937b16b0abc9db17d3c95fb008f87882ad13eef40eee27',7,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_theatres`
--

DROP TABLE IF EXISTS `movie_theatres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_theatres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `code_room` varchar(50) NOT NULL,
  `nb_seats` int NOT NULL,
  `id_Sessions` int NOT NULL,
  `id_cinema` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Sessions` (`id_Sessions`),
  KEY `id_cinema` (`id_cinema`),
  CONSTRAINT `movie_theatres_ibfk_1` FOREIGN KEY (`id_Sessions`) REFERENCES `sessions` (`id`),
  CONSTRAINT `movie_theatres_ibfk_2` FOREIGN KEY (`id_cinema`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_theatres`
--

LOCK TABLES `movie_theatres` WRITE;
/*!40000 ALTER TABLE `movie_theatres` DISABLE KEYS */;
INSERT INTO `movie_theatres` VALUES (2,5,'0101',100,1,NULL);
/*!40000 ALTER TABLE `movie_theatres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `director` varchar(50) NOT NULL,
  `id_Sessions` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Sessions` (`id_Sessions`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`id_Sessions`) REFERENCES `sessions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (2,'Midnight Express','01:21:00','Alan Parker',1),(11,'Le Crime de l\'Orient-express','01:54:00','Kenneth Branagh',2),(12,'Le Grand Bleu','02:43:00','Luc Besson',3);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `id_Customers` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Customers` (`id_Customers`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`id_Customers`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,'espèces',9,1),(3,'espèces',8,1),(4,'espèces',6,1),(5,'carte_bancaire',9,1),(6,'carte_bancaire',8,1),(7,'carte_bancaire',6,1),(8,'espèces',9,3),(9,'espèces',8,3),(10,'espèces',6,3),(11,'carte_bancaire',9,3),(12,'carte_bancaire',8,3),(13,'carte_bancaire',6,3),(14,'espèces',9,4),(15,'espèces',8,4),(16,'espèces',6,4),(17,'carte_bancaire',9,4),(18,'carte_bancaire',8,4),(19,'carte_bancaire',6,4);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_line`
--

DROP TABLE IF EXISTS `reservation_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nb_places` int NOT NULL,
  `amount_line` decimal(10,0) NOT NULL,
  `cinema_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_line`
--

LOCK TABLES `reservation_line` WRITE;
/*!40000 ALTER TABLE `reservation_line` DISABLE KEYS */;
INSERT INTO `reservation_line` VALUES (1,300,3455,0);
/*!40000 ALTER TABLE `reservation_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `id_Movie` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'2023-05-01','11:00:00','23:00:00',NULL),(2,'2023-05-02','11:00:00','23:00:00',NULL),(3,'2023-05-03','11:00:00','23:00:00',NULL);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `admin` tinyint NOT NULL,
  `id_cinema` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jean','David','jean@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','06182378',1,NULL),(2,'Doe','Jeanne','jeanne@gmail.com','79737ac46dad121166483e084a0727e5d6769fb47fa9b0b627eba4107e696078','06276580',2,NULL),(3,'Henri','Serge','serge@gmail.com','a14ce03fe6b2e01cdfd1ea143723b9738762a80f01e4f1514dc62013d98918e9','06287435',3,NULL),(4,'Durand','Martine','martine@gmail.com','405e9b4b09c6365ae1b594794817ef338b401c7f2f01f07d9c84604499574405','06876514',4,NULL),(5,'Carlier','Sophie','sophie@gmail.com','389dad3d3c5d05616effcf492876fbff3064130a9f68fba61a3cfaa3bc6da2dc','064876123',5,NULL);
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

-- Dump completed on 2023-12-22 14:32:47

/* prénom: philippe nom: Derhore */
