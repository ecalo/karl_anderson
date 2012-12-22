USE karl3;
DELIMITER $$
DROP TRIGGER IF EXISTS `trg_bi_stg_vendor_address_clean`$$
CREATE
    TRIGGER `trg_bi_stg_vendor_address_clean` BEFORE INSERT
    ON `stg_vendor_address_clean`
    FOR EACH ROW BEGIN
        DECLARE phone10 VARCHAR(40);
        DECLARE phoneLength INT;
        DECLARE vendorName VARCHAR(100);
        DECLARE fullAddress VARCHAR(512);
        DROP TEMPORARY TABLE IF EXISTS temp;
        CREATE TEMPORARY TABLE temp(word VARCHAR(50) NOT NULL) ENGINE=MEMORY CHARSET=utf8;
        SET phone10 = TRIM(NEW.phone_10_digit);
        SET phoneLength = LENGTH(phone10);
        -- begin phone number sanitization
        IF phoneLength > 10 THEN
           IF LEFT(phone10, 1) = '1' THEN
              SET phone10 = SUBSTRING(phone10, 2, 99);
           ELSEIF LEFT(phone10, 3) IN ('001', '011') THEN
              SET phone10 = SUBSTRING(phone10, 4, 99);
           ELSEIF LEFT(phone10, 7) IN ('0000000','5555555') OR
                  (NEW.phone IS NOT NULL AND
                   (LEFT(NEW.phone, 7) IN ('1111111', '9999999') OR
                    TRIM(NEW.phone) = '' OR
	                LENGTH(TRIM(NEW.phone)) < 7
	               )                    
                  ) OR
                  phone10 IN ('9545738')
           THEN
              SET phone10 = NULL;
           ELSE
              SET phone10 = LEFT(phone10,10);   
           END IF;
           
           IF phone10 IS NOT NULL AND
              (LEFT(phone10, 1) IN ('0', '1') OR
	           LEFT(phone10, 3) = '555')
           THEN
              SET phone10 = NULL;
           END IF;  
           
        END IF;

        SET NEW.phone_10_digit = phone10;

        IF phone10 IS NOT NULL AND NEW.phone IS NOT NULL THEN
           SET NEW.phone_9_digit = LEFT(phone10, 9);
           SET NEW.phone_8_digit = LEFT(phone10, 8);
           SET NEW.phone_7_digit = LEFT(phone10, 7);
           SET NEW.phone_6_digit = LEFT(phone10, 6);
        
        END IF;
        -- set address_num 
        SET NEW.address_num = udf_extract_numbers (
                  CONCAT_WS('',
                     TRIM(NEW.address_line_1), 
                     TRIM(NEW.address_line_2), 
                     TRIM(NEW.address_line_3), 
                     TRIM(NEW.address_line_4), 
                     TRIM(NEW.po_box_num)
                  )
            );
        -- begin sanitization of vendor name 
        IF COALESCE(NEW.clean_vend_name,'') <> '' THEN
           SET vendorName = CONCAT(' ',NEW.clean_vend_name,' ');
           SET vendorName = REPLACE(vendorName, '&',' AND ');
           SET vendorName = REPLACE(vendorName, '''S ','S ');
           SET vendorName = REPLACE(vendorName, '(',' ');
           SET vendorName = REPLACE(vendorName, ')',' ');
           SET vendorName = REPLACE(vendorName, '*',' ');
           SET vendorName = REPLACE(vendorName, ',',' ');
           SET vendorName = REPLACE(vendorName, '-',' ');
           SET vendorName = REPLACE(vendorName, '.COM ',' ');
           SET vendorName = REPLACE(vendorName, '.',' ');
           SET vendorName = REPLACE(vendorName, '/',' ');
           SET vendorName = REPLACE(vendorName, '?',' ');
           SET vendorName = REPLACE(vendorName, '\\',' ');
           SET vendorName = REPLACE(vendorName, '[',' ');
           SET vendorName = REPLACE(vendorName, ']',' ');
           SET vendorName = TRIM(vendorName);
           WHILE INSTR(vendorName, '  ')>0 DO
              SET vendorName = REPLACE(vendorName, '  ', ' ');
           END WHILE;
           IF TRIM(vendorName) = '' THEN
              SET NEW.clean_vend_name = NULL;
           ELSE
              SET NEW.clean_vend_name = vendorName;
           END IF;   
        END IF;
        -- set clean_vend_name2 field
        IF NEW.vendor_name IS NOT NULL THEN
           SET vendorName = UCASE(NEW.vendor_name);
           SET vendorName = REPLACE(vendorName, 'ACCOUNT#','');
           SET vendorName = REPLACE(vendorName, 'ACCT#','');
           SET vendorName = REPLACE(vendorName, 'ACCT #','');
           SET vendorName = REPLACE(vendorName, 'REFERENCE #','');
           SET vendorName = REPLACE(vendorName, 'REFERENCE#','');
           SET vendorName = REPLACE(vendorName, 'ZZZ DO NOT USE','');
           SET vendorName = REPLACE(vendorName, 'ZZ DO NOT USE','');
           SET vendorName = REPLACE(vendorName, 'DO NOT USE','');
           SET vendorName = REPLACE(vendorName, 'INACTIVE SUPPLIER','');
           SET vendorName = REPLACE(vendorName, 'INACTIVE','');
           SET vendorName = REPLACE(vendorName, 'INACTIVE','');
           WHILE INSTR(vendorName, '  ')>0 DO
              SET vendorName = REPLACE(vendorName, '  ', ' ');
           END WHILE;
           SET vendorName = TRIM(vendorName);
           IF vendorName IN ('ZZ','ZZZ','!!!','???','*') OR
              INSTR(vendorName, 'PETTY CASH')>0 OR
              LENGTH(vendorName)<=1
           THEN
              SET vendorName = NULL;
           END IF;

           SET NEW.clean_vend_name2 = vendorName;
        END IF;
        -- set the domain
        SET NEW.domain = SUBSTRING(NEW.contact_email, INSTR(NEW.contact_email, '@') + 1, 999);
/*
        -- sanitize the tax id
        IF NEW.tax_id_clean IN (
	         '000000000',
	         '111111111',
	         '222222222',
	         '333333333',
	         '444444444',
	         '555555555',
	         '666666666',
	         '777777777',
	         '888888888',
	         '999999999') OR
	       LENGTH(RTRIM(NEW.tax_id_clean)) <> 9
	    THEN
	       set NEW.tax_id_clean = NULL; 
	    END IF;   
	    -- set type_comp_tax_id field
        IF NEW.tax_id IS NOT NULL THEN	    
	       IF SUBSTRING(NEW.tax_id, 4, 1) = '-' THEN
	          SET NEW.type_comp_tax_id = 'Individual';
	       ELSEIF SUBSTRING(NEW.tax_id, 4, 1) = '-' THEN
	          SET NEW.type_comp_tax_id = 'Corporation';
	       END IF;
	    END IF;
	    IF NEW.tax_id_clean IS NULL THEN
	       SET NEW.type_comp_tax_id = 'No Tax ID Provided'; 
	    END IF;   
	    IF NEW.type_comp_tax_id IS NULL THEN
	       SET NEW.type_comp_tax_id = 'Not able to categorize';
	    END IF;
*/
    END$$
/*
DROP TRIGGER IF EXISTS `trg_bu_stg_vendor_address_clean`$$
CREATE
    TRIGGER `trg_bu_stg_vendor_address_clean` BEFORE UPDATE
    ON `stg_vendor_address_clean`
    FOR EACH ROW BEGIN
        IF NEW.clean_vend_name IS NOT NULL AND 
           OLD.vendor_name IS NOT NULL AND
           NEW.clean_vend_name <> OLD.clean_vend_name2 AND
           NEW.clean_vend_name_first_pass IS NULL AND
           LENGTH(TRIM(NEW.clean_vend_name)) <= 2
        THEN   
           SET NEW.clean_vend_name = NULL;
        END IF;  
        IF NEW.tax_id_clean IS NULL THEN
           SET NEW.type_comp_tax_id = 'No Tax ID Provided'; 
        END iF; 
        IF NEW.phone_10_digit IS NULL THEN
           SET NEW.phone_9_digit = NULL;
           SET NEW.phone_8_digit = NULL;
           SET NEW.phone_7_digit = NULL;
           SET NEW.phone_6_digit = NULL;
        END IF;
        
    END$$
*/
DELIMITER ;