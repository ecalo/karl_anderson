del C:\temp\merged.txt
copy *.txt C:\temp\merged.txt
mysql -uroot -p1234 visa -e "truncate table staging"
mysql -uroot -p1234 visa -e "load data infile 'C:/temp/merged.txt' into table staging fields terminated by '\t' lines terminated by '\n'"
mysql -uroot -p1234 visa -e "call transfer_data_to_actual_table()"
echo DONE

