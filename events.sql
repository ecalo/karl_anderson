DELIMITER $$

-- SET GLOBAL event_scheduler = ON$$     -- required for event to execute but not create    
DROP EVENT data_import_event$$

CREATE	/*[DEFINER = { user | CURRENT_USER }]*/	EVENT `data_import_event`

ON SCHEDULE

	   EVERY 1 MINUTE STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE

DO
	BEGIN
	    DECLARE donotproceed BIT;
	    DECLARE theSessionID VARCHAR(32);
	    DECLARE successful BOOLEAN;
	    DROP TEMPORARY TABLE IF EXISTS temp_sessions_for_data_import;
	    CREATE TEMPORARY TABLE temp_sessions_for_data_import(session_id VARCHAR(32) NOT NULL, source VARCHAR(32) NOT NULL) ENGINE=MEMORY CHARSET=utf8;
	    
	    SET donotproceed = (SELECT `status` FROM event_flag WHERE LOWER(event_name) = 'data_import_event');
	    IF donotproceed = b'0' THEN
	       UPDATE event_flag
	          SET `status` = b'1'
	        WHERE LOWER(event_name) = 'data_import_event';
	       COMMIT;  

           INSERT INTO temp_sessions_for_data_import(session_id, source)
           SELECT DISTINCT session_id, source 
             FROM vendor_queue
            WHERE LOWER(state) = 'pending';
           
           SET theSessionID = (SELECT session_id FROM temp_sessions_for_data_import LIMIT 0, 1); 
           WHILE COALESCE(theSessionID,'') <> '' DO
               CALL udp_import_wrapper(theSessionID, successful);
               IF successful THEN
                  CALL udp_vendor_data_checks(theSessionID);
                  CALL udp_group_vendor_dups(theSessionID);
                  CALL udp_relate_the_vendors(TRUE, TRUE, theSessionID);
                  DELETE FROM stg_vendor_address_clean
                   WHERE session_id = theSessionID;
               END IF;
               DELETE FROM temp_sessions_for_data_import WHERE session_id = theSessionID;
               SET theSessionID = (SELECT session_id FROM temp_sessions_for_data_import LIMIT 0, 1); 
           END WHILE;
            
	       UPDATE event_flag
	          SET `status` = b'0'
	        WHERE LOWER(event_name) = 'data_import_event';
	       COMMIT;  
           
	    END IF;
	END$$

DELIMITER ;

/* Important starting data for event_flag in order to make data_import_event successful */
INSERT INTO `event_flag`(`event_name`) VALUES('data_import_event');
