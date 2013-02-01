-- determine number of columns and column width for staging table

SELECT 
    ordinal_position
    , MAX(
        CASE
            WHEN character_maximum_length IS NULL 
            THEN LENGTH(
                CONV(POWER(numeric_precision, 2), 10, 10)
            ) 
            ELSE character_maximum_length 
        END
    ) AS data_length 
FROM
    information_schema.columns 
WHERE table_schema = 'visa' 
GROUP BY ordinal_position 
ORDER BY ordinal_position
    , 2 DESC 
;

DROP TABLE staging;

CREATE TABLE staging (
    col1 VARCHAR (8)
    , col2 VARCHAR (20)
    , col3 VARCHAR (80)
    , col4 VARCHAR (80)
    , col5 VARCHAR (80)
    , col6 VARCHAR (80)
    , col7 VARCHAR (76)
    , col8 VARCHAR (100)
    , col9 VARCHAR (76)
    , col10 VARCHAR (50)
    , col11 VARCHAR (50)
    , col12 VARCHAR (50)
    , col13 VARCHAR (50)
    , col14 VARCHAR (50)
    , col15 VARCHAR (52)
    , col16 VARCHAR (100)
    , col17 VARCHAR (76)
    , col18 VARCHAR (150)
    , col19 VARCHAR (150)
    , col20 VARCHAR (50)
    , col21 VARCHAR (50)
    , col22 VARCHAR (26)
    , col23 VARCHAR (26)
    , col24 VARCHAR (140)
    , col25 VARCHAR (56)
    , col26 VARCHAR (56)
    , col27 VARCHAR (52)
    , col28 VARCHAR (50)
    , col29 VARCHAR (76)
    , col30 VARCHAR (26)
    , col31 VARCHAR (26)
    , col32 VARCHAR (50)
    , col33 VARCHAR (76)
    , col34 VARCHAR (26)
    , col35 VARCHAR (26)
    , col36 VARCHAR (50)
    , col37 VARCHAR (26)
    , col38 VARCHAR (19)
    , col39 VARCHAR (52)
    , col40 VARCHAR (50)
    , col41 VARCHAR (50)
    , col42 VARCHAR (18)
    , col43 VARCHAR (50)
    , col44 VARCHAR (26)
    , col45 VARCHAR (26)
    , col46 VARCHAR (26)
    , col47 VARCHAR (26)
    , col48 VARCHAR (14)
    , col49 VARCHAR (52)
    , col50 VARCHAR (26)
    , col51 VARCHAR (26)
    , col52 VARCHAR (26)
    , col53 VARCHAR (26)
    , col54 VARCHAR (20)
    , col55 VARCHAR (20)
    , col56 VARCHAR (20)
    , col57 VARCHAR (20)
    , col58 VARCHAR (20)
    , col59 VARCHAR (26)
    , col60 VARCHAR (26)
    , col61 VARCHAR (26)
    , col62 VARCHAR (26)
    , col63 VARCHAR (20)
    , col64 VARCHAR (20)
    , col65 VARCHAR (8)
    , col66 VARCHAR (8)
    , col67 VARCHAR (8)
    , col68 VARCHAR (10)
    , col69 VARCHAR (256)
    , col70 VARCHAR (256)
    , col71 VARCHAR (256)
    , col72 VARCHAR (256)
    , col73 VARCHAR (40)
    , col74 VARCHAR (30)
    , col75 VARCHAR (30)
    , col76 VARCHAR (30)
    , col77 VARCHAR (30)
    , col78 VARCHAR (30)
    , col79 VARCHAR (30)
    , col80 VARCHAR (8)
    , col81 VARCHAR (8)
    , col82 VARCHAR (8)
    , col83 VARCHAR (8)
);


-- Start of Subroutines 
DELIMITER $$

