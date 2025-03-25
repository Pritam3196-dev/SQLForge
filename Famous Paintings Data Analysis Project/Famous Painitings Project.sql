--- Create database

Create database Famous_Paintings;


--- Use Famous_Paintings

Use Famous_Paintings;

----- Create the tables 

Create table artist(
                   artist_id int , 
				   full_name varchar(50),
				   first_name varchar(50),
				   middle_name varchar(50),
				   last_name varchar(50),
				   nationality varchar(30),
				   style varchar(50),
				   birth int , 
				   death int);

Create table Canvas_size(

                      size_id int ,
					  width int ,
					  height int , 
					  label varchar(50));

Create table Image_link(
                       
					   Work_id int ,
					   url varchar(450),
					   thumbnail_small_url varchar(450),
					   thumbnail_large_url varchar(450));


Create table Museum_hours(

                        museum_id int , 
						day varchar(30),
						open varchar(50),
						Close varchar(50));



Create table museum(

                    museum_id int , 
					name varchar(300),
					address varchar(100),
					city varchar(50),
					State varchar(50),
					Postal varchar(50),
					country varchar(50),
					Phone varchar(20),
					Url varchar(200));


create table product_size(

                         work_id int , 
						 size int ,
						 sale_price int , 
						 regular_price int));


Create table subject(

                       work_id int ,
					   subject varchar(50));


Create table work(

                       work_id int , 
					   name varchar(200) ,
					   artist_id int , 
					   style varchar(50),
					   museum_id int));




--- We check how many tables in database

select name from sys.tables;


-- We check each and every table

select * from artist;
select * from canvas_size;
select * from image_link;
select * from museum_hours;
select * from museum;
select * from product_size;
select * from subject;
select * from work;

--- Change name column of museum table to museum_name

Exec sp_rename 'museum.name' , 'museum_name' , 'COLUMN';

------------- Data Analysis -------------------------

-- 1.Fetch all the paintings which are not displayed on any museums ?

select work_id , 
       name , 
	   museum_id 
	   from work where museum_id is null;

-- or 

select work_id , 
       name , 
	   m.museum_id 
	   from museum as m right join work as w 
	   on m.museum_id = w.museum_id
       where m.museum_id is null;

-- 2. Are there museums without any paintings ?


select m.museum_id , 
       work_id , 
	   name 
	   from museum as m inner join work as w 
	   on m.museum_id = w.museum_id
       where work_id is null;


-- 3.How many paintings have an asking price of more than their regular price?

select p.work_id , 
       name , 
	   sale_price as asking_price , 
	   regular_price 
	   from work as w inner join product_size as p
       on w.work_id = p.work_id 
       where sale_price > regular_price
       order by p.work_id asc;


-- 4.Identify the paintings whose asking price is less than 50% of its regular price

select p.work_id , 
       name , 
	   sale_price as asking_price , 
	   regular_price ,
      concat(cast((cast(sale_price AS decimal(10,2)) / regular_price) * 100 AS decimal(10,2)) , ' %')
	  as percentage_ratio_asking_regular_price
      from product_size as p inner join work as w 
      on p.work_id = w.work_id 
      where (cast((cast(sale_price AS decimal(10,2)) / regular_price) * 100 AS decimal(10,2)) < 50.00 )
	  order by p.work_id;


-- 5.Which canva size costs the most?


select Top 1 size_id, 
       sale_price 
	   from product_size 
	   order by sale_price desc;

-- or


With most_cost_canva_size As(

                         select size_id , 
						        sale_price , 
                                Rank() over(order by sale_price desc) as Rank_sale_price
                                from product_size 
)

select * from most_cost_canva_size where Rank_sale_price <= 1;



-- 6.Delete duplicate records from work, product_size, subject and image_link tables

-- work

With work_table AS(


select * , 
       Row_number() over(partition by work_id order by  work_id asc) as Row_number_work_id 
       from work

)

Delete from work where work_id in (select work_id from work_table where Row_number_work_id >= 2);


-- product_size

With product_size_table AS(

select * , 
       Dense_Rank() over(partition by work_id order by sale_price asc) as Rank_work_id
       from product_size

)

Delete from product_size where work_id in (select work_id from product_size_table where Rank_work_id >= 2);


-- subject

With subject_table AS(

                    select work_id , 
					       subject , 
                           Dense_Rank() over(partition by work_id order by subject asc) as Rank_
                           from subject
)

