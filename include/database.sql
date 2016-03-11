-- MySQL dump 10.13  Distrib 5.5.48, for Linux (x86_64)
--
-- Host: localhost    Database: tek_store
-- ------------------------------------------------------
-- Server version	5.5.48-cll

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Eateries`
--

DROP TABLE IF EXISTS `Eateries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Eateries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Type` int(11) NOT NULL COMMENT 'Type.id',
  `Zip` varchar(50) NOT NULL,
  `Owner` int(11) NOT NULL COMMENT 'Owners.id',
  PRIMARY KEY (`id`),
  KEY `Type` (`Type`,`Owner`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Eateries`
--

LOCK TABLES `Eateries` WRITE;
/*!40000 ALTER TABLE `Eateries` DISABLE KEYS */;
INSERT INTO `Eateries` VALUES (1,'Flo\'s Bakery Shop','Orlando','FL',1,'32801',1),(2,'Jimmy\'s Cake Salon','New York','NY',1,'10001',2),(3,'Joel\'s Steakhouse','Atlanta','GA',2,'30301',3),(4,'James Coffeehouse','Tampa','FL',3,'33614',4),(5,'The Pit Stop','San Francisco','CA',2,'94101',5);
/*!40000 ALTER TABLE `Eateries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Owners`
--

DROP TABLE IF EXISTS `Owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `First` varchar(200) NOT NULL,
  `Last` varchar(200) NOT NULL,
  `Phone` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Owners`
--

LOCK TABLES `Owners` WRITE;
/*!40000 ALTER TABLE `Owners` DISABLE KEYS */;
INSERT INTO `Owners` VALUES (1,'Flo','Smith','407-985-9556'),(2,'Jimmy','Falon','695-595-3521'),(3,'Joel','Monty','456-652-5223'),(4,'James','Richardson','625-653-8594'),(5,'Richard','Robins','745-569-9821');
/*!40000 ALTER TABLE `Owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Type`
--

DROP TABLE IF EXISTS `Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Type`
--

LOCK TABLES `Type` WRITE;
/*!40000 ALTER TABLE `Type` DISABLE KEYS */;
INSERT INTO `Type` VALUES (1,'Bakery'),(2,'Restaurant'),(3,'Coffee Shop');
/*!40000 ALTER TABLE `Type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-11  8:42:07