DROP PROCEDURE IF EXISTS t01_data_transfer $$
CREATE PROCEDURE t02_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t01_account_balance -- (load_transaction_code,account_number,closing_date,period,previous_balance,current_balance,credit_limit,current_amount_due,past_due_count,past_due_amount,disputed_amount,billing_currency_code,amount_past_due_1,amount_past_due_2,amount_past_due_3,amount_past_due_4,amount_past_due_5,amount_past_due_6,amount_past_due_plus,past_due_1_count,past_due_2_count,past_due_3_count,past_due_4_count,past_due_5_count,past_due_6_count,past_due_plus_count,past_due_cycles_count,last_payment_amount,last_payment_date,payment_due_date,high_balance,optional_field_1,optional_field_2,optional_field_3,optional_field_4)
  SELECT CAST(col1 AS SIGNED),
         col2,   
         STR_TO_DATE(col3,'%m%d%Y'),
         CAST(col4 AS SIGNED),
         CAST(col5 AS SIGNED)/100,
         CAST(col6 AS SIGNED)/100,
         CAST(col7 AS SIGNED)/100,
         CAST(col8 AS SIGNED)/100,
         CAST(col9 AS SIGNED),
         CAST(col10 AS SIGNED)/100,
         CAST(col11 AS SIGNED)/100,
         CAST(col12 AS SIGNED),
         CAST(col13 AS SIGNED)/100,
         CAST(col14 AS SIGNED)/100,
         CAST(col15 AS SIGNED)/100,
         CAST(col16 AS SIGNED)/100,
         CAST(col17 AS SIGNED)/100,
         CAST(col18 AS SIGNED)/100,
         CAST(col19 AS SIGNED)/100,
         CAST(col20 AS SIGNED),
         CAST(col21 AS SIGNED),
         CAST(col22 AS SIGNED),
         CAST(col23 AS SIGNED),
         CAST(col25 AS SIGNED),
         CAST(col26 AS SIGNED),
         CAST(col27 AS SIGNED),
         CAST(col28 AS SIGNED)/100,
         STR_TO_DATE(col29,'%m%d%Y'),
         STR_TO_DATE(col30,'%m%d%Y'),
         CAST(col31 AS SIGNED)/100,
         col32,
         col33,
         col34,
         col35
    FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t03_data_transfer $$
CREATE PROCEDURE t03_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t03_card_account 
  SELECT CAST(col1 AS SIGNED),
         col2,   
         col3,
         col4,
         STR_TO_DATE(col5,'%m%d%Y'),
         STR_TO_DATE(col6,'%m%d%Y'),
         STR_TO_DATE(col7,'%m%d%Y'),
         STR_TO_DATE(col8,'%m%d%Y'),
         CAST(col9 AS SIGNED),
         CAST(col10 AS SIGNED)/100,
         CAST(col11 AS SIGNED),
         STR_TO_DATE(col12,'%m%d%Y'),
         CAST(col13 AS SIGNED)/100,
         CAST(col14 AS SIGNED),
         col15,
         col16,
         col17,
         CAST(col18 AS SIGNED),
         CAST(col19 AS SIGNED),
         CAST(col20 AS SIGNED)/100,
         CAST(col21 AS SIGNED),
         CAST(col22 AS SIGNED),
         STR_TO_DATE(col23,'%m%d%Y'),
         CAST(col24 AS SIGNED),
         CAST(col25 AS SIGNED),
         col26,
         CAST(col27 AS SIGNED),
         col28,
         STR_TO_DATE(col29,'%m%d%Y'),
         CAST(col30 AS SIGNED),
         CAST(col31 AS SIGNED),
         CAST(col32 AS SIGNED),
         CAST(col33 AS SIGNED),
         CAST(col34 AS SIGNED),
         STR_TO_DATE(col35,'%m%d%Y'),
         STR_TO_DATE(col36,'%m%d%Y'),
         CAST(col37 AS SIGNED)/100,
         col38,
         col39,
         col40,
         col41,
         STR_TO_DATE(col42,'%m%d%Y'),
         STR_TO_DATE(col43,'%m%d%Y'),
         col44,
         col45,
         col46,
         col47
    FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t04_data_transfer $$
