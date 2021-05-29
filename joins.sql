with A as (select level as c from dual connect by level<10)
,
B as (select level+3 as c from dual connect by level<10 )

---  A is [1...9] and B is [4...12]
---NOTE : A is left table and B is right table  when we say  A join B 


--INNER JOIN
-- it will find record where a.id =b.id otherwords common element in both 
select A.c as a,B.c as B from A 
inner  join B on B.c=A.c 

--or by deafult it is inner join
select A.c as a,B.c as B from A 
   join B on B.c=A.c  

--inner join O/P

A	B
4	4
5	5
6	6
7	7
8	8
9	9

--LEFT JOIN 
--it will find record get all record of A and matched rcord of B with A 

select A.c as a,B.c as B from A 
left  join B on B.c=A.c 

--Left join O/P
A	B
4	4
5	5
6	6
7	7
8	8
9	9
1	-
2	-
3	-

--Only A 
select A.c as a,B.c as B from A 
 left   join B on B.c=A.c where b.c is null
 
 A	B
1	-
2	-
3	-

--RIGHT JOIN
--it will find record get all record of A and matched rcord of B with A 
select A.c as a,B.c as B from A 
right   join B on B.c=A.c 

--Right join output
A	B
4	4
5	5
6	6
7	7
8	8
9	9
-	11
-	12
-	10

--only B 
select A.c as a,B.c as B from A 
 right    join B on B.c=A.c where a.c is null
 
 A	B
-	11
-	12
-	10
 


--FULL JOIN --all a and all b 
select A.c as a,B.c as B from A 
 full  join B on B.c=A.c 
 
--O/P

A	B
4	4
5	5
6	6
7	7
8	8
9	9
-	10
-	11
-	12
1	-
2	-
3	-

--only A and only B 

select A.c as a,B.c as B from A 
 full    join B on B.c=A.c where a.c is null or b.c is null
 
 A	B
-	10
-	11
-	12
1	-
2	-
3	-

---------End of join -------------------------------

--Cartesian product AXB

select A.c as a,B.c as B from A 
 , B 
-O/P
A	B
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
2	4
2	5
2	6
2	7
2	8
2	9
2	10
2	11
2	12
3	4
3	5
3	6
3	7
3	8
3	9
3	10
3	11
3	12
4	4
4	5
4	6
4	7
4	8
4	9
4	10
4	11
4	12
5	4
5	5
5	6
5	7
5	8
5	9
5	10
5	11
5	12
6	4
6	5
6	6
6	7
6	8
6	9
6	10
6	11
6	12
7	4
7	5
7	6
7	7
7	8
7	9
7	10
7	11
7	12
8	4
8	5
8	6
8	7
8	8
8	9
8	10
8	11
8	12
9	4
9	5
9	6
9	7
9	8
9	9
9	10
9	11
9	12































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
