How to use the scripts

1. Run create_schema.sql to create the database and its schema.
2. Run subroutines.sql to create the stored procedures.
3. Merge the files to be loaded into one file. The simplest way to do this is issue COPY *.txt merged.txt from the command line.
   It is recommended that you put the merged file into a specific directory like C:\temp\
   e.g. C:\path\to\files\to\be\loaded>COPY *.txt C:\temp\merged.txt
4. Invoke the following mysql command in order to load the data:
   load data infile 'C:/temp/merged.txt' into table staging fields terminated by '\t' lines terminated by '\n'   
5. Invoke the stored procedure 'transfer_data_to_actual_table()'
6. The data should now be loaded into the different tables in visa database.

Alternatively, you can also make a batch file for the loading of data.   
1. Register the path to mysql.exe in the %PATH% enviroment variable.
   e.g. If using xampp, it would be like this assuming xammp is located in C: directory
   
      C:\>set PATH=%PATH%;C:\xampp\mysql\bin 

2. Ensure you have a temp folder where you would put the merged.
   e.g. C:\temp
3. Create a batch file and name it as load.bat and put this into the folder where the visa flat files are located.

    Example of load.bat

	del C:\temp\merged.txt
	copy *.txt C:\temp\merged.txt
	mysql -uroot -p1234 visa -e "truncate table staging"
	mysql -uroot -p1234 visa -e "load data infile 'C:/temp/merged.txt' into table staging fields terminated by '\t' lines terminated by '\n'"
	mysql -uroot -p1234 visa -e "call transfer_data_to_actual_table()"
	echo DONE


    Explanation: 
       	a. first attempt to remove whatever merged.txt present on the previous run
		b. merge the files into one and place into C:\temp with filename merged.txt
		c. truncate staging table
		   -uroot -> this refers you will use root as user name to login
		   -p1234 -> this refers to the password of root, in this case the password is 1234
		   visa   -> this is the name of database you will be using
           -e     -> this means mysql will execute the statement following it.

4. Invoke load.bat from the command line.