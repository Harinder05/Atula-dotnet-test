-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: atuladb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FirstName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LastName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('17959895-4516-40f9-8b2d-30221ed27f7b','John','Doe','johndoe@gmail.com','JOHNDOE@GMAIL.COM','johndoe@gmail.com','JOHNDOE@GMAIL.COM',0,'AQAAAAIAAYagAAAAECHPzIvZxURVArwBwIxE4j0DV6EZ00paCGQzFDfUmPkaRRQrQsoT+0YbS3sCabCT2g==','HUMXONM4ZCICHTAYC56RD24LZJDSML52','08afe6f4-aa04-47e5-a359-b019e41049bd',NULL,0,0,NULL,1,0),('2178a5fb-aa78-4c5d-b75c-8973ee30bf33','Jane','Doe','janedoe@gmail.com','JANEDOE@GMAIL.COM','janedoe@gmail.com','JANEDOE@GMAIL.COM',0,'AQAAAAIAAYagAAAAEKe4XLIpyqSKQ35CnZN4KjtUJfhgqiaMgT6nVw4Vg81EgTaUJvDYHIHiEBhRwlcU0Q==','5CPD4DHCQUH6KWEVWTM54FQ5EVSVTIYN','f336e196-6bbc-4d90-b60d-6ad54dc64ef7',NULL,0,0,NULL,1,0),('33126b19-020a-48f4-b43c-59d0b380d774','User','2','user2@gmail.com','USER2@GMAIL.COM','user2@gmail.com','USER2@GMAIL.COM',0,'AQAAAAIAAYagAAAAELzzFgjM8JupqEEZJT7DYWelVmArKRWtCRgGAVlFAlaP7r9tHgVR+Jl4LGNXdXUb/A==','D3BHAWNNRNE32PSQOYIY372FLGWJ2FVJ','acee5cdf-91a0-4f87-afcd-c1764076343f',NULL,0,0,NULL,1,0),('351f1d9e-e382-49b6-acdd-be55b6ceaf62','User','1','user1@gmail.com','USER1@GMAIL.COM','user1@gmail.com','USER1@GMAIL.COM',0,'AQAAAAIAAYagAAAAEAwXXi2iQ8jWCCA/e5SOfmxqOAXvFrPB6dfCuQ1Tc9o6QG8Wk3gWPkK2e5WlcnMnOA==','BBCNEV5O6MBTRCCAZD3I25NN6XJWLDSD','1430b3c9-67d6-488b-aa0f-a036ab344444',NULL,0,0,NULL,1,0),('5c46c90c-54e0-4f38-92a6-7b9623644a14','User','3','user3@gmail.com','USER3@GMAIL.COM','user3@gmail.com','USER3@GMAIL.COM',0,'AQAAAAIAAYagAAAAEAEE01HggcVhsel6HOsXILUbcELZttlFEPZHybA93qCbkwUMelS8dAz33fqJsn/dWA==','SPDXN77QIRRDZPWNCYTRPP2HJRGEKQ5K','b621f88e-2b0b-4e80-82db-2dd7ff312fb7',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 13:10:25
