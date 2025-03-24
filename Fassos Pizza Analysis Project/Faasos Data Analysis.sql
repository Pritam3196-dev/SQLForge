-- Create Database 

Create database Faasos;

-- Use Faasos 

Use Faasos;


-- Create table

create table Driver(
 
             Driver_id int , 
			 reg_date date);



create table Ingredients(
 
             Ingredients_id int , 
			 Ingredients_name varchar(60));


create table rolls(

             roll_id int ,
			 roll_name varchar(30));



create table rolls_recipe(

             roll_id int , 
			 Ingredients varchar(25));


create table driver_order(

              order_id int , 
			  driver_id int ,
			  pickup_time datetime ,
			  distance varchar(20),
			  Duration varchar(30),
			  cancelation varchar(23));



create table customer_orders(

               order_id int ,
			   customer_id int ,
			   roll_id int ,
			   not_include_items varchar(30),
			   extra_items_included varchar(30),
			   order_date datetime);

-- Exec sp_rename 'customer_orders.not_nclude_items' , 'not_include_items' , 'column';


-- insert data into tables


insert into Driver(Driver_id , reg_date)
            values (1,'01-01-2021'),
                   (2,'01-03-2021'),
                   (3,'01-08-2021'),
                   (4,'01-15-21');


Insert into ingredients(ingredients_id , ingredients_name)
              values (1,'BBQ Chicken'),
                     (2,'Chilli Sauce'),
                     (3,'Chicken'),
                     (4,'Cheese'),
                     (5,'Kebab'),
                     (6,'Mushrooms'),
                     (7,'Onions'),
                     (8,'Egg'),
                     (9,'Peppers'),
                     (10,'schezwan sauce'),
                     (11,'Tomatoes'),
                     (12,'Tomato sauce');


insert into rolls(roll_id , roll_name)
            values (1	,'Non Veg Roll'),
                   (2	,'Veg Roll');


Insert into rolls_recipe(roll_id , ingredients)
            values (1,'1,2,3,4,5,6,8,10'),
                   (2,'4,6,7,9,11,12');


Insert into driver_order(order_id , driver_id ,pickup_time , distance , Duration , cancelation)
            values (1,1,'01-01-2021 18:15:34','20km','32 minutes',''),
                   (2,1,'01-01-2021 19:10:54','20km','27 minutes',''),
                   (3,1,'01-03-2021 00:12:37','13.4km','20 mins','NaN'),
                   (4,2,'01-04-2021 13:53:03','23.4','40','NaN'),
                   (5,3,'01-08-2021 21:10:57','10','15','NaN'),
                   (6,3,null,null,null,'Cancellation'),
                   (7,2,'01-08-2020 21:30:45','25km','25mins',null),
                   (8,2,'01-10-2020 00:15:02','23.4 km','15 minute',null),
                   (9,2,null,null,null,'Customer Cancellation'),
                   (10,1,'01-11-2020 18:50:20','10km','10minutes',null);



Insert into customer_orders(order_id , customer_id , roll_id , not_include_items , extra_items_included , order_date)
            values (1,101,1,'','','01-01-2021  18:05:02'),
                   (2,101,1,'','','01-01-2021 19:00:52'),
                   (3,102,1,'','','01-02-2021 23:51:23'),
                   (3,102,2,'','NaN','01-02-2021 23:51:23'),
                   (4,103,1,'4','','01-04-2021 13:23:46'),
                   (4,103,1,'4','','01-04-2021 13:23:46'),
                   (4,103,2,'4','','01-04-2021 13:23:46'),
                   (5,104,1,null,'1','01-08-2021 21:00:29'),
                   (6,101,2,null,null,'01-08-2021 21:03:13'),
                   (7,105,2,null,'1','01-08-2021 21:20:29'),
                   (8,102,1,null,null,'01-09-2021 23:54:33'),
                   (9,103,1,'4','1,5','01-10-2021 11:22:59'),
                   (10,104,1,null,null,'01-11-2021 18:34:49'),
                   (10,104,1,'2,6','1,4','01-11-2021 18:34:49');


-- After inserting data we check how data is look like in table 

select * from driver;
select * from ingredients;
select * from rolls;
select * from rolls_recipe;
select * from driver_order;
select * from customer_orders;


----------- Data Analysis ---------------------------------------------------

