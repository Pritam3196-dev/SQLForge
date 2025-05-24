-- Create Food_delivery database

Create database Food_delivery;

-- Use Food_delivery;

Use Food_delivery;

-- Create table orders;

Create table Orders(Order_id varchar(20) primary key ,
                    Customer_code varchar(20) not null ,
					Placed_at Datetime not null ,
					Restaurant_id varchar(20) ,
					Cuisine varchar(30) not null ,
					Order_Status varchar(20) not null ,
					Promo_Code_Name varchar(20));


select * from Orders;



-- Insert data into Orders table

Insert into Orders(Order_id , Customer_code , Placed_at , Restaurant_id , Cuisine , Order_Status , Promo_Code_Name)
values
('OF1900191801','UFDDN1991918XUY1','2025-01-01 15:30:20','KMKMH6787','Lebanese','Delivered','Tasty50'),
('OF1900191802','UFDDN1991918XUY1','2025-01-02 12:15:45','LEBANESE2','Lebanese','Delivered',null),
('OF1900191803','UFDDN1991918XUY1','2025-01-10 18:45:30','PIZZA123','Italian','Cancelled','HUNGRY20'),
('OF1900191804','UFDDN1991918XUY1','2025-01-15 19:20:15','ITALIAN2','Italian','Delivered',null),
('OF1900191805','UFDDN1991918XUY1','2025-01-20 11:30:00','BURGER99','American','Delivered',null),
('OF1900191806','ABC1234567890XYZ','2025-01-01 08:45:00','AMERICAN2','American','Delivered','NEWUSER'),
('OF1900191807','ABC1234567890XYZ','2025-01-05 13:20:00','TACO789','Mexican','Delivered',null),
('OF1900191808','DEF9876543210XYZ','2025-01-02 09:15:00','MEXICAN2','Mexican','Delivered','FIRSTORDER'),
('OF1900191809','GHI5678901234XYZ','2025-01-03 14:30:00','SUSHI456','Japanese','Delivered','NEWUSER'),
('OF1900191810','JKL3456789012XYZ','2025-01-04 12:00:00','JAPANESE2','Japanese','Delivered','FIRSTORDER'),
('OF1900191811','MNO7890123456XYZ','2025-01-05 19:45:00','KMKMH6787','Lebanese','Delivered',null),
('OF1900191812','PQR1234567890ABC','2025-01-06 11:30:00','LEBANESE2','Lebanese','Delivered','NEWUSER'),
('OF1900191813','STU9876543210ABC','2025-01-07 13:15:00','PIZZA123','Italian','Delivered',null),
('OF1900191814','VWX5678901234ABC','2025-01-08 18:00:00','ITALIAN2','Italian','Delivered','FIRSTORDER'),
('OF1900191815','YZA3456789012ABC','2025-01-09 12:45:00','BURGER99','American','Delivered',null),
('OF1900191816','BCD7890123456ABC','2025-01-10 20:15:00','AMERICAN2','American','Delivered','NEWUSER'),
('OF1900191817','EFG1234567890DEF','2025-01-11 09:30:00','TACO789','Mexican','Delivered',null),
('OF1900191818','HIJ9876543210DEF','2025-01-12 14:45:00','MEXICAN2','Mexican','Delivered','FIRSTORDER'),
('OF1900191819','KLM5678901234DEF','2025-01-13 17:30:00','SUSHI456','Japanese','Delivered',null),
('OF1900191820','NOP3456789012DEF','2025-01-14 12:15:00','JAPANESE2','Japanese','Delivered',null),
('OF1900191821','QRS7890123456DEF','2025-01-15 19:00:00','KMKMH6787','Lebanese','Delivered','NEWUSER'),
('OF1900191822','TUV1234567890GHI','2025-01-16 10:45:00','LEBANESE2','Lebanese','Delivered',null),
('OF1900191823','WXY9876543210GHI','2025-01-17 15:30:00','PIZZA123','Italian','Delivered','FIRSTORDER'),
('OF1900191824','ZAB5678901234GHI','2025-01-18 18:15:00','ITALIAN2','Italian','Delivered',null),
('OF1900191825','CDE3456789012GHI','2025-01-19 11:00:00','BURGER99','American','Delivered',null),
('OF1900191826','FGH7890123456GHI','2025-01-20 20:45:00','AMERICAN2','American','Delivered','NEWUSER'),
('OF1900191827','IJK1234567890JKL','2025-01-21 09:15:00','TACO789','Mexican','Delivered',null),
('OF1900191828','LMN9876543210JKL','2025-01-22 14:30:00','MEXICAN2','Mexican','Delivered','FIRSTORDER'),
('OF1900191829','OPQ5678901234JKL','2025-01-23 17:45:00','SUSHI456','Japanese','Delivered',null),
('OF1900191830','RST3456789012JKL','2025-01-24 12:30:00','JAPANESE2','Japanese','Delivered',null),
('OF1900191831','UVW7890123456JKL','2025-01-25 19:15:00','KMKMH6787','Lebanese','Delivered','NEWUSER'),
('OF1900191832','XYZ1234567890MNO','2025-01-26 10:00:00','LEBANESE2','Lebanese','Delivered',null),
('OF1900191833','ABC9876543210MNO','2025-01-27 15:15:00','PIZZA123','Italian','Delivered','FIRSTORDER'),
('OF1900191834','DEF5678901234MNO','2025-01-28 18:30:00','ITALIAN2','Italian','Delivered',null),
('OF1900191835','GHI3456789012MNO','2025-01-29 11:45:00','BURGER99','American','Delivered',null),
('OF1900191836','JKL7890123456MNO','2025-01-30 20:00:00','AMERICAN2','American','Delivered','NEWUSER'),
('OF1900191837','MNO1234567890PQR','2025-01-31 09:45:00','TACO789','Mexican','Delivered',null),
('OF1900191838','PQR9876543210PQR','2025-01-31 14:00:00','MEXICAN2','Mexican','Delivered','FIRSTORDER'),
('OF1900191839','STU5678901234PQR','2025-01-31 17:15:00','SUSHI456','Japanese','Delivered',null),
('OF1900191840','VWX3456789012PQR','2025-01-31 12:00:00','JAPANESE2','Japanese','Delivered',null),
('OF1900191841','JAN_ONLY_ORDER1','2025-01-15 13:30:00','KMKMH6787','Lebanese','Delivered','NEWUSER'),
('OF1900191842','JAN_ONLY_ORDER2','2025-01-20 18:45:00','LEBANESE2','Lebanese','Delivered','FIRSTORDER'),
('OF1900191843','NO_ORDER_LAST7_1','2025-02-01 12:15:00','PIZZA123','Italian','Delivered','NEWUSER'),
('OF1900191844','NO_ORDER_LAST7_2','2025-02-05 19:30:00','ITALIAN2','Italian','Delivered','FIRSTORDER'),
('OF1900191845','THIRD_ORDER_CUST1','2025-01-05 11:45:00','BURGER99','American','Delivered','NEWUSER'),
('OF1900191846','THIRD_ORDER_CUST1','2025-01-10 14:15:00','AMERICAN2','American','Delivered',null),
('OF1900191847','THIRD_ORDER_CUST1','2025-01-15 17:45:00','BURGER99','American','Delivered',null),
('OF1900191848','THIRD_ORDER_CUST2','2025-01-10 10:30:00','TACO789','Mexican','Delivered','FIRSTORDER'),
('OF1900191849','THIRD_ORDER_CUST2','2025-01-15 13:45:00','MEXICAN2','Mexican','Delivered',null),
('OF1900191850','THIRD_ORDER_CUST2','2025-01-20 16:30:00','TACO789','Mexican','Delivered',null),
('OF1900191851','MULTI_CUISINE_CUST','2025-01-05 12:00:00','KMKMH6787','Lebanese','Delivered','NEWUSER'),
('OF1900191852','MULTI_CUISINE_CUST','2025-01-10 15:30:00','LEBANESE2','Lebanese','Delivered',null),
('OF1900191853','MULTI_CUISINE_CUST','2025-01-15 18:45:00','PIZZA123','Italian','Delivered',null),
('OF1900191854','MULTI_CUISINE_CUST','2025-01-20 11:15:00','ITALIAN2','Italian','Delivered',null),
('OF1900191855','MULTI_CUISINE_CUST','2025-01-25 14:45:00','BURGER99','American','Delivered',null),
('OF1900191856','SINGLE_ORDER_JAN','2025-01-10 19:00:00','AMERICAN2','American','Delivered','FIRSTORDER'),
('OF1900191857','NO_ORDER_RECENT','2025-02-10 12:30:00','TACO789','Mexican','Delivered','NEWUSER'),
('OF1900191858','NO_ORDER_RECENT','2025-02-15 18:00:00','MEXICAN2','Mexican','Delivered',null),
('OF1900191859','PROMO_FIRST_ONLY','2025-02-01 11:45:00','SUSHI456','Japanese','Delivered','WELCOME50'),
('OF1900191860','PROMO_FIRST_ONLY','2025-02-05 14:15:00','JAPANESE2','Japanese','Delivered',null),
('OF1900191861','PROMO_FIRST_ONLY','2025-02-10 17:30:00','SUSHI456','Japanese','Delivered',null),
('OF1900191862','LAST_ORDER_7DAYS','2025-03-20 10:00:00','KMKMH6787','Lebanese','Delivered','FIRSTORDER'),
('OF1900191863','LAST_ORDER_7DAYS','2025-03-25 13:15:00','LEBANESE2','Lebanese','Delivered',null),
('OF1900191864','LAST_ORDER_7DAYS','2025-03-31 16:30:00','KMKMH6787','Lebanese','Delivered',null),
('OF1900191865','ABC9876543210MNO','2025-02-27 15:15:00','PIZZA123','Italian','Delivered',null),
('OF1900191866','CDE3456789012GHI','2025-03-27 15:15:00','PIZZA123','Italian','Delivered',null),
('OF1900191867','ABC9876543210MNO','2025-03-15 15:15:00','LEBANESE2','Lebanese','Delivered',null),
('OF1900191868','ZZZ9876543210MNO','2025-03-20 15:15:00','LEBANESE2','Lebanese','Delivered','NEWUSER'),
('OF1900191869','UFDDN1991918XUY1','2025-03-28 11:30:00','BURGER99','American','Delivered',null),
('OF1900191870','MULTI_CUISINE_CUST','2025-03-31 14:45:00','PIZZA123','Italian','Delivered',null),
('OF1900191871','DEF9876543210XYZ','2025-03-02 09:15:00','KMKMH6787','Lebanese','Delivered','TASTY50'),
('OF1900191872','UVW7890123456JKL','2025-02-25 19:15:00','KMKMH6787','Lebanese','Delivered','TASTY25'),
('OF1900191873','UVW7890123456JKL','2025-03-25 19:15:00','PIZZA123','Italian','Delivered','TASTY50');