CREATE PROCEDURE t04_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t04_cardholder 
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),   
         col3,
         col4,
         col5,
         col6,
         col7,
         col8,
         col9,
         col10,
         CAST(col11 AS SIGNED),
         col12,
         col13,
         col14,
         col15,
         col16,
         col17,
         STR_TO_DATE(col18, '%m%d%Y'),
         col19,
         col20,
         col21,
         col22,
         col23,
         col24,
         col25,
         col26,
         col27,
         col28,
         col29,
         col30,
         col31,
         col32,
         col33,
         col34,
         col35
    FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t05_data_transfer $$
CREATE PROCEDURE t05_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t05_card_transaction 
  SELECT CAST(col1 AS SIGNED),
         col2,   
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         CAST(col7 AS SIGNED),
         col8,
         col9,
         col10,
         col11,
         CAST(col12 AS SIGNED),
         col13,
         CAST(col14 AS SIGNED)/100,
         CAST(col15 AS SIGNED)/100,
         CAST(col16 AS SIGNED),
         CAST(col17 AS SIGNED),
         col18,
         STR_TO_DATE(col19, '%m%d%Y'),
         CAST(col20 AS SIGNED),
         CAST(col21 AS SIGNED)/100,
         CAST(col22 AS SIGNED)/100,
         CAST(col23 AS SIGNED),
         STR_TO_DATE(col24, '%m%d%Y'),
         col25,
         col26,
         col27,
         col28,
         CAST(col29 AS SIGNED)/100,
         CAST(col30 AS SIGNED)/100,
         col31,
         col32,
         col33,
         STR_TO_DATE(col34,'%H%i'),
         CAST(col35 AS SIGNED),
         CAST(col36 AS SIGNED),
         CAST(col37 AS SIGNED),
         col38,
         col39,
         CAST(col40 AS SIGNED),
         CAST(col41 AS SIGNED),
         col42,
         col43,
         CAST(col44 AS SIGNED),
         CAST(col45 AS SIGNED),
         col46,
         CAST(col47 AS SIGNED),
         CAST(col48 AS SIGNED),
         col49,
         col50,
         CAST(col51 AS SIGNED),
         CAST(col52 AS SIGNED),
         STR_TO_DATE(col53, '%m%d%Y'),
         col54,
         col55,
         col56,
         col57,
         col58,
         col59,
         col60,
         col61,
         col62,
         col63,
         col64,
         STR_TO_DATE(col65, '%m%d%Y'),
         CAST(col66 AS SIGNED),
         col67,
         col68,
         col69,
         col70,
         col71,
         col72,
         col73,
         col74,
         col75,
         col76
    FROM staging
   WHERE id > from_id AND id < to_id;      
END $$
DROP PROCEDURE IF EXISTS t06_data_transfer $$
CREATE PROCEDURE t06_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t06_company 
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),
         col3,   
         col4,
         col5,
         col6,
         col7,
         CAST(col8 AS SIGNED),
         col9,
         STR_TO_DATE(col10, '%m%d%Y'),
         CAST(col11 AS SIGNED)/100,
         CAST(col12 AS SIGNED),
         col13,
         CAST(col14 AS SIGNED),
         STR_TO_DATE(col15, '%m%d%Y'),
         col16,
         CAST(col17 AS SIGNED),
         col18,
         col19,
         col20,
         col21
    FROM staging
   WHERE id > from_id AND id < to_id;      
END $$
DROP PROCEDURE IF EXISTS t10_data_transfer $$
CREATE PROCEDURE t10_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t10_organization 
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),
         col3,   
         col4,
         CAST(col5 AS SIGNED),
         col6,
         col7,
         col8,
         col9,
         STR_TO_DATE(col10, '%m%d%Y'),
         col11,
         col12,
         col13,
         col14,
         col15,
         col16,
         col17,
         col18,
         col19,
         CAST(col20 AS SIGNED),
         col21,
         col22,
         col23,
         col24,
         col25,
         col26,
         col27,
         col28,
         col29,
         col30,
         col31,
         col32,
         col33
    FROM staging
   WHERE id > from_id AND id < to_id;      