Delete from subject where work_id in (select work_id from subject_table where Rank_ >= 2);


-- Image_link;


With image_link_table AS (
select * , Dense_Rank() over(partition by work_id order by url asc) as Rank_url
       from image_link

)

delete from image_link where work_id in (select work_id from image_link_table where Rank_url >= 2);


-- 7.Identify the museums with invalid city information in the given dataset


select * from museum where city not like '[A-Za-z]%';

-- or

select museum_id , museum_name , address , city , state from museum where city not like '[A-Za-z]%';


-- it match the first character from A-za-z and after that % indicates unknown lenth of string atfer first letter


-- 8.Museum_Hours table has 1 invalid entry. Identify it and remove it.

select * from museum_hours;

select museum_id , day from museum_hours group by museum_id , day  order by museum_id asc;

-- I don't understand context of question . actually it depends on each and every person understanding and thinking
-- but from my understanding , in day column we have thursday (day) is incorrect in spelling . It is Thusday in table.


Delete from museum_hours where day in (select day from museum_hours where day = 'Thusday');



-- 9.Fetch the top 10 most famous painting subject




select Top 10 subject  , 
       count(work_id) as No_of_paintings 
       from subject 
	   group by subject 
	   order by count(work_id) desc;


-- or 

select Top 10 subject , 
       count(w.work_id) as No_of_paintings , 
	   count(name) as No_of_paintings_name
	   from subject as s inner join work as w 
	   on s.work_id = w.work_id 
	   group by subject
	   order by No_of_paintings_name desc;


-- or 

With Top_ten_famous_paintings AS(
select subject  , 
       count(w.work_id) as No_of_paintings , 
	   count(name) as No_of_paintings_name,
       Dense_Rank() over(order by count(w.work_id) desc) as Rank_no_of_paintings
       from subject as s inner join work as w on s.work_id = w.work_id 
       group by subject

)

select * from Top_ten_famous_paintings where Rank_no_of_paintings <= 10;



-- 10.dentify the museums which are open on both Sunday and Monday. Display
-- museum name, city

-- rename open column as open_museum_time

Exec sp_rename 'museum_hours.open' , 'open_museum_time' , 'COLUMN';
Exec sp_rename 'museum_hours.close' , 'close_museum_time' , 'COLUMN';


select m.museum_id , 
       museum_name , 
	   city , 
	   count(distinct day) as No_of_day_open
       from museum as m inner join museum_hours as mh on m.museum_id = mh.museum_id
       where day in ('Sunday' , 'monday') group by m.museum_id , museum_name , city
       having count(distinct day) = 2;


-- or 



select m.museum_id , 
       museum_name , 
	   city , 
	   count(distinct day) as No_of_day_open
       from museum as m inner join museum_hours as mh 
	   on m.museum_id = mh.museum_id
       where day = 'Sunday' or day = 'monday' 
	   group by m.museum_id , museum_name , city
       having count(distinct day) = 2;


--- Here logic is first of all we filter the museums which open for sunday or monday (in operator is works like or
--- operator) so , it get only that records which having sunday or monday but we want both sunday and monday for 
--- single museum so for that reason we again filter the group by column(museum_id , muesum_name) by
--- having clause (having cluase always filter group by column) so we take only those museum which having count
--- of distinct day is 2 means which group by column (museum_id , museum_name) having count of distinct days are 
--- only 2 (sunday , monday) only that records or museum returns 


-- 11.How many museums are open every single day?


select mh.museum_id , 
       museum_name as no_of_days 
	   from museum as m inner join museum_hours as mh 
	   on m.museum_id = mh.museum_id
       where day in ('Sunday','Monday','Tuesday','Wednesday','Thursday' ,'Friday' ,'Saturday')
       group by mh.museum_id , museum_name
       having count(day) = 7;

-- or 


select mh.museum_id , 
       museum_name  
	   from museum as m inner join museum_hours as mh 
	   on m.museum_id = mh.museum_id
       where day = 'Sunday' or day = 'Monday' or day = 'Tuesday'  or  day = 'Wednesday' or day =  'Thursday' 
	   or day = 'Friday' or day = 'Saturday'
       group by mh.museum_id , museum_name
	   having count(day) = 7;

-- or

With museum_open_for_seven_days AS(

                 select m.museum_id , 
				        museum_name, 
						day ,
                        Dense_Rank() over(partition by m.museum_id order by day asc) as Rank_days
                        from museum_hours as mh inner join museum as m 
						on mh.museum_id = m.museum_id

)

