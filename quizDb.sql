-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: quizDb
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.23.10.2

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
-- Table structure for table `AnswerTF`
--

DROP TABLE IF EXISTS `AnswerTF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AnswerTF` (
  `answerTfId` int NOT NULL,
  `isTrue` tinyint DEFAULT NULL,
  `question_questionId` int NOT NULL,
  PRIMARY KEY (`answerTfId`),
  KEY `fk_answerTF_question1_idx` (`question_questionId`),
  CONSTRAINT `fk_answerTF_question1` FOREIGN KEY (`question_questionId`) REFERENCES `Questions` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Answers`
--

DROP TABLE IF EXISTS `Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Answers` (
  `answerId` int NOT NULL AUTO_INCREMENT,
  `questionId` int NOT NULL,
  `contentAnswer` varchar(45) DEFAULT NULL,
  `isCorrect` tinyint DEFAULT NULL,
  PRIMARY KEY (`answerId`),
  UNIQUE KEY `answerId_UNIQUE` (`answerId`),
  KEY `fk_answer_question1_idx` (`questionId`),
  CONSTRAINT `fk_answer_question1` FOREIGN KEY (`questionId`) REFERENCES `Questions` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bullteins`
--

DROP TABLE IF EXISTS `Bullteins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bullteins` (
  `bullteinId` int NOT NULL AUTO_INCREMENT,
  `anneeScolaire` int DEFAULT NULL,
  `trimestre` int DEFAULT NULL,
  `noteBulltein` double DEFAULT NULL,
  `student_studentId` int NOT NULL,
  PRIMARY KEY (`bullteinId`),
  UNIQUE KEY `bullteinId_UNIQUE` (`bullteinId`),
  KEY `fk_bulltein_student1_idx` (`student_studentId`),
  CONSTRAINT `fk_bulltein_student1` FOREIGN KEY (`student_studentId`) REFERENCES `Students` (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Compts`
--

DROP TABLE IF EXISTS `Compts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compts` (
  `parent_parentId` int NOT NULL,
  `student_studentId` int NOT NULL,
  PRIMARY KEY (`parent_parentId`,`student_studentId`),
  KEY `fk_parent_has_student_student1_idx` (`student_studentId`),
  KEY `fk_parent_has_student_parent1_idx` (`parent_parentId`),
  CONSTRAINT `fk_parent_has_student_parent1` FOREIGN KEY (`parent_parentId`) REFERENCES `Parents` (`parentId`),
  CONSTRAINT `fk_parent_has_student_student1` FOREIGN KEY (`student_studentId`) REFERENCES `Students` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Exercices`
--

DROP TABLE IF EXISTS `Exercices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exercices` (
  `exerciceId` int NOT NULL AUTO_INCREMENT,
  `matiereName` int DEFAULT NULL,
  `anneeScolaire` int DEFAULT NULL,
  `trimestre` int DEFAULT NULL,
  `unitNumber` int DEFAULT NULL,
  `scoreExo` int DEFAULT NULL,
  `levlExo` int DEFAULT NULL,
  PRIMARY KEY (`exerciceId`),
  UNIQUE KEY `exerciceId_UNIQUE` (`exerciceId`),
  KEY `fk_exercice_matiere1_idx` (`matiereName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Infos`
--

DROP TABLE IF EXISTS `Infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Infos` (
  `infoId` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`infoId`),
  UNIQUE KEY `infoId_UNIQUE` (`infoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Matieres`
--

DROP TABLE IF EXISTS `Matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Matieres` (
  `matiereId` int NOT NULL AUTO_INCREMENT,
  `bullteinId` int NOT NULL,
  `anneeScolaire` int DEFAULT NULL,
  `trimestre` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `noteExam` double DEFAULT NULL,
  `noteDevoir1` double DEFAULT NULL,
  `noteDevoir2` double DEFAULT NULL,
  PRIMARY KEY (`matiereId`),
  UNIQUE KEY `matiereId_UNIQUE` (`matiereId`),
  KEY `fk_matiere_bulltein1_idx` (`bullteinId`),
  CONSTRAINT `fk_Matieres_1` FOREIGN KEY (`bullteinId`) REFERENCES `Bullteins` (`bullteinId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NoteMatieres`
--

DROP TABLE IF EXISTS `NoteMatieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NoteMatieres` (
  `noteMatiereId` int NOT NULL AUTO_INCREMENT,
  `noteDevoir1` double DEFAULT NULL,
  `noteDevoir2` double DEFAULT NULL,
  `noteExam` double DEFAULT NULL,
  PRIMARY KEY (`noteMatiereId`),
  UNIQUE KEY `noteMatiereId_UNIQUE` (`noteMatiereId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Parents`
--

DROP TABLE IF EXISTS `Parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parents` (
  `parentId` int NOT NULL AUTO_INCREMENT,
  `parentPassword` varchar(45) DEFAULT NULL,
  `Infos_infoId` int NOT NULL,
  PRIMARY KEY (`parentId`,`Infos_infoId`),
  UNIQUE KEY `parentId_UNIQUE` (`parentId`),
  KEY `fk_Parents_Infos1_idx` (`Infos_infoId`),
  CONSTRAINT `fk_Parents_Infos1` FOREIGN KEY (`Infos_infoId`) REFERENCES `Infos` (`infoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `questionId` int NOT NULL AUTO_INCREMENT,
  `exerciceId` int NOT NULL,
  `contentQuestion` varchar(45) DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `anneeScolaire` int DEFAULT NULL,
  `trimestre` int DEFAULT NULL,
  `unitNumber` int DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  UNIQUE KEY `questionId_UNIQUE` (`questionId`),
  KEY `fk_question_exercice1_idx` (`exerciceId`),
  CONSTRAINT `fk_question_exercice1` FOREIGN KEY (`exerciceId`) REFERENCES `Exercices` (`exerciceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `studentId` int NOT NULL AUTO_INCREMENT,
  `studentPassword` varchar(45) DEFAULT NULL,
  `anneeScolaire` int DEFAULT NULL,
  `studentScore` int DEFAULT NULL,
  `Infos_infoId` int DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE KEY `studentId_UNIQUE` (`studentId`),
  KEY `fk_Students_Infos1_idx` (`Infos_infoId`),
  CONSTRAINT `fk_Students_Infos1` FOREIGN KEY (`Infos_infoId`) REFERENCES `Infos` (`infoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_solve_exercices`
--

DROP TABLE IF EXISTS `students_solve_exercices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_solve_exercices` (
  `student_studentId` int NOT NULL,
  `exercice_exerciceId` int NOT NULL,
  PRIMARY KEY (`student_studentId`),
  KEY `fk_student_has_exercice_exercice1_idx` (`exercice_exerciceId`),
  KEY `fk_student_has_exercice_student1_idx` (`student_studentId`),
  CONSTRAINT `fk_student_has_exercice_exercice1` FOREIGN KEY (`exercice_exerciceId`) REFERENCES `Exercices` (`exerciceId`),
  CONSTRAINT `fk_student_has_exercice_student1` FOREIGN KEY (`student_studentId`) REFERENCES `Students` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_sontFaibles_matieres`
--

DROP TABLE IF EXISTS `students_sontFaibles_matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_sontFaibles_matieres` (
  `student_studentId` int NOT NULL,
  `matiere_matiereId` int NOT NULL,
  PRIMARY KEY (`student_studentId`),
  KEY `fk_student_has_matiere_student1_idx` (`student_studentId`),
  KEY `fk_student_has_matiere_matiere1_idx` (`matiere_matiereId`),
  CONSTRAINT `fk_student_has_matiere_matiere1` FOREIGN KEY (`matiere_matiereId`) REFERENCES `Matieres` (`matiereId`),
  CONSTRAINT `fk_student_has_matiere_student1` FOREIGN KEY (`student_studentId`) REFERENCES `Students` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-02 15:31:02