END $$
DROP PROCEDURE IF EXISTS t11_data_transfer $$
CREATE PROCEDURE t11_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t11_period 
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),
         CAST(col3 AS SIGNED),   
         CAST(col4 AS SIGNED),
         STR_TO_DATE(col5, '%m%d%Y'),
         STR_TO_DATE(col6, '%m%d%Y'),
         CAST(col7 AS SIGNED),
         col8,
         col9,
         col10,
         col11
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$
DROP PROCEDURE IF EXISTS header_data_transfer $$
CREATE PROCEDURE header_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO header
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),
         CAST(col3 AS SIGNED),   
         STR_TO_DATE(col4, '%m%d%Y'),
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         CAST(col7 AS SIGNED),
         col8,
         col9,
         CAST(col10 AS SIGNED),
         CAST(col11 AS SIGNED),
         col12,
         col13,
         col14,
         col15,
         col16
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$
DROP PROCEDURE IF EXISTS t02_data_transfer $$
CREATE PROCEDURE t02_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t02_car_rental_summary
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         CAST(col7 AS SIGNED),
         CAST(col8 AS SIGNED),
         CAST(col9 AS SIGNED),
         CAST(col10 AS SIGNED),
         CAST(col11 AS SIGNED),
         CAST(col12 AS SIGNED),
         col13,
         CAST(col14 AS SIGNED)/100,
         col15,
         CAST(col16 AS SIGNED)/100,
         CAST(col17 AS SIGNED)/100,
         CAST(col18 AS SIGNED)/100,
         CAST(col19 AS SIGNED)/100,
         col20,
         CAST(col21 AS SIGNED)/100,
         CAST(col22 AS SIGNED)/100,
         col23,
         col24,
         CAST(col25 AS SIGNED),
         col26,
         col27,
         CAST(col28 AS SIGNED)/100,
         CAST(col29 AS SIGNED),
         CAST(col30 AS SIGNED),
         col31,
         col32,
         col33,
         col34,
         col35,
         col36,
         col37
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$
DROP PROCEDURE IF EXISTS t07_data_transfer $$
CREATE PROCEDURE t07_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t07_line_item_detail
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7,
         col8,
         col9,
         CAST(col10 AS SIGNED)/100,
         CAST(col11 AS SIGNED)/100,
         col12,
         CAST(col13 AS SIGNED),
         CAST(col14 AS SIGNED),
         CAST(col15 AS SIGNED),
         CAST(col16 AS SIGNED)/100,
         CAST(col17 AS SIGNED)/100,
         CAST(col18 AS SIGNED)/100,
         col19,
         col20,
         col21,
         CAST(col22 AS SIGNED)/100,
         STR_TO_DATE(col23, '%m%d%Y'),
         CAST(col24 AS SIGNED),
         col25,
         col26,
         col27,
         CAST(col28 AS SIGNED),
         col29,
         col30,
         col31,
         col32,
         col33,
         col34
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t08_data_transfer $$
CREATE PROCEDURE t08_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t08_line_item_summary
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         col6,
         CAST(col7 AS SIGNED)/100,
         CAST(col8 AS SIGNED)/100,
         CAST(col9 AS SIGNED)/100,
         col10,
         col11,
         CAST(col12 AS SIGNED),
         col13,
         CAST(col14 AS SIGNED),
         CAST(col15 AS SIGNED)/100,
         CAST(col16 AS SIGNED)/100,
         col17,
         col18,
         CAST(col19 AS SIGNED),
         CAST(col20 AS SIGNED),
         CAST(col21 AS SIGNED),
         col22,
         col23,
         col24,
         CAST(col25 AS SIGNED),
         col26,
         col27,
         col28,
         col29,
         col30,
         col31,
         col32
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t09_data_transfer $$
CREATE PROCEDURE t09_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t09_lodging_summary
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         STR_TO_DATE(col7, '%m%d%Y'),
         CAST(col8 AS SIGNED)/100,
         CAST(col9 AS SIGNED)/100,
         CAST(col10 AS SIGNED)/100,
         CAST(col11 AS SIGNED)/100,
         CAST(col12 AS SIGNED)/100,
         CAST(col13 AS SIGNED)/100,
         CAST(col14 AS SIGNED)/100,
         CAST(col15 AS SIGNED)/100,
         CAST(col16 AS SIGNED)/100,
         CAST(col17 AS SIGNED)/100,
         CAST(col18 AS SIGNED)/100,
         CAST(col19 AS SIGNED)/100,
         CAST(col20 AS SIGNED)/100,
         CAST(col21 AS SIGNED)/100,
         col22,
         CAST(col23 AS SIGNED)/100,
         CAST(col24 AS SIGNED),
         CAST(col25 AS SIGNED)/100,
         col26,
         col27,
         CAST(col28 AS SIGNED)/100,
         STR_TO_DATE(col29, '%m%d%Y'),
         CAST(col30 AS SIGNED), 
         col31,
         col32,
         col33,
         col34,
         col35,
         col36,
         col37
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t14_data_transfer $$
CREATE PROCEDURE t14_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t14_passenger_itinerary
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         STR_TO_DATE(col6, '%m%d%Y'),
         col7,
         col8,
         CAST(col9 AS SIGNED),
         col10,
         col11,
         col12,
         CAST(col13 AS SIGNED)/100,
         CAST(col14 AS SIGNED),
         CAST(col15 AS SIGNED)/100,
         CAST(col16 AS SIGNED)/100,
         CAST(col17 AS SIGNED)/100,
         col18,
         col19,
         col20,
         CAST(col21 AS SIGNED)/100,
         STR_TO_DATE(col22, '%m%d%Y'),
         CAST(col23 AS SIGNED),
         col24,
         col25,
         col26,
         col27,
         STR_TO_DATE(col28, '%m%d%Y'),
         CAST(col29 AS SIGNED),
         CAST(col30 AS SIGNED), 
         col31,
         col32,
         col33,
         col34,
         col35,
         col36
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t15_data_transfer $$
CREATE PROCEDURE t15_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t15_leg_specific_information
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7,
         col8,
         col9,
         col10,
         STR_TO_DATE(col11, '%m%d%Y'),
         CAST(col12 AS SIGNED),
         CAST(col13 AS SIGNED),
         col14,
         STR_TO_DATE(col15,'%H%i'),
         STR_TO_DATE(col16,'%H%i'),
         col17,
         col18,
         col19,
         col20,
         CAST(col21 AS SIGNED)/100,
         STR_TO_DATE(col22, '%m%d%Y'),
         CAST(col23 AS SIGNED),
         col24,
         col25,
         col26,
         CAST(col27 AS SIGNED),
         STR_TO_DATE(col28, '%m%d%Y'),
         CAST(col29 AS SIGNED)/100,
         col30, 
         col31,
         col32,
         col33
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t16_data_transfer $$
CREATE PROCEDURE t16_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t16_supplier
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),
         col3,
         col4,
         col5,
         CAST(col6 AS SIGNED),
         col7,
         CAST(col8 AS SIGNED),
         col9,
         CAST(col10 AS SIGNED),
         col11,
         col12,
         col13,
         CAST(col14 AS SIGNED),
         CAST(col15 AS SIGNED),
         col16,
         CAST(col17 AS SIGNED),
         col18,
         col19,
         col20,
         col21,
         col22,
         col23,
         col24,
         CAST(col25 AS SIGNED),
         CAST(col26 AS SIGNED),
         CAST(col27 AS SIGNED),
         CAST(col28 AS SIGNED),
         col29,
         col30, 
         col31,
         col32,
         col33,
         CAST(col34 AS SIGNED),
         col35,
         col36,
         col37,
         STR_TO_DATE(col38, '%m%d%Y'),
         STR_TO_DATE(col39, '%m%d%Y'),
         col40,
         STR_TO_DATE(col41, '%m%d%Y'),
         col42,
         col43,
         col44,
         col45,
         col46,
         STR_TO_DATE(col47, '%m%d%Y'),
         col48,
         col49,
         col50,
         CAST(col51 AS SIGNED),
         CAST(col52 AS SIGNED),
         col53,
         col54,
         CAST(col55 AS SIGNED),
         CAST(col56 AS SIGNED),
         col57,
         col58,
         col59,
         col60,
         col61,
         col62,
         CAST(col63 AS SIGNED),
         col64,
         col65,
         col66,
         col67,
         col68,
         col69,
         col70,
         col71,
         col72,
         col73,
         col74,
         col75,
         col76,
         col77,
         col78,
         col79,
         col80,
         col81,
         col82,
         col83
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t17_data_transfer $$
CREATE PROCEDURE t17_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t17_fleet_service
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7,
         col8,
         CAST(col9 AS SIGNED)/10000,
         CAST(col10 AS SIGNED)/10000,
         CAST(col11 AS SIGNED)/10000,
         CAST(col12 AS SIGNED)/10000,
         CAST(col13 AS SIGNED)/10000,
         CAST(col14 AS SIGNED)/10000,
         col15,
         CAST(col16 AS SIGNED)/10000,
         CAST(col17 AS SIGNED)/10000,
         CAST(col18 AS SIGNED)/10000,
         col19,
         CAST(col20 AS SIGNED),
         CAST(col21 AS SIGNED),
         col22,
         CAST(col23 AS SIGNED),
         CAST(col24 AS SIGNED)/100,
         CAST(col25 AS SIGNED),
         CAST(col26 AS SIGNED)/100,
         CAST(col27 AS SIGNED),
         CAST(col28 AS SIGNED)/100,
         CAST(col29 AS SIGNED),
         CAST(col30 AS SIGNED)/100, 
         CAST(col31 AS SIGNED),
         CAST(col32 AS SIGNED)/100,
         CAST(col33 AS SIGNED),
         CAST(col34 AS SIGNED)/100,
         CAST(col35 AS SIGNED),
         CAST(col36 AS SIGNED)/100,
         CAST(col37 AS SIGNED),
         CAST(col38 AS SIGNED)/100,
         CAST(col39 AS SIGNED),
         CAST(col40 AS SIGNED)/100,
         CAST(col41 AS SIGNED),
         CAST(col42 AS SIGNED)/100,
         col43,
         CAST(col44 AS SIGNED)/100,
         STR_TO_DATE(col45, '%m%d%Y'),
         CAST(col46 AS SIGNED),
         col47,
         col48,
         col49,
         col50,
         col51,
         col52,
         col53
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t18_data_transfer $$
CREATE PROCEDURE t18_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t18_fleet_product
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7,
         col8,
         col9,
         CAST(col10 AS SIGNED)/100,
         STR_TO_DATE(col11, '%m%d%Y'),
         CAST(col12 AS SIGNED),
         col13,
         col14,
         col15,
         col16,
         col17,
         col18,
         col19
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t20_data_transfer $$
CREATE PROCEDURE t20_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t20_temporary_services
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7,
         STR_TO_DATE(col8, '%m%d%Y'),
         STR_TO_DATE(col9, '%m%d%Y'),
         col10,
         col11,
         col12,
         CAST(col13 AS SIGNED),
         CAST(col14 AS SIGNED),
         CAST(col15 AS SIGNED)/100,
         CAST(col16 AS SIGNED)/100,
         CAST(col17 AS SIGNED)/100,
         CAST(col18 AS SIGNED)/100,
         col19,
         CAST(col20 AS SIGNED)/100,
         col21,
         col22,
         CAST(col23 AS SIGNED)/100,
         CAST(col24 AS SIGNED)/100,
         CAST(col25 AS SIGNED)/100,
         col26,
         CAST(col27 AS SIGNED),
         col28,
         col29,
         col30,
         col31,
         col32,
         col33
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t21_data_transfer $$
CREATE PROCEDURE t21_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t21_shipping_services
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7,
         col8,
         col9,
         STR_TO_DATE(col10, '%m%d%Y'),
         col11,
         CAST(col12 AS SIGNED),
         col13,
         CAST(col14 AS SIGNED),
         col15,
         CAST(col16 AS SIGNED),
         CAST(col17 AS SIGNED)/100,
         CAST(col18 AS SIGNED)/100,
         CAST(col19 AS SIGNED)/100,
         col20,
         col21,
         CAST(col22 AS SIGNED)/100,
         col23,
         col24,
         col25,
         col26,
         col27,
         col28,
         col29,
         col30,
         col31,
         col32,
         col33
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t25_data_transfer $$
CREATE PROCEDURE t25_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t25_headquarter_relationship
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),
         CAST(col3 AS SIGNED),
         CAST(col4 AS SIGNED),
         CAST(col5 AS SIGNED),
         col6,
         CAST(col7 AS SIGNED),
         CAST(col8 AS SIGNED),
         STR_TO_DATE(col9, '%m%d%Y'),
         STR_TO_DATE(col10, '%m%d%Y'),
         STR_TO_DATE(col11, '%m%d%Y'),
         col12,
         col13,
         col14,
         col15
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$