--- Check how is data look like;


select * from orders;



--- Data Analysis starts;


-- 1.Find Top 3 outlets by cuisine Type without using limit and Top function;


With Top_three_outlets_by_cuisine AS(

select Cuisine ,
       Restaurant_id , 
	   count(restaurant_id) as No_of_times ,
       Dense_Rank() over(partition by cuisine order by count(order_id) desc) as Rank_restaurants
       from orders 
	   group by Cuisine,Restaurant_id 

)

select * from Top_three_outlets_by_cuisine where Rank_restaurants <= 3;

-- or 


select cuisine , 
       Restaurant_id , 
	   count(Restaurant_id) as No_of_times_restaurants
	   from orders 
	   group by cuisine , restaurant_id 
       order by cuisine asc , No_of_times_restaurants desc;


-- This above query is not suitable according to problem statment but every cuisine has only two restaurants so
-- by default it works;




-- 2.Find daily new customer count from launch date (Everyday how many new customers we are acquiring);


With Daily_new_customers AS(

select cast(o1.placed_at AS Date) as Placed_at_date , 
       customer_code 
	   from orders as o1 
	   where customer_code not in 
       (select customer_code from orders where  Cast(placed_at AS Date) < cast(o1.placed_at AS Date))
	   -- This sub query resturn customer till yestarday pf outer placed_at date so we are not considering those
	   -- customers we check is that customer in this group if not then we rake 

)

