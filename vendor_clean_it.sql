/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.25a : Database - karl2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`karl2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `karl2`;

/*Data for the table `vendor_clean_it` */

insert  into `vendor_clean_it`(`tic_rowid`,`keyword`,`replace_with`,`replace_with_2nd_pass`,`maximum_pass`) values (111,' AMERICA ',' ',' ',1),(112,' AMERICAN ',' ',' ',1),(24,' ASSOC ',' ',' ',1),(26,' ASSOCIATION ',' ',' ASSOC ',2),(25,' ASSOCIATIONS ',' ',' ASSOC ',2),(134,' ATTORNEY ',' ',' ',1),(135,' ATTORNEYS ',' ',' ATTORNEY ',2),(123,' BANK ',' ',' ',1),(54,' BLDG ',' ',' ',1),(56,' BOARD ',' ',' ',1),(53,' BUILDING ',' ',' BLDG ',2),(61,' CENTER ',' ',' CTR',2),(108,' CHAPTER ',' ',' ',1),(105,' CHEM ',' ',' ',1),(106,' CHEMICAL ',' ',' CHEM ',2),(119,' CHEMICALS ',' ',' CHEM ',2),(10,' CO ',' ',' ',2),(42,' CO OP ',' ',' ',2),(69,' COMM ',' ',' ',1),(70,' COMMUNICATE ',' ',' COMM ',2),(71,' COMMUNICATION ',' ',' COMM ',2),(72,' COMMUNICATIONS ',' ',' COMM ',2),(11,' COMP ',' ',' ',2),(34,' COMPANY ',' ',' ',2),(131,' CONSULT ',' ',' ',1),(130,' CONSULTANT ',' ',' CONSULT ',2),(132,' CONSULTING ',' ',' CONSULT ',2),(78,' CONTRACTOR ',' ',' ',1),(79,' CONTRACTORS ',' ',' CONTRACTOR ',2),(43,' COOP ',' ',' ',2),(12,' CORP ',' ',' ',1),(16,' CORPOR ',' ',' CORP ',2),(15,' CORPORATION ',' ',' CORP ',2),(107,' COUNTRY ',' ',' ',1),(62,' CTR ',' ',' ',1),(29,' DEPART ',' ',' DEPT ',2),(30,' DEPARTMENT ',' ',' DEPT ',2),(28,' DEPT ',' ',' ',1),(45,' DEVELOPMENT ',' ',' ',1),(125,' DIV ',' ',' ',1),(126,' DIVISION ',' ',' DIV ',2),(127,' DIVISIONS ',' ',' DIV ',2),(31,' ELEC ',' ELECTRIC ',' ELECTRIC ',2),(86,' ENGINEER ',' ',' ',1),(87,' ENGINEERING ',' ',' ENGINEER ',2),(57,' ENT ',' ',' ',1),(58,' ENTERPRISE ',' ',' ENT ',2),(59,' ENTERPRISES ',' ',' ENT ',2),(98,' ENVIRON ',' ',' ENV  ',2),(99,' ENVIRONMENT ',' ',' ENV  ',2),(100,' ENVIRONMENTAL ',' ',' ENV  ',2),(41,' EQUIP ',' EQUIPMENT ',' EQUIPMENT ',2),(121,' EXPRESS ',' ',' ',1),(80,' FAB ',' ',' ',1),(81,' FABRICATION ',' ',' FAB ',2),(63,' FINANCE ',' ',' ',1),(64,' FINANCIAL ',' ',' FINANCE ',2),(128,' FREIGHT ',' ',' ',1),(129,' FRIEGHT ',' ',' FREIGHT ',2),(44,' GMBH ',' ',' ',2),(77,' GROUP ',' ',' GRP ',2),(133,' HOTEL ',' ',' ',1),(9,' INC ',' ',' ',2),(13,' INCORP',' ',' ',2),(142,' INCORPORATED ',' ',' ',2),(88,' INDUSTRIAL ',' ',' ',1),(89,' INDUSTRIES ',' ',' ',1),(90,' INDUSTRY ',' ',' ',1),(124,' INSTITUTE ',' ',' ',1),(51,' INT L ',' ',' INTL ',2),(52,' INTERNATIONAL ',' ',' INTL ',2),(115,' INTERPRISE ',' ',' ',1),(101,' INTL ',' ',' ',1),(18,' JR ',' ',' ',2),(118,' LABORATORIES ',' ',' LAB ',2),(117,' LABORATORY ',' ',' LAB ',2),(116,' LABS ',' ',' LAB ',2),(73,' LAW ',' ',' ',1),(33,' LIMITED ',' ',' LTD',2),(35,' LLC ',' ',' ',2),(92,' LOGISTICS ',' LOGISTIC ',' LOGISTIC ',2),(32,' LTD ',' ',' ',1),(23,' MANAGEMENT ',' ',' MGMT ',2),(22,' MGMT ',' ',' ',1),(110,' MOTOR ',' ',' ',1),(109,' MOTORS ',' ',' MOTOR ',2),(67,' NETWORK ',' ',' ',1),(68,' NETWORKING ',' ',' NETWORK ',2),(19,' OF ',' ',' ',2),(113,' PARTNER ',' ',' ',1),(114,' PARTNERS ',' ',' PARTNER ',2),(66,' PHONE ',' ',' ',1),(104,' RESEARCH ',' ',' ',1),(85,' RESOURCE ',' ',' ',1),(102,' RESTURANT ',' ',' RESTAURANT ',2),(40,' SA ',' ',' ',1),(122,' SAFTEY ',' ',' SAFETY ',2),(74,' SERVICES ',' SERVICE ',' SERVICE ',2),(82,' SOL ',' ',' SOLUTIONS ',2),(83,' SOLUTION ',' ',' SOLUTIONS ',2),(84,' SOLUTIONS ',' ',' ',1),(95,' SUPPL ',' ',' SUPPLY ',2),(94,' SUPPLIES ',' ',' SUPPLY ',2),(93,' SUPPLY ',' ',' ',1),(76,' SVC ',' SERVICE ',' SERVICE ',2),(46,' SYS ',' SYSTEM ',' SYSTEM ',2),(48,' SYSTEMS ',' SYSTEM ',' SYSTEM ',2),(55,' TAX ',' ',' ',1),(38,' TECH ',' ',' ',1),(136,' TECHNICAL ',' ',' TECH ',2),(39,' TECHNOLOGIES ',' ',' TECH ',2),(8,' THE',' ',' ',2),(103,' UNIT ',' ',' ',1),(96,' UNIV ',' ',' ',1),(97,' UNIVERSITY ',' ',' UNIV ',2),(20,' US ',' ',' ',1),(21,' USA ',' ',' US ',2),(65,' WIRELESS ',' ',' ',1),(120,' X PRESS ',' ',' EXPRESS ',1),(6,'ASSOCIATION',' ASSOC',' ASSOC',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
