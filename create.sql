
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
