-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: shopapp
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL,
  `brand_email` varchar(50) DEFAULT NULL,
  `brand_phone_number` varchar(20) DEFAULT NULL,
  `brand_address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Apple','apple@gmail.com','0745962344','Apple Inc. One Apple Park Way, Cupertino, California'),(2,'Acer Việt Nam','acer.vietnam@gmail.com','0684937399','TPHCM: 585 – 587 Điện Biên Phủ, Phường 1, Q. 3, Hồ Chí Minh, Việt Nam'),(3,'ASUS - Hà Nội','asus.vietnam@gmail.com','0674893491','Viet Tower, 1 P. Thái Hà, Trung Liệt, Đống Đa, Hà Nội'),(4,'HP Việt Nam','hp.vietnam@gmail.com','(+84) 439350565','Phòng 102, Tháp B, Tầng 1, Tòa nhà Resco Tower, 521 Kim Mã, Quận Ba Đình'),(5,'DELL TP. HÀ NỘI','dell.vietnam@gmail.com','(+84) 04.37666666','Trần Anh (1174 Đường Láng/ 292 Tây Sơn'),(6,'GEARVN PC - Hà Nội','gearvn.vietnam@gmail.com','(+84) 02462979999','Số 4 ngõ 133 Thái Hà, P.Trung Liệt, Q.Đống Đa, Hà Nội'),(7,'PHÍM CHUỘT - GAMING GEAR','gamming.gear@gmail.com','(+84) 854389684','17 Hà Kế Tấn - Phương Liệt - Thanh Xuân - Hà Nội.'),(8,'Ram Máy Tính, Ram PC','hanoi.computer@gmail.com','(+84) 356793255','94 Nguyễn Văn Trỗi, Mộ Lao, Hà Đông, Hà Nội.');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Điện Thoại'),(2,'Lap Top'),(3,'Màn Hình'),(4,'Máy Tính (PC)'),(5,'Phụ Kiện'),(6,'Ram (PC)');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,'Em muốn mua trả góp thì bên mình có hỗ trợ và giao tận nơi hông ạ do em ở huyện','2024-10-12 15:00:00','2024-10-12 15:00:00'),(2,1,1,'Em muốn mua trả góp thì bên mình có hỗ trợ và giao tận nơi hông ạ do em ở huyện','2024-10-12 15:00:39','2024-10-12 15:00:39'),(3,1,1,'Em muốn mua trả góp thì bên mình có hỗ trợ và giao tận nơi hông ạ do em ở huyện','2024-10-12 15:27:03','2024-10-12 15:27:03'),(4,1,1,'Em muốn mua trả góp thì bên mình có hỗ trợ và giao tận nơi hông ạ do em ở huyện','2024-10-12 15:48:47','2024-10-12 15:48:47'),(5,1,1,'Em muốn mua trả góp thì bên mình có hỗ trợ và giao tận nơi hông ạ do em ở huyện','2024-10-12 15:53:46','2024-10-12 15:53:46'),(6,1,1,'Em muốn mua trả góp thì bên mình có hỗ trợ và giao tận nơi hông ạ do em ở huyện','2024-10-12 15:55:51','2024-10-12 15:55:51'),(7,1,1,'Em muốn mua trả góp thì bên mình có hỗ trợ và giao tận nơi hông ạ do em ở huyện','2024-10-12 15:56:09','2024-10-12 15:56:09');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_conditions`
--