select Placed_at_date , count(customer_code) from Daily_new_customers group by placed_at_date;


-- 3.Count of all the users who were aquire in jan 2025 and only place one order in jan and did not place any
-- other order



With count_customers AS(

select customer_code , 
       count(order_id) as No_of_of_orders 
	   from orders where order_id not in 
       (select order_id  from orders where Month(placed_at) != 1 and Year(placed_at) = 2025)
       group by customer_code
       having count(order_id) = 1 

)

select count(customer_code) as No_of_customers_in_jan_single_order from count_customers ;


-- 4.List all the customers with no order in last 7 days but were aquired one month ago with their frst order in promo

with customer_no_order_last_seven_days AS(

(select * from orders where order_id not in 
(select order_id from orders where placed_at between getdate() - 7 and getdate()))

)


select customer_code , min(placed_at) from customer_no_order_last_seven_days group by customer_code having min(placed_at) in 
(Dateadd(month , -1 , getdate())) and year(placed_at) = year(getdate()) and promo_Code_Name = 'FIRSTORDER'



-- 5.Growth team is planning to create a trigger that will target customers after their every third order with 
-- personalized communication and they have aksed you to create a query for this





With Every_third_order_customer AS(


select customer_code , placed_at , order_id ,
Dense_Rank() over(partition by customer_code order by placed_at asc) as Rank_placed_at
from orders group by customer_code , placed_at , order_id

)