DROP PROCEDURE IF EXISTS t26_data_transfer $$
CREATE PROCEDURE t26_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t26_lodging_detail
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         STR_TO_DATE(col6, '%m%d%Y'),
         CAST(col7 AS SIGNED),
         CAST(col8 AS SIGNED)/100,
         CAST(col9 AS SIGNED)/100,
         CAST(col10 AS SIGNED)/100,
         CAST(col11 AS SIGNED)/100,
         CAST(col12 AS SIGNED)/100,
         CAST(col13 AS SIGNED)/100,
         CAST(col14 AS SIGNED)/100,
         CAST(col15 AS SIGNED)/100,
         CAST(col16 AS SIGNED)/100,
         CAST(col17 AS SIGNED)/100,
         CAST(col18 AS SIGNED)/100,
         CAST(col19 AS SIGNED)/100,
         CAST(col20 AS SIGNED)/100,
         CAST(col21 AS SIGNED)/100,
         CAST(col22 AS SIGNED)/100,
         CAST(col23 AS SIGNED)/100,
         CAST(col24 AS SIGNED)/100,
         col25,
         col26,
         col27,
         col28,
         col29,
         col30,
         col31,
         col32,
         col33
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t27_data_transfer $$
CREATE PROCEDURE t27_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t27_car_rental_detail
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         CAST(col7 AS SIGNED)/100,
         CAST(col8 AS SIGNED)/100,
         CAST(col9 AS SIGNED)/100,
         CAST(col10 AS SIGNED)/100,
         CAST(col11 AS SIGNED)/100,
         CAST(col12 AS SIGNED)/100,
         col13,
         col14,
         col15,
         col16
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t28_data_transfer $$
CREATE PROCEDURE t28_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t28_allocation
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7,
         col8,
         col9,
         col10,
         CAST(col11 AS SIGNED)/100,
         CAST(col12 AS SIGNED),
         CAST(col13 AS SIGNED)/100,
         CAST(col14 AS SIGNED)/100,
         CAST(col15 AS SIGNED),
         col16,
         STR_TO_DATE(col17, '%m%d%Y'),
         col18,
         col19,
         col20,
         col21,
         col22,
         col23         
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t29_data_transfer $$
CREATE PROCEDURE t29_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t29_allocation_descriptor
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         CAST(col7 AS SIGNED), 
         col8,
         col9,
         col10,
         col11,
         col12         
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$

