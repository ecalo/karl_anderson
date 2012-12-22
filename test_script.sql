DELIMITER $$
DROP PROCEDURE IF EXISTS test_script$$
CREATE PROCEDURE test_script()
BEGIN

/*Test Import*/
-- truncate table stg_vendor_address_clean;
-- TRUNCATE TABLE vendor_address_clean_keywords;
SET @sessionid = REPLACE(UUID(),'-','');

INSERT INTO vendor_queue(session_id, state) VALUES(@sessionid, 'PENDING');
COMMIT;
UPDATE vendor_queue
   SET process_starts_on = NOW()
 WHERE session_id = @sessionid;
COMMIT;      

UPDATE vendor_file SET session_id = @sessionid;
-- truncate table stg_vendor_address_clean;
CALL udp_import_wrapper('VENDOR_FILE',@sessionid);


/*Test Check On Invalid Data Entered*/
CALL udp_vendor_data_checks(@sessionid);

/*Test Check on Duplicate Vendor Records*/
CALL udp_group_vendor_dups(@sessionid);

/*Test On Grouping Related Vendors*/

CALL udp_relate_the_vendors(TRUE, TRUE, @sessionid, @res, @err);

IF @res = 1 AND COALESCE(@err, '') = '' THEN
    UPDATE vendor_queue
       SET process_ends_on = NOW(),
           state = 'SUCCESSFUL'
     WHERE session_id = @sessionid;
ELSE
    UPDATE vendor_queue
       SET process_ends_on = NOW(),
           state = 'FAILED',
           error_message = @err
     WHERE session_id = @sessionid;
END IF;
COMMIT;
/*
SELECT @res AS result, @err AS error_mesage;

SELECT 'vendor_address_clean' AS tablename, 
       COUNT(*) AS rowcount 
  FROM stg_vendor_address_clean 
 WHERE session_id = @sessionid
 
 UNION
 
SELECT 'vendor_address_clean_keywords' AS tablename, 
        COUNT(*) AS rowcount 
  FROM vendor_address_clean_keywords AS vack
       INNER JOIN stg_vendor_address_clean as vac
       ON vack.stg_vac_tic_rowid = vac.tic_rowid  
 WHERE vac.session_id = @sessionid      

 UNION             

SELECT 'vendor_data_entry_checks' AS tablename, 
       COUNT(*) AS rowcount 
  FROM vendor_data_entry_checks 
 WHERE session_id = @sessionid
 
 UNION             

SELECT 'vendor_dups' AS tablename, 
       COUNT(*) AS rowcount 
  FROM vendor_dups 
 WHERE session_id = @sessionid

 UNION 
SELECT 'vw_related_vendors_detail' AS tablename,
       COUNT(*) AS rowcount 
  FROM vw_related_vendors_detail 
 WHERE session_id = @sessionid
   AND match_keyword NOT IN ('single') 
;
*/
END $$

-- CALL test_script();