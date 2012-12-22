/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.25a : Database - karl
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`karl` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `karl`;

/*Table structure for table `vendor_address_clean` */

DROP TABLE IF EXISTS `vendor_address_clean`;

CREATE TABLE `vendor_address_clean` (
  `tic_rowid` int(11) NOT NULL AUTO_INCREMENT,
  `custacctnumber` varchar(30) DEFAULT NULL,
  `sys` varchar(30) DEFAULT NULL,
  `vend_num` varchar(25) DEFAULT NULL,
  `vend_site_id` varchar(25) DEFAULT NULL,
  `vendor_type` varchar(100) DEFAULT NULL,
  `vendor_name` varchar(100) DEFAULT NULL,
  `address_line_1` varchar(100) DEFAULT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `address_line_3` varchar(100) DEFAULT NULL,
  `address_line_4` varchar(100) DEFAULT NULL,
  `po_box_num` varchar(25) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `tax_id` varchar(20) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `contact_email` varchar(1000) DEFAULT NULL,
  `last_activity_date` datetime DEFAULT NULL,
  `spend` decimal(12,2) DEFAULT NULL,
  `vend_first_letter` varchar(1) DEFAULT NULL,
  `vend_first_word` varchar(100) DEFAULT NULL,
  `clean_vend_name` varchar(100) DEFAULT NULL,
  `clean_vend_name_first_pass` varchar(100) DEFAULT NULL,
  `standard_vend_name` varchar(100) DEFAULT NULL,
  `vend_name_len` int(11) DEFAULT NULL,
  `address_num` varchar(100) DEFAULT NULL,
  `city_first_letter` varchar(1) DEFAULT NULL,
  `state_first_letter` varchar(1) DEFAULT NULL,
  `zip_5_char` varchar(5) DEFAULT NULL,
  `tax_id_clean` varchar(20) DEFAULT NULL,
  `phone_10_digit` varchar(35) DEFAULT NULL,
  `phone_9_digit` varchar(9) DEFAULT NULL,
  `phone_8_digit` varchar(8) DEFAULT NULL,
  `phone_7_digit` varchar(7) DEFAULT NULL,
  `phone_6_digit` varchar(6) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `type_po_box` varchar(1) DEFAULT NULL,
  `type_comp_tax_id` varchar(50) DEFAULT NULL,
  `type_dba_id` varchar(50) DEFAULT NULL,
  `session_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vac_custacctnumber_key` (`custacctnumber`),
  KEY `vac_clean_vend_name_key` (`clean_vend_name`),
  KEY `vac_sys_key` (`sys`),
  KEY `vac_vend_num_key` (`vend_num`),
  KEY `vac_site_id_key` (`vend_site_id`),
  KEY `vac_phone_10_key` (`phone_10_digit`),
  KEY `vac_tax_key` (`tax_id_clean`),
  KEY `vac_session_key` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18670 DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_address_clean_keywords` */

DROP TABLE IF EXISTS `vendor_address_clean_keywords`;

CREATE TABLE `vendor_address_clean_keywords` (
  `tic_rowid` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_clean_tic_rowid` int(11) DEFAULT NULL,
  `keyword` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vack_clean_ticrow_key` (`vendor_clean_tic_rowid`),
  KEY `vack_keyword_key` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=65853 DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_all` */

DROP TABLE IF EXISTS `vendor_all`;

CREATE TABLE `vendor_all` (
  `TIC_ROWID` int(10) NOT NULL,
  `TIC_IMPORT_DATE` timestamp NULL DEFAULT NULL,
  `sys` varchar(30) DEFAULT NULL,
  `vend_num` varchar(25) DEFAULT NULL,
  `vend_commod` varchar(100) DEFAULT NULL,
  `Created_on` timestamp NULL DEFAULT NULL,
  `Created_by` varchar(50) DEFAULT NULL,
  `vend_type` varchar(50) DEFAULT NULL,
  `cust_num` varchar(25) DEFAULT NULL,
  `gl_ap_acct` varchar(20) DEFAULT NULL,
  `vend_name` varchar(100) DEFAULT NULL,
  `vend_name2` varchar(100) DEFAULT NULL,
  `vend_name3` varchar(100) DEFAULT NULL,
  `vend_name4` varchar(100) DEFAULT NULL,
  `Del_flag` varchar(4) DEFAULT NULL,
  `Post_blk` varchar(4) DEFAULT NULL,
  `PO_blk` varchar(4) DEFAULT NULL,
  `Inv_blk` varchar(4) DEFAULT NULL,
  `Check_blk` varchar(4) DEFAULT NULL,
  `on_hold` varchar(4) DEFAULT NULL,
  `tax_id` varchar(20) DEFAULT NULL,
  `tax_id2` varchar(20) DEFAULT NULL,
  `one_time` varchar(4) DEFAULT NULL,
  `VAT_num` varchar(20) DEFAULT NULL,
  `plant` varchar(4) DEFAULT NULL,
  `min_code` varchar(20) DEFAULT NULL,
  `payment_terms` varchar(25) DEFAULT NULL,
  KEY `va001` (`sys`,`vend_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_all_addr` */

DROP TABLE IF EXISTS `vendor_all_addr`;

CREATE TABLE `vendor_all_addr` (
  `TIC_ROWID` int(10) NOT NULL,
  `TIC_IMPORT_DATE` timestamp NULL DEFAULT NULL,
  `sys` varchar(30) DEFAULT NULL,
  `vend_num` varchar(25) DEFAULT NULL,
  `vend_seq_num` int(10) DEFAULT NULL,
  `vend_site_id` varchar(25) DEFAULT NULL,
  `Effective_on` timestamp NULL DEFAULT NULL,
  `Active` varchar(4) DEFAULT NULL,
  `Created_by` varchar(50) DEFAULT NULL,
  `vend_name` varchar(100) DEFAULT NULL,
  `vend_name2` varchar(100) DEFAULT NULL,
  `vend_name3` varchar(100) DEFAULT NULL,
  `vend_name4` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `po_box` varchar(25) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `Del_flag` varchar(4) DEFAULT NULL,
  `Post_blk` varchar(4) DEFAULT NULL,
  `PO_blk` varchar(4) DEFAULT NULL,
  `Inv_blk` varchar(4) DEFAULT NULL,
  `Check_blk` varchar(4) DEFAULT NULL,
  `on_hold` varchar(4) DEFAULT NULL,
  `Telephone1` varchar(35) DEFAULT NULL,
  `Telephone2` varchar(35) DEFAULT NULL,
  `Fax` varchar(35) DEFAULT NULL,
  `one_time` varchar(4) DEFAULT NULL,
  `plant` varchar(4) DEFAULT NULL,
  `company` varchar(25) DEFAULT NULL,
  `email` text,
  `Year` smallint(5) DEFAULT NULL,
  `month` tinyint(3) unsigned DEFAULT NULL,
  `Quarter` tinyint(3) unsigned DEFAULT NULL,
  `flex1` varchar(200) DEFAULT NULL,
  `flex2` varchar(200) DEFAULT NULL,
  `flex3` varchar(200) DEFAULT NULL,
  `flex4` varchar(200) DEFAULT NULL,
  KEY `vaa001` (`sys`,`vend_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_all_dup_load_01` */

DROP TABLE IF EXISTS `vendor_all_dup_load_01`;

CREATE TABLE `vendor_all_dup_load_01` (
  `tic_rowid` int(11) NOT NULL AUTO_INCREMENT,
  `sys` varchar(30) DEFAULT NULL,
  `vend_num` varchar(25) DEFAULT NULL,
  `vend_site_id` varchar(25) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `full_name` varchar(403) DEFAULT NULL,
  `vend_name` varchar(100) DEFAULT NULL,
  `vend_name2` varchar(100) DEFAULT NULL,
  `vend_name3` varchar(100) DEFAULT NULL,
  `vend_name4` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `po_box` varchar(25) DEFAULT NULL,
  `zip_9` varchar(30) DEFAULT NULL,
  `zip_9_num_only` varchar(30) DEFAULT NULL,
  `zip_5` varchar(5) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  `full_address_lines` varchar(430) DEFAULT NULL,
  `full_addr_num_only` varchar(430) DEFAULT NULL,
  `vend_name_full_first_ltr` varchar(1) DEFAULT NULL,
  `vend_name_full_first_3ltr` varchar(3) DEFAULT NULL,
  `vend_commod` varchar(100) DEFAULT NULL,
  `min_code` varchar(20) DEFAULT NULL,
  `vend_type` varchar(50) DEFAULT NULL,
  `tax_id` varchar(20) DEFAULT NULL,
  `vat_num` varchar(20) DEFAULT NULL,
  `tax_id2` varchar(20) DEFAULT NULL,
  `payment_terms` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vadl_key01` (`sys`,`zip_5`,`vend_name_full_first_ltr`,`full_addr_num_only`(255))
) ENGINE=InnoDB AUTO_INCREMENT=9446 DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_all_dup_load_02` */

DROP TABLE IF EXISTS `vendor_all_dup_load_02`;

CREATE TABLE `vendor_all_dup_load_02` (
  `tic_rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tic_dup_id` int(11) NOT NULL,
  `tic_group` varchar(886) DEFAULT NULL,
  `vend_name_full_first_ltr` varchar(1) DEFAULT NULL,
  `zip_5` varchar(5) DEFAULT NULL,
  `full_addr_num_only` varchar(800) DEFAULT NULL,
  `sys` varchar(30) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `vend_num` varchar(25) DEFAULT NULL,
  `vend_site_id` varchar(25) DEFAULT NULL,
  `full_name` varchar(403) DEFAULT NULL,
  `num_tran` int(11) DEFAULT NULL,
  `min_full_name` varchar(403) DEFAULT NULL,
  `max_full_name` varchar(403) DEFAULT NULL,
  `po_box` varchar(25) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `zip_9` varchar(30) DEFAULT NULL,
  `zip_9_num_only` varchar(30) DEFAULT NULL,
  `vend_commod` varchar(100) DEFAULT NULL,
  `min_code` varchar(20) DEFAULT NULL,
  `vend_type` varchar(50) DEFAULT NULL,
  `tax_id` varchar(20) DEFAULT NULL,
  `vat_num` varchar(20) DEFAULT NULL,
  `tax_id2` varchar(20) DEFAULT NULL,
  `payment_terms` varchar(25) DEFAULT NULL,
  `full_address_lines` varchar(430) DEFAULT NULL,
  `vend_name` varchar(100) DEFAULT NULL,
  `vend_name_soundex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=1492 DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_all_dup_load_summary` */

DROP TABLE IF EXISTS `vendor_all_dup_load_summary`;

CREATE TABLE `vendor_all_dup_load_summary` (
  `tic_rowid` int(11) NOT NULL AUTO_INCREMENT,
  `sys` varchar(30) DEFAULT NULL,
  `vend_name_full_first_ltr` varchar(1) DEFAULT NULL,
  `zip_5` varchar(5) DEFAULT NULL,
  `full_addr_num_only` varchar(430) DEFAULT NULL,
  `num_tran` int(11) DEFAULT NULL,
  `min_full_name` varchar(403) DEFAULT NULL,
  `max_full_name` varchar(403) DEFAULT NULL,
  `min_vend_num` varchar(25) DEFAULT NULL,
  `max_vend_num` varchar(25) DEFAULT NULL,
  `min_vend_site_id` varchar(25) DEFAULT NULL,
  `max_vend_site_id` varchar(25) DEFAULT NULL,
  `min_vend_name` varchar(100) DEFAULT NULL,
  `max_vend_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vadls_key01` (`sys`,`zip_5`,`vend_name_full_first_ltr`,`full_addr_num_only`(255))
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_all_dups_detail` */

DROP TABLE IF EXISTS `vendor_all_dups_detail`;

CREATE TABLE `vendor_all_dups_detail` (
  `tic_rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tic_dup_id` int(11) NOT NULL,
  `tic_dup_loaded_on` datetime DEFAULT NULL,
  `tic_dup_loaded_year` mediumint(9) DEFAULT NULL,
  `tic_dup_loaded_month` tinyint(4) DEFAULT NULL,
  `num_tran` mediumint(9) DEFAULT NULL,
  `tic_group` varchar(886) DEFAULT NULL,
  `sys` varchar(30) DEFAULT NULL,
  `vend_num` varchar(25) DEFAULT NULL,
  `vend_site_id` varchar(25) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `full_name` varchar(403) DEFAULT NULL,
  `po_box` varchar(25) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `zip_9` varchar(30) DEFAULT NULL,
  `zip_9_num_only` varchar(30) DEFAULT NULL,
  `vend_commod` varchar(100) DEFAULT NULL,
  `min_code` varchar(20) DEFAULT NULL,
  `vend_type` varchar(50) DEFAULT NULL,
  `tax_id` varchar(20) DEFAULT NULL,
  `vat_num` varchar(20) DEFAULT NULL,
  `tax_id2` varchar(20) DEFAULT NULL,
  `payment_terms` varchar(25) DEFAULT NULL,
  `vend_name` varchar(100) DEFAULT NULL,
  `full_address_lines` varchar(430) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vadd_dup_key` (`tic_dup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1386 DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_clean_it` */

DROP TABLE IF EXISTS `vendor_clean_it`;

CREATE TABLE `vendor_clean_it` (
  `tic_rowid` int(10) NOT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `replace_with` varchar(100) DEFAULT NULL,
  `replace_with_2nd_pass` varchar(100) DEFAULT NULL,
  `maximum_pass` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_data_entry_checks` */

DROP TABLE IF EXISTS `vendor_data_entry_checks`;

CREATE TABLE `vendor_data_entry_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys` varchar(30) DEFAULT NULL,
  `vend_num` varchar(25) DEFAULT NULL,
  `vend_site_id` varchar(25) DEFAULT NULL,
  `vendor_error` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51682 DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_dups` */

DROP TABLE IF EXISTS `vendor_dups`;

CREATE TABLE `vendor_dups` (
  `group_id` int(11) NOT NULL,
  `sys` varchar(30) NOT NULL,
  `vend_num` varchar(25) NOT NULL,
  KEY `vd_vendnum_key` (`vend_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_file` */

DROP TABLE IF EXISTS `vendor_file`;

CREATE TABLE `vendor_file` (
  `tic_rowid` int(11) NOT NULL,
  `tic_import_date` timestamp NULL DEFAULT NULL,
  `sys` varchar(30) DEFAULT NULL,
  `vend_num` varchar(50) DEFAULT NULL,
  `vend_site_id` varchar(25) DEFAULT NULL,
  `vend_type` varchar(50) DEFAULT NULL,
  `vend_commod` varchar(100) DEFAULT NULL,
  `vend_name` varchar(100) DEFAULT NULL,
  `vend_name2` varchar(100) DEFAULT NULL,
  `vend_name3` varchar(100) DEFAULT NULL,
  `vend_name4` varchar(100) DEFAULT NULL,
  `tax_id` varchar(20) DEFAULT NULL,
  `payment_terms` varchar(25) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address3` varchar(100) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  `po_box` varchar(25) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `telephone` varchar(35) DEFAULT NULL,
  `fax` varchar(35) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `flex1` varchar(200) DEFAULT NULL,
  `flex2` varchar(200) DEFAULT NULL,
  `flex3` varchar(200) DEFAULT NULL,
  `flex4` varchar(200) DEFAULT NULL,
  `spend` decimal(12,2) DEFAULT NULL,
  `custacctnumber` varchar(30) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `session_id` varchar(32) DEFAULT NULL,
  KEY `vf001` (`sys`,`vend_num`,`vend_site_id`),
  KEY `vf002` (`custacctnumber`),
  KEY `vf003` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_queue` */

DROP TABLE IF EXISTS `vendor_queue`;

CREATE TABLE `vendor_queue` (
  `session_id` varchar(32) NOT NULL,
  `state` varchar(16) DEFAULT NULL COMMENT 'PENDING, ON PROCESS, SUCCESS, FAILED, CANCELLED',
  `error_message` varchar(4000) DEFAULT NULL COMMENT 'only used when status is FAILED',
  `process_starts_on` datetime NOT NULL,
  `process_ends_on` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `queue_state_key` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_strong_keywords` */

DROP TABLE IF EXISTS `vendor_strong_keywords`;

CREATE TABLE `vendor_strong_keywords` (
  `TIC_ROWID` int(10) NOT NULL,
  `TIC_UPDATED_ON` timestamp NULL DEFAULT NULL,
  `TIC_UPDATED_BY` varchar(30) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  KEY `vsk_key001` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_weak_one_keyword_names` */

DROP TABLE IF EXISTS `vendor_weak_one_keyword_names`;

CREATE TABLE `vendor_weak_one_keyword_names` (
  `TIC_ROWID` int(10) NOT NULL,
  `TIC_UPDATED_ON` timestamp NULL DEFAULT NULL,
  `TIC_UPDATED_BY` varchar(30) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `vendors_similar_detail` */

DROP TABLE IF EXISTS `vendors_similar_detail`;

CREATE TABLE `vendors_similar_detail` (
  `tic_rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tic_sim_id` int(11) DEFAULT NULL,
  `vac_tic_rowid` int(11) DEFAULT NULL,
  `match_keyword` varchar(150) DEFAULT NULL,
  `vendor_account_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vsd_simid_key` (`tic_sim_id`),
  KEY `vsd_vac_tic_rowid_key` (`vac_tic_rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=20300 DEFAULT CHARSET=utf8;

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `run_sp` */

/*!50106 DROP EVENT IF EXISTS `run_sp`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `run_sp` ON SCHEDULE EVERY 2 MINUTE STARTS '2012-12-18 15:53:03' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    set @sessionid = 0;
    CALL `udp_relate_the_vendors` (
        TRUE
        , TRUE
        , @sessionid
        , @result
        , @error_message
    ) ;
END */$$
DELIMITER ;

/* Function  structure for function  `udf_cleanString` */

/*!50003 DROP FUNCTION IF EXISTS `udf_cleanString` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `udf_cleanString`(str VARCHAR (100)) RETURNS varchar(100) CHARSET utf8
    DETERMINISTIC
BEGIN 
/** 
 * Function will strip all non-ASCII and unwanted ASCII characters in string 
 * 
 * @author Shay Anderson 10.11 
 * @revised Emerito Calo -  retains only characters that satisfies the following REGEX [0-9A-Za-z]
 * 
 * @param VARCHAR str 
 * @return VARCHAR 
 */ 
      DECLARE out_str VARCHAR(4096) DEFAULT ''; 
      DECLARE c VARCHAR(4096) DEFAULT ''; 
      DECLARE pointer INT DEFAULT 1; 
      IF ISNULL(str) THEN 
            RETURN NULL; 
      ELSE 
            WHILE pointer <= LENGTH(str) DO 
                   
                  SET c = MID(str, pointer, 1); 
                  IF c REGEXP '[0-9A-Za-z]' THEN 
                        SET out_str = CONCAT(out_str, c); 
                  END IF; 
                  SET pointer = pointer + 1; 
            END WHILE; 
      END IF; 
      RETURN out_str; 
END */$$
DELIMITER ;

/* Function  structure for function  `udf_EXTRACT_NUMBERS` */

/*!50003 DROP FUNCTION IF EXISTS `udf_EXTRACT_NUMBERS` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `udf_EXTRACT_NUMBERS`(FieldValue VARCHAR (100)) RETURNS varchar(100) CHARSET utf8
    DETERMINISTIC
BEGIN
  DECLARE i,   len SMALLINT DEFAULT 1 ;
  DECLARE ret CHAR(32) DEFAULT '' ;
  DECLARE c CHAR(1) ;
  IF FieldValue IS NULL THEN 
     RETURN "" ;
  END IF ;
  
  SET len = CHAR_LENGTH(FieldValue) ;
  
  REPEAT
    
    BEGIN
      SET c = MID(FieldValue, i, 1) ;
      IF c BETWEEN '0' AND '9' THEN
         SET ret = CONCAT(ret, c) ;
      END IF ;
      SET i = i + 1 ;
      
    END ;
    UNTIL i > len 
  END REPEAT ;
  RETURN ret ;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_clean_vendor_name` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_clean_vendor_name` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_clean_vendor_name`()
BEGIN
  DECLARE theKeyword VARCHAR (200) ;
  
  DECLARE theReplacement VARCHAR (200) ;
  
  DECLARE no_more INT DEFAULT 0 ;
  
  DECLARE theres_more SMALLINT DEFAULT 0 ;
  
  DECLARE my_cursor CURSOR FOR 
  SELECT 
    UCASE(keyword),
    UCASE(COALESCE(replace_with, '')) 
  FROM
    vendor_clean_it ;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more = 1 ;
  
  OPEN my_cursor ;
  
  FETCH my_cursor INTO theKeyword, theReplacement ;
  
  -- ************************************************** 
  --  BEGIN LOOP 
  -- ************************************************** 
 
  REPEAT
    UPDATE 
      vendor_address_clean 
    SET
      clean_vend_name = TRIM(
        REPLACE(
          CONCAT(' ', clean_vend_name, ' '),
          theKeyword,
          theReplacement
        )
      ) 
    WHERE INSTR(
        CONCAT(' ', clean_vend_name, ' '),
        theKeyword
      ) > 0 ;
    
    FETCH my_cursor INTO theKeyword,
    theReplacement ;
    
    UNTIL no_more = 1 
  END REPEAT ;
  
  -- ************************************************** 
  --  END LOOP 
  -- ************************************************** 
  CLOSE my_cursor ;
  
  
  REPEAT
    
    UPDATE 
      vendor_address_clean 
    SET
      clean_vend_name = REPLACE(clean_vend_name, '  ', ' ') ;
    
    SET theres_more = ROW_COUNT() ;
    
    UNTIL theres_more = 0 
  END REPEAT ;
  
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_clean_vendor_name2` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_clean_vendor_name2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_clean_vendor_name2`()
BEGIN
  DECLARE theKeyword TEXT ;
  
  DECLARE theReplacement TEXT ;
  
  DECLARE no_more INT DEFAULT 0 ;
  
  DECLARE theres_more INT DEFAULT 0 ;
  
  DECLARE my_cursor CURSOR FOR 
  SELECT 
    UCASE(keyword),
    COALESCE(UCASE(replace_with_2nd_pass),'') 
  FROM
    vendor_clean_it 
  WHERE maximum_pass = 2 ;
  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more = 1 ;
  
  OPEN my_cursor ;
  
  FETCH my_cursor INTO theKeyword,
  theReplacement ;
  
  -- ************************************************** 
 --  BEGIN LOOP 
 -- ************************************************** 
 
  REPEAT
    
    UPDATE 
      vendor_address_clean 
    SET
      clean_vend_name = TRIM(
        REPLACE(
          CONCAT(' ', clean_vend_name, ' '),
          theKeyword,
          theReplacement
        )
      ) 
    WHERE clean_vend_name_first_pass IS NOT NULL -- This makes sure that it doesn't clean it down to the same weak one word name as the first pass
      AND 
        clean_vend_name_first_pass <> TRIM(
        REPLACE(
          CONCAT(' ',clean_vend_name,' '),
          theKeyword,
          theReplacement
        )
      ) 
      AND INSTR(
        CONCAT(' ', clean_vend_name, ' '),
        theKeyword
      ) > 0 ;
    
    FETCH my_cursor INTO theKeyword,
    theReplacement ;
    
    UNTIL no_more = 1 
  END REPEAT ;
  
  -- ************************************************** 
  --  END LOOP 
  -- ************************************************** 
 CLOSE my_cursor ;
  
  
  REPEAT
    
    UPDATE 
      vendor_address_clean 
    SET
      clean_vend_name = REPLACE(clean_vend_name, '  ', ' ') ;
    SET theres_more = ROW_COUNT() ;
    
    UNTIL theres_more = 0 
  END REPEAT ;
  
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_get_keywords` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_get_keywords` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_get_keywords`()
BEGIN
  DECLARE tic_row_id INT ;
  DECLARE clean_name VARCHAR(100) ;
  DECLARE foundPos TINYINT UNSIGNED ;
  DECLARE alreadyClean TINYINT DEFAULT 0 ;
  DECLARE element VARCHAR(100) ;
  DECLARE no_more INT DEFAULT 0 ;
  DECLARE timeToFreeUpMemory INT DEFAULT 0;
  DECLARE my_cursor CURSOR FOR 
  SELECT 
    tic_rowid,
    TRIM(REPLACE(REPLACE(clean_vend_name, CHAR(0xE38080 USING utf8), ' '),'  ',' ')) 
  FROM
    vendor_address_clean 
  WHERE clean_vend_name IS NOT NULL ORDER BY 1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more = 1 ;
  DROP TEMPORARY TABLE IF EXISTS `temp_clean_keywords`;
  CREATE TEMPORARY TABLE `temp_clean_keywords`(
    `vendor_clean_tic_rowid` INT NULL,
    `keyword` VARCHAR (150) NULL
  ) ENGINE=MEMORY;
  
  OPEN my_cursor ;
  FETCH my_cursor INTO tic_row_id, clean_name ;
  -- **************************************************
  --  BEGIN LOOP
  -- **************************************************
  WHILE no_more <> 1  DO
    REPEAT
      SET clean_name = REPLACE(clean_name, '  ', ' ') ;
      SET alreadyClean = COALESCE(INSTR(clean_name, '  '),0) ;
      UNTIL alreadyClean = 0 
    END REPEAT ;
    SET foundPos = INSTR(clean_name, ' ') ;
    
    WHILE foundPos <> 0 DO 
      SET element = SUBSTRING(clean_name, 1, foundPos - 1) ;
      SET clean_name = TRIM(REPLACE(CONCAT(' ',clean_name), CONCAT(' ', element, ' '), ' ')) ;
      
      INSERT INTO temp_clean_keywords (vendor_clean_tic_rowid, keyword) 
      VALUES
        (tic_row_id, element) ;
      SET foundPos = INSTR(clean_name, ' ') ;
      
    END WHILE ;
    IF clean_name <> '' 
    THEN 
    INSERT INTO temp_clean_keywords (vendor_clean_tic_rowid, keyword) 
    VALUES
      (tic_row_id, clean_name) ;
    END IF ;
    SET timeToFreeUpMemory = timeToFreeUpMemory + 1;
    IF timeToFreeUpMemory >= 10000 THEN
      INSERT INTO vendor_address_clean_keywords(vendor_clean_tic_rowid, keyword) 
      SELECT DISTINCT vendor_clean_tic_rowid, keyword 
      FROM temp_clean_keywords;
      DELETE FROM temp_clean_keywords;
      COMMIT;
      SET timeToFreeUpMemory = 0;
    END IF;    
    FETCH my_cursor INTO tic_row_id,
    clean_name ;
  END WHILE ;
  -- **************************************************
  --  END LOOP
  -- **************************************************
  CLOSE my_cursor ;
  
  INSERT INTO vendor_address_clean_keywords(vendor_clean_tic_rowid, keyword) 
  SELECT DISTINCT vendor_clean_tic_rowid, keyword 
    FROM temp_clean_keywords;
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_get_keywords2` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_get_keywords2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_get_keywords2`()
BEGIN
  DECLARE tic_row_id INT ;
  DECLARE clean_name VARCHAR(100) ;
  DECLARE foundPos TINYINT UNSIGNED ;
  DECLARE alreadyClean TINYINT DEFAULT 0 ;
  DECLARE element VARCHAR(100) ;
  DECLARE no_more INT DEFAULT 0 ;
  DECLARE timeToFreeUpMemory INT DEFAULT 0;    
  DECLARE my_cursor CURSOR FOR 
  SELECT 
    tic_rowid,
    TRIM(REPLACE(REPLACE(clean_vend_name,CHAR(0xE38080 USING utf8),' '),'  ',' ')) 
  FROM
    vendor_address_clean 
  WHERE clean_vend_name IS NOT NULL 
    AND clean_vend_name_first_pass IS NOT NULL ORDER BY 1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more = 1 ;
  DROP TEMPORARY TABLE IF EXISTS `temp_clean_keywords`;
  CREATE TEMPORARY TABLE `temp_clean_keywords`(
    `vendor_clean_tic_rowid` INT NULL,
    `keyword` VARCHAR (150) NULL
  ) ENGINE=MEMORY;
  OPEN my_cursor ;
  FETCH my_cursor INTO tic_row_id,
  clean_name ;
  -- **************************************************
  --  BEGIN LOOP
  -- **************************************************
 
  WHILE no_more <> 1 DO
    REPEAT
      SET clean_name = REPLACE(clean_name, '  ', ' ') ;
      SET alreadyClean = COALESCE(INSTR(clean_name, '  '), 0) ;
      UNTIL alreadyClean = 0 
    END REPEAT ;
    SET foundPos = INSTR(clean_name, ' ') ;
    
    WHILE foundPos <> 0 DO
      SET element = SUBSTRING(clean_name, 1, foundPos - 1) ;
      -- SET clean_name = REPLACE(clean_name, CONCAT(element, ' '), '') ;
      SET clean_name = TRIM(REPLACE(CONCAT(' ',clean_name), CONCAT(' ', element, ' '), ' ')) ;
      
      INSERT INTO temp_clean_keywords (vendor_clean_tic_rowid, keyword) 
      VALUES
        (tic_row_id, element) ;
      SET foundPos = INSTR(clean_name, ' ') ;
      
    END WHILE ;
    IF clean_name <> '' 
    THEN 
    INSERT INTO temp_clean_keywords (vendor_clean_tic_rowid, keyword) 
    VALUES
      (tic_row_id, clean_name) ;
    END IF ;
    SET timeToFreeUpMemory = timeToFreeUpMemory + 1;
    IF timeToFreeUpMemory = 10000 THEN
       INSERT INTO vendor_address_clean_keywords(vendor_clean_tic_rowid, keyword) 
       SELECT DISTINCT vendor_clean_tic_rowid, keyword  
         FROM temp_clean_keywords;
       DELETE FROM temp_clean_keywords;
       SET timeToFreeUpMemory = 0;
    END IF;
    FETCH my_cursor INTO tic_row_id,
    clean_name ;
  END WHILE ;
  -- **************************************************
  --  END LOOP
  -- **************************************************
  CLOSE my_cursor ;
  IF timeToFreeUpMemory > 0 THEN
     INSERT INTO vendor_address_clean_keywords(vendor_clean_tic_rowid, keyword) 
     SELECT DISTINCT vendor_clean_tic_rowid, keyword  
       FROM temp_clean_keywords;
  END IF;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_group_vendor_dups` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_group_vendor_dups` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_group_vendor_dups`()
BEGIN
  DECLARE counter,
          foundPos,
          markerPos,
          groupId INT(11) DEFAULT 1;
  DECLARE theSys,
          theVendorNumber VARCHAR(25);
  DECLARE dummy, theList VARCHAR (4000) ;
  DECLARE theres_more BOOLEAN DEFAULT TRUE ;
  DECLARE my_cursor CURSOR FOR 
	SELECT sys,
	       name1_zip5_addr_num,
	       GROUP_CONCAT(DISTINCT vend_num) AS vend_num_list  
	  FROM (
		SELECT vend_num,
		       sys,
		       CONCAT_WS('::',
			  LEFT(LTRIM(clean_vend_name),1),
			  SUBSTRING(LTRIM(udf_cleanString(zip)),1,5),
			  udf_extract_numbers(
			    CONCAT_WS(
			      '',
			      address_line_1,
			      address_line_2,
			      address_line_3,
			      address_line_4,
			      po_box_num
			    )
			  )
		       ) AS name1_zip5_addr_num
		  FROM vendor_address_clean
	       ) AS step1
	 GROUP BY sys, name1_zip5_addr_num
	HAVING COUNT(DISTINCT vend_num) BETWEEN 2 AND 10
	 ORDER BY 2;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET theres_more = FALSE ;
  
  DROP TEMPORARY TABLE IF EXISTS `temp_all` ;
  CREATE TEMPORARY TABLE `temp_all` (
    grpid INT UNSIGNED NOT NULL,
    sys VARCHAR(25) NOT NULL,
    vend_num VARCHAR(25) NOT NULL
  ) ENGINE = MEMORY ;
  
  DROP TEMPORARY TABLE IF EXISTS `temp_related` ;
  CREATE TEMPORARY TABLE `temp_related` (
    sys VARCHAR(25) NOT NULL,
    vend_num VARCHAR(25) NOT NULL
  ) ENGINE = MEMORY ;
  OPEN my_cursor ;
  FETCH my_cursor INTO theSys, dummy, theList ;
  SET counter = 0 ;
  -- ************************************************** 
  --  BEGIN LOOP 
  -- ************************************************** 
  WHILE theres_more DO
     SET markerPos = 1;
     REPEAT
         SET foundPos = LOCATE(',', theList, markerPos);
         IF foundpos > 0 THEN
             SET theVendorNumber = SUBSTRING(theList FROM markerPos FOR (foundPos - markerPos));
             SET markerPos = foundPos + 1;
         ELSE
             SET theVendorNumber = SUBSTRING(theList FROM markerPos);
         END IF;
         INSERT INTO temp_related(sys, vend_num) VALUES (theSys, theVendorNumber);
         SET counter = counter + 1;
     UNTIL foundPos = 0
     END REPEAT;
     INSERT INTO temp_all SELECT groupId, sys, vend_num FROM temp_related;
     DELETE FROM temp_related;
     COMMIT;
     SET groupId = groupId + 1;
     IF counter > 20000 THEN
	INSERT INTO vendor_dups(group_id, sys, vend_num) SELECT * FROM temp_all;
	DELETE FROM temp_all;
	COMMIT;
	SET counter = 1;
     END IF;
     FETCH my_cursor INTO theSys, dummy, theList ;     
  END WHILE;
  -- ************************************************** 
  --  END LOOP 
  -- ************************************************** 
  CLOSE my_cursor ;
  INSERT INTO vendor_dups(group_id, sys, vend_num) SELECT * FROM temp_all;
  CREATE OR REPLACE VIEW vw_vendor_dups_detail
  AS
	SELECT b.group_id, a.*
	  FROM vendor_address_clean AS a
	       INNER JOIN vendor_dups b
	         ON a.vend_num = b.vend_num; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_import_to_vac` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_import_to_vac` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_import_to_vac`(source VARCHAR(50), OUT success BOOLEAN)
body:
BEGIN
   DECLARE ctr INT DEFAULT 0;
   DECLARE indices VARCHAR(255) DEFAULT '';   
   DECLARE hasNoIndex BOOLEAN DEFAULT FALSE;
   SET success = FALSE;
   IF source IS NULL THEN 
      LEAVE body; 
   END IF;
   SET source =TRIM(source);
   IF source = 'VENDOR_ALL' THEN
      -- check if the vendor_all and vendor_all_addr exists
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`TABLES` 
                  WHERE table_schema = DATABASE() 
                    AND table_name IN ('VENDOR_ALL', 'VENDOR_ALL_ADDR'));
      IF (ctr <> 2) THEN
         LEAVE body; 
      END IF;
      
      -- check if the needed indices are present in vendor_all
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`STATISTICS`
                  WHERE table_schema = DATABASE()
                    AND table_name = 'vendor_all'
                    AND column_name IN ('sys','vend_num'));
      IF ctr = 0 THEN
         SET hasNoIndex = TRUE;
      ELSEIF ctr = 1 THEN
         SET indices = (SELECT index_name 
                          FROM information_schema.`STATISTICS`
                         WHERE table_schema = DATABASE()
                           AND table_name = 'vendor_all'
                           AND column_name IN ('sys','vend_num'));
         SET @s = CONCAT('DROP INDEX ', indices, ' ON vendor_all');
         PREPARE stmt FROM @s;
         EXECUTE stmt;
         SET hasNoIndex = TRUE;
      END IF;              
      IF hasNoIndex THEN
         CREATE INDEX `va_sys_vend_num_key` ON `vendor_all`(`sys`,`vend_num`);
      END IF;
      
      -- check if the needed indices are present in vendor_all_addr
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`STATISTICS`
                  WHERE table_schema = DATABASE()
                    AND table_name = 'vendor_all_addr'
                    AND column_name IN ('sys','vend_num'));
      IF ctr = 0 THEN
         SET hasNoIndex = TRUE;
      ELSEIF ctr = 1 THEN
         SET indices = (SELECT index_name 
                          FROM information_schema.`STATISTICS`
                         WHERE table_schema = DATABASE()
                           AND table_name = 'vendor_all_addr'
                           AND column_name IN ('sys','vend_num'));
         SET @s = CONCAT('DROP INDEX ', indices, ' ON vendor_all_addr');
         PREPARE stmt FROM @s;
         EXECUTE stmt;
         SET hasNoIndex = TRUE;
      END IF;              
      IF hasNoIndex THEN
         CREATE INDEX `vaa_sys_vend_num_key` ON `vendor_all_addr`(`sys`,`vend_num`);
      END IF;
      
      -- let's populate the vendor_address_clean
                        
   ELSEIF source = 'VENDOR_FILE' THEN
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`TABLES` 
                  WHERE table_schema = DATABASE() 
                    AND table_name IN ('VENDOR_FILE'));
      IF (ctr <> 1) THEN
         LEAVE body; 
      END IF;
      
      -- we might also need some checks for indices here
   ELSE
      LEAVE body;   
   END IF;
   
   -- if the execution reaches here, then we're good to go for populating the vendor_address_clean table
   DROP TABLE IF EXISTS `vendor_address_clean`;
   CREATE TABLE `vendor_address_clean` (
     `tic_rowid` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
     `custacctnumber` VARCHAR(30) DEFAULT NULL,
     `sys` VARCHAR(30) DEFAULT NULL,
     `vend_num` VARCHAR(25) DEFAULT NULL,
     `vend_site_id` VARCHAR(25) DEFAULT NULL,
     `vendor_type` VARCHAR(100) DEFAULT NULL,
     `vendor_name` VARCHAR(100) DEFAULT NULL,
     `address_line_1` VARCHAR(100) DEFAULT NULL,
     `address_line_2` VARCHAR(100) DEFAULT NULL,
     `address_line_3` VARCHAR(100) DEFAULT NULL,
     `address_line_4` VARCHAR(100) DEFAULT NULL,
     `po_box_num` VARCHAR(25) DEFAULT NULL,
     `city` VARCHAR(50) DEFAULT NULL,
     `state` VARCHAR(40) DEFAULT NULL,
     `zip` VARCHAR(30) DEFAULT NULL,
     `country` VARCHAR(50) DEFAULT NULL,
     `tax_id` VARCHAR(20) DEFAULT NULL,
     `phone` VARCHAR(35) DEFAULT NULL,
     `contact_email` VARCHAR(1000) DEFAULT NULL,
     `last_activity_date` DATETIME DEFAULT NULL,
     `spend` DECIMAL(12,2) DEFAULT NULL,
     `vend_first_letter` VARCHAR(1) DEFAULT NULL,
     `vend_first_word` VARCHAR(100) DEFAULT NULL,
     `clean_vend_name` VARCHAR(100) DEFAULT NULL,
     `clean_vend_name_first_pass` VARCHAR(100) DEFAULT NULL,
     `standard_vend_name` VARCHAR(100) DEFAULT NULL,
     `vend_name_len` INT(11) DEFAULT NULL,
     `address_num` VARCHAR(100) DEFAULT NULL,
     `city_first_letter` VARCHAR(1) DEFAULT NULL,
     `state_first_letter` VARCHAR(1) DEFAULT NULL,
     `zip_5_char` VARCHAR(5) DEFAULT NULL,
     `tax_id_clean` VARCHAR(20) DEFAULT NULL,
     `phone_10_digit` VARCHAR(35) DEFAULT NULL,
     `phone_9_digit` VARCHAR(9) DEFAULT NULL,
     `phone_8_digit` VARCHAR(8) DEFAULT NULL,
     `phone_7_digit` VARCHAR(7) DEFAULT NULL,
     `phone_6_digit` VARCHAR(6) DEFAULT NULL,
     `domain` VARCHAR(100) DEFAULT NULL,
     `type_po_box` VARCHAR(1) DEFAULT NULL,
     `type_comp_tax_id` VARCHAR(50) DEFAULT NULL,
     `type_dba_id` VARCHAR(50) DEFAULT NULL,
     KEY `vac_custacctnumber_key`(`custacctnumber`),
     KEY `vac_clean_vend_name_key` (`clean_vend_name`),
     KEY `vac_sys_key` (`sys`),
     KEY `vac_vend_num_key` (`vend_num`),
     KEY `vac_site_id_key` (`vend_site_id`),
     KEY `vac_phone_10_key` (`phone_10_digit`),
     KEY `vac_tax_key` (`tax_id_clean`)
   ) ENGINE=INNODB DEFAULT CHARSET=utf8;
   -- let's populate
   IF source = 'vendor_all' THEN
     INSERT INTO vendor_address_clean (
            sys,
            vend_num,
            vend_site_id,
            vendor_type,
            vendor_name,
            address_line_1,
            address_line_2,
            address_line_3,
            address_line_4,
            po_box_num,
            city,
            state,
            zip,
            country,
            tax_id,
            phone,
            contact_email,
            last_activity_date,
            clean_vend_name,
            phone_10_digit,
            zip_5_char
            ) 
     SELECT 
            va.sys,
            va.vend_num,
            vaa.vend_site_id,
            COALESCE(va.vend_type, va.vend_commod) AS vendor_type,
            TRIM(va.vend_name) AS vendor_name,
            vaa.address1 AS address_line_1,
            vaa.address2 AS address_line_2,
            vaa.address3 AS address_line_3,
            vaa.address4 AS address_line_4,
            vaa.po_box AS po_box_num,
            vaa.city,
            vaa.state,
            TRIM(vaa.zip),
            vaa.country,
            va.tax_id,
            vaa.telephone1 AS phone,
            vaa.email AS contact_email,
            NULL AS last_activity_date,
            UCASE(TRIM(va.vend_name)) AS clean_vend_name,
            udf_EXTRACT_NUMBERS(TRIM(vaa.telephone1)),
            LEFT(TRIM(vaa.zip), 5) AS zip_5_char
       FROM vendor_all VA 
            INNER JOIN vendor_all_addr VAA 
               ON VA.sys = VAA.sys 
               AND VA.vend_num = VAA.vend_num 
      ORDER BY VA.sys, VA.vend_num;
      
   ELSEIF source = 'vendor_file' THEN
     INSERT INTO vendor_address_clean (
            custacctnumber,
            sys,
            vend_num,
            vend_site_id,
            vendor_type,
            vendor_name,
            address_line_1,
            address_line_2,
            address_line_3,
            address_line_4,
            po_box_num,
            city,
            state,
            zip,
            country,
            tax_id,
            phone,
            contact_email,
            last_activity_date,
            clean_vend_name,
            phone_10_digit,
            zip_5_char,
            spend
            ) 
     SELECT custacctnumber,
            sys,
            vend_num,
            vend_site_id,
            COALESCE(vend_type, vend_commod) AS vendor_type,
            TRIM(vend_name) AS vendor_name,
            address1 AS address_line_1,
            address2 AS address_line_2,
            address3 AS address_line_3,
            address4 AS address_line_4,
            po_box AS po_box_num,
            city,
            state,
            TRIM(zip),
            country,
            tax_id,
            telephone AS phone,
            email AS contact_email,
            NULL AS last_activity_date,
            UCASE(TRIM(vend_name)) AS clean_vend_name,
            udf_EXTRACT_NUMBERS(TRIM(telephone)),
            LEFT(TRIM(zip), 5) AS zip_5_char,
            spend
       FROM vendor_file
      ORDER BY custacctnumber, sys, vend_num;        
   END IF;
   COMMIT;   
   SET success = TRUE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_import_wrapper` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_import_wrapper` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_import_wrapper`(from_source VARCHAR(50))
BEGIN
  DECLARE successful BOOLEAN DEFAULT FALSE;
  
  CALL udp_import_to_vac(from_source, successful);
  
  IF successful THEN
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_10_digit = SUBSTRING(phone_10_digit, 2, 99) 
	WHERE LENGTH(phone_10_digit) > 10 
	  AND LEFT(phone_10_digit, 1) = '1' ;
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_10_digit = SUBSTRING(phone_10_digit, 4, 99) 
	WHERE LENGTH(phone_10_digit) > 10 
	  AND LEFT(phone_10_digit, 3) IN ('001', '011')  ;
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_10_digit = NULL 
	WHERE LEFT(phone_10_digit, 7) IN ('0000000','5555555');
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_10_digit = NULL 
	WHERE phone IS NOT NULL
	  AND (LEFT(phone, 7) IN ('1111111', '9999999') 
	  OR TRIM(phone) = '' 
	  OR LENGTH(TRIM(phone)) < 7) ;    
	  
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	-- FINAL INSERT
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_10_digit = LEFT(phone_10_digit, 10) 
	WHERE phone IS NOT NULL ;
	  
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	-- UPDATES AFTER FINAL INSERT
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	-- THESE ARE USUALLY INTERNATIONAL NUMBERS (0 or 1)
	-- No valid US number should start with 555
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_10_digit = NULL 
	WHERE phone_10_digit IS NOT NULL
	  AND (LEFT(phone_10_digit, 1) IN ('0', '1') 
	  OR LEFT(phone_10_digit, 3) = '555');
	-- 1310 Update phone_9_digit
	-- 1320 Update phone_8_digit
	-- 1330 update phone_7_digit
	-- 1340 update phone_6_digit
	-- 13XX Update phone_9_digit, phone_8_digit, phone_7_digit, phone_6_digit ALL AT ONCE
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_9_digit = LEFT(phone_10_digit, 9),
	  phone_8_digit = LEFT(phone_10_digit, 8),
	  phone_7_digit = LEFT(phone_10_digit, 7),
	  phone_6_digit = LEFT(phone_10_digit, 6) 
	WHERE phone IS NOT NULL 
	  AND phone_10_digit IS NOT NULL;
	-- 1400 numbers only from address
	-- This program removes all the characters from the address field
	-- and leaves just the number
	UPDATE 
	  vendor_address_clean 
	SET
	  address_num = udf_EXTRACT_NUMBERS (
		CONCAT_WS('',
		  RTRIM(address_line_1), 
		  RTRIM(address_line_2), 
		  RTRIM(address_line_3), 
		  RTRIM(address_line_4), 
		  RTRIM(po_box_num)
		)
	  )
	WHERE address_line_1 IS NOT NULL
	  OR address_line_2 IS NOT NULL
	  OR address_line_3 IS NOT NULL
	  OR address_line_4 IS NOT NULL
	  OR po_box_num IS NOT NULL
	;
	COMMIT;  
	-- 1600 Clean Vendor Name
	-- XXXXXXXXXXXXXXXXXXXXXX
	-- Set this task up as a for loop and set the loop to run 2 times
	-- XXXXXXXXXXXXXXXXXXXXXX
	-- This program creates a clean vendor name.  It strips off all the 
	-- items from vendor_clean_it.  Basically it does a simply find and replace on
	-- a keyword and a replace with.  This is really cleaning up words that don't belong
	-- like company, corp, incorp, inc, etc.
	-- FIELDS UPDATED BY THE PROCEDURE
	--    clean_vend_name
	CALL udp_clean_vendor_name();
	COMMIT;
	-- 1700 Additional Clean up of Clean vendor names
	-- Note KEEP THIS STEP IN SYNC WITH 1930. Any step added here should also be added there with the exception
	-- of adding "clean_vend_name_first_pass is not null and " to the where clause
	-- 09/09/2009 RC
	-- 12/15/2011 Per Karl and Raff, it was decided that since vendors like BANK of AMERICA or AMERICAN EXPRESS had
	-- all common words that were eliminated, rather then set them to null, the full vendor name was put back
	-- into the clean vendor name field. That way they will be inserted into vendors_similar_detail
	-- This step needs to happen before the ZZ DO NOT USE and ACCOUNT steps below
	-- Note this one step does not need to be done again in 1930 --12/15/2011 RC
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = UCASE(vendor_name) 
	WHERE clean_vend_name IS NOT NULL 
	  AND vendor_name IS NOT NULL
	  AND LENGTH(clean_vend_name) <= 2 ;
	-- These steps below should be kept in sync
	-- ZZ DO NOT USE and ACCOUNT steps
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'ACCOUNT#', '') 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'ACCOUNT#') > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'ACCT#', '') 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'ACCT#') > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'ACCT #', '') 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'ACCT #') > 0 ;	
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
		clean_vend_name,
		'REFERENCE #',
		''
	  ) 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'REFERENCE #') > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'REFERENCE#', '') 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'REFERENCE#') > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
		clean_vend_name,
		'ZZZ DO NOT USE',
		''
	  ) 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(
		clean_vend_name,
		'ZZZ DO NOT USE'
	  ) > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
		clean_vend_name,
		'ZZ DO NOT USE',
		''
	  ) 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(
		clean_vend_name,
		'ZZ DO NOT USE'
	  ) > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name IS NOT NULL 
	  AND clean_vend_name IN ('ZZ', 'ZZZ');
	-- This has to be the last step with the words DO NOT USE
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'DO NOT USE', '') 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'DO NOT USE') > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'PETTY CASH') > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
		clean_vend_name,
		'INACTIVE SUPPLIER',
		''
	  ) 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(
		clean_vend_name,
		'INACTIVE SUPPLIER'
	  ) > 0 ;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'INACTIVE', '') 
	WHERE clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'INACTIVE') > 0 ;
	-- Final Insert Step
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = TRIM(clean_vend_name)
	WHERE clean_vend_name IS NOT NULL;  
	-- Other updates after final insert
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name IS NOT NULL 
	  AND (clean_vend_name IN ('!!!', '???', '*') 
	  OR LENGTH(clean_vend_name) <= 1) ;
	-- Per 12/15/2011 This step is no longer done.
	-- THIS HAS TO BE THE LAST STEP OVERALL
	--	update vendor_address_clean set clean_vend_name = null
	--	where rtrim(ltrim(clean_vend_name))='' or LEN(rtrim(ltrim(clean_vend_name)))<=2
	-- After all the vendor name resetting if there are still any vendors with a length of 1, then
	-- Set all clean vendor names with a length of 1 to null
	/*
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE LENGTH(clean_vend_name) <= 1 
	;
	*/
	-- 1750 vendor_address_clean_keywords table drop and create
	COMMIT;
	DROP TABLE IF EXISTS `vendor_address_clean_keywords`;
	CREATE TABLE `vendor_address_clean_keywords` (
	  `tic_rowid` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	  `vendor_clean_tic_rowid` INT DEFAULT NULL,
	  `keyword` VARCHAR(150) DEFAULT NULL,
	  KEY `vack_clean_ticrow_key` (`vendor_clean_tic_rowid`),
	  KEY `vack_keyword_key` (`keyword`)
	) ENGINE=INNODB DEFAULT CHARSET=utf8;
	-- 1800 Pull Keywords
	-- This program creates a clean vendor name.  It strips off all the 
	-- items from vendor_clean_it.  Basically it does a simply find and replace on
	-- a keyword and a replace width.  This is really cleaning up words that don't belong
	-- like company, corp, incorp, inc, etc.
	-- FIELDS UPDATED BY THIS PROGRAM
	--   clean_vend_name
	CALL udp_get_keywords();
	COMMIT;
	-- 1910 Reset Weak One-Word Keyword Names
	UPDATE 
	  vendor_address_clean AS vac
	SET
	  clean_vend_name = vendor_name,
	  clean_vend_name_first_pass = COALESCE(
		clean_vend_name_first_pass,
		clean_vend_name
	  ) 
	WHERE clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, ' ') <= 1 
	  AND clean_vend_name <> vendor_name 
	  AND EXISTS (
			SELECT '1'
			 FROM vendor_weak_one_keyword_names AS weak
			WHERE vac.`clean_vend_name` = weak.`keyword`
		  ) ;
	-- 1920 Clean Vendor Name Second Pass
	-- This step is similar to 1600 and should be kept in sync. Any changes to that step should be made here as well except that 
	-- " clean_vend_name_first_pass is not null and " needs to be added to the where clause and when selecting from the vendor_clean_it
	-- table it should pick the field replace_with_2nd_pass and the where clause should only pull keywords with a maximum pass = 2
	-- 09/09/2009 RC
	-- XXXXXXXXXXXXXXXXXXXXXX
	--  Set this task up as a for loop and set the loop to run 2 times
	-- XXXXXXXXXXXXXXXXXXXXXX
	-- This program creates a clean vendor name.  It strips off all the 
	-- items from vendor_clean_it.  Basically it does a simply find and replace on
	-- a keyword and a replace width.  This is really cleaning up words that don't belong
	-- like company, corp, incorp, inc, etc.
	-- FIELDS UPDATED BY THIS PROGRAM
	--   clean_vend_name
	CALL udp_clean_vendor_name2();
	COMMIT;
	-- 1930 Additional Clean up of Clean vendor names (SECOND PASS)
	-- This step should be the same as 1700 except for it only evaluates names that are getting a second pass
	-- Any code added to 1700 should be added here with the addition of this code in the where clause
	--                      "  clean_vend_name_first_pass is not null and "
	-- This step is done to put the full vend name back in...
	-- THIS HAS TO BE THE LAST STEP OVERALL
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = UCASE(TRIM(vendor_name))
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND LENGTH(TRIM(clean_vend_name)) <= 2 
	;	
	-- These steps need to be kept in sync
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'ACCOUNT#', '') 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, 'ACCOUNT#') > 0 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'ACCT#', '') 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, 'ACCT#') > 0 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'ACCT #', '') 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, 'ACCT #') > 0 
	;
		
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
	    clean_vend_name,
	    'REFERENCE #',
	    ''
	  ) 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, 'REFERENCE #') > 0 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'REFERENCE#', '') 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, 'REFERENCE#') > 0 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
	    clean_vend_name,
	    'ZZZ DO NOT USE',
	    ''
	  ) 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(
	    clean_vend_name,
	    'ZZZ DO NOT USE'
	  ) > 0 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
	    clean_vend_name,
	    'ZZ DO NOT USE',
	    ''
	  ) 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(
	    clean_vend_name,
	    'ZZ DO NOT USE'
	  ) > 0 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND (clean_vend_name IN ('ZZ', 'ZZZ')
	  OR INSTR(clean_vend_name, 'PETTY CASH') > 0)
	;
	-- this has to be the last step with the words DO NOT USE
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'DO NOT USE', '') 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, 'DO NOT USE') > 0 
	;
	/*
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND INSTR(clean_vend_name, 'PETTY CASH') > 0 
	;
	*/
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
	    clean_vend_name,
	    'INACTIVE SUPPLIER',
	    ''
	  ) 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(
	    clean_vend_name,
	    'INACTIVE SUPPLIER'
	  ) > 0 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(clean_vend_name, 'INACTIVE', '') 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND INSTR(clean_vend_name, 'INACTIVE') > 0 
	;
	-- Final Insert Step
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = TRIM(clean_vend_name) 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	;
	-- Other updates after final insert
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IS NOT NULL
	  AND clean_vend_name IN ('!!!','???','*')
	;
		
	-- Other updates after final insert
	/*
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IN ('???')
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name_first_pass IS NOT NULL 
	  AND clean_vend_name IN ('*')
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE TRIM(clean_vend_name) = '' 
	;
	*/
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE LENGTH(TRIM(clean_vend_name)) <= 1 
	  AND clean_vend_name IS NOT NULL
	  -- AND INSTR(vendor_name, 'DO NOT USE') > 1
	  OR  TRIM(clean_vend_name) = ''
	;
	-- 12/15/2011 This step is no longer done
	-- THIS HAS TO BE THE LAST STEP OVERALL
	--	update vendor_address_clean set clean_vend_name = null
	--	where clean_vend_name_first_pass is not null and rtrim(ltrim(clean_vend_name))='' or LEN(rtrim(ltrim(clean_vend_name)))<=2
	-- After all the vendor name resetting if there are still any vendors with a length of 1, then
	-- Set all clean vendor names with a length of 1 to null
	/*
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE LENGTH(TRIM(clean_vend_name)) <= 1 
	;
	*/
	-- This does not need to be run in step 1700. It only needs to be run here. This last step will
	-- try to clean up any vendor that has had their clean vendor name reset to their vendor name
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = REPLACE(
	    TRIM(clean_vend_name),
	    '.',
	    ''
	  ) 
	WHERE clean_vend_name = vendor_name 
	  AND clean_vend_name IS NOT NULL
	;
	COMMIT;
	-- 1940 Pull Keywords (2nd Pass)
	-- THIS PROGRAM SHOULD BE KEPT IN SYNC WITH 1800 except for the changes to the where clauses 09/09/2009 RC
	-- This program creates a clean vendor name.  It strips off all the 
	-- items from vendor_clean_it.  Basically it does a simply find and replace on
	-- a keyword and a replace width.  This is really cleaning up words that don't belong
	-- like company, corp, incorp, inc, etc.
	-- FIELDS UPDATED BY THIS PROGRAM
	-- 1. clean_vend_name
	-- FIRST DELETE OUT THE SECOND PASS VENDORS
	DELETE 
	FROM
	  vendor_address_clean_keywords 
	WHERE EXISTS (
	        SELECT '1' 
	          FROM vendor_address_clean vac
	         WHERE clean_vend_name_first_pass IS NOT NULL 
	           AND vendor_address_clean_keywords.vendor_clean_tic_rowid = vac.tic_rowid
	      )	;
	COMMIT;
	CALL udp_get_keywords2();
	COMMIT;
	-- 2100 Get domain name from email
	UPDATE 
	  vendor_address_clean 
	SET
	  domain = SUBSTRING(
	    contact_email,
	    INSTR(contact_email, '@') + 1,
	    999
	  )
	WHERE contact_email IS NOT NULL
	  AND INSTR(contact_email, '@') > 0 
	;
	-- 2200 Is this PO box
	UPDATE 
	  vendor_address_clean 
	SET
	  type_po_box = 'Y' 
	WHERE po_box_num IS NOT NULL 
	  OR INSTR(
	    CONCAT_WS('',
	      address_line_1,
	      address_line_2,
	      address_line_3,
	      address_line_4
	    ),
	    'PO Box'
	  ) <> 0 
	  OR INSTR(
	    CONCAT_WS('',
	      address_line_1,
	      address_line_2,
	      address_line_3,
	      address_line_4
	    ),
	    'P.O.'
	  ) <> 0 
	  OR INSTR(
	    CONCAT_WS('',
	      address_line_1,
	      address_line_2,
	      address_line_3,
	      address_line_4
	    ),
	    ' PO '
	  ) <> 0 
	;
	-- 2300 tax id cleaning
	UPDATE 
	  vendor_address_clean 
	SET
	  tax_id_clean = NULL 
	WHERE tax_id_clean IS NOT NULL 
	  AND (
	    tax_id_clean IN (
	      '000000000',
	      '0000000000',
	      '00000000000',
	      '111111111',
	      '1111111111',
	      '11111111111',
	      '999999999',
	      '9999999999',
	      '99999999999'
	    ) 
	    OR LENGTH(RTRIM(tax_id_clean)) <> 9
	  ) ;
	COMMIT;
	/*
	UPDATE 
	  vendor_address_clean 
	SET
	  tax_id_clean = NULL 
	WHERE tax_id_clean IN (
	    '111111111',
	    '1111111111',
	    '11111111111'
	  )
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  tax_id_clean = NULL 
	WHERE tax_id_clean IN (
	    '999999999',
	    '9999999999',
	    '99999999999'
	  )
	;
	*/
	-- FINAL INSERT
	/*
	UPDATE 
	  vendor_address_clean 
	SET
	  tax_id_clean = NULL 
	WHERE LENGTH(RTRIM(tax_id_clean)) <> 9 
	;
	*/
	-- UPDATE AFTER FINAL INSERT
	-- set all vendors with a count of greater than 25 distinct clean vendor names as a bogus number and set to null
	CALL udp_update_vac_101();
	-- 2400 type_comp_tax_id update
	UPDATE 
	  vendor_address_clean 
	SET
	  type_comp_tax_id = 'Individual' 
	WHERE tax_id IS NOT NULL
	  AND SUBSTRING(tax_id, 4, 1) = '-' 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  type_comp_tax_id = 'Corporation' 
	WHERE tax_id IS NOT NULL
	  AND SUBSTRING(tax_id, 3, 1) = '-' 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  type_comp_tax_id = 'No Tax ID Provided' 
	WHERE tax_id_clean IS NULL 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  type_comp_tax_id = 'Not able to categorize' 
	WHERE type_comp_tax_id IS NULL 
	; 
	COMMIT; 
	 
	-- 2500 ONE LAST UPDATE ON PHONE_10_DIGIT
	-- This update has to be done after the clean vend name code
	-- set all vendors with a count of greater than 25 distinct clean vendor names as a bogus number and set to null
	CALL udp_update_vac_102();
	-- This is a list of bogus 7 digit phone numbers this should eventually be a table for each client
	-- that is updated. For right now we will do an in statement
	UPDATE 
	  vendor_address_clean 
	SET
	  phone_10_digit = NULL 
	WHERE phone_10_digit IN ('9545738')
	;							
	COMMIT;							
	-- 2800. VENDOR_ADDRESS_CLEAN (3)
	-- 3100 Null out Clean Vend Name for Empty Names
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name IS NOT NULL 
	  AND TRIM(clean_vend_name) = '' 
	;
	UPDATE 
	  vendor_address_clean 
	SET
	  clean_vend_name = NULL 
	WHERE clean_vend_name IS NOT NULL
	  AND vendor_name IS NOT NULL
	  AND LENGTH(TRIM(clean_vend_name)) <= 1 
	  AND INSTR(vendor_name, 'DO NOT USE') > 1 
	;
	COMMIT;
     
  END IF;
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_relate_the_vendors` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_relate_the_vendors` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_relate_the_vendors`(include_match_key boolean, include_singles boolean, sessionid varchar(32), OUT result tinyint, out error_message varchar(512))
body:
BEGIN
  DECLARE rowCounter, 
  theSimIdCounter,
  theRowId,
  theSimId,
  sessionCount INT ;
  DECLARE theKeyword,
  prevKeyword VARCHAR (255) ;
  DECLARE no_more INT DEFAULT 0 ;
  DECLARE my_cursor CURSOR FOR 
  SELECT 
    CONCAT(step_identified, ' (', keyword, ')') AS theKey,
    tic_rowid 
  FROM
    (SELECT 
      '1. keyword' AS step_identified,
      vack.keyword,
      vac.tic_rowid 
    FROM
      vendor_address_clean_keywords vack 
      INNER JOIN vendor_strong_keywords 
        ON vack.keyword = vendor_strong_keywords.keyword 
      INNER JOIN vendor_address_clean vac 
        ON vack.vendor_clean_tic_rowid = vac.tic_rowid 
    WHERE vac.session_id = sessionid
    UNION
    SELECT 
      vs.step_identified,
      vs.match_field,
      vac.`tic_rowid` 
    FROM
      vendor_address_clean vac 
      INNER JOIN 
        (SELECT 
          '2. phone' AS step_identified,
          phone_10_digit AS match_field,
          COUNT(*) AS num_tran 
        FROM
          vendor_address_clean 
        WHERE phone_10_digit IS NOT NULL 
        GROUP BY phone_10_digit 
        HAVING (COUNT(*) > 1)) AS vs 
        ON vac.phone_10_digit = vs.match_field
    where vac.session_id = sessionid     
    UNION
    SELECT 
      vs.step_identified,
      vs.match_field,
      vac.`tic_rowid` 
    FROM
      vendor_address_clean vac 
      INNER JOIN 
        (SELECT 
          '3. tax id' AS step_identified,
          tax_id_clean AS match_field,
          COUNT(*) AS num_tran 
        FROM
          vendor_address_clean 
        WHERE tax_id_clean IS NOT NULL 
        GROUP BY tax_id_clean 
        HAVING (COUNT(*) > 1)) AS vs 
        ON vac.tax_id_clean = vs.match_field 
    where vac.session_id = sessionid    
    UNION
    SELECT 
      vs.step_identified,
      vs.match_field,
      vac.`tic_rowid` 
    FROM
      vendor_address_clean vac 
      INNER JOIN 
        (SELECT 
          '4. name' AS step_identified,
          clean_vend_name AS match_field,
          COUNT(*) AS num_tran 
        FROM
          vendor_address_clean 
        WHERE clean_vend_name IS NOT NULL 
          AND clean_vend_name <> '' 
        GROUP BY clean_vend_name 
        HAVING (COUNT(*) > 1)) AS vs 
        ON vac.clean_vend_name = vs.match_field
    where vac.session_id = sessionid) AS allItems 
  ORDER BY 1, 2 ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more = 1 ;
  DROP TEMPORARY TABLE IF EXISTS `temp_all` ;
  CREATE TEMPORARY TABLE `temp_all` (
    rowid MEDIUMINT UNSIGNED PRIMARY KEY NOT NULL,
    simid MEDIUMINT UNSIGNED NOT NULL
  ) ENGINE = MEMORY ;
  DROP TEMPORARY TABLE IF EXISTS `temp_related` ;
  CREATE TEMPORARY TABLE `temp_related` (
    rowid MEDIUMINT UNSIGNED PRIMARY KEY NOT NULL,
    simid MEDIUMINT UNSIGNED NOT NULL
  ) ENGINE = MEMORY ;
  DROP TEMPORARY TABLE IF EXISTS `temp_related2` ;
  CREATE TEMPORARY TABLE `temp_related2` (
    rowid MEDIUMINT UNSIGNED PRIMARY KEY NOT NULL,
    simid MEDIUMINT UNSIGNED NOT NULL
  ) ENGINE = MEMORY ;
  DROP TEMPORARY TABLE IF EXISTS `temp_rows` ;
  CREATE TEMPORARY TABLE `temp_rows` (rowid MEDIUMINT UNSIGNED NOT NULL) ENGINE = MEMORY ;
  SET result = 0;
  if isnull(sessionid) or sessionid='' then
     set error_message = 'Error: Procedure called with invalid parameter. The sessionid is not defined.';
     leave body;
  else
     set sessionCount = (select count(distinct session_id) from vendor_queue where session_id = sessionid and state = 'PENDING');
     if sessionCount <= 0 then
         set result = 1;
         set error_message = 'The session_id provided does not exists or is already loaded.';
         leave body;
     end if;
  end if;
  
  OPEN my_cursor ;
  FETCH my_cursor INTO theKeyword, theRowId ;
  SET prevKeyword = '' ;
  SET theSimIdCounter = 0 ;
  set rowCounter = 0;
  -- ************************************************** 
  --  BEGIN LOOP 
  -- ************************************************** 
  rpt:
  REPEAT
    IF prevKeyword <> theKeyword THEN -- perform matching in the temporary tables
       IF prevKeyword <> '' THEN 
          INSERT INTO temp_related 
          SELECT *
            FROM temp_all AS a 
           WHERE EXISTS (
                   SELECT '1' 
                     FROM temp_rows AS b 
                    WHERE a.rowid = b.rowid);
                    
          IF ROW_COUNT() > 0 THEN
             
             REPEAT
                COMMIT;
                DELETE FROM temp_related2;  
                INSERT INTO temp_related2
                SELECT * 
                  FROM temp_all a
                 WHERE EXISTS(
                         SELECT '1'
                           FROM temp_related b
                          WHERE a.simid = b.simid);
                          
                INSERT INTO temp_related 
                SELECT * 
                  FROM temp_related2 b
                    ON DUPLICATE KEY UPDATE temp_related.rowid = b.rowid;
                            
             UNTIL ROW_COUNT() <=  0
             END REPEAT;
             SET theSimId = (SELECT MIN(simid) AS leastId 
                               FROM temp_related);
             INSERT INTO temp_all 
             SELECT a.rowid, theSimId 
               FROM (SELECT rowid 
                       FROM temp_rows 
                      UNION DISTINCT 
                     SELECT rowid 
                       FROM temp_related) AS a 
                 ON DUPLICATE KEY UPDATE simid = theSimId ;
             DELETE FROM temp_related ;
          ELSE 
             SET theSimIdCounter = theSimIdCounter + 1 ;
             SET theSimId = theSimIdCounter ;
             INSERT INTO temp_all 
             SELECT rowid, theSimId 
               FROM temp_rows ;
          END IF ;
          DELETE FROM temp_rows ;
          COMMIT ;
       END IF ;
       SET prevKeyword = theKeyword ;
    END IF ;
    INSERT INTO `temp_rows` 
    VALUES (theRowId) ;
    FETCH my_cursor INTO theKeyword, theRowId ;
    UNTIL no_more = 1 
  END REPEAT;
  -- ************************************************** 
  --  END LOOP 
  -- ************************************************** 
  CLOSE my_cursor;
  
  INSERT INTO temp_related 
  SELECT * 
    FROM temp_all AS a 
    WHERE EXISTS(
            SELECT '1' 
              FROM temp_rows AS b 
             WHERE a.rowid = b.rowid) ;
  IF ROW_COUNT() > 0 THEN 
     SET theSimId = (SELECT MIN(simid) AS leastId FROM temp_related);
     INSERT INTO temp_all 
     SELECT a.rowid, theSimId 
       FROM (SELECT rowid 
               FROM temp_rows 
              UNION DISTINCT 
             SELECT rowid 
               FROM temp_related) AS a 
         ON DUPLICATE KEY UPDATE simid = theSimId ;
     DELETE FROM temp_related ;
  ELSE 
     SET theSimIdCounter = theSimIdCounter + 1 ;
     SET theSimId = theSimIdCounter ;
     INSERT INTO temp_all 
     SELECT rowid, theSimId 
       FROM temp_rows ;
  END IF ;
  DELETE FROM temp_rows ;
  COMMIT ;
  
  set theSimId = (select max(simid) from temp_all) + 1;
    
  if coalesce(include_match_key, false) then  
	  insert into vendors_similar_detail (tic_sim_id, vac_tic_rowid, match_keyword )
	  SELECT DISTINCT tmp.simid, 
		 q.tic_rowid, 
		 group_concat(distinct substring(match_keyword from 2) order by match_keyword) AS match_keyword  
	    FROM temp_all AS tmp
	   INNER JOIN 
		   (SELECT 
		    concat_ws('', step_identified, ' (', keyword, ')') as match_keyword,
		    tic_rowid 
		  FROM
		    (SELECT 
		      '1keyword' AS step_identified,
		      vack.keyword,
		      vac.tic_rowid 
		    FROM
		      vendor_address_clean_keywords vack 
		      INNER JOIN vendor_strong_keywords 
			ON vack.keyword = vendor_strong_keywords.keyword 
		      INNER JOIN vendor_address_clean vac 
			ON vack.vendor_clean_tic_rowid = vac.tic_rowid 
			WHERE vac.session_id = sessionid
		    UNION
		    SELECT 
		      vs.step_identified,
		      vs.match_field,
		      vac.`tic_rowid` 
		    FROM
		      vendor_address_clean vac 
		      INNER JOIN 
			(SELECT 
			  '2phone' AS step_identified,
			  phone_10_digit AS match_field,
			  COUNT(*) AS num_tran 
			FROM
			  vendor_address_clean 
			WHERE phone_10_digit IS NOT NULL 
			GROUP BY phone_10_digit 
			HAVING (COUNT(*) > 1)) AS vs 
			ON vac.phone_10_digit = vs.match_field 
			where vac.session_id = sessionid
		    UNION
		    SELECT 
		      vs.step_identified,
		      vs.match_field,
		      vac.`tic_rowid` 
		    FROM
		      vendor_address_clean vac 
		      INNER JOIN 
			(SELECT 
			  '3tax id' AS step_identified,
			  tax_id_clean AS match_field,
			  COUNT(*) AS num_tran 
			FROM
			  vendor_address_clean 
			WHERE tax_id_clean IS NOT NULL 
			GROUP BY tax_id_clean 
			HAVING (COUNT(*) > 1)) AS vs 
			ON vac.tax_id_clean = vs.match_field 
			where vac.session_id = sessionid
		    UNION
		    SELECT 
		      vs.step_identified,
		      vs.match_field,
		      vac.`tic_rowid` 
		    FROM
		      vendor_address_clean vac 
		      INNER JOIN 
			(SELECT 
			  '4vendor name' AS step_identified,
			  clean_vend_name AS match_field,
			  COUNT(*) AS num_tran 
			FROM
			  vendor_address_clean 
			WHERE clean_vend_name IS NOT NULL 
			  AND clean_vend_name <> '' 
			GROUP BY clean_vend_name 
			HAVING (COUNT(*) > 1)) AS vs 
			ON vac.clean_vend_name = vs.match_field) AS allItems
			where vac.sessionid = sessionid
		    ) AS q
		 ON tmp.rowid = q.tic_rowid
	   group by tmp.simid, q.tic_rowid 	 
	   ORDER BY 1, 2, 3;
   else
	  INSERT INTO vendors_similar_detail (tic_sim_id, vac_tic_rowid, match_keyword )
	  SELECT DISTINCT simid, 
		 rowid, 
		 'not computed'  
	    FROM temp_all
	   order by simid, rowid;  
   
   end if;
   if coalesce(include_singles, false) then   
	   drop temporary table if exists `temp_singles`;
	   set @s = concat('CREATE TEMPORARY TABLE temp_singles(simid INT AUTO_INCREMENT PRIMARY KEY NOT NULL, rowid INT NOT NULL) ENGINE = MEMORY AUTO_INCREMENT=',theSimId);
	   prepare stmt from @s;
	   execute stmt;
	   insert into temp_singles(rowid)
	   select distinct tic_rowid
	     from vendor_address_clean vac
	    where vac.session_id = sessionid
	      and not exists(
		  select '1'
		    from temp_all tmp
		   where vac.tic_rowid = tmp.rowid );
	   insert into vendors_similar_detail (tic_sim_id, vac_tic_rowid, match_keyword )
	   select simid, rowid, 'single' 
	     from temp_singles ;
   end if;
   commit;           
   set result = 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_update_vac_101` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_update_vac_101` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_update_vac_101`()
