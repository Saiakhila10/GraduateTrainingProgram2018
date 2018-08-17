Create table Location (locationid number primary key, name varchar2(30), sunlight number, water number); 
Create table Gardener (gardenerid number primary key, name varchar2(30), age number); 
Create table Plant (plantid number primary key, name varchar2(30), sunlight number, water number, weight number); 
Create table planted (plantFK number, gardenerFK number, locationFK number, date1 date, seeds number, foreign key(plantFK) references plant(plantid), foreign key(gardenerFK) references gardener(gardenerid), foreign key(locationFK) references location(locationid)); 
Create table picked (plantFK number, gardenerFK number, locationFK number, date1 date, amount number, weight number, foreign key(plantFK) references plant(plantid), foreign key(gardenerFK) references gardener(gardenerid), foreign key(locationFK) references location(locationid)); 

Insert into location values(0, 'East', .28, .80); 
Insert into location values(1, 'North', .17, .84); 
Insert into location values(2, 'West', .38, .48); 
Insert into location values(3, 'South', .45, .66); 

Insert into gardener values(0, 'Mother', 36); 
Insert into gardener values(1, 'Father', 38); 
Insert into gardener values(2, 'Tim', 15); 
Insert into gardener values(3, 'Erin', 12); 

Insert into plant values(0, 'Carrot', .26, .82, .08); 
Insert into plant values(1, 'Beet', .44, .80, .04); 
Insert into plant values(2, 'Corn', .44, .76, .26); 
Insert into plant values(3, 'Tomato', .42, .80, .16); 
Insert into plant values(4, 'Radish', .28, .84, .02); 
Insert into plant values(5, 'Lettuce', .29, .85, .03); 

Insert into planted values(0, 0, 0 , '18-APR-2012', 28); 
Insert into planted values(0, 1, 1 , '14-APR-2012', 14); 
Insert into planted values(1, 0, 2 , '18-APR-2012', 36); 
Insert into planted values(2, 1, 3 , '14-APR-2012', 20); 
Insert into planted values(2, 2, 2 , '19-APR-2012', 12); 
Insert into planted values(3, 3, 3 , '25-APR-2012', 38); 
Insert into planted values(4, 2, 0 , '30-APR-2012', 30); 
Insert into planted values(5, 2, 0 , '15-APR-2012', 30); 

Insert into picked values(0, 2, 0 , '18-AUG-2012', 28, 2.32); 
Insert into picked values(0, 3, 1 , '16-AUG-2012', 12, 1.02); 
Insert into picked values(2, 1, 3 , '22-AUG-2012', 52, 12.96); 
Insert into picked values(2, 2, 2 , '28-AUG-2012', 18, 4.58); 
Insert into picked values(3, 3, 3 , '22-AUG-2012', 15, 3.84); 
Insert into picked values(4, 2, 0 , '16-JUL-2012', 23, 0.52); 

1.Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden:
 select sum(p.weight) from picked p inner join plant pl on p.plantFK=pl.plantid where name='Corn';
17.54

3.Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores Experience of the of person. How will you modify this to varchar2(30).
alter table gardener add(Exper Number(30));
alter table gardener modify Exper varchar2(30);

4.Write a query to find the plant name which required seeds less than 20 which plant on 14-APR
select p.name from plant p inner join planted pl on p.plantid=pl.plantFK where seeds<20  and date='2012-04-14';
carrot

5.List the amount of sunlight and water to all plants with names that start with letter 'c' or letter 'r'.
select name,sunlight,water from plant where name like 'C%' or name like 'R%';
Carrot|0.26|0.82
Corn|0.44|0.76
Radish|0.28|0.84

6.Write a valid SQL statement that displays the plant name and the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name.
select name p,sum(pl.seeds) from plant p inner join planted pl on p.plantid=pl.plantFK group by name order by name desc;
Tomato|38
Radish|30
Lettuce|30
Corn|32
Carrot|42
Beet|36

7.Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:( (Average Number of Items = Total Amount Picked / Total Seeds Planted.)
select sum(pi.amount)/sum(p.seeds) as average,pl.name from planted p inner join picked pi on p.plantFK=pi.plantFK inner join plant pl on pl.plantid=p.plantFK group by name;
0|Carrot
2|Corn
0|Radish
0|Tomato

8.Write a valid SQL statement that would produce a result set like the following:
select g.name.p.name,pi.date1,pi.amount from gardener g inner join picked pi  on g.gardenerid=pi.gardenerFK  inner join plant p on p.plantid=pi.plantFK where g.name='Tim' and amount>20 order by amount;
 name |  name  |    date    | amount 
------|--------|------------|-------- 
 Tim  | Radish | 2012-07-16 |     23 
 Tim  | Carrot | 2012-08-18 |     28 

