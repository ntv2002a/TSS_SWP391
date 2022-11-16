unlock table;
DROP DATABASE IF EXISTS `swp391`;
CREATE DATABASE  IF NOT EXISTS `swp391` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `swp391`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: swp391
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `ass_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `ass_body` text,
  `eval_weight` int DEFAULT NULL,
  `is_team_work` bit(1) DEFAULT NULL,
  `is_ongoing` bit(1) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ass_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,4,'Progress Test 1','',10,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL),(2,5,'Progress Test 1','',10,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL),(3,1,'Assignment','',15,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL),(4,2,'Lab','',10,_binary '\0',_binary '\0',_binary '',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `trainee_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `comment` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`class_id`,`trainee_id`,`schedule_id`),
  KEY `class_id` (`class_id`),
  KEY `trainee_id` (`trainee_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`trainee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_code` varchar(20) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  `term_id` int DEFAULT NULL,
  `supporter_id` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`class_id`),
  KEY `subject_id` (`subject_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `term_id` (`term_id`),
  KEY `supporter_id` (`supporter_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_ibfk_3` FOREIGN KEY (`supporter_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_ibfk_4` FOREIGN KEY (`term_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'SE1627-NET',5,NULL,NULL,NULL,_binary '',''),(2,'SE1627-NET',1,NULL,NULL,NULL,_binary '',''),(3,'SE1624',2,NULL,NULL,NULL,_binary '',''),(4,'SE1628',3,NULL,NULL,NULL,_binary '',''),(5,'SE1623-JS',6,NULL,NULL,NULL,_binary '','');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_setting`
--

DROP TABLE IF EXISTS `class_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(50) DEFAULT NULL,
  `setting_value` varchar(50) DEFAULT NULL,
  `display_order` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `class_id` (`class_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `class_setting_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `class_setting_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_setting`
--

LOCK TABLES `class_setting` WRITE;
/*!40000 ALTER TABLE `class_setting` DISABLE KEYS */;
INSERT INTO `class_setting` VALUES (1,34,'Class Setting 1.1','','',_binary '\0','',1),(2,34,'Class Setting 1.2','','',_binary '','',1),(3,34,'Class Setting 1.3','','',_binary '','',2),(4,35,'Class Setting 2.1','','',_binary '','',2),(5,35,'Class Setting 2.2','','',_binary '','',3),(6,35,'Class Setting 2.3','','',_binary '','',3),(7,36,'Class Setting 3.1','','',_binary '','',4),(8,36,'Class Setting 3.2','','',_binary '','',4),(9,36,'Class Setting 3.3','','',_binary '','',5),(10,37,'Class Setting 4.1','','',_binary '','',5);
/*!40000 ALTER TABLE `class_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_user`
--

DROP TABLE IF EXISTS `class_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_user` (
  `user_id` int NOT NULL,
  `class_id` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `note` text,
  `dropout_date` date DEFAULT NULL,
  `ongoing_eval` int DEFAULT NULL,
  `final_eval` int DEFAULT NULL,
  `topic_eval` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`class_id`),
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `class_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `class_user_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_user`
--

LOCK TABLES `class_user` WRITE;
/*!40000 ALTER TABLE `class_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval_criteria`
--

DROP TABLE IF EXISTS `eval_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eval_criteria` (
  `criteria_id` int NOT NULL AUTO_INCREMENT,
  `ass_id` int NOT NULL,
  `milestone_id` int NOT NULL,
  `criteria_name` varchar(50) DEFAULT NULL,
  `is_team_eval` bit(1) DEFAULT NULL,
  `eval_weight` int DEFAULT NULL,
  `max_loc` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`criteria_id`),
  KEY `ass_id` (`ass_id`),
  KEY `milestone_id` (`milestone_id`),
  CONSTRAINT `eval_criteria_ibfk_1` FOREIGN KEY (`ass_id`) REFERENCES `assignment` (`ass_id`),
  CONSTRAINT `eval_criteria_ibfk_2` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval_criteria`
--

LOCK TABLES `eval_criteria` WRITE;
/*!40000 ALTER TABLE `eval_criteria` DISABLE KEYS */;
INSERT INTO `eval_criteria` VALUES (1,2,1,'',_binary '\0',2,0,_binary '\0','',NULL,NULL,4,'2022-10-17 10:37:09'),(2,3,2,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(3,3,3,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(4,3,4,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(5,3,5,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL),(6,4,6,'',_binary '\0',2,0,_binary '','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `eval_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `author_id` int NOT NULL,
  `assignee_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type_id` int NOT NULL,
  `status_id` int NOT NULL,
  `extra_labels` varchar(50) DEFAULT NULL,
  `description` text,
  `linked_ids` text,
  `gitlab_url` text,
  `is_close` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `team_id` (`team_id`),
  KEY `author_id` (`author_id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `type_id` (`type_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `issue_ibfk_3` FOREIGN KEY (`assignee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `issue_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `class_setting` (`setting_id`),
  CONSTRAINT `issue_ibfk_5` FOREIGN KEY (`status_id`) REFERENCES `class_setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loc_eval`
--

DROP TABLE IF EXISTS `loc_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loc_eval` (
  `loc_eval_id` int NOT NULL AUTO_INCREMENT,
  `complexity_id` int NOT NULL,
  `quality_id` int NOT NULL,
  `converted_loc` int DEFAULT NULL,
  `is_late_submit` bit(1) DEFAULT NULL,
  `comment` text,
  `new_milestone_id` int NOT NULL,
  `new_complexity_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`loc_eval_id`),
  KEY `complexity_id` (`complexity_id`),
  KEY `quality_id` (`quality_id`),
  KEY `new_milestone_id` (`new_milestone_id`),
  KEY `new_complexity_id` (`new_complexity_id`),
  CONSTRAINT `loc_eval_ibfk_1` FOREIGN KEY (`complexity_id`) REFERENCES `tracking` (`tracking_id`),
  CONSTRAINT `loc_eval_ibfk_2` FOREIGN KEY (`quality_id`) REFERENCES `tracking` (`tracking_id`),
  CONSTRAINT `loc_eval_ibfk_3` FOREIGN KEY (`new_milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `loc_eval_ibfk_4` FOREIGN KEY (`new_complexity_id`) REFERENCES `tracking` (`tracking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc_eval`
--

LOCK TABLES `loc_eval` WRITE;
/*!40000 ALTER TABLE `loc_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `loc_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_eval`
--

DROP TABLE IF EXISTS `member_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_eval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `evaluation_id` int NOT NULL,
  `criteria_id` int NOT NULL,
  `total_loc` int DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `comment` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluation_id` (`evaluation_id`),
  KEY `criteria_id` (`criteria_id`),
  CONSTRAINT `member_eval_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `milestone_eval` (`evaluation_id`),
  CONSTRAINT `member_eval_ibfk_2` FOREIGN KEY (`criteria_id`) REFERENCES `eval_criteria` (`criteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_eval`
--

LOCK TABLES `member_eval` WRITE;
/*!40000 ALTER TABLE `member_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone` (
  `milestone_id` int NOT NULL AUTO_INCREMENT,
  `ass_id` int NOT NULL,
  `class_id` int NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `ass_body` text,
  `description` text,
  `status` tinyint DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`milestone_id`),
  KEY `ass_id` (`ass_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `milestone_ibfk_1` FOREIGN KEY (`ass_id`) REFERENCES `assignment` (`ass_id`),
  CONSTRAINT `milestone_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
INSERT INTO `milestone` VALUES (1,1,1,'2022-10-05','2022-10-07','','','',1,NULL,NULL,NULL,NULL),(2,3,2,NULL,NULL,'Iter 1','','',0,NULL,NULL,NULL,NULL),(3,3,2,NULL,NULL,'Iter 2','','',1,NULL,NULL,NULL,NULL),(4,3,2,NULL,NULL,'Iter 3','','',2,NULL,NULL,NULL,NULL),(5,3,2,NULL,NULL,'Iter 4','','',0,NULL,NULL,NULL,NULL),(6,4,3,NULL,NULL,'','','',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone_eval`
--

DROP TABLE IF EXISTS `milestone_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone_eval` (
  `evaluation_id` int NOT NULL AUTO_INCREMENT,
  `milestone_id` int NOT NULL,
  `class_id` int NOT NULL,
  `bonus` double DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `comment` text,
  `submit_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `milestone_id` (`milestone_id`),
  KEY `class_id` (`class_id`),
  KEY `submit_id` (`submit_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `milestone_eval_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `milestone_eval_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `milestone_eval_ibfk_3` FOREIGN KEY (`submit_id`) REFERENCES `submit` (`submit_id`),
  CONSTRAINT `milestone_eval_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone_eval`
--

LOCK TABLES `milestone_eval` WRITE;
/*!40000 ALTER TABLE `milestone_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestone_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `screen_id` int NOT NULL,
  `role_id` int NOT NULL,
  `get_all_data` bit(1) DEFAULT NULL,
  `can_delete` bit(1) DEFAULT NULL,
  `can_add` bit(1) DEFAULT NULL,
  `can_edit` bit(1) DEFAULT NULL,
  PRIMARY KEY (`screen_id`,`role_id`),
  KEY `screen_id` (`screen_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (25,11,_binary '',_binary '',_binary '',_binary ''),(26,11,_binary '',_binary '',_binary '',_binary ''),(27,11,_binary '',_binary '',_binary '',_binary ''),(28,11,_binary '',_binary '',_binary '',_binary ''),(29,11,_binary '',_binary '',_binary '',_binary ''),(29,12,_binary '',_binary '\0',_binary '\0',_binary ''),(30,11,_binary '',_binary '',_binary '',_binary ''),(30,12,_binary '',_binary '',_binary '\0',_binary '\0'),(31,11,_binary '',_binary '',_binary '',_binary ''),(31,14,_binary '',_binary '\0',_binary '\0',_binary ''),(32,11,_binary '',_binary '',_binary '',_binary ''),(32,14,_binary '',_binary '\0',_binary '\0',_binary ''),(33,11,_binary '',_binary '',_binary '',_binary ''),(41,11,_binary '',_binary '',_binary '',_binary ''),(41,13,_binary '',_binary '',_binary '',_binary ''),(42,11,_binary '',_binary '',_binary '',_binary ''),(42,13,_binary '',_binary '',_binary '',_binary ''),(43,11,_binary '',_binary '',_binary '',_binary ''),(43,12,_binary '',_binary '',_binary '',_binary ''),(44,11,_binary '',_binary '',_binary '',_binary ''),(44,12,_binary '',_binary '',_binary '',_binary ''),(45,11,_binary '',_binary '',_binary '',_binary ''),(45,12,_binary '',_binary '',_binary '',_binary ''),(46,11,_binary '',_binary '',_binary '',_binary ''),(46,12,_binary '',_binary '',_binary '',_binary ''),(47,11,_binary '',_binary '',_binary '',_binary ''),(47,12,_binary '',_binary '',_binary '',_binary ''),(48,11,_binary '',_binary '',_binary '',_binary ''),(48,12,_binary '',_binary '',_binary '',_binary ''),(49,11,_binary '',_binary '',_binary '',_binary ''),(49,12,_binary '',_binary '',_binary '',_binary ''),(50,11,_binary '',_binary '',_binary '',_binary ''),(50,12,_binary '',_binary '',_binary '',_binary ''),(51,11,_binary '',_binary '',_binary '',_binary ''),(51,13,_binary '',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `slot_id` int DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `from_time` date DEFAULT NULL,
  `to_time` date DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `class_id` (`class_id`),
  KEY `slot_id` (`slot_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(50) DEFAULT NULL,
  `setting_value` varchar(50) DEFAULT NULL,
  `display_order` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,NULL,'User Role','dad','1',_binary '','hi :D',NULL,NULL,4,'2022-10-17 18:19:04'),(2,NULL,'Web Contact Category','','',_binary '','',NULL,NULL,4,'2022-10-13 10:09:12'),(3,NULL,'Class Setting Type','','',_binary '','',NULL,NULL,NULL,NULL),(4,NULL,'Subject Setting Type','','',_binary '','',NULL,NULL,NULL,NULL),(5,NULL,'System Screens','','',_binary '','',NULL,NULL,NULL,NULL),(11,1,'Administrator','','',_binary '','',NULL,NULL,6,'2022-10-06 11:49:23'),(12,1,'Manager','','',_binary '','',NULL,NULL,NULL,NULL),(13,1,'Trainer','','',_binary '','',NULL,NULL,NULL,NULL),(14,1,'Supporter','','',_binary '','',NULL,NULL,NULL,NULL),(15,1,'Expert','','',_binary '','',NULL,NULL,NULL,NULL),(16,1,'Client','','',_binary '','',NULL,NULL,4,'2022-10-08 20:54:05'),(17,1,'Guest','','',_binary '','',NULL,NULL,NULL,NULL),(18,5,'Home Page','/home','',_binary '','',NULL,NULL,NULL,NULL),(19,5,'Dashboard','manage/dashboard/view','',_binary '','',NULL,NULL,NULL,NULL),(20,5,'User Login','/Login','',_binary '','',NULL,NULL,NULL,NULL),(21,5,'Password Reset','/PasswordReset','',_binary '','',NULL,NULL,NULL,NULL),(22,5,'User Register','/Register','',_binary '','',NULL,NULL,NULL,NULL),(23,5,'User Profile','/profile','',_binary '','',NULL,NULL,NULL,NULL),(24,5,'Password Change','/changepassword','',_binary '','',NULL,NULL,NULL,NULL),(25,5,'Setting List','/manage/setting/list','',_binary '','',NULL,NULL,NULL,NULL),(26,5,'Setting Details','/manage/setting/detail','',_binary '','',NULL,NULL,NULL,NULL),(27,5,'User List','/manage/user/list','',_binary '','',NULL,NULL,NULL,NULL),(28,5,'User Details','/manage/user/detail','',_binary '','',NULL,NULL,NULL,NULL),(29,5,'Subject List','/manage/subject/list','',_binary '','',NULL,NULL,NULL,NULL),(30,5,'Subject Details','/manage/subject/detail','',_binary '','',NULL,NULL,NULL,NULL),(31,5,'Web Contact List','/contact/list','',_binary '','',NULL,NULL,NULL,NULL),(32,5,'Web Contact Details','/contact/detail','',_binary '','',NULL,NULL,NULL,NULL),(33,5,'System Permission','/manage/system/permission','',_binary '','',NULL,NULL,NULL,NULL),(34,3,'Class Setting Type1','','',_binary '','',NULL,NULL,NULL,NULL),(35,3,'Class Setting Type2','','',_binary '','',NULL,NULL,NULL,NULL),(36,3,'Class Setting Type3','','',_binary '','',NULL,NULL,NULL,NULL),(37,3,'Class Setting Type4','','',_binary '','',NULL,NULL,NULL,NULL),(41,5,'Milestone List','/manage/milestone/list','',_binary '','',NULL,NULL,NULL,NULL),(42,5,'Milestone Detail','/manage/milestone/detail','',_binary '','',NULL,NULL,NULL,NULL),(43,5,'Assignment List','/manage/assignment/list','',_binary '','',NULL,NULL,NULL,NULL),(44,5,'Assignment Details','/manage/assignment/detail','',_binary '','',NULL,NULL,NULL,NULL),(45,5,'Subject Setting List','/subjectsettinglist','',_binary '','',NULL,NULL,NULL,NULL),(46,5,'Subject Setting Detail','/subjectsettingdetail','',_binary '','',NULL,NULL,NULL,NULL),(47,5,'Eval Criteria List','/manage/evalcriteria/list','',_binary '','',NULL,NULL,NULL,NULL),(48,5,'Eval Criteria Detail','/manage/evalcriteria/detail','',_binary '','',NULL,NULL,NULL,NULL),(49,5,'Class List','/class/list','',_binary '','',NULL,NULL,NULL,NULL),(50,5,'Class Detail','/class/detail','',_binary '','',NULL,NULL,NULL,NULL),(51,5,'Class Setting List','/manage/classsetting/list','',_binary '','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(20) DEFAULT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `expert_id` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `body` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `manager_id` (`manager_id`),
  KEY `expert_id` (`expert_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`expert_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'SWP391','Application development project',3,3,_binary '','',NULL,NULL,NULL,NULL),(2,'PRJ301','Java Web Application Development',5,1,_binary '\0','',NULL,NULL,NULL,NULL),(3,'LAB211','OOP with Java Lab',6,9,_binary '','',NULL,NULL,NULL,NULL),(4,'SWR302','Software Requirement',4,NULL,_binary '','',NULL,NULL,NULL,NULL),(5,'SWT301','Software Testing',5,7,_binary '','',NULL,NULL,NULL,NULL),(6,'JPD133','Elementary Japanese1-A1/A2',4,1,_binary '','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_setting`
--

DROP TABLE IF EXISTS `subject_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(50) DEFAULT NULL,
  `setting_value` varchar(50) DEFAULT NULL,
  `display_order` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `subject_id` (`subject_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `subject_setting_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `subject_setting_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_setting`
--

LOCK TABLES `subject_setting` WRITE;
/*!40000 ALTER TABLE `subject_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submit`
--

DROP TABLE IF EXISTS `submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submit` (
  `submit_id` int NOT NULL AUTO_INCREMENT,
  `milestone_id` int NOT NULL,
  `class_id` int NOT NULL,
  `team_id` int NOT NULL,
  `submit_file_url` text,
  `submit_time` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`submit_id`),
  KEY `milestone_id` (`milestone_id`),
  KEY `class_id` (`class_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `submit_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `submit_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `submit_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `submit_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submit`
--

LOCK TABLES `submit` WRITE;
/*!40000 ALTER TABLE `submit` DISABLE KEYS */;
/*!40000 ALTER TABLE `submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `team_code` varchar(50) DEFAULT NULL,
  `topic_name` varchar(50) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`team_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_eval`
--

DROP TABLE IF EXISTS `team_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_eval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `criteria_id` int NOT NULL,
  `submit_id` int NOT NULL,
  `grade` double DEFAULT NULL,
  `comment` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_id` (`criteria_id`),
  KEY `submit_id` (`submit_id`),
  CONSTRAINT `team_eval_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `eval_criteria` (`criteria_id`),
  CONSTRAINT `team_eval_ibfk_2` FOREIGN KEY (`submit_id`) REFERENCES `submit` (`submit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_eval`
--

LOCK TABLES `team_eval` WRITE;
/*!40000 ALTER TABLE `team_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_member` (
  `team_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_leader` bit(1) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`team_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `team_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `team_member_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `tracking_id` int NOT NULL AUTO_INCREMENT,
  `milestone_id` int NOT NULL,
  `issue_id` int NOT NULL,
  `author_id` int NOT NULL,
  `assignee_id` int NOT NULL,
  `submit_id` int NOT NULL,
  `change_log` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tracking_id`),
  KEY `milestone_id` (`milestone_id`),
  KEY `issue_id` (`issue_id`),
  KEY `author_id` (`author_id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `submit_id` (`submit_id`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`),
  CONSTRAINT `tracking_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tracking_ibfk_4` FOREIGN KEY (`assignee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `tracking_ibfk_5` FOREIGN KEY (`submit_id`) REFERENCES `submit` (`submit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_history`
--

DROP TABLE IF EXISTS `update_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `update_history` (
  `update_history_id` int NOT NULL AUTO_INCREMENT,
  `tracking_id` int NOT NULL,
  `milestone_id` int NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_title` varchar(50) DEFAULT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`update_history_id`),
  KEY `tracking_id` (`tracking_id`),
  KEY `milestone_id` (`milestone_id`),
  CONSTRAINT `update_history_ibfk_1` FOREIGN KEY (`tracking_id`) REFERENCES `tracking` (`tracking_id`),
  CONSTRAINT `update_history_ibfk_2` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_history`
--

LOCK TABLES `update_history` WRITE;
/*!40000 ALTER TABLE `update_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` char(11) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avatar_url` text,
  `address` text,
  `position` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `status` int DEFAULT '0',
  `note` text,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyen The Duy','duynthe164001@fpt.edu.vn','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(2,'Nguyen Trung Vu','vunthe163585@fpt.edu.vn','','12345','',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL),(3,'Nguyen Thanh Nam','namnthe141488@fpt.edu.vn','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(4,'Pham Danh Trung Nguyen','nguyenpdt164016@fpt.edu.vn','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(5,'Duong Phuong Tuan','tuandphe153689@fpt.edu.vn','','12345','',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL),(6,'Nguyen Van A','abc@gmail.com','','12345','',NULL,NULL,NULL,0,'',NULL,NULL,NULL,NULL),(7,'Nguyen Van B','bcd@gmail.com','','12345','',NULL,NULL,NULL,0,'',NULL,NULL,NULL,NULL),(8,'Nguyen Van C','cde@gmail.com','','12345','',NULL,NULL,NULL,0,'',NULL,NULL,NULL,NULL),(9,'Nguyen Van D','def@gmail.com','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL),(10,'Nguyen Van E','efg@gmail.com','','12345','',NULL,NULL,NULL,1,' ',NULL,NULL,NULL,NULL),(11,'Nguyen Van F','fgh@gmail.com','','12345','',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `is_leader` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,11,NULL,NULL,NULL,NULL,NULL),(1,15,NULL,NULL,NULL,NULL,NULL),(2,11,NULL,NULL,NULL,NULL,NULL),(3,11,NULL,NULL,NULL,NULL,NULL),(4,11,NULL,NULL,NULL,NULL,NULL),(4,12,NULL,NULL,NULL,NULL,NULL),(5,11,NULL,NULL,NULL,NULL,NULL),(5,12,NULL,NULL,NULL,NULL,NULL),(6,12,NULL,NULL,NULL,NULL,NULL),(7,13,NULL,NULL,NULL,NULL,NULL),(8,14,NULL,NULL,NULL,NULL,NULL),(9,15,NULL,NULL,NULL,NULL,NULL),(10,16,NULL,NULL,NULL,NULL,NULL),(11,17,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_contact`
--

DROP TABLE IF EXISTS `web_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_contact` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` char(11) DEFAULT NULL,
  `message` text,
  `response` text,
  `status` bit(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `web_contact_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_contact`
--

LOCK TABLES `web_contact` WRITE;
/*!40000 ALTER TABLE `web_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_contact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-17 23:55:38
