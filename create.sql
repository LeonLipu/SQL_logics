
--- Print the table value 
with T as (select * from (select level as c1 from dual connect by level <4) , (select level as c2 from dual connect by level<4))

select * from (select 'Co'||c1 as col1 , 'Ct'||C2 col2, rownum num from T)



COL1	COL2	NUM
Co1	Ct1	1
Co1	Ct2	2
Co1	Ct3	3
Co2	Ct1	4
Co2	Ct2	5
Co2	Ct3	6
Co3	Ct1	7
Co3	Ct2	8
Co3	Ct3	9



pivot (max(col2) for col1 in ('Co1' co1,'Co2' co2,'Co3' co3))


NUM	CO1	CO2	CO3
6	-	Ct3	-
1	Ct1	-	-
7	-	-	Ct1
2	Ct2	-	-
8	-	-	Ct2
4	-	Ct1	-
5	-	Ct2	-
3	Ct3	-	-
9	-	-	Ct3


unpivot (unpivotelement for unpivotcolumn in ( co1 as 'Co1',co2 as 'Co2',co3 as 'Co3'))


NUM	UNPIVOTCOLUMN	UNPIVOTELEMENT
6	Co2	Ct3
1	Co1	Ct1
7	Co3	Ct1
2	Co1	Ct2
8	Co3	Ct2
4	Co2	Ct1
5	Co2	Ct2
3	Co1	Ct3
9	Co3	Ct3























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

show columns from tablename ;
#native command to export the table accessible
mysql -u username -xml -e 'select * from table ' > outputfile.xml


drop table tablename ; //delete schema and data
truncate table tablename ;// delete only data not schema
drop database databasename ; //delete all data with sechema


grant select ,insert ,update on dbname to brahma@localhost

// how to add foreign key

alter table tablename add colname int not_null ;
alter table tablename add contraint fkref foreign key (colname) reference grade(id);
