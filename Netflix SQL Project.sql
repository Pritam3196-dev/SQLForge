create table netflix(show_id varchar(20) primary key ,
                     type varchar(20) not null , 
					 title varchar(150) not null ,
					 director varchar(250) ,
					 Star_cast varchar(1000),
					 country varchar(200),
					 Date_added varchar(50),
					 release_year int,
					 rating varchar(10),
					 duration varchar(30),
					 listed_in varchar(100),
					 description varchar(300));


select * from netflix;



----------------------------- Analysis -----------------------------------------------

--1. Count the number of Movies vs TV Shows

select type , 
       count(type) as count_type 
	   from netflix group by type;


-- 2. Find the most common rating for movies and TV shows


with Max_rating AS(

     select type ,
	        rating , 
			count(rating) as rating_count , 
			Rank() over(partition by type order by count(rating) desc) as Rank_
			from netflix
			group by type , rating 

)

select * from max_rating where Rank_<=1;



--3. List all movies released in a specific year (e.g., 2020)


select title , 
       release_year  , 
	   type from netflix 
	   where (type = 'Movie' and release_year in
       (select release_year from netflix where release_year = 2020));


---or

select title , 
       release_year ,
       type from netflix
       where (type = 'Movie' and release_year 
	   in (select release_year from netflix where release_year = 2020))
       group by title , release_year ,type;



-- 4. Find the top 5 countries with the most content on Netflix

select country , 
	   count(title) as content_count
	   from netflix
	   group by country
	   order by count(title) desc limit 5;


-- or

with max_content_countries AS (

         select country ,
		        count(title) as content_count,
				Rank() over(order by count(title) desc) as Rank_content
				from netflix
				group by country
)


select * from max_content_countries where Rank_content <=5;
        

-- 5. Identify the longest movie

select max(duration) as longest_duration from netflix;


-- 6. Find content added in the last 5 years

select title , 
       release_year from netflix where release_year in (
               select distinct release_year from netflix order by release_year desc limit 5)

-- or


select title , 
       release_year from netflix where release_year in(
           select generate_series(extract(year from current_date) - 5 , 
		   extract(year from current_date))); 



-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!


select title , 
       type from netflix 
	   where director = 'Rajiv Chilaka';


-- 8. List all TV shows with more than 5 seasons

select title , 
       type , 
	   duration 
	   from netflix 
	   where (type ='TV Show' and  duration > '5 Seasons') ;


--or

select title , 
       type , 
	   duration from netflix 
	   where (type = 'TV Show' and duration > '5 Seasons')
       group by  title , type , duration;



-- 9. Count the number of content items in each genre


select listed_in as genre , 
       count(title) from netflix 
       group by listed_in 
	   order by count(title) desc;



--10.Find each year and the average numbers of content release in India on netflix. 

with average_number_contents_india AS(

select release_year , 
       count(title) as numbers_of_content from netflix 
	   where country = 'India'
       group by release_year 
	   order by count(title) desc
)
select release_year , 
        avg(numbers_of_content) as average_numbers_of_content
        from average_number_contents_india
		group by release_year
		order by avg(numbers_of_content) desc;

--11.return top 5 year with highest avg content release!

with average_counts_release_year AS(

      select release_year , 
             count(title) as counts_release_year 
	         from netflix group by release_year

)

     select release_year ,  
            avg(counts_release_year) as average_content_release 
            from average_counts_release_year group by release_year
            order by avg(counts_release_year) desc limit 5;

-- 12. Find all content without a director


select title , 
       director from netflix where director is null ;


-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years! 


select type , 
       release_year , 
       count(title) , 
	   star_cast from netflix 
       where star_cast like '%Salman Khan%' and type = 'Movie'
       group  by release_year , type , star_cast
       having release_year in 
       (select generate_series(extract(year from current_Date)- 10 , extract(year from current_Date)))
       order by release_year desc;

--or

select type , 
       release_year , 
	   count(title) , 
	   star_cast from netflix 
       where star_cast like '%Salman Khan%' and type = 'Movie' and release_year in 
       (select generate_series(extract(year from current_date) - 10 , extract(year from current_Date)))
       group  by release_year , type , star_cast
       order by release_year desc;

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.