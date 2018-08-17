problemset03 17 august 2018
submitted by sai.akhila.potluri@accenture.com

create table movie(mid number(4) constraint mkey primary key,title varchar2(20),year number(4), director varchar(15));
create table reviewer(rid number(3) comstraint rkey primary key,name varchar2(20));
create table rating(rid number(4) constraint frkey references reviewer(rid),mid number(3) constraint fmkey references movie(mid),stars number(2),ratingDate date);

insert into movie values(101,'gone with the wind',1939,'victor fleming');
insert into movie values(102,'star wars',1977,'george wise');
insert into movie values(103,'the sound of music',1965,'robert wise');
insert into movie values(104,'e.t',1982,'steven spielberg');
insert into movie values(105,'titanic',1997,'james cameron');
insert into movie values(106,'snow white',1937,null);
insert into movie values(107,'avatar',2009,'james cameron');
insert into movie values(108,'raiders of teh lost ark',1981,'steven spielberg');

insert into reviewer values(201, 'Sarah Martinez');
insert into reviewer values(202, 'Daniel Lewis');
insert into reviewer values(203, 'Brittany Harri');
insert into reviewer values(204, 'Mike Anderson');
insert into reviewer values(205, 'Chris Jackson');
insert into reviewer values(206, 'Elizabeth Thomas');
insert into reviewer values(207, 'James Cameron');
insert into reviewer values(208, 'Ashley White');

insert into rating values(201, 101, 2, '2011-01-22');
insert into rating values(201, 101, 4, '2011-01-27');
insert into rating values(202, 106, 4, null);
insert into rating values(203, 103, 2, '2011-01-20');
insert into rating values(203, 108, 4, '2011-01-12');
insert into rating values(203, 108, 2, '2011-01-30');
insert into rating values(204, 101, 3, '2011-01-09');
insert into rating values(205, 103, 3, '2011-01-27');
insert into rating values(205, 104, 2, '2011-01-22');
insert into rating values(205, 108, 4, null);
insert into rating values(206, 107, 3, '2011-01-15');
insert into rating values(206, 106, 5, '2011-01-19');
insert into rating values(207, 107, 5, '2011-01-20');
insert into rating values(208, 104, 3, '2011-01-02');



1.Find the titles of all movies directed by Steven Spielberg. (1 point possible)
select title,director from movie where director='steven spielberg';
e.t|steven spielberg
raiders of teh lost ark|steven spielberg

2.Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. (1 point possible)
select m.year,r.stars from rating r inner join movie m on m.mid=r.mid where r.stars=4 or r.stars=5 order by r.stars,m.year;
1937|4
1939|4
1981|4
1981|4
1937|5
2009|5

3.Find the titles of all movies that have no ratings. (1 point possible)
select title from movie where mid not in(select mid from rating);
star wars 
titanic

4.Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. (1 point possible)
select r.name,ra.stars from reviewer r inner join rating ra on r.rid=ra.rid  where ratingDate is null;
Daniel Lewis|4
Chris Jackson|4

5.Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars.
select r.name,m.title,ra.stars,ra.ratingDate from movie m inner join rating ra on m.mid=ra.mid inner join reviewer r on r.rid=ra.rid order by r.name,m.title,ra.stars;
Ashley White|e.t|3|2011-01-02
Brittany Harris|raiders of teh lost ark|2|2011-01-30
Brittany Harris|raiders of teh lost ark|4|2011-01-12
Brittany Harris|the sound of music|2|2011-01-20
Chris Jackson|e.t|2|2011-01-22
Chris Jackson|raiders of teh lost ark|4|
Chris Jackson|the sound of music|3|2011-01-27
Daniel Lewis|snow white|4|
Elizabeth Thomas|avatar|3|2011-01-15
Elizabeth Thomas|snow white|5|2011-01-19
James Cameron|avatar|5|2011-01-20
Mike Anderson|gone with the wind|3|2011-01-09
Sarah Martinez|gone with the wind|2|2011-01-22
Sarah Martinez|gone with the wind|4|2011-01-27


7.For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. (1 point possible)
select m.title,max(r.stars) from movie m inner join rating r on m.mid=r.mid  group by m.title order by m.title;
avatar|5
e.t|3
gone with the wind|4
raiders of teh lost ark|4
snow white|5
the sound of music|3

