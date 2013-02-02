/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.25a : Database - visa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`visa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `visa`;

/*Table structure for table `header` */

DROP TABLE IF EXISTS `header`;

CREATE TABLE `header` (
  `transaction_code` TINYINT(4) NOT NULL,
  `company_id` INT(11) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `processing_date` DATE DEFAULT NULL,
  `record_type_code` TINYINT(4) DEFAULT NULL,
  `record_count` INT(11) DEFAULT NULL,
  `total_amount` DECIMAL(18,2) DEFAULT NULL,
  `load_file_format` VARCHAR(10) DEFAULT NULL,
  `issuer_id` VARCHAR(10) DEFAULT NULL,
  `processor_id` INT(11) DEFAULT NULL,
  `visa_region_id` TINYINT(4) DEFAULT NULL,
  `processor_platform_ref` VARCHAR(10) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `parent_id` INT(11) DEFAULT NULL,
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `staging` */

DROP TABLE IF EXISTS `staging`;

CREATE TABLE `staging` (
  `col1` VARCHAR(8) DEFAULT NULL,
  `col2` VARCHAR(20) DEFAULT NULL,
  `col3` VARCHAR(80) DEFAULT NULL,
  `col4` VARCHAR(80) DEFAULT NULL,
  `col5` VARCHAR(80) DEFAULT NULL,
  `col6` VARCHAR(80) DEFAULT NULL,
  `col7` VARCHAR(76) DEFAULT NULL,
  `col8` VARCHAR(100) DEFAULT NULL,
  `col9` VARCHAR(76) DEFAULT NULL,
  `col10` VARCHAR(50) DEFAULT NULL,
  `col11` VARCHAR(50) DEFAULT NULL,
  `col12` VARCHAR(50) DEFAULT NULL,
  `col13` VARCHAR(50) DEFAULT NULL,
  `col14` VARCHAR(50) DEFAULT NULL,
  `col15` VARCHAR(52) DEFAULT NULL,
  `col16` VARCHAR(100) DEFAULT NULL,
  `col17` VARCHAR(76) DEFAULT NULL,
  `col18` VARCHAR(150) DEFAULT NULL,
  `col19` VARCHAR(150) DEFAULT NULL,
  `col20` VARCHAR(50) DEFAULT NULL,
  `col21` VARCHAR(50) DEFAULT NULL,
  `col22` VARCHAR(26) DEFAULT NULL,
  `col23` VARCHAR(26) DEFAULT NULL,
  `col24` VARCHAR(140) DEFAULT NULL,
  `col25` VARCHAR(56) DEFAULT NULL,
  `col26` VARCHAR(56) DEFAULT NULL,
  `col27` VARCHAR(52) DEFAULT NULL,
  `col28` VARCHAR(50) DEFAULT NULL,
  `col29` VARCHAR(76) DEFAULT NULL,
  `col30` VARCHAR(26) DEFAULT NULL,
  `col31` VARCHAR(26) DEFAULT NULL,
  `col32` VARCHAR(50) DEFAULT NULL,
  `col33` VARCHAR(76) DEFAULT NULL,
  `col34` VARCHAR(26) DEFAULT NULL,
  `col35` VARCHAR(26) DEFAULT NULL,
  `col36` VARCHAR(50) DEFAULT NULL,
  `col37` VARCHAR(26) DEFAULT NULL,
  `col38` VARCHAR(19) DEFAULT NULL,
  `col39` VARCHAR(52) DEFAULT NULL,
  `col40` VARCHAR(50) DEFAULT NULL,
  `col41` VARCHAR(50) DEFAULT NULL,
  `col42` VARCHAR(18) DEFAULT NULL,
  `col43` VARCHAR(50) DEFAULT NULL,
  `col44` VARCHAR(26) DEFAULT NULL,
  `col45` VARCHAR(26) DEFAULT NULL,
  `col46` VARCHAR(26) DEFAULT NULL,
  `col47` VARCHAR(26) DEFAULT NULL,
  `col48` VARCHAR(14) DEFAULT NULL,
  `col49` VARCHAR(52) DEFAULT NULL,
  `col50` VARCHAR(26) DEFAULT NULL,
  `col51` VARCHAR(26) DEFAULT NULL,
  `col52` VARCHAR(26) DEFAULT NULL,
  `col53` VARCHAR(26) DEFAULT NULL,
  `col54` VARCHAR(20) DEFAULT NULL,
  `col55` VARCHAR(20) DEFAULT NULL,
  `col56` VARCHAR(20) DEFAULT NULL,
  `col57` VARCHAR(20) DEFAULT NULL,
  `col58` VARCHAR(20) DEFAULT NULL,
  `col59` VARCHAR(26) DEFAULT NULL,
  `col60` VARCHAR(26) DEFAULT NULL,
  `col61` VARCHAR(26) DEFAULT NULL,
  `col62` VARCHAR(26) DEFAULT NULL,
  `col63` VARCHAR(20) DEFAULT NULL,
  `col64` VARCHAR(20) DEFAULT NULL,
  `col65` VARCHAR(8) DEFAULT NULL,
  `col66` VARCHAR(8) DEFAULT NULL,
  `col67` VARCHAR(8) DEFAULT NULL,
  `col68` VARCHAR(10) DEFAULT NULL,
  `col69` VARCHAR(256) DEFAULT NULL,
  `col70` VARCHAR(256) DEFAULT NULL,
  `col71` VARCHAR(256) DEFAULT NULL,
  `col72` VARCHAR(256) DEFAULT NULL,
  `col73` VARCHAR(40) DEFAULT NULL,
  `col74` VARCHAR(30) DEFAULT NULL,
  `col75` VARCHAR(30) DEFAULT NULL,
  `col76` VARCHAR(30) DEFAULT NULL,
  `col77` VARCHAR(30) DEFAULT NULL,
  `col78` VARCHAR(30) DEFAULT NULL,
  `col79` VARCHAR(30) DEFAULT NULL,
  `col80` VARCHAR(8) DEFAULT NULL,
  `col81` VARCHAR(8) DEFAULT NULL,
  `col82` VARCHAR(8) DEFAULT NULL,
  `col83` VARCHAR(8) DEFAULT NULL,
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  KEY `id` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t01_account_balance` */

DROP TABLE IF EXISTS `t01_account_balance`;

