-- how to export data to mysql file from database
mysqldump -u username -p password > mysqlfile.sql

-- to make it compress 

tar zcf dump.tar.gz mysqlfile.sql

-- to extract

tar zxf dump.tar.gz
