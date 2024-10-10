-- MySQL dump 10.13  Distrib 8.2.0, for macos13 (x86_64)
--
-- Host: localhost    Database: shopapp
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories`
(
    `id`   int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    UNIQUE KEY `name_2` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories`
    DISABLE KEYS */;
INSERT INTO `categories`
VALUES (1, 'Điện Thoại'),
       (2, 'LapTop'),
       (3, 'Màn Hình'),
       (4, 'Máy Tính PC'),
       (5, 'Phụ Kiện'),
       (6, 'Ram PC');
/*!40000 ALTER TABLE `categories`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `product_id` int          DEFAULT NULL,
    `user_id`    int          DEFAULT NULL,
    `content`    varchar(255) DEFAULT NULL,
    `created_at` datetime     DEFAULT NULL,
    `updated_at` datetime     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
    CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments`
    DISABLE KEYS */;
INSERT INTO `comments`
VALUES (1, 3, 13, 'This product bad, please don\'t by it', '2024-05-25 10:31:47', '2024-05-25 10:31:47');
/*!40000 ALTER TABLE `comments`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_conditions`
--

DROP TABLE IF EXISTS `coupon_conditions`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_conditions`
(
    `id`              int           NOT NULL AUTO_INCREMENT,
    `coupon_id`       int           NOT NULL,
    `attribute`       varchar(255)  NOT NULL,
    `operator`        varchar(10)   NOT NULL,
    `value`           varchar(255)  NOT NULL,
    `discount_amount` decimal(5, 2) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `coupon_id` (`coupon_id`),
    CONSTRAINT `coupon_conditions_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_conditions`
--

LOCK TABLES `coupon_conditions` WRITE;
/*!40000 ALTER TABLE `coupon_conditions`
    DISABLE KEYS */;
INSERT INTO `coupon_conditions`
VALUES (1, 1, 'minimum_amount', '>', '100', 10.00),
       (2, 1, 'applicable_date', 'BETWEEN', '2024-10-09', 5.00),
       (3, 2, 'minimum_amount', '>', '200', 20.00);
/*!40000 ALTER TABLE `coupon_conditions`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons`
(
    `id`     int         NOT NULL AUTO_INCREMENT,
    `code`   varchar(50) NOT NULL,
    `active` tinyint(1)  NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons`
    DISABLE KEYS */;
INSERT INTO `coupons`
VALUES (1, 'HEAVEN', 1),
       (2, 'DISCOUNT20', 1);
/*!40000 ALTER TABLE `coupons`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history`
(
    `installed_rank` int           NOT NULL,
    `version`        varchar(50)            DEFAULT NULL,
    `description`    varchar(200)  NOT NULL,
    `type`           varchar(20)   NOT NULL,
    `script`         varchar(1000) NOT NULL,
    `checksum`       int                    DEFAULT NULL,
    `installed_by`   varchar(100)  NOT NULL,
    `installed_on`   timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `execution_time` int           NOT NULL,
    `success`        tinyint(1)    NOT NULL,
    PRIMARY KEY (`installed_rank`),
    KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history`
    DISABLE KEYS */;
INSERT INTO `flyway_schema_history`
VALUES (1, '0', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2024-05-20 15:09:44', 0,
        1),
       (2, '1', 'alter some tables', 'SQL', 'V1__alter_some_tables.sql', -1961131368, 'root', '2024-05-21 02:12:00',
        129, 1),
       (3, '2', 'change tokens', 'SQL', 'V2__change_tokens.sql', 1993003711, 'root', '2024-05-21 02:12:00', 16, 1),
       (4, '3', 'refresh token', 'SQL', 'V3__refresh_token.sql', -1233402322, 'root', '2024-05-21 02:46:38', 21, 1),
       (5, '4', 'create comments table', 'SQL', 'V4__create_comments_table.sql', 616245320, 'root',
        '2024-10-09 08:05:08', 36, 1),
       (6, '5', 'create soupon table', 'SQL', 'V5__create_soupon_table.sql', -1301014831, 'root', '2024-05-25 08:24:21',
        133, 1);