CREATE TABLE `t01_account_balance` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `closing_date` DATE DEFAULT NULL,
  `period` INT(11) DEFAULT NULL,
  `previous_balance` DECIMAL(18,2) DEFAULT NULL,
  `current_balance` DECIMAL(18,2) DEFAULT NULL,
  `credit_limit` DECIMAL(18,2) DEFAULT NULL,
  `current_amount_due` DECIMAL(18,2) DEFAULT NULL,
  `past_due_count` INT(11) DEFAULT NULL,
  `past_due_amount` DECIMAL(18,2) DEFAULT NULL,
  `disputed_amount` DECIMAL(18,2) DEFAULT NULL,
  `billing_currency_code` INT(11) DEFAULT NULL,
  `amount_past_due_1` DECIMAL(18,2) DEFAULT NULL,
  `amount_past_due_2` DECIMAL(18,2) DEFAULT NULL,
  `amount_past_due_3` DECIMAL(18,2) DEFAULT NULL,
  `amount_past_due_4` DECIMAL(18,2) DEFAULT NULL,
  `amount_past_due_5` DECIMAL(18,2) DEFAULT NULL,
  `amount_past_due_6` DECIMAL(18,2) DEFAULT NULL,
  `amount_past_due_plus` DECIMAL(18,2) DEFAULT NULL,
  `past_due_1_count` INT(11) DEFAULT NULL,
  `past_due_2_count` INT(11) DEFAULT NULL,
  `past_due_3_count` INT(11) DEFAULT NULL,
  `past_due_4_count` INT(11) DEFAULT NULL,
  `past_due_5_count` INT(11) DEFAULT NULL,
  `past_due_6_count` INT(11) DEFAULT NULL,
  `past_due_plus_count` INT(11) DEFAULT NULL,
  `past_due_cycles_count` INT(11) DEFAULT NULL,
  `last_payment_amount` DECIMAL(18,2) DEFAULT NULL,
  `last_payment_date` DATE DEFAULT NULL,
  `payment_due_date` DATE DEFAULT NULL,
  `high_balance` DECIMAL(18,2) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t02_car_rental_summary` */

DROP TABLE IF EXISTS `t02_car_rental_summary`;

CREATE TABLE `t02_car_rental_summary` (
  `load_transaction_type` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `no_shadow_indicator` TINYINT(4) DEFAULT NULL,
  `daily_rental_rate` DECIMAL(18,2) DEFAULT NULL,
  `other_charges` DECIMAL(18,2) DEFAULT NULL,
  `check_out_date` DATE DEFAULT NULL,
  `weekly_rental_rate` DECIMAL(18,2) DEFAULT NULL,
  `insurance_charges` DECIMAL(18,2) DEFAULT NULL,
  `fuel_charges` DECIMAL(18,2) DEFAULT NULL,
  `class_code` VARCHAR(2) DEFAULT NULL,
  `one_way_drop_off_charges` DECIMAL(18,2) DEFAULT NULL,
  `renter_name` VARCHAR(40) DEFAULT NULL,
  `auto_towing` DECIMAL(18,2) DEFAULT NULL,
  `regular_mileage_charges` DECIMAL(18,2) DEFAULT NULL,
  `extra_mileage_charges` DECIMAL(18,2) DEFAULT NULL,
  `late_return_hourly_rate` DECIMAL(18,2) DEFAULT NULL,
  `return_location` VARCHAR(26) DEFAULT NULL,
  `total_tax` DECIMAL(18,2) DEFAULT NULL,
  `telephone_charges` DECIMAL(18,2) DEFAULT NULL,
  `corporate_id` VARCHAR(16) DEFAULT NULL,
  `extra_charge_code` VARCHAR(6) DEFAULT NULL,
  `days_rented` TINYINT(4) DEFAULT NULL,
  `message_id` VARBINARY(16) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(18,6) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t03_card_account` */

DROP TABLE IF EXISTS `t03_card_account`;

