use brahmadb;
show tables ;

select * from class ;
select * from nari ;
desc nari ;
insert into nari (name ,lastname ) values ("name1","name2");
#this left join is A
select * from class left join nari on class.idclass=nari.id;
#this right join B
select * from class right join nari on class.idclass=nari.id ;
#this mysql do not have full outer join so we need to emulate outer join
select * from class left  join nari on class.idclass=nari.id
union
select * from class right join nari on class.idclass =nari.id ;
#inner join
select * from class inner join nari on class.idclass=nari.id ;



select * from nari left outer  join class on class.idclass =nari.id  where class.idclass is null;
