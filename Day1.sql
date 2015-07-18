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



select name into @ss from tb where id=2; 
select @ss;



select "commint" into @so;

select  @para;






insert into tb1(name,gender) value ("lipu",1),("lipu2",2),("lipu3",2),("lipu4",1),("lipu5",2);

insert into tb2 (idtb2,gen) values (1,"male"),(2,"female");

insert into tb2 (idtb2,gen) values (3,"transgender");

select * from tb2;


delete from tb2 where gen="male";

create  index ind4 on tb1 (gender);

show index from tb1;

drop index ind4 on tb1;

# creating strored procedure 

drop procedure if exists hello;
delimiter //


create procedure hello(in ss varchar(222))
begin 
select * from tb1 where name =ss;
end //
call hello("lipu2");