CREATE TABLE `t03_card_account` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `card_holder_id` VARCHAR(20) DEFAULT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `hierarchy_node` VARCHAR(40) DEFAULT NULL,
  `effective_date` DATE DEFAULT NULL,
  `account_open_date` DATE DEFAULT NULL,
  `account_close_date` DATE DEFAULT NULL,
  `card_expiry_date` DATE DEFAULT NULL,
  `card_type` TINYINT(4) DEFAULT NULL,
  `spending_limit` DECIMAL(18,2) DEFAULT NULL,
  `statement_type` TINYINT(4) DEFAULT '3',
  `last_revision_date` DATE DEFAULT NULL,
  `trnsaction_spending_limit` DECIMAL(18,2) DEFAULT NULL,
  `corporation_payment_indicator` TINYINT(4) DEFAULT NULL,
  `billing_account_number` VARCHAR(20) DEFAULT NULL,
  `cost_center` VARCHAR(50) DEFAULT NULL,
  `gl_sub_account` VARCHAR(76) DEFAULT NULL,
  `transaction_daily_limit` INT(11) DEFAULT NULL,
  `trnsaction_cycle_limit` INT(11) DEFAULT NULL,
  `cash_limit_amount` DECIMAL(18,2) DEFAULT NULL,
  `status_code` TINYINT(4) DEFAULT NULL,
  `reason_status_code` TINYINT(4) DEFAULT NULL,
  `status_date` DATE DEFAULT NULL,
  `pre_funded_indicator` TINYINT(4) DEFAULT NULL,
  `city_pair_program_indicator` TINYINT(4) DEFAULT NULL,
  `task_order_number` VARCHAR(26) DEFAULT NULL,
  `fleet_service_indicator` TINYINT(4) DEFAULT NULL,
  `credit_rating` CHAR(2) DEFAULT NULL,
  `credit_rating_date` DATE DEFAULT NULL,
  `annual_fee_flag` TINYINT(4) DEFAULT NULL,
  `annual_fee_month` TINYINT(4) DEFAULT NULL,
  `card_receipt_verification_flag` TINYINT(4) DEFAULT NULL,
  `check_indicator` TINYINT(4) DEFAULT NULL,
  `account_type_flag` TINYINT(4) DEFAULT NULL,
  `lost_stolen_date` DATE DEFAULT NULL,
  `charge_off_date` DATE DEFAULT NULL,
  `charge_off_amount` DECIMAL(18,2) DEFAULT NULL,
  `trnasfer_account_number` VARCHAR(19) DEFAULT NULL,
  `calling_card_phone_type` CHAR(2) DEFAULT NULL,
  `emboss_line_1` VARCHAR(50) DEFAULT NULL,
  `emboss_line_2` VARCHAR(50) DEFAULT NULL,
  `last_credit_limit_change_date` DATE DEFAULT NULL,
  `last_maintenance_date_nar` DATE DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t04_cardholder` */

DROP TABLE IF EXISTS `t04_cardholder`;

CREATE TABLE `t04_cardholder` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `company_id` BIGINT(20) DEFAULT NULL,
  `card_holder_id` VARCHAR(20) DEFAULT NULL,
  `hierarchy_node` VARCHAR(40) DEFAULT NULL,
  `first_name` VARCHAR(20) DEFAULT NULL,
  `last_name` VARCHAR(20) DEFAULT NULL,
  `address_line_1` VARCHAR(40) DEFAULT NULL,
  `address_line_2` VARCHAR(40) DEFAULT NULL,
  `city` VARCHAR(20) DEFAULT NULL,
  `state_code` VARCHAR(4) DEFAULT NULL,
  `iso_country_code` INT(11) DEFAULT NULL,
  `postal_code` VARCHAR(15) DEFAULT NULL,
  `address_line_3` VARCHAR(40) DEFAULT NULL,
  `mail_stop` VARCHAR(14) DEFAULT NULL,
  `phone_number` VARCHAR(14) DEFAULT NULL,
  `fax_number` VARCHAR(14) DEFAULT NULL,
  `ssn_other_id` VARCHAR(20) DEFAULT NULL,
  `training_date` DATE DEFAULT NULL,
  `email_address` VARCHAR(128) DEFAULT NULL,
  `authorized_user_1` VARCHAR(26) DEFAULT NULL,
  `authorized_user_2` VARCHAR(26) DEFAULT NULL,
  `authorized_user_3` VARCHAR(26) DEFAULT NULL,
  `employee_id` VARCHAR(10) DEFAULT NULL,
  `home_phone` VARCHAR(14) DEFAULT NULL,
  `middle_name` VARCHAR(30) DEFAULT NULL,
  `visa_commerce_buyer_id` VARCHAR(19) DEFAULT NULL,
  `vehicle_id` VARCHAR(20) DEFAULT NULL,
  `misc_field_1` VARCHAR(16) DEFAULT NULL,
  `misc_field_1_desc` VARCHAR(26) DEFAULT NULL,
  `misc_field_2` VARCHAR(16) DEFAULT NULL,
  `misc_field_2_desc` VARCHAR(26) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t05_card_transaction` */

DROP TABLE IF EXISTS `t05_card_transaction`;