select museum_id , 
       museum_name , 
	   count(day) as No_of_dys  
	   from museum_open_for_seven_days
       group by museum_id ,museum_name
       having count(Rank_days) = 7;

-- or


select m.museum_id , 
       museum_name , 
	   count(day) as no_of_days 
	   from museum as m inner join museum_hours as mh 
	   on m.museum_id = mh.museum_id 
	   group by m.museum_id , museum_name
       having count(day) = 7;



-- 12.Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum

select Top 5 w.museum_id , 
       museum_name , 
	   count(work_id) as No_of_paintings , 
	   count(name) as No_of_paintings_name 
       from museum as m inner join work as w 
       on m.museum_id = w.museum_id group by w.museum_id , museum_name
       order by count(work_id) desc;


-- Here you can take only work_id also . I was took for just quriosity is that all have different name;


-- or


With Top_five_museums AS(

                        select m.museum_id , 
						       museum_name , 
							   count(work_id) as No_of_paintings , 
                               Dense_Rank() over(order by count(work_id) desc) as Rank_paintings
                               from museum as m inner join work as w
                               on m.museum_id = w.museum_id group by m.museum_id , museum_name 

)

select * from Top_five_museums where Rank_paintings <= 5;


-- 13.Who are the top 5 most popular artist? (Popularity is defined based on most no of
--     paintings done by an artist)


select Top 5 w.artist_id , 
       full_name as artist_name , 
	   count(work_id) as No_of_paintings 
	   from artist as a inner join work as w 
       on a.artist_id = w.artist_id 
	   group by w.artist_id , full_name 
	   order by No_of_paintings desc;


-- or


With Top_five_artist AS(

                        select w.artist_id , 
						       full_name as Artist_name , 
							   count(work_id) as No_of_paintings ,
                               Dense_Rank() over(order by count(work_id) desc) as Rank_paintings
                               from artist as a inner join work as w 
                               on a.artist_id = w.artist_id 
							   group by w.artist_id , full_name

)

select * from Top_five_artist where Rank_paintings <= 5;


-- 14.Which museum is open for the longest during a day. Dispay museum name, state
--    and hours open and which day?


select Top 2 m.museum_id , 
       museum_name , 
	   state , 
	   datediff(hour , open_museum_time , close_museum_time) as Hours_open ,
	   day
       from museum as m inner join museum_hours as mh
       on m.museum_id = mh.museum_id
	   order by Hours_open desc;


--- or 


With Longest_open_hours_museum AS(

         select mh.museum_id , 
                museum_name , 
	            state , 
	            datediff(hour , open_museum_time , close_museum_time) as No_of_hours_open,
                day  ,
	            Dense_Rank() over(order by datediff(hour , open_museum_time , close_museum_time) desc) as Rank_hours 
	            from museum as m inner join museum_hours as mh 
	            on m.museum_id = mh.museum_id

)

select * from Longest_open_hours_museum where Rank_hours <= 1;



-- 15.Which museum has the most no of most popular painting style?

select Top 1 m.museum_id , 
       museum_name  , 
	   count(style) as No_of_style 
	   from museum as m inner join work as w 
       on m.museum_id = w.museum_id
       group by m.museum_id , museum_name 
	   order by No_of_style desc;


-- or 


With Most_popular_painting_style AS(

select w.museum_id , 
       museum_name , 
	   count(style) as No_of_paintings ,
       Dense_Rank() over(order by count(style) desc) as Rank_style
       from work as w inner join museum as m 
	   on w.museum_id = m.museum_id
       group by w.museum_id  , museum_name

)


select * from most_popular_painting_style where Rank_style <= 1;


-- 16.Identify the artists whose paintings are displayed in multiple countries


select a.artist_id , 
       full_name  as Artist_name , 
	   count(country) as No_of_countries  , 
	   Dense_Rank() over(order by count(country) desc) as Rank_countries
	   from artist as a inner join work as w 
       on a.artist_id = w.artist_id 
	   inner join museum as m 
	   on w.museum_id = m.museum_id
       group by a.artist_id , full_name 
	   order by No_of_countries desc;


-- 17.Display the country and the city with most no of museums. Output 2 seperate columns to mention the city 
-- and country. If there are multiple value, seperate them with comma.

select country , 
       city , 
	   count(museum_id) as No_of_museums from museum 
       where city like '[A-Za-z]%'
       group by country , city
       order by country asc;


