/*
Tweak 3 –  Create a script to cleans the data.  I want this script to be run on any VCF type file that we receive. 
 
T6 - Company Name:
I believe there is company information in the account field.  I believe you will see the data belongs to Tyco in the test file that I provided.  I need a script to place the value in all the fields with a company name with “SouthRim Chemical”.  This is what we call our demo system.
 
T4 - CardHolder Name:
I want cardholder names swapped out.  This is how I have done this in the past.   Simply download a list of 1000 names from the internet.  I usually download a list of 1000 US actors.  I put that into a table that contains 3 fields:
 Actor List
-       id – Int (is just increments from 1 to 1000)
-       First Name – varchar
-       Last Name – varchar
Then I create another list of the names in the database that I want swapped out:
I create query that looks like this:
Select first,last, count(*) as num_trans from source_file
  Group by first,last orderby num_trans DESC
 
I put that into a table put I add an ID field to it. So it looks like:
-       ID
-       First
-       Last
-       Num_tran
 
Then I swap out the source_file first and last name with the list of actors based on the ID field.
 
T4 - Email address:
-       Some of the fields for the cardholder have email address.  Those need to be changed.  For ONLY cardholders that have email populated swap them out with the following formula ‘first_name’+’.’+’last_name’+’@southrimchem.com’
-       If a cardholder does hot have an email … then leave the field blank
 
T4 - Cardholder Telephone
-       For ONLY the cardholder data (not supplier data), we need to modify the telephone number.  For this simply change the LAST four digits of the telephone #.  What I do is simply use the random number function for each of the last four digits ..
o   So something like this …
o   (left(telephone,(lenth(telephone))-4)+rand(0-9)+rand(0-9)+rand(0-9)+rand(0-9)
-       Its not perfect … but it changes the number a bit.
 
Tweak 4 – Remove duplicate records.
 
In the user documentation there are documentation on what makes each table unique.  Right now I know there are duplicate T5 records.  As part of your scripts we should clean-up duplicate records.  This can be an after the fact type of thing.  Basically have a delete scripts that removed the duplicates.   What do you think?
 
 
These items will help me clean-up everything, so I can get cranking on the next phase.

*/

CREATE TABLE `visa`.`t06_company_name`(  
  `company_id` INT NOT NULL,
  `company_name` VARCHAR(80),
  `num_trans` INT DEFAULT 1 NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=INNODB CHARSET=utf8;

CREATE TABLE `visa`.`t04_card_holder_info`(  
  `card_holder_id` VARCHAR(20) NOT NULL,
  `first_name` VARCHAR(20),
  `last_name` VARCHAR(20),
  `email_address` VARCHAR(255),
  `phone_number` VARCHAR(14),
  `home_phone` VARCHAR(14),
  `num_trans` INT DEFAULT 1,
  `id` INT,
  PRIMARY KEY (`card_holder_id`)
) ENGINE=INNODB CHARSET=utf8;


DELIMITER $$

DROP PROCEDURE IF EXISTS swap_out_company_name $$

CREATE PROCEDURE swap_out_company_name () 
BEGIN
    INSERT INTO t06_company_name (company_id, company_name) 
    SELECT 
        company_id
        , company_name 
    FROM
        t06_company 
        ON DUPLICATE KEY 
        UPDATE 
            num_trans = num_trans + 1 ;
    UPDATE 
        t06_company 
    SET
        company_name = 'SouthRim Chemical' ;
END $$

CALL swap_out_company_name()$$