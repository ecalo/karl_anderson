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
  `transaction_code` tinyint(4) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `processing_date` date DEFAULT NULL,
  `record_type_code` tinyint(4) DEFAULT NULL,
  `record_count` int(11) DEFAULT NULL,
  `total_amount` decimal(18,2) DEFAULT NULL,
  `load_file_format` varchar(10) DEFAULT NULL,
  `issuer_id` varchar(10) DEFAULT NULL,
  `processor_id` int(11) DEFAULT NULL,
  `visa_region_id` tinyint(4) DEFAULT NULL,
  `processor_platform_ref` varchar(10) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Table structure for table `staging` */

DROP TABLE IF EXISTS `staging`;

CREATE TABLE `staging` (
  `col1` varchar(8) DEFAULT NULL,
  `col2` varchar(20) DEFAULT NULL,
  `col3` varchar(80) DEFAULT NULL,
  `col4` varchar(80) DEFAULT NULL,
  `col5` varchar(80) DEFAULT NULL,
  `col6` varchar(80) DEFAULT NULL,
  `col7` varchar(76) DEFAULT NULL,
  `col8` varchar(100) DEFAULT NULL,
  `col9` varchar(76) DEFAULT NULL,
  `col10` varchar(50) DEFAULT NULL,
  `col11` varchar(50) DEFAULT NULL,
  `col12` varchar(50) DEFAULT NULL,
  `col13` varchar(50) DEFAULT NULL,
  `col14` varchar(50) DEFAULT NULL,
  `col15` varchar(52) DEFAULT NULL,
  `col16` varchar(100) DEFAULT NULL,
  `col17` varchar(76) DEFAULT NULL,
  `col18` varchar(150) DEFAULT NULL,
  `col19` varchar(150) DEFAULT NULL,
  `col20` varchar(50) DEFAULT NULL,
  `col21` varchar(50) DEFAULT NULL,
  `col22` varchar(26) DEFAULT NULL,
  `col23` varchar(26) DEFAULT NULL,
  `col24` varchar(140) DEFAULT NULL,
  `col25` varchar(56) DEFAULT NULL,
  `col26` varchar(56) DEFAULT NULL,
  `col27` varchar(52) DEFAULT NULL,
  `col28` varchar(50) DEFAULT NULL,
  `col29` varchar(76) DEFAULT NULL,
  `col30` varchar(26) DEFAULT NULL,
  `col31` varchar(26) DEFAULT NULL,
  `col32` varchar(50) DEFAULT NULL,
  `col33` varchar(76) DEFAULT NULL,
  `col34` varchar(26) DEFAULT NULL,
  `col35` varchar(26) DEFAULT NULL,
  `col36` varchar(50) DEFAULT NULL,
  `col37` varchar(26) DEFAULT NULL,
  `col38` varchar(19) DEFAULT NULL,
  `col39` varchar(52) DEFAULT NULL,
  `col40` varchar(50) DEFAULT NULL,
  `col41` varchar(50) DEFAULT NULL,
  `col42` varchar(18) DEFAULT NULL,
  `col43` varchar(50) DEFAULT NULL,
  `col44` varchar(26) DEFAULT NULL,
  `col45` varchar(26) DEFAULT NULL,
  `col46` varchar(26) DEFAULT NULL,
  `col47` varchar(26) DEFAULT NULL,
  `col48` varchar(14) DEFAULT NULL,
  `col49` varchar(52) DEFAULT NULL,
  `col50` varchar(26) DEFAULT NULL,
  `col51` varchar(26) DEFAULT NULL,
  `col52` varchar(26) DEFAULT NULL,
  `col53` varchar(26) DEFAULT NULL,
  `col54` varchar(20) DEFAULT NULL,
  `col55` varchar(20) DEFAULT NULL,
  `col56` varchar(20) DEFAULT NULL,
  `col57` varchar(20) DEFAULT NULL,
  `col58` varchar(20) DEFAULT NULL,
  `col59` varchar(26) DEFAULT NULL,
  `col60` varchar(26) DEFAULT NULL,
  `col61` varchar(26) DEFAULT NULL,
  `col62` varchar(26) DEFAULT NULL,
  `col63` varchar(20) DEFAULT NULL,
  `col64` varchar(20) DEFAULT NULL,
  `col65` varchar(8) DEFAULT NULL,
  `col66` varchar(8) DEFAULT NULL,
  `col67` varchar(8) DEFAULT NULL,
  `col68` varchar(10) DEFAULT NULL,
  `col69` varchar(256) DEFAULT NULL,
  `col70` varchar(256) DEFAULT NULL,
  `col71` varchar(256) DEFAULT NULL,
  `col72` varchar(256) DEFAULT NULL,
  `col73` varchar(40) DEFAULT NULL,
  `col74` varchar(30) DEFAULT NULL,
  `col75` varchar(30) DEFAULT NULL,
  `col76` varchar(30) DEFAULT NULL,
  `col77` varchar(30) DEFAULT NULL,
  `col78` varchar(30) DEFAULT NULL,
  `col79` varchar(30) DEFAULT NULL,
  `col80` varchar(8) DEFAULT NULL,
  `col81` varchar(8) DEFAULT NULL,
  `col82` varchar(8) DEFAULT NULL,
  `col83` varchar(8) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15385 DEFAULT CHARSET=utf8;

/*Table structure for table `t01_account_balance` */

DROP TABLE IF EXISTS `t01_account_balance`;

CREATE TABLE `t01_account_balance` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `previous_balance` decimal(18,2) DEFAULT NULL,
  `current_balance` decimal(18,2) DEFAULT NULL,
  `credit_limit` decimal(18,2) DEFAULT NULL,
  `current_amount_due` decimal(18,2) DEFAULT NULL,
  `past_due_count` int(11) DEFAULT NULL,
  `past_due_amount` decimal(18,2) DEFAULT NULL,
  `disputed_amount` decimal(18,2) DEFAULT NULL,
  `billing_currency_code` int(11) DEFAULT NULL,
  `amount_past_due_1` decimal(18,2) DEFAULT NULL,
  `amount_past_due_2` decimal(18,2) DEFAULT NULL,
  `amount_past_due_3` decimal(18,2) DEFAULT NULL,
  `amount_past_due_4` decimal(18,2) DEFAULT NULL,
  `amount_past_due_5` decimal(18,2) DEFAULT NULL,
  `amount_past_due_6` decimal(18,2) DEFAULT NULL,
  `amount_past_due_plus` decimal(18,2) DEFAULT NULL,
  `past_due_1_count` int(11) DEFAULT NULL,
  `past_due_2_count` int(11) DEFAULT NULL,
  `past_due_3_count` int(11) DEFAULT NULL,
  `past_due_4_count` int(11) DEFAULT NULL,
  `past_due_5_count` int(11) DEFAULT NULL,
  `past_due_6_count` int(11) DEFAULT NULL,
  `past_due_plus_count` int(11) DEFAULT NULL,
  `past_due_cycles_count` int(11) DEFAULT NULL,
  `last_payment_amount` decimal(18,2) DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `payment_due_date` date DEFAULT NULL,
  `high_balance` decimal(18,2) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t02_car_rental_summary` */

DROP TABLE IF EXISTS `t02_car_rental_summary`;

CREATE TABLE `t02_car_rental_summary` (
  `load_transaction_type` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `no_shadow_indicator` tinyint(4) DEFAULT NULL,
  `daily_rental_rate` decimal(18,2) DEFAULT NULL,
  `other_charges` decimal(18,2) DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `weekly_rental_rate` decimal(18,2) DEFAULT NULL,
  `insurance_charges` decimal(18,2) DEFAULT NULL,
  `fuel_charges` decimal(18,2) DEFAULT NULL,
  `class_code` varchar(2) DEFAULT NULL,
  `one_way_drop_off_charges` decimal(18,2) DEFAULT NULL,
  `renter_name` varchar(40) DEFAULT NULL,
  `auto_towing` decimal(18,2) DEFAULT NULL,
  `regular_mileage_charges` decimal(18,2) DEFAULT NULL,
  `extra_mileage_charges` decimal(18,2) DEFAULT NULL,
  `late_return_hourly_rate` decimal(18,2) DEFAULT NULL,
  `return_location` varchar(26) DEFAULT NULL,
  `total_tax` decimal(18,2) DEFAULT NULL,
  `telephone_charges` decimal(18,2) DEFAULT NULL,
  `corporate_id` varchar(16) DEFAULT NULL,
  `extra_charge_code` varchar(6) DEFAULT NULL,
  `days_rented` tinyint(4) DEFAULT NULL,
  `message_id` varbinary(16) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(18,6) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t03_card_account` */

DROP TABLE IF EXISTS `t03_card_account`;

CREATE TABLE `t03_card_account` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `card_holder_id` varchar(20) DEFAULT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `hierarchy_node` varchar(40) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `account_open_date` date DEFAULT NULL,
  `account_close_date` date DEFAULT NULL,
  `card_expiry_date` date DEFAULT NULL,
  `card_type` tinyint(4) DEFAULT NULL,
  `spending_limit` decimal(18,2) DEFAULT NULL,
  `statement_type` tinyint(4) DEFAULT '3',
  `last_revision_date` date DEFAULT NULL,
  `trnsaction_spending_limit` decimal(18,2) DEFAULT NULL,
  `corporation_payment_indicator` tinyint(4) DEFAULT NULL,
  `billing_account_number` varchar(20) DEFAULT NULL,
  `cost_center` varchar(50) DEFAULT NULL,
  `gl_sub_account` varchar(76) DEFAULT NULL,
  `transaction_daily_limit` int(11) DEFAULT NULL,
  `trnsaction_cycle_limit` int(11) DEFAULT NULL,
  `cash_limit_amount` decimal(18,2) DEFAULT NULL,
  `status_code` tinyint(4) DEFAULT NULL,
  `reason_status_code` tinyint(4) DEFAULT NULL,
  `status_date` date DEFAULT NULL,
  `pre_funded_indicator` tinyint(4) DEFAULT NULL,
  `city_pair_program_indicator` tinyint(4) DEFAULT NULL,
  `task_order_number` varchar(26) DEFAULT NULL,
  `fleet_service_indicator` tinyint(4) DEFAULT NULL,
  `credit_rating` char(2) DEFAULT NULL,
  `credit_rating_date` date DEFAULT NULL,
  `annual_fee_flag` tinyint(4) DEFAULT NULL,
  `annual_fee_month` tinyint(4) DEFAULT NULL,
  `card_receipt_verification_flag` tinyint(4) DEFAULT NULL,
  `check_indicator` tinyint(4) DEFAULT NULL,
  `account_type_flag` tinyint(4) DEFAULT NULL,
  `lost_stolen_date` date DEFAULT NULL,
  `charge_off_date` date DEFAULT NULL,
  `charge_off_amount` decimal(18,2) DEFAULT NULL,
  `trnasfer_account_number` varchar(19) DEFAULT NULL,
  `calling_card_phone_type` char(2) DEFAULT NULL,
  `emboss_line_1` varchar(50) DEFAULT NULL,
  `emboss_line_2` varchar(50) DEFAULT NULL,
  `last_credit_limit_change_date` date DEFAULT NULL,
  `last_maintenance_date_nar` date DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t04_cardholder` */

DROP TABLE IF EXISTS `t04_cardholder`;

CREATE TABLE `t04_cardholder` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `card_holder_id` varchar(20) DEFAULT NULL,
  `hierarchy_node` varchar(40) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `address_line_1` varchar(40) DEFAULT NULL,
  `address_line_2` varchar(40) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state_code` varchar(4) DEFAULT NULL,
  `iso_country_code` int(11) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `address_line_3` varchar(40) DEFAULT NULL,
  `mail_stop` varchar(14) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `fax_number` varchar(14) DEFAULT NULL,
  `ssn_other_id` varchar(20) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `email_address` varchar(128) DEFAULT NULL,
  `authorized_user_1` varchar(26) DEFAULT NULL,
  `authorized_user_2` varchar(26) DEFAULT NULL,
  `authorized_user_3` varchar(26) DEFAULT NULL,
  `employee_id` varchar(10) DEFAULT NULL,
  `home_phone` varchar(14) DEFAULT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `visa_commerce_buyer_id` varchar(19) DEFAULT NULL,
  `vehicle_id` varchar(20) DEFAULT NULL,
  `misc_field_1` varchar(16) DEFAULT NULL,
  `misc_field_1_desc` varchar(26) DEFAULT NULL,
  `misc_field_2` varchar(16) DEFAULT NULL,
  `misc_field_2_desc` varchar(26) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t05_card_transaction` */

DROP TABLE IF EXISTS `t05_card_transaction`;

CREATE TABLE `t05_card_transaction` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_ref_number` varchar(24) DEFAULT NULL,
  `sequence_number` bigint(20) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `acquiring_bin` int(11) DEFAULT NULL,
  `card_acceptor_id` varchar(26) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_city` varchar(14) DEFAULT NULL,
  `supplier_state_code` varchar(4) DEFAULT NULL,
  `supplier_iso_country_code` int(11) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `source_amount` decimal(18,2) DEFAULT NULL,
  `billing_amount` decimal(18,2) DEFAULT NULL,
  `source_currency_code` int(11) DEFAULT NULL,
  `merchant_category_code` int(11) DEFAULT NULL,
  `tansaction_type_code` char(2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `billing_currency_code` int(11) DEFAULT NULL,
  `tax_amount` decimal(18,2) DEFAULT NULL,
  `dispute_amount` decimal(18,2) DEFAULT NULL,
  `dispute_reason_code` tinyint(4) DEFAULT NULL,
  `dispute_date` date DEFAULT NULL,
  `commodity_code` varchar(4) DEFAULT NULL,
  `supplier_vat_number` varchar(20) DEFAULT NULL,
  `supplier_order_number` varchar(25) DEFAULT NULL,
  `customer_vat_number` varchar(14) DEFAULT NULL,
  `vat_amount` decimal(18,2) DEFAULT NULL,
  `tax2_amount` decimal(18,2) DEFAULT NULL,
  `purchase_id_format` varchar(2) DEFAULT NULL,
  `customer_code_cri` varchar(50) DEFAULT NULL,
  `purchase_id` varchar(76) DEFAULT NULL,
  `transaction_time` time DEFAULT NULL,
  `tax_amount_incl_code` tinyint(4) DEFAULT NULL,
  `tax2_amount_incl_code` tinyint(4) DEFAULT NULL,
  `order_type_code` tinyint(4) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `mps_id` bigint(20) DEFAULT NULL,
  `usage_code` tinyint(4) DEFAULT NULL,
  `enriched_transaction_flag` varchar(2) DEFAULT NULL,
  `billing_account_number` varchar(19) DEFAULT NULL,
  `dda_number` bigint(20) DEFAULT NULL,
  `dda_savings_number` bigint(20) DEFAULT NULL,
  `dispute_status_code` varchar(2) DEFAULT NULL,
  `matched_indicator` tinyint(4) DEFAULT NULL,
  `routing_number` int(11) DEFAULT NULL,
  `authorization_number` varchar(6) DEFAULT NULL,
  `cardholder_transaction_approval` varchar(2) DEFAULT NULL,
  `extract_id` bigint(20) DEFAULT NULL,
  `memo_post_flag` tinyint(4) DEFAULT NULL,
  `statement_date` date DEFAULT NULL,
  `user_data_1` varchar(20) DEFAULT NULL,
  `user_data_1_desc` varchar(20) DEFAULT NULL,
  `user_data_2` varchar(20) DEFAULT NULL,
  `user_data_2_desc` varchar(20) DEFAULT NULL,
  `user_data_3` varchar(20) DEFAULT NULL,
  `user_data_3_desc` varchar(20) DEFAULT NULL,
  `user_data_4` varchar(20) DEFAULT NULL,
  `user_data_4_desc` varchar(20) DEFAULT NULL,
  `user_data_5` varchar(20) DEFAULT NULL,
  `user_data_5_desc` varchar(20) DEFAULT NULL,
  `visa_commerce_batch_id` varchar(20) DEFAULT NULL,
  `visa_commerce_payment_instr_date` date DEFAULT NULL,
  `line_item_matched_indicator` tinyint(4) DEFAULT NULL,
  `issuer_defined_usage_code` varchar(2) DEFAULT NULL,
  `source` varchar(10) DEFAULT NULL,
  `optional_field_1` varchar(256) DEFAULT NULL,
  `optional_field_2` varchar(256) DEFAULT NULL,
  `optional_field_3` varchar(256) DEFAULT NULL,
  `optional_field_4` varchar(256) DEFAULT NULL,
  `reserved_field_1` varchar(30) DEFAULT NULL,
  `reserved_field_2` varchar(30) DEFAULT NULL,
  `reserved_field_3` varchar(30) DEFAULT NULL,
  `reserved_field_4` varchar(30) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t06_company` */

DROP TABLE IF EXISTS `t06_company`;

CREATE TABLE `t06_company` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_name` varchar(80) DEFAULT NULL,
  `address_line_1` varchar(80) DEFAULT NULL,
  `address_line_2` varchar(80) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state_code` varchar(4) DEFAULT NULL,
  `iso_country_code` int(11) DEFAULT NULL,
  `postal_code` varchar(14) DEFAULT NULL,
  `fiscal_year_date` date DEFAULT NULL,
  `spending_limit` decimal(18,2) DEFAULT NULL,
  `card_type` tinyint(4) DEFAULT NULL,
  `issuer_name` varchar(40) DEFAULT NULL,
  `organization_hmi` tinyint(4) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `address_line_3` varchar(80) DEFAULT NULL,
  `federal_org_indicator` tinyint(4) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t07_line_item_detail` */

DROP TABLE IF EXISTS `t07_line_item_detail`;

CREATE TABLE `t07_line_item_detail` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_ref_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `item_sequence_number` int(11) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `item_commodity_code` varchar(16) DEFAULT NULL,
  `item_descriptor` varchar(26) DEFAULT NULL,
  `quantity` decimal(16,4) DEFAULT NULL,
  `unti_cost` decimal(18,2) DEFAULT NULL,
  `unit_measure` varchar(12) DEFAULT NULL,
  `tax_amount` decimal(18,2) DEFAULT NULL,
  `type_supply` int(11) DEFAULT NULL,
  `last_item_indicator` tinyint(4) DEFAULT NULL,
  `tax_rate` decimal(9,4) DEFAULT NULL,
  `item_discount_amount` decimal(16,2) DEFAULT NULL,
  `item_total_amount` decimal(18,2) DEFAULT NULL,
  `item_product_code` varchar(12) DEFAULT NULL,
  `service_id` varchar(6) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(18,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` int(11) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `li_sales_tax_flag` tinyint(4) DEFAULT NULL,
  `item_level_usage_code` varchar(2) DEFAULT NULL,
  `line_item_source` varchar(10) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t08_line_item_summary` */

DROP TABLE IF EXISTS `t08_line_item_summary`;

CREATE TABLE `t08_line_item_summary` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `discount_amount` decimal(16,2) DEFAULT NULL,
  `freight_amount` decimal(16,2) DEFAULT NULL,
  `duty_amount` decimal(16,2) DEFAULT NULL,
  `destination_postal_code` varchar(14) DEFAULT NULL,
  `source_postal_code` varchar(14) DEFAULT NULL,
  `destination_country_code` int(11) DEFAULT NULL,
  `vat_reference_number` varchar(16) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `freight_tax_amount` decimal(16,2) DEFAULT NULL,
  `freight_tax_rate` decimal(9,4) DEFAULT NULL,
  `service_id` varchar(6) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(18,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `source_country_code` int(11) DEFAULT NULL,
  `destination_state` varchar(4) DEFAULT NULL,
  `source_state` varchar(4) DEFAULT NULL,
  `source` varchar(10) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t09_lodging_summary` */

DROP TABLE IF EXISTS `t09_lodging_summary`;

CREATE TABLE `t09_lodging_summary` (
  `load_transaction_code` tinyint(4) DEFAULT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `no_show_indicator` tinyint(4) DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `daily_room_rate` decimal(16,2) DEFAULT NULL,
  `total_other_charges` decimal(16,2) DEFAULT NULL,
  `total_tax_amount` decimal(16,2) DEFAULT NULL,
  `total_food_charges` decimal(16,2) DEFAULT NULL,
  `total_prepaid_expenses` decimal(16,2) DEFAULT NULL,
  `total_folio_cash_advances` decimal(18,2) DEFAULT NULL,
  `total_valet_parking_charges` decimal(16,2) DEFAULT NULL,
  `total_mini_bar_charges` decimal(18,2) DEFAULT NULL,
  `total_laundry_charges` decimal(16,2) DEFAULT NULL,
  `total_telephone_charges` decimal(18,2) DEFAULT NULL,
  `total_gift_shop_purchases` decimal(18,2) DEFAULT NULL,
  `total_movie_charges` decimal(16,2) DEFAULT NULL,
  `total_business_center_charges` decimal(18,2) DEFAULT NULL,
  `health_club_charges` decimal(16,2) DEFAULT NULL,
  `extra_charge_code` varchar(6) DEFAULT NULL,
  `total_room_tax_amount` decimal(16,2) DEFAULT NULL,
  `lodging_nights` tinyint(4) DEFAULT NULL,
  `total_non_room_charges` decimal(16,2) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(18,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t10_organization` */

DROP TABLE IF EXISTS `t10_organization`;

CREATE TABLE `t10_organization` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `hierarchy_node` varchar(40) DEFAULT NULL,
  `parent_hierarchy_node` varchar(40) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `manager_last_name` varchar(20) DEFAULT NULL,
  `manager_first_name` varchar(20) DEFAULT NULL,
  `manager_title` varchar(40) DEFAULT NULL,
  `manager_training_date` date DEFAULT NULL,
  `manager_phone_number` varchar(14) DEFAULT NULL,
  `task_order_number` varchar(26) DEFAULT NULL,
  `contact_first_name` varchar(20) DEFAULT NULL,
  `contact_last_name` varchar(20) DEFAULT NULL,
  `contact_address_line_1` varchar(40) DEFAULT NULL,
  `contact_address_line_2` varchar(40) DEFAULT NULL,
  `contact_address_line_3` varchar(40) DEFAULT NULL,
  `contact_city` varchar(20) DEFAULT NULL,
  `contact_state_code` varchar(4) DEFAULT NULL,
  `contact_country_code` int(11) DEFAULT NULL,
  `contact_postal_code` varchar(14) DEFAULT NULL,
  `contact_phone_number` varchar(16) DEFAULT NULL,
  `contact_fax_number` varchar(16) DEFAULT NULL,
  `contact_email_address` varchar(140) DEFAULT NULL,
  `second_hierarchy_node_representation` varchar(56) DEFAULT NULL,
  `third_hierarchy_node_representation` varchar(56) DEFAULT NULL,
  `tree_id` varchar(2) DEFAULT NULL,
  `cost_center` varchar(50) DEFAULT NULL,
  `gl_sub_account` varchar(76) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t11_period` */

DROP TABLE IF EXISTS `t11_period`;

CREATE TABLE `t11_period` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `perio` int(11) DEFAULT NULL,
  `card_type` tinyint(4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `period_complete_indicator` tinyint(4) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `t14_passenger_itinerary` */

DROP TABLE IF EXISTS `t14_passenger_itinerary`;

CREATE TABLE `t14_passenger_itinerary` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `travel_agency_code` varchar(8) DEFAULT NULL,
  `travel_agency_name` varchar(26) DEFAULT NULL,
  `ticket_indicator` tinyint(4) DEFAULT NULL,
  `ticket_number` varchar(14) DEFAULT NULL,
  `passenger_name` varchar(20) DEFAULT NULL,
  `exchange_ticket_number` varchar(14) DEFAULT NULL,
  `exchange_ticket_Amount` decimal(16,2) DEFAULT NULL,
  `internet_indicator` tinyint(4) DEFAULT NULL,
  `total_fare_amount` decimal(16,2) DEFAULT NULL,
  `total_fee_amount` decimal(16,2) DEFAULT NULL,
  `total_tax_amount` decimal(16,2) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `endorsement` varchar(20) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(18,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `passenger_specific_data` varchar(50) DEFAULT NULL,
  `ticket_issue_date` date DEFAULT NULL,
  `number_of_legs` tinyint(4) DEFAULT NULL,
  `e_ticket_indicator` tinyint(4) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `travel_obligation_number` varchar(13) DEFAULT NULL,
  `tcn_passenger_name` varchar(50) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t15_leg_specific_information` */

DROP TABLE IF EXISTS `t15_leg_specific_information`;

CREATE TABLE `t15_leg_specific_information` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `leg_number` tinyint(4) DEFAULT NULL,
  `destination_code` varchar(4) DEFAULT NULL,
  `carrier_code` varchar(4) DEFAULT NULL,
  `service_class` varchar(2) DEFAULT NULL,
  `fare_basis` varchar(8) DEFAULT NULL,
  `date_of_travel` date DEFAULT NULL,
  `stopover_code` tinyint(4) DEFAULT NULL,
  `coupon_number` tinyint(4) DEFAULT NULL,
  `carrier_reference_number` varchar(6) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `origination_code` varchar(4) DEFAULT NULL,
  `conjunction_ticket_number` varchar(14) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(18,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `domestic_international_indicator` tinyint(4) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_tax` decimal(16,2) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t16_supplier` */

DROP TABLE IF EXISTS `t16_supplier`;

CREATE TABLE `t16_supplier` (
  `load_transaction_code` tinyint(4) DEFAULT NULL,
  `acquirer_bin` int(11) DEFAULT NULL,
  `supplier_name` varchar(30) DEFAULT NULL,
  `supplier_city` varchar(14) DEFAULT NULL,
  `supplier_state_code` varchar(4) DEFAULT NULL,
  `supplier_country_code` int(11) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_address` varchar(30) DEFAULT NULL,
  `mps_id` bigint(20) DEFAULT NULL,
  `business_legal_name` varchar(30) DEFAULT NULL,
  `alternate_supplier_dba_name` varchar(30) DEFAULT NULL,
  `mailing_address` varchar(30) DEFAULT NULL,
  `dun_and_bradstreet_number` int(11) DEFAULT NULL,
  `incorporation_status_code` tinyint(4) DEFAULT NULL,
  `minority_owned_status_code` varchar(2) DEFAULT NULL,
  `tax_id_number` int(11) DEFAULT NULL,
  `primary_sic_code` varchar(4) DEFAULT NULL,
  `secondary_sic_code` varchar(4) DEFAULT NULL,
  `supplier_phone_number` varchar(15) DEFAULT NULL,
  `sole_prop_owner_first_name` varchar(25) DEFAULT NULL,
  `sole_prop_owner_mi` varchar(2) DEFAULT NULL,
  `sole_prop_owner_last_name` varchar(25) DEFAULT NULL,
  `women_owned_indicator` char(1) DEFAULT NULL,
  `sales_volumne` int(11) DEFAULT NULL,
  `employee_count` int(11) DEFAULT NULL,
  `issuer_bin` int(11) DEFAULT NULL,
  `tin_type_code` tinyint(4) DEFAULT NULL,
  `supplier_email_address` varchar(40) DEFAULT NULL,
  `supplier_fax_number` varchar(15) DEFAULT NULL,
  `supplier_reserved_phone_number` varchar(15) DEFAULT NULL,
  `level3_capture_indicator_code` char(1) DEFAULT NULL,
  `level2_capture_indicator_code` char(1) DEFAULT NULL,
  `parent_visa_supplier_id` bigint(20) DEFAULT NULL,
  `alternate_supplier_city` varchar(20) DEFAULT NULL,
  `alternate_supplier_state_code` varchar(3) DEFAULT NULL,
  `alternate_supplier_postal_code` varchar(14) DEFAULT NULL,
  `supplier_out_of_business_date` date DEFAULT NULL,
  `supplier_ownership_change_date` date DEFAULT NULL,
  `8a_classification_indicator` char(1) DEFAULT NULL,
  `8a_expiration_date` date DEFAULT NULL,
  `sba_participant_indicator` char(1) DEFAULT NULL,
  `disabled_veteran_indicator` char(1) DEFAULT NULL,
  `veteran_indicator` char(1) DEFAULT NULL,
  `vietnam_era_veteran_indicator` char(1) DEFAULT NULL,
  `supplier_information_refusal_indicator` char(1) DEFAULT NULL,
  `incorporation_status_change_date` date DEFAULT NULL,
  `small_disadvantaged_business_indicator` char(1) DEFAULT NULL,
  `mailing_city` varchar(20) DEFAULT NULL,
  `mailing_state` varchar(4) DEFAULT NULL,
  `mailing_country` int(11) DEFAULT NULL,
  `alternate_supplier_country` int(11) DEFAULT NULL,
  `hub_zone_indicator` char(1) DEFAULT NULL,
  `franchise_code` char(1) DEFAULT NULL,
  `primary_naics_code` int(11) DEFAULT NULL,
  `secondary_naics_code` int(11) DEFAULT NULL,
  `visa_commerce_seller_id` varchar(19) DEFAULT NULL,
  `reserved_for_future_use` varchar(12) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `austin_tetra_number` bigint(20) DEFAULT NULL,
  `non_profit_entity` char(1) DEFAULT NULL,
  `woman_owned_small_business` char(1) DEFAULT NULL,
  `veteran_owned_small_business` char(1) DEFAULT NULL,
  `service_disabled_vet_owned_small_business` char(1) DEFAULT NULL,
  `dot_disadvantaged_business_enterprise` char(1) DEFAULT NULL,
  `disabled` char(1) DEFAULT NULL,
  `historically_black_college_univ_minority_inst` char(1) DEFAULT NULL,
  `merchant_type` char(1) DEFAULT NULL,
  `patriot_act_excluded_party_list_indicator` char(1) DEFAULT NULL,
  `taxpayer_name` varchar(40) DEFAULT NULL,
  `tin_match_indicator` char(1) DEFAULT NULL,
  `reserved_field_1` varchar(30) DEFAULT NULL,
  `reserved_field_2` varchar(30) DEFAULT NULL,
  `reserved_field_3` varchar(30) DEFAULT NULL,
  `reserved_field_4` varchar(30) DEFAULT NULL,
  `reserved_field_5` varchar(30) DEFAULT NULL,
  `level_3_tier_1_indicator` char(1) DEFAULT NULL,
  `level_3_tier_2_indicator` char(1) DEFAULT NULL,
  `level_3_tier_3_indicator` char(1) DEFAULT NULL,
  `level_3_tier_4_indicator` char(1) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t17_fleet_service` */

DROP TABLE IF EXISTS `t17_fleet_service`;

CREATE TABLE `t17_fleet_service` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `purchase_type` tinyint(4) DEFAULT NULL,
  `fuel_type` varchar(2) DEFAULT NULL,
  `fuel_unit_of_measure_code` char(1) DEFAULT NULL,
  `fuel_quantity` decimal(16,4) DEFAULT NULL,
  `fuel_unit_cost` decimal(16,4) DEFAULT NULL,
  `fuel_gross_amount` decimal(16,4) DEFAULT NULL,
  `fuel_net_amount` decimal(16,4) DEFAULT NULL,
  `non_fuel_gross_amount` decimal(16,4) DEFAULT NULL,
  `non_fuel_net_amount` decimal(16,4) DEFAULT NULL,
  `odometer_reading` varchar(8) DEFAULT NULL,
  `vat_tax_rate` decimal(9,4) DEFAULT NULL,
  `fuel_misc_tax_amount` decimal(16,4) DEFAULT NULL,
  `non_fuel_misc_tax_amt` decimal(16,4) DEFAULT NULL,
  `service_type` char(1) DEFAULT NULL,
  `fuel_misc_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `non_fuel_misc_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `non_fuel_fed_excise_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `non_fuel_fed_excise_tax_amount` decimal(16,2) DEFAULT NULL,
  `fuel_fed_excise_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `fuel_fed_excise_tax_amount` decimal(16,2) DEFAULT NULL,
  `state_motor_fuel_tax_exempt_indicator` tinyint(4) DEFAULT NULL,
  `state_motor_fuel_tax_amount` decimal(16,2) DEFAULT NULL,
  `county_fuel_sales_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `county_fuel_sales_tax_amount` decimal(16,2) DEFAULT NULL,
  `non_fuel_state_local_sales_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `non_fuel_state_local_sales_tax_amount` decimal(16,2) DEFAULT NULL,
  `county_motor_fuel_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `county_motor_fuel_tax_amount` decimal(16,2) DEFAULT NULL,
  `city_fuel_sales_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `city_fuel_sales_tax_amount` decimal(16,2) DEFAULT NULL,
  `city_motor_fuel_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `city_motor_fuel_tax_amount` decimal(16,2) DEFAULT NULL,
  `secondary_state_fuel_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `secondary_state_fuel_tax_amount` decimal(16,2) DEFAULT NULL,
  `federal_sales_tax_exemp_indicator` tinyint(4) DEFAULT NULL,
  `federal_sales_tax_amount` decimal(16,2) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(16,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t18_fleet_product` */

DROP TABLE IF EXISTS `t18_fleet_product`;

CREATE TABLE `t18_fleet_product` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `product_sequence_number` tinyint(4) DEFAULT NULL,
  `product_code` varchar(2) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `source_amount` decimal(16,2) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `merchant_category_code` tinyint(4) DEFAULT NULL,
  `supplier_name` varchar(26) DEFAULT NULL,
  `supplier_postal_code` varchar(14) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t20_temporary_services` */

DROP TABLE IF EXISTS `t20_temporary_services`;

CREATE TABLE `t20_temporary_services` (
  `load_transaction_code` tinyint(4) DEFAULT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` int(11) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `item_sequence_number` int(11) DEFAULT NULL,
  `message_id` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `account_code` varchar(18) DEFAULT NULL,
  `description` varchar(26) DEFAULT NULL,
  `employee_name` varchar(26) DEFAULT NULL,
  `employee_ssn` int(11) DEFAULT NULL,
  `rate_indicator` int(11) DEFAULT NULL,
  `rate` decimal(14,2) DEFAULT NULL,
  `regular_hours_worked` decimal(7,2) DEFAULT NULL,
  `overtime_rate` decimal(14,2) DEFAULT NULL,
  `overtime_hours_worked` decimal(7,2) DEFAULT NULL,
  `job_code` varchar(12) DEFAULT NULL,
  `misc_expense_amount` decimal(14,2) DEFAULT NULL,
  `misc_expense_indicator` varchar(6) DEFAULT NULL,
  `requester_name` varchar(16) DEFAULT NULL,
  `subtotal_amount` decimal(14,2) DEFAULT NULL,
  `sales_tax_amount` decimal(14,2) DEFAULT NULL,
  `discount_amount` decimal(14,2) DEFAULT NULL,
  `supervisor` varchar(26) DEFAULT NULL,
  `time_sheet_number` int(11) DEFAULT NULL,
  `commodity_code` varchar(12) DEFAULT NULL,
  `reimbursement_attribute` varchar(2) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t21_shipping_services` */

DROP TABLE IF EXISTS `t21_shipping_services`;

CREATE TABLE `t21_shipping_services` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `item_sequence_number` int(11) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `shipping_name` varchar(26) DEFAULT NULL,
  `tracking_number` varchar(22) DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `origin_zip_code` varchar(14) DEFAULT NULL,
  `origin_country_code` int(11) DEFAULT NULL,
  `destination_zip_code` varchar(14) DEFAULT NULL,
  `destination_country_code` int(11) DEFAULT NULL,
  `customer_reference_number` varchar(17) DEFAULT NULL,
  `number_of_packages` int(11) DEFAULT NULL,
  `net_amount` decimal(14,2) DEFAULT NULL,
  `tax_amount` decimal(14,2) DEFAULT NULL,
  `discount_amount` decimal(14,2) DEFAULT NULL,
  `service_description` varchar(24) DEFAULT NULL,
  `unit_of_measure` varchar(3) DEFAULT NULL,
  `weight` decimal(9,2) DEFAULT NULL,
  `origin_sender_name` varchar(26) DEFAULT NULL,
  `origin_address` varchar(20) DEFAULT NULL,
  `destination_receiver_name` varchar(26) DEFAULT NULL,
  `reimbursement_attribute` char(1) DEFAULT NULL,
  `origin_state_code` varchar(4) DEFAULT NULL,
  `destination_state_code` varchar(4) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t25_headquarter_relationship` */

DROP TABLE IF EXISTS `t25_headquarter_relationship`;

CREATE TABLE `t25_headquarter_relationship` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `processor_id` int(11) DEFAULT NULL,
  `issuer_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `hq_id` int(11) DEFAULT NULL,
  `hq_name` varchar(80) DEFAULT NULL,
  `reporting_cycle_code` int(11) DEFAULT NULL,
  `lead_bank_flag` tinyint(4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `processing_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t26_lodging_detail` */

DROP TABLE IF EXISTS `t26_lodging_detail`;

CREATE TABLE `t26_lodging_detail` (
  `load_tramsaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `date_of_charge` date DEFAULT NULL,
  `item_sequence_number` int(11) DEFAULT NULL,
  `room_rate` decimal(16,2) DEFAULT NULL,
  `discount_rate` decimal(16,2) DEFAULT NULL,
  `food_charges` decimal(16,2) DEFAULT NULL,
  `folio_cash_advances` decimal(16,2) DEFAULT NULL,
  `valet_parking_charges` decimal(16,2) DEFAULT NULL,
  `mini_bar_charges` decimal(16,2) DEFAULT NULL,
  `laundry_charges` decimal(16,2) DEFAULT NULL,
  `telephone_charges` decimal(16,2) DEFAULT NULL,
  `gift_shop_purchases` decimal(16,2) DEFAULT NULL,
  `movie_charges` decimal(16,2) DEFAULT NULL,
  `business_center_charges` decimal(16,2) DEFAULT NULL,
  `health_club_charges` decimal(16,2) DEFAULT NULL,
  `room_tax_amount` decimal(16,2) DEFAULT NULL,
  `room_tax_amount_2` decimal(16,2) DEFAULT NULL,
  `room_tax_amount_3` decimal(16,2) DEFAULT NULL,
  `room_tax_amount_4` decimal(16,2) DEFAULT NULL,
  `other_charge` decimal(16,2) DEFAULT NULL,
  `description_of_charge` varchar(20) DEFAULT NULL,
  `other_charge_code` varchar(5) DEFAULT NULL,
  `message_id` varchar(16) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `processor_addendum_key` varchar(52) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t27_car_rental_detail` */

DROP TABLE IF EXISTS `t27_car_rental_detail`;

CREATE TABLE `t27_car_rental_detail` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `item_sequence_number` int(11) DEFAULT NULL,
  `daily_rental_rate` decimal(16,2) DEFAULT NULL,
  `insurance_charges` decimal(16,2) DEFAULT NULL,
  `auto_towing` decimal(16,2) DEFAULT NULL,
  `extra_mileage_charges` decimal(16,2) DEFAULT NULL,
  `telephone_charges` decimal(16,2) DEFAULT NULL,
  `other_charge` decimal(16,2) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t28_allocation` */

DROP TABLE IF EXISTS `t28_allocation`;

CREATE TABLE `t28_allocation` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `allocation_sequence_number` int(11) DEFAULT NULL,
  `gl_sub_account_number` varchar(76) DEFAULT NULL,
  `gl_sub_account_description` varchar(50) DEFAULT NULL,
  `cost_center_code` varchar(76) DEFAULT NULL,
  `cost_center_description` varchar(50) DEFAULT NULL,
  `allocated_amount` decimal(16,2) DEFAULT NULL,
  `allocated_percentage` tinyint(4) DEFAULT NULL,
  `tax_1_amount` decimal(16,2) DEFAULT NULL,
  `tax_2_amount` decimal(16,2) DEFAULT NULL,
  `final_allocation_flag` tinyint(4) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `allocated_date` date DEFAULT NULL,
  `allocation_accounting_code` varchar(150) DEFAULT NULL,
  `original_accounting_code` varchar(150) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t29_allocation_descriptor` */

DROP TABLE IF EXISTS `t29_allocation_descriptor`;

CREATE TABLE `t29_allocation_descriptor` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `allocation_sequence_number` int(11) DEFAULT NULL,
  `item_sequence_number` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t30_relationship` */

DROP TABLE IF EXISTS `t30_relationship`;

CREATE TABLE `t30_relationship` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `object_type` tinyint(4) DEFAULT NULL,
  `field_value` varchar(40) DEFAULT NULL,
  `tree_id` varchar(2) DEFAULT NULL,
  `parent_object_type` tinyint(4) DEFAULT NULL,
  `parent_field_value` varchar(40) DEFAULT NULL,
  `parent_tree_id` varchar(2) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t31_phone` */

DROP TABLE IF EXISTS `t31_phone`;

CREATE TABLE `t31_phone` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `account_number` varchar(19) DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `transaction_reference_number` varchar(24) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `call_to_number` bigint(20) DEFAULT NULL,
  `call_to_city` varchar(14) DEFAULT NULL,
  `call_to_state_code` varchar(4) DEFAULT NULL,
  `call_to_country` int(11) DEFAULT NULL,
  `call_from_number` bigint(20) DEFAULT NULL,
  `call_from_city` varchar(14) DEFAULT NULL,
  `call_from_state_code` varchar(4) DEFAULT NULL,
  `call_from_country` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `connection_time` int(11) DEFAULT NULL,
  `call_type` varchar(2) DEFAULT NULL,
  `rate_period` varchar(6) DEFAULT NULL,
  `discount_amount` decimal(16,2) DEFAULT NULL,
  `tax_amount` decimal(16,2) DEFAULT NULL,
  `optional_field_1` varchar(26) DEFAULT NULL,
  `optional_field_2` varchar(26) DEFAULT NULL,
  `optional_field_3` varchar(26) DEFAULT NULL,
  `optional_field_4` varchar(26) DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t99_reference_data` */

DROP TABLE IF EXISTS `t99_reference_data`;

CREATE TABLE `t99_reference_data` (
  `load_transaction_code` tinyint(4) NOT NULL,
  `reference_type` tinyint(4) DEFAULT NULL,
  `key_field` varchar(10) DEFAULT NULL,
  `description_1` varchar(50) DEFAULT NULL,
  `description_2` varchar(50) DEFAULT NULL,
  `description_3` varchar(50) DEFAULT NULL,
  `description_4` varchar(50) DEFAULT NULL,
  `description_5` varchar(50) DEFAULT NULL,
  `description_6` varchar(50) DEFAULT NULL,
  `description_7` varchar(50) DEFAULT NULL,
  `description_8` varchar(50) DEFAULT NULL,
  `description_9` varchar(50) DEFAULT NULL,
  `description_10` varchar(50) DEFAULT NULL,
  `description_11` varchar(50) DEFAULT NULL,
  `description_12` varchar(50) DEFAULT NULL,
  `description_13` varchar(5) DEFAULT NULL,
  `description_14` varchar(50) DEFAULT NULL,
  `description_15` varchar(50) DEFAULT NULL,
  `inactive_flag` tinyint(4) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `block_header_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