/*!40000 ALTER TABLE `flyway_schema_history`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details`
(
    `id`                 int NOT NULL AUTO_INCREMENT,
    `order_id`           int            DEFAULT NULL,
    `product_id`         int            DEFAULT NULL,
    `price`              decimal(10, 2) DEFAULT NULL,
    `number_of_products` int            DEFAULT '1',
    `total_money`        decimal(10, 2) DEFAULT '0.00',
    `color`              varchar(20)    DEFAULT '',
    `coupon_id`          int            DEFAULT NULL,
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
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details`
    DISABLE KEYS */;
INSERT INTO `order_details`
VALUES (4, 4, 3, 1234.34, 7, NULL, NULL, NULL),
       (5, 4, 4, 48452900.00, 2, NULL, NULL, NULL),
       (6, 4, 5, 80831800.00, 3, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order_details`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders`
(
    `id`               int          NOT NULL AUTO_INCREMENT,
    `user_id`          int                                                            DEFAULT NULL,
    `fullname`         varchar(100)                                                   DEFAULT '' COMMENT 'Tên người đặt hàng khác (người đặt hàng khác)',
    `email`            varchar(100)                                                   DEFAULT '' COMMENT 'Email đặt hàng có khác',
    `phone_number`     varchar(20)  NOT NULL,
    `address`          varchar(200) NOT NULL,
    `note`             varchar(100)                                                   DEFAULT '',
    `order_date`       datetime                                                       DEFAULT CURRENT_TIMESTAMP,
    `status`           enum ('pending','processing','shipped','delivered','canceled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
    `total_money`      float                                                          DEFAULT NULL,
    `shipping_method`  varchar(100)                                                   DEFAULT NULL,
    `shipping_address` varchar(200)                                                   DEFAULT NULL,
    `shipping_date`    date                                                           DEFAULT NULL,
    `tracking_number`  varchar(100)                                                   DEFAULT NULL,
    `payment_method`   varchar(100)                                                   DEFAULT NULL,
    `active`           tinyint(1)                                                     DEFAULT NULL,
    `coupon_id`        int                                                            DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `fk_orders_coupon` (`coupon_id`),
    CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `orders_chk_1` CHECK ((`total_money` >= 0))
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders`
    DISABLE KEYS */;
INSERT INTO `orders`
VALUES (1, 1, 'Hoàng Anh Tiến', 'hoangtien2k3qx1@gmail.com', '0828007853', 'Hà Nội', 'mau máy tính laptop macbook pro13 2020',
        '2024-05-16 15:39:00', 'pending', 1234.67, 'Express', NULL, '2024-05-16', NULL, 'cod', 0, NULL),
       (2, 2, 'Vũ Mạnh Chiến', 'vumanhchien@gmail.com', '0987228049', 'Hà Nội', 'Mua phụ kiện ốp lưng điện thoại',
        '2024-05-17 08:03:04', 'pending', 1234.67, 'Express', NULL, '2024-05-16', NULL, 'cod', 1, NULL),
       (3, 2, 'Nguyễn Chí Hải Anh', 'nguyenchihaianh@gmail.com', '0857395138', 'Thanh Hoá', 'hàng dễ vỡ, xin nhẹ tay',
        '2024-05-17 08:25:22', 'pending', 81.34, 'express', NULL, '2024-05-17', NULL, 'cod', 1, NULL),
       (4, 2, 'Lê Minh Tâm', 'leminhtam@gmail.com', '2689356026', 'Quảng Nam', 'Mua máy tính PC mới',
        '2024-05-18 03:30:56', 'pending', 81.34, 'express', NULL, '2024-05-18', NULL, 'cod', 1, NULL);
/*!40000 ALTER TABLE `orders`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `product_id` int          DEFAULT NULL,
    `image_url`  varchar(300) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_product_images_product_id` (`product_id`),
    CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images`
    DISABLE KEYS */;
INSERT INTO `product_images`
VALUES (1, 1, '7yJKR0L/ip12.webp'),
       (2, 1, '8XQbt6H/ip14promax.webp'),
       (3, 1, 'FHT2Hmm/redmi-note-11.webp'),
       (4, 1, '9W10t3J/rogphone6.webp'),
       (5, 2, 'HFZCVgD/acer.webp'),
       (6, 2, '1JrWjzj/acer2.webp'),
       (7, 2, 'gwR1bm7/asus.webp'),
       (8, 2, 'bz4h31t/hp.webp'),
       (9, 2, 'GQMgvS5/hp2.webp'),
       (10, 3, 'HqFBypw/unnamed-1.webp'),
       (11, 3, 'XtP8Ckz/unnamed-2.webp'),
       (12, 3, 'kq4NjmK/unnamed-3.webp'),
       (13, 3, 'qycJ5wS/unnamed-4.webp'),
       (14, 3, 'rQHbW6y/unnamed-5.webp'),
       (15, 4, '9cn2btx/cta.webp'),
       (16, 4, 'djRn7v6/pc-acer.webp'),
       (17, 4, '6yrQ3ZC/pc-hp.webp'),
       (18, 5, 'zr2rrdy/Banphim-DAREU.webp'),
       (19, 5, 'gR7PDzs/Chuot-ASUS.webp'),
       (20, 5, 'LCk7JqF/chuotLOG.webp'),
       (21, 5, 'mBgSXW6/tainghe-DAREU.webp'),
       (22, 5, 'BPZfK0j/Tainghe-ZIDLI.webp'),
       (23, 6, 'cQrZHfQ/RamADATA.webp'),
       (24, 6, '9shTH4W/Ram-KINGSTON.webp'),
       (25, 6, 't29j1MT/Sdd-KINGSTON.webp'),
       (26, 6, 'hLRNL2H/Sdd-KINGTONocung.webp'),
       (27, 6, '1Q9rKrw/SddWD.webp');
/*!40000 ALTER TABLE `product_images`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products`
(
    `id`          int NOT NULL AUTO_INCREMENT,
    `name`        varchar(350)   DEFAULT NULL COMMENT 'Tên sản phẩm',
    `price`       decimal(10, 2) DEFAULT NULL,
    `thumbnail`   varchar(255)   DEFAULT NULL,
    `description` longtext,
    `created_at`  datetime       DEFAULT NULL,
    `updated_at`  datetime       DEFAULT NULL,
    `category_id` int            DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `category_id` (`category_id`),
    CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
    CONSTRAINT `products_chk_1` CHECK ((`price` >= 0))
) ENGINE = InnoDB
  AUTO_INCREMENT = 4775
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products`
    DISABLE KEYS */;
INSERT INTO `products`
VALUES (1, 'Iphone 16 Pro Max 1TB – Chính Hãng', 47990000,
        '7yJKR0L/ip12.webp', 'iPhone 16 Pro Max 1TB – 2 Sim Vật Lý – Chính Hãng',
        '2024-10-16 10:10:02', '2024-10-16 10:10:02', 1),
       (4, 'Điện Thoại Vertu Meta 5G',117500000.00, '9W10t3J/rogphone6.webp', 'Metavertu phiên bản Cacbon Web3 - Điện Thoại Vertu Meta 5G',
        '2024-05-16 10:40:29', '2024-05-16 10:40:29', 1),
       (5, 'Laptop Acer Gaming Aspire 5 A515-58GM-53PZ NX.KQ4SV.008', 15990000.00, 'HFZCVgD/acer.webp', 'Laptop Acer Gaming Aspire 5 A515-58GM-53PZ NX.KQ4SV.008 (Intel Core i5-13420H | RTX 2050 4GB GDDR6 8GB | 512GB | 15.6 inch FHD | Win 11 | Steel Gray)', '2024-05-16 10:40:29',
        '2024-05-16 10:40:29', 2),
       (2, 'iPhone 14 Pro Max 128GB - Chính Hãng Cao Cấp', 17950000.00, '8XQbt6H/ip14promax.webp', 'iPhone 14 Pro Max 128GB Cũ Chính Hãng Cao Cấp',
        '2024-10-09 10:40:29', '2024-10-09 10:40:29', 1),
       (6, 'Laptop HP Envy x360 2 in 1 14-es1013dx 9R8R2UA', 14990000.00, 'GQMgvS5/hp2.webp', '[New 100%] Laptop HP Envy x360 2 in 1 14-es1013dx 9R8R2UA - Intel Core Ultra 5-120U | 14 inch Full HD Touch', '2024-10-16 10:40:29',
        '2024-05-16 10:40:29', 2),
           (7, 'MSI 27-inch display 2k 165Hz FastIPS 1ms GTG', 21899030.00, 'HqFBypw/unnamed-1.webp', 'MSI 27-inch display 2k 165Hz FastIPS 1ms GTG rotary lifting computer game display G273QPF', '2024-05-16 10:40:29',
        '2024-05-16 10:40:29', 3),
       (8, 'AOC monitor 1080P Full HD', 2012526.00, 'XtP8Ckz/unnamed-2.webp', 'AOC monitor 1080P Full HD wide viewing angle micro narrow bezel office gaming computer display 24 inch 24B1H', '2024-10-16 10:40:29',
        '2024-05-16 10:40:29', 3),
       (3, 'Xiaomi Redmi Note 11 chính hãng', 20831848.00, 'FHT2Hmm/redmi-note-11.webp', 'Xiaomi Redmi Note 11 4GB | Chính hãng giá rẻ, giảm cực', '2024-05-16 10:40:29',
        '2024-05-16 10:40:29', 1),
       (9, 'PC Gaming Intel Core i5-12400F', 45702708.00, '9cn2btx/cta.webp', 'PC Gaming Intel Core i5-12400F | RTX 3060 | RAM 16GB', '2024-05-16 10:40:29',
        '2024-05-16 10:40:29', 4),
       (10, 'Bộ PC BTS01 Intel Core i5-12400F', 24659560.00, 'djRn7v6/pc-acer.webp', 'Bộ PC BTS01 Intel Core i5-12400F | RAM 16GB | RTX 4060 8GB',
        '2024-05-16 10:40:29', '2024-05-16 10:40:29', 4),
       (12, 'Chuột máy tính Asus TUF Gaming M3 (Black)', 399000.00, 'gR7PDzs/Chuot-ASUS.webp', 'Asus TUF Gaming M3 là một con chuột chơi game nhỏ gọn mang đến sự thoải mái, hiệu suất và độ tin cậy mà các game thủ yêu cầu.',
        '2024-10-16 10:40:29', '2024-05-16 10:40:29', 5),
       (13, 'Samsung 990 Pro 1TB M2 PCIe Gen 4.0 x 4 MZ', 339000.00, '9shTH4W/Ram-KINGSTON.webp', 'Samsung 990 Pro 1TB M2 PCIe Gen 4.0 x 4 MZ-V9P1T0BW (Hot deal) ', '2024-05-16 10:40:29',
        '2024-05-16 10:40:29', 5),
       (14, 'Enterprise Samsung PM893 7.68TB MZ7L37T6HBLA', 14645852.00, 'hLRNL2H/Sdd-KINGTONocung.webp', 'SSD Enterprise Samsung PM893 7.68TB MZ7L37T6HBLA',
        '2024-10-16 10:40:29', '2024-05-16 10:40:29', 2);
/*!40000 ALTER TABLE `products`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles`
(
    `id`   int         NOT NULL,
    `name` varchar(20) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles`
    DISABLE KEYS */;
INSERT INTO `roles`
VALUES (1, 'USER'),
       (2, 'ADMIN');
/*!40000 ALTER TABLE `roles`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_accounts`
(
    `id`          int          NOT NULL AUTO_INCREMENT,
    `provider`    varchar(20)  NOT NULL COMMENT 'Tên nhà social network',
    `provider_id` varchar(50)  NOT NULL,
    `email`       varchar(150) NOT NULL COMMENT 'Email tài khoản',
    `name`        varchar(100) NOT NULL COMMENT 'Tên người dùng',
    `user_id`     int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens`
(
    `id`                      int          NOT NULL AUTO_INCREMENT,
    `token`                   varchar(255) NOT NULL,
    `refresh_token`           varchar(500) NOT NULL,
    `token_type`              varchar(50)  NOT NULL,
    `expiration_time`         timestamp    NOT NULL,
    `revoked`                 tinyint(1)   NOT NULL,
    `expired`                 tinyint(1)   NOT NULL,
    `user_id`                 int               DEFAULT NULL,
    `is_mobile`               tinyint(1)        DEFAULT '0',
    `refresh_expiration_time` timestamp    NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 52
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens`
    DISABLE KEYS */;
INSERT INTO `tokens`
VALUES (1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwODI4MDA3ODU1IiwiaWF0IjoxNzE2MjY0MDIxLCJleHAiOjE3MTYyNjY2MTN9.490yVdh6wDHNP8Qst7hoOoqgoM9q_wjjZL4wcgcus7E',
        '4a3783a8-97de-4955-8978-dbe7db561738', 'Bearer', '2024-05-20 21:43:33', 0, 0, 5, 1, '2024-05-20 22:26:45'),;
/*!40000 ALTER TABLE `tokens`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users`
(
    `id`                  int      NOT NULL AUTO_INCREMENT,
    `fullname`            varchar(100) DEFAULT '',
    `phone_number`        varchar(15)  DEFAULT NULL,
    `address`             varchar(200) DEFAULT '',
    `password`            char(60) NOT NULL,
    `created_at`          datetime     DEFAULT NULL,
    `updated_at`          datetime     DEFAULT NULL,
    `is_active`           tinyint(1)   DEFAULT '1',
    `date_of_birth`       date         DEFAULT NULL,
    `facebook_account_id` int          DEFAULT '0',
    `google_account_id`   int          DEFAULT '0',
    `role_id`             int          DEFAULT '1',
    PRIMARY KEY (`id`),
    KEY `role_id` (`role_id`),
    CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users`
    DISABLE KEYS */;
INSERT INTO `users`
VALUES (1, 'Hoang Anh Tien', '0828007853', 'Thanh Hoa', '123456789', NULL, NULL, 1, '2003-04-12', 0, 0, 1),
       (2, 'HOÀNG ANH TIẾN', '0987228049', 'THANH HOÁ', '$2a$10$NDP74jtjN1Cm7v4xseDhHuY6LAXmlieqn.u6SReIfM9fAve9HvJPi',
        '2024-05-17 06:35:28', '2024-05-18 07:21:29', 0, '2003-04-11', 0, 0, 1),
       (4, 'TÀI KHOẢN USER TEST', '0828007854', 'THANH HOÁ',
        '$2a$10$M82sw67hp2dhP4F/oJHR0.0/9XBYjZ.eybezZiCRfYRwf7WjubkHm', '2024-05-17 09:21:54', '2024-05-18 08:38:23', 0,
        '2003-04-11', 0, 0, 1),
       (5, 'Tài Khoảng Admin', '0828007855', 'Thanh Hoá',
        '$2a$10$.nrVFaMe2MXwFrcBBeHgKOFKp0trjKPaLGjrbH00ViRa5ETJTsGfS', '2024-05-17 17:57:14', '2024-05-17 17:57:14', 1,
        '2003-04-12', 0, 0, 2),
       (6, 'Nguyễn Văn Bính', '0987654321', 'Thanh Hoá', '$2a$10$/s5sZwQ2K2UHJ3iRhrQ8EeMnhSh.VG0XjY5L2DTcOqAxU27T/LGwG',
        '2024-05-18 16:12:57', '2024-05-18 16:12:57', 0, '2003-04-12', 0, 0, 1),
       (10, 'Ngô Anh Quân', '0828007888', 'Thanh Hoá', '$2a$10$WqsKkcQ.7mdK.GS6TQEfm.rcF7qY1P0qODQ0iEmTeTXiPGz2wNE9.',
        '2024-05-19 15:57:24', '2024-05-19 15:57:24', 0, '2003-04-12', 0, 0, 1),
       (11, 'Lê Hoàng Quốc', '0828007889', 'Thanh Hoá', '$2a$10$D035iuyJUHwwOST9TxuXNekytMjemo8vcNWn5lvyQQB2Z55sRl/mO',
        '2024-05-20 15:25:00', '2024-05-21 04:28:22', 1, '2003-04-08', 0, 0, 1),
       (12, 'Nguyễn An Duyệt', '0828007880', 'Thanh Hoá',
        '$2a$10$gJ3KNiLQ4mgWmrLaKd3D0evW/Vp7F8/2G1D3/8gImKHp4IbDfNdEC', '2024-05-21 00:50:32', '2024-05-21 00:50:32', 1,
        '2003-04-12', 0, 0, 2),
       (13, 'tai khoan test', '0987228041', 'Thanh Hoá', '$2a$10$0rtkJ33JiqsJmq9UoAnZfuT7Z9w8OvsCo1DHaDl9fdXNAcBZP4SFi',
        '2024-05-21 16:37:08', '2024-05-21 16:37:08', 1, '2003-04-12', 0, 0, 1),
       (14, 'tai khoan test', '0987228042', 'Thanh Hoá', '$2a$10$bXS5J89qDWE9aRTuIohFMeXt1yffr5meYbsOxZFl2HDXOBkqIWMwi',
        '2024-05-25 09:59:45', '2024-05-25 09:59:45', 1, '2003-04-12', 0, 0, 1);
/*!40000 ALTER TABLE `users`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26  9:22:43
