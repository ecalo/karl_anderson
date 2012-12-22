DELIMITER $$

USE `karl`$$

DROP PROCEDURE IF EXISTS `udp_relate_the_vendors`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_relate_the_vendors`(include_match_key BOOLEAN, include_singles BOOLEAN, sessionid VARCHAR(32), OUT result TINYINT, OUT error_message VARCHAR(512))
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
        WHERE tax_id_clean IS NOT NULL 
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
        WHERE clean_vend_name IS NOT NULL 
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
			WHERE phone_10_digit IS NOT NULL 
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
			WHERE tax_id_clean IS NOT NULL 
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
			WHERE clean_vend_name IS NOT NULL 
			  AND clean_vend_name <> '' 
			GROUP BY clean_vend_name 
			HAVING (COUNT(*) > 1)) AS vs 
			ON vac.clean_vend_name = vs.match_field) AS allItems
			WHERE vac.sessionid = sessionid
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
END$$

DELIMITER ;

