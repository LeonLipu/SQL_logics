
-- Get the table 
with T as (select * from (select level as c1 from dual connect by level <4) , (select level as c2 from dual connect by level<4))

select * from T

O/P
C1	C2
1	1
1	2
1	3
2	1
2	2
2	3
3	1
3	2
3	3


--OVER () means on total table 

select c1, sum(C2) over () as total  from T

C1	TOTAL
1	18
1	18
1	18
2	18
2	18
2	18
3	18
3	18
3	18

--Over (partition by c1 ) , it will partiton by each value of C1 


select c1, sum(C2) over (partition by c1 ) as total  from T

C1	TOTAL
1	6
1	6
1	6
2	6
2	6
2	6
3	6
3	6
3	6



--Over (partition by C1 order by c2 ) , it will partition by c1 of each value of c1 and order by each value of c2 

with T as (select * from (select level as c1 from dual connect by level <4) , (select level as c2 from dual connect by level<5))
select c1, sum(C2) over (partition by c1 order by c2) as total  from T

C1	TOTAL
1	1
1	3
1	6
1	10
2	1
2	3
2	6
2	10
3	1
3	3
3	6
3	10

--Over (partition by C1 order by C2 rows between unbounded preceding and current row ) --it partiton by C1 for each value and order by C2 for each value 


select c1, sum(C2) over (partition by c1 order by c2 rows between  unbounded preceding and current row ) as total  from T

-- rows/range
--ex: here for partition  1 of C2  , 1st row unbounded preceding -null current row  -1 sum(null  +1)
 --1 of C2  , 2st row unbounded preceding -1 current row  -2      sum(null+1 +2)=3 
 --1 of C2  , 3rd row unbounded preceding -1,2 current row  -3    sum(null+1+2  +3)
 --1 of C2  , 4th row unbounded preceding -1,2,3 current row  -4

ROWNUM	C1	TOTAL
1	1	1
2	1	3
3	1	6
4	1	10
5	2	1
6	2	3
7	2	6
8	2	10
9	3	1
10	3	3
11	3	6
12	3	10



--Over(partiton by C1 order by C1 rows between 1 preceding and current row ) 

select rownum, c1, sum(C2) over (partition by c1 order by c2 rows between  1 preceding and current row ) as total  from T

--ex: here for partition  1 of C2  , 1st row unbounded preceding -null current row  -1   sum(null+1)=1
 --1 of C2  , 2st row  1 preceding -1 current row  -2   sum(1+2)=3
 --1 of C2  , 3rd row  1 preceding -2 current row  -3   sum(2+3)=5
 --1 of C2  , 4th row  1 preceding -3 current row  -4   sum(3+4)=7
 

-- Like wise we can have 
--Over(partiton by C1 order by C1 rows between unbounded preceding and unbounded following  ) 
--Over(partiton by C1 order by C1 rows between current row  and 1 following  ) 
--Over(partiton by C1 order by C1 rows between current row  and unbounded following  ) 

ROWNUM	C1	TOTAL
1	1	1
2	1	3
3	1	5
4	1	7
5	2	1
6	2	3
7	2	5
8	2	7
9	3	1
10	3	3
11	3	5
12	3	7


-- WITHIN GROUP ()

---It is used by aggrate value 

with T as (select * from (select level as c1 from dual connect by level <4) , (select level as c2 from dual connect by level<5))

select  c1, listagg(c2) within group (order by c2) from T GROUP BY C1 


--Some other agg function 
with T as (select * from (select level as c1 from dual connect by level <4) , (select level as c2 from dual connect by level<5))

select 

listagg(c2,',') within group(order by c2) listagg, Rtrim(Xmlagg (Xmlelement (e, c2||',')).extract  ( '//../text()' ), ',') xmlagg ,json_arrayagg(json_object(c2) order by c2),xmlagg(xmlelement(x,c2) ) jsonagg, json_objectagg(key 'P' value c2) jsonagg, json_query(json_objectagg(key 'P'||c2  value c2),'$.P2' with CONDITIONAL  wrapper ) jsqonquery 
,json_value(json_objectagg(key 'P'||c2  value c2),'$.P3' ) jsonvalue

 --xmlelement(k,c1), json_object(c1,c2) 
 
 from T

group by c1

LISTAGG	XMLAGG	JSON_ARRAYAGG(JSON_OBJECT(C2)ORDERBYC2)	JSONAGG	JSONAGG	JSQONQUERY	JSONVALUE
1,2,3,4	1,4,3,2	[{"c2":1},{"c2":2},{"c2":3},{"c2":4}]	<X>1</X><X>4</X><X>3</X><X>2</X>	{"P":1,"P":4,"P":3,"P":2}	[2]	3
1,2,3,4	1,4,3,2	[{"c2":1},{"c2":2},{"c2":3},{"c2":4}]	<X>1</X><X>4</X><X>3</X><X>2</X>	{"P":1,"P":4,"P":3,"P":2}	[2]	3
1,2,3,4	1,4,3,2	[{"c2":1},{"c2":2},{"c2":3},{"c2":4}]	<X>1</X><X>4</X><X>3</X><X>2</X>	{"P":1,"P":4,"P":3,"P":2}	[2]	3








-- how to export data to mysql file from database
mysqldump -u username -p password > mysqlfile.sql

-- to make it compress

tar zcf dump.tar.gz mysqlfile.sql

-- to extract

tar zxf dump.tar.gz


-- how to insert random value into table

floor(rand()*91)+10

floor(rand()*max-min+1)+min