CREATE TABLE `t05_card_transaction` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_ref_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` BIGINT(20) DEFAULT NULL,
  `period` INT(11) DEFAULT NULL,
  `acquiring_bin` INT(11) DEFAULT NULL,
  `card_acceptor_id` VARCHAR(26) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_city` VARCHAR(14) DEFAULT NULL,
  `supplier_state_code` VARCHAR(4) DEFAULT NULL,
  `supplier_iso_country_code` INT(11) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `source_amount` DECIMAL(18,2) DEFAULT NULL,
  `billing_amount` DECIMAL(18,2) DEFAULT NULL,
  `source_currency_code` INT(11) DEFAULT NULL,
  `merchant_category_code` INT(11) DEFAULT NULL,
  `tansaction_type_code` CHAR(2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `billing_currency_code` INT(11) DEFAULT NULL,
  `tax_amount` DECIMAL(18,2) DEFAULT NULL,
  `dispute_amount` DECIMAL(18,2) DEFAULT NULL,
  `dispute_reason_code` TINYINT(4) DEFAULT NULL,
  `dispute_date` DATE DEFAULT NULL,
  `commodity_code` VARCHAR(4) DEFAULT NULL,
  `supplier_vat_number` VARCHAR(20) DEFAULT NULL,
  `supplier_order_number` VARCHAR(25) DEFAULT NULL,
  `customer_vat_number` VARCHAR(14) DEFAULT NULL,
  `vat_amount` DECIMAL(18,2) DEFAULT NULL,
  `tax2_amount` DECIMAL(18,2) DEFAULT NULL,
  `purchase_id_format` VARCHAR(2) DEFAULT NULL,
  `customer_code_cri` VARCHAR(50) DEFAULT NULL,
  `purchase_id` VARCHAR(76) DEFAULT NULL,
  `transaction_time` TIME DEFAULT NULL,
  `tax_amount_incl_code` TINYINT(4) DEFAULT NULL,
  `tax2_amount_incl_code` TINYINT(4) DEFAULT NULL,
  `order_type_code` TINYINT(4) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `mps_id` BIGINT(20) DEFAULT NULL,
  `usage_code` TINYINT(4) DEFAULT NULL,
  `enriched_transaction_flag` VARCHAR(2) DEFAULT NULL,
  `billing_account_number` VARCHAR(19) DEFAULT NULL,
  `dda_number` BIGINT(20) DEFAULT NULL,
  `dda_savings_number` BIGINT(20) DEFAULT NULL,
  `dispute_status_code` VARCHAR(2) DEFAULT NULL,
  `matched_indicator` TINYINT(4) DEFAULT NULL,
  `routing_number` INT(11) DEFAULT NULL,
  `authorization_number` VARCHAR(6) DEFAULT NULL,
  `cardholder_transaction_approval` VARCHAR(2) DEFAULT NULL,
  `extract_id` BIGINT(20) DEFAULT NULL,
  `memo_post_flag` TINYINT(4) DEFAULT NULL,
  `statement_date` DATE DEFAULT NULL,
  `user_data_1` VARCHAR(20) DEFAULT NULL,
  `user_data_1_desc` VARCHAR(20) DEFAULT NULL,
  `user_data_2` VARCHAR(20) DEFAULT NULL,
  `user_data_2_desc` VARCHAR(20) DEFAULT NULL,
  `user_data_3` VARCHAR(20) DEFAULT NULL,
  `user_data_3_desc` VARCHAR(20) DEFAULT NULL,
  `user_data_4` VARCHAR(20) DEFAULT NULL,
  `user_data_4_desc` VARCHAR(20) DEFAULT NULL,
  `user_data_5` VARCHAR(20) DEFAULT NULL,
  `user_data_5_desc` VARCHAR(20) DEFAULT NULL,
  `visa_commerce_batch_id` VARCHAR(20) DEFAULT NULL,
  `visa_commerce_payment_instr_date` DATE DEFAULT NULL,
  `line_item_matched_indicator` TINYINT(4) DEFAULT NULL,
  `issuer_defined_usage_code` VARCHAR(2) DEFAULT NULL,
  `source` VARCHAR(10) DEFAULT NULL,
  `optional_field_1` VARCHAR(256) DEFAULT NULL,
  `optional_field_2` VARCHAR(256) DEFAULT NULL,
  `optional_field_3` VARCHAR(256) DEFAULT NULL,
  `optional_field_4` VARCHAR(256) DEFAULT NULL,
  `reserved_field_1` VARCHAR(30) DEFAULT NULL,
  `reserved_field_2` VARCHAR(30) DEFAULT NULL,
  `reserved_field_3` VARCHAR(30) DEFAULT NULL,
  `reserved_field_4` VARCHAR(30) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t06_company` */

DROP TABLE IF EXISTS `t06_company`;

CREATE TABLE `t06_company` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `company_id` INT(11) DEFAULT NULL,
  `company_name` VARCHAR(80) DEFAULT NULL,
  `address_line_1` VARCHAR(80) DEFAULT NULL,
  `address_line_2` VARCHAR(80) DEFAULT NULL,
  `city` VARCHAR(20) DEFAULT NULL,
  `state_code` VARCHAR(4) DEFAULT NULL,
  `iso_country_code` INT(11) DEFAULT NULL,
  `postal_code` VARCHAR(14) DEFAULT NULL,
  `fiscal_year_date` DATE DEFAULT NULL,
  `spending_limit` DECIMAL(18,2) DEFAULT NULL,
  `card_type` TINYINT(4) DEFAULT NULL,
  `issuer_name` VARCHAR(40) DEFAULT NULL,
  `organization_hmi` TINYINT(4) DEFAULT NULL,
  `effective_date` DATE DEFAULT NULL,
  `address_line_3` VARCHAR(80) DEFAULT NULL,
  `federal_org_indicator` TINYINT(4) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t07_line_item_detail` */

DROP TABLE IF EXISTS `t07_line_item_detail`;

CREATE TABLE `t07_line_item_detail` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_ref_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `item_sequence_number` INT(11) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `item_commodity_code` VARCHAR(16) DEFAULT NULL,
  `item_descriptor` VARCHAR(26) DEFAULT NULL,
  `quantity` DECIMAL(16,4) DEFAULT NULL,
  `unti_cost` DECIMAL(18,4) DEFAULT NULL,
  `unit_measure` VARCHAR(12) DEFAULT NULL,
  `tax_amount` DECIMAL(18,2) DEFAULT NULL,
  `type_supply` INT(11) DEFAULT NULL,
  `last_item_indicator` TINYINT(4) DEFAULT NULL,
  `tax_rate` DECIMAL(9,4) DEFAULT NULL,
  `item_discount_amount` DECIMAL(16,2) DEFAULT NULL,
  `item_total_amount` DECIMAL(18,2) DEFAULT NULL,
  `item_product_code` VARCHAR(12) DEFAULT NULL,
  `service_id` VARCHAR(6) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(18,2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` INT(11) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `li_sales_tax_flag` TINYINT(4) DEFAULT NULL,
  `item_level_usage_code` VARCHAR(2) DEFAULT NULL,
  `line_item_source` VARCHAR(10) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t08_line_item_summary` */

DROP TABLE IF EXISTS `t08_line_item_summary`;

CREATE TABLE `t08_line_item_summary` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `discount_amount` DECIMAL(16,2) DEFAULT NULL,
  `freight_amount` DECIMAL(16,2) DEFAULT NULL,
  `duty_amount` DECIMAL(16,2) DEFAULT NULL,
  `destination_postal_code` VARCHAR(14) DEFAULT NULL,
  `source_postal_code` VARCHAR(14) DEFAULT NULL,
  `destination_country_code` INT(11) DEFAULT NULL,
  `vat_reference_number` VARCHAR(16) DEFAULT NULL,
  `order_date` DATE DEFAULT NULL,
  `freight_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `freight_tax_rate` DECIMAL(9,4) DEFAULT NULL,
  `service_id` VARCHAR(6) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(18,2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `source_country_code` INT(11) DEFAULT NULL,
  `destination_state` VARCHAR(4) DEFAULT NULL,
  `source_state` VARCHAR(4) DEFAULT NULL,
  `source` VARCHAR(10) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t09_lodging_summary` */

DROP TABLE IF EXISTS `t09_lodging_summary`;

CREATE TABLE `t09_lodging_summary` (
  `load_transaction_code` TINYINT(4) DEFAULT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `no_show_indicator` TINYINT(4) DEFAULT NULL,
  `check_in_date` DATE DEFAULT NULL,
  `daily_room_rate` DECIMAL(16,2) DEFAULT NULL,
  `total_other_charges` DECIMAL(16,2) DEFAULT NULL,
  `total_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `total_food_charges` DECIMAL(16,2) DEFAULT NULL,
  `total_prepaid_expenses` DECIMAL(16,2) DEFAULT NULL,
  `total_folio_cash_advances` DECIMAL(18,2) DEFAULT NULL,
  `total_valet_parking_charges` DECIMAL(16,2) DEFAULT NULL,
  `total_mini_bar_charges` DECIMAL(18,2) DEFAULT NULL,
  `total_laundry_charges` DECIMAL(16,2) DEFAULT NULL,
  `total_telephone_charges` DECIMAL(18,2) DEFAULT NULL,
  `total_gift_shop_purchases` DECIMAL(18,2) DEFAULT NULL,
  `total_movie_charges` DECIMAL(16,2) DEFAULT NULL,
  `total_business_center_charges` DECIMAL(18,2) DEFAULT NULL,
  `health_club_charges` DECIMAL(16,2) DEFAULT NULL,
  `extra_charge_code` VARCHAR(6) DEFAULT NULL,
  `total_room_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `lodging_nights` TINYINT(4) DEFAULT NULL,
  `total_non_room_charges` DECIMAL(16,2) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(18,2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t10_organization` */

DROP TABLE IF EXISTS `t10_organization`;

CREATE TABLE `t10_organization` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `company_id` INT(11) DEFAULT NULL,
  `hierarchy_node` VARCHAR(40) DEFAULT NULL,
  `parent_hierarchy_node` VARCHAR(40) DEFAULT NULL,
  `effective_date` DATE DEFAULT NULL,
  `description` VARCHAR(40) DEFAULT NULL,
  `manager_last_name` VARCHAR(20) DEFAULT NULL,
  `manager_first_name` VARCHAR(20) DEFAULT NULL,
  `manager_title` VARCHAR(40) DEFAULT NULL,
  `manager_training_date` DATE DEFAULT NULL,
  `manager_phone_number` VARCHAR(14) DEFAULT NULL,
  `task_order_number` VARCHAR(26) DEFAULT NULL,
  `contact_first_name` VARCHAR(20) DEFAULT NULL,
  `contact_last_name` VARCHAR(20) DEFAULT NULL,
  `contact_address_line_1` VARCHAR(40) DEFAULT NULL,
  `contact_address_line_2` VARCHAR(40) DEFAULT NULL,
  `contact_address_line_3` VARCHAR(40) DEFAULT NULL,
  `contact_city` VARCHAR(20) DEFAULT NULL,
  `contact_state_code` VARCHAR(4) DEFAULT NULL,
  `contact_country_code` INT(11) DEFAULT NULL,
  `contact_postal_code` VARCHAR(14) DEFAULT NULL,
  `contact_phone_number` VARCHAR(16) DEFAULT NULL,
  `contact_fax_number` VARCHAR(16) DEFAULT NULL,
  `contact_email_address` VARCHAR(140) DEFAULT NULL,
  `second_hierarchy_node_representation` VARCHAR(56) DEFAULT NULL,
  `third_hierarchy_node_representation` VARCHAR(56) DEFAULT NULL,
  `tree_id` VARCHAR(2) DEFAULT NULL,
  `cost_center` VARCHAR(50) DEFAULT NULL,
  `gl_sub_account` VARCHAR(76) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t11_period` */

DROP TABLE IF EXISTS `t11_period`;

CREATE TABLE `t11_period` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `company_id` INT(11) DEFAULT NULL,
  `perio` INT(11) DEFAULT NULL,
  `card_type` TINYINT(4) DEFAULT NULL,
  `start_date` DATE DEFAULT NULL,
  `end_date` DATE DEFAULT NULL,
  `period_complete_indicator` TINYINT(4) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Table structure for table `t14_passenger_itinerary` */

DROP TABLE IF EXISTS `t14_passenger_itinerary`;

CREATE TABLE `t14_passenger_itinerary` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `departure_date` DATE DEFAULT NULL,
  `travel_agency_code` VARCHAR(8) DEFAULT NULL,
  `travel_agency_name` VARCHAR(26) DEFAULT NULL,
  `ticket_indicator` TINYINT(4) DEFAULT NULL,
  `ticket_number` VARCHAR(14) DEFAULT NULL,
  `passenger_name` VARCHAR(20) DEFAULT NULL,
  `exchange_ticket_number` VARCHAR(14) DEFAULT NULL,
  `exchange_ticket_Amount` DECIMAL(16,2) DEFAULT NULL,
  `internet_indicator` TINYINT(4) DEFAULT NULL,
  `total_fare_amount` DECIMAL(16,2) DEFAULT NULL,
  `total_fee_amount` DECIMAL(16,2) DEFAULT NULL,
  `total_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `endorsement` VARCHAR(20) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(18,2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `passenger_specific_data` VARCHAR(50) DEFAULT NULL,
  `ticket_issue_date` DATE DEFAULT NULL,
  `number_of_legs` TINYINT(4) DEFAULT NULL,
  `e_ticket_indicator` TINYINT(4) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `travel_obligation_number` VARCHAR(13) DEFAULT NULL,
  `tcn_passenger_name` VARCHAR(50) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t15_leg_specific_information` */

DROP TABLE IF EXISTS `t15_leg_specific_information`;

CREATE TABLE `t15_leg_specific_information` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `leg_number` TINYINT(4) DEFAULT NULL,
  `destination_code` VARCHAR(4) DEFAULT NULL,
  `carrier_code` VARCHAR(4) DEFAULT NULL,
  `service_class` VARCHAR(2) DEFAULT NULL,
  `fare_basis` VARCHAR(8) DEFAULT NULL,
  `date_of_travel` DATE DEFAULT NULL,
  `stopover_code` TINYINT(4) DEFAULT NULL,
  `coupon_number` TINYINT(4) DEFAULT NULL,
  `carrier_reference_number` VARCHAR(6) DEFAULT NULL,
  `departure_time` TIME DEFAULT NULL,
  `arrival_time` TIME DEFAULT NULL,
  `origination_code` VARCHAR(4) DEFAULT NULL,
  `conjunction_ticket_number` VARCHAR(14) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(18,2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `domestic_international_indicator` TINYINT(4) DEFAULT NULL,
  `arrival_date` DATE DEFAULT NULL,
  `departure_tax` DECIMAL(16,2) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t16_supplier` */

DROP TABLE IF EXISTS `t16_supplier`;

CREATE TABLE `t16_supplier` (
  `load_transaction_code` TINYINT(4) DEFAULT NULL,
  `acquirer_bin` INT(11) DEFAULT NULL,
  `supplier_name` VARCHAR(30) DEFAULT NULL,
  `supplier_city` VARCHAR(14) DEFAULT NULL,
  `supplier_state_code` VARCHAR(4) DEFAULT NULL,
  `supplier_country_code` INT(11) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_address` VARCHAR(30) DEFAULT NULL,
  `mps_id` BIGINT(20) DEFAULT NULL,
  `business_legal_name` VARCHAR(30) DEFAULT NULL,
  `alternate_supplier_dba_name` VARCHAR(30) DEFAULT NULL,
  `mailing_address` VARCHAR(30) DEFAULT NULL,
  `dun_and_bradstreet_number` INT(11) DEFAULT NULL,
  `incorporation_status_code` TINYINT(4) DEFAULT NULL,
  `minority_owned_status_code` VARCHAR(2) DEFAULT NULL,
  `tax_id_number` INT(11) DEFAULT NULL,
  `primary_sic_code` VARCHAR(4) DEFAULT NULL,
  `secondary_sic_code` VARCHAR(4) DEFAULT NULL,
  `supplier_phone_number` VARCHAR(15) DEFAULT NULL,
  `sole_prop_owner_first_name` VARCHAR(25) DEFAULT NULL,
  `sole_prop_owner_mi` VARCHAR(2) DEFAULT NULL,
  `sole_prop_owner_last_name` VARCHAR(25) DEFAULT NULL,
  `women_owned_indicator` CHAR(1) DEFAULT NULL,
  `sales_volumne` INT(11) DEFAULT NULL,
  `employee_count` INT(11) DEFAULT NULL,
  `issuer_bin` INT(11) DEFAULT NULL,
  `tin_type_code` TINYINT(4) DEFAULT NULL,
  `supplier_email_address` VARCHAR(40) DEFAULT NULL,
  `supplier_fax_number` VARCHAR(15) DEFAULT NULL,
  `supplier_reserved_phone_number` VARCHAR(15) DEFAULT NULL,
  `level3_capture_indicator_code` CHAR(1) DEFAULT NULL,
  `level2_capture_indicator_code` CHAR(1) DEFAULT NULL,
  `parent_visa_supplier_id` BIGINT(20) DEFAULT NULL,
  `alternate_supplier_city` VARCHAR(20) DEFAULT NULL,
  `alternate_supplier_state_code` VARCHAR(3) DEFAULT NULL,
  `alternate_supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `supplier_out_of_business_date` DATE DEFAULT NULL,
  `supplier_ownership_change_date` DATE DEFAULT NULL,
  `8a_classification_indicator` CHAR(1) DEFAULT NULL,
  `8a_expiration_date` DATE DEFAULT NULL,
  `sba_participant_indicator` CHAR(1) DEFAULT NULL,
  `disabled_veteran_indicator` CHAR(1) DEFAULT NULL,
  `veteran_indicator` CHAR(1) DEFAULT NULL,
  `vietnam_era_veteran_indicator` CHAR(1) DEFAULT NULL,
  `supplier_information_refusal_indicator` CHAR(1) DEFAULT NULL,
  `incorporation_status_change_date` DATE DEFAULT NULL,
  `small_disadvantaged_business_indicator` CHAR(1) DEFAULT NULL,
  `mailing_city` VARCHAR(20) DEFAULT NULL,
  `mailing_state` VARCHAR(4) DEFAULT NULL,
  `mailing_country` INT(11) DEFAULT NULL,
  `alternate_supplier_country` INT(11) DEFAULT NULL,
  `hub_zone_indicator` CHAR(1) DEFAULT NULL,
  `franchise_code` CHAR(1) DEFAULT NULL,
  `primary_naics_code` INT(11) DEFAULT NULL,
  `secondary_naics_code` INT(11) DEFAULT NULL,
  `visa_commerce_seller_id` VARCHAR(19) DEFAULT NULL,
  `reserved_for_future_use` VARCHAR(12) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `austin_tetra_number` BIGINT(20) DEFAULT NULL,
  `non_profit_entity` CHAR(1) DEFAULT NULL,
  `woman_owned_small_business` CHAR(1) DEFAULT NULL,
  `veteran_owned_small_business` CHAR(1) DEFAULT NULL,
  `service_disabled_vet_owned_small_business` CHAR(1) DEFAULT NULL,
  `dot_disadvantaged_business_enterprise` CHAR(1) DEFAULT NULL,
  `disabled` CHAR(1) DEFAULT NULL,
  `historically_black_college_univ_minority_inst` CHAR(1) DEFAULT NULL,
  `merchant_type` CHAR(1) DEFAULT NULL,
  `patriot_act_excluded_party_list_indicator` CHAR(1) DEFAULT NULL,
  `taxpayer_name` VARCHAR(40) DEFAULT NULL,
  `tin_match_indicator` CHAR(1) DEFAULT NULL,
  `reserved_field_1` VARCHAR(30) DEFAULT NULL,
  `reserved_field_2` VARCHAR(30) DEFAULT NULL,
  `reserved_field_3` VARCHAR(30) DEFAULT NULL,
  `reserved_field_4` VARCHAR(30) DEFAULT NULL,
  `reserved_field_5` VARCHAR(30) DEFAULT NULL,
  `level_3_tier_1_indicator` CHAR(1) DEFAULT NULL,
  `level_3_tier_2_indicator` CHAR(1) DEFAULT NULL,
  `level_3_tier_3_indicator` CHAR(1) DEFAULT NULL,
  `level_3_tier_4_indicator` CHAR(1) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t17_fleet_service` */

DROP TABLE IF EXISTS `t17_fleet_service`;

CREATE TABLE `t17_fleet_service` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `purchase_type` TINYINT(4) DEFAULT NULL,
  `fuel_type` VARCHAR(2) DEFAULT NULL,
  `fuel_unit_of_measure_code` CHAR(1) DEFAULT NULL,
  `fuel_quantity` DECIMAL(16,4) DEFAULT NULL,
  `fuel_unit_cost` DECIMAL(16,4) DEFAULT NULL,
  `fuel_gross_amount` DECIMAL(16,4) DEFAULT NULL,
  `fuel_net_amount` DECIMAL(16,4) DEFAULT NULL,
  `non_fuel_gross_amount` DECIMAL(16,4) DEFAULT NULL,
  `non_fuel_net_amount` DECIMAL(16,4) DEFAULT NULL,
  `odometer_reading` VARCHAR(8) DEFAULT NULL,
  `vat_tax_rate` DECIMAL(9,4) DEFAULT NULL,
  `fuel_misc_tax_amount` DECIMAL(16,4) DEFAULT NULL,
  `non_fuel_misc_tax_amt` DECIMAL(16,4) DEFAULT NULL,
  `service_type` CHAR(1) DEFAULT NULL,
  `fuel_misc_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `non_fuel_misc_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `non_fuel_fed_excise_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `non_fuel_fed_excise_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `fuel_fed_excise_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `fuel_fed_excise_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `state_motor_fuel_tax_exempt_indicator` TINYINT(4) DEFAULT NULL,
  `state_motor_fuel_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `county_fuel_sales_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `county_fuel_sales_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `non_fuel_state_local_sales_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `non_fuel_state_local_sales_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `county_motor_fuel_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `county_motor_fuel_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `city_fuel_sales_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `city_fuel_sales_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `city_motor_fuel_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `city_motor_fuel_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `secondary_state_fuel_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `secondary_state_fuel_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `federal_sales_tax_exemp_indicator` TINYINT(4) DEFAULT NULL,
  `federal_sales_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(16,2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t18_fleet_product` */

DROP TABLE IF EXISTS `t18_fleet_product`;

CREATE TABLE `t18_fleet_product` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `product_sequence_number` TINYINT(4) DEFAULT NULL,
  `product_code` VARCHAR(2) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `source_amount` DECIMAL(16,2) DEFAULT NULL,
  `transaction_date` DATE DEFAULT NULL,
  `merchant_category_code` TINYINT(4) DEFAULT NULL,
  `supplier_name` VARCHAR(26) DEFAULT NULL,
  `supplier_postal_code` VARCHAR(14) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t20_temporary_services` */

DROP TABLE IF EXISTS `t20_temporary_services`;

CREATE TABLE `t20_temporary_services` (
  `load_transaction_code` TINYINT(4) DEFAULT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` INT(11) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `item_sequence_number` INT(11) DEFAULT NULL,
  `message_id` VARCHAR(15) DEFAULT NULL,
  `start_date` DATE DEFAULT NULL,
  `end_date` DATE DEFAULT NULL,
  `account_code` VARCHAR(18) DEFAULT NULL,
  `description` VARCHAR(26) DEFAULT NULL,
  `employee_name` VARCHAR(26) DEFAULT NULL,
  `employee_ssn` INT(11) DEFAULT NULL,
  `rate_indicator` INT(11) DEFAULT NULL,
  `rate` DECIMAL(14,2) DEFAULT NULL,
  `regular_hours_worked` DECIMAL(7,2) DEFAULT NULL,
  `overtime_rate` DECIMAL(14,2) DEFAULT NULL,
  `overtime_hours_worked` DECIMAL(7,2) DEFAULT NULL,
  `job_code` VARCHAR(12) DEFAULT NULL,
  `misc_expense_amount` DECIMAL(14,2) DEFAULT NULL,
  `misc_expense_indicator` VARCHAR(6) DEFAULT NULL,
  `requester_name` VARCHAR(16) DEFAULT NULL,
  `subtotal_amount` DECIMAL(14,2) DEFAULT NULL,
  `sales_tax_amount` DECIMAL(14,2) DEFAULT NULL,
  `discount_amount` DECIMAL(14,2) DEFAULT NULL,
  `supervisor` VARCHAR(26) DEFAULT NULL,
  `time_sheet_number` INT(11) DEFAULT NULL,
  `commodity_code` VARCHAR(12) DEFAULT NULL,
  `reimbursement_attribute` VARCHAR(2) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t21_shipping_services` */

DROP TABLE IF EXISTS `t21_shipping_services`;

CREATE TABLE `t21_shipping_services` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `item_sequence_number` INT(11) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `shipping_name` VARCHAR(26) DEFAULT NULL,
  `tracking_number` VARCHAR(22) DEFAULT NULL,
  `pickup_date` DATE DEFAULT NULL,
  `origin_zip_code` VARCHAR(14) DEFAULT NULL,
  `origin_country_code` INT(11) DEFAULT NULL,
  `destination_zip_code` VARCHAR(14) DEFAULT NULL,
  `destination_country_code` INT(11) DEFAULT NULL,
  `customer_reference_number` VARCHAR(17) DEFAULT NULL,
  `number_of_packages` INT(11) DEFAULT NULL,
  `net_amount` DECIMAL(14,2) DEFAULT NULL,
  `tax_amount` DECIMAL(14,2) DEFAULT NULL,
  `discount_amount` DECIMAL(14,2) DEFAULT NULL,
  `service_description` VARCHAR(24) DEFAULT NULL,
  `unit_of_measure` VARCHAR(3) DEFAULT NULL,
  `weight` DECIMAL(9,2) DEFAULT NULL,
  `origin_sender_name` VARCHAR(26) DEFAULT NULL,
  `origin_address` VARCHAR(20) DEFAULT NULL,
  `destination_receiver_name` VARCHAR(26) DEFAULT NULL,
  `reimbursement_attribute` CHAR(1) DEFAULT NULL,
  `origin_state_code` VARCHAR(4) DEFAULT NULL,
  `destination_state_code` VARCHAR(4) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t25_headquarter_relationship` */

DROP TABLE IF EXISTS `t25_headquarter_relationship`;

CREATE TABLE `t25_headquarter_relationship` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `processor_id` INT(11) DEFAULT NULL,
  `issuer_id` INT(11) DEFAULT NULL,
  `company_id` INT(11) DEFAULT NULL,
  `hq_id` INT(11) DEFAULT NULL,
  `hq_name` VARCHAR(80) DEFAULT NULL,
  `reporting_cycle_code` INT(11) DEFAULT NULL,
  `lead_bank_flag` TINYINT(4) DEFAULT NULL,
  `start_date` DATE DEFAULT NULL,
  `processing_date` DATE DEFAULT NULL,
  `close_date` DATE DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t26_lodging_detail` */

DROP TABLE IF EXISTS `t26_lodging_detail`;

CREATE TABLE `t26_lodging_detail` (
  `load_tramsaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `date_of_charge` DATE DEFAULT NULL,
  `item_sequence_number` INT(11) DEFAULT NULL,
  `room_rate` DECIMAL(16,2) DEFAULT NULL,
  `discount_rate` DECIMAL(16,2) DEFAULT NULL,
  `food_charges` DECIMAL(16,2) DEFAULT NULL,
  `folio_cash_advances` DECIMAL(16,2) DEFAULT NULL,
  `valet_parking_charges` DECIMAL(16,2) DEFAULT NULL,
  `mini_bar_charges` DECIMAL(16,2) DEFAULT NULL,
  `laundry_charges` DECIMAL(16,2) DEFAULT NULL,
  `telephone_charges` DECIMAL(16,2) DEFAULT NULL,
  `gift_shop_purchases` DECIMAL(16,2) DEFAULT NULL,
  `movie_charges` DECIMAL(16,2) DEFAULT NULL,
  `business_center_charges` DECIMAL(16,2) DEFAULT NULL,
  `health_club_charges` DECIMAL(16,2) DEFAULT NULL,
  `room_tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `room_tax_amount_2` DECIMAL(16,2) DEFAULT NULL,
  `room_tax_amount_3` DECIMAL(16,2) DEFAULT NULL,
  `room_tax_amount_4` DECIMAL(16,2) DEFAULT NULL,
  `other_charge` DECIMAL(16,2) DEFAULT NULL,
  `description_of_charge` VARCHAR(20) DEFAULT NULL,
  `other_charge_code` VARCHAR(5) DEFAULT NULL,
  `message_id` VARCHAR(16) DEFAULT NULL,
  `purchase_id` VARCHAR(50) DEFAULT NULL,
  `processor_addendum_key` VARCHAR(52) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t27_car_rental_detail` */

DROP TABLE IF EXISTS `t27_car_rental_detail`;

CREATE TABLE `t27_car_rental_detail` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `item_sequence_number` INT(11) DEFAULT NULL,
  `daily_rental_rate` DECIMAL(16,2) DEFAULT NULL,
  `insurance_charges` DECIMAL(16,2) DEFAULT NULL,
  `auto_towing` DECIMAL(16,2) DEFAULT NULL,
  `extra_mileage_charges` DECIMAL(16,2) DEFAULT NULL,
  `telephone_charges` DECIMAL(16,2) DEFAULT NULL,
  `other_charge` DECIMAL(16,2) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t28_allocation` */

DROP TABLE IF EXISTS `t28_allocation`;

CREATE TABLE `t28_allocation` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `allocation_sequence_number` INT(11) DEFAULT NULL,
  `gl_sub_account_number` VARCHAR(76) DEFAULT NULL,
  `gl_sub_account_description` VARCHAR(50) DEFAULT NULL,
  `cost_center_code` VARCHAR(76) DEFAULT NULL,
  `cost_center_description` VARCHAR(50) DEFAULT NULL,
  `allocated_amount` DECIMAL(16,2) DEFAULT NULL,
  `allocated_percentage` TINYINT(4) DEFAULT NULL,
  `tax_1_amount` DECIMAL(16,2) DEFAULT NULL,
  `tax_2_amount` DECIMAL(16,2) DEFAULT NULL,
  `final_allocation_flag` TINYINT(4) DEFAULT NULL,
  `description` VARCHAR(100) DEFAULT NULL,
  `allocated_date` DATE DEFAULT NULL,
  `allocation_accounting_code` VARCHAR(150) DEFAULT NULL,
  `original_accounting_code` VARCHAR(150) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t29_allocation_descriptor` */

DROP TABLE IF EXISTS `t29_allocation_descriptor`;

CREATE TABLE `t29_allocation_descriptor` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `allocation_sequence_number` INT(11) DEFAULT NULL,
  `item_sequence_number` INT(11) DEFAULT NULL,
  `description` VARCHAR(100) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t30_relationship` */

DROP TABLE IF EXISTS `t30_relationship`;

CREATE TABLE `t30_relationship` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `object_type` TINYINT(4) DEFAULT NULL,
  `field_value` VARCHAR(40) DEFAULT NULL,
  `tree_id` VARCHAR(2) DEFAULT NULL,
  `parent_object_type` TINYINT(4) DEFAULT NULL,
  `parent_field_value` VARCHAR(40) DEFAULT NULL,
  `parent_tree_id` VARCHAR(2) DEFAULT NULL,
  `effective_date` DATE DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t31_phone` */

DROP TABLE IF EXISTS `t31_phone`;

CREATE TABLE `t31_phone` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `account_number` VARCHAR(19) DEFAULT NULL,
  `posting_date` DATE DEFAULT NULL,
  `transaction_reference_number` VARCHAR(24) DEFAULT NULL,
  `sequence_number` INT(11) DEFAULT NULL,
  `call_to_number` BIGINT(20) DEFAULT NULL,
  `call_to_city` VARCHAR(14) DEFAULT NULL,
  `call_to_state_code` VARCHAR(4) DEFAULT NULL,
  `call_to_country` INT(11) DEFAULT NULL,
  `call_from_number` BIGINT(20) DEFAULT NULL,
  `call_from_city` VARCHAR(14) DEFAULT NULL,
  `call_from_state_code` VARCHAR(4) DEFAULT NULL,
  `call_from_country` INT(11) DEFAULT NULL,
  `duration` TIME DEFAULT NULL,
  `connection_time` TIME DEFAULT NULL,
  `call_type` VARCHAR(2) DEFAULT NULL,
  `rate_period` VARCHAR(6) DEFAULT NULL,
  `discount_amount` DECIMAL(16,2) DEFAULT NULL,
  `tax_amount` DECIMAL(16,2) DEFAULT NULL,
  `optional_field_1` VARCHAR(26) DEFAULT NULL,
  `optional_field_2` VARCHAR(26) DEFAULT NULL,
  `optional_field_3` VARCHAR(26) DEFAULT NULL,
  `optional_field_4` VARCHAR(26) DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `t99_reference_data` */

DROP TABLE IF EXISTS `t99_reference_data`;

CREATE TABLE `t99_reference_data` (
  `load_transaction_code` TINYINT(4) NOT NULL,
  `reference_type` TINYINT(4) DEFAULT NULL,
  `key_field` VARCHAR(10) DEFAULT NULL,
  `description_1` VARCHAR(50) DEFAULT NULL,
  `description_2` VARCHAR(50) DEFAULT NULL,
  `description_3` VARCHAR(50) DEFAULT NULL,
  `description_4` VARCHAR(50) DEFAULT NULL,
  `description_5` VARCHAR(50) DEFAULT NULL,
  `description_6` VARCHAR(50) DEFAULT NULL,
  `description_7` VARCHAR(50) DEFAULT NULL,
  `description_8` VARCHAR(50) DEFAULT NULL,
  `description_9` VARCHAR(50) DEFAULT NULL,
  `description_10` VARCHAR(50) DEFAULT NULL,
  `description_11` VARCHAR(50) DEFAULT NULL,
  `description_12` VARCHAR(50) DEFAULT NULL,
  `description_13` VARCHAR(5) DEFAULT NULL,
  `description_14` VARCHAR(50) DEFAULT NULL,
  `description_15` VARCHAR(50) DEFAULT NULL,
  `inactive_flag` TINYINT(4) DEFAULT NULL,
  `effective_date` DATE DEFAULT NULL,
  `block_header_id` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
