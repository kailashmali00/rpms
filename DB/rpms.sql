-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 10.0.1.208    Database: rpms
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `superAdminName` varchar(100) DEFAULT NULL,
  `phone` varchar(155) DEFAULT NULL,
  `emailID` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdAT` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `startActivePeriod` timestamp NULL DEFAULT NULL,
  `endActivePeriod` timestamp NULL DEFAULT NULL,
  `reasonForLeaving` text,
  `status` tinyint(4) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'SuperAdmin','(255)-666-7788','superadmin@ukitss.com','CHRIS1 NISWANDEE SMALLSYS INC',NULL,'2015-11-27 06:44:09',NULL,NULL,NULL,0,0,'/Images/1448606645895.jpg');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attempt`
--

DROP TABLE IF EXISTS `attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `attemp` int(11) DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `createdAT` datetime DEFAULT NULL,
  `updatedAT` datetime DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `loginStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attempt`
--

LOCK TABLES `attempt` WRITE;
/*!40000 ALTER TABLE `attempt` DISABLE KEYS */;
INSERT INTO `attempt` VALUES (1,'cyna@gmail.com',0,NULL,'2015-03-12 20:28:22','2015-12-14 15:21:58',NULL,'success'),(2,'dushyant@dreamsoft4u.com',0,NULL,'2015-03-12 20:28:53','2015-03-12 20:28:53',NULL,'success'),(3,'dushyant@dreamsoft4u.co',0,NULL,'2015-03-14 23:53:02','2015-03-14 23:53:02',NULL,'success'),(4,'riched@gmail.com',0,NULL,'2015-03-14 23:55:03','2015-04-13 11:19:50',NULL,'success'),(5,'richa@gmail.com',0,NULL,'2015-03-16 11:03:17','2015-04-09 10:54:10',NULL,'success'),(6,'tony@gmail.com',0,NULL,'2015-03-27 11:36:38','2015-03-27 11:36:38',NULL,'success'),(7,'elle@gmail.com',0,NULL,'2015-03-27 11:39:02','2015-03-27 11:39:02',NULL,'success'),(8,'robin@gmail.com',0,NULL,'2015-03-27 11:42:01','2015-03-27 11:42:01',NULL,'success'),(9,'neelam@dreamsoft4u.co',0,NULL,'2015-03-28 12:03:10','2015-03-28 12:04:47',NULL,'success'),(10,'joe@gmail.com',0,NULL,'2015-04-06 23:59:18','2015-04-07 01:26:52',NULL,'success'),(11,'superadmin@dreamsoft4u.com',0,NULL,'2015-04-07 21:43:55','2015-05-15 17:08:44',NULL,'success'),(12,'abhishek@ukitss.com',0,NULL,'2015-04-08 12:17:29','2015-04-09 10:52:20',NULL,'success'),(13,'cyna@gmail.com1',0,NULL,'2015-04-08 21:49:50','2015-04-08 21:49:50',NULL,'success'),(14,'dushyant.soni16@gmail.com',0,NULL,'2015-04-08 22:10:54','2015-04-08 22:10:54',NULL,'success'),(15,'dushyant.soni16@dreamsoft4u.com',0,NULL,'2015-04-08 22:27:01','2015-04-08 22:27:01',NULL,'success'),(16,'ashutosh.kumar@dreamsoft4u.com',0,NULL,'2015-04-13 14:27:28','2015-05-04 11:47:23',NULL,'success'),(17,'robin@ukitss.com',0,NULL,'2015-04-13 15:25:31','2015-04-27 17:11:16',NULL,'success'),(18,'kelin@ukitss.com',0,NULL,'2015-04-13 15:43:59','2017-03-16 16:54:56',NULL,'success'),(19,'neddy@ukitss.com',0,NULL,'2015-04-13 15:54:18','2015-07-30 15:30:30',NULL,'success'),(20,'ashutosh.kumar@ukitss.com',0,NULL,'2015-04-16 16:01:21','2015-07-22 14:48:26',NULL,'success'),(21,'albert@ukitss.com',0,NULL,'2015-04-17 15:30:20','2015-05-25 15:45:30',NULL,'success'),(22,'gary@ukitss.com',0,NULL,'2015-04-21 12:42:14','2015-11-18 18:04:42',NULL,'success'),(23,'george@ukitss.com',0,NULL,'2015-04-29 18:20:35','2015-05-04 14:37:50',NULL,'success'),(24,'george@ukits.com',0,NULL,'2015-04-29 18:33:35','2015-05-02 00:07:50',NULL,'success'),(25,'Robin@yahoomail.com',0,NULL,'2015-05-05 20:35:04','2015-07-22 14:55:13',NULL,'success'),(26,'bpreciado@live.com',0,NULL,'2015-05-07 07:57:37','2015-05-07 09:56:59',NULL,'success'),(27,'superduper@ukitss.com',0,NULL,'2015-05-12 11:53:07','2015-06-18 18:15:44',NULL,'success'),(28,'steav@ukitss.com',1,NULL,'2015-05-12 14:55:56','2015-06-18 17:16:30',NULL,'fail'),(29,'mark@ukitss.com',0,NULL,'2015-05-12 15:01:45','2015-11-18 15:34:36',NULL,'fail'),(30,'rasal@ukitss.com',0,NULL,'2015-05-12 15:08:48','2015-05-12 15:08:48',NULL,'success'),(31,'john@ukitss.com',0,NULL,'2015-05-13 16:14:24','2015-05-14 11:39:34',NULL,'success'),(32,'rony@ukitss.com',0,NULL,'2015-05-18 16:30:15','2015-05-18 16:30:15',NULL,'success'),(33,'rob@ukitss.com',3,NULL,'2015-05-18 18:57:08','2015-07-03 18:15:28',NULL,'success'),(34,'superadmin@ukitss.com',0,NULL,'2015-05-21 11:39:45','2017-08-28 16:17:03',NULL,'success'),(35,'allen@ukitss.com',0,NULL,'2015-05-22 11:16:42','2015-11-18 20:39:06',NULL,'success'),(36,'newadmin@ukitss.com',0,NULL,'2015-06-23 12:00:18','2015-09-03 15:34:50',NULL,'success'),(37,'jezeerl@ukitss.com',0,NULL,'2015-06-23 15:11:47','2015-11-27 15:34:28',NULL,'success'),(38,'roshni@ukitss.com',0,NULL,'2015-06-23 15:40:50','2017-08-22 18:53:38',NULL,'success'),(39,'anny@ukitss.com',0,NULL,'2015-06-23 16:02:36','2017-03-17 10:56:56',NULL,'success'),(40,'elle@ukitss.com',0,NULL,'2015-06-24 12:17:23','2015-07-04 12:53:49',NULL,'success'),(41,'dny@ukitss.com',0,NULL,'2015-06-24 14:48:19','2015-06-24 17:04:45',NULL,'success'),(42,'johnk@ukitss.com',0,NULL,'2015-06-25 10:50:36','2017-08-21 12:57:17',NULL,'success'),(43,'john.denver@mailinator.com',0,NULL,'2015-08-26 11:00:52','2015-09-03 15:37:02',NULL,'success'),(44,'gena.davis@mailinator.com',0,NULL,'2015-08-27 18:17:04','2015-08-27 18:17:04',NULL,'success'),(45,'robert@ukitss.com',0,NULL,'2015-11-18 11:43:24','2015-11-18 11:44:19',NULL,'fail');
/*!40000 ALTER TABLE `attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `ix_auth_username` (`username`,`authority`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('0','ROLE_HCG'),('ab@ukitss.com','ROLE_PATIENT'),('abhishekshukla@ukitss.com','ROLE_HCG'),('albert@ukitss.com','ROLE_PATIENT'),('albertadmin@ukitss.com','ROLE_HCG'),('alisa@ukitss.com','ROLE_NURSE'),('allen1@ukitss.com','ROLE_DOC'),('allen@ukitss.com','ROLE_DOC'),('andrew@ukitss.com','ROLE_PATIENT'),('anny@ukitss.com','ROLE_DOC'),('ashutosh.kumar@dreamsoft4u.com','ROLE_NURSE'),('ashutosh.kumar@ukitss.com','ROLE_HCG'),('bpreciado@live.com','ROLE_NURSE'),('cyna@gmail.com','ROLE_HCG'),('dny@ukitss.com','ROLE_NURSE'),('dsc@ukitss.com','ROLE_PATIENT'),('elle@ukitss.com','ROLE_DOC'),('Elli@ukitss.com','ROLE_NURSE'),('gary@ukitss.com','ROLE_PATIENT'),('gena.davis@mailinator.com','ROLE_PATIENT'),('geoarge@ukitss.com','ROLE_DOC'),('george@ukits.com','ROLE_PATIENT'),('george@ukitss.com','ROLE_HCG'),('guptasakshi@ukitss.com','ROLE_DOC'),('jez@ukitss.com','ROLE_DOC'),('jezeerl12331@ukitss.com','ROLE_PATIENT'),('jezeerl213213@ukitss.com','ROLE_DOC'),('jezeerl@ukitss.com','ROLE_PATIENT'),('john.denver@mailinator.com','ROLE_PATIENT'),('john.miller@mailinator.com','ROLE_PATIENT'),('john@ukitss.com','ROLE_PATIENT'),('johnk@ukitss.com','ROLE_PATIENT'),('kelin@ukitss.com','ROLE_DOC'),('mark@ukitss.com','ROLE_DOC'),('neddy@ukitss.com','ROLE_NURSE'),('newadmin@ukitss.com','ROLE_HCG'),('rahul@ukitts.com','ROLE_PATIENT'),('rasal@ukitss.com','ROLE_NURSE'),('ray@ukitss.com','ROLE_PATIENT'),('rob@ukitss.com','ROLE_PATIENT'),('robert@ukitss.com','ROLE_PATIENT'),('Robin@yahoomail.com','ROLE_PATIENT'),('rocky@ukitss.com','ROLE_HCG'),('rohan@ukitss.com','ROLE_PATIENT'),('rohit@ukitss.com','ROLE_PATIENT'),('rony@ukitss.com','ROLE_PATIENT'),('roshni@ukitss.com','ROLE_NURSE'),('stacy@ukitss.com','ROLE_DOC'),('steav@ukitss.com','ROLE_PATIENT'),('superadmin@ukitss.com','ROLE_SUPERADMIN'),('superduper@ukitss.com','ROLE_HCG'),('tailor@ukitss.com','ROLE_PATIENT'),('tehknologik@hotmail.com','ROLE_DOC'),('testadmin@ukitss.com','ROLE_HCG'),('Thomas@ukitss.com','ROLE_PATIENT'),('tom@ukitss.com','ROLE_DOC'),('tommy@ukitss.com','ROLE_PATIENT'),('tony@ukitss.com','ROLE_HCG'),('vicky@ukitss.com','ROLE_PATIENT'),('wasim@ukitss.com','ROLE_NURSE');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citystatezip`
--

DROP TABLE IF EXISTS `citystatezip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citystatezip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zipcode` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='																																																																																																																						';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citystatezip`
--

LOCK TABLES `citystatezip` WRITE;
/*!40000 ALTER TABLE `citystatezip` DISABLE KEYS */;
/*!40000 ALTER TABLE `citystatezip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `docID` int(11) DEFAULT NULL,
  `nurseID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `entrytime` timestamp NULL DEFAULT NULL,
  `isReadDoc` tinyint(4) DEFAULT NULL,
  `isReadNurse` tinyint(4) DEFAULT NULL,
  `seentime` timestamp NULL DEFAULT NULL,
  `createdAT` timestamp NULL DEFAULT NULL,
  `updatedAT` timestamp NULL DEFAULT NULL,
  `data_point_id` int(11) DEFAULT NULL,
  `hcgID` int(11) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `isSentDoc` tinyint(4) DEFAULT NULL,
  `isSentNures` tinyint(4) DEFAULT NULL,
  `docName` varchar(45) DEFAULT NULL,
  `patientName` varchar(45) DEFAULT NULL,
  `nurseName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_docID_idx` (`docID`),
  KEY `fk_comment_nurseID_idx` (`nurseID`),
  KEY `fk_patientID_idx` (`patientID`),
  KEY `fk_data_points_idx` (`data_point_id`),
  CONSTRAINT `fk_comment_docID1` FOREIGN KEY (`docID`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_nurseID1` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_data_points` FOREIGN KEY (`data_point_id`) REFERENCES `patientphysiologicaldata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_patientID1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'s',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'kelin',NULL,NULL),(2,'This is normal',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'kelin',NULL,NULL),(3,'THIS IS NORMAL DATA POINT',1,NULL,3,NULL,1,0,NULL,NULL,NULL,852,NULL,0,1,NULL,'kelin',NULL,NULL),(4,'Something may be wrong here.',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Joseph',NULL,NULL),(5,'Big Problem!',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Joseph',NULL,NULL),(6,'Big, big problem!',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Joseph',NULL,NULL),(7,'No problem.',1,NULL,3,NULL,1,0,NULL,NULL,NULL,958,NULL,0,1,NULL,'Joseph',NULL,NULL),(8,'No problem at all!',1,NULL,3,NULL,1,0,NULL,NULL,NULL,958,NULL,0,1,NULL,'Joseph',NULL,NULL),(9,'hello',1,NULL,3,NULL,1,0,NULL,NULL,NULL,831,NULL,0,1,NULL,'Joseph',NULL,NULL),(10,'normal',1,NULL,3,NULL,1,0,NULL,NULL,NULL,831,NULL,0,1,NULL,'Joseph',NULL,NULL),(11,'its normal',1,NULL,3,NULL,1,0,NULL,NULL,NULL,831,NULL,0,1,NULL,'Joseph',NULL,NULL),(12,'sxdxb',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Joseph',NULL,NULL),(13,'aaaaaaaaaaaaaa',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Joseph',NULL,NULL),(14,'aaaabbbbbbbbb',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Joseph',NULL,NULL),(15,'hi',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(16,'hello',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(17,'how r u???????',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(18,'hello',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(19,'jjjjj',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(20,'hkjuu',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(21,'hello',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(22,'hrllllll',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(23,'patient',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(24,'hi',1,NULL,2,NULL,1,0,NULL,NULL,NULL,997,NULL,0,1,NULL,'Kelin',NULL,NULL),(25,'hi',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin',NULL,NULL),(26,'fdsf',1,NULL,3,NULL,1,0,NULL,NULL,NULL,984,NULL,0,1,NULL,'Kelin',NULL,NULL),(27,'ytrytr',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(28,'vcnvcn',1,NULL,2,NULL,1,0,NULL,NULL,NULL,993,NULL,0,1,NULL,'Kelin',NULL,NULL),(29,'     ',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(30,'          ',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(31,'              ',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(32,'hello',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(33,'hey',NULL,1,3,NULL,0,1,NULL,NULL,NULL,845,NULL,0,NULL,1,NULL,NULL,'Neddy'),(34,'hwhwhh',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(35,'hghjghjghj',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(36,'rgreg',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(37,'    ',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(38,'              ',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin',NULL,NULL),(39,'        ',1,NULL,3,NULL,1,0,NULL,NULL,NULL,831,NULL,0,1,NULL,'Kelin',NULL,NULL),(40,'ssads',1,NULL,3,NULL,1,0,NULL,NULL,NULL,831,NULL,0,1,NULL,'Kelin',NULL,NULL),(41,'jjj',1,NULL,2,NULL,1,0,NULL,NULL,NULL,993,NULL,0,1,NULL,'Kelin',NULL,NULL),(42,'normal reading',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin',NULL,NULL),(43,'ds',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(44,'ss',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(45,'ss',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(46,'ssss',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(47,'ssss',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(48,'ssss',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(49,'ssss',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(50,'d',1,NULL,3,NULL,1,0,NULL,NULL,NULL,845,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(51,'normal point',1,NULL,3,NULL,1,0,NULL,NULL,NULL,984,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(52,'hello',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(53,'hghgf',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(54,'hgff',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(55,'trettretre',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(56,'fghfgh',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(57,'ghfghfghfg',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(58,'ghfhjjghj',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(59,'hfghjfgjfghjfgj',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(60,'hello garry',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(61,'fbhfgfgfgfgabhishek',1,NULL,3,NULL,1,0,NULL,NULL,NULL,846,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(62,'hello',NULL,1,3,NULL,0,1,NULL,NULL,NULL,978,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(63,'kkkkk',NULL,1,3,NULL,0,1,NULL,NULL,NULL,956,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(64,'You are about to die',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(65,'Very very critical',NULL,1,3,NULL,0,1,NULL,NULL,NULL,970,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(66,'hello ',NULL,1,3,NULL,0,1,NULL,NULL,NULL,956,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(67,'./lkml',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(68,'kmlmkl',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(69,'mlm',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(70,'mklmk',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(71,'mklm',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(72,'mlkllll',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(73,'klklk',1,NULL,3,NULL,1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(74,'fgdfgdfh',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(75,'uiuyiuyi',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(76,'tytruytruty',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(77,'hellllllo this is a normal point ',1,NULL,3,NULL,1,0,NULL,NULL,NULL,976,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(78,'hello',1,NULL,3,NULL,1,0,NULL,NULL,NULL,976,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(79,'normal point',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(80,'hfghfg',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(81,'hfghfgj',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(82,'hghghfghfg',1,NULL,3,NULL,1,0,NULL,NULL,NULL,954,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(83,'ghgj',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(84,'popo',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(85,'iouiuyuy',1,NULL,3,NULL,1,0,NULL,NULL,NULL,954,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(86,'yutyituyi',1,NULL,3,NULL,1,0,NULL,NULL,NULL,863,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(87,'ghfhfgh',1,NULL,3,NULL,1,0,NULL,NULL,NULL,864,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(88,'hdghyrrty',1,NULL,3,NULL,1,0,NULL,NULL,NULL,859,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(89,'gggg',NULL,1,3,NULL,0,1,NULL,NULL,NULL,978,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(90,'fgfdgdf',NULL,1,3,NULL,0,1,NULL,NULL,NULL,954,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(91,'treertret',NULL,1,3,NULL,0,1,NULL,NULL,NULL,978,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(92,'hhhhh',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(93,'hhh',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(94,'yalah yem sai',1,NULL,3,NULL,1,0,NULL,NULL,NULL,978,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(95,'yeshi meshi',NULL,1,3,NULL,0,1,NULL,NULL,NULL,978,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(96,'this patient still alive , i thought he is already died ',1,NULL,3,NULL,1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(103,'jhjghjghj',1,NULL,3,'2015-06-04 05:41:52',1,0,NULL,NULL,NULL,954,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(104,'uiuyiuyiuyiiutyiy',NULL,1,3,'2015-06-04 05:43:22',0,1,NULL,NULL,NULL,954,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(105,'this is high point',1,NULL,3,'2015-06-04 06:07:38',1,0,NULL,NULL,NULL,956,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(106,'Normal point',1,NULL,3,'2015-06-04 06:08:33',1,0,NULL,NULL,NULL,860,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(107,'ghjghj',1,NULL,3,NULL,1,0,NULL,NULL,NULL,984,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(108,'He is alive',1,NULL,3,'2015-06-06 12:57:27',1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(109,'Hello Neddy',1,NULL,3,'2015-06-06 13:00:26',1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(110,'Hi\n',1,NULL,3,'2015-06-06 13:01:18',1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(111,'Hello Doctor',NULL,1,3,'2015-06-06 13:09:38',0,1,NULL,NULL,NULL,970,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(112,'Hows gary',NULL,1,3,'2015-06-06 13:09:47',0,1,NULL,NULL,NULL,970,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(113,'Gary is good now',1,NULL,3,'2015-06-06 13:10:21',1,0,NULL,NULL,NULL,970,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(114,'dedcfcf',1,NULL,3,'2015-06-11 08:24:35',1,0,NULL,NULL,NULL,831,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(115,'normal point',1,NULL,3,'2015-06-17 06:01:33',1,0,NULL,NULL,NULL,953,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(116,'there is high point',1,NULL,3,NULL,1,0,NULL,NULL,NULL,983,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(117,'okay',1,NULL,3,'2015-06-17 11:13:48',1,0,NULL,NULL,NULL,983,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(118,'mnm',1,NULL,3,NULL,1,0,NULL,NULL,NULL,983,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(119,'I will taken care ',NULL,1,3,NULL,0,1,NULL,NULL,NULL,983,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(120,'This is high point',1,NULL,3,'2015-06-17 11:57:11',1,0,NULL,NULL,NULL,984,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(121,'normal point',1,NULL,3,'2015-06-17 12:05:56',1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(122,'its normal ',1,NULL,3,'2015-06-17 12:06:19',1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(123,'normal point',1,NULL,3,'2015-06-17 12:07:57',1,0,NULL,NULL,NULL,990,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(124,'c',NULL,1,1,'2015-06-17 12:56:18',0,1,NULL,NULL,NULL,1007,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(125,'Oaky',1,NULL,3,'2015-06-18 11:16:34',1,0,NULL,NULL,NULL,984,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(126,'Okay',1,NULL,3,'2015-06-18 11:16:47',1,0,NULL,NULL,NULL,984,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(127,'its good',NULL,1,3,'2015-06-18 13:22:31',0,1,NULL,NULL,NULL,990,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(128,'hi',NULL,1,3,'2015-06-18 13:25:40',0,1,NULL,NULL,NULL,984,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(129,'This is not the maximum.',NULL,1,3,'2015-06-18 09:18:11',0,1,NULL,NULL,NULL,954,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(130,'Huh?',1,NULL,3,'2015-06-18 09:29:23',1,0,NULL,NULL,NULL,848,NULL,0,1,NULL,'Kelin Puma',NULL,NULL),(131,'high point',NULL,1,3,'2015-06-19 05:50:14',0,1,NULL,NULL,NULL,969,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(132,'normal',NULL,1,3,'2015-06-19 05:50:30',0,1,NULL,NULL,NULL,975,NULL,0,NULL,1,NULL,NULL,'Neddy K'),(133,'High BP',NULL,8,17,'2015-06-25 10:49:27',0,1,NULL,NULL,NULL,1194,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(134,'low point',11,NULL,17,'2015-06-29 04:54:11',1,0,NULL,NULL,NULL,1195,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(135,'Okay\n',11,NULL,17,'2015-06-29 04:54:21',1,0,NULL,NULL,NULL,1195,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(136,'normal point',11,NULL,16,'2015-06-30 11:20:37',1,0,NULL,NULL,NULL,1182,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(137,'normal point',11,NULL,16,'2015-06-30 11:22:07',1,0,NULL,NULL,NULL,1182,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(138,'high point',11,NULL,16,'2015-06-30 11:23:13',1,0,NULL,NULL,NULL,1179,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(139,'75 point',11,NULL,16,'2015-06-30 11:46:25',1,0,NULL,NULL,NULL,1189,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(140,'55',11,NULL,16,'2015-06-30 12:07:55',1,0,NULL,NULL,NULL,1217,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(141,'50',11,NULL,16,'2015-06-30 12:08:01',1,0,NULL,NULL,NULL,1217,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(142,'there?\n',11,NULL,16,'2015-06-30 12:08:37',1,0,NULL,NULL,NULL,1225,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(143,'making a new comment\n\n',11,NULL,16,'2015-06-30 10:37:05',1,0,NULL,NULL,NULL,1217,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(144,'making a comment on a data point\n',11,NULL,16,'2015-06-30 10:39:43',1,0,NULL,NULL,NULL,1221,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(145,'comment on 77\n',11,NULL,16,'2015-06-30 10:48:55',1,0,NULL,NULL,NULL,1182,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(146,'making comment on 125',11,NULL,16,'2015-06-30 10:49:15',1,0,NULL,NULL,NULL,1183,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(147,'comment on 77',11,NULL,16,'2015-06-30 10:49:49',1,0,NULL,NULL,NULL,1187,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(148,'sadfds',11,NULL,16,'2015-06-30 10:49:57',1,0,NULL,NULL,NULL,1188,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(149,'dsfsdf',11,NULL,16,'2015-06-30 10:51:16',1,0,NULL,NULL,NULL,1222,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(150,'lkkll;klk',11,NULL,16,'2015-06-30 17:17:01',1,0,NULL,NULL,NULL,1218,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(151,'high',11,NULL,17,'2015-07-04 10:39:45',1,0,NULL,NULL,NULL,1362,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(152,'low',11,NULL,17,'2015-07-04 10:40:35',1,0,NULL,NULL,NULL,1376,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(153,'Normal Point',11,NULL,17,'2015-07-06 10:05:06',1,0,NULL,NULL,NULL,1481,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(154,'This is a comment on 90.',NULL,8,16,'2015-07-07 15:32:13',0,1,NULL,NULL,NULL,1193,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(155,'This is a comment on 54.',NULL,8,17,'2015-07-07 15:33:14',0,1,NULL,NULL,NULL,1471,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(156,'A comment on first one.',NULL,8,16,'2015-07-07 15:40:59',0,1,NULL,NULL,NULL,1180,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(157,'This is a comment.',11,NULL,16,'2015-07-07 15:50:36',1,0,NULL,NULL,NULL,1193,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(158,'Normal at 71',NULL,8,17,'2015-07-08 07:04:01',0,1,NULL,NULL,NULL,1435,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(159,'Normal at evening 62',NULL,8,17,'2015-07-08 07:04:18',0,1,NULL,NULL,NULL,1439,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(160,'high',NULL,8,17,'2015-07-10 10:45:23',0,1,NULL,NULL,NULL,1425,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(161,'hi',11,NULL,17,'2015-07-14 09:04:32',1,0,NULL,NULL,NULL,1405,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(162,'A comment.',NULL,8,17,'2015-07-14 05:29:42',0,1,NULL,NULL,NULL,1371,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(163,'<?<$@#$#$*)()*_ ',11,NULL,17,'2015-07-20 05:59:03',1,0,NULL,NULL,NULL,1487,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(164,'<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"description\" content=\"\">\n    <meta name=\"author\" content=\"\">\n    <link rel=\"shortcut icon\" href=\"favicon.ico\">\n\n    <title>RPMS</title>\n\n    <!-- Google Web Font -->\n    <!-- <link href=\'http://fonts.googleapis.com/css?family=Ubuntu:400,500,700,400italic,500italic,700italic\' rel=\'stylesheet\' type=\'text/css\'> -->\n\n    <!-- Bootstrap core CSS -->\n    <link href=\"../resources/css/font-awesome.min.css\" rel=\"stylesheet\">\n    <link href=\"../resources/css/bootstrap.min.css\" rel=\"stylesheet\">\n\n    <!-- Just for debugging purposes. Don\'t actually copy this line! -->\n    <!--[if lt IE 9]><script src=\"js/ie8-responsive-file-warning.js\"></script><![endif]-->\n    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n    <!--[if lt IE 9]>\n      <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\n      <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\n    <![endif]-->\n',11,NULL,17,'2015-07-20 05:59:27',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(165,'helo',11,NULL,17,'2015-07-20 05:59:40',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(166,'this is normal point!!',11,NULL,17,'2015-07-20 06:00:26',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(167,'<>',11,NULL,17,'2015-07-20 06:00:43',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(168,'{}[]',11,NULL,17,'2015-07-20 06:01:24',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(169,'$',11,NULL,17,'2015-07-20 06:02:46',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(170,'@',11,NULL,17,'2015-07-20 06:03:21',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(171,'#',11,NULL,17,'2015-07-20 06:03:30',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(172,'^',11,NULL,17,'2015-07-20 06:03:37',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(173,'()',11,NULL,17,'2015-07-20 06:03:59',1,0,NULL,NULL,NULL,1483,NULL,0,1,NULL,'Doctor Anny',NULL,NULL),(174,'Test1',NULL,8,17,'2015-12-08 09:26:32',0,1,NULL,NULL,NULL,1487,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(175,'Test 001',NULL,8,17,'2016-02-04 06:20:54',0,1,NULL,NULL,NULL,1487,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta'),(176,'Test 002',NULL,8,17,'2016-02-04 06:21:32',0,1,NULL,NULL,NULL,1487,NULL,0,NULL,1,NULL,NULL,'Roshni Gupta');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count` (
  `id` int(11) NOT NULL,
  `patientCount` int(11) DEFAULT NULL,
  `doctorCount` int(11) DEFAULT NULL,
  `nurseCount` int(11) DEFAULT NULL,
  `unAssignedPatientCount` int(11) DEFAULT NULL,
  `doc1` int(11) DEFAULT NULL,
  `doc2` int(11) DEFAULT NULL,
  `doc3` int(11) DEFAULT NULL,
  `doc4` int(11) DEFAULT NULL,
  `doc5` int(11) DEFAULT NULL,
  `doc6` int(11) DEFAULT NULL,
  `nursedata1` int(11) DEFAULT NULL,
  `nursedata2` int(11) DEFAULT NULL,
  `nursedata3` int(11) DEFAULT NULL,
  `nursedata4` int(11) DEFAULT NULL,
  `nursedata5` int(11) DEFAULT NULL,
  `nursedata6` int(11) DEFAULT NULL,
  `nursedata7` int(11) DEFAULT NULL,
  `nursedata8` int(11) DEFAULT NULL,
  `nursedata9` int(11) DEFAULT NULL,
  `nursedata10` int(11) DEFAULT NULL,
  `doctorMsg` int(11) DEFAULT NULL,
  `nurseMsg` int(11) DEFAULT NULL,
  `patientData` int(11) DEFAULT NULL,
  `patientProb` int(11) DEFAULT NULL,
  `hcgCount` int(11) DEFAULT NULL,
  `blockedUserCount` int(11) DEFAULT NULL,
  `blockedPatientCount` int(11) DEFAULT NULL,
  `blockedNurseCount` int(11) DEFAULT NULL,
  `blockedDoctorCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='						';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
INSERT INTO `count` VALUES (1,26,13,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(55) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `date_of_birth` timestamp NULL DEFAULT NULL,
  `cellphone` varchar(100) DEFAULT NULL,
  `homephone` varchar(100) DEFAULT NULL,
  `homeaddress` varchar(255) DEFAULT NULL,
  `mailingAddress` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `hcg_identifier` varchar(100) DEFAULT NULL,
  `npi` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `startActivePeriod` timestamp NULL DEFAULT NULL,
  `endActivePeriod` timestamp NULL DEFAULT NULL,
  `reasonForLeaving` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `hcgID` int(11) NOT NULL,
  `image` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FK_DOCTOR_HCG_idx` (`hcgID`),
  CONSTRAINT `FK_DOCTOR_HCG` FOREIGN KEY (`hcgID`) REFERENCES `hcgorgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Kelin','','Puma','','male',NULL,'(423)-423-4234','(234)-444-4444','CHRIS NISWANDEE SMALLSYS INC','','kelin@ukitss.com','HCG-90990','2123232122','2015-04-13 10:03:55','2015-11-27 09:43:04',NULL,NULL,NULL,0,0,1,'/Images/1448617381650.jpg'),(2,'stacy','','k','StacyK','female',NULL,'(824)-716-4176','(675)-426-4526','CHRIS NISWANDEE SMALLSYS INC','','stacy@ukitss.com','HCG-11154','2123232123','2015-04-29 13:22:06','2015-11-27 09:51:54',NULL,NULL,NULL,1,0,1,'/Images/1448617912916.jpg'),(3,'John','','Marsden','','male',NULL,'(323)-702-4930','','1044 Herbert Ave','','tehknologik@hotmail.com','HCG-1111','0898828183','2015-05-07 00:42:29','2015-05-13 09:46:04',NULL,NULL,NULL,0,0,1,'http://www.infinity-stores.com:8081/RPMS/images/1430959340625.jpg'),(4,'allen','','','','male',NULL,'(345)-345-3453','','CHRIS NISWANDEE SMALLSYS INC','','allen@ukitss.com','HCF23','3423423333','2015-05-11 08:47:10','2015-05-11 08:47:10',NULL,NULL,NULL,0,0,1,'../resources/images/demo.png'),(5,'Mark','','','','male',NULL,'(251)-452-6325','','state street','','mark@ukitss.com','HCG-909','25163','2015-05-12 08:39:12','2015-05-15 12:39:54',NULL,NULL,NULL,0,0,5,'../resources/images/demo.png'),(6,'AllenJ','','J','','male',NULL,'(534)-576-5746','','C','','allen1@ukitss.com','','','2015-05-13 09:55:19','2015-05-13 09:55:19',NULL,NULL,NULL,0,0,1,'../resources/images/demo.png'),(7,'geoarge','','','','female',NULL,'(342)-423-4323','','CHRIS NISWANDEE SMALLSYS INC','','geoarge@ukitss.com','HCG-101','7236425442','2015-05-13 10:21:46','2015-05-13 10:21:46',NULL,NULL,NULL,0,0,5,'../resources/images/demo.png'),(8,'tom','','','','male',NULL,'(234)-242-3423','','CHRIS NISWANDEE SMALLSYS INC','','tom@ukitss.com','HCG-0999','4234343444','2015-05-22 05:25:01','2015-05-22 05:25:01',NULL,NULL,NULL,0,0,1,'../resources/images/demo.png'),(9,'Jezeerl','','Bu','','male',NULL,'(213)-276-2222','','Address','','jez@ukitss.com','HCG-899','2223213232','2015-06-17 07:16:18','2015-11-27 10:05:46',NULL,NULL,NULL,0,0,1,'/Images/1448618744426.jpg'),(10,'prachi','kumari','gupta','chotu','female',NULL,'(941)-402-2953','(823)-388-6779','20/24-e braghu path mansarovar jaiipur','20/24-e braghu path mansarovar jaiipur','guptasakshi@ukitss.com','1325798','1234567891','2015-06-18 10:28:31','2015-06-18 12:49:03',NULL,NULL,NULL,0,0,1,'../resources/images/demo.png'),(11,'Doctor','','Anny','','female',NULL,'(343)-243-4343','','CHRIS NISWANDEE SMALLSYS INC','','anny@ukitss.com','94857','4353454354','2015-06-23 06:34:21','2015-06-23 06:34:21',NULL,NULL,NULL,0,0,11,'../resources/images/demo.png'),(12,'Elle','','T','','female',NULL,'(873)-612-7362','','CHRIS NISWANDEE SMALLSYS INC','','elle@ukitss.com','53454','4534534555','2015-06-24 06:44:36','2015-06-24 06:44:36',NULL,NULL,NULL,0,0,11,'../resources/images/demo.png'),(13,'ewr','','','','female',NULL,'(333)-333-3334','','fdg','','jezeerl213213@ukitss.com','4534','4353454322','2015-07-22 11:59:37','2015-07-22 11:59:37',NULL,NULL,NULL,0,0,11,'../resources/images/demo.png');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_history`
--

DROP TABLE IF EXISTS `doctor_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docID` int(11) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `reason_of_leaving` text,
  `history_status` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `docID_idx` (`docID`),
  CONSTRAINT `fk_docHistory_docID` FOREIGN KEY (`docID`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_history`
--

LOCK TABLES `doctor_history` WRITE;
/*!40000 ALTER TABLE `doctor_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorcomment`
--

DROP TABLE IF EXISTS `doctorcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phyDataId` int(11) NOT NULL,
  `docId` int(11) DEFAULT NULL,
  `dcomment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dsfsdf_idx` (`phyDataId`),
  CONSTRAINT `dsfsdf` FOREIGN KEY (`phyDataId`) REFERENCES `patientphysiologicaldata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorcomment`
--

LOCK TABLES `doctorcomment` WRITE;
/*!40000 ALTER TABLE `doctorcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hcgorgnization`
--

DROP TABLE IF EXISTS `hcgorgnization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hcgorgnization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hcgtimezone` timestamp NULL DEFAULT NULL,
  `hcgName` varchar(100) DEFAULT NULL,
  `phone` varchar(155) DEFAULT NULL,
  `emailID` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `cellphone` varchar(100) DEFAULT NULL,
  `homephone` varchar(100) DEFAULT NULL,
  `homeaddress` varchar(255) DEFAULT NULL,
  `mailingAddress` varchar(255) DEFAULT NULL,
  `createdAT` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `startActivePeriod` timestamp NULL DEFAULT NULL,
  `endActivePeriod` timestamp NULL DEFAULT NULL,
  `reasonForLeaving` text,
  `status` tinyint(4) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL,
  `image` text,
  `timezone` varchar(50) DEFAULT NULL,
  `bloodPresure` varchar(50) DEFAULT NULL,
  `gulcose` varchar(50) DEFAULT NULL,
  `bloodPresureMax` varchar(45) DEFAULT NULL,
  `gulcoseMax` varchar(45) DEFAULT NULL,
  `dateformat` varchar(50) DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `adminID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_id_idx` (`adminID`),
  CONSTRAINT `fk_admin_id` FOREIGN KEY (`adminID`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hcgorgnization`
--

LOCK TABLES `hcgorgnization` WRITE;
/*!40000 ALTER TABLE `hcgorgnization` DISABLE KEYS */;
INSERT INTO `hcgorgnization` VALUES (1,NULL,'cyna',NULL,'cyna@gmail.com',NULL,'Cyna','','HCG','','male','(121)-211-1111','','CHRIS NISWANDEE SMALLSYS INC','',NULL,'2015-11-27 06:51:53',NULL,NULL,NULL,0,0,'/Images/1448607107396.jpg','EST','150,mmHg','41.55,Mg/dL','75,mmHg','98.50,Mg/dL','MonthDayYear','Critical,Generally Compliant,Not Compliant',1),(2,NULL,NULL,NULL,'ashutosh.kumar@ukitss.com',NULL,'Rima','','Bopara','Rima','female','(987)-456-1235','(987)-456-1236','#11, A/2','Washington','2015-04-13 08:41:53','2015-11-27 07:13:02',NULL,NULL,NULL,0,0,'/Images/1448608380030.jpg','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(3,NULL,NULL,NULL,'ashutosh.kumar@ukitss.com',NULL,'Peter','','Nicolas','','male','(321)-456-7899','(654)-789-3214','#10, B/5','Florida','2015-04-13 08:53:47','2015-11-27 10:03:02',NULL,NULL,NULL,0,0,'/Images/1448618580289.jpg','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(4,NULL,NULL,NULL,'george@ukitss.com',NULL,'George','','Chris','Chris','male','(654)-456-6666','(558)-856-6666','George Town','USA','2015-05-04 06:49:37','2015-11-27 10:03:50',NULL,NULL,NULL,0,0,'/Images/1448618628123.jpg','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(5,NULL,NULL,NULL,'superduper@ukitss.com',NULL,'SuperDuper','','Admin','','female','(345)-454-5454','','CHRIS NISWANDEE SMALLSYS INC','','2015-05-12 06:16:53','2015-05-15 12:38:17',NULL,NULL,NULL,0,0,'http://www.infinity-stores.com:8081/RPMS/images/1431411856017.jpg','PST','120,mmHg','70.09,Mg/dL','85,mmHg','40.00,Mg/dL','MonthDayYear','Critical,General Complaint,Non Compliant',1),(6,NULL,NULL,NULL,'testadmin@ukitss.com',NULL,'test','','admin','','male','(726)-323-2163','','CHRIS NISWANDEE SMALLSYS INC','','2015-05-21 06:57:49','2015-05-21 06:57:49',NULL,NULL,NULL,0,0,'http://www.infinity-stores.com:8081/RPMS/images/1432191452861.jpg','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(7,NULL,NULL,NULL,'abhishekshukla@ukitss.com',NULL,'Abhishek','','','','male','(456)-578-8978','','CHRIS1 NISWANDEE SMALLSYS INC','','2015-05-22 08:40:09','2015-05-22 08:40:09',NULL,NULL,NULL,0,0,'../resources/images/demo.png','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(8,NULL,NULL,NULL,'tony@ukitss.com',NULL,'Tony','','','','male','(908)-778-7654','','#12, Round circle','','2015-05-22 08:42:15','2015-05-22 08:42:15',NULL,NULL,NULL,0,0,'../resources/images/demo.png','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(9,NULL,NULL,NULL,'rocky@ukitss.com',NULL,'Rocky','','','','male','(343)-214-3554','','23-A Wall Street','','2015-05-22 08:56:04','2015-05-22 08:56:04',NULL,NULL,NULL,0,0,'../resources/images/demo.png','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(10,NULL,NULL,NULL,'albertadmin@ukitss.com',NULL,'Albert','','','','male','(342)-423-4343','','CHRIS NISWANDEE SMALLSYS INC','','2015-05-22 08:59:08','2015-05-22 08:59:08',NULL,NULL,NULL,0,0,'../resources/images/demo.png','EST','0.000,mmHg','0.00,Mmol/L','0.000,mmHg','0.00,Mmol/L','MonthDayYear','Generally Compliant,Critical,Non Compliant',1),(11,NULL,NULL,NULL,'newadmin@ukitss.com',NULL,'NewAdmin','','EMR','','male','(324)-343-4444','','CHRIS NISWANDEE SMALLSYS INC','','2015-06-23 06:23:32','2015-07-16 04:48:07',NULL,NULL,NULL,0,0,'http://10.0.1.214:8081/DS4U_DEMO/images/demo.png','PST','120,mmHg','50,Mg/dL','70,mmHg','100,Mg/dL','DayMonthYear','Generally Compliant,Critical,Not Compliant',1);
/*!40000 ALTER TABLE `hcgorgnization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure` (
  `id` int(11) NOT NULL,
  `patientID` int(11) DEFAULT NULL,
  `docID` int(11) DEFAULT NULL,
  `bloodpresure` varchar(100) DEFAULT NULL,
  `bloodsugur` varchar(100) DEFAULT NULL,
  `bloodpresureMax` varchar(100) DEFAULT NULL,
  `bloodsugurMax` varchar(100) DEFAULT NULL,
  `createdAT` datetime DEFAULT NULL,
  `updatedAT` datetime DEFAULT NULL,
  `hcgID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientID_idx` (`patientID`),
  KEY `doctorID_idx` (`docID`),
  KEY `fk_hcgids_idx` (`hcgID`),
  CONSTRAINT `doctorID` FOREIGN KEY (`docID`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hcgids` FOREIGN KEY (`hcgID`) REFERENCES `hcgorgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patientID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,1,1,'120.00','8.325','750.062','6.660','2015-04-16 14:48:06','2015-04-16 14:48:06',1),(2,3,1,'100','60','40','30','2015-05-05 11:39:04','2015-05-05 11:39:04',1),(3,4,1,'80','75','150','40','2015-05-11 18:03:03','2015-05-11 18:03:03',1),(4,4,1,'80','75','150','40','2015-05-11 18:10:22','2015-05-11 18:10:22',1),(5,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:05:17','2015-05-13 10:05:17',1),(6,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:05:24','2015-05-13 10:05:24',1),(7,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:05:29','2015-05-13 10:05:29',1),(8,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:42:06','2015-05-13 10:42:06',1),(9,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:44:54','2015-05-13 10:44:54',1),(10,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:47:09','2015-05-13 10:47:09',1),(11,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:57:54','2015-05-13 10:57:54',1),(12,3,1,'13.332','3.330','12.12','1.665','2015-05-13 10:59:44','2015-05-13 10:59:44',1),(13,3,1,'13.332','3.330','12.12','1.665','2015-05-13 11:09:30','2015-05-13 11:09:30',1),(14,3,1,'13.332','3.330','12.12','1.665','2015-05-13 11:09:37','2015-05-13 11:09:37',1),(15,3,1,'13.332','3.330','12.12','1.665','2015-05-13 13:58:53','2015-05-13 13:58:53',1),(16,3,1,'13.332','3.330','12.12','1.665','2015-05-13 13:59:06','2015-05-13 13:59:06',1),(17,2,1,'170.000','110.000','70.000','90.000','2015-05-14 11:03:46','2015-05-14 11:03:46',1),(18,3,1,'13.332','3.330','12.12','1.665','2015-05-15 13:44:47','2015-05-15 13:44:47',1),(19,2,1,'170.000','110.000','70.000','90.000','2015-05-15 13:45:02','2015-05-15 13:45:02',1),(20,2,1,'170.000','110.000','70.000','90.000','2015-05-15 13:46:56','2015-05-15 13:46:56',1),(21,2,1,'170.000','110.000','70.000','90.000','2015-05-15 13:47:32','2015-05-15 13:47:32',1),(22,2,1,'','','','','2015-05-15 14:01:04','2015-05-15 14:01:04',1),(23,3,1,'100.10','54.00','65.00','90.00','2015-06-17 17:31:16','2015-06-17 17:31:16',1),(24,16,11,'120','90','80','60','2015-06-30 12:12:50','2015-06-30 12:12:50',11),(25,16,11,'80','60','120','90','2015-06-30 12:21:53','2015-06-30 12:21:53',11),(26,16,11,'80','60','120','90','2015-06-30 12:22:09','2015-06-30 12:22:09',11),(27,16,11,'','80','','200','2015-07-08 09:54:32','2015-07-08 09:54:32',11),(28,16,11,'90','80','130','100','2015-07-08 12:28:31','2015-07-08 12:28:31',11),(29,16,11,'80','70','120','110','2015-07-08 14:26:51','2015-07-08 14:26:51',11),(30,16,11,'90','80','130','120','2015-07-09 12:05:15','2015-07-09 12:05:15',11),(31,17,11,'1','23369','2','35045','2015-07-11 14:52:48','2015-07-11 14:52:48',11),(32,17,11,'80','421062','120','631440','2015-07-11 15:13:01','2015-07-11 15:13:01',11),(33,17,11,'70','50','120','100','2015-07-14 14:54:26','2015-07-14 14:54:26',11),(34,17,11,'69.98','50.09','90','90','2015-07-14 18:01:03','2015-07-14 18:01:03',11),(35,17,11,'69.98','50.09','120','90','2015-07-14 18:02:03','2015-07-14 18:02:03',11);
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `docID` int(11) DEFAULT NULL,
  `nurseID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `entryTime` timestamp NULL DEFAULT NULL,
  `seentime` timestamp NULL DEFAULT NULL,
  `createdAT` timestamp NULL DEFAULT NULL,
  `updatedAT` timestamp NULL DEFAULT NULL,
  `isReadDoc` tinyint(4) DEFAULT NULL,
  `isReadPatient` tinyint(4) DEFAULT NULL,
  `isReadNurse` tinyint(4) DEFAULT NULL,
  `hcgID` int(11) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `isSentPatient` tinyint(4) DEFAULT NULL,
  `isSentDoc` tinyint(4) DEFAULT NULL,
  `isSentNures` tinyint(4) DEFAULT NULL,
  `docName` varchar(45) DEFAULT NULL,
  `patientName` varchar(45) DEFAULT NULL,
  `nurseName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_docID_idx` (`docID`),
  KEY `fk_message_nurseID_idx` (`nurseID`),
  KEY `fk_message_patientID_idx` (`patientID`),
  KEY `fk_message_hcgID_idx` (`hcgID`),
  CONSTRAINT `fk_message_docID` FOREIGN KEY (`docID`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_hcgID` FOREIGN KEY (`hcgID`) REFERENCES `hcgorgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_nurseID` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_patientID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'hello',NULL,1,1,'2015-04-16 12:19:05',NULL,'2015-04-16 12:19:05','2015-04-16 12:19:05',NULL,1,1,1,0,NULL,NULL,1,NULL,'Robin Revon','Neddy'),(2,'hi',1,2,1,'2015-04-16 12:19:13',NULL,'2015-04-16 12:19:13','2015-04-16 12:19:13',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(3,'hiiiiiiiiiiiiii',NULL,1,1,'2015-04-16 12:22:50',NULL,'2015-04-16 12:22:50','2015-04-16 12:22:50',NULL,1,1,1,0,1,NULL,NULL,NULL,'Robin','Neddy'),(4,'hey whats up.....',NULL,1,3,'2015-04-29 05:10:48',NULL,'2015-04-29 05:10:48','2015-04-29 05:10:48',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(5,'hello',1,NULL,3,'2015-04-29 06:42:32',NULL,'2015-04-29 06:42:32','2015-04-29 06:42:32',1,1,NULL,1,0,NULL,1,NULL,'kelin','Gary John',NULL),(6,'how r u',1,NULL,3,'2015-04-29 06:42:40',NULL,'2015-04-29 06:42:40','2015-04-29 06:42:40',1,1,NULL,1,0,NULL,1,NULL,'kelin','Gary John',NULL),(7,'hello kelin',1,NULL,3,'2015-04-29 07:02:00',NULL,'2015-04-29 07:02:00','2015-04-29 07:02:00',1,1,NULL,1,0,1,NULL,NULL,'kelin','Gary',NULL),(8,'hi',1,NULL,3,'2015-04-29 07:03:25',NULL,'2015-04-29 07:03:25','2015-04-29 07:03:25',1,1,NULL,1,0,1,NULL,NULL,'kelin','Gary',NULL),(9,'nothing',NULL,1,3,'2015-04-29 07:04:00',NULL,'2015-04-29 07:04:00','2015-04-29 07:04:00',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(10,'hi',NULL,1,3,'2015-04-29 07:04:20',NULL,'2015-04-29 07:04:20','2015-04-29 07:04:20',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(11,'hello',1,1,3,'2015-04-29 07:07:51',NULL,'2015-04-29 07:07:51','2015-04-29 07:07:51',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(12,'hello neddy',1,1,3,'2015-04-29 07:09:03',NULL,'2015-04-29 07:09:03','2015-04-29 07:09:03',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(13,'hello',1,NULL,4,'2015-04-29 12:56:42',NULL,'2015-04-29 12:56:42','2015-04-29 12:56:42',1,1,NULL,1,0,1,NULL,NULL,'kelin','George',NULL),(14,'Hello Gary',NULL,1,3,'2015-05-04 05:08:02',NULL,'2015-05-04 05:08:02','2015-05-04 05:08:02',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(15,'Hello Gary!!',NULL,1,3,'2015-05-04 05:08:20',NULL,'2015-05-04 05:08:20','2015-05-04 05:08:20',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(16,'Hello Gary!!',NULL,1,3,'2015-05-04 05:08:49',NULL,'2015-05-04 05:08:49','2015-05-04 05:08:49',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(17,'hello',NULL,1,3,'2015-05-04 05:10:08',NULL,'2015-05-04 05:10:08','2015-05-04 05:10:08',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(18,'hello kelin',1,1,3,'2015-05-04 05:10:38',NULL,'2015-05-04 05:10:38','2015-05-04 05:10:38',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(19,'hey gary..',NULL,1,3,'2015-05-04 05:11:52',NULL,'2015-05-04 05:11:52','2015-05-04 05:11:52',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(20,'hello Nurse',1,1,3,'2015-05-04 05:12:05',NULL,'2015-05-04 05:12:05','2015-05-04 05:12:05',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(21,'Thanks Kelin',1,1,3,'2015-05-04 05:16:50',NULL,'2015-05-04 05:16:50','2015-05-04 05:16:50',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(22,'Hello ',1,1,3,'2015-05-04 05:24:13',NULL,'2015-05-04 05:24:13','2015-05-04 05:24:13',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(23,'hello gary',NULL,1,3,'2015-05-04 05:24:46',NULL,'2015-05-04 05:24:46','2015-05-04 05:24:46',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(24,'hey Gary',1,NULL,3,'2015-05-04 05:28:43',NULL,'2015-05-04 05:28:43','2015-05-04 05:28:43',1,1,NULL,1,0,NULL,1,NULL,'kelin','Gary John',NULL),(25,'hello',1,1,3,'2015-05-04 05:42:42',NULL,'2015-05-04 05:42:42','2015-05-04 05:42:42',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(26,'hello j',1,NULL,3,'2015-05-04 05:43:06',NULL,'2015-05-04 05:43:06','2015-05-04 05:43:06',1,1,NULL,1,0,NULL,1,NULL,'kelin','Gary John',NULL),(27,'hello',1,1,3,'2015-05-04 05:43:43',NULL,'2015-05-04 05:43:43','2015-05-04 05:43:43',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(28,'how r u',1,NULL,3,'2015-05-04 05:44:04',NULL,'2015-05-04 05:44:04','2015-05-04 05:44:04',1,1,NULL,1,0,NULL,1,NULL,'kelin','Gary John',NULL),(29,'how r u',1,1,3,'2015-05-04 05:45:00',NULL,'2015-05-04 05:45:00','2015-05-04 05:45:00',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(30,'???????????',1,NULL,3,'2015-05-04 05:45:45',NULL,'2015-05-04 05:45:45','2015-05-04 05:45:45',1,1,NULL,1,0,NULL,1,NULL,'kelin','Gary John',NULL),(31,'hello neddy',NULL,1,3,'2015-05-04 05:49:34',NULL,'2015-05-04 05:49:34','2015-05-04 05:49:34',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(32,'i m fine',1,1,3,'2015-05-04 05:49:58',NULL,'2015-05-04 05:49:58','2015-05-04 05:49:58',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(33,'and what about you.',1,1,3,'2015-05-04 05:50:19',NULL,'2015-05-04 05:50:19','2015-05-04 05:50:19',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(34,'hey Albert ',NULL,1,2,'2015-05-04 11:54:14',NULL,'2015-05-04 11:54:14','2015-05-04 11:54:14',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(35,'how are you...',NULL,1,2,'2015-05-04 11:54:55',NULL,'2015-05-04 11:54:55','2015-05-04 11:54:55',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(36,'hey Neddy..',NULL,1,2,'2015-05-04 11:55:31',NULL,'2015-05-04 11:55:31','2015-05-04 11:55:31',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(37,'hi neddy',NULL,1,2,'2015-05-04 11:57:25',NULL,'2015-05-04 11:57:25','2015-05-04 11:57:25',NULL,1,1,1,0,1,NULL,NULL,NULL,'Albert','Neddy'),(38,'i am not fine.. i will sue you hospital',NULL,1,2,'2015-05-04 11:57:48',NULL,'2015-05-04 11:57:48','2015-05-04 11:57:48',NULL,1,1,1,0,1,NULL,NULL,NULL,'Albert','Neddy'),(39,'what happen, what is problem',NULL,1,2,'2015-05-04 11:58:56',NULL,'2015-05-04 11:58:56','2015-05-04 11:58:56',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(40,'just check',NULL,1,2,'2015-05-04 12:02:24',NULL,'2015-05-04 12:02:24','2015-05-04 12:02:24',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(41,'Hey Neddy its Kelin, i want to discuss about Robert',1,1,5,'2015-05-05 05:08:40',NULL,'2015-05-05 05:08:40','2015-05-05 05:08:40',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(42,'i m fine',1,NULL,3,'2015-05-05 05:33:38',NULL,'2015-05-05 05:33:38','2015-05-05 05:33:38',1,1,NULL,1,0,1,NULL,NULL,'kelin','Gary',NULL),(43,'hello ',NULL,1,3,'2015-05-05 05:34:27',NULL,'2015-05-05 05:34:27','2015-05-05 05:34:27',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(44,'OK',1,NULL,3,'2015-05-05 05:57:40',NULL,'2015-05-05 05:57:40','2015-05-05 05:57:40',1,1,NULL,1,0,NULL,1,NULL,'kelin','Gary John',NULL),(45,'Ok fine i will be there soon',1,1,5,'2015-05-06 11:18:30',NULL,'2015-05-06 11:18:30','2015-05-06 11:18:30',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(46,'hello',1,1,3,'2015-05-06 17:19:21',NULL,'2015-05-06 17:19:21','2015-05-06 17:19:21',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(47,'Neddy',1,1,3,'2015-05-06 17:19:28',NULL,'2015-05-06 17:19:28','2015-05-06 17:19:28',1,NULL,1,1,0,NULL,1,NULL,'kelin',NULL,'Neddy K'),(48,'hI dOCTOR',1,NULL,3,'2015-05-06 17:20:12',NULL,'2015-05-06 17:20:12','2015-05-06 17:20:12',1,1,NULL,1,0,1,NULL,NULL,'kelin','Gary',NULL),(49,'hELLO nURSE',NULL,1,3,'2015-05-06 17:20:23',NULL,'2015-05-06 17:20:23','2015-05-06 17:20:23',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(50,'Hello Kelin',1,1,3,'2015-05-06 17:23:03',NULL,'2015-05-06 17:23:03','2015-05-06 17:23:03',1,NULL,1,1,0,NULL,NULL,1,'kelin G',NULL,'Neddy'),(51,'This patient is doing okay.',1,1,3,'2015-05-07 02:49:40',NULL,'2015-05-07 02:49:40','2015-05-07 02:49:40',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(52,'hello kelin, how are you',1,1,3,'2015-05-07 07:21:19',NULL,'2015-05-07 07:21:19','2015-05-07 07:21:19',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(53,'Hello joshep',1,1,3,'2015-05-07 07:21:38',NULL,'2015-05-07 07:21:38','2015-05-07 07:21:38',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(54,'hell doctor',1,NULL,3,'2015-05-08 14:10:00',NULL,'2015-05-08 14:10:00','2015-05-08 14:10:00',1,1,NULL,1,0,1,NULL,NULL,'Joseph','Gary',NULL),(55,'hello Neddy',1,1,3,'2015-05-09 04:54:02',NULL,'2015-05-09 04:54:02','2015-05-09 04:54:02',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(56,'hello Joseph',1,1,3,'2015-05-09 04:55:57',NULL,'2015-05-09 04:55:57','2015-05-09 04:55:57',1,NULL,1,1,0,NULL,NULL,1,'Joseph Puma',NULL,'Neddy'),(57,'hello Joseph',1,NULL,3,'2015-05-09 04:57:05',NULL,'2015-05-09 04:57:05','2015-05-09 04:57:05',1,1,NULL,1,0,1,NULL,NULL,'Joseph','Gary',NULL),(58,'hello Neddy whats up',1,1,3,'2015-05-08 16:44:40',NULL,'2015-05-08 16:44:40','2015-05-08 16:44:40',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(59,'Fine sir ',1,1,3,'2015-05-08 16:45:50',NULL,'2015-05-08 16:45:50','2015-05-08 16:45:50',1,NULL,1,1,0,NULL,NULL,1,'Joseph Puma',NULL,'Neddy'),(60,'hello neddy, how are you..',NULL,1,3,'2015-05-09 05:36:30',NULL,'2015-05-09 05:36:30','2015-05-09 05:36:30',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(61,'hello Neddy its Kelin',1,1,3,'2015-05-09 05:48:44',NULL,'2015-05-09 05:48:44','2015-05-09 05:48:44',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(62,'hello IE',NULL,1,3,'2015-05-09 06:21:07',NULL,'2015-05-09 06:21:07','2015-05-09 06:21:07',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(63,'hello',1,NULL,3,'2015-05-11 09:15:33',NULL,'2015-05-11 09:15:33','2015-05-11 09:15:33',1,1,NULL,1,0,NULL,1,NULL,'Joseph','Gary John',NULL),(64,'there',1,NULL,3,'2015-05-11 09:17:05',NULL,'2015-05-11 09:17:05','2015-05-11 09:17:05',1,1,NULL,1,0,1,NULL,NULL,'Joseph','Gary',NULL),(65,'there',NULL,1,3,'2015-05-11 09:17:20',NULL,'2015-05-11 09:17:20','2015-05-11 09:17:20',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(66,'ds',1,NULL,3,'2015-05-11 09:30:50',NULL,'2015-05-11 09:30:50','2015-05-11 09:30:50',1,1,NULL,1,0,1,NULL,NULL,'Joseph','Gary',NULL),(67,'hello',NULL,1,3,'2015-05-11 09:31:29',NULL,'2015-05-11 09:31:29','2015-05-11 09:31:29',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(68,'dsfdf',1,NULL,3,'2015-05-11 09:39:53',NULL,'2015-05-11 09:39:53','2015-05-11 09:39:53',1,1,NULL,1,0,NULL,1,NULL,'Joseph','Gary John',NULL),(69,'hello',1,1,3,'2015-05-11 09:47:46',NULL,'2015-05-11 09:47:46','2015-05-11 09:47:46',1,NULL,1,1,0,NULL,NULL,1,'Joseph Puma',NULL,'Neddy'),(70,'i am fine',NULL,1,3,'2015-05-11 09:47:59',NULL,'2015-05-11 09:47:59','2015-05-11 09:47:59',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(71,'hello',1,NULL,3,'2015-05-13 08:38:12',NULL,'2015-05-13 08:38:12','2015-05-13 08:38:12',1,1,NULL,1,0,NULL,1,NULL,'Joseph','Gary John',NULL),(72,'how  ru',1,NULL,3,'2015-05-13 08:38:16',NULL,'2015-05-13 08:38:16','2015-05-13 08:38:16',1,1,NULL,1,0,NULL,1,NULL,'Joseph','Gary John',NULL),(73,'whats up',1,NULL,3,'2015-05-13 08:38:20',NULL,'2015-05-13 08:38:20','2015-05-13 08:38:20',1,1,NULL,1,0,NULL,1,NULL,'Joseph','Gary John',NULL),(74,'hello ',1,1,3,'2015-05-13 08:38:36',NULL,'2015-05-13 08:38:36','2015-05-13 08:38:36',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(75,'how r u',1,1,3,'2015-05-13 08:38:38',NULL,'2015-05-13 08:38:38','2015-05-13 08:38:38',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(76,'whats up',1,1,3,'2015-05-13 08:38:40',NULL,'2015-05-13 08:38:40','2015-05-13 08:38:40',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(77,'where r u',1,1,3,'2015-05-13 08:38:44',NULL,'2015-05-13 08:38:44','2015-05-13 08:38:44',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(78,'hello',NULL,1,3,'2015-05-13 08:40:35',NULL,'2015-05-13 08:40:35','2015-05-13 08:40:35',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(79,'i m good',NULL,1,3,'2015-05-13 08:40:38',NULL,'2015-05-13 08:40:38','2015-05-13 08:40:38',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(80,'and what about u',NULL,1,3,'2015-05-13 08:41:04',NULL,'2015-05-13 08:41:04','2015-05-13 08:41:04',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(81,'??',NULL,1,3,'2015-05-13 08:41:05',NULL,'2015-05-13 08:41:05','2015-05-13 08:41:05',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(82,'i m not fine',NULL,1,3,'2015-05-13 08:41:11',NULL,'2015-05-13 08:41:11','2015-05-13 08:41:11',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(83,'Ok got that.',1,1,3,'2015-05-13 09:36:07',NULL,'2015-05-13 09:36:07','2015-05-13 09:36:07',1,NULL,1,1,0,NULL,1,NULL,'Joseph',NULL,'Neddy K'),(84,'hello',1,NULL,3,'2015-05-14 09:04:16',NULL,'2015-05-14 09:04:16','2015-05-14 09:04:16',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(85,'fine you say',1,NULL,3,'2015-05-14 09:05:18',NULL,'2015-05-14 09:05:18','2015-05-14 09:05:18',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(86,'dafdfdasf',1,NULL,3,'2015-05-14 09:05:28',NULL,'2015-05-14 09:05:28','2015-05-14 09:05:28',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(87,'sdfgdfg',1,NULL,3,'2015-05-14 09:57:49',NULL,'2015-05-14 09:57:49','2015-05-14 09:57:49',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(88,'gfsdfg',1,NULL,3,'2015-05-14 09:58:00',NULL,'2015-05-14 09:58:00','2015-05-14 09:58:00',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(89,'tregdfgs',1,NULL,3,'2015-05-14 10:06:26',NULL,'2015-05-14 10:06:26','2015-05-14 10:06:26',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(90,'d',1,1,3,'2015-05-14 11:03:31',NULL,'2015-05-14 11:03:31','2015-05-14 11:03:31',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(91,'hello',1,1,3,'2015-05-14 11:04:12',NULL,'2015-05-14 11:04:12','2015-05-14 11:04:12',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(92,'hi',NULL,1,3,'2015-05-14 11:07:53',NULL,'2015-05-14 11:07:53','2015-05-14 11:07:53',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(93,'hi..',1,1,3,'2015-05-14 11:09:30',NULL,'2015-05-14 11:09:30','2015-05-14 11:09:30',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(94,'hello',NULL,1,3,'2015-05-14 11:09:45',NULL,'2015-05-14 11:09:45','2015-05-14 11:09:45',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(95,'hi',NULL,1,3,'2015-05-14 11:10:24',NULL,'2015-05-14 11:10:24','2015-05-14 11:10:24',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(96,'hello',1,NULL,3,'2015-05-14 11:13:59',NULL,'2015-05-14 11:13:59','2015-05-14 11:13:59',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(97,'helllo',1,1,3,'2015-05-14 11:14:09',NULL,'2015-05-14 11:14:09','2015-05-14 11:14:09',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(98,'hello',NULL,1,3,'2015-05-14 11:14:33',NULL,'2015-05-14 11:14:33','2015-05-14 11:14:33',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(99,'hello',1,1,3,'2015-05-14 11:14:40',NULL,'2015-05-14 11:14:40','2015-05-14 11:14:40',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(100,'hello kelin its neddy',1,1,3,'2015-05-14 11:17:11',NULL,'2015-05-14 11:17:11','2015-05-14 11:17:11',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(101,'hello kelin its gary',1,NULL,3,'2015-05-14 11:17:49',NULL,'2015-05-14 11:17:49','2015-05-14 11:17:49',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(102,'helo doc',1,1,3,'2015-05-14 11:32:53',NULL,'2015-05-14 11:32:53','2015-05-14 11:32:53',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(103,'aks',1,NULL,3,'2015-05-14 11:33:19',NULL,'2015-05-14 11:33:19','2015-05-14 11:33:19',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(104,'hi ,,,,,,,,,,,,',1,1,3,'2015-05-14 11:54:08',NULL,'2015-05-14 11:54:08','2015-05-14 11:54:08',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(105,'hello,,,,,,,,,,,,,,,',1,NULL,3,'2015-05-14 11:54:28',NULL,'2015-05-14 11:54:28','2015-05-14 11:54:28',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(106,'hhhhh',1,1,3,'2015-05-14 11:54:58',NULL,'2015-05-14 11:54:58','2015-05-14 11:54:58',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(107,'hhhheeeeee',1,1,3,'2015-05-14 11:56:13',NULL,'2015-05-14 11:56:13','2015-05-14 11:56:13',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(108,'ghfghfghj',1,1,3,'2015-05-14 11:59:49',NULL,'2015-05-14 11:59:49','2015-05-14 11:59:49',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(109,'gjuytuyttyty',1,NULL,3,'2015-05-14 12:00:10',NULL,'2015-05-14 12:00:10','2015-05-14 12:00:10',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(110,'tyyt',1,NULL,3,'2015-05-14 12:09:14',NULL,'2015-05-14 12:09:14','2015-05-14 12:09:14',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(111,'retretretre',1,1,3,'2015-05-14 12:09:36',NULL,'2015-05-14 12:09:36','2015-05-14 12:09:36',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(112,'6756yutyi',1,1,3,'2015-05-14 12:14:07',NULL,'2015-05-14 12:14:07','2015-05-14 12:14:07',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(113,'rewtret4543',1,1,3,'2015-05-14 12:16:55',NULL,'2015-05-14 12:16:55','2015-05-14 12:16:55',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(114,'gvdfgdfg',1,1,3,'2015-05-14 12:17:27',NULL,'2015-05-14 12:17:27','2015-05-14 12:17:27',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(115,'hello doc',1,1,3,'2015-05-14 12:35:27',NULL,'2015-05-14 12:35:27','2015-05-14 12:35:27',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(116,'hey doc,,,',1,NULL,3,'2015-05-14 12:35:54',NULL,'2015-05-14 12:35:54','2015-05-14 12:35:54',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(117,'hhheyy',1,1,3,'2015-05-14 12:46:26',NULL,'2015-05-14 12:46:26','2015-05-14 12:46:26',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(118,'helllllooo',1,NULL,3,'2015-05-14 12:46:47',NULL,'2015-05-14 12:46:47','2015-05-14 12:46:47',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(119,'hello',1,1,3,'2015-05-14 12:48:45',NULL,'2015-05-14 12:48:45','2015-05-14 12:48:45',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(120,'hello',NULL,1,3,'2015-05-14 12:48:51',NULL,'2015-05-14 12:48:51','2015-05-14 12:48:51',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(121,'hii',1,1,3,'2015-05-14 12:49:12',NULL,'2015-05-14 12:49:12','2015-05-14 12:49:12',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(122,'hello',1,NULL,3,'2015-05-14 12:49:18',NULL,'2015-05-14 12:49:18','2015-05-14 12:49:18',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(123,'hello',NULL,1,3,'2015-05-14 12:50:30',NULL,'2015-05-14 12:50:30','2015-05-14 12:50:30',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(124,'hgffd',1,1,3,'2015-05-14 12:51:49',NULL,'2015-05-14 12:51:49','2015-05-14 12:51:49',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(125,'gfhgf',1,NULL,3,'2015-05-14 12:52:06',NULL,'2015-05-14 12:52:06','2015-05-14 12:52:06',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(126,'hi neddy',NULL,1,3,'2015-05-14 12:54:59',NULL,'2015-05-14 12:54:59','2015-05-14 12:54:59',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(127,'hello neddy',1,1,3,'2015-05-14 12:55:23',NULL,'2015-05-14 12:55:23','2015-05-14 12:55:23',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(128,'hjgh',1,1,3,'2015-05-14 13:02:16',NULL,'2015-05-14 13:02:16','2015-05-14 13:02:16',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(129,'fgdfhdfghg',1,1,3,'2015-05-14 13:36:52',NULL,'2015-05-14 13:36:52','2015-05-14 13:36:52',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(130,'fghgfhg',NULL,1,3,'2015-05-14 13:37:06',NULL,'2015-05-14 13:37:06','2015-05-14 13:37:06',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(131,'fghfghfgh',1,1,3,'2015-05-14 13:37:49',NULL,'2015-05-14 13:37:49','2015-05-14 13:37:49',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(132,'hfgjghj',1,1,3,'2015-05-14 13:48:58',NULL,'2015-05-14 13:48:58','2015-05-14 13:48:58',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(133,'khjgkk',1,NULL,3,'2015-05-14 13:49:50',NULL,'2015-05-14 13:49:50','2015-05-14 13:49:50',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(134,'hjhgjghj',1,1,3,'2015-05-14 13:53:56',NULL,'2015-05-14 13:53:56','2015-05-14 13:53:56',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(135,'yjyuju',NULL,1,3,'2015-05-14 13:54:19',NULL,'2015-05-14 13:54:19','2015-05-14 13:54:19',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(136,'jhgjghj',1,NULL,3,'2015-05-14 13:56:46',NULL,'2015-05-14 13:56:46','2015-05-14 13:56:46',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(137,'hjhgjghj',NULL,1,3,'2015-05-14 13:57:03',NULL,'2015-05-14 13:57:03','2015-05-14 13:57:03',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(138,'hello',NULL,1,3,'2015-05-15 04:54:59',NULL,'2015-05-15 04:54:59','2015-05-15 04:54:59',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(139,'hello',1,1,3,'2015-05-15 04:55:10',NULL,'2015-05-15 04:55:10','2015-05-15 04:55:10',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(140,'hello',1,NULL,3,'2015-05-15 04:55:34',NULL,'2015-05-15 04:55:34','2015-05-15 04:55:34',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(141,'hello',1,1,3,'2015-05-15 04:55:44',NULL,'2015-05-15 04:55:44','2015-05-15 04:55:44',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(142,'hello garry',1,NULL,3,'2015-05-15 05:16:45',NULL,'2015-05-15 05:16:45','2015-05-15 05:16:45',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(143,'hey gary',NULL,1,3,'2015-05-15 05:17:19',NULL,'2015-05-15 05:17:19','2015-05-15 05:17:19',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(144,'hey neddy',NULL,1,3,'2015-05-15 05:19:14',NULL,'2015-05-15 05:19:14','2015-05-15 05:19:14',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(145,'hello gary',1,1,3,'2015-05-15 05:19:39',NULL,'2015-05-15 05:19:39','2015-05-15 05:19:39',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(146,'hello gary',1,1,3,'2015-05-15 05:19:42',NULL,'2015-05-15 05:19:42','2015-05-15 05:19:42',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(147,'neddyyyy',1,1,3,'2015-05-15 05:24:04',NULL,'2015-05-15 05:24:04','2015-05-15 05:24:04',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(148,'helllo',NULL,1,3,'2015-05-15 05:24:24',NULL,'2015-05-15 05:24:24','2015-05-15 05:24:24',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(149,'heeelllo',NULL,1,3,'2015-05-15 05:27:01',NULL,'2015-05-15 05:27:01','2015-05-15 05:27:01',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(150,'hjghjghjghj',1,1,3,'2015-05-15 05:29:16',NULL,'2015-05-15 05:29:16','2015-05-15 05:29:16',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(151,'hjjghjghjghj',1,1,3,'2015-05-15 05:31:09',NULL,'2015-05-15 05:31:09','2015-05-15 05:31:09',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(152,'oioioi',1,1,3,'2015-05-15 05:32:27',NULL,'2015-05-15 05:32:27','2015-05-15 05:32:27',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(153,'yyyy',1,1,3,'2015-05-15 05:38:20',NULL,'2015-05-15 05:38:20','2015-05-15 05:38:20',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(154,'hjhjhjhj',1,1,3,'2015-05-15 05:48:59',NULL,'2015-05-15 05:48:59','2015-05-15 05:48:59',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(155,'fgdhghfgh',NULL,1,3,'2015-05-15 05:50:49',NULL,'2015-05-15 05:50:49','2015-05-15 05:50:49',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(156,'ghfghfgh',NULL,1,3,'2015-05-15 05:53:17',NULL,'2015-05-15 05:53:17','2015-05-15 05:53:17',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(157,'gdhfgh',NULL,1,3,'2015-05-15 05:55:51',NULL,'2015-05-15 05:55:51','2015-05-15 05:55:51',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(158,'fgfdg',NULL,1,3,'2015-05-15 06:01:31',NULL,'2015-05-15 06:01:31','2015-05-15 06:01:31',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(159,'fdghdh',1,1,3,'2015-05-15 06:02:18',NULL,'2015-05-15 06:02:18','2015-05-15 06:02:18',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(160,'ghfghfghfg',1,NULL,3,'2015-05-15 06:06:03',NULL,'2015-05-15 06:06:03','2015-05-15 06:06:03',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(161,'ghg',1,NULL,3,'2015-05-15 06:06:53',NULL,'2015-05-15 06:06:53','2015-05-15 06:06:53',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(162,'tytryty',1,NULL,3,'2015-05-15 06:08:47',NULL,'2015-05-15 06:08:47','2015-05-15 06:08:47',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(163,'ghghgh',1,1,3,'2015-05-15 06:09:25',NULL,'2015-05-15 06:09:25','2015-05-15 06:09:25',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(164,'hi',1,NULL,3,'2015-05-15 08:27:09',NULL,'2015-05-15 08:27:09','2015-05-15 08:27:09',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(165,'hi',1,1,3,'2015-05-15 08:27:22',NULL,'2015-05-15 08:27:22','2015-05-15 08:27:22',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(166,'hiiiii',1,1,3,'2015-05-15 08:51:36',NULL,'2015-05-15 08:51:36','2015-05-15 08:51:36',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(167,'        ',1,1,3,'2015-05-15 08:51:46',NULL,'2015-05-15 08:51:46','2015-05-15 08:51:46',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(168,'      ',1,1,3,'2015-05-15 08:52:13',NULL,'2015-05-15 08:52:13','2015-05-15 08:52:13',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(169,'hello',NULL,1,2,'2015-05-15 09:05:11',NULL,'2015-05-15 09:05:11','2015-05-15 09:05:11',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(170,'helllllo',1,1,3,'2015-05-15 09:20:07',NULL,'2015-05-15 09:20:07','2015-05-15 09:20:07',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(171,'hello',NULL,1,3,'2015-05-15 09:26:01',NULL,'2015-05-15 09:26:01','2015-05-15 09:26:01',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(172,'hi',NULL,1,3,'2015-05-15 09:44:45',NULL,'2015-05-15 09:44:45','2015-05-15 09:44:45',NULL,1,1,1,0,1,NULL,NULL,NULL,'Gary','Neddy'),(173,'hello',1,NULL,3,'2015-05-15 09:44:51',NULL,'2015-05-15 09:44:51','2015-05-15 09:44:51',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(174,'     ',1,1,2,'2015-05-15 11:00:15',NULL,'2015-05-15 11:00:15','2015-05-15 11:00:15',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(175,'       ',1,1,3,'2015-05-15 11:02:29',NULL,'2015-05-15 11:02:29','2015-05-15 11:02:29',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(176,'hello',NULL,1,3,'2015-05-15 13:09:08',NULL,'2015-05-15 13:09:08','2015-05-15 13:09:08',NULL,1,1,1,0,NULL,NULL,1,NULL,'Gary John','Neddy'),(177,'hhhhhh',1,NULL,3,'2015-05-16 10:21:33',NULL,'2015-05-16 10:21:33','2015-05-16 10:21:33',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Gary John',NULL),(178,'\n                                Patient Name\n\n                            ',NULL,1,2,'2015-05-18 12:02:15',NULL,'2015-05-18 12:02:15','2015-05-18 12:02:15',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(179,'<div class=\"name\">Me <span class=\"font12 black\"> on May 18 2015 17:32:15</span></div>',NULL,1,2,'2015-05-18 12:03:34',NULL,'2015-05-18 12:03:34','2015-05-18 12:03:34',NULL,1,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(180,'gh',1,NULL,2,'2015-05-18 12:31:46',NULL,'2015-05-18 12:31:46','2015-05-18 12:31:46',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Albert Thomas',NULL),(181,'hI',1,NULL,2,'2015-05-18 12:31:52',NULL,'2015-05-18 12:31:52','2015-05-18 12:31:52',1,1,NULL,1,0,NULL,1,NULL,'Kelin','Albert Thomas',NULL),(182,'hello',1,1,2,'2015-05-18 12:32:06',NULL,'2015-05-18 12:32:06','2015-05-18 12:32:06',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(183,'hello',1,NULL,2,'2015-05-18 12:32:38',NULL,'2015-05-18 12:32:38','2015-05-18 12:32:38',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Albert',NULL),(184,'helo',NULL,1,2,'2015-05-18 12:32:48',NULL,'2015-05-18 12:32:48','2015-05-18 12:32:48',NULL,1,1,1,0,1,NULL,NULL,NULL,'Albert','Neddy'),(185,'hi',1,1,2,'2015-05-18 12:33:09',NULL,'2015-05-18 12:33:09','2015-05-18 12:33:09',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(186,'hi',NULL,1,2,'2015-05-18 12:33:25',NULL,'2015-05-18 12:33:25','2015-05-18 12:33:25',NULL,0,1,1,0,NULL,NULL,1,NULL,'Albert Thomas','Neddy'),(187,'dsa',1,1,2,'2015-05-18 12:34:25',NULL,'2015-05-18 12:34:25','2015-05-18 12:34:25',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(188,'sd',1,NULL,2,'2015-05-18 12:34:31',NULL,'2015-05-18 12:34:31','2015-05-18 12:34:31',1,0,NULL,1,0,NULL,1,NULL,'Kelin','Albert Thomas',NULL),(189,'test..',1,NULL,3,'2015-05-19 07:38:18',NULL,'2015-05-19 07:38:18','2015-05-19 07:38:18',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary',NULL),(190,'ds',1,1,2,'2015-05-20 06:00:09',NULL,'2015-05-20 06:00:09','2015-05-20 06:00:09',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(191,'hello kelin',1,1,2,'2015-05-20 06:18:52',NULL,'2015-05-20 06:18:52','2015-05-20 06:18:52',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(192,'hello neddy',1,1,2,'2015-05-20 06:23:55',NULL,'2015-05-20 06:23:55','2015-05-20 06:23:55',1,NULL,1,1,0,NULL,1,NULL,'Kelin',NULL,'Neddy K'),(193,'hello',1,1,3,'2015-05-20 06:25:51',NULL,'2015-05-20 06:25:51','2015-05-20 06:25:51',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy'),(194,'hey kelin',1,1,2,'2015-05-20 06:36:47',NULL,'2015-05-20 06:36:47','2015-05-20 06:36:47',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy K'),(195,'s',1,NULL,3,'2015-05-21 11:22:19',NULL,'2015-05-21 11:22:19','2015-05-21 11:22:19',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary John',NULL),(196,'hello doctor',1,NULL,3,'2015-05-22 05:43:12',NULL,'2015-05-22 05:43:12','2015-05-22 05:43:12',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary John',NULL),(197,'how r u',1,NULL,3,'2015-05-22 05:43:16',NULL,'2015-05-22 05:43:16','2015-05-22 05:43:16',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary John',NULL),(198,'hi ',1,NULL,3,'2015-05-22 05:44:08',NULL,'2015-05-22 05:44:08','2015-05-22 05:44:08',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary John',NULL),(199,'hello',1,NULL,3,'2015-05-22 05:44:57',NULL,'2015-05-22 05:44:57','2015-05-22 05:44:57',1,1,NULL,1,0,NULL,1,NULL,'Kelin Puma','Gary John',NULL),(200,'Hi',1,1,3,'2015-06-17 10:44:52',NULL,'2015-06-17 10:44:52','2015-06-17 10:44:52',1,NULL,1,1,0,NULL,1,NULL,'Kelin Puma',NULL,'Neddy K'),(201,'How are you',1,1,3,'2015-06-17 10:44:59',NULL,'2015-06-17 10:44:59','2015-06-17 10:44:59',1,NULL,1,1,0,NULL,1,NULL,'Kelin Puma',NULL,'Neddy K'),(202,'okay',1,NULL,3,'2015-06-18 13:22:51',NULL,'2015-06-18 13:22:51','2015-06-18 13:22:51',1,1,NULL,1,0,1,NULL,NULL,'Kelin','Gary John',NULL),(203,'anny commented',11,NULL,16,'2015-06-23 10:35:48',NULL,'2015-06-23 10:35:48','2015-06-23 10:35:48',1,1,NULL,11,0,NULL,1,NULL,'Doctor Anny','Jezeerl Thomas',NULL),(204,'HI',11,NULL,16,'2015-06-24 06:41:34',NULL,'2015-06-24 06:41:34','2015-06-24 06:41:34',1,1,NULL,11,0,NULL,1,NULL,'Doctor Anny','Jezeerl Thomas',NULL),(205,'How r u jezeerl',12,NULL,16,'2015-06-24 06:47:54',NULL,'2015-06-24 06:47:54','2015-06-24 06:47:54',1,1,NULL,11,0,NULL,1,NULL,'Elle T','Jezeerl Thomas',NULL),(206,'How r u Roshni',12,8,16,'2015-06-24 06:48:37',NULL,'2015-06-24 06:48:37','2015-06-24 06:48:37',1,NULL,1,11,0,NULL,1,NULL,'Elle T',NULL,'Roshni Gupta'),(207,'hello kelin',1,1,3,'2015-06-24 08:47:37',NULL,'2015-06-24 08:47:37','2015-06-24 08:47:37',1,NULL,1,1,0,NULL,NULL,1,'Kelin Puma',NULL,'Neddy K'),(208,'fff',11,8,16,'2015-06-24 08:59:50',NULL,'2015-06-24 08:59:50','2015-06-24 08:59:50',1,NULL,1,11,0,NULL,NULL,1,'Doctor Anny',NULL,'Roshni Gupta'),(209,'hello roshni  he is fine now',11,8,16,'2015-06-29 12:51:46',NULL,'2015-06-29 12:51:46','2015-06-29 12:51:46',1,NULL,1,11,0,NULL,1,NULL,'Doctor Anny',NULL,'Roshni Gupta'),(210,'Sending a mesaing from doctor Anny to patient',11,8,16,'2015-06-30 23:07:49',NULL,'2015-06-30 23:07:49','2015-06-30 23:07:49',1,NULL,1,11,0,NULL,1,NULL,'Doctor Anny',NULL,'Roshni Gupta'),(211,'Senidng message to patient',11,NULL,16,'2015-06-30 23:23:25',NULL,'2015-06-30 23:23:25','2015-06-30 23:23:25',1,1,NULL,11,0,NULL,1,NULL,'Doctor Anny','Jezeerl Thomas',NULL),(212,'Anny sending message to paitent again',11,NULL,16,'2015-06-30 23:32:30',NULL,'2015-06-30 23:32:30','2015-06-30 23:32:30',1,1,NULL,11,0,NULL,1,NULL,'Doctor Anny','Jezeerl Thomas',NULL),(213,'Hi ',11,NULL,16,'2015-07-04 10:59:07',NULL,'2015-07-04 10:59:07','2015-07-04 10:59:07',1,1,NULL,11,0,1,NULL,NULL,'Doctor Anny','Jezeerl Thomas',NULL),(214,'Okay, got your message.',11,8,16,'2015-07-08 04:07:31',NULL,'2015-07-08 04:07:31','2015-07-08 04:07:31',1,NULL,1,11,0,NULL,NULL,1,'Doctor Anny',NULL,'Roshni Gupta'),(215,'Hello Jezeerl.  Doing okay?',11,NULL,16,'2015-07-08 04:17:10',NULL,'2015-07-08 04:17:10','2015-07-08 04:17:10',1,1,NULL,11,0,NULL,1,NULL,'Doctor Anny','Jezeerl Thomas',NULL),(216,'hello, yes',11,NULL,16,'2015-07-08 07:27:24',NULL,'2015-07-08 07:27:24','2015-07-08 07:27:24',1,1,NULL,11,0,NULL,1,NULL,'Doctor Anny','Jezeerl Thomas',NULL),(217,'Ok',11,8,16,'2015-07-08 07:27:37',NULL,'2015-07-08 07:27:37','2015-07-08 07:27:37',1,NULL,1,11,0,NULL,1,NULL,'Doctor Anny',NULL,'Roshni Gupta'),(218,'yes',11,8,16,'2015-07-08 07:28:18',NULL,'2015-07-08 07:28:18','2015-07-08 07:28:18',1,NULL,1,11,0,NULL,NULL,1,'Doctor Anny',NULL,'Roshni Gupta'),(219,'Hello',NULL,8,16,'2015-07-08 07:28:40',NULL,'2015-07-08 07:28:40','2015-07-08 07:28:40',NULL,1,1,11,0,NULL,NULL,1,NULL,'Jezeerl Thomas','Roshni Gupta'),(220,'Hello Doctor\\',11,NULL,17,'2015-07-10 10:23:09',NULL,'2015-07-10 10:23:09','2015-07-10 10:23:09',1,1,NULL,11,0,1,NULL,NULL,'Doctor Anny','John Kureshia',NULL),(221,'Hello Nurse',NULL,8,17,'2015-07-10 10:23:43',NULL,'2015-07-10 10:23:43','2015-07-10 10:23:43',NULL,1,1,11,0,1,NULL,NULL,NULL,'John Kureshia','Roshni Gupta'),(222,'You haven\'t been taking your readings daily.',NULL,8,17,'2015-07-15 00:06:29',NULL,'2015-07-15 00:06:29','2015-07-15 00:06:29',NULL,1,1,11,0,NULL,NULL,1,NULL,'John Kureshia','Roshni Gupta'),(223,'This patient is difficult to get compliance out of.',11,8,17,'2015-07-15 00:06:53',NULL,'2015-07-15 00:06:53','2015-07-15 00:06:53',1,NULL,1,11,0,NULL,NULL,1,'Doctor Anny',NULL,'Roshni Gupta'),(224,'Did you get that doc',11,8,17,'2015-07-17 10:30:16',NULL,'2015-07-17 10:30:16','2015-07-17 10:30:16',1,NULL,1,11,0,NULL,NULL,1,'Doctor Anny',NULL,'Roshni Gupta'),(225,'Hello John !! Everything is OK ?',11,NULL,17,'2015-07-17 10:44:50',NULL,'2015-07-17 10:44:50','2015-07-17 10:44:50',1,1,NULL,11,0,NULL,1,NULL,'Doctor Anny','John Kureshia',NULL),(226,'gjyhg',1,NULL,3,'2015-12-14 09:58:24',NULL,'2015-12-14 09:58:24','2015-12-14 09:58:24',1,0,NULL,1,0,NULL,1,NULL,'Kelin Puma','gary John',NULL),(227,'dfdf',1,NULL,3,'2015-12-14 09:58:31',NULL,'2015-12-14 09:58:31','2015-12-14 09:58:31',1,0,NULL,1,0,NULL,1,NULL,'Kelin Puma','gary John',NULL),(228,' cvcv',11,NULL,17,'2015-12-14 10:01:03',NULL,'2015-12-14 10:01:03','2015-12-14 10:01:03',0,1,NULL,11,0,1,NULL,NULL,'Doctor Anny','firstname Kureshia',NULL),(229,'hgfgg',NULL,8,17,'2015-12-14 10:02:01',NULL,'2015-12-14 10:02:01','2015-12-14 10:02:01',NULL,1,1,11,0,1,NULL,NULL,NULL,'firstname Kureshia','Roshni Gupta'),(230,'Test 003',11,8,17,'2016-02-04 06:22:41',NULL,'2016-02-04 06:22:41','2016-02-04 06:22:41',0,NULL,1,11,0,NULL,NULL,1,'Doctor Anny',NULL,'Roshni Gupta'),(231,'Test 004',11,8,17,'2016-02-04 06:24:24',NULL,'2016-02-04 06:24:24','2016-02-04 06:24:24',0,NULL,1,11,0,NULL,NULL,1,'Doctor Anny',NULL,'Roshni Gupta'),(232,'Test 005',11,NULL,17,'2016-02-04 06:30:58',NULL,'2016-02-04 06:30:58','2016-02-04 06:30:58',0,1,NULL,11,0,1,NULL,NULL,'Doctor Anny','firstname Kureshia',NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(55) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `date_of_birth` timestamp NULL DEFAULT NULL,
  `cellphone` varchar(100) DEFAULT NULL,
  `homephone` varchar(100) DEFAULT NULL,
  `homeaddress` varchar(255) DEFAULT NULL,
  `mailingAddress` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `hcg_identifier` varchar(100) DEFAULT NULL,
  `npi` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `startActivePeriod` timestamp NULL DEFAULT NULL,
  `endActivePeriod` timestamp NULL DEFAULT NULL,
  `reasonForLeaving` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `hcgID` int(11) NOT NULL,
  `image` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_nurse_hcgID_idx` (`hcgID`),
  CONSTRAINT `fk_nurse_hcgID` FOREIGN KEY (`hcgID`) REFERENCES `hcgorgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (1,'Neddy','','K','','male',NULL,'(232)-132-1323','','CHRIS NISWANDEE SMALLSYS INC','','neddy@ukitss.com','HCG-109','7236436245','2015-04-13 10:18:52','2015-11-27 09:51:03',NULL,NULL,NULL,0,0,1,'/Images/1448617861478.jpg'),(2,'Zaine','','vergis','Zain','female',NULL,'(987)-552-4112','(789)-456-1235','#12, Round circle','maige hose, Uganda','ashutosh.kumar@dreamsoft4u.com','HCG6531','8527419632','2015-05-02 12:58:14','2015-11-27 10:06:40',NULL,NULL,NULL,0,0,1,'/Images/1448618799206.jpg'),(3,'Isabel','','Hampton','Isabau','female',NULL,'(323)-555-5555','','1044 Herbert Ave','','bpreciado@live.com','HCG-12345','8383838383','2015-05-07 02:26:37','2015-11-27 10:07:09',NULL,NULL,NULL,0,0,1,'/Images/1448618827566.jpg'),(4,'Wasim','','','','male',NULL,'(324)-234-3244','','CHRIS NISWANDEE SMALLSYS INC','','wasim@ukitss.com','3244','4534534544','2015-05-11 08:49:29','2015-05-21 06:44:06',NULL,NULL,NULL,1,0,1,'../resources/images/demo.png'),(5,'Rasal','','','','male',NULL,'(124)-512-5632','','park road','','rasal@ukitss.com','HCG-890','154125623','2015-05-12 08:46:49','2015-05-15 10:57:24',NULL,NULL,NULL,0,0,5,'../resources/images/demo.png'),(6,'Elli','','','','female',NULL,'(152)-415-2652','','Street','','Elli@ukitss.com','HCG','1254152415','2015-05-15 10:19:10','2015-05-15 10:19:10',NULL,NULL,NULL,0,0,5,'http://www.infinity-stores.com:8081/RPMS/images/1431685144712.jpg'),(7,'Alisa','','John','','female',NULL,'(876)-327-6322','','Pass report','','alisa@ukitss.com','HCG-991','3283723666','2015-06-17 08:58:22','2015-11-27 10:07:40',NULL,NULL,NULL,0,0,1,'/Images/1448618858081.jpg'),(8,'Roshni','','Gupta','','female',NULL,'(234)-234-3433','','CHRIS NISWANDEE SMALLSYS INC','','roshni@ukitss.com','948999','2123232123','2015-06-23 06:35:15','2015-06-23 09:30:03',NULL,NULL,NULL,0,0,11,'../resources/images/demo.png'),(9,'deny','','Disolja','','male',NULL,'(234)-343-2433','','CHRIS NISWANDEE SMALLSYS INC','','dny@ukitss.com','12345','2342342344','2015-06-24 07:22:40','2015-06-24 07:22:40',NULL,NULL,NULL,0,0,11,'../resources/images/demo.png');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_history`
--

DROP TABLE IF EXISTS `nurse_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nurseID` int(11) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endtime` timestamp NULL DEFAULT NULL,
  `reason_of_leaving` text,
  `history_status` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nurseHistory_nurseID_idx` (`nurseID`),
  CONSTRAINT `fk_nurseHistory_nurseID` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_history`
--

LOCK TABLES `nurse_history` WRITE;
/*!40000 ALTER TABLE `nurse_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurse_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nursecomment`
--

DROP TABLE IF EXISTS `nursecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nursecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phyDataId` int(11) NOT NULL,
  `nurseId` int(11) DEFAULT NULL,
  `dcomment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dsfere_idx` (`phyDataId`),
  CONSTRAINT `dsfere` FOREIGN KEY (`phyDataId`) REFERENCES `patientphysiologicaldata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursecomment`
--

LOCK TABLES `nursecomment` WRITE;
/*!40000 ALTER TABLE `nursecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nursecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(55) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `sex` varchar(55) DEFAULT NULL,
  `date_of_birth` varchar(50) DEFAULT NULL,
  `weight` varchar(55) DEFAULT NULL,
  `height` varchar(55) DEFAULT NULL,
  `cellphone` varchar(100) DEFAULT NULL,
  `homephone` varchar(100) DEFAULT NULL,
  `homeaddress` varchar(255) DEFAULT NULL,
  `mailingAddress` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `startActivePeriod` timestamp NULL DEFAULT NULL,
  `endActivePeriod` timestamp NULL DEFAULT NULL,
  `reasonForLeaving` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `hcgID` int(11) NOT NULL,
  `docID` int(11) DEFAULT NULL,
  `nurseID` int(11) DEFAULT NULL,
  `ssn_number` varchar(100) DEFAULT NULL,
  `mr_number` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zipcode` varchar(100) DEFAULT NULL,
  `categories` varchar(45) DEFAULT NULL,
  `image` text,
  `bloodPresure` varchar(100) DEFAULT NULL,
  `bloodsugur` varchar(100) DEFAULT NULL,
  `bloodPresureMax` varchar(100) DEFAULT NULL,
  `bloodsugurMax` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `mr_number_UNIQUE` (`mr_number`),
  KEY `fk_patient_hcgID_idx` (`hcgID`),
  KEY `fk_patient_docID_idx` (`docID`),
  KEY `fk_nurse_nurseID_idx` (`nurseID`),
  CONSTRAINT `fk_nurse_nurseID` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_docID` FOREIGN KEY (`docID`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_hcgID` FOREIGN KEY (`hcgID`) REFERENCES `hcgorgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'=› -ô%ˆØ3lÀbØˆ','=Àže=\'´¦	|Øµ¨‘\r','ë3M+w†Á*(sÖã5–','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','NÄ«øºÈ™D‘¤Ô‚«C','c®žãƒ\nÀ+üq;µ6/À','³LÜã\"rˆêC îmš$','`ßŸÁw|@¤Us‰‚i','lÚÅ>¹}Dn…ÍÔ¢‡pP','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','¼5,ÁóËÓùp\ZÇô¹+L­Ç’x´¯C¢¿K/ù’','2015-04-13 09:05:21','2015-11-27 10:10:15',NULL,NULL,NULL,0,0,1,3,3,'yŸÜÀå¤/á¤=8ú€Tw','MR-1001','˜Lžmþ˜_T§Ëº#r¹§Ú','¹:ž1Ük’z”4þ<°Çxu','²ŒŸW]ÑŸni‚àÜ÷”ž','±ð€>\0¦‘†4•õÚ‚&ó½','ˆÒº¢â:“eéÆé|¶¢Y','/Images/1448619014259.jpg',NULL,NULL,NULL,NULL),(2,'‹+¼)„Sz	÷9²t˜¨v','=Àže=\'´¦	|Øµ¨‘\r','N¡¸ìÁÞþ6ÿÐñ€ü','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','*îäéú\nHÿ.š†w¢Þ','°	t‡¯®ú—aÚ{dH­','G@7ú´™û:…\rPò\r%','Ýÿƒ£ŠqÒ›ÿÉ$L­','¡)Ä\'Y8ßµ_B;—&)','ƒLú¿?éÚÕù†ÎÀÎÌHw ¼äï*?ÎÌ0G_¨´','„èMñqì«rsçÞ0*ŽÉ','aÜ—!–[<}õ]ÍÛæzV¼ýŠ‰ÆKHçR;`f¿D','2015-04-17 09:45:28','2015-07-04 12:22:00',NULL,NULL,NULL,1,0,1,NULL,1,'î§g>¤ÉœÒ\0{þ¹ù','MR-1002','æ½n?¦ÓÆUeoÍ›ªõ&÷','¹:ž1Ük’z”4þ<°Çxu','²ŒŸW]ÑŸni‚àÜ÷”ž','«<Õ#Ú2ØV¼S¥Í¬','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','http://www.infinity-stores.com:8081/RPMS/images/1430918998401.jpg','69.98','50.09','120.01','100.00'),(3,'{Þ7³ûÀÇÙ.l°äqÙ!','=Àže=\'´¦	|Øµ¨‘\r','YKP‚<öRõ,ÈZ\rúr','Ù3ß†’‰v †ž=T[<','R½ÌM£?€ÓŠ[ÔˆÁì','r¢äöñÙ\Zw\0Û¹m$','¼UT<Ðn‰˜Ä11tryy','˜2}™ýB)Š)CøÀ','Ìž„°o­Î×TC³3Lp','—ûÍ^yìëOõî§\0\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','Îó57‘H½ÝPÛ;›–3','2015-04-20 10:01:03','2015-11-27 09:53:03',NULL,NULL,NULL,0,0,1,1,1,'ÐLz©•~°ÞJíÈX½ç,','MR-1003','’òûÕKŽÕú^µD;\"±Ýu','¹:ž1Ük’z”4þ<°Çxu','²ŒŸW]ÑŸni‚àÜ÷”ž','=Ši¡\"ŠWâúÖ*5Ù3?','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','/Images/1448617951689.jpg',NULL,NULL,NULL,NULL),(4,'`Vëù°ðgŒ‹,N@²Ù]','=Àže=\'´¦	|Øµ¨‘\r','ÃL­__’ß…_¾Ãa1','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','¶]§&êÎž	h«ÌKeµ+','†Õv‹Ôy–NãÙôvíE.','G@7ú´™û:…\rPò\r%','­æùÝù\0µ‰Ý`Þw\0¯','=Àže=\'´¦	|Øµ¨‘\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','Óäú¹ESÚb[¦Ã³†Ÿ5=Àže=\'´¦	|Øµ¨‘\r','2015-04-29 12:47:52','2015-11-27 10:10:39',NULL,NULL,NULL,0,0,1,NULL,1,'=Àže=\'´¦	|Øµ¨‘\r','MR3003','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','/Images/1448619037689.jpg',NULL,NULL,NULL,NULL),(5,'É÷ñ5W<¿Ž09‹R¶Öä','=Àže=\'´¦	|Øµ¨‘\r','ß®¢d&%À±Ó#üñf[÷','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','ó9•™í¾sç›0ÍšAZ','S™ü¶ÝÑK-þ!þ¡#R¯','tr¼\n5˜xÐ«-sÂy>M','È%iW!”ë_ââ–¢mÊ','=Àže=\'´¦	|Øµ¨‘\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r',':¿Dì«¥]‰(ê»­R=Àže=\'´¦	|Øµ¨‘\r','2015-04-30 12:58:15','2015-05-02 12:21:29',NULL,NULL,NULL,0,0,1,NULL,1,'ôû¡1?ÔüË—Iü¸€…š','MR-1004','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','http://www.infinity-stores.com:8081/RPMS/images/1430569282252.jpg','69.98','50.09','120.01','100.00'),(6,'0KiÈÐ-H5K?0Zmâwc','=Àže=\'´¦	|Øµ¨‘\r','T\ZqÍgò­mþwÈöæ`®','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','Hq\r‹Öhseý HýŽB','´•‘²dû4;ÔM¿>\0·ž','\0ûvÔÃÙÝn ”ÊV‰äñ<','«²î¶Iÿ°÷ÒÇ»ê<÷ê','=Àže=\'´¦	|Øµ¨‘\r','ÊtýEù¾:T,Pé)Wáj=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','<Ð§ÉE»£´­Š&à’','2015-05-04 10:49:26','2015-11-27 09:53:36',NULL,NULL,NULL,0,0,1,NULL,1,'=Àže=\'´¦	|Øµ¨‘\r','MR-1010','5°ïøz•-5#5çéUEé','=Àže=\'´¦	|Øµ¨‘\r','²ŒŸW]ÑŸni‚àÜ÷”ž','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','/Images/1448618015200.jpg',NULL,NULL,NULL,NULL),(7,'(¨b!ü˜\ZekD*«—o','=Àže=\'´¦	|Øµ¨‘\r','\0·ãúp¿†ÜŒ20aŠ­í','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','W„·R\r¢Sûwÿ†~ù*',NULL,NULL,'¦ç²o))«Ýž\"­ØøV','=Àže=\'´¦	|Øµ¨‘\r','†è„rÎ™$U³Óê¾«†,=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','–è9A^R\"€•%(W','2015-05-04 11:07:06','2015-05-13 06:52:24',NULL,NULL,NULL,0,0,1,NULL,1,'=Àže=\'´¦	|Øµ¨‘\r','MR-1011','5°ïøz•-5#5çéUEé','=Àže=\'´¦	|Øµ¨‘\r','²ŒŸW]ÑŸni‚àÜ÷”ž','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(8,'¦ÑZC™ÈM?oA—¬h»—','=Àže=\'´¦	|Øµ¨‘\r','Ò‚ÛúÜþa-áãŠA³','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','lÿ%3^h..oÌ¨‹Å‹',NULL,NULL,'k°\'Ë}øÒY=Sÿ-7V','‡æZÑàÿc\ZJ–ðþój','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','c\ZvÄÖ²£PöÕnÅ0>¼ýŠ‰ÆKHçR;`f¿D','2015-05-04 11:17:19','2015-06-23 08:18:56',NULL,NULL,NULL,0,0,1,NULL,2,'°Ñ‘ÔÀRåJ¦P¼ð}÷Ð','MR-1101','’òûÕKŽÕú^µD;\"±Ýu','¹:ž1Ük’z”4þ<°Çxu','²ŒŸW]ÑŸni‚àÜ÷”ž','‡j’ØiA»–ç’¥','ºXjàÎÜäë3‰gÞN\Z','http://www.infinity-stores.com:8081/RPMS/images/1434632678869.jpg','69.98','50.09','120.01','100.00'),(9,'N¡¸ìÁÞþ6ÿÐñ€ü','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','…³šúA^w™¢|ÈÿÉdß',NULL,NULL,'œŽT¹Ý½¯‡†K2¦0FE','=Àže=\'´¦	|Øµ¨‘\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','î=!«¿pÑDâÊ8‘‰Y¼ýŠ‰ÆKHçR;`f¿D','2015-05-11 08:48:35','2015-05-11 13:21:09',NULL,NULL,NULL,0,0,1,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','3233','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(10,'ª¸‹E)5’=;O´àJÎ','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','ÂÑr]¸É}ï/±§0G=',NULL,NULL,'¸PŠ{e¯°¡ÉqâÉ\r','=Àže=\'´¦	|Øµ¨‘\r','»ÚÓBÍG¦à}ŸÌÈY´T<','=Àže=\'´¦	|Øµ¨‘\r','z3ªHý/\Z}tÉR^','2015-05-12 05:35:12','2015-06-18 12:51:38',NULL,NULL,NULL,0,0,1,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','#$#$#$#$','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','http://www.infinity-stores.com:8081/RPMS/images/1431408876881.jpg','69.98','50.09','120.01','100.00'),(11,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','-Š&]	]nÝ÷= 8',NULL,NULL,'ìêµ]Q!RPœçÎf]\0','=Àže=\'´¦	|Øµ¨‘\r','„èMñqì«rsçÞ0*ŽÉ','=Àže=\'´¦	|Øµ¨‘\r','–Œ\rÈ°žÍ ¯qÊ“ëã\\b','2015-05-12 07:28:27','2015-05-16 04:40:24',NULL,NULL,NULL,1,0,5,NULL,5,'=Àže=\'´¦	|Øµ¨‘\r','MR-12456','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(12,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ÅÜÒNÀôÈ×j“´ž>,','‡ä#5õ`³¡ŠÖ›',NULL,NULL,'úÀ@`ä3Ý0$ýã:ÖÏ‚','=Àže=\'´¦	|Øµ¨‘\r','ˆDf\Z¿WÚ1çñçF•\"','=Àže=\'´¦	|Øµ¨‘\r','ÉwOGUBÉ¨kïí·S>=Àže=\'´¦	|Øµ¨‘\r','2015-05-12 09:19:28','2015-06-18 11:47:58',NULL,NULL,NULL,0,0,5,5,6,'=Àže=\'´¦	|Øµ¨‘\r','MR-4512','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','http://10.0.1.55:8080/RPMS/','69.98','50.09','120.01','100.00'),(13,'šé	Ú{ájË\Z€)Â.YˆÝ','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','‚H0ÉÎ05ÀÿèW½ ',NULL,NULL,'‚í²·N$™9|\r Ù','=Àže=\'´¦	|Øµ¨‘\r','l•†êžÝ°ánò0','=Àže=\'´¦	|Øµ¨‘\r','«ÿ¯¶(ÓÃÂ²>	äÀ¼ýŠ‰ÆKHçR;`f¿D','2015-05-12 09:52:03','2015-05-12 10:34:46',NULL,NULL,NULL,0,0,1,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','MR-23432','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(14,'.Zu¡µFÐ1NÞ~h÷`3','=Àže=\'´¦	|Øµ¨‘\r','bI§À”Í÷Ófýy(úk6½','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','ÊÂ[¯Ò«Ü…p,¾R&™áª',NULL,NULL,'–1Ú¨¨è—m„ÿ|è','=Àže=\'´¦	|Øµ¨‘\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','ŽpªÎfX‹Ÿ²Gº','2015-05-18 10:29:53','2015-05-18 10:30:47',NULL,NULL,NULL,0,0,1,NULL,1,'=Àže=\'´¦	|Øµ¨‘\r','MR9008','æ½n?¦ÓÆUeoÍ›ªõ&÷','¹:ž1Ük’z”4þ<°Çxu','²ŒŸW]ÑŸni‚àÜ÷”ž','\ZmŽS‰ï=¡LŽÌžöHá','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(15,'<ì…È™›­Ýî’ä_ÃEò','=Àže=\'´¦	|Øµ¨‘\r','¾zã•5)ƒç7ve','Icø8_§¨˜hüÐdk-ÿŸ','R½ÌM£?€ÓŠ[ÔˆÁì','€õ±té’díš¬8!¡',NULL,NULL,'?a*%QÊýSbè>Ý','=Àže=\'´¦	|Øµ¨‘\r','æqYQyC‰§Cj ²=@M','=Àže=\'´¦	|Øµ¨‘\r','º÷]UÃfGŸ;ÉG¬Öt\0¼ýŠ‰ÆKHçR;`f¿D','2015-06-17 07:03:14','2015-06-17 07:03:14',NULL,NULL,NULL,0,0,1,1,1,'\\ñ z€Zj€Ë²´àö¾','MR-9999','’òûÕKŽÕú^µD;\"±Ýu','¹:ž1Ük’z”4þ<°Çxu','²ŒŸW]ÑŸni‚àÜ÷”ž','¦å˜`ß6Ò÷ÚiVÞA','Âó½ú*Á·²Ge‘|gŒP—§çªÉkR¾yY.rü','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(16,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','N¡¸ìÁÞþ6ÿÐñ€ü','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','šfá-OÉšÛ{¯?jÚ7',NULL,NULL,'7‚=©´£Å¢RrõÅ}','=Àže=\'´¦	|Øµ¨‘\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','\\T&}Ú3,]×xÄTDíÅ?ôŽØð‹žN\0œm™^ÚÐ','2015-06-23 06:33:25','2015-07-11 05:16:13',NULL,NULL,NULL,0,0,11,11,8,'™’Ê»Ò‡‘j}€Ÿ','1890','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','http://www.infinity-stores.com:8081/RPMS/images/1435051658560.jpg','69.98','50.09','120.01','100.00'),(17,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','«í|Šo¨¥ÚÙeÍMÍ','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','½HÓ­cÚNûÁ‰¨9',NULL,NULL,'øÏZ³%¶(ñ *†f®ôö','=Àže=\'´¦	|Øµ¨‘\r','?%ôW0:Ñ?ãš¥0Ç','=Àže=\'´¦	|Øµ¨‘\r','ÃNlµ~3:=Ýç©Ì_R5=Àže=\'´¦	|Øµ¨‘\r','2015-06-25 05:16:55','2015-07-22 11:14:45',NULL,NULL,NULL,0,0,11,11,8,'=Àže=\'´¦	|Øµ¨‘\r','1990','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ºXjàÎÜäë3‰gÞN\Z','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(23,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','áõíLp_®±öU¬!§(s',NULL,NULL,'$Æ:ˆ»`¤r‰âƒ°I','=Àže=\'´¦	|Øµ¨‘\r','ƒLú¿?éÚÕù†ÎÀÎÌHw ¼äï*?ÎÌ0G_¨´','=Àže=\'´¦	|Øµ¨‘\r','ƒ°ÏPÕN„ëÕó†9Å=Àže=\'´¦	|Øµ¨‘\r','2015-07-01 08:54:39','2015-07-11 12:28:24',NULL,NULL,NULL,0,0,11,11,8,'=Àže=\'´¦	|Øµ¨‘\r','2100','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','http://www.infinity-stores.com:8081/RPMS/images/1435740544651.jpg','69.98','50.09','120.01','100.00'),(24,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','øÁtº®8ý¤È‹Í‡¶',NULL,NULL,'Ðç¶ccùÏB&.d?š','=Àže=\'´¦	|Øµ¨‘\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','TùC¢ïŒÀj¯jM>','2015-07-01 10:30:59','2015-07-20 05:35:01',NULL,NULL,NULL,0,0,11,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','1991','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(25,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ÅÜÒNÀôÈ×j“´ž>,','h:üÜúÜ{šã:)WõJf',NULL,NULL,'Vhß¬^6ö7Üßë­æ¸|','=Àže=\'´¦	|Øµ¨‘\r','ßƒèáwå¿ž—acäz9‘Æ','=Àže=\'´¦	|Øµ¨‘\r','?x†”Fí4“}óy[mîÀýkïêÉÌÂŽ\0¼·C','2015-07-04 10:01:05','2015-07-04 10:01:05',NULL,NULL,NULL,0,0,2,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','212','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(26,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','D°ÚF­š	­&›|`¤{<1',NULL,NULL,'fÝÕÝRù/@éÃ°ÑYû','=Àže=\'´¦	|Øµ¨‘\r','ƒLú¿?éÚÕù†ÎÀÎÌHw ¼äï*?ÎÌ0G_¨´','=Àže=\'´¦	|Øµ¨‘\r','LnÔàÞõÀiÅ²wÐp¡=Àže=\'´¦	|Øµ¨‘\r','2015-07-22 09:44:17','2015-07-22 09:44:17',NULL,NULL,NULL,0,0,11,11,8,'=Àže=\'´¦	|Øµ¨‘\r','2300','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(27,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','h:üÜúÜ{šã:)WõJf',NULL,NULL,'°ª‚‹X£AœO®ÍkQ','=Àže=\'´¦	|Øµ¨‘\r','Ì™›qüàˆö	¿¦²˜Ê‘”ÖF,–´ÿî\\µÈ.½','=Àže=\'´¦	|Øµ¨‘\r','Ò\'£pD	¤§Q	T58pç=Àže=\'´¦	|Øµ¨‘\r','2015-07-22 10:53:36','2015-07-22 10:53:36',NULL,NULL,NULL,0,0,11,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','3001','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(28,'ü¼yp‚ä\"\\º°qUeö','Ï£0{NY§“€Ónûp&','÷ÓgNH—@3^&Ÿc®“j','ñéõ5Ê½oåÈ‰iò¬ý','R½ÌM£?€ÓŠ[ÔˆÁì','86hÄr²’h?OÝ[?',NULL,NULL,' ­ee»9b \nÅâI‹C','=Àže=\'´¦	|Øµ¨‘\r','ƒLú¿?éÚÕù†ÎÀÎÌHw ¼äï*?ÎÌ0G_¨´','=Àže=\'´¦	|Øµ¨‘\r','^¡)œÈrÛ:\0½Rq=Àže=\'´¦	|Øµ¨‘\r','2015-08-26 05:10:19','2015-08-26 05:10:19',NULL,NULL,NULL,0,0,11,11,8,'4LùSRý.K‘`àV}¸','MR-2300','½¯üqîé\rj\n=“Ï”Üi','ÈdùzŒ‘E¶õk”?uY‘Ì','²ŒŸW]ÑŸni‚àÜ÷”ž',' õŠ¬kÆ	ôÚM£ÆÜ®z','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(29,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','Ñd™oÃùGU\"­Ê',NULL,NULL,'­f%rkE75rCO&Õq5z','=Àže=\'´¦	|Øµ¨‘\r','\"O[U6OohZA\\r™Jw','=Àže=\'´¦	|Øµ¨‘\r','(àô“eÅ*F°Å¤v;º·\'ÃÓb\rXý_Í¨ƒ','2015-08-26 05:27:04','2015-08-26 05:27:04',NULL,NULL,NULL,0,0,11,11,NULL,'=Àže=\'´¦	|Øµ¨‘\r','MR-2222','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(30,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','Tºç¥†¨yÍW°aÇ©','=Àže=\'´¦	|Øµ¨‘\r','ÅÜÒNÀôÈ×j“´ž>,','ÏóVÕé•£éx]C_N^ð',NULL,NULL,'i2^à¯cáÙC½	ˆS+','=Àže=\'´¦	|Øµ¨‘\r','µÞÒÑÝ ÝÛÕ7ôÆ–{I','=Àže=\'´¦	|Øµ¨‘\r','‚^b™¿ñÁÇ›ÌgZßQÈk^7r	\nÖ4ªŒ','2015-08-27 12:44:20','2015-08-27 12:44:20',NULL,NULL,NULL,0,0,11,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','MR-3333','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00'),(31,'ü¼yp‚ä\"\\º°qUeö','=Àže=\'´¦	|Øµ¨‘\r','gÑ/Ø]»´My‚$eéëE','=Àže=\'´¦	|Øµ¨‘\r','R½ÌM£?€ÓŠ[ÔˆÁì','”ÎÍvúÜVQ¦¬_Z0',NULL,NULL,'=§ï1	×o9øa¹‰É','=Àže=\'´¦	|Øµ¨‘\r','”ø.Lƒ\'‡E?ãZ*zX“','=Àže=\'´¦	|Øµ¨‘\r','·Ú’\r\Z-ü|C„Ÿ¸;º·\'ÃÓb\rXý_Í¨ƒ','2015-09-03 09:58:33','2015-09-03 09:58:33',NULL,NULL,NULL,0,0,11,NULL,NULL,'=Àže=\'´¦	|Øµ¨‘\r','MR-5555','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','=Àže=\'´¦	|Øµ¨‘\r','ˆÒº¢â:“eéÆé|¶¢Y','../resources/images/demo.png','69.98','50.09','120.01','100.00');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientcomment`
--

DROP TABLE IF EXISTS `patientcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docid` int(11) DEFAULT NULL,
  `nurseid` int(11) DEFAULT NULL,
  `patientid` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `insertdate` datetime NOT NULL,
  `stauts` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientcomment`
--

LOCK TABLES `patientcomment` WRITE;
/*!40000 ALTER TABLE `patientcomment` DISABLE KEYS */;
INSERT INTO `patientcomment` VALUES (1,1,NULL,2,'fgdfsg fsdgdfg','2015-05-16 11:08:46',0),(2,1,NULL,2,'i am new in','2015-05-16 11:08:46',0),(3,NULL,1,2,'msg form nurse','2015-05-16 11:08:46',0),(4,NULL,1,2,'hello patient, from nurse','2015-05-16 11:08:46',0),(5,NULL,1,2,'patient is very serous, nurse','2015-05-16 11:08:46',0),(6,1,NULL,2,'I dont think so, patient is normal, doctor','2015-05-16 11:08:46',0),(7,NULL,1,2,'I think you not understand doc, nurse','2015-05-16 11:08:46',0),(8,NULL,1,2,'let me call senoir, nurse','2015-05-16 11:08:46',0),(9,1,NULL,2,'let me check his status, doctor','2015-05-16 11:08:46',0),(12,1,NULL,2,'ok, i checked, i think you are right, doc','2015-05-16 11:08:46',0),(13,NULL,1,2,'then what to do, nurse','2015-05-16 11:08:46',0),(14,1,NULL,2,'i am comming.doc','2015-05-16 11:08:46',0),(15,1,NULL,2,'jhghghj','2015-05-16 16:24:11',0),(16,1,NULL,2,'hello','2015-05-16 16:52:56',0),(17,NULL,1,2,'hgfhdfdsfgds','2015-05-16 18:06:14',0),(18,1,NULL,2,'fgujghjhg','2015-05-16 18:08:20',0),(19,NULL,1,2,'hello','2015-05-16 18:09:01',0),(20,1,NULL,14,'hello Rony,\n\nyour reading is normal','2015-05-18 16:05:30',0),(21,NULL,1,14,'Okay its good','2015-05-18 16:06:21',0),(22,1,NULL,14,'ds','2015-05-18 18:24:01',0),(23,1,NULL,14,'gh','2015-05-20 11:08:19',0),(24,1,NULL,14,'gfh','2015-05-20 11:08:20',0),(25,1,NULL,14,'gfh','2015-05-20 11:08:22',0),(26,1,NULL,14,'ghfg','2015-05-20 11:08:24',0),(27,1,NULL,14,'gfh','2015-05-20 11:08:25',0),(28,1,NULL,14,'gfh','2015-05-20 11:08:27',0),(29,1,NULL,14,'fgh','2015-05-20 11:08:28',0),(30,1,NULL,14,'gfh','2015-05-20 11:08:30',0),(31,1,NULL,14,'gfh','2015-05-20 11:08:32',0),(32,1,NULL,14,'5','2015-05-20 11:08:34',0),(33,1,NULL,14,'y','2015-05-20 11:08:36',0),(34,1,NULL,14,'y','2015-05-20 11:08:38',0),(35,1,NULL,14,'d','2015-05-20 11:08:40',0),(36,1,NULL,14,'y','2015-05-20 11:08:44',0),(37,1,NULL,14,'y','2015-05-20 11:08:46',0),(38,1,NULL,14,'e','2015-05-20 11:08:48',0),(39,1,NULL,14,'5','2015-05-20 11:08:50',0),(40,1,NULL,14,'7','2015-05-20 11:08:52',0),(41,1,NULL,14,'yy','2015-05-20 11:08:56',0),(42,1,NULL,14,'ty','2015-05-20 11:08:58',0),(43,1,NULL,14,'yt','2015-05-20 11:09:00',0),(44,1,NULL,3,'helo','2015-06-01 17:26:57',0),(45,1,NULL,3,'h','2015-06-01 17:27:14',0),(46,1,NULL,3,'h','2015-06-01 17:27:15',0),(47,1,NULL,3,'h','2015-06-01 17:27:19',0),(48,1,NULL,3,'h','2015-06-01 17:27:26',0),(49,1,NULL,3,'h','2015-06-01 17:27:30',0),(50,1,NULL,3,'h','2015-06-01 17:27:32',0),(51,1,NULL,3,'h','2015-06-01 17:27:35',0),(52,1,NULL,3,'h','2015-06-01 17:27:38',0),(53,1,NULL,3,'h','2015-06-01 17:27:41',0),(54,1,NULL,3,'h','2015-06-01 17:27:45',0),(55,1,NULL,3,'h','2015-06-01 17:27:52',0),(56,1,NULL,3,'h','2015-06-01 17:27:54',0),(57,1,NULL,3,'h','2015-06-01 17:27:55',0),(58,1,NULL,3,'h','2015-06-01 17:27:56',0),(59,NULL,1,3,'hello Doctor\n','2015-06-06 18:23:26',0),(60,NULL,1,3,'Patient is in Normal state','2015-06-06 18:23:35',0),(61,1,NULL,3,'Okay that good','2015-06-06 18:23:54',0),(62,1,NULL,3,'Hello Nurse.Whatis the status of Gary','2015-06-06 18:26:41',0),(63,NULL,1,3,'Gary is fine','2015-06-06 18:27:03',0),(64,1,NULL,3,'Hello Doctor','2015-06-17 17:10:14',0),(65,NULL,8,16,'hello anny its fine now','2015-06-23 17:38:33',0),(66,11,NULL,16,'ok all right and take care of this.','2015-06-23 17:39:16',0),(67,NULL,8,16,'hi Anny he is fine now','2015-07-03 16:47:08',0),(68,11,NULL,16,'ok let me check first...','2015-07-03 16:47:54',0),(69,12,NULL,16,'yes i read all the comments.....','2015-07-04 12:56:40',0),(70,NULL,8,16,'Is this patient really okay?','2015-07-08 09:43:22',0),(71,11,NULL,16,'I need to make a call.','2015-07-08 09:56:37',0),(72,11,NULL,16,'Hello\n','2015-07-09 12:26:41',0),(73,11,NULL,16,'hi','2015-07-09 12:30:07',0);
/*!40000 ALTER TABLE `patientcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientphysiologicaldata`
--

DROP TABLE IF EXISTS `patientphysiologicaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientphysiologicaldata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientMRid` varchar(100) NOT NULL,
  `readingFor` int(11) DEFAULT NULL,
  `sugervalue` int(11) DEFAULT NULL,
  `pressuresystolic` int(11) DEFAULT NULL,
  `pressurediastolic` int(11) DEFAULT NULL,
  `rdata` varchar(100) DEFAULT NULL,
  `measurementtype` varchar(100) DEFAULT NULL,
  `units` varchar(100) DEFAULT NULL,
  `devicetype` varchar(100) DEFAULT NULL,
  `devicebrandmodel` varchar(100) DEFAULT NULL,
  `devicenetworkaddress` varchar(100) DEFAULT NULL,
  `deviceID` varchar(100) DEFAULT NULL,
  `deviceTime` varchar(100) DEFAULT NULL,
  `ReceivedDateTime` varchar(100) DEFAULT NULL,
  `fstate` varchar(50) DEFAULT NULL,
  `reviewerType` varchar(50) DEFAULT NULL,
  `docId` int(11) DEFAULT NULL,
  `nurseId` int(11) DEFAULT NULL,
  `isDeleted` tinyint(4) DEFAULT '0',
  `glucoseMax` varchar(100) DEFAULT NULL,
  `glucoseMin` varchar(100) DEFAULT NULL,
  `bloodPressureMax` varchar(100) DEFAULT NULL,
  `bloodPressureMin` varchar(100) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1522 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientphysiologicaldata`
--

LOCK TABLES `patientphysiologicaldata` WRITE;
/*!40000 ALTER TABLE `patientphysiologicaldata` DISABLE KEYS */;
INSERT INTO `patientphysiologicaldata` VALUES (831,'MR-1003',1,NULL,68,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 01:37:54','2015-04-20 16:32:19','High',' ',1,1,0,NULL,NULL,'60.00','0.00',NULL),(832,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-02 04:03:19','2015-04-20 16:32:19','High',' ',NULL,NULL,1,'0.00','0.00',NULL,NULL,NULL),(837,'MR-1003',1,NULL,68,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 02:07:54','2015-04-20 16:32:19','High',' ',NULL,NULL,1,NULL,NULL,'60.00','0.00',NULL),(838,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-02 08:03:19','2015-04-20 16:32:19','High',' ',NULL,NULL,1,'0.00','0.00',NULL,NULL,NULL),(841,'MR-1003',1,NULL,68,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 02:37:54','2015-04-20 16:32:19','High',' ',1,1,0,NULL,NULL,'60.00','0.00',NULL),(842,'MR-1003',1,NULL,38,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 03:07:54','2015-04-21 11:05:17','Normal',' ',1,1,0,NULL,NULL,'60.00','0.00',NULL),(843,'MR-1003',1,NULL,68,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 03:37:54','2015-04-21 11:09:28','High',' ',NULL,NULL,1,NULL,NULL,'60.00','0.00',NULL),(844,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-02 12:03:19','2015-04-20 16:32:19','High',' ',NULL,NULL,1,'0.00','0.00',NULL,NULL,NULL),(845,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-02 16:03:19','2015-04-21 11:05:17','Low',' ',1,1,1,'0.00','0.00',NULL,NULL,NULL),(846,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-02 20:03:19','2015-04-21 11:09:28','Low',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(847,'MR-1003',1,NULL,60,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 04:07:54','2015-04-21 11:54:40','High',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(848,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-03 00:03:19','2015-04-21 11:54:40','Low',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(851,'MR-1003',1,NULL,38,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 04:37:54','2015-04-21 11:54:40','High',' ',1,1,1,NULL,NULL,'51.98','0.00',NULL),(852,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-03 04:03:19','2015-04-21 11:54:40','Low',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(853,'MR-100',1,NULL,22,77,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 03:02:36','2015-04-21 03:02:36','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(854,'MR-100',2,33,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 03:02:36','2015-04-21 03:02:36','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(855,'MR-100',1,NULL,89,22,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 03:19:52','2015-04-21 03:19:52','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(856,'MR-100',2,65,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 03:19:52','2015-04-21 03:19:52','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(857,'MR-1003',1,NULL,60,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 05:07:54','2015-04-21 11:54:40','High',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(858,'MR-1003',1,NULL,23,8,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 05:37:54','2015-04-21 13:10:54','Normal',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(859,'MR-1003',2,0,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-03 08:03:19','2015-04-21 11:54:40','Low',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(860,'MR-1003',2,0,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-03 12:03:19','2015-04-21 13:10:54','Normal',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(861,'MR-1003',1,NULL,60,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 06:07:54','2015-04-21 11:54:40','High',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(862,'MR-1003',1,NULL,23,8,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 06:37:54','2015-04-21 13:10:54','Normal',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(863,'MR-1003',2,0,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-03 16:03:19','2015-04-21 11:54:40','Low',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(864,'MR-1003',2,0,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-03 20:03:19','2015-04-21 13:10:54','Normal',' ',1,1,1,'0.00','0.00',NULL,NULL,NULL),(865,'MR-1003',1,NULL,60,0,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 07:07:54','2015-04-21 11:54:40','High',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(866,'MR-1003',1,NULL,23,8,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 07:37:54','2015-04-21 13:10:54','Normal',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(867,'MR-1011',2,0,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-04 00:03:19','2015-04-21 11:54:40','Low',' ',NULL,NULL,1,'0.00','0.00',NULL,NULL,NULL),(868,'MR-1011',2,0,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-04 04:03:19','2015-04-21 13:10:54','Normal',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(869,'MR-1011',1,NULL,0,0,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'36.98','0.00',NULL),(870,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(871,'MR-100',1,NULL,45,21,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(872,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(873,'MR-100',1,NULL,30,21,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(874,'MR-100',1,NULL,99,11,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:28:06','2015-04-21 04:28:06','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(875,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(876,'MR-100',2,33,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:28:06','2015-04-21 04:28:06','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(877,'MR-100',1,NULL,56,21,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(878,'MR-100',1,NULL,99,11,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:28:06','2015-04-21 04:28:06','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(879,'MR-100',1,NULL,51,61,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(880,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(881,'MR-100',2,33,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:28:06','2015-04-21 04:28:06','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(882,'MR-100',2,41,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(883,'MR-100',1,NULL,20,21,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(884,'MR-100',1,NULL,99,11,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:28:06','2015-04-21 04:28:06','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(885,'MR-100',1,NULL,80,61,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(886,'MR-100',1,NULL,95,75,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(887,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(888,'MR-100',2,33,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:28:06','2015-04-21 04:28:06','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(889,'MR-100',2,41,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(890,'MR-100',2,25,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(891,'MR-100',1,NULL,55,21,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(892,'MR-100',1,NULL,99,11,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:28:06','2015-04-21 04:28:06','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(893,'MR-100',1,NULL,80,61,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(894,'MR-100',1,NULL,95,75,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(895,'MR-100',1,NULL,160,150,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:24:48','2015-04-21 05:24:48','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(896,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(897,'MR-100',2,33,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:28:06','2015-04-21 04:28:06','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(898,'MR-100',2,41,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(899,'MR-100',2,25,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(900,'MR-100',2,25,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:24:48','2015-04-21 05:24:48','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(901,'MR-100',1,NULL,35,21,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(902,'MR-100',1,NULL,99,11,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:28:06','2015-04-21 04:28:06','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(903,'MR-100',1,NULL,80,61,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(904,'MR-100',1,NULL,95,75,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(905,'MR-100',1,NULL,160,150,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:24:48','2015-04-21 05:24:48','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(906,'MR-100',1,NULL,190,180,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:35:10','2015-04-21 05:35:10','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(907,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(908,'MR-100',2,33,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:28:06','2015-04-21 04:28:06','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(909,'MR-100',2,41,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(910,'MR-100',2,25,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(911,'MR-100',2,25,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:24:48','2015-04-21 05:24:48','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(912,'MR-100',2,60,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:35:10','2015-04-21 05:35:10','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(913,'MR-100',1,NULL,35,21,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(914,'MR-100',1,NULL,99,11,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:28:06','2015-04-21 04:28:06','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(915,'MR-100',1,NULL,69,61,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(916,'MR-100',1,NULL,95,75,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(917,'MR-100',1,NULL,165,150,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:24:48','2015-04-21 05:24:48','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(918,'MR-100',1,NULL,195,180,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:35:10','2015-04-21 05:35:10','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(919,'MR-100',1,NULL,100,90,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 05:39:21','2015-04-21 05:39:21','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(920,'MR-100',2,19,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:10:57','2015-04-21 04:10:57','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(921,'MR-100',2,33,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:28:06','2015-04-21 04:28:06','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(922,'MR-100',2,41,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 04:47:50','2015-04-21 04:47:50','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(923,'MR-100',2,25,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:19:26','2015-04-21 05:19:26','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(924,'MR-100',2,25,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:24:48','2015-04-21 05:24:48','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(925,'MR-100',2,60,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:35:10','2015-04-21 05:35:10','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(926,'MR-100',2,30,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 05:39:21','2015-04-21 05:39:21','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(941,'MR-100',1,NULL,88,44,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-04-21 06:49:40','2015-04-21 06:49:40','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(942,'MR-100',2,66,NULL,NULL,' ','blood sugar','mg/dL','generic','Unknown sdk','0.0.0.0','','2015-04-21 06:49:40','2015-04-21 06:49:40','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(943,'MR-100',1,NULL,99,88,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-22 18:37:13','2015-04-22 18:37:13','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(944,'MR-100',2,12,NULL,NULL,' ','blood sugar','mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-22 18:37:13','2015-04-22 18:37:13','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(945,'MR-100',1,NULL,40,33,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-22 18:38:28','2015-04-22 18:38:28','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(946,'MR-100',1,NULL,88,44,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-22 18:40:48','2015-04-22 18:40:48','Normal',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(947,'MR-100',1,NULL,85,66,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-22 18:44:02','2015-04-22 18:44:02','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(948,'MR-100',2,77,NULL,NULL,' ','blood sugar','mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-22 18:38:28','2015-04-22 18:38:28','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(949,'MR-100',2,55,NULL,NULL,' ','blood sugar','mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-22 18:40:48','2015-04-22 18:40:48','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(950,'MR-100',2,11,NULL,NULL,' ','blood sugar','mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-22 18:44:02','2015-04-22 18:44:02','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(951,'MR-100',1,NULL,110,88,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-22 18:47:51','2015-04-22 18:47:51','Low',' ',NULL,NULL,0,NULL,NULL,'120','80',NULL),(952,'MR-100',2,22,NULL,NULL,' ','blood sugar','mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-22 18:47:51','2015-04-22 18:47:51','Low',' ',NULL,NULL,0,'110','82',NULL,NULL,NULL),(953,'MR-1003',1,NULL,30,8,' ','blood pressure','kPa','generic','Unknown sdk','0.0.0.0',' ','2015-05-05 08:07:54','2015-04-27 07:06:40','Low',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(954,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mmol/L','generic','Unknown sdk','0.0.0.0','','2015-05-04 08:03:19','2015-04-27 07:06:40','Low',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(955,'MR-1003',1,NULL,15,8,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 08:37:54','2015-04-27 17:42:23','Low',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(956,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-04 12:03:19','2015-04-27 17:42:23','High',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(957,'MR-1003',1,NULL,15,8,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 09:07:54','2015-04-27 17:52:36','Low',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(958,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-04 16:03:19','2015-04-27 17:52:36','Low',' ',NULL,NULL,1,'0.00','0.00',NULL,NULL,NULL),(969,'MR-1003',1,NULL,90,15,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 09:37:54','2015-04-27 18:55:45','High',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(970,'MR-1003',2,216,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-04 20:03:19','2015-04-27 18:55:45','High',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(975,'MR-1003',1,NULL,30,23,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 10:07:54','2015-04-27 19:03:58','Low',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(976,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-05 00:03:19','2015-04-27 19:03:58','High',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(977,'MR-1003',1,NULL,75,0,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 10:37:54','2015-05-04 10:20:41','High',' ',1,1,0,NULL,NULL,'51.98','0.00',NULL),(978,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-05 04:03:19','2015-05-04 10:20:41','High',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(979,'MR-1003',1,NULL,60,0,' ','blood pressure',NULL,'ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-05 11:18:02','2015-05-05 11:18:02','High',' ',1,1,0,NULL,NULL,'21.98','0.00',NULL),(980,'MR-1003',2,0,NULL,NULL,' ','blood sugar',NULL,'ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-05 08:03:19','2015-05-05 11:18:02','High',' ',NULL,NULL,1,'0.00','0.00',NULL,NULL,NULL),(981,'MR3003',1,NULL,60,0,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-05-11 18:14:54','2015-05-11 18:14:54','Normal',' ',NULL,1,0,NULL,NULL,'66.98','0.00',NULL),(982,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-05-11 18:14:54','2015-05-11 18:14:54','Low',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(983,'MR-1003',1,NULL,68,0,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-05-11 18:22:43','2015-05-11 18:22:43','High',' ',1,NULL,0,NULL,NULL,'21.98','0.00',NULL),(984,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-05-11 18:22:43','2015-05-11 18:22:43','High',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(985,'MR3003',1,NULL,38,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-11 18:20:06','2015-05-11 18:20:06','Normal',' ',NULL,1,0,NULL,NULL,'66.98','0.00',NULL),(986,'MR3003',1,NULL,60,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-11 18:28:01','2015-05-11 18:28:01','Normal',' ',NULL,1,0,NULL,NULL,'66.98','0.00',NULL),(987,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-11 18:20:06','2015-05-11 18:20:06','Low',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(988,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-11 18:28:01','2015-05-11 18:28:01','Low',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(989,'MR-1003',1,NULL,60,0,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-05-11 18:28:53','2015-05-11 18:28:53','High',' ',NULL,1,1,NULL,NULL,'21.98','0.00',NULL),(990,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-05-11 18:28:53','2015-05-11 18:28:53','Low',' ',1,1,0,'0.00','0.00',NULL,NULL,NULL),(991,'MR3003',1,NULL,68,8,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-11 18:33:07','2015-05-11 18:33:07','High',' ',NULL,1,0,NULL,NULL,'21.98','0.00',NULL),(992,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-11 18:33:07','2015-05-11 18:33:07','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(993,'MR-1002',1,NULL,68,8,NULL,'blood pressure','mmHg','A120','Samsung GT-I9500','10.0.2.15',NULL,'2015-05-14 18:22:43','2015-05-14 18:22:43','High',NULL,1,1,0,NULL,NULL,'60.00','0.00',NULL),(994,'MR-1002',2,0,NULL,NULL,NULL,'blood sugar','Mg/dL','A120','Samsung GT-I9500','10.0.2.15',NULL,'2015-05-14 18:22:43','2015-05-14 18:22:43','Low',NULL,1,1,1,'0.00','0.00',NULL,NULL,NULL),(995,'MR-1002',1,NULL,38,8,NULL,'blood pressure','mmHg','A120','Samsung GT-I9500','10.0.2.15',NULL,'2015-05-14 21:10:43','2015-05-14 21:10:43','Normal',NULL,1,1,1,NULL,NULL,'60.00','0.00',''),(996,'MR-1002',2,0,NULL,NULL,NULL,'blood sugar','Mg/dL','A120','Samsung GT-I9500','10.0.2.15',NULL,'2015-05-14 21:10:43','2015-05-14 21:10:43','Normal',NULL,1,1,1,'0.00','0.00',NULL,NULL,NULL),(997,'MR-1002',1,NULL,53,0,NULL,'blood pressure','mmHg','A120','Samsung GT-I9500','10.0.2.15',NULL,'2015-05-14 01:10:43','2015-05-14 21:10:43','Normal',NULL,1,NULL,1,NULL,NULL,'60.00','0.00',''),(998,'MR-1002',2,0,NULL,NULL,NULL,'blood sugar','Mg/dL','A120','Samsung GT-I9500','10.0.2.15',NULL,'2015-05-14 01:10:43','2015-05-14 01:10:43','Normal',NULL,1,1,1,'0.00','0.00',NULL,NULL,NULL),(999,'MR-1001',1,NULL,60,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-21 16:03:48','2015-05-21 16:03:48','High',' ',NULL,NULL,0,NULL,NULL,'21.98','0.00',NULL),(1000,'MR-1001',1,NULL,83,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-21 16:04:10','2015-05-21 16:04:10','High',' ',NULL,NULL,0,NULL,NULL,'21.98','0.00',NULL),(1001,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-21 16:03:48','2015-05-21 16:03:48','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1002,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-21 16:04:10','2015-05-21 16:04:10','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1003,'MR-1001',1,NULL,83,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-21 16:36:20','2015-05-21 16:36:20','High',' ',NULL,NULL,0,NULL,NULL,'21.98','0.00',NULL),(1004,'MR-1001',1,NULL,68,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-21 16:36:38','2015-05-21 16:36:38','High',' ',NULL,NULL,0,NULL,NULL,'21.98','0.00',NULL),(1005,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-21 16:36:20','2015-05-21 16:36:20','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1006,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-21 16:36:38','2015-05-21 16:36:38','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1007,'MR-1001',1,NULL,45,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-21 18:09:07','2015-05-21 18:09:07','High',' ',NULL,NULL,0,NULL,NULL,'21.98','0.00',NULL),(1008,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-21 18:09:07','2015-05-21 18:09:07','Low',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1009,'MR-1001',1,NULL,83,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-22 10:32:45','2015-05-22 10:32:45','High',' ',NULL,NULL,0,NULL,NULL,'21.98','0.00',NULL),(1010,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-22 10:32:45','2015-05-22 10:32:45','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1011,'MR-1001',1,NULL,75,8,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-22 11:17:29','2015-05-22 11:17:29','High',' ',NULL,NULL,0,NULL,NULL,'21.98','0.00',NULL),(1012,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-22 11:17:29','2015-05-22 11:17:29','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1013,'MR-1001',1,NULL,83,8,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-18 19:15:22','2015-06-18 19:15:22','High',' ',NULL,NULL,0,NULL,NULL,'0.00','21.98',NULL),(1014,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-18 19:15:22','2015-06-18 19:15:22','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1015,'MR-1001',1,NULL,38,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-19 10:23:56','2015-06-19 10:23:56','High',' ',NULL,NULL,0,NULL,NULL,'0.00','21.98',NULL),(1016,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-19 10:23:56','2015-06-19 10:23:56','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1017,'MR-1001',1,NULL,45,8,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-19 10:45:17','2015-06-19 10:45:17','High',' ',NULL,NULL,0,NULL,NULL,'0.00','21.98',NULL),(1018,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-19 10:45:17','2015-06-19 10:45:17','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1019,'MR-1003',1,NULL,45,8,' ','blood pressure',NULL,'generic','Unknown sdk','0.0.0.0',' ','2015-06-19 01:22:18','2015-06-19 01:22:18','High',' ',NULL,NULL,0,NULL,NULL,'0.00','0.00',NULL),(1020,'MR-1003',2,0,NULL,NULL,' ','blood sugar',NULL,'generic','Unknown sdk','0.0.0.0','','2015-06-19 01:22:18','2015-06-19 01:22:18','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1021,'MR-1003',1,NULL,45,0,' ','blood pressure',NULL,'generic','Unknown sdk','0.0.0.0',' ','2015-06-19 01:24:37','2015-06-19 01:24:37','High',' ',NULL,NULL,0,NULL,NULL,'0.00','0.00',NULL),(1022,'MR-1003',2,0,NULL,NULL,' ','blood sugar',NULL,'generic','Unknown sdk','0.0.0.0','','2015-06-19 01:24:37','2015-06-19 01:24:37','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1031,'MR-1003',1,NULL,23,0,' ','blood pressure',NULL,'generic','Unknown sdk','0.0.0.0',' ','2015-06-19 04:43:51','2015-06-19 04:43:51','High',' ',1,NULL,0,NULL,NULL,'0.00','0.00',NULL),(1032,'MR-1003',1,NULL,53,8,' ','blood pressure',NULL,'generic','Unknown sdk','0.0.0.0',' ','2015-06-19 05:03:47','2015-06-19 05:03:47','High',' ',1,NULL,1,NULL,NULL,'0.00','0.00',NULL),(1033,'MR-1003',2,0,NULL,NULL,' ','blood sugar',NULL,'generic','Unknown sdk','0.0.0.0','','2015-06-19 04:43:51','2015-06-19 04:43:51','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1034,'MR-1003',2,0,NULL,NULL,' ','blood sugar',NULL,'generic','Unknown sdk','0.0.0.0','','2015-06-19 05:03:47','2015-06-19 05:03:47','High',' ',1,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1035,'MR-1003',1,NULL,45,8,' ','blood pressure',NULL,'ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-19 02:25:35','2015-06-19 02:25:35','High',' ',1,NULL,1,NULL,NULL,'0.00','0.00',NULL),(1036,'MR-1003',2,0,NULL,NULL,' ','blood sugar',NULL,'ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-19 02:25:35','2015-06-19 02:25:35','High',' ',1,NULL,1,'0.00','0.00',NULL,NULL,NULL),(1037,'MR-1001',1,NULL,23,8,' ','blood pressure',NULL,'generic','Unknown sdk','0.0.0.0',' ','2015-06-19 06:10:48','2015-06-19 06:10:48','High',' ',NULL,NULL,0,NULL,NULL,'0.00','0.00',NULL),(1038,'MR-1001',2,0,NULL,NULL,' ','blood sugar',NULL,'generic','Unknown sdk','0.0.0.0','','2015-06-19 06:10:48','2015-06-19 06:10:48','High',' ',1,NULL,1,'0.00','0.00',NULL,NULL,NULL),(1039,'MR-1003',1,NULL,45,8,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-19 07:06:23','2015-06-19 07:06:23','Normal',' ',1,NULL,0,NULL,NULL,'667.03','36.98',NULL),(1040,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-19 07:06:23','2015-06-19 07:06:23','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1122,'MR-1003',1,NULL,23,0,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-19 07:27:34','2015-06-19 07:27:34','Low',' ',NULL,NULL,0,NULL,NULL,'0.00','60.00',NULL),(1123,'MR-1003',1,NULL,68,8,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-19 07:50:02','2015-06-19 07:50:02','High',' ',NULL,NULL,0,NULL,NULL,'0.00','60.00',NULL),(1124,'MR-1003',1,NULL,68,23,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-19 08:09:32','2015-06-19 08:09:32','High',' ',NULL,NULL,0,NULL,NULL,'0.00','60.00',NULL),(1125,'MR-1003',1,NULL,45,23,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-19 08:24:51','2015-06-19 08:24:51','Low',' ',NULL,NULL,1,NULL,NULL,'0.00','60.00',NULL),(1126,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-19 07:27:34','2015-06-19 07:27:34','Normal',' ',1,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1127,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-19 07:50:02','2015-06-19 07:50:02','Normal',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1128,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-19 08:09:32','2015-06-19 08:09:32','Normal',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1129,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-19 08:24:51','2015-06-19 08:24:51','Normal',' ',1,NULL,1,'0.00','0.00',NULL,NULL,NULL),(1130,'MR3003',1,NULL,45,23,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-19 08:56:11','2015-06-19 08:56:11','High',' ',NULL,NULL,0,NULL,NULL,'0.00','0.00',NULL),(1131,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-19 08:56:11','2015-06-19 08:56:11','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1132,'MR3003',1,NULL,38,0,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-22 18:02:48','2015-06-22 18:02:48','High',' ',NULL,NULL,0,NULL,NULL,'0.00','21.98',NULL),(1133,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-22 18:02:48','2015-06-22 18:02:48','Normal',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1134,'MR-1003',1,NULL,30,8,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-22 22:31:28','2015-06-22 22:31:28','High',' ',NULL,NULL,0,NULL,NULL,'0.00','21.98',NULL),(1135,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-22 22:31:28','2015-06-22 22:31:28','Normal',' ',1,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1136,'MR-1003',1,NULL,38,8,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-22 22:46:47','2015-06-22 22:46:47','Low',' ',NULL,NULL,0,NULL,NULL,'0.00','60.00',NULL),(1137,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-22 22:46:47','2015-06-22 22:46:47','Normal',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1156,'MR-1001',1,NULL,53,8,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-23 05:08:50','2015-06-23 05:08:50','Normal',' ',NULL,NULL,0,NULL,NULL,'667.03','36.98',NULL),(1157,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-23 05:08:50','2015-06-23 05:08:50','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1158,'MR-1001',1,NULL,23,0,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-23 05:49:50','2015-06-23 05:49:50','Low',' ',NULL,NULL,0,NULL,NULL,'667.03','36.98',NULL),(1159,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-23 05:49:50','2015-06-23 05:49:50','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1162,'MR-1001',1,NULL,68,15,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-24 01:50:31','2015-06-24 01:50:31','High',' ',NULL,NULL,0,NULL,NULL,'0.00','36.98',NULL),(1163,'MR-1001',1,NULL,60,23,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-24 01:59:00','2015-06-24 01:59:00','High',' ',NULL,NULL,0,NULL,NULL,'0.00','36.98',NULL),(1164,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-24 01:50:31','2015-06-24 01:50:31','High',' ',1,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1165,'MR-1001',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-24 01:59:00','2015-06-24 01:59:00','High',' ',1,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1166,'MR-1003',1,NULL,75,30,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-24 02:03:10','2015-06-24 02:03:10','High',' ',1,NULL,0,NULL,NULL,'0.00','21.98',NULL),(1167,'MR-1003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-24 02:03:10','2015-06-24 02:03:10','High',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1168,'MR-1002',1,NULL,53,30,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-06-24 02:21:36','2015-06-24 02:21:36','Low',' ',NULL,NULL,0,NULL,NULL,'0.00','60.00',NULL),(1169,'MR-1002',2,0,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-06-24 02:21:36','2015-06-24 02:21:36','Low',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1178,'1890',1,NULL,893,720,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 02:31:36','2015-06-24 02:31:36','High',' ',11,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1179,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 02:31:36','2015-06-24 02:31:36','High',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1180,'1890',1,75,968,518,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2017-03-09 03:03:12','2017-03-09 03:03:12','High',' ',11,8,0,'100.00','50.09','120.01','69.98',NULL),(1181,'1890',1,NULL,1,668,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 03:03:40','2015-06-24 03:03:40','High',' ',11,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1182,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 03:03:12','2015-06-24 03:03:12','Low',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1183,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 03:03:40','2015-06-24 03:03:40','High',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1184,'1890',1,NULL,893,480,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 15:21:59','2015-06-24 15:21:59','High',' ',11,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1185,'1890',1,NULL,743,443,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 15:49:46','2015-06-24 15:49:46','High',' ',11,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1186,'1890',1,70,893,593,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2017-03-03 15:50:10','2017-03-03 15:50:10','High',' ',11,8,0,'100.00','50.09','120.01','69.98',NULL),(1187,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 15:21:59','2015-06-24 15:21:59','High',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1188,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 15:49:46','2015-06-24 15:49:46','High',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1189,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 15:50:10','2015-06-24 15:50:10','High',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1190,'1890',1,NULL,930,638,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 05:20:03','2015-06-24 05:20:03','High',' ',NULL,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1191,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 05:20:03','2015-06-24 05:20:03','Low',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1192,'1890',1,NULL,1,668,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 18:01:21','2015-06-24 18:01:21','High',' ',11,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1193,'1890',2,60,700,500,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2017-03-11 18:01:21','2017-03-11 18:01:21','High',' ',11,8,0,'100.00','50.09','120.01','69.98',NULL),(1194,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-30 08:56:16','2015-06-25 13:31:11','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1195,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-30 08:53:52','2015-06-25 13:31:11','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1196,'1990',1,NULL,120,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-30 14:46:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1197,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-30 14:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1198,'MR3003',1,NULL,0,563,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-05-29 15:21:09','2015-05-29 15:21:09','Low',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1199,'MR3003',1,NULL,0,8,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-05-29 15:21:15','2015-05-29 15:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1200,'MR3003',1,NULL,53,593,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-18 17:19:00','2015-06-18 17:19:00','High',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1201,'MR3003',1,NULL,4,413,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-18 17:19:05','2015-06-18 17:19:05','High',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1202,'MR3003',1,NULL,113,4,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-18 17:19:09','2015-06-18 17:19:09','High',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1203,'MR3003',1,NULL,4,4,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-18 17:19:15','2015-06-18 17:19:15','High',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1204,'MR3003',1,NULL,593,45,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-18 17:19:20','2015-06-18 17:19:20','High',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1205,'MR3003',1,NULL,1,420,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-18 17:19:26','2015-06-18 17:19:26','High',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1206,'MR3003',1,NULL,6,15,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-18 17:19:31','2015-06-18 17:19:31','High',' ',NULL,NULL,0,NULL,NULL,'0.00','66.98',NULL),(1207,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-05-29 15:21:09','2015-05-29 15:21:09','Low',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1208,'MR3003',2,0,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-05-29 15:21:15','2015-05-29 15:21:15','Low',' ',NULL,NULL,0,'0.00','0.00',NULL,NULL,NULL),(1209,'MR3003',2,667,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-06-18 17:19:00','2015-06-18 17:19:00','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(1210,'MR3003',2,649,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-06-18 17:19:05','2015-06-18 17:19:05','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(1211,'MR3003',2,36,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-06-18 17:19:09','2015-06-18 17:19:09','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(1212,'MR3003',2,72,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-06-18 17:19:15','2015-06-18 17:19:15','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(1213,'MR3003',2,36,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-06-18 17:19:20','2015-06-18 17:19:20','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(1214,'MR3003',2,486,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-06-18 17:19:26','2015-06-18 17:19:26','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(1215,'MR3003',2,15,NULL,NULL,' ','blood sugar','Mg/dL','A120','Micromax A120','10.0.1.169','','2015-06-18 17:19:31','2015-06-18 17:19:31','High',' ',NULL,1,0,'0.00','0.00',NULL,NULL,NULL),(1216,'1890',1,NULL,743,593,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-30 12:25:35','2015-06-30 12:25:35','Normal',' ',11,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1217,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','A120','Micromax A120','10.0.1.169','','2015-06-30 12:25:35','2015-06-30 12:25:35','Low',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1218,'1890',1,NULL,893,630,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-30 14:22:18','2015-06-30 14:22:18','High',' ',NULL,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1219,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','A120','Micromax A120','10.0.1.169','','2015-06-30 14:22:18','2015-06-30 14:22:18','Low',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1220,'1890',1,NULL,668,593,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-30 15:05:23','2015-06-30 15:05:23','Normal',' ',NULL,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1221,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','A120','Micromax A120','10.0.1.169','','2015-06-30 15:05:23','2015-06-30 15:05:23','Normal',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1222,'1890',1,NULL,743,593,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-30 15:52:47','2015-06-30 15:52:47','Normal',' ',NULL,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1223,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','A120','Micromax A120','10.0.1.169','','2015-06-30 15:52:47','2015-06-30 15:52:47','Normal',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1224,'1890',1,NULL,893,630,' ','blood pressure','mmHg','A120','Micromax A120','10.0.1.169',' ','2015-06-30 16:04:59','2015-06-30 16:04:59','High',' ',NULL,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1225,'1890',2,0,NULL,NULL,' ','blood sugar','Mmol/L','A120','Micromax A120','10.0.1.169','','2015-06-30 16:04:59','2015-06-30 16:04:59','Low',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1226,'1990',1,NULL,113,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-30 20:36:16','2015-06-25 21:21:15','Low',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1227,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-30 20:33:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1228,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-31 02:26:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1229,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-31 02:23:52','2015-06-25 21:21:15','Low',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1230,'1990',1,NULL,120,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-31 08:16:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1231,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-31 08:13:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1232,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-31 14:06:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1233,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-31 14:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1234,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-31 19:56:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1235,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-31 19:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1236,'1990',1,NULL,128,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-01 01:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1237,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-01 01:43:52','2015-06-25 21:21:15','High',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1238,'1990',1,NULL,90,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-01 07:36:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1239,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-01 07:33:52','2015-06-25 21:21:15','Normal',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1240,'1990',1,NULL,98,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-01 13:26:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1241,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-01 13:23:52','2015-06-25 21:21:15','High',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1242,'1990',1,NULL,113,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-01 19:16:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1243,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-01 19:13:52','2015-06-25 21:21:15','Normal',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1244,'1990',1,NULL,105,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-02 01:06:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1245,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-02 01:03:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1246,'1990',1,NULL,105,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-02 06:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1247,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-02 06:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1248,'1990',1,NULL,90,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-02 12:46:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1249,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-02 12:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1250,'1990',1,NULL,113,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-02 18:36:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1251,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-02 18:33:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1252,'1990',1,NULL,98,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-03 00:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1253,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-03 00:23:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1254,'1990',1,NULL,90,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-03 06:16:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1255,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-03 06:13:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1256,'1990',1,NULL,90,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-03 12:06:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1257,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-03 12:03:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1258,'1990',1,NULL,120,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-03 17:56:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1259,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-03 17:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1260,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-03 23:46:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1261,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-03 23:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1262,'1990',1,NULL,90,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-04 05:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1263,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-04 05:33:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1264,'1990',1,NULL,90,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-04 11:26:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1265,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-04 11:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1266,'1990',1,NULL,120,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-04 17:16:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1267,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-04 17:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1268,'1990',1,NULL,120,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-04 23:06:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1269,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-04 23:03:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1270,'1990',1,NULL,105,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-05 04:56:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1271,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-05 04:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1272,'1990',1,NULL,113,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-05 10:46:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1273,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-05 10:43:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1274,'1990',1,NULL,90,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-05 16:36:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1275,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-05 16:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1276,'1990',1,NULL,98,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-05 22:26:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1277,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-05 22:23:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1278,'1990',1,NULL,105,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-06 04:16:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1279,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-06 04:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1280,'1990',1,NULL,120,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-06 10:06:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1281,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-06 10:03:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1282,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-06 15:56:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1283,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-06 15:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1284,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-06 21:46:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1285,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-06 21:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1286,'1990',1,NULL,113,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-07 03:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1287,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-07 03:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1288,'1990',1,NULL,113,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-07 09:26:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1289,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-07 09:23:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1290,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-07 15:16:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1291,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-07 15:13:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1292,'1990',1,NULL,83,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-07 21:06:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1293,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-07 21:03:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1294,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-08 02:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1295,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-08 02:53:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1296,'1990',1,NULL,120,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-08 08:46:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1297,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-08 08:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1298,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-08 14:36:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1299,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-08 14:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1300,'1990',1,NULL,120,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-08 20:26:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1301,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-08 20:23:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1302,'1990',1,NULL,90,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-09 02:16:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1303,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-09 02:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1304,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-09 08:06:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1305,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-09 08:03:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1306,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-09 13:56:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1307,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-09 13:53:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1308,'1990',1,NULL,120,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-09 19:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1309,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-09 19:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1310,'1990',1,NULL,90,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-10 01:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1311,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-10 01:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1312,'1990',1,NULL,90,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-10 07:26:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1313,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-10 07:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1314,'1990',1,NULL,90,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-10 13:16:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1315,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-10 13:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1316,'1990',1,NULL,113,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-10 19:06:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1317,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-10 19:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1318,'1990',1,NULL,120,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-11 00:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1319,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-11 00:53:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1320,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-11 06:46:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1321,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-11 06:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1322,'1990',1,NULL,105,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-11 12:36:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1323,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-11 12:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1324,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-11 18:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1325,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-11 18:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1326,'1990',1,NULL,90,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-12 00:16:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1327,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-12 00:13:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1328,'1990',1,NULL,105,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-12 06:06:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1329,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-12 06:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1330,'1990',1,NULL,98,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-12 11:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1331,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-12 11:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1332,'1990',1,NULL,98,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-12 17:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1333,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-12 17:43:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1334,'1990',1,NULL,90,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-12 23:36:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1335,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-12 23:33:52','2015-06-25 21:21:15','Low',' ',NULL,8,0,'100.00','50.09',NULL,NULL,NULL),(1336,'1990',1,NULL,128,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-13 05:26:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1337,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-13 05:23:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1338,'1990',1,NULL,105,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-13 11:16:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1339,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-13 11:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1340,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-13 17:06:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1341,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-13 17:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1342,'1990',1,NULL,90,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-13 22:56:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1343,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-13 22:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1344,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-14 04:46:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1345,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-14 04:43:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1346,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-14 10:36:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1347,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-14 10:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1348,'1990',1,NULL,90,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-14 16:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1349,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-14 16:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1350,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-14 22:16:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1351,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-14 22:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1352,'1990',1,NULL,90,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-15 04:06:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1353,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-15 04:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1354,'1990',1,NULL,90,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-15 09:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1355,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-15 09:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1356,'1990',1,NULL,83,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-15 15:46:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1357,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-15 15:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1358,'1990',1,NULL,113,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-15 21:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1359,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-15 21:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1360,'1990',1,NULL,113,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-16 03:26:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1361,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-16 03:23:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1362,'1990',1,NULL,98,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-16 09:16:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1363,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-16 09:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1364,'1990',1,NULL,113,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-16 15:06:16','2015-06-25 21:21:15','Low',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1365,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-16 15:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1366,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-16 20:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1367,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-16 20:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1368,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-17 02:46:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1369,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-17 02:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1370,'1990',1,NULL,98,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-17 08:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1371,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-17 08:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1372,'1990',1,NULL,120,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-17 14:26:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1373,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-17 14:23:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1374,'1990',1,NULL,98,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-17 20:16:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1375,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-17 20:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1376,'1990',1,NULL,120,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-18 02:06:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1377,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-18 02:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1378,'1990',1,NULL,113,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-18 07:56:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1379,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-18 07:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1380,'1990',1,NULL,120,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-18 13:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1381,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-18 13:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1382,'1990',1,NULL,105,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-18 19:36:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1383,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-18 19:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1384,'1990',1,NULL,113,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-19 01:26:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1385,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-19 01:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1386,'1990',1,NULL,120,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-19 07:16:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1387,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-19 07:13:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1388,'1990',1,NULL,90,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-19 13:06:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1389,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-19 13:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1390,'1990',1,NULL,90,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-19 18:56:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1391,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-19 18:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1392,'1990',1,NULL,105,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-20 00:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1393,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-20 00:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1394,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-20 06:36:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1395,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-20 06:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1396,'1990',1,NULL,83,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-20 12:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1397,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-20 12:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1398,'1990',1,NULL,83,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-20 18:16:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1399,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-20 18:13:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1400,'1990',1,NULL,90,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-21 00:06:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1401,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-21 00:03:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1402,'1990',1,NULL,98,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-21 05:56:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1403,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-21 05:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1404,'1990',1,NULL,113,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-21 11:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1405,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-21 11:43:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1406,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-21 17:36:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1407,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-21 17:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1408,'1990',1,NULL,90,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-21 23:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1409,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-21 23:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1410,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-22 05:16:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1411,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-22 05:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1412,'1990',1,NULL,98,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-22 11:06:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1413,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-22 11:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1414,'1990',1,NULL,113,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-22 16:56:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1415,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-22 16:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1416,'1990',1,NULL,98,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-22 22:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1417,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-22 22:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1418,'1990',1,NULL,105,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-23 04:36:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1419,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-23 04:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1420,'1990',1,NULL,98,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-23 10:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1421,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-23 10:23:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1422,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-23 16:16:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1423,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-23 16:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1424,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-23 22:06:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1425,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-23 22:03:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1426,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 03:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1427,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 03:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1428,'1990',1,NULL,120,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 09:46:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1429,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 09:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1430,'1990',1,NULL,120,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 15:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1431,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 15:33:52','2015-06-25 21:21:15','Normal',' ',NULL,8,0,'100.00','50.09',NULL,NULL,NULL),(1432,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-24 21:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1433,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-24 21:23:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1434,'1990',1,NULL,98,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-25 03:16:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1435,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-25 03:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1436,'1990',1,NULL,113,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-25 09:06:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1437,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-25 09:03:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1438,'1990',1,NULL,98,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-25 14:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1439,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-25 14:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1440,'1990',1,NULL,90,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-25 20:46:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1441,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-25 20:43:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1442,'1990',1,NULL,90,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-26 02:36:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1443,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-26 02:33:52','2015-06-25 21:21:15','High',' ',NULL,8,0,'100.00','50.09',NULL,NULL,NULL),(1444,'1990',1,NULL,120,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-26 08:26:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1445,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-26 08:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1446,'1990',1,NULL,113,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-26 14:16:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1447,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-26 14:13:52','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1448,'1990',1,NULL,105,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-26 20:06:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1449,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-26 20:03:52','2015-06-25 21:21:15','Normal',' ',NULL,8,0,'100.00','50.09',NULL,NULL,NULL),(1450,'1990',1,NULL,83,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-27 01:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1451,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-27 01:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1452,'1990',1,NULL,98,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-27 07:46:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1453,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-27 07:43:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1454,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-27 13:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1455,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-27 13:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1456,'1990',1,NULL,120,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-27 19:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1457,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-27 19:23:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1458,'1990',1,NULL,113,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-28 01:16:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1459,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-28 01:13:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1460,'1990',1,NULL,113,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-28 07:06:16','2015-06-25 21:21:15','Low',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1461,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-28 07:03:52','2015-06-25 21:21:15','Low',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1462,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-28 12:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1463,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-28 12:53:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1464,'1990',1,NULL,113,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-28 18:46:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1465,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-28 18:43:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1466,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-29 00:36:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1467,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-29 00:33:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1468,'1990',1,NULL,98,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-29 06:26:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1469,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-29 06:23:52','2015-06-25 21:21:15','High',' ',NULL,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1470,'1990',1,NULL,105,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-29 12:16:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1471,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-29 12:13:52','2015-06-25 21:21:15','Low',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1472,'1990',1,NULL,120,75,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-29 18:06:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1473,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-29 18:03:52','2015-06-25 21:21:15','Normal',' ',NULL,8,0,'100.00','50.09',NULL,NULL,NULL),(1474,'1990',1,NULL,113,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-29 23:56:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1475,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-29 23:53:52','2015-06-25 21:21:15','Normal',' ',NULL,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1476,'1990',1,NULL,105,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-30 05:46:16','2015-06-25 21:21:15','Low',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1477,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-30 05:43:52','2015-06-25 21:21:15','High',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1478,'1990',1,NULL,120,98,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-30 11:36:16','2015-06-25 21:21:15','Normal',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1479,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-30 11:33:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1480,'1990',1,NULL,113,60,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-30 17:26:16','2015-06-25 21:21:15','Normal',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1481,'1990',2,90,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-06-30 17:23:52','2015-06-25 21:21:15','Normal',' ',11,NULL,0,'100.00','50.09',NULL,NULL,NULL),(1482,'1990',1,NULL,90,68,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-06-30 23:16:16','2015-06-25 21:21:15','High',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1483,'1990',2,90,700,500,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2017-03-09 23:13:52','2017-03-09 23:13:52','Normal',' ',11,8,0,'100.00','50.09','120.01','69.98',NULL),(1484,'1990',1,NULL,105,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-07-01 05:06:16','2015-06-25 21:21:15','Low',' ',11,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1485,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-07-01 05:03:52','2015-06-25 21:21:15','Normal',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1486,'1990',1,NULL,113,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-07-01 10:56:16','2015-06-25 21:21:15','High',' ',NULL,NULL,0,NULL,NULL,'120.01','69.98',NULL),(1487,'1990',2,54,893,593,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2017-03-12 10:53:52','2017-03-12 10:53:52','Normal',' ',11,8,0,'100.00','50.09','120.01','69.98',NULL),(1488,'1990',1,NULL,98,90,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-07-01 16:46:16','2015-06-25 21:21:15','Low',' ',NULL,NULL,1,NULL,NULL,'120.01','69.98',NULL),(1489,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-07-01 16:43:52','2015-06-25 21:21:15','Normal',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1490,'1990',1,NULL,113,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-07-01 22:36:16','2015-06-25 21:21:15','Low',' ',NULL,8,0,NULL,NULL,'120.01','69.98',NULL),(1491,'1990',2,72,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-07-01 22:33:52','2015-06-25 21:21:15','High',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1492,'1990',1,NULL,105,83,' ','blood pressure','mmHg','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-07-02 04:26:16','2015-06-25 21:21:15','Normal',' ',NULL,8,0,NULL,NULL,'120.01','69.98',NULL),(1493,'1990',2,54,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-07-02 04:23:52','2015-06-25 21:21:15','High',' ',11,NULL,1,'100.00','50.09',NULL,NULL,NULL),(1496,'MR-2222',1,NULL,130,100,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-08-26 01:44:25','2015-08-26 01:44:25','High',' ',NULL,NULL,0,NULL,NULL,'0','0',NULL),(1497,'MR-2222',2,90,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-08-26 01:44:25','2015-08-26 01:44:25','High',' ',NULL,NULL,0,'0','0',NULL,NULL,NULL),(1498,'MR-2222',1,NULL,80,140,' ','blood pressure','mmHg','generic','Unknown sdk','0.0.0.0',' ','2015-08-26 03:13:53','2015-08-26 03:13:53','High',' ',NULL,NULL,0,NULL,NULL,'50','69',NULL),(1499,'MR-2222',2,120,NULL,NULL,' ','blood sugar','Mg/dL','generic','Unknown sdk','0.0.0.0','','2015-08-26 03:13:53','2015-08-26 03:13:53','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1502,'MR-2222',1,NULL,100,150,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-08-26 13:52:26','2015-08-26 13:52:26','High',' ',NULL,NULL,1,NULL,NULL,'50','69',NULL),(1503,'MR-2222',2,122,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-08-26 13:52:26','2015-08-26 13:52:26','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1504,'MR-2222',1,NULL,99,133,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-08-26 14:04:15','2015-08-26 14:04:15','High',' ',11,NULL,0,NULL,NULL,'50','69',NULL),(1505,'MR-2222',1,NULL,99,99,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-08-26 14:14:07','2015-08-26 14:14:07','High',' ',11,NULL,0,NULL,NULL,'50','69',NULL),(1506,'MR-2222',2,69,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-08-26 14:04:15','2015-08-26 14:04:15','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1507,'MR-2222',2,99,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-08-26 14:14:07','2015-08-26 14:14:07','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1508,'MR-2222',1,NULL,90,180,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-08-26 14:37:13','2015-08-26 14:37:13','High',' ',11,NULL,0,NULL,NULL,'50','69',NULL),(1509,'MR-2222',2,125,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-08-26 14:37:13','2015-08-26 14:37:13','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1510,'MR-2222',1,NULL,66,77,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-08-26 15:22:13','2015-08-26 15:22:13','Low',' ',NULL,NULL,1,NULL,NULL,'50','69',NULL),(1511,'MR-2222',2,55,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-08-26 15:22:13','2015-08-26 15:22:13','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1512,'MR-2222',1,NULL,56,57,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-08-26 17:40:19','2015-08-26 17:40:19','Low',' ',NULL,NULL,1,NULL,NULL,'50','69',NULL),(1513,'MR-2222',2,55,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-08-26 17:40:19','2015-08-26 17:40:19','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1514,'MR-2222',1,NULL,150,150,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-08-26 17:46:43','2015-08-26 17:46:43','High',' ',NULL,NULL,0,NULL,NULL,'50','69',NULL),(1515,'MR-2222',2,150,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-08-26 17:46:43','2015-08-26 17:46:43','High',' ',NULL,NULL,0,'50','50',NULL,NULL,NULL),(1516,'MR-5555',1,NULL,55,155,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-09-03 15:41:21','2015-09-03 15:41:21','High',' ',NULL,NULL,0,NULL,NULL,'0','0',NULL),(1517,'MR-5555',2,120,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-09-03 15:41:21','2015-09-03 15:41:21','High',' ',NULL,NULL,0,'0','0',NULL,NULL,NULL),(1518,'MR-2222',1,NULL,55,155,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-09-03 15:48:00','2015-09-03 15:48:00','Low',' ',NULL,NULL,0,NULL,NULL,'0','69',NULL),(1519,'MR-2222',2,150,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-09-03 15:48:00','2015-09-03 15:48:00','High',' ',NULL,NULL,0,'0','50',NULL,NULL,NULL),(1520,'MR-2222',1,NULL,60,160,' ','blood pressure','mmHg','t03g','Samsung GT-N7100','10.0.2.15',' ','2015-09-03 15:49:14','2015-09-03 15:49:14','Low',' ',NULL,NULL,0,NULL,NULL,'0','69',NULL),(1521,'MR-2222',2,150,NULL,NULL,' ','blood sugar','Mg/dL','t03g','Samsung GT-N7100','10.0.2.15','','2015-09-03 15:49:14','2015-09-03 15:49:14','High',' ',NULL,NULL,0,'0','50',NULL,NULL,NULL);
/*!40000 ALTER TABLE `patientphysiologicaldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payerName` varchar(55) DEFAULT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `insuranceID` varchar(100) DEFAULT NULL,
  `insuranceDetails` varchar(100) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_patientiD_idx` (`patientID`),
  CONSTRAINT `fk_payment_patientiD` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physologic_data`
--

DROP TABLE IF EXISTS `physologic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physologic_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  `patientMRid` varchar(100) NOT NULL,
  `readingFor` int(11) DEFAULT NULL,
  `sugervalue` int(11) DEFAULT NULL,
  `pressuresystolic` int(11) DEFAULT NULL,
  `pressurediastolic` int(11) DEFAULT NULL,
  `rdata` varchar(100) DEFAULT NULL,
  `measurementtype` varchar(100) DEFAULT NULL,
  `units` varchar(100) DEFAULT NULL,
  `devicetype` varchar(100) DEFAULT NULL,
  `devicebrandmodel` varchar(100) DEFAULT NULL,
  `devicenetworkaddress` varchar(100) DEFAULT NULL,
  `deviceID` varchar(100) DEFAULT NULL,
  `deviceTime` varchar(100) DEFAULT NULL,
  `ReceivedDateTime` varchar(100) DEFAULT NULL,
  `fstate` varchar(50) DEFAULT NULL,
  `reviewerType` varchar(50) DEFAULT NULL,
  `docId` int(11) DEFAULT NULL,
  `nurseId` int(11) DEFAULT NULL,
  `isDeleted` tinyint(4) DEFAULT '0',
  `glucoseMax` varchar(100) DEFAULT NULL,
  `glucoseMin` varchar(100) DEFAULT NULL,
  `bloodPressureMax` varchar(100) DEFAULT NULL,
  `bloodPressureMin` varchar(100) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physologic_data`
--

LOCK TABLES `physologic_data` WRITE;
/*!40000 ALTER TABLE `physologic_data` DISABLE KEYS */;
INSERT INTO `physologic_data` VALUES (831,'MR-1003',1,NULL,145,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-20 16:32:19','2015-04-20 16:32:19','High',' ',NULL,1,0,NULL,NULL,'140','70',NULL),(832,'MR-1003',2,105,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-20 16:32:19','2015-04-20 16:32:19','High',' ',NULL,NULL,1,'100','50',NULL,NULL,NULL),(837,'MR-1003',1,NULL,145,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-20 16:32:19','2015-04-20 16:32:19','High',' ',NULL,NULL,1,NULL,NULL,'140','70',NULL),(838,'MR-1003',2,105,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-20 16:32:19','2015-04-20 16:32:19','High',' ',NULL,NULL,1,'100','50',NULL,NULL,NULL),(841,'MR-1003',1,NULL,145,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-20 16:32:19','2015-04-20 16:32:19','High',' ',NULL,NULL,0,NULL,NULL,'140','70',NULL),(842,'MR-1003',1,NULL,120,70,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 11:05:17','2015-04-21 11:05:17','Normal',' ',NULL,NULL,0,NULL,NULL,'140','70',NULL),(843,'MR-1003',1,NULL,150,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 11:09:28','2015-04-21 11:09:28','High',' ',NULL,NULL,0,NULL,NULL,'140','70',NULL),(844,'MR-1003',2,105,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-20 16:32:19','2015-04-20 16:32:19','High',' ',1,NULL,1,'100','50',NULL,NULL,NULL),(845,'MR-1003',2,40,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 11:05:17','2015-04-21 11:05:17','Low',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(846,'MR-1003',2,40,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 11:09:28','2015-04-21 11:09:28','Low',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(847,'MR-1003',1,NULL,140,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 11:54:40','2015-04-21 11:54:40','High',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(848,'MR-1003',2,40,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 11:54:40','2015-04-21 11:54:40','Low',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(851,'MR-1003',1,NULL,120,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 11:54:40','2015-04-21 11:54:40','High',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(852,'MR-1003',2,40,NULL,NULL,' ','blood sugar','Mg/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 11:54:40','2015-04-21 11:54:40','Low',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(857,'MR-1003',1,NULL,140,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 11:54:40','2015-04-21 11:54:40','High',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(858,'MR-1003',1,NULL,105,85,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 13:10:54','2015-04-21 13:10:54','Normal',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(859,'MR-1003',2,40,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 11:54:40','2015-04-21 11:54:40','Low',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(860,'MR-1003',2,55,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 13:10:54','2015-04-21 13:10:54','Normal',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(861,'MR-1003',1,NULL,140,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 11:54:40','2015-04-21 11:54:40','High',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(862,'MR-1003',1,NULL,105,85,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 13:10:54','2015-04-21 13:10:54','Normal',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(863,'MR-1003',2,40,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 11:54:40','2015-04-21 11:54:40','Low',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(864,'MR-1003',2,55,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 13:10:54','2015-04-21 13:10:54','Normal',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(865,'MR-1003',1,NULL,140,65,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 11:54:40','2015-04-21 11:54:40','High',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(866,'MR-1003',1,NULL,105,85,' ','blood pressure','mmHG','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-21 13:10:54','2015-04-21 13:10:54','Normal',' ',NULL,NULL,0,NULL,NULL,'130','70',NULL),(867,'MR-1003',2,40,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 11:54:40','2015-04-21 11:54:40','Low',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(868,'MR-1003',2,55,NULL,NULL,' ','blood sugar','MG/DL','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-21 13:10:54','2015-04-21 13:10:54','Normal',' ',NULL,NULL,0,'100','50',NULL,NULL,NULL),(953,'MR-1003',1,NULL,44,88,' ','blood pressure','kPa','generic','Unknown sdk','0.0.0.0',' ','2015-04-27 07:06:40','2015-04-27 07:06:40','Low',' ',NULL,NULL,0,NULL,NULL,'70','130',NULL),(954,'MR-1003',2,33,NULL,NULL,' ','blood sugar','Mmol/L','generic','Unknown sdk','0.0.0.0','','2015-04-27 07:06:40','2015-04-27 07:06:40','Low',' ',NULL,NULL,0,'60','50',NULL,NULL,NULL),(955,'MR-1003',1,NULL,56,89,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-27 17:42:23','2015-04-27 17:42:23','Low',' ',NULL,NULL,0,NULL,NULL,'70','130',NULL),(956,'MR-1003',2,78,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-27 17:42:23','2015-04-27 17:42:23','High',' ',NULL,NULL,0,'60','50',NULL,NULL,NULL),(957,'MR-1003',1,NULL,56,90,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-27 17:52:36','2015-04-27 17:52:36','Low',' ',NULL,NULL,0,NULL,NULL,'70','130',NULL),(958,'MR-1003',2,45,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-27 17:52:36','2015-04-27 17:52:36','Low',' ',NULL,NULL,0,'60','50',NULL,NULL,NULL),(969,'MR-1003',1,NULL,166,96,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-27 18:55:45','2015-04-27 18:55:45','High',' ',NULL,NULL,0,NULL,NULL,'70','130',NULL),(970,'MR-1003',2,450,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-27 18:55:45','2015-04-27 18:55:45','High',' ',NULL,NULL,0,'60','50',NULL,NULL,NULL),(975,'MR-1003',1,NULL,111,99,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-04-27 19:03:58','2015-04-27 19:03:58','Low',' ',NULL,NULL,0,NULL,NULL,'70','130',NULL),(976,'MR-1003',2,122,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-04-27 19:03:58','2015-04-27 19:03:58','High',' ',NULL,NULL,0,'60','50',NULL,NULL,NULL),(977,'MR-1003',1,NULL,151,71,' ','blood pressure','kPa','ja3g','Samsung GT-I9500','10.0.2.15',' ','2015-05-04 10:20:41','2015-05-04 10:20:41','High',' ',NULL,NULL,0,NULL,NULL,'70','130',NULL),(978,'MR-1003',2,71,NULL,NULL,' ','blood sugar','Mmol/L','ja3g','Samsung GT-I9500','10.0.2.15','','2015-05-04 10:20:41','2015-05-04 10:20:41','High',' ',1,NULL,0,'60','50',NULL,NULL,NULL);
/*!40000 ALTER TABLE `physologic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(55) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `uniqueID` varchar(100) DEFAULT NULL,
  `adminID` int(11) DEFAULT NULL,
  `hcgID` int(11) DEFAULT NULL,
  `docID` int(11) DEFAULT NULL,
  `nurseID` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `isDeleted` tinyint(4) DEFAULT '0',
  `createdAT` timestamp NULL DEFAULT NULL,
  `updatedAT` timestamp NULL DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `password_creation_status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`username`),
  UNIQUE KEY `uniqueID_UNIQUE` (`uniqueID`),
  KEY `fk_user_hcgid_idx` (`hcgID`),
  KEY `fk_user_patientID_idx` (`patientID`),
  KEY `fk_user_docid_idx` (`docID`),
  KEY `fk_user_nurseID_idx` (`nurseID`),
  KEY `fk_user_adminID_idx` (`adminID`),
  CONSTRAINT `fk_user_adminID` FOREIGN KEY (`adminID`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_docid` FOREIGN KEY (`docID`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_hcgid` FOREIGN KEY (`hcgID`) REFERENCES `hcgorgnization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_nurseID` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_patientID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0','123','3jlrp',NULL,3,NULL,NULL,0,0,'2015-04-13 08:53:47','2015-04-13 08:56:30',NULL,1,1),('ab@ukitss.com','qri0n','9f80e',NULL,NULL,NULL,NULL,0,0,'2015-07-01 10:30:59','2015-07-01 10:30:59',24,1,0),('abhishekshukla@ukitss.com','4gu6i','teqwj',NULL,7,NULL,NULL,0,0,'2015-05-22 08:40:09','2015-05-22 08:40:09',NULL,1,0),('albert@ukitss.com','Pass@123','czlm1',NULL,NULL,NULL,NULL,1,0,'2015-04-17 09:45:28','2015-04-17 10:00:00',2,1,1),('albertadmin@ukitss.com','Pass@123','m93x3',NULL,10,NULL,NULL,0,0,'2015-05-22 08:59:08','2015-05-22 08:59:08',NULL,0,0),('alisa@ukitss.com','y6nz2','km5fe',NULL,NULL,NULL,7,0,0,'2015-06-17 08:58:22','2015-06-17 08:58:22',NULL,1,0),('allen1@ukitss.com','Pass@123','a1139',NULL,NULL,6,NULL,0,0,'2015-05-13 09:55:19','2015-05-13 09:55:19',NULL,1,1),('allen@ukitss.com','Pass@123','kr2j4',NULL,NULL,4,NULL,0,0,'2015-05-11 08:47:10','2015-05-11 08:47:10',NULL,1,1),('andrew@ukitss.com','Pass@123','xth10',NULL,NULL,NULL,NULL,0,0,'2015-05-04 11:17:19','2015-05-04 11:17:19',8,0,1),('anny@ukitss.com','Pass@123','uc4sk',NULL,NULL,11,NULL,0,0,'2015-06-23 06:34:21','2015-06-23 09:12:42',NULL,1,1),('ashutosh.kumar@dreamsoft4u.com','Pass@123','0n0v9',NULL,NULL,NULL,2,0,0,'2015-05-02 12:58:14','2015-05-04 06:06:24',NULL,1,1),('ashutosh.kumar@ukitss.com','Pass@123','u9lls',NULL,2,NULL,NULL,0,0,'2015-04-13 08:41:53','2015-04-16 10:31:11',NULL,1,1),('bpreciado@live.com','Pass@123','1o1bd',NULL,NULL,NULL,3,0,0,'2015-05-07 02:26:37','2015-05-07 02:27:25',NULL,1,1),('cyna@gmail.com','Pass@123','4323',NULL,1,NULL,NULL,0,0,'2015-04-07 20:31:20','2015-05-02 05:00:53',NULL,1,1),('dny@ukitss.com','Pass@123','jcb7m',NULL,NULL,NULL,9,0,0,'2015-06-24 07:22:40','2015-06-24 07:26:54',NULL,1,1),('dsc@ukitss.com','Pass@123','tysqq',NULL,NULL,NULL,NULL,0,0,'2015-05-12 05:35:12','2015-05-12 06:20:54',10,1,1),('elle@ukitss.com','Pass@123','gmx8e',NULL,NULL,12,NULL,0,0,'2015-06-24 06:44:36','2015-06-24 06:46:44',NULL,1,1),('Elli@ukitss.com','Pass@123','gzubi',NULL,NULL,NULL,6,0,0,'2015-05-15 10:19:10','2015-05-15 10:21:42',NULL,1,1),('gary@ukitss.com','Pass@123','i3f5m',NULL,NULL,NULL,NULL,0,0,'2015-04-20 10:01:03','2015-04-30 12:18:42',3,1,1),('gena.davis@mailinator.com','Pass@123','z3yop',NULL,NULL,NULL,NULL,0,0,'2015-08-27 12:44:20','2015-08-27 12:46:34',30,1,1),('geoarge@ukitss.com','Pass@123','lqf5m',NULL,NULL,7,NULL,0,0,'2015-05-13 10:21:46','2015-05-13 10:21:46',NULL,1,1),('george@ukits.com','Pass@123','0u8sx',NULL,NULL,NULL,NULL,0,0,'2015-04-29 12:47:52','2015-04-30 11:55:39',4,1,1),('george@ukitss.com','Pass@123','n2mym',NULL,4,NULL,NULL,0,0,'2015-05-04 06:49:37','2015-05-04 09:07:27',NULL,1,1),('guptasakshi@ukitss.com','Pass@123','tkkge',NULL,NULL,10,NULL,0,0,'2015-06-18 10:28:31','2015-06-18 11:13:48',NULL,1,1),('jez@ukitss.com','e02bw','w2fqe',NULL,NULL,9,NULL,0,0,'2015-06-17 07:16:18','2015-06-17 07:16:18',NULL,1,0),('jezeerl12331@ukitss.com','iiis9','rx506',NULL,NULL,NULL,NULL,0,0,'2015-07-04 10:01:05','2015-07-04 10:01:05',25,1,0),('jezeerl213213@ukitss.com','lbnd1','7o8jg',NULL,NULL,13,NULL,0,0,'2015-07-22 11:59:37','2015-07-22 11:59:37',NULL,1,0),('jezeerl@ukitss.com','Pass@123','niy60',NULL,NULL,NULL,NULL,0,0,'2015-06-23 06:33:25','2015-06-23 09:12:19',16,1,1),('john.denver@mailinator.com','Pass@123','ybzif',NULL,NULL,NULL,NULL,0,0,'2015-08-26 05:27:04','2015-08-26 05:30:33',29,1,1),('john.miller@mailinator.com','cilye','i0i7g',NULL,NULL,NULL,NULL,0,0,'2015-09-03 09:58:33','2015-09-03 09:58:33',31,1,0),('john@ukitss.com','Pass@123','41hgt',NULL,NULL,NULL,NULL,1,0,'2015-05-12 07:28:27','2015-05-12 07:28:27',11,1,1),('johnk@ukitss.com','Pass@123','f8bqi',NULL,NULL,NULL,NULL,0,0,'2015-06-25 05:16:55','2015-06-25 05:20:19',17,1,1),('kelin@ukitss.com','Pass@123','oqu1s',NULL,NULL,1,NULL,0,0,'2015-04-13 10:03:55','2015-04-30 13:29:01',NULL,1,1),('mark@ukitss.com','Pass@123','8khok',NULL,NULL,5,NULL,0,0,'2015-05-12 08:39:12','2015-05-12 09:34:45',NULL,1,1),('neddy@ukitss.com','Pass@123','o5nw6',NULL,NULL,NULL,1,0,0,'2015-04-13 10:18:52','2015-04-13 10:21:46',NULL,1,1),('newadmin@ukitss.com','Pass@123','hs642',NULL,11,NULL,NULL,0,0,'2015-06-23 06:23:32','2015-06-23 06:29:09',NULL,1,1),('rahul@ukitts.com','t88le','mwbi3',NULL,NULL,NULL,NULL,0,0,'2015-07-22 09:44:17','2015-07-22 09:44:17',26,1,0),('rasal@ukitss.com','Pass@123','xpzg3',NULL,NULL,NULL,5,0,0,'2015-05-12 08:46:49','2015-05-12 09:38:34',NULL,1,1),('ray@ukitss.com','Pass@123','o31p8',NULL,NULL,NULL,NULL,0,0,'2015-05-04 10:49:26','2015-05-04 10:49:26',6,1,1),('rob@ukitss.com','Pass@123','mex2g',NULL,NULL,NULL,NULL,0,0,'2015-05-04 11:07:06','2015-05-04 11:18:42',7,0,1),('robert@ukitss.com','Pass@123','x1ibx',NULL,NULL,NULL,NULL,0,0,'2015-06-17 07:03:14','2015-06-17 07:03:14',15,1,1),('Robin@yahoomail.com','Pass@123','y2eqr',NULL,NULL,NULL,NULL,0,0,'2015-04-13 09:05:21','2015-04-13 09:54:18',1,1,1),('rocky@ukitss.com','xn9z7','7o7hi',NULL,9,NULL,NULL,0,0,'2015-05-22 08:56:04','2015-05-22 08:56:04',NULL,1,0),('rohan@ukitss.com','Pass@123','pjanc',NULL,NULL,NULL,NULL,0,0,'2015-07-01 08:54:39','2015-07-11 09:37:42',23,1,1),('rohit@ukitss.com','imybp','71iw4',NULL,NULL,NULL,NULL,0,0,'2015-07-22 10:53:36','2015-07-22 10:53:36',27,1,0),('rony@ukitss.com','Pass@123','qwuz9',NULL,NULL,NULL,NULL,0,0,'2015-05-18 10:29:53','2015-05-18 10:55:45',14,1,1),('roshni@ukitss.com','Pass@123','j728b',NULL,NULL,NULL,8,0,0,'2015-06-23 06:35:15','2015-06-23 09:13:36',NULL,1,1),('stacy@ukitss.com','Pass@123','rqlm6',NULL,NULL,2,NULL,1,0,'2015-04-29 13:22:06','2015-04-29 13:22:06',NULL,1,1),('steav@ukitss.com','Pass@123','erzz1',NULL,NULL,NULL,NULL,0,0,'2015-05-12 09:19:28','2015-05-12 09:25:37',12,1,1),('superadmin@ukitss.com','Pass@123',NULL,1,NULL,NULL,NULL,0,0,'2015-03-27 06:05:15','2015-03-27 06:06:18',NULL,1,1),('superduper@ukitss.com','Pass@123','hwu2j',NULL,5,NULL,NULL,0,0,'2015-05-12 06:16:53','2015-05-12 06:22:58',NULL,1,1),('tailor@ukitss.com','Pass@123','032l3',NULL,NULL,NULL,NULL,0,0,'2015-05-12 09:52:03','2015-05-12 09:52:03',13,1,1),('tehknologik@hotmail.com','Pass@123','rm0oc',NULL,NULL,3,NULL,0,0,'2015-05-07 00:42:29','2015-05-07 00:42:29',NULL,1,1),('testadmin@ukitss.com','o80ys','fdi1u',NULL,6,NULL,NULL,0,0,'2015-05-21 06:57:49','2015-05-21 06:57:49',NULL,1,0),('Thomas@ukitss.com','Pass@123','fks90',NULL,NULL,NULL,NULL,0,0,'2015-05-11 08:48:35','2015-05-11 08:48:35',9,1,1),('tom@ukitss.com','ctecx','wjxo0',NULL,NULL,8,NULL,0,0,'2015-05-22 05:25:01','2015-05-22 05:25:01',NULL,1,0),('tommy@ukitss.com','Pass@123','ev12d',NULL,NULL,NULL,NULL,0,0,'2015-04-30 12:58:15','2015-04-30 12:58:15',5,1,1),('tony@ukitss.com','4q7fa','a5yoa',NULL,8,NULL,NULL,0,0,'2015-05-22 08:42:15','2015-05-22 08:42:15',NULL,1,0),('vicky@ukitss.com','sz8is','msgdg',NULL,NULL,NULL,NULL,0,0,'2015-08-26 05:10:19','2015-08-26 05:10:19',28,1,0),('wasim@ukitss.com','Pass@123','x9pym',NULL,NULL,NULL,4,1,0,'2015-05-11 08:49:29','2015-05-11 08:49:29',NULL,1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rpms'
--

--
-- Dumping routines for database 'rpms'
--
/*!50003 DROP FUNCTION IF EXISTS `changeDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `changeDate`() RETURNS int(11)
BEGIN

DECLARE v_finished INTEGER DEFAULT 0;
DECLARE v_id INTEGER DEFAULT 0;
DECLARE v_date datetime default current_timestamp;

DEClARE email_cursor CURSOR FOR
SELECT id FROM patientphysiologicaldata where patientMRid='1990' and readingFor=1 order by id desc ;
 
-- declare NOT FOUND handler
DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET v_finished = 1;
 
OPEN email_cursor;
 
get_email: LOOP
 
FETCH email_cursor INTO v_id;
 
IF v_finished = 1 THEN
LEAVE get_email;
END IF;

set v_date = (select DATE_SUB(v_date ,INTERVAL 350 minute));

update patientphysiologicaldata set deviceTime = v_date where id = v_id;
 
END LOOP get_email;
 
CLOSE email_cursor;

RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_patient_with_problematic_doc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_patient_with_problematic_doc`(IN dId INT)
BEGIN
		
Drop temporary table if exists demo;
	create temporary table demo
	SELECT * FROM patientphysiologicaldata where 
	measurementtype='blood sugar' 
	 and sugervalue >glucoseMax
	 or sugervalue <glucoseMin 
	and measurementtype='blood pressure' 
	 and pressuresystolic >bloodPressureMax
	 or pressuresystolic <bloodPressureMin;

	select 
	demo.id, 
	demo.patientMRid ,
	demo.readingFor ,
	demo.sugervalue ,
	demo.pressuresystolic ,
	demo.pressurediastolic, 
	demo.rdata ,
	demo.measurementtype,
	demo.units,
	demo.devicetype,
	demo.devicebrandmodel,
	demo.devicenetworkaddress,
	demo.deviceID,
	demo.deviceTime,
	demo.ReceivedDateTime,
	demo.fstate,
	demo.reviewerType,
	demo.docId,
	demo.nurseId,
	demo.isDeleted ,
	demo.glucoseMax,
	demo.glucoseMin,
	demo.bloodPressureMax,
	demo.bloodPressureMin,
	CONCAT(patient.firstname,' ',patient.lastname) as patient_name
	from demo 
	inner join patient on demo.patientMRid=patient.mr_number;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_patient_with_problematic_nurse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_patient_with_problematic_nurse`(IN nurId INT)
BEGIN
	
	Drop temporary table if exists demo;
	create temporary table demo
	SELECT * FROM patientphysiologicaldata where patientMRid IN 
	(select mr_number from patient where nurseID=nurId) and measurementtype='blood sugar' 
	 and sugervalue >glucoseMax
	 or sugervalue <glucoseMin 
	and measurementtype='blood pressure' 
	 and pressuresystolic >bloodPressureMax
	 or pressuresystolic <bloodPressureMin;


	select 
	demo.id, 
	demo.patientMRid ,
	demo.readingFor ,
	demo.sugervalue ,
	demo.pressuresystolic ,
	demo.pressurediastolic, 
	demo.rdata ,
	demo.measurementtype,
	demo.units,
	demo.devicetype,
	demo.devicebrandmodel,
	demo.devicenetworkaddress,
	demo.deviceID,
	demo.deviceTime,
	demo.ReceivedDateTime,
	demo.fstate,
	demo.reviewerType,
	demo.docId,
	demo.nurseId,
	demo.isDeleted ,
	demo.glucoseMax,
	demo.glucoseMin,
	demo.bloodPressureMax,
	demo.bloodPressureMin,
	CONCAT(patient.firstname,' ',patient.lastname) as patient_name
	from demo 
	inner join patient on demo.patientMRid=patient.mr_number;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_patient_with_problematic_patient_AllPoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_patient_with_problematic_patient_AllPoint`(IN patient INT)
BEGIN
		
	Drop temporary table if exists demo;
	create temporary table demo
	SELECT * FROM patientphysiologicaldata   where patientMRid IN 
	(select mr_number from patient where id=patient) ;


	select 
	demo.id, 
	demo.patientMRid ,
	demo.readingFor ,
	demo.sugervalue ,
	demo.pressuresystolic ,
	demo.pressurediastolic, 
	demo.rdata ,
	demo.measurementtype,
	demo.units,
	demo.devicetype,
	demo.devicebrandmodel,
	demo.devicenetworkaddress,
	demo.deviceID,
	demo.deviceTime,
	demo.ReceivedDateTime,
	demo.fstate,
	demo.reviewerType,
	demo.docId,
	demo.nurseId,
	demo.isDeleted ,
	demo.glucoseMax,
	demo.glucoseMin,
	demo.bloodPressureMax,
	demo.bloodPressureMin,
	CONCAT(patient.firstname,' ',patient.lastname) as patient_name
	from demo 
	inner join patient  on demo.patientMRid=patient.mr_number order by demo.deviceTime desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_patient_with_problematic_patient_problematic_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_patient_with_problematic_patient_problematic_data`(IN patient INT)
BEGIN
		
	Drop temporary table if exists demo;
	create temporary table demo
	SELECT * FROM patientphysiologicaldata where patientMRid IN 
	(select mr_number from patient where id=patient) and (sugervalue >glucoseMax
	 or sugervalue <glucoseMin 
	 or pressuresystolic >bloodPressureMax
	 or pressurediastolic <bloodPressureMin);


	select 
	demo.id, 
	demo.patientMRid ,
	demo.readingFor ,
	demo.sugervalue ,
	demo.pressuresystolic ,
	demo.pressurediastolic, 
	demo.rdata ,
	demo.measurementtype,
	demo.units,
	demo.devicetype,
	demo.devicebrandmodel,
	demo.devicenetworkaddress,
	demo.deviceID,
	demo.deviceTime,
	demo.ReceivedDateTime,
	demo.fstate,
	demo.reviewerType,
	demo.docId,
	demo.nurseId,
	demo.isDeleted ,
	demo.glucoseMax,
	demo.glucoseMin,
	demo.bloodPressureMax,
	demo.bloodPressureMin,
	CONCAT(patient.firstname,' ',patient.lastname) as patient_name
	from demo 
	inner join patient on demo.patientMRid=patient.mr_number order by demo.deviceTime desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_admin_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_admin_dashboard`(IN _hcgID INT)
BEGIN
	
	DELETE FROM count;

	INSERT INTO count (id,patientCount,doctorCount,nurseCount,unAssignedPatientCount,blockedPatientCount,blockedNurseCount,blockedDoctorCount) select 
	(select 1) as id,
	(select count(*) from patient where  isDeleted='0' and hcgID=_hcgID) as patientCount,
	(select count(*) from doctor where  isDeleted='0' and hcgID=_hcgID) as doctorCount,
	(select count(*) from nurse where  isDeleted='0' and hcgID=_hcgID) as nurseCount,
	(select count(*) from patient where  hcgID=_hcgID  and isDeleted='0' and (docID is null or nurseID is null)) as unAssignedPatientCount,
    (select count(*) from users u join attempt atm join patient pt 
    on u.username=atm.username and pt.id=u.patientID   where u.enabled=0 and pt.hcgID=_hcgID
    and u.password_creation_status=1 and atm.attemp=3) as blockedPatientCount,
    
     (select count(*) from users u join attempt atm join nurse nr 
    on u.username=atm.username and nr.id=u.nurseID   where u.enabled=0 and nr.hcgID=_hcgID
    and u.password_creation_status=1 and atm.attemp=3) as blockedNurseCount,
    
     (select count(*) from users u join attempt atm join doctor dc 
    on u.username=atm.username and dc.id=u.docID   where u.enabled=0 and dc.hcgID=_hcgID
    and u.password_creation_status=1 and atm.attemp=3) as blockedDoctorCount;

	SELECT * FROM count;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_changed_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_changed_categories`(IN suger DOUBLE,IN pressure DOUBLE, IN hcgID INT)
BEGIN
		
    update patient set 

	bloodPresure=CAST(FORMAT(trim(bloodPresure)*pressure,2) AS DECIMAL(10,2)) ,
	bloodPresureMax=CAST(FORMAT(trim(bloodPresureMax)*pressure,2) AS DECIMAL(10,2)),
	bloodsugur= CAST(FORMAT(trim(bloodsugur)*suger,2) AS DECIMAL(10,2)),
	bloodsugurMax= CAST(FORMAT(trim(bloodsugurMax)*suger,2)AS DECIMAL(10,2)) 
 
	where bloodPresure is not null  and bloodPresureMax  is not null  and 
	bloodsugur  is not null  and bloodsugurMax  is not null and 
	hcgID=hcgID ;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_changed_categories_pressure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_changed_categories_pressure`(IN pressure DOUBLE, IN hcgID INT)
BEGIN
		
	
    
  
	update patientphysiologicaldata  set
    pressurediastolic=CAST(FORMAT(trim(pressurediastolic)*pressure,2) AS DECIMAL(10,2)),
	pressuresystolic=CAST(FORMAT(trim(pressuresystolic)*pressure,2) AS DECIMAL(10,2)),
    bloodPressureMin=CAST(FORMAT(trim(bloodPressureMin)*pressure,2) AS DECIMAL(10,2)),
    bloodPressureMax=CAST(FORMAT(trim(bloodPressureMax)*pressure,2) AS DECIMAL(10,2))
    
    where pressurediastolic is not null  and pressuresystolic  is not null  and  sugervalue is null and
     patientMRid in (select mr_number from patient where hcgId=hcgID );
	-- select * from patient;
   
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_changed_categories_suger` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_changed_categories_suger`(IN suger DOUBLE, IN hcgID INT)
BEGIN
		
	
    
     update patientphysiologicaldata  set
	sugervalue=CAST(FORMAT(trim(sugervalue)*suger,2) AS DECIMAL(10,2)),
    glucoseMin=CAST(FORMAT(trim(glucoseMin)*suger,2)AS DECIMAL(10,2)),
    glucoseMax=CAST(FORMAT(trim(glucoseMax)*suger,2) AS DECIMAL(10,2)) 
    
	where sugervalue  is not null  and 
	patientMRid in (select mr_number from patient where hcgId=hcgID );
    
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_doctor_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_doctor_dashboard`(IN dId INT)
BEGIN
	DELETE FROM count;

	Drop temporary Table if exists physologic_data;

	Create temporary table physologic_data
	SELECT * FROM patientphysiologicaldata where patientMRid IN 
	(select mr_number from patient where docID=dId);


	INSERT INTO count (id,doc1,doc2,doc3,doc4,doc5,doc6) select 
	(select 1) as id,
	(select count(*) from patient where docID =dId and status='0' and isDeleted='0') as doc1,

	(SELECT count(*) from(SELECT patientMRid  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number join doctor d on p.docID = d.id where pd.isDeleted=0 and pd.docid is null and d.id=dId group by patientMRid) a) as doc2,

	(SELECT count(*) FROM message where nurseID in
	(select nurseID from patient where docID=dId) and isSentNures is not null and isReadDoc='0') as doc3,

	(SELECT count(*) FROM message where patientID in 
	(select id from patient where docID=dId) and isSentPatient is not null and isReadDoc='0') as doc4,

	(select count(*) FROM (SELECT p.*  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number  join doctor d on p.docID = d.id where  (pd.sugervalue>pd.glucoseMax or pd.sugervalue<pd.glucoseMin or pd.pressuresystolic>pd.bloodPressureMax or pd.pressuresystolic<pd.bloodPressureMin) and pd.docId is null and pd.isdeleted=0 and d.id=dId group by patientMRid )a) as doc5,
	/*(select count(*) from physologic_data where 
	 sugervalue >glucoseMax
	 or sugervalue <glucoseMin 
	 or pressuresystolic >bloodPressureMax
	 or pressuresystolic <bloodPressureMin)
	 as doc5,*/

	(select count(*) from patient where hcgID=(select hcgID from doctor where id=dId) and status='0' and isDeleted='0') as doc6;

	SELECT * FROM count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_nurse_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_nurse_dashboard`(IN nurId INT)
BEGIN
	DELETE FROM count;

	Drop temporary Table if exists physologic;

	Create temporary table physologic
	SELECT * FROM patientphysiologicaldata where patientMRid IN 
	(select mr_number from patient where nurseID=nurId);

	INSERT INTO count 
	(id,nursedata1,nursedata2,nursedata3,nursedata4,nursedata5,nursedata6,nursedata7,nursedata8,nursedata9,nursedata10) 
	select 
	(select 1) as id,


	(select count(*) from patient where nurseID =nurId and status='0' and isDeleted='0') as nursedata1,

	(SELECT count(*) FROM(SELECT patientMRid  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number join nurse n on p.nurseID = n.id where pd.isDeleted=0 and pd.nurseId is null and n.id=nurId group by patientMRid) a) as nursedata2,
	/*(SELECT count(*) FROM patientphysiologicaldata where patientMRid IN 
	(select mr_number from patient where nurseID=nurId) and nurseID is null and isDeleted='0') as nursedata2,*/

	(SELECT count(*) FROM message where docID in
	(select docID from patient where nurseID=nurId) and isSentDoc is not null and isReadNurse='0') as nursedata3,


	(SELECT count(*) FROM message where patientID in 
	(select id from patient where nurseID=nurId) and isSentPatient is not null and isReadNurse='0')as nursedata4,

(select count(*) FROM (SELECT patientMRid  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number  join nurse n on p.nurseID = n.id where  (pd.sugervalue>pd.glucoseMax or pd.sugervalue<pd.glucoseMin or pd.pressuresystolic>pd.bloodPressureMax or pd.pressuresystolic<pd.bloodPressureMin)and pd.nurseId is null and pd.isdeleted=0 and n.id=nurId group by patientMRid )a) as nursedata5,
/*	(select count(*) from physologic where 
	 sugervalue >glucoseMax
	 or sugervalue <glucoseMin 
	 or pressuresystolic >bloodPressureMax
	 or pressuresystolic <bloodPressureMin) as nursedata5,*/


	(select count(*) from patient where hcgID=(select hcgID from nurse where id=nurId) and status='0' and isDeleted='0') as nursedata6,
	0 as nursedata7,
	0 as nursedata8,
	0 as nursedata9,
	0 as nursedata10;

	SELECT * FROM count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_patient_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_patient_dashboard`(IN _hcgID INT,IN _patientID INT,IN _docID INT,IN _nurseID INT)
BEGIN
		
	DELETE FROM count;

	Drop temporary Table if exists physo;
	Drop temporary Table if exists physo1;

	Create temporary table physo
	SELECT * FROM patientphysiologicaldata where patientMRid IN 
	(select mr_number from patient where id=_patientID);

	Create temporary table physo1
	SELECT * FROM patientphysiologicaldata where patientMRid IN 
	(select mr_number from patient where id=_patientID);


	INSERT INTO count (id,doctorMsg,nurseMsg,patientData,patientProb) select 
	(select 1) as id,
	-- (SELECT count(*) FROM rpms.message where docID=_docID and patientID=_patientID and nurseID is null and isDeleted='0' and hcgID=_hcgID) as doctorMsg,
	-- (SELECT count(*) FROM rpms.message where nurseID=_nurseID and patientID=_patientID and docID is null and isDeleted='0' and hcgID=_hcgID) as nurseMsg;
	
	(SELECT count(*) FROM message where patientID=_patientID and nurseID is null and isReadNurse is null and isReadPatient='0' and isDeleted='0' and hcgID=_hcgID) as doctorMsg,
	(SELECT count(*) FROM message where patientID=_patientID and docID is null and isReadDoc is null and  isReadPatient='0' and isDeleted='0' and hcgID=_hcgID) as nurseMsg,
	(select count(*) from physo) as patientData ,
	
	(select count(*) from physo1 where 
	 sugervalue >glucoseMax
	 or sugervalue <glucoseMin 
	 or pressuresystolic >bloodPressureMax
	 or pressurediastolic <bloodPressureMin) as patientProb;
	

	SELECT * FROM count;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rpms_superAdmin_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpms_superAdmin_dashboard`(IN aID int)
BEGIN

	DELETE FROM count;

	INSERT INTO count (id,hcgCount,doctorCount,nurseCount,patientCount,blockedUserCount) select 
	(select 1) as id,
	(select count(*) from hcgorgnization where  isDeleted='0' and adminID=aID) as hcgCount,
	(select count(*) from doctor where  isDeleted='0' ) as doctorCount,
	(select count(*) from nurse where  isDeleted='0' ) as nurseCount,
	(select count(*) from patient where  isDeleted='0' ) as patientCount,
    (select count(*) from users u join attempt atm join hcgorgnization hcg on u.username=atm.username  and u.hcgID=hcg.id where u.enabled=0  and u.password_creation_status=1 and atm.attemp=3) as blockedUserCount
	;

	SELECT * FROM count;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-28 18:03:39