select * from Every_third_order_customer where Rank_placed_at % 3 = 0 and 
cast(placed_at AS Date) = cast(getdate() AS Date)



-- 5. List the customers who placed more than one order and all their order on promo only
--  (who have more than one order but all the orders should be on promo only)

select customer_code , 
       count(order_id) as no_of_orders , 
       count(promo_code_name) as no_of_promo_code 
	   from orders 
	   group by customer_code 
	   having count(order_id) > 1 and count(order_id) = count(promo_code_name);



-- 6.What percentage of customers where organically acquired in jan 2025.(placed there first order without promo code)


With orders_in_jan AS(

select * , 
Dense_rank() over(partition by customer_code order by placed_at asc) as Rank_placed_at
from orders where month(placed_at) = 1 and year(placed_at) = 2025

) , 

First_orders AS(

select * from orders_in_jan where Rank_placed_at = 1

) 
, 

without_promo_code AS(

select * from first_orders where promo_code_name is null

)


select concat(cast(count(customer_code) AS decimal(10,2)) * 100 / 
(select cast(count(customer_code) AS decimal(10,2)) from first_orders) , '%')
from without_promo_code 



-- 7.How many unique customers placed at least one order?

With unique_customer AS(

select customer_code , 
       count(order_id) as No_of_orders
	   from orders  
	   group by customer_code 
	   having count(order_id) = 1

)

select count(*) as No_of_customers from unique_customer;


-- 8.What is the total number of orders placed in January 2025?

select count(order_id) as No_of_orders from orders 
where month(placed_at) = 1 and year(placed_at) = 2025;

-- 9.Which customer placed the most orders overall?

select TOP 2 customer_code , 
       count(order_id) as No_of_orders 
	   from orders 
	   group by customer_code 
	   order by no_of_orders desc;


-- or 