-- 18.Identify the artist and the museum where the most expensive and least expensive painting is placed. 
-- Display the artist name, sale_price, painting name, museum , name , museum city and canvas label

select full_name as Artist_name , 
       sale_price , 
	   name as Painting_Name , 
	   m.museum_id , 
	   museum_name , 
	   city , 
	   label 
       from artist as a inner join work as w
       on a.artist_id = w.artist_id 
	   inner join product_size as p 
	   on w.work_id = p.work_id
       inner join canvas_size as c on cast(p.size_id As decimal(10,2))  = Cast(c.size_id AS decimal(10,2)) inner join museum as m on w.museum_id = m.museum_id
       where (p.size_id in (select size_id from product_size where size_id not like '#VALUE!') 
       and sale_price in (select max(sale_price) from product_size))
       or (p.size_id in (select size_id from product_size where size_id not like '#VALUE!') 
       and sale_price in (select min(sale_price) from product_size))
	   order by sale_price desc;


-- or 


With Most_least_expensive As(

select full_name as Artist_name , 
       sale_price , 
	   name as Painting_name , 
	   m.museum_id , 
	   museum_name , 
	   city , 
	   label ,
       Dense_Rank() over(order by sale_price desc) as Rank_sale_price 
       from artist as a inner join work as w
       on a.artist_id = w.artist_id inner join product_size as p 
	   on w.work_id = p.work_id
       inner join canvas_size as c on cast(p.size_id As decimal(10,2))  = Cast(c.size_id AS decimal(10,2)) 
	   inner join museum as m 
	   on w.museum_id = m.museum_id
       where (p.size_id in (select size_id from product_size where size_id not like '#VALUE!') 
       and sale_price in (select max(sale_price) from product_size))
       or (p.size_id in (select size_id from product_size where size_id not like '#VALUE!') 
       and sale_price in (select min(sale_price) from product_size))

)

select * ,
       case 
           WHEN Rank_sale_price = 1 THEN 'Expensive Painting'
           ELSE 'InExpensive Painting'
       END as Expensive_Inexpensive
       from Most_least_expensive ;



-- 19.Which country has the 5th highest no of paintings?

With fifth_most_paintings_country AS(

                  select country , 
				         count(w.work_id) as No_of_paintings,
                         Rank() over(order by count(w.work_id) desc) as Rank_no_of_paintings
                         from work as w inner join museum as m 
						 on w.museum_id = m.museum_id
                         group by country

)

select * from fifth_most_paintings_country where Rank_no_of_paintings = 5;


-- 20.Which are the 3 most popular and 3 least popular painting styles?

With Top_three_most_popular AS(

select style , 
       count(work_id) as No_of_paintings_Top , 
       Dense_rank() over(order by count(work_id) desc) as Rank_paintings_Top
       from work where style is not null group by style

)

select * from Top_three_most_popular where Rank_paintings_Top <= 3;


With Least_three_popular AS (

                 select style , 
				        count(work_id) as No_of_paintings_least , 
                        Dense_rank() over(order by count(work_id) asc) as Rank_Paintings_least
                        from work where style is not null group by style
)

select * from Least_three_popular where Rank_paintings_least <= 3;

-- 21.Which artist has the most no of Portraits paintings outside USA?. Display artist ,
-- name, no of paintings and the artist nationality.

select Top 2 full_name as artist_name , 
       count(w.work_id) as No_of_portraits_paintings , 
	   nationality 
	   from artist as a inner join work as w
       on a.artist_id = w.artist_id 
       inner join museum as m 
       on w.museum_id = m.museum_id
       inner join subject as s on w.work_id = s.work_id
       where country != 'USA' and subject = 'Portraits'
       group by full_name , nationality
       order by No_of_portraits_paintings desc;

-- There are actually two artists have same no_of_paintings so we mentioned there Top 2; 


-- or 



With Top_two_artist_paintings_outside_USA AS(

select full_name as artist_name , 
       count(w.work_id) as no_of_portraits_paintings , 
	   nationality as Artist_nationality,
       Dense_Rank() over(order by count(w.work_id) desc) as Rank_no_of_paintings
       from artist as a inner join work as w on a.artist_id = w.artist_id
       inner join museum as m on w.museum_id = m.museum_id 
       inner join subject as s on w.work_id = s.work_id
       where country != 'USA' and subject = 'Portraits'
       group by full_name , nationality 

)

select * from Top_two_artist_paintings_outside_USA where Rank_no_of_paintings <= 1;


