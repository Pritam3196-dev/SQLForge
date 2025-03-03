--- Create Database;

create database Zomato Project;


-- Use Zomato database

Use zomato Project;


---- Database contains single table only 

Create table zomato(

          Restaurant_ID int primary key ,
		  Restaurant_Name varchar(60),
		  Country_Code int ,
		  City varchar(30),
		  Cuisines varchar(100) ,
		  Average_Cost_of_two int ,
		  Currency varchar(30),
		  Has_Table_Booking varchar(10),
		  Has_Online_Delivery varchar(10),
		  Aggregate_rating decimal(10,1) ,
		  votes int );



---- Check How table is created

select * from zomato;



-- 1: View the First Few Records

select * from zomato limit 10;


-- 2: Restaurants Offering Both Table Booking and Online Delivery

select Restaurant_name , 
       has_table_booking , 
	   has_online_delivery
       from zomato where has_table_booking in 
	   (select has_table_booking from zomato where has_table_booking = 'Yes')
       and has_online_delivery in (select has_online_delivery from zomato where has_online_delivery = 'Yes');


-- 3: count the number of restraunts in each city

select city ,
       count(restaurant_id) as No_of_restaurants 
	   from zomato group by city 
       order by No_of_restaurants desc;
	   

-- 4: get the restraunt with heighest rating


select restaurant_name , 
       aggregate_rating
       from zomato where aggregate_rating in (select max(aggregate_rating) from zomato);
	   

---- or

select restaurant_name , 
       aggregate_rating from zomato order by aggregate_rating desc limit 61;


--- or


With highest_aggregate_rating AS(

                                 select restaurant_name , 
						                aggregate_rating  , 
								        Dense_Rank() over(order by aggregate_rating desc) as Dense_Rank_rating
                                       from zomato order by aggregate_rating desc

)

select * from highest_aggregate_rating where Dense_Rank_rating <= 1;

		  
-- 5: find the average of average_cost_for_two in each city 


select city , 
       cast(avg(average_cost_of_two) AS decimal(10,2)) as average_of_average_cost_of_two 
	   from zomato group by city
       order by average_of_average_cost_of_two desc;


-- 6: identify restraunts offering online delivery


select restaurant_name , 
       city,
       has_online_delivery from zomato where has_online_delivery in 
	   (select has_online_delivery from zomato where has_online_delivery = 'Yes')
       order by restaurant_name asc;



-- or


--Here actually restaurant_name are not duplicates or not repeated records so thats why there is no need to
-- group by but in general scenario group by is good appproach because in real time scenario possibility
-- of duplication of data;


select restaurant_name , 
       city,
       has_online_delivery from zomato 
       where has_online_delivery in (select has_online_delivery from zomato where has_online_delivery = 'Yes') 
	   group by restaurant_name , city , has_online_delivery
       order by restaurant_name asc;



-- 7: Find Restaurants with Average Cost Greater Than a Specific Value -300000


select restaurant_name , 
       average_cost_of_two
       from zomato where average_cost_of_two > 300000 
       group by restaurant_name , average_cost_of_two
	   order by average_cost_of_two desc;



-- 8:Top Rated Restaurants in Each City (4.9)

select city , 
       restaurant_name , 
	   aggregate_rating from zomato where aggregate_rating in
       (select max(aggregate_rating) from zomato) 
	   group by city , restaurant_name,aggregate_rating;


-- 9:Restaurants with Low Cost but High Ratings-- cost < 100000 , rating > 4

select restaurant_name , 
       average_cost_of_two, 
	   aggregate_rating from zomato 
       where average_cost_of_two in (select average_cost_of_two from zomato where average_cost_of_two < 100000)
	   and aggregate_rating in (select aggregate_rating from zomato where aggregate_rating > 4.00)
	   order by average_cost_of_two asc , aggregate_rating desc;



-- 10.Cities with the Most Votes

select city , 
       sum(votes) as votes_in_city from zomato group by city
       order by votes_in_city desc;


-- 11.Identify the most popular cuisine in each city based on votes.


With most_poppular_cuisines AS(
                               
							   select city , 
							          cuisines , 
									  sum(votes) as Total_votes,
                                     Rank() over(partition by city order by sum(votes) desc) as Rank_cuisines
                                     from zomato group by city , cuisines order by city

)

select * from most_poppular_cuisines where Rank_cuisines <=1;




-- 12.Find the percentage of restaurants that offer table bookings and online delivery for each city.


---- count(restaurants offer both in city) / count(total restaurants in city) 

With percentage_restaurants AS(
                          
						       select city , 
							   cast(count(restaurant_id) AS decimal(10,2)) as no_of_restaurants_in_city , 
			                   cast(count(case
                                              WHEN has_table_booking ='Yes' and has_online_delivery ='Yes' THEN 1
	                           END) AS decimal(10,2)) as NO_of_restaurants_offer_table_and_online
                               from zomato group by city

                           )

select *  , 
       cast(NO_of_restaurants_offer_table_and_online / no_of_restaurants_in_city * 100 AS decimal(10,2)) 
	   as restaurant_percentage 
       from percentage_restaurants order by restaurant_percentage desc;