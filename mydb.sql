CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.36-log

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
-- Table structure for table `acknowledges`
--

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `User_UserID` int(11) NOT NULL,
  `Message_MessageID` int(11) NOT NULL,
  PRIMARY KEY (`User_UserID`,`Message_MessageID`),
  KEY `fk_User_has_Message_Message1_idx` (`Message_MessageID`),
  KEY `fk_User_has_Message_User1_idx` (`User_UserID`),
  CONSTRAINT `fk_User_has_Message_Message1` FOREIGN KEY (`Message_MessageID`) REFERENCES `message` (`MessageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Message_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
INSERT INTO `acknowledges` VALUES (10,1),(9,2),(8,3),(7,4),(6,5),(5,6),(4,7),(3,8),(2,9),(1,10),(10,11),(9,12),(8,13),(7,14),(6,15),(5,16),(4,17),(3,18),(2,19),(1,20);
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appdetails`
--

DROP TABLE IF EXISTS `appdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appdetails` (
  `User_UserID` int(11) NOT NULL,
  `AppID` int(11) NOT NULL,
  PRIMARY KEY (`User_UserID`,`AppID`),
  KEY `fk_AppDetails_User1_idx` (`User_UserID`),
  CONSTRAINT `fk_AppDetails_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appdetails`
--

LOCK TABLES `appdetails` WRITE;
/*!40000 ALTER TABLE `appdetails` DISABLE KEYS */;
INSERT INTO `appdetails` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `appdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attaches`
--

DROP TABLE IF EXISTS `attaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attaches` (
  `User_UserID` int(11) NOT NULL,
  `ThreadAttachment_ThreadAttachmentID` int(11) NOT NULL,
  PRIMARY KEY (`User_UserID`,`ThreadAttachment_ThreadAttachmentID`),
  KEY `fk_ThreadAttachment_has_User_User1_idx` (`User_UserID`),
  KEY `fk_ThreadAttachment_has_User_ThreadAttachment1_idx` (`ThreadAttachment_ThreadAttachmentID`),
  CONSTRAINT `fk_ThreadAttachment_has_User_ThreadAttachment1` FOREIGN KEY (`ThreadAttachment_ThreadAttachmentID`) REFERENCES `threadattachment` (`ThreadAttachmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ThreadAttachment_has_User_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attaches`
--

LOCK TABLES `attaches` WRITE;
/*!40000 ALTER TABLE `attaches` DISABLE KEYS */;
INSERT INTO `attaches` VALUES (7,4),(7,5),(8,1),(10,2),(10,3);
/*!40000 ALTER TABLE `attaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates`
--

DROP TABLE IF EXISTS `creates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creates` (
  `User_UserID` int(11) NOT NULL,
  `Thread_ThreadID` int(11) NOT NULL,
  PRIMARY KEY (`User_UserID`,`Thread_ThreadID`),
  KEY `fk_Thread_has_User_User1_idx` (`User_UserID`),
  KEY `fk_Thread_has_User_Thread1_idx` (`Thread_ThreadID`),
  CONSTRAINT `fk_Thread_has_User_Thread1` FOREIGN KEY (`Thread_ThreadID`) REFERENCES `thread` (`ThreadID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Thread_has_User_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates`
--

LOCK TABLES `creates` WRITE;
/*!40000 ALTER TABLE `creates` DISABLE KEYS */;
INSERT INTO `creates` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(5,10);
/*!40000 ALTER TABLE `creates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `JobID` int(11) NOT NULL,
  `JobName` varchar(45) DEFAULT NULL,
  `jobdescription` longtext,
  `Expiry` date DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Social Worker','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.','2018-03-21','2018-02-15 16:00:00'),(2,'Administrative Officer','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.','2018-03-07','2018-02-25 16:00:00'),(3,'Sales Associate','Fusce consequat. Nulla nisl. Nunc nisl.','2018-03-08','2018-02-13 16:00:00'),(4,'Marketing Assistant','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.','2018-03-15','2018-02-13 16:00:00'),(5,'Data Coordiator','Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.','2018-03-03','2018-02-14 16:00:00'),(6,'Pharmacist','In congue. Etiam justo. Etiam pretium iaculis justo.','2018-03-18','2018-02-24 16:00:00'),(7,'Dental Hygienist','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.','2018-03-25','2018-02-26 16:00:00'),(8,'Database Administrator','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.','2018-03-25','2018-02-09 16:00:00'),(9,'Structural Engineer','In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.','2018-03-02','2018-02-22 16:00:00'),(10,'Registered Nurse','Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.','2018-03-11','2018-02-14 16:00:00'),(11,'Quality Engineer','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.','2018-03-29','2018-02-13 16:00:00'),(12,'Dental Hygienist','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.','2018-03-28','2018-02-26 16:00:00'),(13,'Accountant III','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.','2018-03-09','2018-02-04 16:00:00'),(14,'Information Systems Manager','Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.','2018-03-23','2018-02-06 16:00:00'),(15,'Compensation Analyst','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.','2018-03-27','2018-01-31 16:00:00'),(16,'Chief Design Engineer','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.','2018-03-14','2018-02-21 16:00:00'),(17,'Help Desk Technician','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.','2018-03-01','2018-02-17 16:00:00'),(18,'Structural Analysis Engineer','Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2018-03-12','2018-02-20 16:00:00'),(19,'Civil Engineer','Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.','2018-03-21','2018-02-24 16:00:00'),(20,'Senior Cost Accountant','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.','2018-03-12','2018-02-20 16:00:00');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapply`
--

DROP TABLE IF EXISTS `jobapply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobapply` (
  `AppDetails_User_UserID` int(11) NOT NULL,
  `AppDetails_AppID` int(11) NOT NULL,
  `Job_JobID` int(11) NOT NULL,
  `AttachFile` blob,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`AppDetails_User_UserID`,`AppDetails_AppID`,`Job_JobID`),
  KEY `fk_JobApply_Job1_idx` (`Job_JobID`),
  CONSTRAINT `fk_JobApply_AppDetails1` FOREIGN KEY (`AppDetails_User_UserID`, `AppDetails_AppID`) REFERENCES `appdetails` (`User_UserID`, `AppID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_JobApply_Job1` FOREIGN KEY (`Job_JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapply`
--

LOCK TABLES `jobapply` WRITE;
/*!40000 ALTER TABLE `jobapply` DISABLE KEYS */;
INSERT INTO `jobapply` VALUES (1,1,10,'','2018-02-09 16:00:00'),(1,1,20,'','2018-01-31 16:00:00'),(2,2,9,'','2018-02-13 16:00:00'),(2,2,19,'','2018-02-12 16:00:00'),(3,3,8,'','2018-02-26 16:00:00'),(3,3,18,'','2018-02-15 16:00:00'),(4,4,7,'','2018-02-04 16:00:00'),(4,4,17,'','2018-02-15 16:00:00'),(5,5,6,'','2018-02-02 16:00:00'),(5,5,16,'','2018-02-15 16:00:00'),(6,6,5,'','2018-02-14 16:00:00'),(6,6,15,'','2018-02-25 16:00:00'),(7,7,4,'','2018-02-10 16:00:00'),(7,7,14,'','2018-02-16 16:00:00'),(8,8,3,'','2018-02-16 16:00:00'),(8,8,13,'','2018-02-16 16:00:00'),(9,9,2,'','2018-01-31 16:00:00'),(9,9,12,'','2018-02-01 16:00:00'),(10,10,1,'','2018-02-16 16:00:00'),(10,10,11,'','2018-02-13 16:00:00');
/*!40000 ALTER TABLE `jobapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `MessageID` int(11) NOT NULL,
  `Subject` varchar(45) DEFAULT NULL,
  `text` text,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Fabaceae','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.','2018-01-31 16:00:00'),(2,'Physciaceae','Sed ante. Vivamus tortor. Duis mattis egestas metus.','2018-02-12 16:00:00'),(3,'Asclepiadaceae','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.','2018-02-15 16:00:00'),(4,'Fabaceae','Sed ante. Vivamus tortor. Duis mattis egestas metus.','2018-02-15 16:00:00'),(5,'Fontinalaceae','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.','2018-02-15 16:00:00'),(6,'Rosaceae','Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.','2018-02-25 16:00:00'),(7,'Orchidaceae','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.','2018-02-16 16:00:00'),(8,'Rubiaceae','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.','2018-02-16 16:00:00'),(9,'Rosaceae','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.','2018-02-01 16:00:00'),(10,'Polygonaceae','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.','2018-02-13 16:00:00'),(11,'Piperaceae','Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2018-02-09 16:00:00'),(12,'Liliaceae','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.','2018-02-13 16:00:00'),(13,'Fabaceae','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.','2018-02-26 16:00:00'),(14,'Micareaceae','Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.','2018-02-04 16:00:00'),(15,'Verrucariaceae','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.','2018-02-02 16:00:00'),(16,'Saxifragaceae','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.','2018-02-14 16:00:00'),(17,'Fabaceae','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.','2018-02-10 16:00:00'),(18,'Asteraceae','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.','2018-02-16 16:00:00'),(19,'Rubiaceae','In congue. Etiam justo. Etiam pretium iaculis justo.','2018-01-31 16:00:00'),(20,'Collemataceae','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.','2018-02-16 16:00:00');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participates`
--

DROP TABLE IF EXISTS `participates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participates` (
  `User_UserID` int(11) NOT NULL,
  `ThreadMessage_ThreadMessageID` int(11) NOT NULL,
  PRIMARY KEY (`User_UserID`,`ThreadMessage_ThreadMessageID`),
  KEY `fk_ThreadMessage_has_User_User1_idx` (`User_UserID`),
  KEY `fk_ThreadMessage_has_User_ThreadMessage1_idx` (`ThreadMessage_ThreadMessageID`),
  CONSTRAINT `fk_ThreadMessage_has_User_ThreadMessage1` FOREIGN KEY (`ThreadMessage_ThreadMessageID`) REFERENCES `threadmessage` (`ThreadMessageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ThreadMessage_has_User_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participates`
--

LOCK TABLES `participates` WRITE;
/*!40000 ALTER TABLE `participates` DISABLE KEYS */;
INSERT INTO `participates` VALUES (1,3),(1,4),(4,9),(4,13),(6,1),(6,2),(7,15),(7,16),(8,12),(10,13),(10,14);
/*!40000 ALTER TABLE `participates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `User_UserID` int(11) NOT NULL,
  `Job_JobID` int(11) NOT NULL,
  PRIMARY KEY (`User_UserID`,`Job_JobID`),
  KEY `fk_User_has_Job_Job1_idx` (`Job_JobID`),
  KEY `fk_User_has_Job_User1_idx` (`User_UserID`),
  CONSTRAINT `fk_User_has_Job_Job1` FOREIGN KEY (`Job_JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Job_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(1,11),(2,12),(3,13),(4,14),(5,15),(6,16),(7,17),(8,18),(9,19),(10,20);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sends`
--

DROP TABLE IF EXISTS `sends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sends` (
  `User_UserID` int(11) NOT NULL,
  `Message_MessageID` int(11) NOT NULL,
  PRIMARY KEY (`Message_MessageID`,`User_UserID`),
  KEY `fk_Sends_User1_idx` (`User_UserID`),
  CONSTRAINT `fk_Sends_Message1` FOREIGN KEY (`Message_MessageID`) REFERENCES `message` (`MessageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sends_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sends`
--

LOCK TABLES `sends` WRITE;
/*!40000 ALTER TABLE `sends` DISABLE KEYS */;
INSERT INTO `sends` VALUES (1,1),(1,11),(2,2),(2,12),(3,3),(3,13),(4,4),(4,14),(5,5),(5,15),(6,6),(6,16),(7,7),(7,17),(8,8),(8,18),(9,9),(9,19),(10,10),(10,20);
/*!40000 ALTER TABLE `sends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `ThreadID` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ThreadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (1,'Java Programming','2018-02-15 16:00:00'),(2,'Unity 3D','2018-02-25 16:00:00'),(3,'Mobile IOS','2018-02-13 16:00:00'),(4,'Swift','2018-02-13 16:00:00'),(5,'Ruby on Rails','2018-02-14 16:00:00'),(6,'Big Data','2018-02-24 16:00:00'),(7,'Predictive Analytics','2018-02-26 16:00:00'),(8,'Machine Learning','2018-02-09 16:00:00'),(9,'JavaScript Frameworks','2018-02-22 16:00:00'),(10,'Bootstrap','2018-02-14 16:00:00');
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threadattachment`
--

DROP TABLE IF EXISTS `threadattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threadattachment` (
  `ThreadAttachmentID` int(11) NOT NULL,
  `Content` blob,
  `ThreadMessage_ThreadMessageID` int(11) NOT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ThreadAttachmentID`),
  KEY `fk_ThreadAttachment_ThreadMessage1_idx` (`ThreadMessage_ThreadMessageID`),
  CONSTRAINT `fk_ThreadAttachment_ThreadMessage1` FOREIGN KEY (`ThreadMessage_ThreadMessageID`) REFERENCES `threadmessage` (`ThreadMessageID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threadattachment`
--

LOCK TABLES `threadattachment` WRITE;
/*!40000 ALTER TABLE `threadattachment` DISABLE KEYS */;
INSERT INTO `threadattachment` VALUES (1,'',12,'0000-00-00 00:00:00'),(2,'',13,'0000-00-00 00:00:00'),(3,'',14,'0000-00-00 00:00:00'),(4,'',15,'0000-00-00 00:00:00'),(5,'',16,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `threadattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threadmessage`
--

DROP TABLE IF EXISTS `threadmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threadmessage` (
  `ThreadMessageID` int(11) NOT NULL,
  `Content` longtext,
  `Thread_ThreadID` int(11) NOT NULL,
  `CreatedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ThreadMessageID`),
  KEY `fk_ThreadMessage_Thread1_idx` (`Thread_ThreadID`),
  CONSTRAINT `fk_ThreadMessage_Thread1` FOREIGN KEY (`Thread_ThreadID`) REFERENCES `thread` (`ThreadID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threadmessage`
--

LOCK TABLES `threadmessage` WRITE;
/*!40000 ALTER TABLE `threadmessage` DISABLE KEYS */;
INSERT INTO `threadmessage` VALUES (1,'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\r\n\r\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',1,'2018-02-15 16:00:00'),(2,'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\r\n\r\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',2,'2018-02-25 16:00:00'),(3,'Phasellus in felis. Donec semper sapien a libero. Nam dui.\r\n\r\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.',3,'2018-02-13 16:00:00'),(4,'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\r\n\r\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\r\n\r\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',4,'2018-02-13 16:00:00'),(5,'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',5,'2018-02-14 16:00:00'),(6,'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\r\n\r\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',6,'2018-02-24 16:00:00'),(7,'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\r\n\r\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',7,'2018-02-26 16:00:00'),(8,'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\r\n\r\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\r\n\r\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',8,'2018-02-09 16:00:00'),(9,'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\r\n\r\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\r\n\r\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',9,'2018-02-22 16:00:00'),(10,'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\r\n\r\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',10,'2018-02-14 16:00:00'),(11,'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',1,'2018-02-16 16:00:00'),(12,'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\r\n\r\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',2,'2018-02-26 16:00:00'),(13,'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',3,'2018-02-14 16:00:00'),(14,'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',4,'2018-02-14 16:00:00'),(15,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.',5,'2018-02-15 16:00:00'),(16,'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\r\n\r\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\r\n\r\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',6,'2018-02-25 16:00:00'),(17,'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\r\n\r\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',7,'2018-02-27 16:00:00'),(18,'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',8,'2018-02-10 16:00:00'),(19,'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\r\n\r\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\r\n\r\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',9,'2018-02-23 16:00:00'),(20,'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\r\n\r\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\r\n\r\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.',10,'2018-02-15 16:00:00');
/*!40000 ALTER TABLE `threadmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `AccountCreationTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(45) DEFAULT 'Software Programmer',
  `Token` varchar(45) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tom','Lin','Singapore','Singapore','tomlin190@hotmail.com','626d140e2406fdd4e2d3d7fe09043e4d','2018-03-25 12:13:08','Administrator',NULL,1),(2,'Timothy','Tan','Germany','Berlin','timothy@tan.com','8e049de7deae68943e4fd3b09933818f','2018-03-25 12:13:08','Software Programmer',NULL,1),(3,'Corinne','Ong','Germany','Hamburg','corinne@ong.com','281aa0f94f4643b4f4624d21c55b248e','2018-03-25 12:13:08','Software Programmer',NULL,1),(4,'Nathan','Liew','France','Paris','nathan@liew.com','fa1df92532b16addb8c4a9296f75f4b1','2018-03-25 12:13:08','Software Programmer',NULL,1),(5,'Joe','Tan','Malaysia','Kuala Lumpur','joe@tan.com','055e65d292efe9ab9c18039f47b9f243','2018-03-25 12:13:08','Software Programmer',NULL,1),(6,'Marcus','Tam','Malaysia','Johor Bahru','marcus@tam.com','1531a86a633be6942b8e2aa01ae3372f','2018-03-25 12:13:08','Software Programmer',NULL,1),(7,'Shaun','Maloney','Ireland','Dublin','shaun@maloney.com','06f74d10d936948e0b4341c2a00f97e2','2018-03-25 12:13:08','Software Programmer',NULL,1),(8,'Meryl','Davis','USA','New York City','meryl@davis.com','faf156abe326d5868bd0a5609e073621','2018-03-25 12:13:08','Software Programmer',NULL,1),(9,'Louisa','Lam','South Korea','Seoul','louisa@lam.com','ca4f48dba33dcbeee95f98e3c366f71a','2018-03-25 12:13:08','Software Programmer',NULL,1),(10,'Derek','Ong','USA','Seattle','derek@ong.com','7f18f10643d3caa4f4153e67a14feffe','2018-03-25 12:13:08','Software Programmer',NULL,1),(11,'Mel','Cheong','Singapore','Singapore','mel@cheong.com','0f70320050d50603956e6e90b6d22c29','2018-04-01 04:21:04','Software Programmer',NULL,0),(12,'John','Doe','England','London','john@doe.com','1bf25b04bc57e7a84d5cca410e6b6c28','2018-04-01 04:22:33','Software Programmer',NULL,0),(13,'James','Darwin','Germany','Frankfurt','james@darwin.com','7542115a708ab52ecfbe148d82cbf7af','2018-04-01 04:23:22','Software Programmer',NULL,0),(14,'Danny','Lim','South Korea','Seoul','danny@lim.com','0b7660a852c2bf0e46ae634b775084d6','2018-04-01 04:24:15','Software Programmer',NULL,0),(15,'Joe','Heng','USA','California','joe@heng.com','1e01a48b60e5de7745433901a5b1bf71','2018-04-01 04:25:27','Software Programmer',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_work
AFTER INSERT ON user FOR EACH ROW
BEGIN
	DECLARE max_userjobid INTEGER;
    SET @max_userjobid := (SELECT(MAX(userjobid)) FROM userjob);
    INSERT INTO userjob(userjobid)
    VALUES (@max_userjobid + 1);
    INSERT INTO work
    VALUES (new.userid, @max_userjobid + 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `useredu`
--

DROP TABLE IF EXISTS `useredu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useredu` (
  `User_UserID` int(11) DEFAULT NULL,
  `HighestQualification` varchar(45) DEFAULT NULL,
  KEY `fk_UserEdu_User1_idx` (`User_UserID`),
  CONSTRAINT `fk_UserEdu_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useredu`
--

LOCK TABLES `useredu` WRITE;
/*!40000 ALTER TABLE `useredu` DISABLE KEYS */;
INSERT INTO `useredu` VALUES (1,'A Level'),(2,'O Level'),(3,'N Level'),(4,'A Level'),(5,'A Level'),(6,'O Level'),(7,'N Level'),(8,'A Level'),(9,'O Level'),(10,'N Level');
/*!40000 ALTER TABLE `useredu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userjob`
--

DROP TABLE IF EXISTS `userjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userjob` (
  `UserJobID` int(11) NOT NULL,
  `Occupation` varchar(45) DEFAULT NULL,
  `YearsOfExp` int(11) DEFAULT NULL,
  `Company` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserJobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userjob`
--

LOCK TABLES `userjob` WRITE;
/*!40000 ALTER TABLE `userjob` DISABLE KEYS */;
INSERT INTO `userjob` VALUES (1,'Software Engineer',2,'IBM'),(2,'Salesforce Consultant',3,'Nokia'),(3,'Network Architect',5,'Aodigy'),(4,'Game Developer',3,'IBM'),(5,'Software Engineer',3,'Nokia'),(6,'UI Designer',2,'Aodigy'),(7,'Mobile App Programmer',4,'IBM'),(8,NULL,NULL,'Facebook'),(9,NULL,NULL,'Facebook'),(10,NULL,NULL,'Aodigy'),(11,NULL,NULL,'IBM'),(12,NULL,NULL,'Google');
/*!40000 ALTER TABLE `userjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_threadswithoutmessages`
--

DROP TABLE IF EXISTS `vw_threadswithoutmessages`;
/*!50001 DROP VIEW IF EXISTS `vw_threadswithoutmessages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_threadswithoutmessages` AS SELECT 
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_userprofile`
--

DROP TABLE IF EXISTS `vw_userprofile`;
/*!50001 DROP VIEW IF EXISTS `vw_userprofile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_userprofile` AS SELECT 
 1 AS `UserID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Country`,
 1 AS `City`,
 1 AS `Email`,
 1 AS `Password`,
 1 AS `AccountCreationTime`,
 1 AS `Role`,
 1 AS `Company`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_yearsofexp`
--

DROP TABLE IF EXISTS `vw_yearsofexp`;
/*!50001 DROP VIEW IF EXISTS `vw_yearsofexp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_yearsofexp` AS SELECT 
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `YearsOfExp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `User_UserID` int(11) NOT NULL,
  `userjob_userjobid` int(11) NOT NULL,
  PRIMARY KEY (`User_UserID`,`userjob_userjobid`),
  KEY `fk_User_has_UserJob_UserJob1_idx` (`userjob_userjobid`),
  KEY `fk_User_has_UserJob_User1_idx` (`User_UserID`),
  CONSTRAINT `fk_User_has_UserJob_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_UserJob_UserJob1` FOREIGN KEY (`userjob_userjobid`) REFERENCES `userjob` (`UserJobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,1),(8,1),(2,2),(9,2),(3,3),(1,4),(4,4),(2,5),(5,5),(3,6),(6,6),(4,7),(7,7),(10,7),(11,8),(12,9),(13,10),(14,11),(15,12);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_userjob
AFTER DELETE ON work FOR EACH ROW
BEGIN
	DELETE FROM userjob
    WHERE userjob.userjobid = old.userjob_userjobid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_threadswithoutmessages`
--

/*!50001 DROP VIEW IF EXISTS `vw_threadswithoutmessages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_threadswithoutmessages` AS select `t`.`Title` AS `title` from (`thread` `t` left join `threadmessage` `m` on((`t`.`ThreadID` = `m`.`Thread_ThreadID`))) where isnull(`m`.`Thread_ThreadID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_userprofile`
--

/*!50001 DROP VIEW IF EXISTS `vw_userprofile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_userprofile` AS select `user`.`UserID` AS `UserID`,`user`.`FirstName` AS `FirstName`,`user`.`LastName` AS `LastName`,`user`.`Country` AS `Country`,`user`.`City` AS `City`,`user`.`Email` AS `Email`,`user`.`password` AS `Password`,`user`.`AccountCreationTime` AS `AccountCreationTime`,`user`.`role` AS `Role`,`userjob`.`Company` AS `Company` from ((`user` join `work` on((`user`.`UserID` = `work`.`User_UserID`))) join `userjob` on((`work`.`userjob_userjobid` = `userjob`.`UserJobID`))) where (`user`.`role` = 'software programmer') group by `user`.`UserID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_yearsofexp`
--

/*!50001 DROP VIEW IF EXISTS `vw_yearsofexp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_yearsofexp` AS select `u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,sum(`uj`.`YearsOfExp`) AS `YearsOfExp` from ((`user` `u` join `userjob` `uj`) join `work` `w`) where ((`u`.`UserID` = `w`.`User_UserID`) and (`w`.`userjob_userjobid` = `uj`.`UserJobID`)) group by `u`.`UserID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-01 18:15:23