--1.How many rolls were ordered ?


select count(roll_id) as No_of_rolls_ordered from customer_orders;


-- 2. How many unique customer orders were made ?


select count(distinct(customer_id)) as No_of_customers from customer_orders;


-- 3.How many successful orders were delivered by each driver ?


select driver_id , 
       count(order_id) as No_of_orders_successful_by_drivers 
	   from driver_order 
       where cancelation != 'Customer Cancellation' and cancelation != 'Cancellation'
       group by driver_id
	   order by No_of_orders_successful_by_drivers desc;

-- or (Why we do same query again we just put distinct on order_id because order_id is not primary key  / uniqu key
-- officially but its data is not repeated till now in order_id in driver_order table

select driver_id , 
       count(distinct(order_id)) as No_of_orders_successful_by_drivers 
	   from driver_order 
       where cancelation != 'Customer Cancellation' and cancelation != 'Cancellation'
       group by driver_id
	   order by No_of_orders_successful_by_drivers desc;


-- or 

select driver_id , 
       count(distinct(order_id)) as No_of_orders_successful_by_drivers 
	   from driver_order 
       where cancelation not in ('Customer Cancellation' , 'Cancellation')
       group by driver_id
	   order by No_of_orders_successful_by_drivers desc;



-- 4.How many of each type of roll was delivered Count) ?

select co.roll_id ,
       roll_name ,
       count(co.roll_id) as No_of_successfully_orders_delivered
	   from rolls as r inner join customer_orders as co
	   on r.roll_id = co.roll_id
	   inner join driver_order as do
       on co.order_id = do.order_id 
       where do.order_id in 
       (select order_id from driver_order where cancelation not in ('Cancellation' , 'Customer Cancellation') or
       cancelation is NULL) 
       group by co.roll_id  , roll_name;

--  in SQL, when you apply filters in your queries, NULL values are often excluded 
-- automatically unless you specifically check for them.

-- NULL values will not show up by default when using WHERE filters unless 
--you explicitly check for them with IS NULL or IS NOT NULL.
--Empty strings and NaN values are valid values and will show up unless specifically excluded by the conditions.

-- 5.How many veg and non veg rolls were ordered by each customer ?

select customer_id , 
       count(
             case 
				  WHEN co.roll_id = 1 THEN 1 
		     END) as count_of_non_veg_rolls , 

	   count(
			 case 
				 WHEN co.roll_id = 2 THEN 1
			 END) as count_of_veg_rolls
		from customer_orders as co inner join rolls as r
		on co.roll_id = r.roll_id
		group by customer_id;


-- or

-- I write same query again just by group by but if u r results are correct without group by (means there group by)
-- is not neccessary then not use) I just do it for queriosity and I want to showcase it this is possible when
-- the group by column contains non duplicate values that time this thing is possible .


select customer_id , 
       count(
	         case 
				 WHEN roll_id = 1 THEN 1 
			 END) as count_of_non_veg_rolls , 
       
	   count(
	         case 
				 WHEN roll_id = 2 THEN 1
			 END) as count_of_veg_rolls
	   from customer_orders 
	   group by customer_id;


--6. Maximum no of roles delivered in single order;

select TOP 1 order_id , 
       count(roll_id) as no_of_roles_in_order 
	   from customer_orders 
	   where order_id in (select order_id from driver_order where cancelation not in ('Customer Cancellation',
	   'Cancellation') or cancelation is NULL)
	   group by order_id
	   order by
       no_of_roles_in_order desc;

-- or 

With highest_rolls_in_one_order AS(

                                  select order_id , 
								         count(roll_id) as No_of_rolls_in_order ,
                                          Dense_Rank() over(order by sum(roll_id) desc) as rank_rolls
                                          from customer_orders 
										  where order_id in (select order_id from driver_order 
										  where cancelation not in 
										  ('Customer Cancellation','Cancellation') or cancelation is NULL)
										  group by order_id
)

select * from highest_rolls_in_one_order where rank_rolls <= 1;


-- 7. Which Item was purchased first by the customer after they become a member ?


With first_purchase_item As(

                           select customer_id , 
						          co.roll_id , 
								  roll_name ,  
								  order_date , 
                                  Dense_Rank() over(partition by customer_id order by order_date asc) as Rank_order_date
                                  from customer_orders as co inner join rolls as r
                                  on co.roll_id = r.roll_id
                                  group by customer_id , co.roll_id , roll_name , order_date

)