BEGIN
  DROP TEMPORARY TABLE IF EXISTS `temp_update_vac`;
  CREATE TEMPORARY TABLE temp_update_vac
  (tax_id_clean VARCHAR(20)) ENGINE=MEMORY;
  INSERT INTO temp_update_vac
  SELECT 
      tax_id_clean 
    FROM
      vendor_address_clean 
    WHERE tax_id_clean IS NOT NULL 
    GROUP BY tax_id_clean 
    HAVING COUNT(DISTINCT clean_vend_name)>25;
  IF ROW_COUNT()>0 THEN  
    UPDATE 
      vendor_address_clean AS vac
    SET
      tax_id_clean = NULL 
    WHERE EXISTS 
      (SELECT '1' FROM temp_update_vac AS tmp WHERE tmp.tax_id_clean = vac.tax_id_clean);
  END IF;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_update_vac_102` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_update_vac_102` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_update_vac_102`()
BEGIN
  DROP TEMPORARY TABLE IF EXISTS `temp_update_vac`;
  CREATE TEMPORARY TABLE temp_update_vac
  (phone_10_digit VARCHAR(100)) ENGINE=MEMORY;
  INSERT INTO temp_update_vac
  SELECT 
    phone_10_digit 
  FROM
    vendor_address_clean 
  WHERE phone_10_digit IS NOT NULL 
  GROUP BY phone_10_digit 
  HAVING COUNT(DISTINCT clean_vend_name) > 25;
  
  IF ROW_COUNT()>0 THEN  
    UPDATE 
      vendor_address_clean AS vac
    SET
      phone_10_digit = NULL 
    WHERE EXISTS 
      (SELECT '1' FROM temp_update_vac AS tmp WHERE tmp.phone_10_digit = vac.phone_10_digit);
  END IF;  
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_vendor_data_checks` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_vendor_data_checks` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_vendor_data_checks`()
BEGIN
	DROP TABLE IF EXISTS `vendor_data_entry_checks`;
	CREATE TABLE `vendor_data_entry_checks`(
	    `id`  INT PRIMARY KEY AUTO_INCREMENT,
        `sys` VARCHAR(30) NULL,
        `vend_num` VARCHAR(25) NULL,
        `vend_site_id` VARCHAR(25) NULL,
        `vendor_error` VARCHAR(150) NULL
	) CHARSET=utf8 ENGINE=INNODB;
    
    -- Active Vendor Name Starts with THE
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor Name Starts with THE'
      FROM vendor_address_clean
     WHERE LEFT(vendor_name, 4) IN ('THE ','THE,')
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
    -- Active Vendor has DO NOT USE in Vendor Name
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor has DO NOT USE in Vendor Name'
      FROM vendor_address_clean
     WHERE INSTR(vendor_name, 'DO NOT USE') > 0 
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
    -- Active Vendor has an * in Vendor Name
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor has an * in Vendor Name'
      FROM vendor_address_clean
     WHERE INSTR(vendor_name, '*') > 0 
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
      -- Active Vendor Name Starts with a SPACE
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor Name Starts with a SPACE'
      FROM vendor_address_clean
     WHERE LEFT(vendor_name, 1) = ' '
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
      -- Active Vendor with NO TAX ID Number
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor with NO TAX ID Number'
      FROM vendor_address_clean
     WHERE COALESCE(RTRIM(tax_id), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
        
      -- Active Vendor where TAX ID number is to long
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where TAX ID number is to long'
      FROM vendor_address_clean
     WHERE LENGTH(tax_id) > 11
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where City is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where City is blank'
      FROM vendor_address_clean
     WHERE COALESCE(RTRIM(city), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where ZIP is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where ZIP is blank'
      FROM vendor_address_clean
     WHERE zip_5_char IS NULL OR zip_5_char = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where Address Field is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where Address Field is blank'
      FROM vendor_address_clean
     WHERE COALESCE(TRIM(address_line_1), '') = '' 
       AND COALESCE(TRIM(address_line_2), '') = '' 
       AND COALESCE(TRIM(address_line_3), '') = '' 
       AND COALESCE(TRIM(address_line_4), '') = '' 
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where Telephone Number Field is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where Telephone Number Field is blank'
      FROM vendor_address_clean
     WHERE COALESCE(TRIM(phone), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where State is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where State is blank'
      FROM vendor_address_clean
     WHERE COALESCE(TRIM(state), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where Fax Number Field is blank
/* NO fax field in vendor_address_clean
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where Fax Number Field is blank'
      FROM vendor_address_clean
     WHERE COALESCE(TRIM(fax), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
*/
      -- Set the vend_unique_indentifier
/* We already used auto_increment in the id field and dropped the use of vend_unique_identifier in favor of the id field
       
    UPDATE vendor_data_entry_checks 
       SET vend_unique_identifier = CONCAT_WS('',
              `sys`,
              `vend_num`,
              `vend_site_id`
           );
*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_vendor_dups_routine` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_vendor_dups_routine` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_vendor_dups_routine`(inout source VARCHAR(50))
body:
BEGIN
   DECLARE ctr INT DEFAULT 0;
   DECLARE hasNoIndex BOOLEAN DEFAULT FALSE;
   DECLARE indices VARCHAR(255) DEFAULT '';   
   declare tempSource varchar(50) default '';
   set tempSource = ucase(trim(source));   
   set source = '';
   IF tempSource IS NULL or length(tempSource)=0 THEN 
      LEAVE body; 
   END IF;
   
   IF tempSource = 'VENDOR_ALL' or tempSource = 'AUTO' THEN
      -- check if the vendor_all and vendor_all_addr exists
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`TABLES` 
                  WHERE table_schema = DATABASE() 
                    AND table_name IN ('VENDOR_ALL', 'VENDOR_ALL_ADDR'));
      IF (ctr = 2) THEN
         -- check if the needed indices are present in vendor_all
         SET ctr = (SELECT COUNT(*) 
   	   	      FROM information_schema.`STATISTICS`
		     WHERE table_schema = DATABASE()
		       AND table_name = 'vendor_all'
		       AND column_name IN ('sys','vend_num'));
         IF ctr = 0 THEN
	    SET hasNoIndex = TRUE;
         ELSEIF ctr = 1 THEN
	    SET indices = (SELECT index_name 
			     FROM information_schema.`STATISTICS`
			    WHERE table_schema = DATABASE()
			      AND table_name = 'vendor_all'
			      AND column_name IN ('sys','vend_num'));
	    SET @s = CONCAT('DROP INDEX ', indices, ' ON vendor_all');
	    PREPARE stmt FROM @s;
	    EXECUTE stmt;
	    SET hasNoIndex = TRUE;
         END IF;              
         IF hasNoIndex THEN
	    CREATE INDEX `va_sys_vend_num_key` ON `vendor_all`(`sys`,`vend_num`);
         END IF;
      
         -- check if the needed indices are present in vendor_all_addr
         SET ctr = (SELECT COUNT(*) 
		      FROM information_schema.`STATISTICS`
		     WHERE table_schema = DATABASE()
		       AND table_name = 'vendor_all_addr'
		       AND column_name IN ('sys','vend_num'));
         IF ctr = 0 THEN
	    SET hasNoIndex = TRUE;
         ELSEIF ctr = 1 THEN
	    SET indices = (SELECT index_name 
			     FROM information_schema.`STATISTICS`
			    WHERE table_schema = DATABASE()
			      AND table_name = 'vendor_all_addr'
			      AND column_name IN ('sys','vend_num'));
	    SET @s = CONCAT('DROP INDEX ', indices, ' ON vendor_all_addr');
	    PREPARE stmt FROM @s;
	    EXECUTE stmt;
	    SET hasNoIndex = TRUE;
         END IF;              
         IF hasNoIndex THEN
	    CREATE INDEX `vaa_sys_vend_num_key` ON `vendor_all_addr`(`sys`,`vend_num`);
         END IF;
         set source = 'vendor_all';
      END IF;
    end if;  
    if source = '' or tempSource = 'VENDOR_FILE' then   
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`TABLES` 
                  WHERE table_schema = DATABASE() 
                    AND table_name IN ('VENDOR_FILE'));
      IF (ctr = 1) THEN
         SET source = 'vendor_file'; 
      END IF;
    end if;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `udp_vendor_dups_routine_wrapper` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_vendor_dups_routine_wrapper` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_vendor_dups_routine_wrapper`(from_source VARCHAR(50))
body:
begin
  declare actualSource varchar(50) default '';
  set actualSource = from_source;
  
  CALL udp_vendor_dups_routine(actualSource);
  
  if actualSource not in ('vendor_all','vendor_file') then
     select 'UNABLE TO PROCEED BECAUSE IT COULD NOT DETERMINE THE INPUT TABLE.' as message;
     leave body;
  end if;   
  SELECT concat_ws('','PROCESSING ROUTINE USING ',actualSource) AS message;
  -- 0200 sClientDTSPrefix variable
  -- 0700 sDupRunNum variable update
  -- 1102. vendor_all_dup_load_01 drop and create
  DROP TABLE IF EXISTS `vendor_all_dup_load_01` ;
  CREATE TABLE `vendor_all_dup_load_01` (
    `tic_rowid` INT(11) primary key NOT NULL AUTO_INCREMENT,
    `sys` VARCHAR(30) DEFAULT NULL,
    `vend_num` VARCHAR(25) DEFAULT NULL,
    `vend_site_id` VARCHAR(25) DEFAULT NULL,
    `created_on` DATETIME DEFAULT NULL,
    `created_by` VARCHAR(50) DEFAULT NULL,
    `year` SMALLINT(6) DEFAULT NULL,
    `month` TINYINT(4) DEFAULT NULL,
    `full_name` VARCHAR(403) DEFAULT NULL,
    `vend_name` VARCHAR(100) DEFAULT NULL,
    `vend_name2` VARCHAR(100) DEFAULT NULL,
    `vend_name3` VARCHAR(100) DEFAULT NULL,
    `vend_name4` VARCHAR(100) DEFAULT NULL,
    `city` VARCHAR(50) DEFAULT NULL,
    `state` VARCHAR(40) DEFAULT NULL,
    `po_box` VARCHAR(25) DEFAULT NULL,
    `zip_9` VARCHAR(30) DEFAULT NULL,
    `zip_9_num_only` VARCHAR(30) DEFAULT NULL,
    `zip_5` VARCHAR(5) DEFAULT NULL,
    `address1` VARCHAR(100) DEFAULT NULL,
    `address2` VARCHAR(100) DEFAULT NULL,
    `address3` VARCHAR(100) DEFAULT NULL,
    `address4` VARCHAR(100) DEFAULT NULL,
    `full_address_lines` VARCHAR(430) DEFAULT NULL,
    `full_addr_num_only` VARCHAR(430) DEFAULT NULL,
    `vend_name_full_first_ltr` VARCHAR(1) DEFAULT NULL,
    `vend_name_full_first_3ltr` VARCHAR(3) DEFAULT NULL,
    `vend_commod` VARCHAR(100) DEFAULT NULL,
    `min_code` VARCHAR(20) DEFAULT NULL,
    `vend_type` VARCHAR(50) DEFAULT NULL,
    `tax_id` VARCHAR(20) DEFAULT NULL,
    `vat_num` VARCHAR(20) DEFAULT NULL,
    `tax_id2` VARCHAR(20) DEFAULT NULL,
    `payment_terms` VARCHAR(25) DEFAULT NULL,
    KEY `vadl_key01` (`sys`,`zip_5`,`vend_name_full_first_ltr`,`full_addr_num_only`(255))
  ) ENGINE=INNODB CHARSET=utf8;
  -- 1103. vendor_all_dup_load_02 drop and create
  DROP TABLE IF EXISTS `vendor_all_dup_load_02`;
  CREATE TABLE `vendor_all_dup_load_02` (
    `tic_rowid` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `tic_dup_id` INT NOT NULL,
    `tic_group` VARCHAR (886) NULL,
    `vend_name_full_first_ltr` VARCHAR (1) NULL,
    `zip_5` VARCHAR (5) NULL,
    `full_addr_num_only` VARCHAR (800) NULL,
    `sys` VARCHAR (30) NULL,
    `created_on` DATETIME NULL,
    `created_by` VARCHAR (50) NULL,
    `vend_num` VARCHAR (25) NULL,
    `vend_site_id` VARCHAR (25) NULL,
    `full_name` VARCHAR (403) NULL,
    `num_tran` INT NULL,
    `min_full_name` VARCHAR (403) NULL,
    `max_full_name` VARCHAR (403) NULL,
    `po_box` VARCHAR (25) NULL,
    `address1` VARCHAR (100) NULL,
    `address2` VARCHAR (100) NULL,
    `address3` VARCHAR (100) NULL,
    `address4` VARCHAR (100) NULL,
    `city` VARCHAR (50) NULL,
    `state` VARCHAR (40) NULL,
    `zip_9` VARCHAR (30) NULL,
    `zip_9_num_only` VARCHAR (30) NULL,
    `vend_commod` VARCHAR (100) NULL,
    `min_code` VARCHAR (20) NULL,
    `vend_type` VARCHAR (50) NULL,
    `tax_id` VARCHAR (20) NULL,
    `vat_num` VARCHAR (20) NULL,
    `tax_id2` VARCHAR (20) NULL,
    `payment_terms` VARCHAR (25) NULL,
    `full_address_lines` VARCHAR (430) NULL,
    `vend_name` VARCHAR (100) NULL,
    `vend_name_soundex` VARCHAR (1) NULL
  ) CHARSET = utf8 ENGINE = INNODB ;
  -- 1104. vendor_all_dup_load_summary drop and create
  DROP TABLE IF EXISTS `vendor_all_dup_load_summary`;
  CREATE TABLE `vendor_all_dup_load_summary` (
    `tic_rowid` INT(11) primary key NOT NULL AUTO_INCREMENT,
    `sys` VARCHAR(30) DEFAULT NULL,
    `vend_name_full_first_ltr` VARCHAR(1) DEFAULT NULL,
    `zip_5` VARCHAR(5) DEFAULT NULL,
    `full_addr_num_only` VARCHAR(430) DEFAULT NULL,
    `num_tran` INT(11) DEFAULT NULL,
    `min_full_name` VARCHAR(403) DEFAULT NULL,
    `max_full_name` VARCHAR(403) DEFAULT NULL,
    `min_vend_num` VARCHAR(25) DEFAULT NULL,
    `max_vend_num` VARCHAR(25) DEFAULT NULL,
    `min_vend_site_id` VARCHAR(25) DEFAULT NULL,
    `max_vend_site_id` VARCHAR(25) DEFAULT NULL,
    `min_vend_name` VARCHAR(100) DEFAULT NULL,
    `max_vend_name` VARCHAR(100) DEFAULT NULL,
    KEY `vadls_key01` (`sys`,`zip_5`,`vend_name_full_first_ltr`,`full_addr_num_only`(255))
  ) ENGINE=INNODB CHARSET=utf8;
  -- 1105. vendor_all_dups_detail drop and create
  DROP TABLE IF EXISTS `vendor_all_dups_detail`;
  CREATE TABLE `vendor_all_dups_detail` (
    `tic_rowid` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `tic_dup_id` INT NOT NULL,
    `tic_dup_loaded_on` DATETIME NULL,
    `tic_dup_loaded_year` MEDIUMINT NULL,
    `tic_dup_loaded_month` TINYINT NULL,
    `num_tran` MEDIUMINT NULL,
    `tic_group` VARCHAR (886) NULL,
    `sys` VARCHAR (30) NULL,
    `vend_num` VARCHAR (25) NULL,
    `vend_site_id` VARCHAR (25) NULL,
    `created_on` DATETIME NULL,
    `created_by` VARCHAR (50) NULL,
    `full_name` VARCHAR (403) NULL,
    `po_box` VARCHAR (25) NULL,
    `address1` VARCHAR (100) NULL,
    `address2` VARCHAR (100) NULL,
    `address3` VARCHAR (100) NULL,
    `address4` VARCHAR (100) NULL,
    `city` VARCHAR (50) NULL,
    `state` VARCHAR (40) NULL,
    `zip_9` VARCHAR (30) NULL,
    `zip_9_num_only` VARCHAR (30) NULL,
    `vend_commod` VARCHAR (100) NULL,
    `min_code` VARCHAR (20) NULL,
    `vend_type` VARCHAR (50) NULL,
    `tax_id` VARCHAR (20) NULL,
    `vat_num` VARCHAR (20) NULL,
    `tax_id2` VARCHAR (20) NULL,
    `payment_terms` VARCHAR (25) NULL,
    `vend_name` VARCHAR (100) NULL,
    `full_address_lines` VARCHAR (430) NULL,
    KEY `vadd_dup_key` (`tic_dup_id`)
  ) CHARSET = utf8 ENGINE = INNODB ;
  IF actualSource = 'vendor_all' THEN
 
     INSERT INTO `vendor_all_dup_load_01` (
            `sys`,
            `vend_num`,
            `vend_site_id`,
            `created_on`,
            `created_by`,
            `year`,
            `month`,
            `full_name`,
            `vend_name`,
            `vend_name2`,
            `vend_name3`,
            `vend_name4`,
            `city`,
            `state`,
            `po_box`,
            `zip_9`,
            `zip_9_num_only`,
            `zip_5`,
            `address1`,
            `address2`,
            `address3`,
            `address4`,
            `full_address_lines`,
            `full_addr_num_only`,
            `vend_name_full_first_ltr`,
            `vend_name_full_first_3ltr`,
            `vend_commod`,
            `min_code`,
            `vend_type`,
            `tax_id`,
            `vat_num`,
            `tax_id2`,
            `payment_terms`
            ) 
    SELECT DISTINCT 
	   va.sys,
	   va.vend_num,
	   vaa.vend_site_id,
	   vaa.effective_on AS `created_on`,
	   vaa.created_by,
	   DATE_FORMAT(vaa.effective_on, '%Y') AS `year`, -- created_on in vendor_file
	   DATE_FORMAT(vaa.effective_on, '%c') AS `month`,
	   TRIM(
	     CONCAT_WS(
	       '',
	       va.vend_name,
	       ' ',
	       va.vend_name2,
	       ' ',
	       va.vend_name3,
	       ' ',
	       va.vend_name4
	     )
	   ) AS `full_name`,
	   UCASE(va.vend_name),
	   va.vend_name2,
	   va.vend_name3,
	   va.vend_name4,
	   vaa.city,
	   vaa.state,
	   vaa.po_box,
	   vaa.zip AS zip_9,
	   udf_cleanString(vaa.zip) AS zip_9_num_only,
	   SUBSTRING(vaa.zip, 1, 5) AS zip_5,
	   vaa.address1,
	   vaa.address2,
	   vaa.address3,
	   vaa.address4,
	   TRIM(
	     CONCAT_WS(
	       '',
	       vaa.address1,
	       ' ',
	       vaa.address2,
	       ' ',
	       vaa.address3,
	       ' ',
	       vaa.address4,
	       ' ',
	       vaa.po_box
	     )
	   ) AS full_address_lines,
	   udf_extract_numbers (
	     CONCAT_WS(
	       '',
	       vaa.address1,
	       vaa.address2,
	       vaa.address3,
	       vaa.address4,
	       vaa.po_box
	     )
	   ) AS full_addr_num_only,
	   LEFT(TRIM(va.vend_name), 1) AS first_letter,
	   LEFT(TRIM(va.vend_name), 3) AS firstthree_letter,
	   va.vend_commod,
	   va.min_code, -- not found in vendor_file
	   va.vend_type,
	   va.tax_id,
	   va.vat_num, -- not found in vendor_file
	   va.tax_id2, -- not found in vendor_file
	   va.payment_terms 
      FROM vendor_all va 
	   LEFT OUTER JOIN vendor_all_addr vaa 
	     ON va.vend_num = vaa.vend_num 
	    AND va.sys = vaa.sys                
     WHERE va.del_flag IS NULL  -- not found in vendor_file
       AND va.post_blk IS NULL  -- not found in vendor_file
       AND va.po_blk IS NULL  -- not found in vendor_file
       AND va.inv_blk IS NULL  -- not found in vendor_file
       AND va.check_blk IS NULL  -- not found in vendor_file
       AND va.on_hold IS NULL  -- not found in vendor_file
       AND UCASE(vaa.active) = 'Y'  -- not found in vendor_file, maybe neglect this when vendor_file is the input
     ;
  ELSEIF actualSource = 'vendor_file' THEN
     INSERT INTO `vendor_all_dup_load_01` (
            `sys`,
            `vend_num`,
            `vend_site_id`,
            `created_on`,
            `created_by`,
            `year`,
            `month`,
            `full_name`,
            `vend_name`,
            `vend_name2`,
            `vend_name3`,
            `vend_name4`,
            `city`,
            `state`,
            `po_box`,
            `zip_9`,
            `zip_9_num_only`,
            `zip_5`,
            `address1`,
            `address2`,
            `address3`,
            `address4`,
            `full_address_lines`,
            `full_addr_num_only`,
            `vend_name_full_first_ltr`,
            `vend_name_full_first_3ltr`,
            `vend_commod`,
            `min_code`,
            `vend_type`,
            `tax_id`,
            `vat_num`,
            `tax_id2`,
            `payment_terms`
            ) 
     SELECT DISTINCT 
	    sys,
	    vend_num,
	    vend_site_id,
	    created_on,
	    created_by,
	    DATE_FORMAT(created_on, '%Y') AS `year`, -- created_on in vendor_file
	    DATE_FORMAT(created_on, '%c') AS `month`,
	    TRIM(
	      CONCAT_WS(
		'',
		va.vend_name,
		' ',
		va.vend_name2,
		' ',
		va.vend_name3,
		' ',
		va.vend_name4
	      )
	    ) AS `full_name`,
	    UCASE(vend_name),
	    vend_name2,
	    vend_name3,
	    vend_name4,
	    city,
	    state,
	    po_box,
	    zip AS zip_9,
	    udf_cleanString(zip) AS zip_9_num_only,
	    SUBSTRING(zip, 1, 5) AS zip_5,
	    address1,
	    address2,
	    address3,
	    address4,
	    TRIM(
	      CONCAT_WS(
		'',
		address1,
		' ',
		address2,
		' ',
		address3,
		' ',
		address4,
		' ',
		po_box
	      )
	    ) AS full_address_lines,
	    udf_extract_numbers (
	      CONCAT_WS(
		'',
		address1,
		address2,
		address3,
		address4,
		po_box
	      )
	    ) AS full_addr_num_only,
	    LEFT(TRIM(vend_name), 1) AS first_letter,
	    LEFT(TRIM(vend_name), 3) AS firstthree_letter,
	    vend_commod,
	    NULL AS min_code, -- not found in vendor_file
	    vend_type,
	    tax_id,
	    NULL AS vat_num, -- not found in vendor_file
	    NULL AS tax_id2, -- not found in vendor_file
	    payment_terms 
       FROM vendor_file;
  END IF;
     
     -- 1205. Insert to Vendor_all_dup_load_summary
     -- This will create a Summary with Max and Min information
     -- of vendor_all_dup_load.  This information will be needed
     -- to identify possible duplicate vendors
     INSERT INTO vendor_all_dup_load_summary (
            `sys`,
            `vend_name_full_first_ltr`,
            `zip_5`,
            `full_addr_num_only`,
            `num_tran`,
            `min_full_name`,
            `max_full_name`,
            `min_vend_num`,
            `max_vend_num`,
            `min_vend_site_id`,
            `max_vend_site_id`,
            `min_vend_name`,
            `max_vend_name`
            ) 
     SELECT 
            vadl1.sys,
            vadl1.vend_name_full_first_ltr,
            vadl1.zip_5,
            vadl1.full_addr_num_only,
            COUNT(*) AS num_tran,
            MIN(vadl1.full_name) AS min_full_name,
            MAX(vadl1.full_name) AS max_full_name,
            MIN(vadl1.vend_num) AS min_vend_num,
            MAX(vadl1.vend_num) AS max_vend_num,
            MIN(vadl1.vend_site_id) AS min_vend_site_id,
            MAX(vadl1.vend_site_id) AS max_vend_site_id,
            MIN(vadl1.vend_name) AS min_vend_name,
            MAX(vadl1.vend_name) AS max_vend_name -- this field will be used for adidas as they only want to see duplicate vendors
                                                  -- within a company code which for sap is the vend site id. the data will
                                                  -- be split off during the data flow task based on this field.
                                                  -- 07/03/2012 rc
                                                  --       ,case when min(vend_site_id)=max(vend_site_id) then 'y' else 'n' end as same_vend_site_id           
       FROM vendor_all_dup_load_01 vadl1 
      GROUP BY vadl1.sys, vadl1.vend_name_full_first_ltr, vadl1.zip_5, vadl1.full_addr_num_only 
     HAVING COUNT(*) > 1 
        AND COUNT(*) < 10;
     -- 2201. Insert into vendor_all_dup_load_02
     -- This select statement is trying to identify possible dup vendors
     INSERT INTO vendor_all_dup_load_02 (
            `tic_dup_id`,
            `tic_group`,
            `vend_name_full_first_ltr`,
            `zip_5`,
            `full_addr_num_only`,
            `sys`,
            `created_on`,
            `created_by`,
            `vend_num`,
            `vend_site_id`,
            `full_name`,
            `num_tran`,
            `min_full_name`,
            `max_full_name`,
            `po_box`,
            `address1`,
            `address2`,
            `address3`,
            `address4`,
            `city`,
            `state`,
            `zip_9`,
            `zip_9_num_only`,
            `vend_commod`,
            `min_code`,
            `vend_type`,
            `tax_id`,
            `vat_num`,
            `tax_id2`,
            `payment_terms`,
            `full_address_lines`,
            `vend_name`,
            `vend_name_soundex`
            ) 
    SELECT 
            vadls.tic_rowid AS tic_dup_id,
            CONCAT_WS(
              '',
              RTRIM(vadls.sys),
              vadls.min_vend_num,
              vadls.max_vend_num,
              vadls.vend_name_full_first_ltr,
              vadls.zip_5,
              vadls.full_addr_num_only
            ) AS tic_group,
            vadl1.vend_name_full_first_ltr,
            vadl1.zip_5,
            vadl1.full_addr_num_only,
            vadl1.sys,
            vadl1.created_on,
            vadl1.created_by,
            UCASE(vadl1.vend_num),
            vadl1.vend_site_id,
            vadl1.full_name,
            vadls.num_tran,
            vadls.min_full_name,
            vadls.max_full_name,
            vadl1.po_box,
            vadl1.address1,
            vadl1.address2,
            vadl1.address3,          
            vadl1.address4,
            vadl1.city,
            vadl1.state,
            vadl1.zip_9,
            vadl1.zip_9_num_only,
            vadl1.vend_commod,
            vadl1.min_code,
            vadl1.vend_type,
            vadl1.tax_id,
            vadl1.vat_num,
            vadl1.tax_id2,
            vadl1.payment_terms,
            -- these fields were added on 12/16/2004 in order to provide
            -- needed data to determine possible automated write downs of dups
            vadl1.full_address_lines,
            UCASE(vadl1.vend_name),
            CASE
              WHEN SOUNDEX(min_vend_name) = SOUNDEX(max_vend_name) 
              THEN 'Y' 
              ELSE 'N' 
            END AS vend_name_soundex 
       FROM vendor_all_dup_load_01 vadl1 
            INNER JOIN vendor_all_dup_load_summary vadls 
               ON vadl1.sys = vadls.sys 
              AND vadl1.zip_5 = vadls.zip_5 
              AND vadl1.vend_name_full_first_ltr = vadls.vend_name_full_first_ltr 
              AND vadl1.full_addr_num_only = vadls.full_addr_num_only -- isnull(vadl1.company,'') = isnull(dbo.vadls.company,'')
      WHERE vadls.num_tran > 1 
        AND vadls.min_vend_num <> vadls.max_vend_num ;
      -- 2202. insert into vendor_all_dups_detail
    INSERT INTO `vendor_all_dups_detail` (
           `tic_dup_id`,
           `tic_dup_loaded_on`,
           `tic_dup_loaded_year`,
           `tic_dup_loaded_month`,
           `num_tran`,
           `tic_group`,
           `sys`,
           `vend_num`,
           `vend_site_id`,
           `created_on`,
           `created_by`,
           `full_name`,
           `po_box`,
           `address1`,
           `address2`,
           `address3`,
           `address4`,
           `city`,
           `state`,
           `zip_9`,         
           `zip_9_num_only`,
           `vend_commod`,
           `min_code`,
           `vend_type`,
           `tax_id`,
           `vat_num`,
           `tax_id2`,         
           `payment_terms`,
           `vend_name`,
           `full_address_lines`
           ) 
    SELECT 
           vadl2.tic_dup_id,
           CURDATE() AS tic_dup_loaded_on,
           YEAR(CURDATE()) AS tic_dup_loaded_year,
           MONTH(CURDATE()) AS tic_dup_loaded_month,
           vadl2.num_tran,
           vadl2.tic_group,
           vadl2.sys,
           vadl2.vend_num,
           vadl2.vend_site_id,
           vadl2.created_on,
           vadl2.created_by,
           vadl2.full_name,
           vadl2.po_box,
           vadl2.address1,
           vadl2.address2,
           vadl2.address3,
           vadl2.address4,
           vadl2.city,
           vadl2.state,
           vadl2.zip_9,
           vadl2.zip_9_num_only,
           vadl2.vend_commod,
           vadl2.min_code,
           vadl2.vend_type,
           vadl2.tax_id,
           vadl2.vat_num,
           vadl2.tax_id2,
           vadl2.payment_terms,
           vadl2.vend_name,
           vadl2.full_address_lines 
      FROM vendor_all_dup_load_02 vadl2 
     WHERE NOT EXISTS 
           (SELECT '1' 
              FROM vendor_all_dup_load_02 b 
             WHERE vadl2.tic_dup_id = b.tic_dup_id 
               AND b.vend_name_soundex = 'N' 
               AND b.full_addr_num_only = '' 
               AND (b.full_address_lines <> '' OR b.zip_9_num_only = '')
            ) ;
   select 'ROUTINE EXECUTED SUCCESSFULLY.' as message;         
end */$$
DELIMITER ;

/* Procedure structure for procedure `udp_vendor_routine` */

/*!50003 DROP PROCEDURE IF EXISTS  `udp_vendor_routine` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_vendor_routine`(inout source VARCHAR(50))
body:
BEGIN
   DECLARE ctr INT DEFAULT 0;
   DECLARE hasNoIndex BOOLEAN DEFAULT FALSE;
   DECLARE indices VARCHAR(255) DEFAULT '';   
   declare tempSource varchar(50) default '';
   set tempSource = ucase(trim(source));   
   set source = '';
   IF tempSource IS NULL or length(tempSource)=0 THEN 
      LEAVE body; 
   END IF;
   
   IF tempSource = 'VENDOR_ALL' or tempSource = 'AUTO' THEN
      -- check if the vendor_all and vendor_all_addr exists
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`TABLES` 
                  WHERE table_schema = DATABASE() 
                    AND table_name IN ('VENDOR_ALL', 'VENDOR_ALL_ADDR'));
      IF (ctr = 2) THEN
         -- check if the needed indices are present in vendor_all
         SET ctr = (SELECT COUNT(*) 
   	   	      FROM information_schema.`STATISTICS`
		     WHERE table_schema = DATABASE()
		       AND table_name = 'vendor_all'
		       AND column_name IN ('sys','vend_num'));
         IF ctr = 0 THEN
	    SET hasNoIndex = TRUE;
         ELSEIF ctr = 1 THEN
	    SET indices = (SELECT index_name 
			     FROM information_schema.`STATISTICS`
			    WHERE table_schema = DATABASE()
			      AND table_name = 'vendor_all'
			      AND column_name IN ('sys','vend_num'));
	    SET @s = CONCAT('DROP INDEX ', indices, ' ON vendor_all');
	    PREPARE stmt FROM @s;
	    EXECUTE stmt;
	    SET hasNoIndex = TRUE;
         END IF;              
         IF hasNoIndex THEN
	    CREATE INDEX `va_sys_vend_num_key` ON `vendor_all`(`sys`,`vend_num`);
         END IF;
      
         -- check if the needed indices are present in vendor_all_addr
         SET ctr = (SELECT COUNT(*) 
		      FROM information_schema.`STATISTICS`
		     WHERE table_schema = DATABASE()
		       AND table_name = 'vendor_all_addr'
		       AND column_name IN ('sys','vend_num'));
         IF ctr = 0 THEN
	    SET hasNoIndex = TRUE;
         ELSEIF ctr = 1 THEN
	    SET indices = (SELECT index_name 
			     FROM information_schema.`STATISTICS`
			    WHERE table_schema = DATABASE()
			      AND table_name = 'vendor_all_addr'
			      AND column_name IN ('sys','vend_num'));
	    SET @s = CONCAT('DROP INDEX ', indices, ' ON vendor_all_addr');
	    PREPARE stmt FROM @s;
	    EXECUTE stmt;
	    SET hasNoIndex = TRUE;
         END IF;              
         IF hasNoIndex THEN
	    CREATE INDEX `vaa_sys_vend_num_key` ON `vendor_all_addr`(`sys`,`vend_num`);
         END IF;
         set source = 'vendor_all';
      END IF;
    end if;  
    if source = '' or tempSource = 'VENDOR_FILE' then   
      SET ctr = (SELECT COUNT(*) 
                   FROM information_schema.`TABLES` 
                  WHERE table_schema = DATABASE() 
                    AND table_name IN ('VENDOR_FILE'));
      IF (ctr = 1) THEN
         SET source = 'vendor_file'; 
      END IF;
    end if;
    
END */$$
DELIMITER ;

/*Table structure for table `view_related_vendors_detail` */

DROP TABLE IF EXISTS `view_related_vendors_detail`;

/*!50001 DROP VIEW IF EXISTS `view_related_vendors_detail` */;
/*!50001 DROP TABLE IF EXISTS `view_related_vendors_detail` */;

/*!50001 CREATE TABLE  `view_related_vendors_detail`(
 `tic_rowid` int(11) ,
 `tic_sim_id` int(11) ,
 `vac_tic_rowid` int(11) ,
 `match_keyword` varchar(150) ,
 `sys` varchar(30) ,
 `vend_num` varchar(25) ,
 `vend_site_id` varchar(25) ,
 `vendor_type` varchar(100) ,
 `vendor_name` varchar(100) ,
 `address_line_1` varchar(100) ,
 `address_line_2` varchar(100) ,
 `address_line_3` varchar(100) ,
 `address_line_4` varchar(100) ,
 `po_box_num` varchar(25) ,
 `city` varchar(50) ,
 `state` varchar(40) ,
 `zip` varchar(30) ,
 `country` varchar(50) ,
 `tax_id` varchar(20) ,
 `phone` varchar(35) ,
 `contact_email` varchar(1000) ,
 `last_activity_date` datetime ,
 `spend` decimal(12,2) ,
 `vend_first_letter` varchar(1) ,
 `vend_first_word` varchar(100) ,
 `clean_vend_name` varchar(100) ,
 `clean_vend_name_first_pass` varchar(100) ,
 `standard_vend_name` varchar(100) ,
 `vend_name_len` int(11) ,
 `address_num` varchar(100) ,
 `city_first_letter` varchar(1) ,
 `state_first_letter` varchar(1) ,
 `zip_5_char` varchar(5) ,
 `tax_id_clean` varchar(20) ,
 `phone_10_digit` varchar(35) ,
 `phone_9_digit` varchar(9) ,
 `phone_8_digit` varchar(8) ,
 `phone_7_digit` varchar(7) ,
 `phone_6_digit` varchar(6) ,
 `domain` varchar(100) ,
 `type_po_box` varchar(1) ,
 `type_comp_tax_id` varchar(50) ,
 `type_dba_id` varchar(50) ,
 `vendor_account_number` varchar(100) 
)*/;

/*Table structure for table `vw_vendor_dups_detail` */

DROP TABLE IF EXISTS `vw_vendor_dups_detail`;

/*!50001 DROP VIEW IF EXISTS `vw_vendor_dups_detail` */;
/*!50001 DROP TABLE IF EXISTS `vw_vendor_dups_detail` */;

/*!50001 CREATE TABLE  `vw_vendor_dups_detail`(
 `group_id` int(11) ,
 `tic_rowid` int(11) ,
 `sys` varchar(30) ,
 `vend_num` varchar(25) ,
 `vend_site_id` varchar(25) ,
 `vendor_type` varchar(100) ,
 `vendor_name` varchar(100) ,
 `address_line_1` varchar(100) ,
 `address_line_2` varchar(100) ,
 `address_line_3` varchar(100) ,
 `address_line_4` varchar(100) ,
 `po_box_num` varchar(25) ,
 `city` varchar(50) ,
 `state` varchar(40) ,
 `zip` varchar(30) ,
 `country` varchar(50) ,
 `tax_id` varchar(20) ,
 `phone` varchar(35) ,
 `contact_email` varchar(1000) ,
 `last_activity_date` datetime ,
 `spend` decimal(12,2) ,
 `vend_first_letter` varchar(1) ,
 `vend_first_word` varchar(100) ,
 `clean_vend_name` varchar(100) ,
 `clean_vend_name_first_pass` varchar(100) ,
 `standard_vend_name` varchar(100) ,
 `vend_name_len` int(11) ,
 `address_num` varchar(100) ,
 `city_first_letter` varchar(1) ,
 `state_first_letter` varchar(1) ,
 `zip_5_char` varchar(5) ,
 `tax_id_clean` varchar(20) ,
 `phone_10_digit` varchar(35) ,
 `phone_9_digit` varchar(9) ,
 `phone_8_digit` varchar(8) ,
 `phone_7_digit` varchar(7) ,
 `phone_6_digit` varchar(6) ,
 `domain` varchar(100) ,
 `type_po_box` varchar(1) ,
 `type_comp_tax_id` varchar(50) ,
 `type_dba_id` varchar(50) 
)*/;

/*View structure for view view_related_vendors_detail */

/*!50001 DROP TABLE IF EXISTS `view_related_vendors_detail` */;
/*!50001 DROP VIEW IF EXISTS `view_related_vendors_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_related_vendors_detail` AS select `a`.`tic_rowid` AS `tic_rowid`,`a`.`tic_sim_id` AS `tic_sim_id`,`a`.`vac_tic_rowid` AS `vac_tic_rowid`,`a`.`match_keyword` AS `match_keyword`,`b`.`sys` AS `sys`,`b`.`vend_num` AS `vend_num`,`b`.`vend_site_id` AS `vend_site_id`,`b`.`vendor_type` AS `vendor_type`,`b`.`vendor_name` AS `vendor_name`,`b`.`address_line_1` AS `address_line_1`,`b`.`address_line_2` AS `address_line_2`,`b`.`address_line_3` AS `address_line_3`,`b`.`address_line_4` AS `address_line_4`,`b`.`po_box_num` AS `po_box_num`,`b`.`city` AS `city`,`b`.`state` AS `state`,`b`.`zip` AS `zip`,`b`.`country` AS `country`,`b`.`tax_id` AS `tax_id`,`b`.`phone` AS `phone`,`b`.`contact_email` AS `contact_email`,`b`.`last_activity_date` AS `last_activity_date`,`b`.`spend` AS `spend`,`b`.`vend_first_letter` AS `vend_first_letter`,`b`.`vend_first_word` AS `vend_first_word`,`b`.`clean_vend_name` AS `clean_vend_name`,`b`.`clean_vend_name_first_pass` AS `clean_vend_name_first_pass`,`b`.`standard_vend_name` AS `standard_vend_name`,`b`.`vend_name_len` AS `vend_name_len`,`b`.`address_num` AS `address_num`,`b`.`city_first_letter` AS `city_first_letter`,`b`.`state_first_letter` AS `state_first_letter`,`b`.`zip_5_char` AS `zip_5_char`,`b`.`tax_id_clean` AS `tax_id_clean`,`b`.`phone_10_digit` AS `phone_10_digit`,`b`.`phone_9_digit` AS `phone_9_digit`,`b`.`phone_8_digit` AS `phone_8_digit`,`b`.`phone_7_digit` AS `phone_7_digit`,`b`.`phone_6_digit` AS `phone_6_digit`,`b`.`domain` AS `domain`,`b`.`type_po_box` AS `type_po_box`,`b`.`type_comp_tax_id` AS `type_comp_tax_id`,`b`.`type_dba_id` AS `type_dba_id`,`a`.`vendor_account_number` AS `vendor_account_number` from (`vendors_similar_detail` `a` join `vendor_address_clean` `b` on((`a`.`vac_tic_rowid` = `b`.`tic_rowid`))) order by `a`.`tic_sim_id`,`a`.`vac_tic_rowid` */;

/*View structure for view vw_vendor_dups_detail */

/*!50001 DROP TABLE IF EXISTS `vw_vendor_dups_detail` */;
/*!50001 DROP VIEW IF EXISTS `vw_vendor_dups_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vendor_dups_detail` AS select `b`.`group_id` AS `group_id`,`a`.`tic_rowid` AS `tic_rowid`,`a`.`sys` AS `sys`,`a`.`vend_num` AS `vend_num`,`a`.`vend_site_id` AS `vend_site_id`,`a`.`vendor_type` AS `vendor_type`,`a`.`vendor_name` AS `vendor_name`,`a`.`address_line_1` AS `address_line_1`,`a`.`address_line_2` AS `address_line_2`,`a`.`address_line_3` AS `address_line_3`,`a`.`address_line_4` AS `address_line_4`,`a`.`po_box_num` AS `po_box_num`,`a`.`city` AS `city`,`a`.`state` AS `state`,`a`.`zip` AS `zip`,`a`.`country` AS `country`,`a`.`tax_id` AS `tax_id`,`a`.`phone` AS `phone`,`a`.`contact_email` AS `contact_email`,`a`.`last_activity_date` AS `last_activity_date`,`a`.`spend` AS `spend`,`a`.`vend_first_letter` AS `vend_first_letter`,`a`.`vend_first_word` AS `vend_first_word`,`a`.`clean_vend_name` AS `clean_vend_name`,`a`.`clean_vend_name_first_pass` AS `clean_vend_name_first_pass`,`a`.`standard_vend_name` AS `standard_vend_name`,`a`.`vend_name_len` AS `vend_name_len`,`a`.`address_num` AS `address_num`,`a`.`city_first_letter` AS `city_first_letter`,`a`.`state_first_letter` AS `state_first_letter`,`a`.`zip_5_char` AS `zip_5_char`,`a`.`tax_id_clean` AS `tax_id_clean`,`a`.`phone_10_digit` AS `phone_10_digit`,`a`.`phone_9_digit` AS `phone_9_digit`,`a`.`phone_8_digit` AS `phone_8_digit`,`a`.`phone_7_digit` AS `phone_7_digit`,`a`.`phone_6_digit` AS `phone_6_digit`,`a`.`domain` AS `domain`,`a`.`type_po_box` AS `type_po_box`,`a`.`type_comp_tax_id` AS `type_comp_tax_id`,`a`.`type_dba_id` AS `type_dba_id` from (`vendor_address_clean` `a` join `vendor_dups` `b` on((`a`.`vend_num` = `b`.`vend_num`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