With Top_ordered_customers AS(
select customer_code , count(order_id) as No_of_orders ,
Dense_Rank() over(order by count(order_id) desc) as Rank_customer_code
from orders group by customer_code

)

select * from Top_ordered_customers where Rank_customer_code <= 1;


-- 10.Which day of the week had the highest number of orders?

select Top  1 Datename(weekday , placed_at) as Day ,
       count(order_id) as no_of_orders 
	   from orders group by Datename(weekDay , Placed_at)
       order by count(order_id) desc;


-- or 

With highest_order_day_in_week AS(

select Datename(weekday , placed_at) as Day ,
       count(order_id) as No_of_orders , 
	   Dense_Rank() over(order by count(order_id) desc) as Rank_day
	   from orders group by Datename(weekday , placed_at)

)

select * from highest_order_day_in_week where Rank_day <= 1;




-- 11.How many customers placed only one order in their lifetime?

select customer_code , 
       count(order_id) as no_of_orders 
	   from orders group by customer_code
       having count(order_id) = 1;


-- 12.Find customers who placed their first-ever order in January 2025.


With first_order AS(

select customer_code , 
       placed_at ,
       Dense_Rank() over(partition by customer_code order by placed_at desc) as Rank_placed_at
       from orders 
	   where month(placed_at) = 1 and year(placed_at) = 2025

)

select * from first_order where Rank_placed_at <= 1;


-- or 


select customer_code , 
       min(placed_at) as first_order_date
       from orders 
	   where month(placed_at) = 1  and year(placed_at) = 2025 
	   group by customer_code ;



-- 13.How many customers placed more than 3 orders in January 2025?


With customer_more_than_three_order AS(

select customer_code , 
       placed_at ,
	   Dense_Rank() over(partition by customer_code order by placed_at asc) as Rank_placed_at
	   from orders

)

select * from customer_more_than_three_order where Rank_placed_at > 3;


-- 14.Which customers placed orders in more than one cuisine category?


select customer_code , 
       count(distinct(cuisine)) as No_of_cuisins_tried
       from orders 
	   group by customer_code 
	   having count(distinct(cuisine)) > 1;



-- 15.**What percentage of customers used a promo code in their first order?**


With orders_per_customer AS(

select * ,
Dense_Rank() over(partition by customer_code order by placed_at asc) as Rank_placed_at
from orders

)
,

customer_first_order_with_Promo_code AS(
select * from orders_per_customer where Rank_placed_at = 1 and promo_code_name is not null

) ,

customer_first_order_with_and_without_promo_code AS(

select * from orders_per_customer where Rank_placed_at = 1

)


--select concat((select cast(count(customer_code) AS decimal(10,2)) from customer_first_order_with_promo_code) * 100 /
--       (select cast(count(customer_code) AS decimal(10,2)) 
--	   from customer_first_order_with_and_without_promo_code) , '%') ;

-- or

select concat(cast(count(customer_code) AS decimal(10,2)) * 100 / 
(select count(customer_code) from orders_per_customer where Rank_placed_at = 1) , '%')
from customer_first_order_with_promo_code ;


-- 16.**How many customers used `NEWUSER` as their first promo code?**


With orders_per_customer AS(

select *  , 
      Dense_Rank() over(partition by customer_code order by placed_at asc) as Rank_placed_at
	  from orders

) ,

count_customers_with_NEWUSER AS(

select * from orders_per_customer where Rank_placed_at = 1 and Promo_code_name = 'NEWUSER'

)

select count(distinct(customer_code)) as No_of_customers from count_customers_with_NEWUSER;



-- 17.**What percentage of customers in January 2025 were acquired organically (no promo)?**

-- I did this but I will repeat it for best practice;


With orders_in_jan AS(

select * ,
Dense_rank() over(partition by customer_code order by placed_at asc) as Rank_placed_at
from orders where month(placed_at) = 1 and year(placed_at) = 2025

)
,

First_orders AS(

select * from orders_in_jan where Rank_placed_at = 1

) ,