DROP PROCEDURE IF EXISTS t30_data_transfer $$
CREATE PROCEDURE t30_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t30_relationship
  SELECT CAST(col1 AS SIGNED),
         CAST(col2 AS SIGNED),
         col3,
         col4,
         CAST(col5 AS SIGNED),
         col6,
         col7, 
         STR_TO_DATE(col8, '%m%d%Y'),
         col9,
         col10,
         col11,
         col12         
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS t31_data_transfer $$
CREATE PROCEDURE t31_data_transfer(from_id BIGINT, to_id BIGINT)
BEGIN
  INSERT INTO t31_phone
  SELECT CAST(col1 AS SIGNED),
         col2,
         STR_TO_DATE(col3, '%m%d%Y'),
         col4,
         CAST(col5 AS SIGNED),
         CAST(col6 AS SIGNED),
         col7, 
         col8,
         CAST(col9 AS SIGNED), 
         CAST(col10 AS SIGNED),
         col11,
         col12,
         CAST(col13 AS SIGNED),
         CAST(col14 AS SIGNED),
         CAST(col15 AS SIGNED),
         col16, 
         col17,
         CAST(col18 AS SIGNED)/100, 
         CAST(col19 AS SIGNED)/100, 
         col20,
         col21,
         col22,
         col23
      FROM staging
   WHERE id > from_id AND id < to_id;      
