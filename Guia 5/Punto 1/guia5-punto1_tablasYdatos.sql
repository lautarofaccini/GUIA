CREATE DATABASE  IF NOT EXISTS `pruebas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pruebas`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pruebas
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `sid` int NOT NULL,
  `pid` int NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sid`,`pid`),
  KEY `Refparts10` (`pid`),
  CONSTRAINT `Refparts10` FOREIGN KEY (`pid`) REFERENCES `parts` (`pid`),
  CONSTRAINT `Refsuppliers9` FOREIGN KEY (`sid`) REFERENCES `suppliers` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,2,0.50),(1,3,0.50),(1,4,11.70),(1,5,0.50),(1,6,0.50),(1,7,11.70),(1,8,5.55),(1,9,11.70),(2,2,7.95),(2,3,0.55),(2,4,16.50),(2,5,7.95),(2,6,16.50),(3,2,0.50),(3,3,0.50),(3,4,11.70),(3,5,0.50),(3,6,0.50),(3,7,11.70),(3,9,11.70),(4,1,1247548.23),(4,2,1247548.23),(4,4,1247548.23),(4,5,2.20),(4,9,55.50),(5,1,44.20),(5,2,7.95),(5,3,7.95),(5,4,2.20),(5,5,7.95),(5,6,7.95),(5,7,7.95),(5,8,7.95),(5,9,7.95);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `pid` int NOT NULL,
  `pname` varchar(40) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'Left Handed Bacon Stretcher Cover','Red'),(2,'Smoke Shifter End','Black'),(3,'Acme Widget Washer','Red'),(4,'Acme Widget Washer','Silver'),(5,'I Brake for Crop Circles Sticker','Translucent'),(6,'Anti-Gravity Turbine Generator','Cyan'),(7,'Anti-Gravity Turbine Generator','Magenta'),(8,'Fire Hydrant Cap','Red'),(9,'7 Segment Display','Green');
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `sid` int NOT NULL,
  `sname` varchar(30) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Acme Widget Suppliers','1 Grub St., Potemkin Village, IL 61801'),(2,'Big Red Tool and Die','4 My Way, Bermuda Shorts, OR 90305'),(3,'Perfunctory Parts','99999 Short Pier, Terra Del Fuego, TX 41299'),(4,'Alien Aircaft Inc.','2 Groom Lake, Rachel, NV 51902'),(5,'Yosemite Sham','221 Packer Street');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-27 10:48:56
