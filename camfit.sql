-- MySQL dump 10.13  Distrib 8.4.6, for macos26.0 (arm64)
--
-- Host: 127.0.0.1    Database: camfit
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'캠프라인'),(2,'코베아'),(3,'스노우피크'),(4,'노르디스크'),(5,'헬리녹스'),(6,'블랙야크'),(7,'네이처하이크'),(8,'캠핑앤피크'),(9,'미니멀웍스'),(10,'아이더');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camping_log`
--

DROP TABLE IF EXISTS `camping_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camping_log` (
  `camping_log_id` int NOT NULL AUTO_INCREMENT,
  `campsite_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`camping_log_id`),
  KEY `campsite_id` (`campsite_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `camping_log_ibfk_1` FOREIGN KEY (`campsite_id`) REFERENCES `campsite` (`campsite_id`),
  CONSTRAINT `camping_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camping_log`
--

LOCK TABLES `camping_log` WRITE;
/*!40000 ALTER TABLE `camping_log` DISABLE KEYS */;
INSERT INTO `camping_log` VALUES (1,1,1,'가족과 함께 즐거운 시간이었습니다.','2025-10-30 01:10:13'),(2,2,2,'조용하고 좋았어요.','2025-10-30 01:10:13');
/*!40000 ALTER TABLE `camping_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campsite`
--

DROP TABLE IF EXISTS `campsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campsite` (
  `campsite_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certification` tinyint(1) DEFAULT NULL,
  `open_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `region_id` int NOT NULL,
  PRIMARY KEY (`campsite_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `campsite_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campsite`
--

LOCK TABLES `campsite` WRITE;
/*!40000 ALTER TABLE `campsite` DISABLE KEYS */;
INSERT INTO `campsite` VALUES (1,'서울대공원 캠핑장','서울대공원에 위치한 캠핑장입니다.',NULL,NULL,NULL,'2025-10-30 10:09:50','2025-10-30 10:26:10',2),(2,'가평 자라섬 캠핑장','자라섬에 위치한 캠핑장입니다.',NULL,NULL,NULL,'2025-10-30 10:09:50','2025-10-30 10:09:50',2);
/*!40000 ALTER TABLE `campsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campsite_category`
--

DROP TABLE IF EXISTS `campsite_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campsite_category` (
  `campsite_category_id` int NOT NULL AUTO_INCREMENT,
  `campsite_id` int NOT NULL,
  `campsite_detail_category_id` int NOT NULL,
  PRIMARY KEY (`campsite_category_id`),
  KEY `campsite_id` (`campsite_id`),
  KEY `campsite_detail_category_id` (`campsite_detail_category_id`),
  CONSTRAINT `campsite_category_ibfk_1` FOREIGN KEY (`campsite_id`) REFERENCES `campsite` (`campsite_id`),
  CONSTRAINT `campsite_category_ibfk_2` FOREIGN KEY (`campsite_detail_category_id`) REFERENCES `campsite_detail_category` (`campsite_detail_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campsite_category`
--

LOCK TABLES `campsite_category` WRITE;
/*!40000 ALTER TABLE `campsite_category` DISABLE KEYS */;
INSERT INTO `campsite_category` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `campsite_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campsite_detail`
--

DROP TABLE IF EXISTS `campsite_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campsite_detail` (
  `campsite_detail_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campsite_id` int NOT NULL,
  PRIMARY KEY (`campsite_detail_id`),
  KEY `campsite_id` (`campsite_id`),
  CONSTRAINT `fk_campsite_detail_campsite` FOREIGN KEY (`campsite_id`) REFERENCES `campsite` (`campsite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campsite_detail`
--

LOCK TABLES `campsite_detail` WRITE;
/*!40000 ALTER TABLE `campsite_detail` DISABLE KEYS */;
INSERT INTO `campsite_detail` VALUES (1,'A-1','데크',1),(2,'B-2','파쇄석',2);
/*!40000 ALTER TABLE `campsite_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campsite_detail_category`
--

DROP TABLE IF EXISTS `campsite_detail_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campsite_detail_category` (
  `campsite_detail_category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`campsite_detail_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campsite_detail_category`
--

LOCK TABLES `campsite_detail_category` WRITE;
/*!40000 ALTER TABLE `campsite_detail_category` DISABLE KEYS */;
INSERT INTO `campsite_detail_category` VALUES (1,'편의시설'),(2,'자연환경');
/*!40000 ALTER TABLE `campsite_detail_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campsite_stock`
--

DROP TABLE IF EXISTS `campsite_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campsite_stock` (
  `campsite_stock_id` int NOT NULL,
  `campsite_detail_id` int NOT NULL,
  `total_stock` int NOT NULL,
  `reserved_stock` int NOT NULL,
  `available_stock` int NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`campsite_stock_id`),
  KEY `campsite_detail_id` (`campsite_detail_id`),
  CONSTRAINT `campsite_stock_ibfk_1` FOREIGN KEY (`campsite_detail_id`) REFERENCES `campsite_detail` (`campsite_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campsite_stock`
--

LOCK TABLES `campsite_stock` WRITE;
/*!40000 ALTER TABLE `campsite_stock` DISABLE KEYS */;
INSERT INTO `campsite_stock` VALUES (1,1,10,2,8,'2025-10-30 10:10:04','2025-10-30 10:10:04'),(2,2,20,5,15,'2025-10-30 10:10:04','2025-10-30 10:10:04');
/*!40000 ALTER TABLE `campsite_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'텐트/타프'),(2,'의자/테이블'),(3,'조명'),(4,'조리도구'),(5,'취사장비'),(6,'수납용품'),(7,'보온용품'),(8,'침구류'),(9,'휴식용품'),(10,'기타');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,2,'멋진 사진이네요!','2025-10-30 02:10:22','2025-10-30 02:10:22'),(2,2,1,'제주도 정말 가보고 싶어요 :야자수:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(3,3,4,'등산 코스가 어디인가요? 뷰가 멋져요!','2025-10-30 02:10:22','2025-10-30 02:10:22'),(4,4,6,'고양이 너무 귀엽네요 :발:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(5,5,3,'노트북 모델이 어떤 건가요?','2025-10-30 02:10:22','2025-10-30 02:10:22'),(6,6,5,'저도 그 책 읽고 감동받았어요 :책:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(7,7,8,'완주 축하드려요! 대단하세요 :근육:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(8,8,9,'저 커피숍 분위기 좋아 보이네요 :커피:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(9,9,10,'비 오는 날엔 확실히 여유롭죠 :미소짓는_상기된_얼굴:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(10,10,7,'프로젝트 발표 수고 많으셨어요!','2025-10-30 02:10:22','2025-10-30 02:10:22');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keeps`
--

DROP TABLE IF EXISTS `keeps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keeps` (
  `keep_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`keep_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `keeps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `keeps_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keeps`
--

LOCK TABLES `keeps` WRITE;
/*!40000 ALTER TABLE `keeps` DISABLE KEYS */;
INSERT INTO `keeps` VALUES (1,1,3),(2,2,1),(3,3,2),(4,4,5),(5,5,6),(6,6,4),(7,7,9),(8,8,8),(9,9,10),(10,10,7);
/*!40000 ALTER TABLE `keeps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,2),(2,2,2),(3,3,1),(4,1,3),(5,4,1),(6,5,4),(7,6,6),(8,7,8),(9,8,9),(10,9,10),(11,10,5);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `campsite_id` int NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `campsite_id` (`campsite_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`campsite_id`) REFERENCES `campsite` (`campsite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1,37.0000000,127.0000000,'경기도 과천시 대공원광장로 102'),(2,2,38.0000000,128.0000000,'경기도 가평군 가평읍 자라섬로 60');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `media_id` int NOT NULL AUTO_INCREMENT,
  `related_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_id` int NOT NULL,
  `media_type` enum('IMAGE','VIDEO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_order` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'posts',1,'IMAGE','/uploads/posts/1_jeju_beach.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(2,'posts',1,'IMAGE','/uploads/posts/1_sunset.jpg',2,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(3,'posts',2,'VIDEO','/uploads/posts/2_cafe_vlog.mp4',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(4,'posts',3,'IMAGE','/uploads/posts/3_hiking.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(5,'posts',4,'IMAGE','/uploads/posts/4_food_trip.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(6,'product',1,'IMAGE','/uploads/products/1_main.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(7,'product',1,'IMAGE','/uploads/products/1_detail_1.jpg',2,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(8,'product',2,'IMAGE','/uploads/products/2_main.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(9,'product',3,'VIDEO','/uploads/products/3_review.mp4',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(10,'product',4,'IMAGE','/uploads/products/4_thumbnail.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(11,'camping_log',1,'IMAGE','/uploads/camping/1_tent_setup.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(12,'camping_log',1,'IMAGE','/uploads/camping/1_campfire.jpg',2,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(13,'camping_log',2,'VIDEO','/uploads/camping/2_morning_scenery.mp4',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(14,'camping_log',3,'IMAGE','/uploads/camping/3_mountain_view.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22'),(15,'camping_log',4,'IMAGE','/uploads/camping/4_river_side.jpg',1,'2025-10-30 02:10:22','2025-10-30 02:10:22');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2025-10-30 01:09:46','credit_card',50000),(2,'2025-10-30 01:09:46','bank_transfer',75000);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'제주도 여행 중 찍은 사진입니다! :야자수:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(2,2,'오늘 점심으로 먹은 파스타가 정말 맛있었어요 :스파게티:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(3,3,'새로 산 노트북 개봉기 :컴퓨터::반짝임:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(4,4,'주말에 친구들과 등산 다녀왔어요 :산:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(5,5,'요즘 읽고 있는 책이 너무 감동적이에요 :책:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(6,6,'우리집 고양이 너무 귀엽죠? :고양이:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(7,7,'회사에서 프로젝트 발표 끝! 이제 한숨 돌립니다 :숨을_내쉬는_얼굴:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(8,8,'첫 마라톤 완주! 다리 아프지만 뿌듯해요 :달리는_남성:','2025-10-30 02:10:22','2025-10-30 02:10:22'),(9,9,'새로운 커피숍 발견:커피: 분위기가 정말 좋아요.','2025-10-30 02:10:22','2025-10-30 02:10:22'),(10,10,'비 오는 날엔 라디오 들으면서 쉬는 게 최고네요 :비구름:','2025-10-30 02:10:22','2025-10-30 02:10:22');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int NOT NULL,
  `free_shipping` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'캠핑용 텐트 A',89000,1),(2,'캠핑 체어 B',45000,0),(3,'랜턴 C',32000,1),(4,'캠핑 테이블 D',56000,0),(5,'휴대용 버너 E',41000,1),(6,'코펠 세트 F',38000,0),(7,'보온병 G',22000,1),(8,'수납함 H',27000,0),(9,'침낭 I',65000,1),(10,'해먹 J',49000,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,2),(5,5,4),(6,6,4),(7,7,7),(8,8,6),(9,9,8),(10,10,9);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `product_id` int NOT NULL,
  `shipping_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES (1,'무료배송 / 2~3일 소요','7일 이내 교환 가능','폴리에스터 원단, 방수 처리','캠프라인 공식몰'),(2,'3,000원 유료배송','상품 수령 후 7일 이내 교환 가능','알루미늄 프레임, 접이식','코베아 직영'),(3,'무료배송 / 당일 출고','불량시 즉시 교환','충전식 랜턴, 밝기 조절 가능','스노우피크 코리아'),(4,'유료배송 / 2일 내 출고','단순 변심 불가','내열 내수 테이블','노르디스크'),(5,'무료배송 / 제주 추가요금','교환/반품 가능','가스식 휴대용 버너','헬리녹스 온라인샵'),(6,'3,000원 배송비','상품 불량시 교환','스테인리스 5종 세트','블랙야크 스토어'),(7,'무료배송','단순 변심 5일 이내 반품 가능','보온력 우수한 스테인리스','네이처하이크'),(8,'2,500원 배송비','교환 불가','폴리프로필렌 수납박스','캠핑앤피크'),(9,'무료배송','7일 이내 교환 가능','솜 충전, 방한 기능 우수','미니멀웍스'),(10,'무료배송 / 1일 출고','파손시 교환 가능','통기성 원단 해먹','아이더 공식몰');
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stock`
--

DROP TABLE IF EXISTS `product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_stock` (
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock`
--

LOCK TABLES `product_stock` WRITE;
/*!40000 ALTER TABLE `product_stock` DISABLE KEYS */;
INSERT INTO `product_stock` VALUES (1,50,'2025-10-30 02:10:22'),(2,20,'2025-10-30 02:10:22'),(3,80,'2025-10-30 02:10:22'),(4,30,'2025-10-30 02:10:22'),(5,40,'2025-10-30 02:10:22'),(6,25,'2025-10-30 02:10:22'),(7,60,'2025-10-30 02:10:22'),(8,35,'2025-10-30 02:10:22'),(9,15,'2025-10-30 02:10:22'),(10,45,'2025-10-30 02:10:22');
/*!40000 ALTER TABLE `product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'서울','서울특별시'),(2,'경기도','경기도');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `payment_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_in` timestamp NOT NULL,
  `check_out` timestamp NOT NULL,
  `state` enum('RESERVED','CHECKED_IN','CANCELLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'RESERVED',
  PRIMARY KEY (`reservation_id`),
  KEY `user_id` (`user_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'2025-10-30 01:10:17','2025-11-01 05:00:00','2025-11-02 02:00:00','RESERVED'),(2,2,2,'2025-10-30 01:10:17','2025-11-08 05:00:00','2025-11-09 02:00:00','RESERVED');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'텐트 설치도 쉽고 방수도 잘 됩니다.'),(2,2,2,'의자 튼튼하고 접을 때 부드러워요.'),(3,3,3,'랜턴 밝기가 조절되어 너무 좋아요.'),(4,4,4,'테이블 무게감이 있어서 안정적입니다.'),(5,5,5,'버너 화력 좋고 가벼워서 만족해요.'),(6,1,6,'코펠 세트 깔끔하고 가성비 좋아요.'),(7,2,7,'보온병 하루종일 따뜻하게 유지돼요.'),(8,3,8,'수납함 크기 적당하고 실용적이에요.'),(9,4,9,'침낭 따뜻하고 부드러워서 만족합니다.'),(10,5,10,'해먹 편하고 튼튼해서 추천합니다.');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_history` (
  `search_history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`search_history_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_history`
--

LOCK TABLES `search_history` WRITE;
/*!40000 ALTER TABLE `search_history` DISABLE KEYS */;
INSERT INTO `search_history` VALUES (1,1,'서울 캠핑장','2025-10-30 01:10:20'),(2,2,'가평 캠핑장','2025-10-30 01:10:20');
/*!40000 ALTER TABLE `search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_history`
--

DROP TABLE IF EXISTS `stock_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity_change` int NOT NULL,
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_history`
--

LOCK TABLES `stock_history` WRITE;
/*!40000 ALTER TABLE `stock_history` DISABLE KEYS */;
INSERT INTO `stock_history` VALUES (1,1,50,'초기 입고','2025-10-30 02:10:22'),(2,2,20,'초기 입고','2025-10-30 02:10:22'),(3,3,80,'초기 입고','2025-10-30 02:10:22'),(4,4,30,'초기 입고','2025-10-30 02:10:22'),(5,5,40,'초기 입고','2025-10-30 02:10:22'),(6,6,25,'초기 입고','2025-10-30 02:10:22'),(7,7,60,'초기 입고','2025-10-30 02:10:22'),(8,8,35,'초기 입고','2025-10-30 02:10:22'),(9,9,15,'초기 입고','2025-10-30 02:10:22'),(10,10,45,'초기 입고','2025-10-30 02:10:22');
/*!40000 ALTER TABLE `stock_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'chulsoo','chulsoo@example.com','chul234!','01012345678','2025-10-30 02:10:22'),(2,'minji','minji@example.com','minji567!','01023456789','2025-10-30 02:10:22'),(3,'haneul','haneul@example.com','sky890!','01034567890','2025-10-30 02:10:22'),(4,'jisoo','jisoo@example.com','jisoo123!','01045678901','2025-10-30 02:10:22'),(5,'donghyun','donghyun@example.com','dong456!','01056789012','2025-10-30 02:10:22'),(6,'suhyun','suhyun@example.com','su789!','01067890123','2025-10-30 02:10:22'),(7,'yuna','yuna@example.com','yuna000!','01078901234','2025-10-30 02:10:22'),(8,'taemin','taemin@example.com','tae321!','01089012345','2025-10-30 02:10:22'),(9,'harin','harin@example.com','hari999!','01090123456','2025-10-30 02:10:22'),(10,'jinho','jinho@example.com','jin555!','01091234567','2025-10-30 02:10:22');
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

-- Dump completed on 2025-10-30 11:46:11