organic_customers AS(

select * from first_orders where promo_code_name is null
)



select concat(cast(count(customer_code) AS decimal(10,2)) * 100 / 
(select cast(count(customer_code) AS decimal(10,2)) from first_orders) , '%')
from organic_customers;


-- 18.**Find the most commonly used promo code in January 2025.**

select TOP 2 promo_code_name , 
       count(promo_code_name) as no_of_times_promo_code
       from orders 
	   where month(placed_at) = 1 and year(placed_at) = 2025
       group by promo_code_name 
	   order by no_of_times_promo_code desc;


-- or 


With most_common_promo_code AS(

              select promo_code_name , 
			         count(promo_code_name) as no_of_times_promo_code ,
                     Dense_Rank() over(order by count(promo_code_name) desc) as Rank_promo_code
                     from orders 
					 where month(placed_at) =  1 and year(placed_at) = 2025
                     group by promo_code_name

)

select * from most_common_promo_code where Rank_promo_code = 1;




-- 19.**List customers who used a promo only in their first order but never after.**


With customers_and_their_orders AS(

select * , 
      Dense_Rank() over(partition by customer_code  order by placed_at asc) as Rank_placed_at
	  from orders

) ,

First_orders_with_promo_code AS(


select * from customers_and_their_orders where Rank_placed_at = 1 and promo_code_name is not null

) 
,

More_than_one_order_with_promo_code AS(

select * from customers_and_their_orders where Rank_placed_at > 1 and promo_code_name is not null

)


select customer_code from first_orders_with_promo_code where customer_code not in 
(select customer_code from more_than_one_order_with_promo_code)
       


-- 20.**Compare average orders between promo and non-promo customers.**

with customer_per_order_promo AS(

select customer_code ,
       count(order_id) as No_of_orders
	   from orders 
	   where promo_code_name is not null
	   group by customer_code 

) ,


customer_per_order_without_promo AS(


select customer_code ,
       count(order_id) as No_of_orders_without_promo
	   from orders
	   where promo_code_name is null
	   group by customer_code

) 


select 
(select cast(sum(No_of_orders) AS decimal(10,2))  / count(customer_code) from customer_per_order_promo) AS avg_order_promo_code,
(select cast(sum(No_of_orders_without_promo) AS decimal(10,2)) / count(customer_code) from customer_per_order_without_promo) AS avg_order_non_promo_code;



-- 21.**What is the most popular cuisine by number of orders?**


select TOP 1 cuisine ,
       count(order_id) as number_of_order 
	   from orders 
	   group by cuisine
	   order by number_of_order desc


-- or 

With Most_poppular_cuisine AS(

select cuisine ,
       count(order_id) as number_of_orders,
	   Dense_Rank() over(order by count(order_id) desc) as Rank_cuisine
	   from orders
	   group by cuisine

)

select * from most_poppular_cuisine where Rank_cuisine <= 1;


-- 22.**Which restaurant had the highest number of `Delivered` orders?**


select Top 2 restaurant_id ,
       count(order_status) as No_of_order_status
	   from orders group by restaurant_id order by No_of_order_status desc;


-- or 

With Most_ordered_restaurant AS(

select Restaurant_id , 
       count(order_status) as No_of_orders_status ,
	   Dense_Rank() over(order by count(order_status) desc) as Rank_restaurant_id
	   from orders
	   group by Restaurant_id

)

select * from Most_ordered_restaurant where Rank_restaurant_id <= 1;


-- 23.**List customers who ordered from at least 3 different cuisines.**


select customer_code ,
       count(distinct(cuisine)) as No_of_cuisines
	   from orders 
	   group by customer_code
	   having count(distinct(cuisine)) >= 3;

-- 24.**Find the top 3 cuisines for customers who used the `FIRSTORDER` promo.**


select TOP 3 cuisine ,
       count(order_id) as no_of_orders
	   from orders
	   where promo_code_name = 'FIRSTORDER'
	   group by cuisine
	   order by no_of_orders desc



