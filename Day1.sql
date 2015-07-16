create table tb (
id int(10) auto_increment,
name text not null,
gender text not null,
primary key (id)
);

insert into tb (name ,gender) values ("brahma","M"), ("para","F"),("trilochana","M"),("bhagyarathi","M"),("Basanti kar ","M");

select * from tb;


select id as kk from tb;


update tb set gender="F" where id =5;


select * from tb group by gender ;
select name ,case when gender="M" then  "F" 
                  when gender="F" then "M"
                  else "not defined"
             end as sex from tb;

set @kk=(select name ,case when gender="M" then  "F" 
                  when gender="F" then "M"
                  else "not defined"
             end as sex from tb);

select @kk;


update tb inner join (select id, name ,case when gender="M" then  "F" 
											when gender="F" then "M"
											else "not defined"
                                            end as sex from tb) as kk on  kk.id=tb.id
 set tb.gender=kk.sex;

select * from tb;