select * from first_purchase_item where Rank_order_date <= 1;

-- 8.For each customer , How many delivered rolls had at least 1 change and how many had no changes ?

select customer_id , 
       roll_id , 
       case 
           WHEN not_include_items is not null and not_include_items !='' THEN not_include_items
	       ELSE 'Not Change'
       END as not_include_items ,
       case  
           WHEN extra_items_included is not null and extra_items_included != '' and extra_items_included !='NaN' 
	       THEN extra_items_included
	       ELSE 'Not Change'
       END as extra_items_included
       from customer_orders as co inner join driver_order as do 
       on co.order_id = do.order_id
       where cancelation not in ('Customer Cancellation' , 'Cancellation');


-- 10.What was the total number of rolls ordered for each hour of the day ? (datewise each hour)

select cast(order_date AS date) as Date ,
       Datepart(hour , order_date) as hour,
       count(roll_id) as No_of_rolls_ordered
       from customer_orders 
	   group by cast(order_date as Date) , datepart(hour , order_date)
       order by cast(order_date as date) asc;


-- or (just hourwise)

select concat(Datepart(hour , order_date) , ' - ' , Datepart(hour , order_date) + 1) as hour_bucket , 
       count(roll_id) as No_of_rolls_ordered
       from customer_orders 
       group by concat(Datepart(hour , order_date) , ' - ' , Datepart(hour , order_date) + 1)
       order by hour_bucket;


-- 11. What was the number of orders for each day of the week ? (all weeks with weeknumber)

select Datepart(week , order_date) as weekNumber ,
	   Datename(weekday , order_date) as weekdays ,
	   count(order_id) as No_of_orders
	   from customer_orders 
	   group by Datepart(week , order_date) , datename(weekday,order_date) 
	   order by weeknumber asc , weekdays asc;

--- or (only weekdays along with orders)

select datename(weekday , order_date) as weekdays , 
       count(order_id) as No_of_orders from customer_orders 
       group by datename(weekday , order_date) 
order by weekdays asc;


-- 11.What was the average time in minutes it took for each driver to arrive at the fasoos HQ to pickup the order ?
--- (Driverwise average)
 
With avg_time AS(

select do.order_id , 
	   driver_id , 
	   order_date , 
	   pickup_time,
	   distance,
       duration , 
       ABS(datediff(Minute , cast(order_date AS time) , cast(pickup_time AS time))) as Time_required_to_reach_hq
       from driver_order as do inner join customer_orders as co on do.order_id = co.order_id 
       where do.order_id in ( select order_id from driver_order where cast(pickup_time as time) is not NULL)
	   group by do.order_id , driver_id , order_date , pickup_time , distance , duration 
)

-- select driver_id , sum(time_required_to_reach_hq) as sum_time ,  count(driver_id) as count_drivers ,
-- sum(time_required_to_reach_hq) / count(driver_id) as avg_time_required_to_reach_HQ from avg_time group by driver_id

select driver_id , avg(Time_required_to_reach_hq) from avg_time group by driver_id;

--- Here query is correct bu actually data is some kind of wrong(augemented data) or some data are wrongly insert in time
--  so some results are giving unexpected 
--- but overall concept of query is correct so focus on how to solve query


-- 12.What was average distance travelled for each customer ?


with avg_distance AS(

select driver_id , 
       customer_id , cast(Replace(distance , 'km','') AS decimal(10,2)) as distance 
	   from  driver_order as do inner join customer_orders as co
       on do.order_id = co.order_id where distance is not null

)

select customer_id , 
        concat(avg(distance) , ' km') as avg_distance_travelled_for_each_customer 
        from avg_distance group by customer_id;



-- 13. What is difference between longest and shortest delivery time for all orders;

With longest_shortest_delivery AS(
select do.order_id , 
       Replace(Replace(Replace(duration , 'minutes' , '') , 'mins' , ''),'minute','') as Time_of_delivery,
       dense_Rank() over(order by Replace(Replace(Replace(duration , 'minutes' , '') , 'mins' , ''),'minute','')desc) as rank_duration
       from customer_orders as co inner join driver_order as do 
       on co.order_id = do.order_id where Replace(Replace(Replace(duration , 'minutes' , '') , 'mins' , ''),'minute','') is not null
       Group by do.order_id , Replace(Replace(Replace(duration , 'minutes' , '') , 'mins' , ''),'minute','')
)