END $$


DROP PROCEDURE IF EXISTS compute_blocks$$
CREATE PROCEDURE compute_blocks()
BEGIN
   DROP TEMPORARY TABLE IF EXISTS six_seven;
   CREATE TEMPORARY TABLE six_seven(id INT PRIMARY KEY AUTO_INCREMENT, `6` BIGINT, `7` BIGINT) ENGINE = MEMORY CHARSET=utf8;

   DROP TEMPORARY TABLE IF EXISTS seven;
   CREATE TEMPORARY TABLE seven(id INT PRIMARY KEY AUTO_INCREMENT, `7` BIGINT) ENGINE = MEMORY CHARSET=utf8;

   DROP TEMPORARY TABLE IF EXISTS eight_nine;
   CREATE TEMPORARY TABLE eight_nine(id INT PRIMARY KEY AUTO_INCREMENT, `8` BIGINT, `9` BIGINT) ENGINE = MEMORY CHARSET=utf8;

   DROP TEMPORARY TABLE IF EXISTS nine;
   CREATE TEMPORARY TABLE nine(id INT PRIMARY KEY AUTO_INCREMENT, `9` BIGINT) ENGINE = MEMORY CHARSET=utf8;

   DROP TEMPORARY TABLE IF EXISTS block_info;
   CREATE TEMPORARY TABLE block_info(`6` BIGINT, `8` BIGINT,`9` BIGINT,`7` BIGINT) ENGINE = MEMORY CHARSET=utf8;

   INSERT INTO six_seven(`6`) SELECT id FROM staging WHERE col1='6' ORDER BY id;
   INSERT INTO seven(`7`) SELECT id FROM staging WHERE col1='7' ORDER BY id;
   
   UPDATE six_seven INNER JOIN seven ON six_seven.id = seven.id
      SET six_seven.`7` = seven.`7`;
         
   INSERT INTO eight_nine(`8`) SELECT id FROM staging WHERE col1='8' ORDER BY id;
   INSERT INTO nine(`9`) SELECT id FROM staging WHERE col1='9' ORDER BY id;
   
   UPDATE eight_nine INNER JOIN nine ON eight_nine.id = nine.id
      SET eight_nine.`9` = nine.`9`;
   INSERT INTO block_info
   SELECT six_seven.`6`, eight_nine.`8`, eight_nine.`9`, six_seven.`7`
     FROM six_seven JOIN eight_nine ON six_seven.`6` < eight_nine.`8` AND six_seven.`7` > eight_nine.`9`;
END $$
DELIMITER ;
CALL compute_blocks(); -- this creates a temporary table block_info
SELECT a.*,
       CAST(c.col5 AS SIGNED) AS record_type,
       CAST(c.col6 AS SIGNED) AS record_count,
       CAST(d.col6 AS SIGNED) AS total_record_count,
       CAST(b.col2 AS SIGNED) AS company_id,
       CAST(b.col3 AS SIGNED) AS sequence_number,
       STR_TO_DATE(b.col4, '%m%d%Y') AS processing_date
  FROM block_info a
       INNER JOIN staging b ON a.`6` = b.id
       INNER JOIN staging c ON a.`9` = c.id
       INNER JOIN staging d ON a.`7` = d.id
;
