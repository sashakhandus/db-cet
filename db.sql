-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for osx10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: Cet
-- ------------------------------------------------------
-- Server version	5.7.27

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
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe` (
  `employe_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Employe ID',
  `first_name` varchar(20) NOT NULL COMMENT 'First name',
  `last_name` varchar(20) NOT NULL COMMENT 'Last name',
  `gender` tinyint(1) NOT NULL COMMENT 'Gender',
  `dob` date NOT NULL COMMENT 'Date of Birth',
  `start_of_w` date NOT NULL COMMENT 'Start of work',
  `passport` varchar(8) NOT NULL COMMENT 'Passport',
  `employe_code` varchar(8) NOT NULL COMMENT 'Employe code',
  `salary_current` float NOT NULL COMMENT 'Current salary',
  `position_id` int(3) unsigned DEFAULT NULL COMMENT 'Position ID',
  PRIMARY KEY (`employe_id`),
  KEY `EMPLOYE_POSITION_ID_POSITION_POSITION_ID` (`position_id`),
  CONSTRAINT `EMPLOYE_POSITION_ID_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Employe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Dima','Trump',1,'1975-05-12','2007-01-23','hc947382','96375032',26000,1),(2,'Victor','Donald',1,'1981-07-25','2007-02-01','hc921054','10293847',25000,1),(3,'Tania','Arto',2,'1985-08-01','2007-03-28','hc148753','76324591',20000,2),(4,'Olga','Zhuk',2,'1979-04-11','2007-05-23','hc983452','12980753',20000,2),(5,'Igor','Doe',1,'1977-02-01','2008-04-23','hc234312','99776655',25000,1),(6,'Lana','Svitla',2,'1986-09-23','2008-07-03','hc095467','90806754',27000,5),(7,'Tolia','Good',1,'1972-03-12','2007-01-25','hc773445','09876543',23000,10),(8,'Valia','Luch',2,'1970-01-07','2007-02-24','hc985463','98552345',13000,4),(9,'Vova','Free',1,'1987-04-12','2007-07-30','hc874342','09032145',25000,1),(10,'Pavlo','Green',1,'1982-05-19','2007-09-11','hc213432','76543210',24000,1),(11,'Oleg','Kozak',1,'1975-08-12','2007-11-25','hc785643','45678493',24000,1);
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income` (
  `income_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Income ID',
  `date` date NOT NULL COMMENT 'Date',
  `earnings` float NOT NULL COMMENT 'Earnings',
  `employe_id` int(3) unsigned NOT NULL COMMENT 'Employe ID',
  `transport_id` int(5) unsigned NOT NULL COMMENT 'Transport ID',
  PRIMARY KEY (`income_id`),
  KEY `INCOME_EMPLOYE_ID_EMPLOYE_EMPLOY_ID` (`employe_id`),
  KEY `INCOME_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` (`transport_id`),
  CONSTRAINT `INCOME_EMPLOYE_ID_EMPLOYE_EMPLOY_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`),
  CONSTRAINT `INCOME_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='income';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,'2019-01-01',2500,1,2),(2,'2019-01-01',2100,2,5),(3,'2019-01-01',2700,5,1),(4,'2019-01-01',2100,9,8),(5,'2019-01-02',2000,1,4),(6,'2019-01-02',2800,2,7),(7,'2019-01-02',2300,5,1),(8,'2019-01-02',2000,9,6),(9,'2019-01-02',2000,10,3),(10,'2019-01-03',2300,1,8),(11,'2019-01-03',2200,2,7),(12,'2019-01-03',2300,5,1),(13,'2019-01-03',2500,7,6),(14,'2019-01-03',2100,9,3),(15,'2019-01-03',2200,10,2),(16,'2019-01-03',2600,11,4),(17,'2019-01-04',2100,1,5),(18,'2019-01-04',2600,11,7),(19,'2019-01-04',2200,5,4),(20,'2019-01-04',2500,7,6),(21,'2019-01-04',2400,10,2),(22,'2019-01-05',2600,1,5),(23,'2019-01-05',2000,7,4),(24,'2019-01-05',2300,9,6),(25,'2019-01-05',2500,10,2),(26,'2019-01-05',2400,11,4),(27,'2019-01-06',2100,1,1),(28,'2019-01-06',2400,2,5),(29,'2019-01-06',2200,5,7),(30,'2019-01-06',2700,7,3),(31,'2019-01-06',1900,11,6),(32,'2019-01-07',2300,1,1),(33,'2019-01-07',2200,2,6),(34,'2019-01-07',2300,5,8),(35,'2019-01-07',2500,7,2),(36,'2019-01-07',2100,9,4),(37,'2019-01-07',2200,10,6),(38,'2019-01-07',2600,11,5);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Position ID',
  `position_explanation` varchar(40) NOT NULL COMMENT 'Position explanation',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'driver'),(2,'conductor'),(3,'mechanic'),(4,'cleaner'),(5,'accountant'),(6,'headmaster'),(7,'manager'),(8,'hr'),(9,'engineer'),(10,'electrician');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salary_id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Salary ID',
  `salary_date` date NOT NULL COMMENT 'Date',
  `salary_sum` float NOT NULL COMMENT 'Salary sum',
  `employe_id` int(3) unsigned NOT NULL COMMENT 'Employe ID',
  PRIMARY KEY (`salary_id`),
  KEY `SALARY_EMPLOYE_ID_EMPLOYE_EMPLOY_ID` (`employe_id`),
  CONSTRAINT `SALARY_EMPLOYE_ID_EMPLOYE_EMPLOY_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'2019-02-05',20000,1),(2,'2019-02-05',21000,2),(3,'2019-02-05',16000,3),(4,'2019-02-05',19000,4),(5,'2019-02-05',21000,5),(6,'2019-02-05',22000,6),(7,'2019-02-05',19000,7),(8,'2019-02-05',9000,8),(9,'2019-02-05',20000,9),(10,'2019-02-05',21000,10),(11,'2019-02-05',19000,11),(12,'2019-03-04',18000,1),(13,'2019-03-04',22000,2),(14,'2019-03-04',16000,3),(15,'2019-03-04',19000,4),(16,'2019-03-04',21000,5),(17,'2019-03-04',22000,6),(18,'2019-03-04',19000,7),(19,'2019-03-04',9000,8),(20,'2019-03-04',18000,9),(21,'2019-03-04',21000,10),(22,'2019-03-04',21000,11),(23,'2019-04-05',23000,1),(24,'2019-04-05',22000,2),(25,'2019-04-05',17000,3),(26,'2019-04-05',19000,4),(27,'2019-04-05',22000,5),(28,'2019-04-05',24000,6),(29,'2019-04-05',21000,7),(30,'2019-04-05',11000,8),(31,'2019-04-05',20000,9),(32,'2019-04-05',18000,10),(33,'2019-04-05',21000,11),(34,'2019-05-07',22000,1),(35,'2019-05-07',23000,2),(36,'2019-05-07',17000,3),(37,'2019-05-07',19000,4),(38,'2019-05-07',23000,5),(39,'2019-05-07',24000,6),(40,'2019-05-07',21000,7),(41,'2019-05-07',11000,8),(42,'2019-05-07',22000,9),(43,'2019-05-07',20000,10),(44,'2019-05-07',19000,11);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transport ID',
  `start_of_op` date NOT NULL COMMENT 'Start of operation',
  `numberplate` varchar(8) NOT NULL COMMENT 'Numbertplate',
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'2006-12-23','qwty1234'),(2,'2007-01-15','trew4356'),(3,'2007-01-23','gfre6543'),(4,'2007-03-09','hgfr4567'),(5,'2008-04-17','hgcx7643'),(6,'2008-09-04','lkds9865'),(7,'2009-02-26','ndsa8732'),(8,'2010-05-08','xdoi0965');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 22:44:04