select max(Time_of_delivery) as Longest_time_delievry , Min(Time_of_delivery) as shortest_time_delivery , 
(cast(max(Time_of_delivery) AS int) - cast(Min(Time_of_delivery) AS int)) as Difference_between_longest_and_shortest_delivery_time
from longest_shortest_delivery;


-- 14.what was the average speed for each driver for each delivery and do you notice any trend for these values ?

With avg_speed_each_driver_for_each_delivery AS(

select driver_id , 
       order_id ,
	   Distance , 
	   Duration , 
	   cast(cast((Replace(Distance , 'km' , '')) AS decimal(10,2)) / cast(Replace(Replace(Replace(Duration , 'minutes' , ''),'minute',''),'mins','') As int) AS decimal(10,2)) as delivery_time
       from driver_order where Distance is not null and Duration is not null

)

select driver_id , 
       order_id , 
	   concat(cast(avg(delivery_time) As decimal(10,2)) , ' minutes') as avg_time_each_delivery_each_driver
	   from avg_speed_each_driver_for_each_delivery
       group by driver_id , order_id;


-- 15.What is successful delivery percentage for each driver ?


With No_of_orders_placed AS(

select driver_id , 
       count(order_id) as No_of_orders_place
       from driver_order
       where cancelation != 'Customer_Cancellation'
       group by driver_id) , 

 No_of_orders_delivered AS(

 select driver_id ,
        count(order_id) as no_of_orders_deliver 
		from driver_order where cancelation 
        not in ('Customer_Cancellation' , 'Cancellation') 
		group by driver_id)

select op.driver_id , 
       No_of_orders_place , 
	   No_of_orders_deliver ,
       concat(cast(cast(No_of_orders_deliver As decimal(10,2)) / No_of_orders_place AS decimal(10,2)) * 100 , ' %')
	   as Precentage_Rate_succesful_deliveries
       from No_of_orders_placed as op inner join 
       No_of_orders_delivered as od on op.driver_id = od.driver_id 
       group by op.driver_id ,No_of_orders_place , No_of_orders_deliver;

-- or


With count_order_placed AS(

select driver_id , count(
	                     case
							  WHEN cancelation = ' ' or cancelation = 'NaN' or cancelation is null or 
							  cancelation = 'Cancellation' THEN 1
						 END) as No_orders_place
					from driver_order group by driver_id

),

count_order_deliver As(

select driver_id , count(
                          case
						      WHEN cancelation = '' or cancelation = 'NaN' or Cancelation is NULL THEN 1
						  END) as No_of_orders_delivered
					from driver_order group by driver_id
					
)


select op.driver_id , 
       No_orders_place , 
	   No_of_orders_delivered,
       concat(cast((cast(No_of_orders_delivered AS decimal(10,2))  / cast(No_orders_place AS decimal(10,2))) 
	   As decimal(10,2)) * 100 , ' %') as Successful_percentage_deliveries_of_deiver
       from count_order_placed as op inner join
       count_order_deliver as od on op.driver_id = od.driver_id group by op.driver_id , No_orders_place , 
       No_of_orders_delivered order by op.driver_id asc;




--- Here I want share some insights behind this query on which basis of which logic I consider for this query
--- Here we build three quries , 1st gives how many orders_placed , in this query we consider only those order_id
--- which is '' , NaN , Null means if we hve this kind of values there means in cancelation there is no order cancel
--- and we are not consider that order_id which cancelaton contains 'Customer_cancellation' . order is placed initially
--- but after that order is canceled by customer only.there is not interference of driver. so there is no make sense
--- to consider that order_id in order_place so we ignore it and here we consider those order_id which is canceled by
--- driver because there order is placed and that order got canceled by driver so we consider it

--- In 2nd query , we consider those orders which is delivered means we are not consider those order_id which 
--- canceled by customer and by driver so we get actual count of delivered order. so in this query it not contains
--- that order which is cancel by driver( but in first query it contains that order_id which cancel by driver)

--- In 3rd query , we just take columns from above two queries or CTE and make inner join on common column and just 
--- make division