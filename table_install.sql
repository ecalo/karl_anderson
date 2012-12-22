/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- DROP DATABASE karl3;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`karl3` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `karl3`;

/*Table structure for table `vendor_address_clean` */

DROP TABLE IF EXISTS `stg_vendor_address_clean`;

CREATE TABLE `stg_vendor_address_clean` (
  `tic_rowid` INT(11) NOT NULL AUTO_INCREMENT,
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
  `full_address` VARCHAR(512) DEFAULT NULL,
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
  `clean_vend_name2` VARCHAR(100) DEFAULT NULL,
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
  `session_id` VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vac_custacctnumber_key` (`custacctnumber`),
  KEY `vac_clean_vend_name_key` (`clean_vend_name`),
  KEY `vac_sys_key` (`sys`),
  KEY `vac_vend_num_key` (`vend_num`),
  KEY `vac_site_id_key` (`vend_site_id`),
  KEY `vac_phone_10_key` (`phone_10_digit`),
  KEY `vac_tax_key` (`tax_id_clean`),
  KEY `vac_session_key` (`session_id`)
) ENGINE=INNODB CHARSET=utf8;


/*Table structure for table `vendor_address_clean` */

DROP TABLE IF EXISTS `vendor_address_clean`;

CREATE TABLE `vendor_address_clean` (
  `tic_rowid` INT(11) NOT NULL AUTO_INCREMENT,
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
  `session_id` VARCHAR(32) DEFAULT NULL,
  `stg_tic_rowid` INT(11) NOT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vac_custacctnumber_key` (`custacctnumber`),
  KEY `vac_clean_vend_name_key` (`clean_vend_name`),
  KEY `vac_sys_key` (`sys`),
  KEY `vac_vend_num_key` (`vend_num`),
  KEY `vac_site_id_key` (`vend_site_id`),
  KEY `vac_phone_10_key` (`phone_10_digit`),
  KEY `vac_tax_key` (`tax_id_clean`),
  KEY `vac_session_key` (`session_id`),
  KEY `vac_stg_rowid_key` (`stg_tic_rowid`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_address_clean_keywords` */

DROP TABLE IF EXISTS `vendor_address_clean_keywords`;

CREATE TABLE `vendor_address_clean_keywords` (
  `tic_rowid` INT(11) NOT NULL AUTO_INCREMENT,
  `stg_vac_tic_rowid` INT(11) DEFAULT NULL,
  `keyword` VARCHAR(150) DEFAULT NULL,
  `session_id` VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vack_session_key` (`session_id`),
  KEY `vack_stg_ticrow_key` (`stg_vac_tic_rowid`),
  KEY `vack_keyword_key` (`keyword`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_all` */

DROP TABLE IF EXISTS `vendor_all`;

CREATE TABLE `vendor_all` (
  `tic_rowid` INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `tic_import_date` TIMESTAMP NULL DEFAULT NULL,
  `sys` VARCHAR(30) DEFAULT NULL,
  `vend_num` VARCHAR(25) DEFAULT NULL,
  `vend_commod` VARCHAR(100) DEFAULT NULL,
  `created_on` TIMESTAMP NULL DEFAULT NULL,
  `created_by` VARCHAR(50) DEFAULT NULL,
  `vend_type` VARCHAR(50) DEFAULT NULL,
  `cust_num` VARCHAR(25) DEFAULT NULL,
  `gl_ap_acct` VARCHAR(20) DEFAULT NULL,
  `vend_name` VARCHAR(100) DEFAULT NULL,
  `vend_name2` VARCHAR(100) DEFAULT NULL,
  `vend_name3` VARCHAR(100) DEFAULT NULL,
  `vend_name4` VARCHAR(100) DEFAULT NULL,
  `del_flag` VARCHAR(4) DEFAULT NULL,
  `post_blk` VARCHAR(4) DEFAULT NULL,
  `po_blk` VARCHAR(4) DEFAULT NULL,
  `inv_blk` VARCHAR(4) DEFAULT NULL,
  `check_blk` VARCHAR(4) DEFAULT NULL,
  `on_hold` VARCHAR(4) DEFAULT NULL,
  `tax_id` VARCHAR(20) DEFAULT NULL,
  `tax_id2` VARCHAR(20) DEFAULT NULL,
  `one_time` VARCHAR(4) DEFAULT NULL,
  `vat_num` VARCHAR(20) DEFAULT NULL,
  `plant` VARCHAR(4) DEFAULT NULL,
  `min_code` VARCHAR(20) DEFAULT NULL,
  `payment_terms` VARCHAR(25) DEFAULT NULL,
  `session_id` VARCHAR(32) DEFAULT NULL,
  KEY `va001` (`sys`,`vend_num`),
  KEY `va002` (`session_id`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_all_addr` */

DROP TABLE IF EXISTS `vendor_all_addr`;

CREATE TABLE `vendor_all_addr` (
  `tic_rowid` INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `tic_import_date` TIMESTAMP NULL DEFAULT NULL,
  `sys` VARCHAR(30) DEFAULT NULL,
  `vend_num` VARCHAR(25) DEFAULT NULL,
  `vend_seq_num` INT(10) DEFAULT NULL,
  `vend_site_id` VARCHAR(25) DEFAULT NULL,
  `effective_on` TIMESTAMP NULL DEFAULT NULL,
  `active` VARCHAR(4) DEFAULT NULL,
  `created_by` VARCHAR(50) DEFAULT NULL,
  `vend_name` VARCHAR(100) DEFAULT NULL,
  `vend_name2` VARCHAR(100) DEFAULT NULL,
  `vend_name3` VARCHAR(100) DEFAULT NULL,
  `vend_name4` VARCHAR(100) DEFAULT NULL,
  `address1` VARCHAR(100) DEFAULT NULL,
  `address2` VARCHAR(100) DEFAULT NULL,
  `address3` VARCHAR(100) DEFAULT NULL,
  `address4` VARCHAR(100) DEFAULT NULL,
  `city` VARCHAR(50) DEFAULT NULL,
  `state` VARCHAR(40) DEFAULT NULL,
  `po_box` VARCHAR(25) DEFAULT NULL,
  `zip` VARCHAR(30) DEFAULT NULL,
  `country` VARCHAR(50) DEFAULT NULL,
  `del_flag` VARCHAR(4) DEFAULT NULL,
  `post_blk` VARCHAR(4) DEFAULT NULL,
  `po_blk` VARCHAR(4) DEFAULT NULL,
  `inv_blk` VARCHAR(4) DEFAULT NULL,
  `check_blk` VARCHAR(4) DEFAULT NULL,
  `on_hold` VARCHAR(4) DEFAULT NULL,
  `telephone1` VARCHAR(35) DEFAULT NULL,
  `telephone2` VARCHAR(35) DEFAULT NULL,
  `fax` VARCHAR(35) DEFAULT NULL,
  `one_time` VARCHAR(4) DEFAULT NULL,
  `plant` VARCHAR(4) DEFAULT NULL,
  `company` VARCHAR(25) DEFAULT NULL,
  `email` TEXT,
  `year` SMALLINT(5) DEFAULT NULL,
  `month` TINYINT(3) UNSIGNED DEFAULT NULL,
  `quarter` TINYINT(3) UNSIGNED DEFAULT NULL,
  `flex1` VARCHAR(200) DEFAULT NULL,
  `flex2` VARCHAR(200) DEFAULT NULL,
  `flex3` VARCHAR(200) DEFAULT NULL,
  `flex4` VARCHAR(200) DEFAULT NULL,
  `session_id` VARCHAR(32) DEFAULT NULL,
  KEY `vaa001` (`sys`,`vend_num`),
  KEY `vaa002` (`session_id`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_clean_it` */

DROP TABLE IF EXISTS `vendor_clean_it`;

CREATE TABLE `vendor_clean_it` (
  `tic_rowid` INT(10) NOT NULL,
  `keyword` VARCHAR(100) DEFAULT NULL,
  `replace_with` VARCHAR(100) DEFAULT NULL,
  `replace_with_2nd_pass` VARCHAR(100) DEFAULT NULL,
  `maximum_pass` INT(10) DEFAULT NULL
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_data_entry_checks` */

DROP TABLE IF EXISTS `vendor_data_entry_checks`;

CREATE TABLE `vendor_data_entry_checks` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `sys` VARCHAR(30) DEFAULT NULL,
  `vend_num` VARCHAR(25) DEFAULT NULL,
  `vend_site_id` VARCHAR(25) DEFAULT NULL,
  `vendor_error` VARCHAR(150) DEFAULT NULL,
  `session_id` VARCHAR(32) DEFAULT NULL,
  KEY `vedc_session_key` (`session_id`),
  PRIMARY KEY (`id`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_dups` */

DROP TABLE IF EXISTS `vendor_dups`;

CREATE TABLE `vendor_dups` (
  `session_id` VARCHAR(32) NULL,
  `group_id` INT(11) NOT NULL,
  `sys` VARCHAR(30) NOT NULL,
  `vend_num` VARCHAR(25) NOT NULL,
  KEY `vd_vendnum_key` (`session_id`,`vend_num`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_file` */

DROP TABLE IF EXISTS `vendor_file`;

CREATE TABLE `vendor_file` (
  `tic_rowid` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `tic_import_date` TIMESTAMP NULL DEFAULT NULL,
  `sys` VARCHAR(30) DEFAULT NULL,
  `vend_num` VARCHAR(50) DEFAULT NULL,
  `vend_site_id` VARCHAR(25) DEFAULT NULL,
  `vend_type` VARCHAR(50) DEFAULT NULL,
  `vend_commod` VARCHAR(100) DEFAULT NULL,
  `vend_name` VARCHAR(100) DEFAULT NULL,
  `vend_name2` VARCHAR(100) DEFAULT NULL,
  `vend_name3` VARCHAR(100) DEFAULT NULL,
  `vend_name4` VARCHAR(100) DEFAULT NULL,
  `tax_id` VARCHAR(20) DEFAULT NULL,
  `payment_terms` VARCHAR(25) DEFAULT NULL,
  `address1` VARCHAR(100) DEFAULT NULL,
  `address2` VARCHAR(100) DEFAULT NULL,
  `address3` VARCHAR(100) DEFAULT NULL,
  `address4` VARCHAR(100) DEFAULT NULL,
  `po_box` VARCHAR(25) DEFAULT NULL,
  `city` VARCHAR(50) DEFAULT NULL,
  `state` VARCHAR(40) DEFAULT NULL,
  `zip` VARCHAR(30) DEFAULT NULL,
  `country` VARCHAR(50) DEFAULT NULL,
  `telephone` VARCHAR(35) DEFAULT NULL,
  `fax` VARCHAR(35) DEFAULT NULL,
  `email` VARCHAR(200) DEFAULT NULL,
  `website` VARCHAR(200) DEFAULT NULL,
  `flex1` VARCHAR(200) DEFAULT NULL,
  `flex2` VARCHAR(200) DEFAULT NULL,
  `flex3` VARCHAR(200) DEFAULT NULL,
  `flex4` VARCHAR(200) DEFAULT NULL,
  `spend` DECIMAL(12,2) DEFAULT NULL,
  `custacctnumber` VARCHAR(30) DEFAULT NULL,
  `created_on` TIMESTAMP NULL DEFAULT NULL,
  `created_by` VARCHAR(100) DEFAULT NULL,
  `session_id` VARCHAR(32) DEFAULT NULL,
  KEY `vf001` (`session_id`,`sys`,`vend_num`,`vend_site_id`),
  KEY `vf002` (`custacctnumber`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_queue` */

DROP TABLE IF EXISTS `vendor_queue`;

CREATE TABLE `vendor_queue` (
  `session_id` VARCHAR(32) NOT NULL,
  `state` VARCHAR(64) DEFAULT NULL COMMENT 'PENDING, ON PROCESS, SUCCESS, FAILED, CANCELLED',
  `source` VARCHAR(32) NOT NULL,
  `process_starts_on` DATETIME NULL,
  `process_ends_on` DATETIME NULL,
  PRIMARY KEY (`session_id`),
  KEY `queue_state_key` (`state`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `event_log` */

DROP TABLE IF EXISTS `event_log`;

CREATE TABLE `event_log` (
  `session_id` VARCHAR(32) NOT NULL,
  `status_update` VARCHAR(255) NOT NULL,
  `activity` VARCHAR(64) NOT NULL,
  `logged_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `event_log_session_key` (`session_id`),
  KEY `event_log_activity_key` (`activity`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `event_flag` */

DROP TABLE IF EXISTS `event_flag`;

CREATE TABLE `event_flag` (
  `event_name` VARCHAR(32) NOT NULL,
  `status` BIT(1) NOT NULL DEFAULT b'0',
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `vendor_strong_keywords` */

DROP TABLE IF EXISTS `vendor_strong_keywords`;

CREATE TABLE `vendor_strong_keywords` (
  `tic_rowid` INT(10) NOT NULL,
  `tic_updated_on` TIMESTAMP NULL DEFAULT NULL,
  `tic_updated_by` VARCHAR(30) DEFAULT NULL,
  `keyword` VARCHAR(100) DEFAULT NULL,
  KEY `vsk_key001` (`keyword`)
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendor_weak_one_keyword_names` */

DROP TABLE IF EXISTS `vendor_weak_one_keyword_names`;

CREATE TABLE `vendor_weak_one_keyword_names` (
  `tic_rowid` INT(10) NOT NULL,
  `tic_updated_on` TIMESTAMP NULL DEFAULT NULL,
  `tic_updated_by` VARCHAR(30) DEFAULT NULL,
  `keyword` VARCHAR(100) DEFAULT NULL
) ENGINE=INNODB CHARSET=utf8;

/*Table structure for table `vendors_similar_detail` */

DROP TABLE IF EXISTS `vendors_similar_detail`;

CREATE TABLE `vendors_similar_detail` (
  `tic_rowid` INT(11) NOT NULL AUTO_INCREMENT,
  `tic_sim_id` INT(11) DEFAULT NULL,
  `stg_vac_tic_rowid` INT(11) DEFAULT NULL,
  `match_keyword` VARCHAR(150) DEFAULT NULL,
  `vendor_account_number` VARCHAR(100) DEFAULT NULL,
  `session_id` VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (`tic_rowid`),
  KEY `vsd_session_key` (`session_id`),
  KEY `vsd_simid_key` (`tic_sim_id`),
  KEY `vsd_vac_tic_rowid_key` (`stg_vac_tic_rowid`)
) ENGINE=INNODB CHARSET=utf8;

/* View for duplicate vendor records */

CREATE OR REPLACE VIEW vw_vendor_dups_detail
AS
SELECT b.group_id, a.*
  FROM vendor_address_clean AS a
       INNER JOIN vendor_dups b
         ON a.vend_num = b.vend_num
;         

CREATE OR REPLACE VIEW `vw_related_vendors_detail` 
AS 
SELECT 
    `a`.`tic_rowid` AS `tic_rowid`
    , `a`.`tic_sim_id` AS `tic_sim_id`
    , `a`.`stg_vac_tic_rowid` AS `stg_vac_tic_rowid`
    , `a`.`match_keyword` AS `match_keyword`
    , `b`.`sys` AS `sys`
    , `b`.`vend_num` AS `vend_num`
    , `b`.`vend_site_id` AS `vend_site_id`
    , `b`.`vendor_type` AS `vendor_type`
    , `b`.`vendor_name` AS `vendor_name`
    , `b`.`address_line_1` AS `address_line_1`
    , `b`.`address_line_2` AS `address_line_2`
    , `b`.`address_line_3` AS `address_line_3`
    , `b`.`address_line_4` AS `address_line_4`
    , `b`.`po_box_num` AS `po_box_num`
    , `b`.`city` AS `city`
    , `b`.`state` AS `state`
    , `b`.`zip` AS `zip`
    , `b`.`country` AS `country`
    , `b`.`tax_id` AS `tax_id`
    , `b`.`phone` AS `phone`
    , `b`.`contact_email` AS `contact_email`
    , `b`.`last_activity_date` AS `last_activity_date`
    , `b`.`spend` AS `spend`
    , `b`.`vend_first_letter` AS `vend_first_letter`
    , `b`.`vend_first_word` AS `vend_first_word`
    , `b`.`clean_vend_name` AS `clean_vend_name`
    , `b`.`clean_vend_name_first_pass` AS `clean_vend_name_first_pass`
    , `b`.`standard_vend_name` AS `standard_vend_name`
    , `b`.`vend_name_len` AS `vend_name_len`
    , `b`.`address_num` AS `address_num`
    , `b`.`city_first_letter` AS `city_first_letter`
    , `b`.`state_first_letter` AS `state_first_letter`
    , `b`.`zip_5_char` AS `zip_5_char`
    , `b`.`tax_id_clean` AS `tax_id_clean`
    , `b`.`phone_10_digit` AS `phone_10_digit`
    , `b`.`phone_9_digit` AS `phone_9_digit`
    , `b`.`phone_8_digit` AS `phone_8_digit`
    , `b`.`phone_7_digit` AS `phone_7_digit`
    , `b`.`phone_6_digit` AS `phone_6_digit`
    , `b`.`domain` AS `domain`
    , `b`.`type_po_box` AS `type_po_box`
    , `b`.`type_comp_tax_id` AS `type_comp_tax_id`
    , `b`.`type_dba_id` AS `type_dba_id`
    , `a`.`vendor_account_number` AS `vendor_account_number`
    , `b`.`session_id` AS session_id 
FROM `vendors_similar_detail` `a` 
     JOIN `vendor_address_clean` `b` 
       ON `a`.`stg_vac_tic_rowid` = `b`.`stg_tic_rowid`
           AND `a`.`session_id` = `b`.`session_id`
ORDER BY `a`.`tic_sim_id`
    , `a`.`stg_vac_tic_rowid` 
; 

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
