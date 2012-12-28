USE karl3;
DELIMITER $$

-- SET GLOBAL event_scheduler = ON$$     -- required for event to execute but not create    
DROP EVENT IF EXISTS data_import_event$$

CREATE	/*[DEFINER = { user | CURRENT_USER }]*/	EVENT `data_import_event`

ON SCHEDULE

	   EVERY 1 MINUTE STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE

DO
	BEGIN
       CALL udp_data_import_event();
	END$$

DELIMITER ;

/* Important starting data for event_flag in order to make data_import_event successful */
INSERT INTO `event_flag`(`event_name`) VALUES('data_import_event');
SET GLOBAL event_scheduler=ON;