DROP TABLE IF EXISTS `coupon_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `operator` varchar(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  `discount_amount` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `coupon_conditions_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_conditions`
--

LOCK TABLES `coupon_conditions` WRITE;
/*!40000 ALTER TABLE `coupon_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2024-10-12 07:51:22',0,1),(2,'1','alter some tables','SQL','V1__alter_some_tables.sql',1058054593,'root','2024-10-12 07:51:23',525,1),(3,'2','change tokens','SQL','V2__change_tokens.sql',1993003711,'root','2024-10-12 07:51:23',46,1),(4,'3','refresh token','SQL','V3__refresh_token.sql',-1233402322,'root','2024-10-12 07:51:23',28,1),(5,'4','create comments table','SQL','V4__create_comments_table.sql',269770393,'root','2024-10-12 07:51:23',37,1),(6,'5','create coupons table','SQL','V5__create_coupons_table.sql',-1301014831,'root','2024-10-12 07:51:23',353,1),(7,'6','create brands table','SQL','V6__create_brands_table.sql',1926034213,'root','2024-10-12 07:51:23',102,1),(8,'7','update products table','SQL','V7__update_products_table.sql',-2047504443,'root','2024-10-12 07:51:23',31,1),(9,'8','create invoices table','SQL','V8__create_invoices_table.sql',1143606768,'root','2024-10-12 07:51:24',153,1),(10,'9','create add payment details','SQL','V9__create_add_payment_details.sql',-2021794502,'root','2024-10-13 08:13:16',241,1),(11,'10','update table order and orderdetails','SQL','V10__update_table_order_and_orderdetails.sql',748935614,'root','2024-10-13 14:50:12',126,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_invoices_orders` (`order_id`),
  CONSTRAINT `fk_invoices_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `number_of_products` int DEFAULT '1',
  `total_money` decimal(10,2) DEFAULT '0.00',
  `color` varchar(20) DEFAULT '',
  `coupon_id` int DEFAULT NULL,
  `order_quantity` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `fk_order_details_coupon` (`coupon_id`),
  CONSTRAINT `fk_order_details_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `order_details_chk_1` CHECK ((`price` >= 0)),
  CONSTRAINT `order_details_chk_2` CHECK ((`number_of_products` > 0)),
  CONSTRAINT `order_details_chk_3` CHECK ((`total_money` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1,10990000.00,2,NULL,NULL,NULL,NULL,NULL),(2,2,1,10990000.00,2,NULL,NULL,NULL,NULL,NULL),(3,10,1,10990000.00,2,NULL,NULL,NULL,NULL,NULL),(4,11,1,10990000.00,2,NULL,NULL,NULL,NULL,NULL),(11,12,1,10990000.00,5,NULL,NULL,NULL,NULL,NULL),(12,12,1,10990000.00,5,NULL,NULL,NULL,NULL,NULL),(13,13,1,10990000.00,5,NULL,NULL,NULL,NULL,NULL),(14,13,1,10990000.00,5,NULL,NULL,NULL,NULL,NULL),(15,14,1,10990000.00,5,NULL,NULL,NULL,NULL,NULL),(16,14,1,10990000.00,5,NULL,NULL,NULL,NULL,NULL),(17,15,1,10990000.00,2,NULL,NULL,NULL,NULL,NULL),(18,16,1,10990000.00,5,NULL,NULL,NULL,NULL,NULL),(19,16,2,17990000.00,3,NULL,NULL,NULL,NULL,NULL),(20,17,1,10990000.00,5,0.00,'red',NULL,1,1),(21,17,2,17990000.00,3,0.00,'red',NULL,1,2),(22,1,3,435.67,5,12345.67,'#000000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '' COMMENT 'Tên người đặt hàng khác (người đặt hàng khác)',
  `email` varchar(100) DEFAULT '' COMMENT 'Email đặt hàng có khác',
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','processing','shipped','delivered','canceled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL,
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `order_data` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fk_orders_coupon` (`coupon_id`),
  CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_chk_1` CHECK ((`total_money` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-12 18:16:25','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(2,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 00:49:35','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(3,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 08:49:46','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(4,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 08:51:22','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(5,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 08:54:34','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(6,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 08:56:18','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(7,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 08:57:25','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(8,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 09:00:06','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(9,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 09:03:04','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(10,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 09:05:07','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(11,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 09:16:31','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(12,5,'TÀI KHOẢN USER TEST','hoangtien2k3qx1@gmail.com','0828007856','THANH HOÁ','Có thể giao hàng trước thứ 6 được không','2024-10-13 09:41:59','pending',21980000,NULL,NULL,NULL,NULL,NULL,1,NULL,'{\"notes\": \"Có thể giao hàng trước thứ 6 được không\", \"payment\": {\"payment_method\": \"VNPAY\", \"payment_status\": 1, \"transaction_id\": 12}, \"user_id\": 5, \"currency\": \"VND\", \"discount\": 123.0, \"products\": [{\"quantity\": 5, \"product_id\": 1, \"unit_price\": 12, \"total_price\": 1234, \"product_name\": \"\"}, {\"quantity\": 5, \"product_id\": 1, \"unit_price\": 12, \"total_price\": 1234, \"product_name\": \"\"}], \"shipping\": {\"carrier\": \"\", \"shipping_method\": \"EXPRESS\", \"tracking_number\": \"\", \"shipping_address\": {\"city\": \"\", \"street\": \"\", \"country\": \"\", \"district\": \"\", \"postal_code\": \"\"}}, \"order_date\": 1728777600000, \"order_status\": \"1\", \"shipping_free\": 15000.0}'),(13,5,'TÀI KHOẢN USER TEST','hoangtien2k3qx1@gmail.com','0828007856','THANH HOÁ','Có thể giao hàng trước thứ 6 được không','2024-10-13 09:42:34','pending',21980000,NULL,NULL,NULL,NULL,NULL,1,NULL,'{\"notes\": \"Có thể giao hàng trước thứ 6 được không\", \"payment\": {\"payment_method\": \"VNPAY\", \"payment_status\": 1, \"transaction_id\": 12}, \"user_id\": 5, \"currency\": \"VND\", \"discount\": 123.0, \"products\": [{\"quantity\": 5, \"product_id\": 1, \"unit_price\": 12, \"total_price\": 1234, \"product_name\": \"\"}, {\"quantity\": 5, \"product_id\": 1, \"unit_price\": 12, \"total_price\": 1234, \"product_name\": \"\"}], \"shipping\": {\"carrier\": \"\", \"shipping_method\": \"EXPRESS\", \"tracking_number\": \"\", \"shipping_address\": {\"city\": \"\", \"street\": \"\", \"country\": \"\", \"district\": \"\", \"postal_code\": \"\"}}, \"order_date\": 1728777600000, \"order_status\": \"1\", \"shipping_free\": 15000.0}'),(14,5,'TÀI KHOẢN USER TEST','hoangtien2k3qx1@gmail.com','0828007856','THANH HOÁ','Có thể giao hàng trước thứ 6 được không','2024-10-13 10:17:55','pending',21980000,NULL,NULL,NULL,NULL,NULL,1,NULL,'{\"notes\": \"Có thể giao hàng trước thứ 6 được không\", \"payment\": {\"payment_method\": \"VNPAY\", \"payment_status\": 1, \"transaction_id\": 12}, \"user_id\": 5, \"currency\": \"VND\", \"discount\": 123.0, \"products\": [{\"quantity\": 5, \"product_id\": 1, \"unit_price\": 12, \"total_price\": 1234, \"product_name\": \"\"}, {\"quantity\": 5, \"product_id\": 1, \"unit_price\": 12, \"total_price\": 1234, \"product_name\": \"\"}], \"shipping\": {\"carrier\": \"\", \"shipping_method\": \"EXPRESS\", \"tracking_number\": \"\", \"shipping_address\": {\"city\": \"\", \"street\": \"\", \"country\": \"\", \"district\": \"\", \"postal_code\": \"\"}}, \"order_date\": 1728777600000, \"order_status\": \"1\", \"shipping_free\": 15000.0}'),(15,1,'Tiền Anh Hoáng','hoangtien2k3qx1@gmail.com','0987228049','Thanh Hoá','tôi có được kiểm tràng trước khi thanh toán không shop','2024-10-13 11:26:08','pending',81.34,'express',NULL,'2024-10-13',NULL,'cod',1,NULL,NULL),(16,5,'TÀI KHOẢN USER TEST','hoangtien2k3qx1@gmail.com','0828007856','THANH HOÁ','Có thể giao hàng trước thứ 6 được không','2024-10-13 11:26:18','pending',28980000,NULL,NULL,NULL,NULL,NULL,1,NULL,'{\"notes\": \"Có thể giao hàng trước thứ 6 được không\", \"payment\": {\"payment_method\": \"VNPAY\", \"payment_status\": 1, \"transaction_id\": 12}, \"user_id\": 5, \"currency\": \"VND\", \"discount\": 123.0, \"products\": [{\"quantity\": 5, \"product_id\": 1, \"unit_price\": 12, \"total_price\": 60, \"product_name\": \"Product A\"}, {\"quantity\": 3, \"product_id\": 2, \"unit_price\": 20, \"total_price\": 60, \"product_name\": \"Product B\"}], \"shipping\": {\"carrier\": \"Viettel Post\", \"shipping_method\": \"EXPRESS\", \"tracking_number\": \"123456789\", \"shipping_address\": {\"city\": \"Hà Nội\", \"street\": \"123 Đường ABC\", \"country\": \"Vietnam\", \"district\": \"Hoàn Kiếm\", \"postal_code\": \"100000\"}}, \"order_date\": 1728777600000, \"order_status\": \"1\", \"shipping_free\": 15000.0}'),(17,5,'TÀI KHOẢN USER TEST','hoangtien2k3qx1@gmail.com','0828007856','THANH HOÁ','Có thể giao hàng trước thứ 6 được không','2024-10-13 15:24:16','pending',28980000,NULL,NULL,NULL,NULL,NULL,1,NULL,'{\"notes\": \"Có thể giao hàng trước thứ 6 được không\", \"payment\": {\"payment_method\": \"VNPAY\", \"payment_status\": 1, \"transaction_id\": 12}, \"user_id\": 5, \"currency\": \"VND\", \"discount\": 123.0, \"products\": [{\"brand_id\": 1, \"quantity\": 5, \"color_name\": \"red\", \"product_id\": 1, \"unit_price\": 2, \"total_price\": 60, \"product_name\": \"Product A\"}, {\"brand_id\": 2, \"quantity\": 3, \"color_name\": \"red\", \"product_id\": 2, \"unit_price\": 2, \"total_price\": 60, \"product_name\": \"Product B\"}], \"shipping\": {\"carrier\": \"Viettel Post\", \"shipping_method\": \"EXPRESS\", \"tracking_number\": \"123456789\", \"shipping_address\": {\"city\": \"Hà Nội\", \"street\": \"123 Đường ABC\", \"country\": \"Vietnam\", \"district\": \"Hoàn Kiếm\", \"postal_code\": \"100000\"}}, \"order_date\": 1728777600000, \"order_status\": \"1\", \"shipping_free\": 15000.0}');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payments_orders` (`order_id`),
  KEY `fk_payments_users` (`user_id`),
  CONSTRAINT `fk_payments_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_payments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,12,5,'VNPAY',1,12,NULL),(2,13,5,'VNPAY',1,12,NULL),(3,14,5,'VNPAY',1,12,NULL),(4,16,5,'VNPAY',1,12,'2024-10-13 11:26:19'),(5,17,5,'VNPAY',1,12,'2024-10-13 15:24:16');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_images_product_id` (`product_id`),
  CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'19dd096a-c455-44ad-85a3-13942271d38b_5.jpeg'),(2,1,'2bba79ea-2cbb-4440-bfaa-e2a352d02b8d_6.jpeg'),(3,1,'08b8c0c1-8023-40a7-adb3-f4e1cc75b4e0_8b59835bb5aa883a0a800b1c55565b47.jpg'),(4,1,'2b240346-e454-4d2a-bb81-5c26b056256b_5.jpeg'),(5,1,'ef68595c-8c45-4575-b6a8-d77a20d66d7d_6.jpeg');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(350) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` decimal(10,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `product_original_price` decimal(10,2) DEFAULT NULL,
  `product_img` varchar(200) DEFAULT '',
  `product_stock` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `fk_products_brands` (`brand_id`),
  CONSTRAINT `fk_products_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Iphone 12 64GB Chính hãng VN/A - Tặng BH rơi vỡ vào nước',10990000.00,'https://clickbuy.com.vn/apple-iphone-12-64gb-chinh-hang-vn-a.html','iPhone 12 VN/A Máy mới 100%, nguyên seal hộp Apple Việt Nam. Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Type C - lightning. Đầy đủ chứng từ hóa đơn VAT. iPhone chính hãng Apple Việt Nam, được bán ra tại Clickbuy đều được nhập trực tiếp từ Công ty TNHH Apple Việt Nam thông qua các nhà phân phối được ủy quyền. Clickbuy hiện nay đang là nhà bán lẻ ủy quyền chính thức của Apple tại Việt Nam.','2024-10-12 11:57:15','2024-10-12 11:57:15',1,NULL,11995000.00,'https://i.ibb.co/7yJKR0L/ip12.webp',12),(2,'Iphone 14 Pro 128GB cũ đẹp 99% - Không zin tặng máy',17990000.00,'https://clickbuy.com.vn/iphone-14-pro-128gb-cu-dep-99.html','Khi mua iphone 14 Pro cũ tại Clickbuy quý khách sẽ cam kết bằng những hình ảnh, giấy tờ được thể hiện trên website và tại các cửa hàng. Máy hình thức đẹp 99%, như mớ!. Bảo hành 1 đổi 1, Hỗ trợ rơi vỡ, vào nước 12 tháng. Cam kết máy nguyên bản, chưa sửa chữa. Cam kết máy chưa ép kính, chưa thay vỏ. Pin zin theo máy hoặc đã được thay pin mới','2024-10-12 12:45:03','2024-10-12 12:45:03',1,1,31990000.00,'https://i.ibb.co/8XQbt6H/ip14promax.webp',25),(3,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-12 13:09:49','2024-10-12 13:09:49',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(4,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-12 13:10:19','2024-10-12 13:10:19',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(5,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-12 13:11:19','2024-10-12 13:11:19',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(6,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-12 13:11:51','2024-10-12 13:11:51',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(7,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-12 13:15:05','2024-10-12 13:15:05',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(8,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-12 13:18:01','2024-10-12 13:18:01',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(9,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-12 13:21:08','2024-10-12 13:21:08',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(10,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 11:25:27','2024-10-13 11:25:27',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(11,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 11:25:34','2024-10-13 11:25:34',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(12,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 15:29:13','2024-10-13 15:29:13',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(13,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 15:30:12','2024-10-13 15:30:12',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(14,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 15:35:38','2024-10-13 15:35:38',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(15,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 15:37:01','2024-10-13 15:37:01',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(16,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 15:37:26','2024-10-13 15:37:26',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(17,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 15:37:55','2024-10-13 15:37:55',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5),(18,'Xiaomi Redmi Note 11 Pro (5G) 8GB 128GB Chính hãng',3990000.00,'https://clickbuy.com.vn/dien-thoai-xiaomi-redmi-note-11-pro-5g.html','xiaomi Redmi Note 11 Pro 5G mang đậm phong cách thiết kế trẻ trung với màn hình có viền khá mỏng. Phần mặt lưng sử dụng chất liệu nhựa cao cấp, làm tăng độ bền của thiết bị. Bên cạnh đó, hệ thống 3 camera đặt dọc cùng dòng chữ xiaomi thương hiệu. Ngoài ra còn có những phiên bản màu sắc bắt mắt phù hợp mọi đối tường: Trắng, đen, xanh dương.','2024-10-13 15:43:26','2024-10-13 15:43:26',1,1,8990000.00,'https://i.ibb.co/FHT2Hmm/redmi-note-11.webp',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN'),(3,'ROLE_EMPLOYEE');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shipping_id` int DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shipping_address_shippings` (`shipping_id`),
  CONSTRAINT `fk_shipping_address_shippings` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,3,'','','','',''),(2,4,'123 Đường ABC','Hà Nội','Hoàn Kiếm','100000','Vietnam'),(3,5,'123 Đường ABC','Hà Nội','Hoàn Kiếm','100000','Vietnam');
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `shipping_method` varchar(50) DEFAULT NULL,
  `tracking_number` varchar(40) DEFAULT NULL,
  `carrier` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `shippings_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippings`
--

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;
INSERT INTO `shippings` VALUES (1,12,'EXPRESS','',''),(2,13,'EXPRESS','',''),(3,14,'EXPRESS','',''),(4,16,'EXPRESS','123456789','Viettel Post'),(5,17,'EXPRESS','123456789','Viettel Post');
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(20) NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) NOT NULL COMMENT 'Tên người dùng',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `refresh_token` varchar(500) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_time` timestamp NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_mobile` tinyint(1) DEFAULT '0',
  `refresh_expiration_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (125,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwODI4MDA3ODM4IiwiaWF0IjoxNzI4ODE4NjI5LCJleHAiOjE3MzE0MTA2Mjl9.EvBHcNkzI8-lavYzxHR0Eg4VuU5jooKPEcdgudSKz_w','843510b7-ce14-4b77-b676-3a9ccc14a23e','Bearer','2024-10-13 12:07:02',0,0,9,1,'2024-10-13 12:50:14'),(126,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwODI4MDA3ODM3IiwiaWF0IjoxNzI4ODE4NjMwLCJleHAiOjE3MzE0MTA2MzB9._Wm0DsrKKId7vS4Bmf5aU_3AwGWtV3oZZX0Bszm8xes','21a83d80-fd48-4eb4-8124-7f32c3994525','Bearer','2024-10-13 12:07:02',0,0,8,0,'2024-10-13 12:50:14'),(127,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwODI4MDA3ODM4IiwiaWF0IjoxNzI4ODE4NjcyLCJleHAiOjE3MzE0MTA2NzJ9.JJheIwsyDXYlBxtUy8h2lyZwTILKWvnP7TqM7bajWK0','7f77dd61-1656-4c1f-8737-ed6c78fd38f3','Bearer','2024-10-13 12:07:45',0,0,9,1,'2024-10-13 12:50:57'),(128,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwODI4MDA3ODM3IiwiaWF0IjoxNzI4ODE4NjczLCJleHAiOjE3MzE0MTA2NzN9._ru-LQx14Lneyv6J2iWiO44YXheQaRW3zps_SEQ2R6c','cfc9f580-fd08-4596-add2-3c09fd82e844','Bearer','2024-10-13 12:07:45',0,0,8,0,'2024-10-13 12:50:57'),(129,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwODI4MDA3ODM4IiwiaWF0IjoxNzI4ODMxNjg0LCJleHAiOjE3MzE0MjM2ODR9.sZl7MkOVfbekJRcO6njn-RcYJtGCqA7d6k8TyP7lcEo','68aacde7-17ca-4142-9b2b-7a3d54131219','Bearer','2024-10-13 15:44:37',0,0,9,1,'2024-10-13 16:27:49'),(130,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwODI4MDA3ODM3IiwiaWF0IjoxNzI4ODMxNjg1LCJleHAiOjE3MzE0MjM2ODV9.Gc74hsrDK_UwC8vz8mLK0XT-T7p1dwbvcYVILF1Ixw8','96d98192-98db-42fe-bb84-6d32cdaf86fa','Bearer','2024-10-13 15:44:38',0,0,8,0,'2024-10-13 16:27:50');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(200) DEFAULT '',
  `password` char(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int DEFAULT '0',
  `google_account_id` int DEFAULT '0',
  `role_id` int DEFAULT '1',
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hoàng Anh Tiến','0828007823','Thanh Hoá','$2a$10$OF6PTF7/mruFyX7hIIU5NOUbA2dgGeDJuHnFxTXlFn2MtLF5vv5oK','2024-10-12 07:51:57','2024-10-12 07:51:57',1,'2003-04-12',0,0,1,NULL,NULL),(2,'Hoàng Anh Tiến','0828007853','Thanh Hoá','$2a$10$7YMfj4lPnadH46X7eIEe/ODFoIr8xqE5V.MpfaAsDp06oHzIhveVW','2024-10-12 09:14:44','2024-10-12 09:14:44',1,'2003-04-12',0,0,1,NULL,NULL),(3,'Hoàng Anh Tiến','0828007854','Thanh Hoá','$2a$10$t4alE4NXXdgtmJYdSszSPuYba9KdjlN69PxVnCzb9Y9a0KzP9/KM6','2024-10-12 09:24:44','2024-10-12 09:24:44',1,'2003-04-12',0,0,1,NULL,NULL),(4,'Hoàng Anh Tiến','0828007855','Thanh Hoá','$2a$10$foKlHvcsyUKQXb7l.AGA/eJH5aPXgEoJS097XqP2JFnuymZ6LPUVW','2024-10-12 09:28:34','2024-10-12 09:28:34',1,'2003-04-12',0,0,1,NULL,NULL),(5,'TÀI KHOẢN USER TEST','0828007856','THANH HOÁ','$2a$10$k6xMBsLUVpGc/BcHXygsieCk1Zp31baLbscPlF52pvjXFn1/rPrLO','2024-10-12 09:37:58','2024-10-12 09:42:49',1,'2003-04-11',0,0,1,'hoangtien2k3qx1@gmail.com','Nam'),(6,'Hoàng Anh Tiến','0828007857','Thanh Hoá','$2a$10$/l/XaodN2wrweRjnbBDQO.ILjIbDbuuuV4h/Tt2mF6Mof.8zja7/e','2024-10-13 08:15:29','2024-10-13 08:15:29',1,'2003-04-12',0,0,1,'hoangtien2k3qx1@gmail.com','Nam'),(7,'Hoàng Anh Tiến','0828007859','Thanh Hoá','$2a$10$Ditbw/7dZVqAduriiWBQIuJdQSOQxLzfLjCVENG/u1h5rwsqWokii','2024-10-13 10:51:14','2024-10-13 10:51:14',1,'2003-04-12',0,0,1,'hoangtien2k3qx1@gmail.com','Nam'),(8,'Hoàng Anh Tiến','0828007837','Thanh Hoá','$2a$10$SeZ10E5Cwp6VUBNk3oCGwOnFg0kAakBp4RQqVdoosOJvXwc3ZdSsS','2024-10-13 11:02:34','2024-10-13 11:02:34',1,'2003-04-12',0,0,1,'hoangtien2k3qx1@gmail.com','Nam'),(9,'Hoàng Anh Tiến','0828007838','Thanh Hoá','$2a$10$nlbsmsCQsiPg91vBvTdl8e6W6tQ2RdR6Plby8CTwW/jmZjGKY.G8e','2024-10-13 11:14:08','2024-10-13 11:14:08',1,'2003-04-12',0,0,1,'hoangtien2k3qx1@gmail.com','Nam');
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

-- Dump completed on 2024-10-13 15:55:10
