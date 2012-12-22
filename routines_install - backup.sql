/*
 * Procedures and Functions creation script
 */
 
USE karl2;

DELIMITER $$

/***********************************************************************************************
 * Utility Functions 
 **********************************************************************************************/

DROP FUNCTION IF EXISTS `udf_cleanString`$$
CREATE FUNCTION `udf_cleanString`(str VARCHAR (100)) RETURNS VARCHAR(100) CHARSET utf8 DETERMINISTIC
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
END$$

DROP FUNCTION IF EXISTS `udf_extract_numbers`$$

CREATE FUNCTION `udf_extract_numbers`(fieldvalue VARCHAR (100)) RETURNS VARCHAR(100) CHARSET utf8 DETERMINISTIC
BEGIN
/** 
 * Function will ignore all non-numeric characters in string 
 * 
 * @created by Emerito Calo 
 * 
 * @param VARCHAR fieldvalue 
 * @return VARCHAR 
 */ 
  DECLARE i, len SMALLINT DEFAULT 1 ;
  DECLARE ret CHAR(32) DEFAULT '' ;
  DECLARE c CHAR(1) ;
  IF fieldvalue IS NULL THEN 
     RETURN "" ;
  END IF ;
  
  SET len = CHAR_LENGTH(fieldvalue) ;
  
  REPEAT
    
    BEGIN
      SET c = MID(fieldvalue, i, 1) ;
      IF c BETWEEN '0' AND '9' THEN
         SET ret = CONCAT(ret, c) ;
      END IF ;
      SET i = i + 1 ;
      
    END ;
    UNTIL i > len 
  END REPEAT ;
  RETURN ret ;
  
END$$

/***********************************************************************************************
 * Routines to import addresses into vendor_address_clean table
 **********************************************************************************************/

DROP PROCEDURE IF EXISTS  `udp_import_to_vac`$$

