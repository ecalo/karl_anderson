/*

How to implement the queueing mechanism:

 Steps:
    1. The user uploads a file and a session id will be generated.
    2. The uploaded file will be dumped into the MySQL table (i.e. vendor_file) and the records will be tagged with session id from #1.
    3. After #2, the user will be notified and will be given the session id for tracking purposes.
    4. The user can query the status of those records having that session id given to him.
       For web-based application, this can be achieved using AJAX.

 In the meantime, in MySQL an event is also firing independently every X minutes
    
    1. All session ids with PENDING status will be queried from vendor_queue table, stop if no records found.
    2. Loop on each session id.
    3. Update the status of the record in the vendor_queue table having same session id to ON PROCESS.
    4. Locate these records with same session id in the vendor_file table.
    5. Run the procedures
       5.1. Call the procedure that imports the records from vendor_file into vendor_address_clean.
       5.2. Call the procedure that processes the related vendors.
    6. Upon completion, update the status of that same session id in the vendor_queue table to SUCCESS or FAILURE depending on the outcome of the previous step.
    7. Repeat steps 2 - 6 until there's no more records of sessions in the vendor_queue.

*/

/*
 Table structure of vendor_queue table
*/   
    CREATE TABLE `vendor_queue` (
      `session_id` VARCHAR(32) NOT NULL,
      `state` VARCHAR(16) DEFAULT NULL COMMENT 'PENDING, ON PROCESS, SUCCESS, FAILED, CANCELLED',
      `error_message` VARCHAR(4000) DEFAULT NULL COMMENT 'only used when status is FAILED',
      `process_starts_on` DATETIME DEFAULT NULL,
      `process_ends_on` DATETIME DEFAULT NULL,
      PRIMARY KEY (`session_id`),
      KEY `queue_state_key` (`state`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;   
/*
 An Event Scheduler in the MySQL database must be turned ON. If it is OFF, use the follwing command to turn it ON.
*/
   SET GLOBAL event_scheduler = ON;

/*
 Example Event scheduler
*/
    DELIMITER $$

    CREATE EVENT `run_sp` ON SCHEDULE EVERY 1 MINUTE STARTS '2012-12-16 10:59:17' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
            -- Get the session_id to be processed.
            -- Update the necessary fields in vendor_queue like process_starts_on and state (ON PROCESS)
            CALL `udp_relate_the_vendors`(TRUE, TRUE, session_id, returned_status); -- we need to add a parameter for session_id, and returned status
            -- Update the necessary fields in vendor_queue like process_ends_on and state (SUCCESS or FAILED)
            -- In the event that it FAILED, update the error_message field
        END$$

    DELIMITER ;   