-- or 

with Top_three_cuisines_first_order_promo AS(

select cuisine ,
       count(order_id) as No_of_orders ,
	   Dense_Rank() over(order by count(order_id) desc) as Rank_cuisine
	   from orders
	   where promo_code_name = 'FIRSTORDER'
	   group by cuisine

)

select * from Top_three_cuisines_first_order_promo where Rank_cuisine <= 3;

	   


-- 25.**Which cuisines have the highest repeat orders by the same customer?**


select Top 5 cuisine ,
       customer_code ,
	   count(order_id) as no_of_orders
	   from orders
	   group by cuisine ,
	   customer_code
	   order by no_of_orders desc;


-- or 

With cuisine_highest_repeated_orders_by_same_customer AS(

select cuisine , 
       customer_code,
        count(order_id) as no_of_orders,
		Dense_Rank() over(order by count(order_id) desc) as Rank_cuisine
		from orders
		group by cuisine  , customer_code

)

select * from cuisine_highest_repeated_orders_by_same_customer where Rank_cuisine <= 1 ;


-- 26.**Which day in January 2025 had the most orders?**


select Top 2 datename(day , placed_at) as Day ,
       count(order_id) as no_of_orders
	   from orders
	   where month(placed_at) = 1 and year(placed_at) = 2025
	   group by datename(day , placed_at)
	   order by no_of_orders desc;

-- or 

with most_ordered_day_in_jan_2025 AS(

select Datename(day , placed_at) as day ,
       count(order_id) as no_of_orders,
	   Dense_Rank() over(order by count(order_id) desc) as Rank_day
	   from orders
	   where month(placed_at) = 1 and year(placed_at) = 2025
	   group by Datename(day , placed_at)

)

select * from most_ordered_day_in_jan_2025 where Rank_day <= 1;

-- 27.**Find the average number of orders per day in January 2025.**


with day_wise_order AS(

select datename(day, placed_at) as dayss , 
       count(order_id) as No_of_orders
       from orders 
	   where month(placed_at) = 1 and year(placed_at) = 2025
       group by datename(day , placed_at) 

)

select (cast(sum(No_of_orders) AS decimal(10,2)) / count(dayss))  AS avg_number_order_per_day from day_wise_order



-- 28.**Identify customers who haven't placed any order in the last 30 days.**



select customer_code from orders where customer_code not in(

select customer_code 
	   from orders 
	   where placed_at  between Dateadd(day , -30 , getdate()) and Dateadd(day , 0 , getdate())
	   
	   
);



-- 29.**Which customer placed their last order most recently?**

with Most_recent_customer_day AS(

select customer_code ,
       placed_at ,
	   Dense_Rank() over(order by cast(placed_at AS Date) desc) as Rank_placed_at
	   from orders

)

select * from Most_recent_customer_day where Rank_placed_at = 1;




-- or



with Most_recent_customer_time AS(

select customer_code ,
       placed_at ,
	   Dense_Rank() over(order by placed_at  desc) as Rank_placed_at
	   from orders

)

select * from Most_recent_customer_time where Rank_placed_at = 1;



-- 30.How many orders were cancelled? What percentage is that of total orders?**


With count_cancelled_orders AS(

select * from orders where order_status = 'Cancelled'

)

select (cast(count(order_id) AS decimal(10,2)) * 100 / (select count(order_id) from orders)) AS cancelled_orders_percentage
from count_cancelled_orders

-- or 



select
((select cast(count(order_id) AS decimal(10,2)) from orders where order_status = 'Cancelled') * 100 / 
(select count(order_id) from orders))


-- or 



select 
      count(
	        case 
			    WHEN order_status = 'Cancelled' THEN 1
			END) as count_cancelled_orders ,

	  (select count(order_id) from orders) as Total_orders ,
	  (cast(count(
	        case
			    WHEN order_status = 'Cancelled' THEN 1
			END) as decimal(10,2)) * 100 / (select count(order_id) from orders)) as cancelled_percentage
	 from orders