8.For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. (1 point possible)
select m.title,max(r.stars)-min(r.stars) as ratingspread from movie m inner join rating r on m.mid=r.mid group by m.title order by ratingspread desc,m.tile;
avatar|2
gone with the wind|2
raiders of teh lost ark|2
e.t|1
snow white|1
the sound of music|1


10.Find the names of all reviewers who rated Gone with the Wind. (1 point possible)
select r.name,m.title from reviewer r inner join rating ra on r.rid=ra.rid inner join movie m on m.mid=ra.mid where m.title='gone with the wind';
Sarah Martinez|gone with the wind
Sarah Martinez|gone with the wind
Mike Anderson|gone with the wind

12.Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) (1 point possible)
 select r.name,m.title from rating ra inner join movie m on m.mid=ra.mid inner join reviewer r on r.rid=ra.rid order by r.name,m.title;
Ashley White|e.t
Brittany Harris|raiders of teh lost ark
Brittany Harris|raiders of teh lost ark
Brittany Harris|the sound of music
Chris Jackson|e.t
Chris Jackson|raiders of teh lost ark
Chris Jackson|the sound of music
Daniel Lewis|snow white
Elizabeth Thomas|avatar
Elizabeth Thomas|snow white
James Cameron|avatar
Mike Anderson|gone with the wind
Sarah Martinez|gone with the wind
Sarah Martinez|gone with the wind

11.For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. (1 point possible)
select r.name,m.title,ra.stars from  movie m inner join rating ra on m.mid=ra.mid inner join reviewer r on r.rid=ra.rid where m.director=r.name;
james cameron|avatar|5

13.Find the titles of all movies not reviewed by Chris Jackson. (1 point possible)
select title from movie where mid not in(select ra.mid from rating ra inner join reviewer r on r.rid=ra.rid where r.name='Chris Jackson');
gone with the wind
star wars
titanic
snow white
avatar


15.For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars. (1 point possible)
select r.name,m.title,min(ra.stars) from movie m inner join rating ra on m.mid=ra.mid inner join reviewer r on r.rid=ra.rid group by r.name;
Ashley White|e.t|3
Brittany Harris|the sound of music|2
Chris Jackson|e.t|2
Daniel Lewis|snow white|4
Elizabeth Thomas|avatar|3
James Cameron|avatar|5
Mike Anderson|gone with the wind|3
Sarah Martinez|gone with the wind|2

16.List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. (1 point possible)
select m.title,avg(r.stars) from movies m inner join rating r on m.mid=r.mid group by m.title order by avg(r.stars) desc,m.title;
snow white|4.5
avatar|4.0
raiders of teh lost ark|3.33333333333333
gone with the wind|3.0
e.t|2.5
the sound of music|2.5

17.Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.) (1 point possible)
select r.name,count(ra.stars) from reviewer r inner join rating ra on r.rid=ra.rid group by r.name having count(ra.stars)>=3;
Brittany Harris|3
Chris Jackson|3

18.Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. (As an extra challenge, try writing the query both with and without COUNT.) (1 point possible)
 select title,director from movie where director in(select director from movie group by director having count(title)>1) order by director,title;
avatar|james cameron
titanic|james cameron
e.t|steven spielberg
raiders of teh lost ark|steven spielberg

19.Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.) (1 point possible)
select m.title,avg(r.stars) as average from movie m inner join rating r on m.mid=r.mid group by m.title having average>(select avg(stars) from rating);
avatar|4.0
raiders of teh lost ark|3.33333333333333
snow white|4.5

20.Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.) (1 point possible)
select m.title,avg(r.stars) as average from movie m inner join rating r on m.mid=r.mid group by m.title having average<(select avg(stars) from rating);
e.t|2.5
gone with the wind|3.0
the sound of music|2.5

21.For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL. (1 point possible)
select m.director,m.title,max(r.stars) from movie m inner join rating r on m.mid=r.mid where m.director is not null group by m.director where m.director ;
james cameron|avatar|5
robert wise|the sound of music|3
steven spielberg|raiders of teh lost ark|4
victor fleming|gone with the wind|4
