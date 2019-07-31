-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: orderSystem
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catid` int(11) NOT NULL,
  `cat_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'colors'),(2,'erasors'),(3,'sharpeners'),(4,'pecils'),(5,'pens'),(6,'exam pads'),(7,'pencil box'),(8,'calculators'),(9,'files'),(10,'folders'),(11,'notebooks'),(12,'scissors'),(13,'glue'),(14,'papers'),(15,'staplers'),(16,'punching machines'),(17,'tools'),(18,'printing supplies'),(19,'school supplies'),(20,'boards');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cid` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `street` varchar(15) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Animesh Landge','animesh@gmail.com','Maharashtra','Mumbai','Borivali'),(2,'Soham Kotalvar','soham@gmail.com','Maharashtra','Nanded','Kalamandir'),(3,'Kunal Sachdev','kunal@gmail.com','Maharashtra','Nashik','Devlali'),(4,'Yash Jeswani','yash@gmail.com','Maharashtra','Pune','Katraj');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_selects_prod`
--

DROP TABLE IF EXISTS `order_selects_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_selects_prod` (
  `oid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amt` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `order_selects_prod_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `order_selects_prod_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_selects_prod`
--

LOCK TABLES `order_selects_prod` WRITE;
/*!40000 ALTER TABLE `order_selects_prod` DISABLE KEYS */;
INSERT INTO `order_selects_prod` VALUES (1,1,3,60),(1,10,2,20),(2,17,1,1000),(2,35,1,100),(3,22,2,60),(3,29,3,60),(4,12,1,50),(4,43,1,200),(5,15,2,100),(5,32,5,75);
/*!40000 ALTER TABLE `order_selects_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `total_amt` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_cust` (`cid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2019-07-10',80),(2,1,'2019-06-19',1045),(3,2,'2019-05-13',120),(4,3,'2019-06-11',250),(5,4,'2019-04-17',175);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `catid` (`catid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'crayons',100,1,20),(2,'water colors',50,1,40),(3,'pencil colors',200,1,30),(4,'big erasor',100,2,10),(5,'small erasor',100,2,5),(6,'dust collector sharpener',200,3,30),(7,'non dust collector sharpener',200,3,10),(8,'pencil with erasor',300,4,10),(9,'pencil without erasor',300,4,5),(10,'gel pen',300,5,10),(11,'ball pen',300,5,5),(12,'ink pen',300,5,50),(13,'transparent pad',100,6,50),(14,'non-transparent pad',100,6,100),(15,'Pouch',200,7,50),(16,'geometry box',50,7,100),(17,'scientific calculator',20,8,1000),(18,'nonscientific calculator',20,8,200),(19,'office file',50,9,20),(20,'project file',50,9,20),(21,'multiple section folder',50,10,50),(22,'single section folder',50,10,30),(23,'single line notebook',100,11,20),(24,'blank notebook',100,11,20),(25,'squared line notebook',100,11,20),(26,'paper scissor',200,12,50),(27,'cloth scissor',100,12,80),(28,'stick glue',200,13,10),(29,'fevicol glue',200,13,20),(30,'chart paper',200,14,15),(31,'tinted paper',200,14,15),(32,'butter paper',200,14,15),(33,'small stapler',150,15,30),(34,'big stapler',150,15,50),(35,'small punching machine',100,16,100),(36,'big punching machine',100,16,200),(37,'rounder',150,17,30),(38,'divider',150,17,30),(39,'printer ink',100,18,1000),(40,'printer paper',150,18,200),(41,'school bag',50,19,800),(42,'text books',300,19,100),(43,'white board',50,20,200),(44,'black board',50,20,200);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 13:06:57