-- 31.**Which customers had both `Delivered` and `Cancelled` orders?**



With customers_with_delivered_cancelled_orders AS(

select customer_code , 

       count(
	       case
		       WHEN order_status = 'Delivered' THEN 1
		END) as count_delivered_order ,

		count(
		     case

			   WHEN order_status = 'Cancelled' THEN 1
		  END) as count_cancelled_status
		from orders
		group by customer_code

)


select * from customers_with_delivered_cancelled_orders where count_delivered_order >= 1
and count_cancelled_status >= 1;



-- or


With customers_both_delivered_and_cancelled_orders AS(

select customer_code ,
       sum(
	       case
		        WHEN order_status = 'Delivered' THEN 1
			END) as delivered_orders ,
		sum(
		    case
			    WHEN order_status = 'Cancelled' THEN 1
			END) as Cancelled_orders
		from orders
		group by customer_code

)


select * from customers_both_delivered_and_cancelled_orders where delivered_orders >= 1 and cancelled_orders >= 1;



-- 32.**What’s the ratio of delivered to cancelled orders per cuisine?**

With ratio_delivered_cancelled_orders_per_cuisine AS(

select cuisine , 
       count(
	         case
			    WHEN order_status = 'Delivered' THEN 1
			 END) as delivered_order_per_cuisine ,
		count(
		      case
			      WHEN order_status = 'Cancelled' THEN 1
			  END) as cancelled_order_per_cuisine
		from orders
		group by cuisine

)
select cuisine , ((cast(delivered_order_per_cuisine AS decimal(10,2)) / cancelled_order_per_cuisine)) 
as ratio_delivered_to_cancelled
from ratio_delivered_cancelled_orders_per_cuisine where cancelled_order_per_cuisine != 0 ;


-- 32.**List customers with more than 1 cancelled order.**

select customer_code , 
       count(
	         case
			     WHEN order_status = 'Cancelled' THEN 1
			 END)  as No_of_cancelled_orders
		from orders
		group by customer_code
		having
		count(
		      case
			      WHEN order_status = 'Cancelled' THEN 1
			   END) > 1;


-- 33.**For each customer, show the time between their first and last order.**

with Time_between_first_and_last_order_per_customer AS(

select customer_code , 
       min(placed_at) as first_order_date ,
       max(placed_at) as last_order_date 
	   from orders group by customer_code

)

select * , concat(datediff(day , first_order_date , last_order_date) , ' days') 
as difference_between_first_last_order
from Time_between_first_and_last_order_per_customer;


-- 34.**Rank customers by their order count (most to least).**

select customer_code ,
       count(order_id) as no_of_orders ,
	   Dense_rank() over(order by count(order_id) desc) as Rank_customer_code
	   from orders
	   group by customer_code;


-- 35.**Show cumulative order count by day for January 2025.**


select Datename(Day , cast(placed_at AS Date)) as Day ,
       Year(placed_at) as Year ,
       count(order_id) as current_day_orders ,
       sum(count(order_id)) over(order by cast(Datename(Day , cast(placed_at AS Date)) AS int) asc) as cummulative_sum_orders
	   from orders
	   where month(placed_at) = 1 and year(placed_at) = 2025
	   group by Datename(Day , cast(placed_at AS Date))  , Year(placed_at)
	   order by cast(Datename(Day , cast(placed_at AS Date)) AS int);


-- or



select Datename(Day , cast(Placed_at AS Date)) as Day ,
       year(placed_at) as Year ,
	   count(order_id) as Current_day_orders ,
	   sum(count(order_id)) over(order by cast(Datename(day , cast(placed_at AS date)) AS int) asc) as Cummulative_sum_orders
	   from orders
	   where month(placed_at) = 1 and year(placed_at) = 2025
	   group by Datename(Day , cast(placed_at As Date))   , Year(placed_at)


