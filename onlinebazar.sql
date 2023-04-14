-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: newecomyashcart
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cartid` varchar(50) NOT NULL,
  `pid` varchar(50) DEFAULT NULL,
  `addedon` datetime,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartid`),
  KEY `pid` (`pid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cartid`) REFERENCES `cartidgenerate` (`cartid`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartidgenerate`
--

DROP TABLE IF EXISTS `cartidgenerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartidgenerate` (
  `cartid` varchar(50) NOT NULL,
  `mobile` char(10) DEFAULT NULL,
  `issuedate` datetime,
  `status` varchar(15) DEFAULT 'active',
  PRIMARY KEY (`cartid`),
  KEY `mobile` (`mobile`),
  CONSTRAINT `cartidgenerate_ibfk_1` FOREIGN KEY (`mobile`) REFERENCES `customer` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartidgenerate`
--

LOCK TABLES `cartidgenerate` WRITE;
/*!40000 ALTER TABLE `cartidgenerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartidgenerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` varchar(10) NOT NULL,
  `category_name` varchar(40) NOT NULL,
  `category_image` varchar(100) DEFAULT NULL,
  `gst` float DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('p1','electronic','productimage\\category_image1681285489656.jpg',5),('p2','cloth','productimage\\category_image1681285532721.jpg',50),('p3','shoes',NULL,60),('p4','dfddfd',NULL,60),('p5','dfddfdfdf',NULL,60),('p6','t-shirt',NULL,60),('p7','dfdd',NULL,60);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `email` varchar(200) NOT NULL,
  `mobile` char(10) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `registeron` date,
  `status` varchar(15) DEFAULT 'active',
  PRIMARY KEY (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `offercode` varchar(50) DEFAULT NULL,
  `subcategory_id` varchar(10) DEFAULT NULL,
  KEY `offercode` (`offercode`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`offercode`) REFERENCES `offers` (`offercode`),
  CONSTRAINT `discount_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `offercode` varchar(50) NOT NULL,
  `offername` varchar(50) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `flat_discount` float DEFAULT NULL,
  `status` varchar(10) DEFAULT 'active',
  PRIMARY KEY (`offercode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES ('O121A','Diwali Festivity','2023-04-20','2023-04-30',5,10,'');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_order`
--

DROP TABLE IF EXISTS `place_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_order` (
  `cart_id` varchar(10) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) DEFAULT NULL,
  `payment_date` datetime,
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `place_order_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cartid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_order`
--

LOCK TABLES `place_order` WRITE;
/*!40000 ALTER TABLE `place_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` varchar(50) NOT NULL,
  `retailer_id` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `available_quantity` int(11) DEFAULT NULL,
  `subcategory_id` varchar(10) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `retailer_id` (`retailer_id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`retailer_id`) REFERENCES `retailer_registration` (`retailer_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_description` (
  `pid` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `color` varchar(16) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `mfg` date DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `modelname` varchar(50) DEFAULT NULL,
  KEY `pid` (`pid`),
  CONSTRAINT `product_description_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailer_banking`
--

DROP TABLE IF EXISTS `retailer_banking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailer_banking` (
  `bankname` varchar(100) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `ifsc` varchar(50) DEFAULT NULL,
  `accountholeder_name` varchar(50) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer_banking`
--

LOCK TABLES `retailer_banking` WRITE;
/*!40000 ALTER TABLE `retailer_banking` DISABLE KEYS */;
/*!40000 ALTER TABLE `retailer_banking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailer_registration`
--

DROP TABLE IF EXISTS `retailer_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailer_registration` (
  `retailer_id` varchar(50) NOT NULL,
  `shopname` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `ownername` varchar(50) DEFAULT NULL,
  `registration_no` varchar(200) NOT NULL,
  `registration_doc` varchar(100) DEFAULT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `gst_no` varchar(40) DEFAULT NULL,
  `pan_no` char(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `pincode` char(6) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL CHECK (`status` in ('deactive','active','temproryclose')),
  `registeron` datetime,
  PRIMARY KEY (`retailer_id`),
  UNIQUE KEY `registration_no` (`registration_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailer_registration`
--

LOCK TABLES `retailer_registration` WRITE;
/*!40000 ALTER TABLE `retailer_registration` DISABLE KEYS */;
INSERT INTO `retailer_registration` VALUES ('R01','raju','121232','raju','wq1243239','12345671','productimage\\profile_photo1681371362334.jpg','89091',NULL,'indora','mp','indora','485003','raju@gmail.com','active','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `retailer_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleid` varchar(3) NOT NULL,
  `rolename` varchar(16) NOT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('r2','Admin'),('r1','clerk');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_assign`
--

DROP TABLE IF EXISTS `role_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_assign` (
  `id` varchar(40) NOT NULL,
  `roleid` varchar(3) NOT NULL,
  `assignedon` datetime,
  PRIMARY KEY (`id`,`roleid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `role_assign_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  CONSTRAINT `role_assign_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_assign`
--

LOCK TABLES `role_assign` WRITE;
/*!40000 ALTER TABLE `role_assign` DISABLE KEYS */;
INSERT INTO `role_assign` VALUES ('sanjeev121@gmail.com','r2','2023-04-12 12:59:22'),('saurabh121@gmail.com','r2','2023-04-12 12:58:33');
/*!40000 ALTER TABLE `role_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `category_id` varchar(10) DEFAULT NULL,
  `subcategory_id` varchar(10) NOT NULL,
  `subcategory_name` varchar(40) DEFAULT NULL,
  `subcategory_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  UNIQUE KEY `subcategory_name` (`subcategory_name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES ('p1','s1','phone','productimage\\subcategory_image1681286356932.jpg'),('p1','s2','chargar','productimage\\subcategory_image1681286412239.jpg');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` varchar(40) NOT NULL,
  `mobile` char(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `aadhar` char(12) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `pincode` char(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `aadhar` (`aadhar`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('sanjeev121@gmail.com','1234567890','sanjeevsingh@gmail.com','productimage\\photo1681287073125.jpg','23456789233','Satna','mp','Rewa','485001'),('saurabh121@gmail.com','1234567892','saurabhsingh@gmail.com','productimage\\photo1681287153527.jpg','23456789231','Bhopal','mp','satna','482002');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(40) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'deactive',
  `createdon` datetime,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('sanjeev121@gmail.com','sanjeevsingh','2345678','active','2023-04-12 07:10:53'),('saurabh121@gmail.com','saurabh','12345678','deactive','2023-04-12 12:44:09');
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

-- Dump completed on 2023-04-13 13:08:30