CREATE PROCEDURE `udp_import_to_vac`(source VARCHAR(50), OUT success BOOLEAN, sessionid VARCHAR(32))
body:
BEGIN
/**
 * Procedure to import the records from input table (i.e. vendor_file or vendor_address) into vendor_address_clean table
 * 
 * @param VARCHAR source -- mandatory parameter
 * @param BOOLEAN success
 * 
 * The original script used to detect the indices needed for performance and as well as recreating the vendor_address_clean
 * but these seem to be part of the design already in the schema level.
 *
 **/
   DECLARE ctr INT DEFAULT 0;
   DECLARE indices VARCHAR(255) DEFAULT '';   
   DECLARE hasNoIndex BOOLEAN DEFAULT FALSE;
   SET success = FALSE;
   IF source IS NULL THEN 
      LEAVE body; 
   END IF;
   SET source =TRIM(source);
   IF source = 'vendor_all' THEN
     INSERT INTO stg_vendor_address_clean (
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
            session_id
            ) 
     SELECT 
            NULL AS custacctnumber,
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
            udf_extract_numbers(TRIM(vaa.telephone1)),
            LEFT(TRIM(vaa.zip), 5) AS zip_5_char,
            sessionid
       FROM vendor_all VA 
            INNER JOIN vendor_all_addr VAA 
               ON VA.sys = VAA.sys 
               AND VA.vend_num = VAA.vend_num 
               AND VA.session_id = VAA.session_id
      WHERE VA.session_id = sessionid         
      ORDER BY VA.sys, VA.vend_num;
      
   ELSEIF source = 'vendor_file' THEN
   
     INSERT INTO stg_vendor_address_clean (
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
            spend,
            session_id
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
            udf_extract_numbers(TRIM(telephone)),
            LEFT(TRIM(zip), 5) AS zip_5_char,
            spend,
            sessionid
       FROM vendor_file
      WHERE session_id = sessionid 
      ORDER BY custacctnumber, sys, vend_num;        
   ELSE
      LEAVE body;   
   END IF;
   COMMIT;   
   SET success = TRUE;
END $$

DROP PROCEDURE IF EXISTS  `udp_clean_vendor_name`$$

CREATE PROCEDURE `udp_clean_vendor_name`(IN sessionid VARCHAR(32))
BEGIN
/** 
 * Procedure will clean-up all vendor records with unnecessary words based on predefined set of keywords in the vendor_clean_it table
 */ 

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
  
  REPEAT
    UPDATE 
      stg_vendor_address_clean 
    SET
      clean_vend_name = TRIM(
        REPLACE(
          CONCAT(' ', clean_vend_name, ' '),
          theKeyword,
          theReplacement
        )
      ) 
    WHERE session_id = sessionid
      AND INSTR(
        CONCAT(' ', clean_vend_name, ' '),
        theKeyword
      ) > 0 ;
    
    FETCH my_cursor INTO theKeyword,
    theReplacement ;
    
    UNTIL no_more = 1 
  END REPEAT ;
  
  CLOSE my_cursor ;
  
  REPEAT
    
    UPDATE stg_vendor_address_clean 
       SET clean_vend_name = REPLACE(clean_vend_name, '  ', ' ') 
     WHERE session_id = sessionid;
      
    SET theres_more = ROW_COUNT() ;
    
    UNTIL theres_more = 0 
  END REPEAT ;
  
END$$

DROP PROCEDURE IF EXISTS  `udp_clean_vendor_name2`$$

CREATE PROCEDURE `udp_clean_vendor_name2`(IN sessionid VARCHAR(32))
BEGIN
/** 
 * Procedure will clean-up all vendor records with unnecessary words based on predefined set of keywords in the vendor_clean_it table
 */ 
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
  
  REPEAT
    
    UPDATE 
      stg_vendor_address_clean 
    SET
      clean_vend_name = TRIM(
        REPLACE(
          CONCAT(' ', clean_vend_name, ' '),
          theKeyword,
          theReplacement
        )
      ) 
    WHERE session_id = sessionid
      AND clean_vend_name_first_pass IS NOT NULL -- This makes sure that it doesn't clean it down to the same weak one word name as the first pass
      AND clean_vend_name_first_pass <> TRIM(
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
  
 CLOSE my_cursor ;
  
  
  REPEAT
    
    UPDATE stg_vendor_address_clean 
       SET clean_vend_name = REPLACE(clean_vend_name, '  ', ' ') 
     WHERE session_id = sessionid;
      
    SET theres_more = ROW_COUNT() ;
    
    UNTIL theres_more = 0 
  END REPEAT ;
  
END$$

DROP PROCEDURE IF EXISTS  `udp_get_keywords`$$

CREATE PROCEDURE `udp_get_keywords`(IN sessionid VARCHAR(32))
BEGIN
/**
 * Extracts all keywords from vendor_address_clean and puts everything into vendor_address_clean_keywords table
 */
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
    stg_vendor_address_clean 
  WHERE session_id = sessionid
    AND clean_vend_name IS NOT NULL ORDER BY 1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more = 1 ;
  DROP TEMPORARY TABLE IF EXISTS `temp_clean_keywords`;
  CREATE TEMPORARY TABLE `temp_clean_keywords`(
    `vendor_clean_tic_rowid` INT NULL,
    `keyword` VARCHAR (150) NULL
  ) ENGINE=MEMORY;
  
  OPEN my_cursor ;
  FETCH my_cursor INTO tic_row_id, clean_name ;

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
      INSERT INTO vendor_address_clean_keywords(stg_vac_tic_rowid, keyword) 
      SELECT DISTINCT vendor_clean_tic_rowid, keyword 
      FROM temp_clean_keywords;
      DELETE FROM temp_clean_keywords;
      COMMIT;
      SET timeToFreeUpMemory = 0;
    END IF;    
    FETCH my_cursor INTO tic_row_id,
    clean_name ;
  END WHILE ;

  CLOSE my_cursor ;
  
  INSERT INTO vendor_address_clean_keywords(stg_vac_tic_rowid, keyword) 
  SELECT DISTINCT vendor_clean_tic_rowid, keyword 
    FROM temp_clean_keywords;
END $$

DROP PROCEDURE IF EXISTS  `udp_get_keywords2`$$

CREATE PROCEDURE `udp_get_keywords2`(IN sessionid VARCHAR(32))
BEGIN
/**
 * Extracts all keywords from vendor_address_clean and puts everything into vendor_address_clean_keywords table
 */
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
    stg_vendor_address_clean 
  WHERE session_id = sessionid
    AND clean_vend_name IS NOT NULL 
    AND clean_vend_name_first_pass IS NOT NULL ORDER BY 1;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more = 1 ;
  DROP TEMPORARY TABLE IF EXISTS `temp_clean_keywords`;
  CREATE TEMPORARY TABLE `temp_clean_keywords`(
    `vendor_clean_tic_rowid` INT NULL,
    `keyword` VARCHAR (150) NULL
  ) ENGINE=MEMORY;
  OPEN my_cursor ;
  FETCH my_cursor INTO tic_row_id, clean_name ;

  WHILE no_more <> 1 DO
    REPEAT
      SET clean_name = REPLACE(clean_name, '  ', ' ') ;
      SET alreadyClean = COALESCE(INSTR(clean_name, '  '), 0) ;
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
    IF timeToFreeUpMemory = 10000 THEN
       INSERT INTO vendor_address_clean_keywords(stg_vac_tic_rowid, keyword) 
       SELECT DISTINCT vendor_clean_tic_rowid, keyword  
         FROM temp_clean_keywords;
       DELETE FROM temp_clean_keywords;
       SET timeToFreeUpMemory = 0;
    END IF;
    FETCH my_cursor INTO tic_row_id,
    clean_name ;
  END WHILE ;

  CLOSE my_cursor ;
  IF timeToFreeUpMemory > 0 THEN
     INSERT INTO vendor_address_clean_keywords(stg_vac_tic_rowid, keyword) 
     SELECT DISTINCT vendor_clean_tic_rowid, keyword  
       FROM temp_clean_keywords;
  END IF;
  
END$$

DROP PROCEDURE IF EXISTS  `udp_update_vac_101`$$

CREATE PROCEDURE `udp_update_vac_101`(IN sessionid VARCHAR(32))
BEGIN
/**
 * This procedure is used in the clean-up routines of udp_import_wrapper
 */
 
  DROP TEMPORARY TABLE IF EXISTS `temp_update_vac`;
  CREATE TEMPORARY TABLE temp_update_vac
  (tax_id_clean VARCHAR(20)) ENGINE=MEMORY;
  INSERT INTO temp_update_vac
  SELECT 
      tax_id_clean 
    FROM
      stg_vendor_address_clean 
    WHERE session_id = sessionid
      AND tax_id_clean IS NOT NULL 
    GROUP BY tax_id_clean 
    HAVING COUNT(DISTINCT clean_vend_name)>25;
  IF ROW_COUNT()>0 THEN  
    UPDATE 
      stg_vendor_address_clean AS vac
    SET
      tax_id_clean = NULL 
    WHERE session_id = sessionid
      AND EXISTS 
      (SELECT '1' FROM temp_update_vac AS tmp WHERE tmp.tax_id_clean = vac.tax_id_clean);
  END IF;  
END $$

DROP PROCEDURE IF EXISTS  `udp_update_vac_102`$$

CREATE PROCEDURE `udp_update_vac_102`(IN sessionid VARCHAR(32))
BEGIN
/**
 * This procedure is used in the clean-up routines of udp_import_wrapper
 */
  DROP TEMPORARY TABLE IF EXISTS `temp_update_vac`;
  CREATE TEMPORARY TABLE temp_update_vac
  (phone_10_digit VARCHAR(100)) ENGINE=MEMORY;
  INSERT INTO temp_update_vac
  SELECT 
    phone_10_digit 
  FROM
    stg_vendor_address_clean 
  WHERE session_id = sessionid
    AND phone_10_digit IS NOT NULL 
  GROUP BY phone_10_digit 
  HAVING COUNT(DISTINCT clean_vend_name) > 25;
  
  IF ROW_COUNT()>0 THEN  
    UPDATE 
      stg_vendor_address_clean AS vac
    SET
      phone_10_digit = NULL 
    WHERE session_id = sessionid
      AND EXISTS 
      (SELECT '1' FROM temp_update_vac AS tmp WHERE tmp.phone_10_digit = vac.phone_10_digit);
  END IF;  
 
END$$


DROP PROCEDURE IF EXISTS  `udp_import_wrapper`$$

CREATE PROCEDURE `udp_import_wrapper`(from_source VARCHAR(50), sessionid VARCHAR(32))
BEGIN
  DECLARE successful BOOLEAN DEFAULT FALSE;
  DECLARE theSessionId VARCHAR(32);
  SET theSessionId = sessionid;
  
  CALL udp_import_to_vac(from_source, successful, theSessionId);
  
  IF successful THEN

/* THESE UPDATES ARE ALREADY HANDLED BY THE TRIGGER   

	UPDATE vendor_address_clean 
	   SET phone_10_digit = SUBSTRING(phone_10_digit, 2, 99) 
	 WHERE session_id = sessionid 
	   AND LENGTH(phone_10_digit) > 10 
	   AND LEFT(phone_10_digit, 1) = '1' ;
	  
	UPDATE vendor_address_clean 
	   SET phone_10_digit = SUBSTRING(phone_10_digit, 4, 99) 
	 WHERE session_id = sessionid 
	   AND LENGTH(phone_10_digit) > 10 
	   AND LEFT(phone_10_digit, 3) IN ('001', '011') ;
	  
	UPDATE vendor_address_clean 
	   SET phone_10_digit = NULL 
	 WHERE session_id = sessionid 
	   AND LEFT(phone_10_digit, 7) IN ('0000000','5555555');
	  
	UPDATE vendor_address_clean 
	   SET phone_10_digit = NULL 
	 WHERE session_id = sessionid 
	   AND phone IS NOT NULL
	   AND (LEFT(phone, 7) IN ('1111111', '9999999') 
	    OR TRIM(phone) = '' 
	    OR LENGTH(TRIM(phone)) < 7) ;    
	  
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	-- FINAL INSERT
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

	UPDATE vendor_address_clean 
	   SET phone_10_digit = LEFT(phone_10_digit, 10) 
	 WHERE session_id = sessionid 
	   AND phone IS NOT NULL ;
	  
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	-- UPDATES AFTER FINAL INSERT
	-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	-- THESE ARE USUALLY INTERNATIONAL NUMBERS (0 or 1)
	-- No valid US number should start with 555
	
	UPDATE vendor_address_clean 
	   SET phone_10_digit = NULL 
	 WHERE session_id = sessionid 
	   AND phone_10_digit IS NOT NULL
	   AND (LEFT(phone_10_digit, 1) IN ('0', '1') 
	    OR LEFT(phone_10_digit, 3) = '555');
	    
	-- 1310 Update phone_9_digit
	-- 1320 Update phone_8_digit
	-- 1330 update phone_7_digit
	-- 1340 update phone_6_digit
	-- 13XX Update phone_9_digit, phone_8_digit, phone_7_digit, phone_6_digit ALL AT ONCE
	
	UPDATE vendor_address_clean 
	   SET phone_9_digit = LEFT(phone_10_digit, 9),
	       phone_8_digit = LEFT(phone_10_digit, 8),
	       phone_7_digit = LEFT(phone_10_digit, 7),
	       phone_6_digit = LEFT(phone_10_digit, 6) 
	 WHERE session_id = sessionid 
	   AND phone IS NOT NULL 
	   AND phone_10_digit IS NOT NULL;
	   
	-- 1400 numbers only from address
	-- This program removes all the characters from the address field
	-- and leaves just the number

	UPDATE vendor_address_clean 
	   SET address_num = udf_extract_numbers (
		      CONCAT_WS('',
		         RTRIM(address_line_1), 
		         RTRIM(address_line_2), 
		         RTRIM(address_line_3), 
		         RTRIM(address_line_4), 
		         RTRIM(po_box_num)
		      )
	       )
     WHERE session_id = sessionid 
	   AND (address_line_1 IS NOT NULL
	    OR address_line_2 IS NOT NULL
	    OR address_line_3 IS NOT NULL
	    OR address_line_4 IS NOT NULL
	    OR po_box_num IS NOT NULL)
	 ;

	COMMIT;  
*/
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

	CALL udp_clean_vendor_name(theSessionId);
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

	UPDATE vendor_address_clean 
	   SET clean_vend_name = clean_vend_name2 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND vendor_name IS NOT NULL
	   AND LENGTH(clean_vend_name) <= 2 ;

	   
	-- These steps below should be kept in sync
	-- ZZ DO NOT USE and ACCOUNT steps
/*
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ACCOUNT#', '') 
     WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'ACCOUNT#') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ACCT#', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'ACCT#') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ACCT #', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'ACCT #') > 0 ;	
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'REFERENCE #', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'REFERENCE #') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'REFERENCE#', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'REFERENCE#') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ZZZ DO NOT USE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'ZZZ DO NOT USE') > 0 ;

	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ZZ DO NOT USE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'ZZ DO NOT USE') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND clean_vend_name IN ('ZZ', 'ZZZ');
	   
	-- This has to be the last step with the words DO NOT USE
	
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'DO NOT USE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'DO NOT USE') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	WHERE session_id = sessionid 
	  AND clean_vend_name IS NOT NULL 
	  AND INSTR(clean_vend_name, 'PETTY CASH') > 0 ;
	  
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'INACTIVE SUPPLIER', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'INACTIVE SUPPLIER') > 0 ;

	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'INACTIVE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND INSTR(clean_vend_name, 'INACTIVE') > 0 ;
	   
	-- Final Insert Step
	UPDATE vendor_address_clean 
	   SET clean_vend_name = TRIM(clean_vend_name)
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL;
	   
	-- Other updates after final insert
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND (clean_vend_name IN ('!!!', '???', '*') 
	    OR LENGTH(clean_vend_name) <= 1) ;
*/	    
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
	-- COMMIT;

/* creation of table must be part of the schema design already
	
	DROP TABLE IF EXISTS `vendor_address_clean_keywords`;
	CREATE TABLE `vendor_address_clean_keywords` (
	  `tic_rowid` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	  `vendor_clean_tic_rowid` INT DEFAULT NULL,
	  `keyword` VARCHAR(150) DEFAULT NULL,
	  KEY `vack_clean_ticrow_key` (`vendor_clean_tic_rowid`),
	  KEY `vack_keyword_key` (`keyword`)
	) ENGINE=INNODB DEFAULT CHARSET=utf8;
*/	
	-- 1800 Pull Keywords
	-- This program creates a clean vendor name.  It strips off all the 
	-- items from vendor_clean_it.  Basically it does a simply find and replace on
	-- a keyword and a replace width.  This is really cleaning up words that don't belong
	-- like company, corp, incorp, inc, etc.
	-- FIELDS UPDATED BY THIS PROGRAM
	--   clean_vend_name
	CALL udp_get_keywords(theSessionId);
	COMMIT;
	
	-- 1910 Reset Weak One-Word Keyword Names
	UPDATE vendor_address_clean AS vac
	   SET clean_vend_name = vendor_name,
	       clean_vend_name_first_pass = COALESCE(clean_vend_name_first_pass, clean_vend_name) 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL
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
	CALL udp_clean_vendor_name2(theSessionId);
	COMMIT;
	-- 1930 Additional Clean up of Clean vendor names (SECOND PASS)
	-- This step should be the same as 1700 except for it only evaluates names that are getting a second pass
	-- Any code added to 1700 should be added here with the addition of this code in the where clause
	--                      "  clean_vend_name_first_pass is not null and "
	-- This step is done to put the full vend name back in...
	-- THIS HAS TO BE THE LAST STEP OVERALL
	
	UPDATE vendor_address_clean 
	   SET clean_vend_name = clean_vend_name2
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND LENGTH(TRIM(clean_vend_name)) <= 2 ;	
	   
	-- These steps need to be kept in sync
/*
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ACCOUNT#', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'ACCOUNT#') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ACCT#', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'ACCT#') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ACCT #', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'ACCT #') > 0 ;
		
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'REFERENCE #', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'REFERENCE #') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'REFERENCE#', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'REFERENCE#') > 0 ;

	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ZZZ DO NOT USE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'ZZZ DO NOT USE') > 0 ;

	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'ZZ DO NOT USE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'ZZ DO NOT USE') > 0 ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND (clean_vend_name IN ('ZZ', 'ZZZ')
	   OR INSTR(clean_vend_name, 'PETTY CASH') > 0);
	   
	-- this has to be the last step with the words DO NOT USE
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'DO NOT USE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'DO NOT USE') > 0 ;
*/	   
	/*
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND INSTR(clean_vend_name, 'PETTY CASH') > 0 ;
	*/
/*	
	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name,'INACTIVE SUPPLIER','') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name,'INACTIVE SUPPLIER') > 0 ;

	UPDATE vendor_address_clean 
	   SET clean_vend_name = REPLACE(clean_vend_name, 'INACTIVE', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND INSTR(clean_vend_name, 'INACTIVE') > 0 ;

	-- Final Insert Step
	UPDATE vendor_address_clean 
	   SET clean_vend_name = TRIM(clean_vend_name) 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL;
	   
	-- Other updates after final insert
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid 
	   AND clean_vend_name_first_pass IS NOT NULL 
	   AND clean_vend_name IS NOT NULL
	   AND clean_vend_name IN ('!!!','???','*');
*/		
	-- Other updates after final insert
	/*
	UPDATE vendor_address_clean 
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
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid 
	   AND (LENGTH(TRIM(clean_vend_name)) <= 1 
	   AND clean_vend_name IS NOT NULL
    -- AND INSTR(vendor_name, 'DO NOT USE') > 1
	    OR  TRIM(clean_vend_name) = '');
	    
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
	UPDATE stg_vendor_address_clean 
	   SET clean_vend_name = REPLACE(TRIM(clean_vend_name), '.', '') 
	 WHERE session_id = sessionid 
	   AND clean_vend_name = vendor_name 
	   AND clean_vend_name IS NOT NULL;

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
	  FROM vendor_address_clean_keywords 
	 WHERE EXISTS (
	        SELECT '1' 
	          FROM stg_vendor_address_clean vac
	         WHERE vac.session_id = sessionid 
	           AND clean_vend_name_first_pass IS NOT NULL 
	           AND vendor_address_clean_keywords.vendor_clean_tic_rowid = vac.tic_rowid
	       );
	       
	COMMIT;
	
	CALL udp_get_keywords2(theSessionId);
	
	COMMIT;

	-- 2100 Get domain name from email
/*
	UPDATE vendor_address_clean 
	   SET domain = SUBSTRING(contact_email, INSTR(contact_email, '@') + 1, 999)
	 WHERE session_id = sessionid 
	   AND contact_email IS NOT NULL
	   AND INSTR(contact_email, '@') > 0 ;

	-- 2200 Is this PO box
	UPDATE vendor_address_clean 
	   SET type_po_box = 'Y' 
	 WHERE session_id = sessionid 
	   AND (po_box_num IS NOT NULL 
	    OR INSTR(CONCAT_WS('',
	         address_line_1,
	         address_line_2,
	         address_line_3,
	         address_line_4),
	       'PO Box') <> 0 
	    OR INSTR(CONCAT_WS('',
	         address_line_1,
	         address_line_2,
	         address_line_3,
	         address_line_4),
	       'P.O.') <> 0 
	    OR INSTR(CONCAT_WS('',
	         address_line_1,
	         address_line_2,
	         address_line_3,
	         address_line_4),
	       ' PO ') <> 0) ;
	       
	-- 2300 tax id cleaning
	UPDATE vendor_address_clean 
	   SET tax_id_clean = NULL 
	 WHERE session_id = sessionid 
	   AND tax_id_clean IS NOT NULL 
	   AND (tax_id_clean IN (
	         '000000000',
	         '0000000000',
	         '00000000000',
	         '111111111',
	         '1111111111',
	         '11111111111',
	         '999999999',
	         '9999999999',
	         '99999999999') 
	        OR LENGTH(RTRIM(tax_id_clean)) <> 9) ;
*/
	-- COMMIT;
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
	CALL udp_update_vac_101(theSessionId);
	-- 2400 type_comp_tax_id update
/*
	UPDATE vendor_address_clean 
	   SET type_comp_tax_id = 'Individual' 
	 WHERE session_id = sessionid 
	   AND tax_id IS NOT NULL
	   AND SUBSTRING(tax_id, 4, 1) = '-' ;

	UPDATE vendor_address_clean 
	   SET type_comp_tax_id = 'Corporation' 
	 WHERE session_id = sessionid 
	   AND tax_id IS NOT NULL
	   AND SUBSTRING(tax_id, 3, 1) = '-' ;

	UPDATE vendor_address_clean 
	   SET type_comp_tax_id = 'No Tax ID Provided' 
	 WHERE session_id = sessionid 
	   AND tax_id_clean IS NULL ;
	   
	UPDATE vendor_address_clean 
	   SET type_comp_tax_id = 'Not able to categorize' 
	 WHERE session_id = sessionid 
	   AND type_comp_tax_id IS NULL ; 
	   
	COMMIT; 
*/	 
	-- 2500 ONE LAST UPDATE ON PHONE_10_DIGIT
	-- This update has to be done after the clean vend name code
	-- set all vendors with a count of greater than 25 distinct clean vendor names as a bogus number and set to null
	CALL udp_update_vac_102(theSessionId);
	-- This is a list of bogus 7 digit phone numbers this should eventually be a table for each client
	-- that is updated. For right now we will do an in statement
/*
	UPDATE vendor_address_clean 
	   SET phone_10_digit = NULL 
	 WHERE session_id = sessionid 
	   AND phone_10_digit IN ('9545738');
*/	   							
	COMMIT;							

	-- 2800. VENDOR_ADDRESS_CLEAN (3)
	-- 3100 Null out Clean Vend Name for Empty Names

	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL 
	   AND TRIM(clean_vend_name) = '' ;
	   
	UPDATE vendor_address_clean 
	   SET clean_vend_name = NULL 
	 WHERE session_id = sessionid 
	   AND clean_vend_name IS NOT NULL
	   AND vendor_name IS NOT NULL
	   AND LENGTH(TRIM(clean_vend_name)) <= 1 
	   AND INSTR(vendor_name, 'DO NOT USE') > 1 ;

	COMMIT;
     
  END IF;
   
END$$

/***********************************************************************************************
 * Routine that checks invalid data from vendor_address_clean
 **********************************************************************************************/
DROP PROCEDURE IF EXISTS  `udp_vendor_data_checks`$$

CREATE PROCEDURE `udp_vendor_data_checks`(IN sessionid VARCHAR(32))
BEGIN
/**
 * This performs check of records going in the vendor_address_clean
 *
 * @param VARCHAR sessionid  -- determines which records are to be processed.
 */

    -- Active Vendor Name Starts with THE
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor Name Starts with THE', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND LEFT(vendor_name, 4) IN ('THE ','THE,')
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
    -- Active Vendor has DO NOT USE in Vendor Name
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor has DO NOT USE in Vendor Name', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND INSTR(vendor_name, 'DO NOT USE') > 0 
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
    -- Active Vendor has an * in Vendor Name
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor has an * in Vendor Name', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND INSTR(vendor_name, '*') > 0 
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
      -- Active Vendor Name Starts with a SPACE
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor Name Starts with a SPACE', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND LEFT(vendor_name, 1) = ' '
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
     
      -- Active Vendor with NO TAX ID Number
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor with NO TAX ID Number', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND COALESCE(RTRIM(tax_id), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
        
      -- Active Vendor where TAX ID number is to long
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where TAX ID number is to long', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND LENGTH(tax_id) > 11
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where City is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where City is blank', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND COALESCE(RTRIM(city), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where ZIP is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where ZIP is blank', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND zip_5_char IS NULL OR zip_5_char = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where Address Field is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where Address Field is blank', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND COALESCE(TRIM(address_line_1), '') = '' 
       AND COALESCE(TRIM(address_line_2), '') = '' 
       AND COALESCE(TRIM(address_line_3), '') = '' 
       AND COALESCE(TRIM(address_line_4), '') = '' 
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where Telephone Number Field is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where Telephone Number Field is blank', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND COALESCE(TRIM(phone), '') = ''
     GROUP BY `sys`, `vend_num`, `vend_site_id`;
      -- Active Vendor where State is blank
    INSERT 
      INTO vendor_data_entry_checks(`sys`, `vend_num`, `vend_site_id`, `vendor_error`, `session_id`)
    SELECT `sys`, `vend_num`, `vend_site_id`, 'Active Vendor where State is blank', sessionid
      FROM vendor_address_clean
     WHERE session_id = sessionid 
       AND COALESCE(TRIM(state), '') = ''
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
END$$

/***********************************************************************************************
 * Routine that performs initial check on duplicate vendor records
 **********************************************************************************************/
DROP PROCEDURE IF EXISTS  `udp_group_vendor_dups`$$

CREATE PROCEDURE `udp_group_vendor_dups`(IN sessionid VARCHAR(32))
BEGIN
/**
 * Groups records that seems to be related to each other based on the following criteria
 * 1. clean_vendor_name
 * 2. first five characters in the zip code 
 * 3. numbers found in full address line 
 */
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
		 WHERE session_id = sessionid
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
	INSERT INTO vendor_dups(session_id, group_id, sys, vend_num) SELECT sessionid, grpid, sys, vend_num FROM temp_all;
	DELETE FROM temp_all;
	COMMIT;
	SET counter = 1;
     END IF;
     FETCH my_cursor INTO theSys, dummy, theList ;     
  END WHILE;

  CLOSE my_cursor ;
  INSERT INTO vendor_dups(session_id, group_id, sys, vend_num) SELECT sessionid, grpid, sys, vend_num FROM temp_all;
END$$

/***********************************************************************************************
 * Routine that groups related vendor records based on name, keyword, address number and tax
 **********************************************************************************************/
DROP PROCEDURE IF EXISTS  `udp_relate_the_vendors`$$

CREATE PROCEDURE `udp_relate_the_vendors`(include_match_key BOOLEAN, include_singles BOOLEAN, sessionid VARCHAR(32), OUT result TINYINT, OUT error_message VARCHAR(512))
body:
BEGIN
/**
 * Groups all related vendors based on keyword, vendor name, tax, or phone
 *
 * @param BOOLEAN include_match_key -- flag which tells the routine to save the information on what makes the records related to each other
 * @param BOOLEAN include_singles   -- flag which tells the routine to save those vendor records that have no match or seems not related to other records
 * @param VARCHAR sessionid         -- the session id to process
 * @param TINYINT result            -- variable to return the result of operation. 0 for failure, 1 for success, other numbers can be defined later
 * @param VARCHAR error_message     -- if FAILURE, why?
 **/
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
        WHERE session_id = sessionid 
	      AND phone_10_digit IS NOT NULL 
        GROUP BY phone_10_digit 
        HAVING (COUNT(*) > 1)) AS vs 
        ON vac.phone_10_digit = vs.match_field
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
          '3. tax id' AS step_identified,
          tax_id_clean AS match_field,
          COUNT(*) AS num_tran 
        FROM
          vendor_address_clean 
        WHERE session_id = sessionid 
	      AND tax_id_clean IS NOT NULL 
        GROUP BY tax_id_clean 
        HAVING (COUNT(*) > 1)) AS vs 
        ON vac.tax_id_clean = vs.match_field 
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
          '4. name' AS step_identified,
          clean_vend_name AS match_field,
          COUNT(*) AS num_tran 
        FROM
          vendor_address_clean 
        WHERE session_id = sessionid 
	      AND clean_vend_name IS NOT NULL 
          AND clean_vend_name <> '' 
        GROUP BY clean_vend_name 
        HAVING (COUNT(*) > 1)) AS vs 
        ON vac.clean_vend_name = vs.match_field
    WHERE vac.session_id = sessionid) AS allItems 
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
  IF ISNULL(sessionid) OR sessionid='' THEN
     SET error_message = 'Error: Procedure called with invalid parameter. The sessionid is not defined.';
     LEAVE body;
  ELSE
     SET sessionCount = (SELECT COUNT(DISTINCT session_id) FROM vendor_queue WHERE session_id = sessionid AND state = 'PENDING');
     IF sessionCount <= 0 THEN
         SET result = 1;
         SET error_message = 'The session_id provided does not exists or is already loaded.';
         LEAVE body;
     END IF;
  END IF;
  
  OPEN my_cursor ;
  FETCH my_cursor INTO theKeyword, theRowId ;
  SET prevKeyword = '' ;
  SET theSimIdCounter = 0 ;
  SET rowCounter = 0;
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
  
  SET theSimId = (SELECT MAX(simid) FROM temp_all) + 1;
    
  IF COALESCE(include_match_key, FALSE) THEN  
	  INSERT INTO vendors_similar_detail (tic_sim_id, vac_tic_rowid, match_keyword )
	  SELECT DISTINCT tmp.simid, 
		 q.tic_rowid, 
		 GROUP_CONCAT(DISTINCT SUBSTRING(match_keyword FROM 2) ORDER BY match_keyword) AS match_keyword  
	    FROM temp_all AS tmp
	   INNER JOIN 
		   (SELECT 
		    CONCAT_WS('', step_identified, ' (', keyword, ')') AS match_keyword,
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
			WHERE session_id = sessionid 
	          AND phone_10_digit IS NOT NULL 
			GROUP BY phone_10_digit 
			HAVING (COUNT(*) > 1)) AS vs 
			ON vac.phone_10_digit = vs.match_field 
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
			  '3tax id' AS step_identified,
			  tax_id_clean AS match_field,
			  COUNT(*) AS num_tran 
			FROM
			  vendor_address_clean 
			WHERE session_id = sessionid 
	          AND tax_id_clean IS NOT NULL 
			GROUP BY tax_id_clean 
			HAVING (COUNT(*) > 1)) AS vs 
			ON vac.tax_id_clean = vs.match_field 
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
			  '4vendor name' AS step_identified,
			  clean_vend_name AS match_field,
			  COUNT(*) AS num_tran 
			FROM
			  vendor_address_clean 
			WHERE session_id = sessionid 
	         AND clean_vend_name IS NOT NULL 
			  AND clean_vend_name <> '' 
			GROUP BY clean_vend_name 
			HAVING (COUNT(*) > 1)) AS vs 
			ON vac.clean_vend_name = vs.match_field) AS allItems
		    ) AS q
		 ON tmp.rowid = q.tic_rowid
	   GROUP BY tmp.simid, q.tic_rowid 	 
	   ORDER BY 1, 2, 3;
   ELSE
	  INSERT INTO vendors_similar_detail (tic_sim_id, vac_tic_rowid, match_keyword )
	  SELECT DISTINCT simid, 
		 rowid, 
		 'not computed'  
	    FROM temp_all
	   ORDER BY simid, rowid;  
   
   END IF;
   IF COALESCE(include_singles, FALSE) THEN   
	   DROP TEMPORARY TABLE IF EXISTS `temp_singles`;
	   SET @s = CONCAT('CREATE TEMPORARY TABLE temp_singles(simid INT AUTO_INCREMENT PRIMARY KEY NOT NULL, rowid INT NOT NULL) ENGINE = MEMORY AUTO_INCREMENT=',theSimId);
	   PREPARE stmt FROM @s;
	   EXECUTE stmt;
	   INSERT INTO temp_singles(rowid)
	   SELECT DISTINCT tic_rowid
	     FROM vendor_address_clean vac
	    WHERE vac.session_id = sessionid
	      AND NOT EXISTS(
		  SELECT '1'
		    FROM temp_all tmp
		   WHERE vac.tic_rowid = tmp.rowid );
	   INSERT INTO vendors_similar_detail (tic_sim_id, vac_tic_rowid, match_keyword )
	   SELECT simid, rowid, 'single' 
	     FROM temp_singles ;
   END IF;
   COMMIT;           
   SET result = 1;
END $$

DELIMITER ;

 
 