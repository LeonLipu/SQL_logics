
//creating database
create database if not exist student ;


//creating table

create table tablename (

peronid int not_null auto_increment ,
name varchar(30),
address varchar(60),
primary_key(personid)

);

alter table tablename add columnname datatype ;
//example
alter table person add surname varchar(30);

//removing database
drop database databasename ;
drop table //it will delete table
truncate table //it will delete data


select 	version();
show tables;
select * from class ;
desc class;
select ifnull(class_name,"something") as id  from class ;
select current_date();

#native command to export the table accessible
mysql -u username -xml -e 'select * from table ' > outputfile.xml


drop table tablename ; //delete schema and data
truncate table tablename ;// delete only data not schema
drop database databasename ; //delete all data with sechema


grant select ,insert ,update on dbname to brahma@localhost
