-- Create database

create database Bike_Rental_shop;


-- Use Bike_Rental_shop Database

Use Bike_Rental_Shop;


-- Create tables in database


Create table Customer(

                    customer_id  int primary key ,
					customer_name varchar(50) ,
					customer_email varchar(50));



Create table Bike(

                  bike_id int primary key ,
				  model varchar(50),
				  Category varchar(50),
				  price_per_hour decimal,
				  price_per_day decimal,
				  status varchar(20));



Create table Rental(

                  Rental_id int primary key ,
				  customer_id int , 
				  bike_id int ,
				  start_timestamp datetime ,
				  duration int ,
				  total_paid decimal ,
				  foreign key (customer_id) references customer(customer_id),
				  foreign key (bike_id) references bike(bike_id));


Create table Membership_type(

                 Membership_type_id int primary key ,
				 membership_type_name varchar(50),
				 Description varchar(500),
				 Price decimal );



Create table Membership(

                  Membership_id int primary key ,
				  Membership_type_id int ,
				  Customer_id int ,
				  start_date date ,
				  end_date date ,
				  Total_paid decimal ,
				  foreign key (Membership_type_id) references Membership_type(Membership_type_id),
				  foreign key (customer_id) references customer(customer_id));



--- Insert the data into tables ;

-- Customer table


Insert into Customer (customer_id , customer_name , customer_email) 
            values   (1, 'John Doe',   'john.doe@example.com'),
			         (2, 'Alice Smith', 'alice.smith@example.com'),
                     (3, 'Bob Johnson', 'bob.johnson@example.com'),
                     (4, 'Eva Brown', 'eva.brown@example.com'),
                     (5, 'Michael Lee', 'michael.lee@example.com'),
                     (6, 'Sarah White', 'sarah.white@example.com'),
                     (7, 'David Wilson', 'david.wilson@example.com'),
                     (8, 'Emily Davis', 'emily.davis@example.com'),
                     (9, 'Daniel Miller', 'daniel.miller@example.com'),
                     (10, 'Olivia Taylor', 'olivia.taylor@example.com');



-- Bike Table



Insert into bike (bike_id , model , category , price_per_hour , price_per_day , status)
            values (1, 'Mountain Bike 1', 'mountain bike', 10.00, 50.00, 'available'),
                   (2, 'Road Bike 1', 'road bike', 12.00, 60.00, 'available'),
                   (3, 'Hybrid Bike 1', 'hybrid', 8.00, 40.00, 'rented'),
                   (4, 'Electric Bike 1', 'electric', 15.00, 75.00, 'available'),
                   (5, 'Mountain Bike 2', 'mountain bike', 10.00, 50.00, 'out of service'),
                   (6, 'Road Bike 2', 'road bike', 12.00, 60.00, 'available'),
                   (7, 'Hybrid Bike 2', 'hybrid', 8.00, 40.00, 'out of service'),
                   (8, 'Electric Bike 2', 'electric', 15.00, 75.00, 'available'),
                   (9, 'Mountain Bike 3', 'mountain bike', 10.00, 50.00, 'rented'),
                   (10, 'Road Bike 3', 'road bike', 12.00, 60.00, 'available');



-- Rental table


-- Exec sp_rename 'Rental.Renatal_id' , 'Rental_id' , 'COLUMN';


Insert into Rental (Rental_id , customer_id , bike_id , start_timestamp , duration , total_paid)
            values (1, 1, 1, '2022-11-01 10:00:00', 240, 50.00),
(2, 1, 1, '2022-11-02 10:00:00', 245, 50.00),
(3, 1, 1, '2022-11-03 10:00:00', 250, 50.00),
(4, 1, 1, '2022-11-04 10:00:00', 235, 50.00),
(5, 1, 1, '2022-12-05 10:00:00', 155, 50.00),
(6, 2, 2, '2022-12-08 11:00:00', 250, 60.00),
(7, 3, 3, '2022-12-13 12:00:00', 245, 40.00),
(8, 1, 1, '2023-01-05 10:00:00', 240, 50.00),
(9, 2, 2, '2023-01-08 11:00:00', 235, 60.00),
(10, 3, 3, '2023-02-13 12:00:00', 245, 40.00),
(11, 1, 1, '2023-03-05 10:00:00', 250, 50.00),
(12, 2, 2, '2023-03-08 11:00:00', 355, 60.00),
(13, 3, 3, '2023-04-13 12:00:00', 240, 40.00),
(14, 1, 1, '2023-04-01 10:00:00', 235, 50.00),
(15, 1, 6, '2023-05-01 10:00:00', 245, 60.00),
(16, 1, 2, '2023-05-01 10:00:00', 250, 60.00),
(17, 1, 3, '2023-06-01 10:00:00', 235, 40.00),
(18, 1, 4, '2023-06-01 10:00:00', 255, 75.00),
(19, 1, 5, '2023-07-01 10:00:00', 240, 50.00),
(20, 2, 2, '2023-07-02 11:00:00', 445, 60.00),
(21, 3, 3, '2023-07-03 12:00:00', 250, 40.00),
(22, 4, 4, '2023-08-04 13:00:00', 235, 75.00),
(23, 5, 5, '2023-08-05 14:00:00', 555, 50.00),
(24, 6, 6, '2023-09-06 15:00:00', 240, 60.00),
(25, 7, 7, '2023-09-07 16:00:00', 245, 40.00),
(26, 8, 8, '2023-09-08 17:00:00', 250, 75.00),
(27, 9, 9, '2023-10-09 18:00:00', 335, 50.00),
(28, 10, 10, '2023-10-10 19:00:00', 255, 60.00),
(29, 10, 1, '2023-10-10 19:00:00', 240, 50.00),
(30, 10, 2, '2023-10-10 19:00:00', 245, 60.00),
(31, 10, 3, '2023-10-10 19:00:00', 250, 40.00),
(32, 10, 4, '2023-10-10 19:00:00', 235, 75.00);



-- Membership_type

Insert into Membership_type (Membership_type_id ,membership_type_name , Description , Price)
            values (1, 'Basic Monthly', 'Unlimited rides with non-electric bikes. Renews monthly.', 100.00),
                   (2, 'Basic Annual', 'Unlimited rides with non-electric bikes. Renews annually.', 500.00),
                   (3, 'Premium Monthly', 'Unlimited rides with all bikes. Renews monthly.', 200.00);


-- Membership;


Insert into Membership(Membership_id , Membership_type_id , Customer_id , start_date , end_date , Total_paid)
            values (1, 2, 3, '2023-08-01', '2023-08-31', 500.00),
                   (2, 1, 2, '2023-08-01', '2023-08-31', 100.00),
                   (3, 3, 4, '2023-08-01', '2023-08-31', 200.00),
                   (4, 1, 1, '2023-09-01', '2023-09-30', 100.00),
                   (5, 2, 2, '2023-09-01', '2023-09-30', 500.00),
                   (6, 3, 3, '2023-09-01', '2023-09-30', 200.00),
                   (7, 1, 4, '2023-10-01', '2023-10-31', 100.00),
                   (8, 2, 5, '2023-10-01', '2023-10-31', 500.00),
                   (9, 3, 3, '2023-10-01', '2023-10-31', 200.00),
                   (10, 3, 1, '2023-11-01', '2023-11-30', 200.00),
                   (11, 2, 5, '2023-11-01', '2023-11-30', 500.00),
                   (12, 1, 2, '2023-11-01', '2023-11-30', 100.00);





-- see how table is looke like ;

select * from customer;
select * from bike;
select * from Rental;
select * from Membership_type;
select * from Membership;


--- Data Analysis 

-- 1.Emily would like to know how many bikes the shop owns by category. Can you get this for her?

-- Emily is one of customer 

-- Display the category name and the number of bikes the shop owns in
-- each category (call this column number_of_bikes ). Show only the categories
-- where the number of bikes is greater than 2 .


select Category , 
       count(bike_id) as No_of_bikes 
	   from bike group by Category
       having count(bike_id) > 2 
	   order by No_of_bikes desc;



-- 2.Emily needs a list of customer names with the total number of memberships purchased by each.

-- For each customer, display the customer's name and the count of memberships purchased 
-- (call this column membership_count ). Sort the results by membership_count , 
-- starting with the customer who has purchased the highest number of memberships.

-- Keep in mind that some customers may not have purchased any memberships yet. 
-- In such a situation, display 0 for the membership_count .


select c.customer_id , 
       customer_name , 
	   count(Membership_id) as No_of_memberships 
	   from customer as c left join membership as m
       on c.customer_id = m.customer_id 
	   group by c.customer_id , customer_name 
	   order by No_of_memberships desc;


-- 3.Emily is working on a special offer for the winter months. Can you help her prepare a list of new rental prices?



select bike_id , 
       Category , 
	   price_per_hour as Old_price_per_hour ,
       case 
           WHEN Category = 'electric' THEN cast(((price_per_hour) * ( 1 - 0.10)) AS decimal(10,2))
	       WHEN Category = 'Mountain bike' THEN cast(((price_per_hour) * (1 - 0.20)) AS decimal(10,2))
	       ELSE cast((price_per_hour * (1 - 0.50)) As decimal(10,2))

       END  as Discounted_price_per_hour ,

       price_per_day as Old_price_per_day ,


       case
           WHEN Category = 'electric' THEN cast(((price_per_day) * ( 1 - 0.20)) AS decimal(10,2))
	       WHEN Category = 'Mountain bike' THEN  cast(((price_per_day) * (1 - 0.50)) As decimal(10,2))
	       ELSE cast((price_per_day * (1 - 0.50)) As decimal(10,2))
       END as Discounted_price_per_day

       from bike ;


-- 4. Emily is looking for counts of the rented bikes and of the available bikes in each category


select category , count(
                        case 
                            WHEN status = 'rented' THEN 1
						END) as No_of_rented_bikes ,

				  count(
				       case 
					      WHEN status = 'available' THEN 1
					   END) as No_of_available_bikes

				  from bike group by category order by category asc;



-- 5.Emily is preparing a sales report. She needs to know the total revenue from rentals by month, 
-- the total by year, and the all-time across all the years.


select year(start_timestamp) as year , Month(start_timestamp) as Month ,  sum(total_paid) as Total_rental_revenue_by_months 
from rental
group by Month(start_timestamp) , year(start_timestamp) 

union all

select year(start_timestamp) as year , null as month , sum(Total_paid) as Total_revenue_by_year 
from rental group by year(start_timestamp) 

union all

select null as year , null as Month , sum(Total_paid) as Total_revenue_of_rental from  rental order by year desc ,
month desc;


-- Here we nothing make special just calculate monthly revenue , yearly revenue and across all years revenue seperately
-- by queries and here we need to create accoding year , months and revenue column as per problem statment
-- so we need to union it but for union or union all we have to same no of columns , columns should be same and order
-- of columns should be same so thats why in yearwise revenue we make null as month means months are null in yearwise revue
-- and in across_all_years we make null as year and null_as month means year and month is null because we get single
-- value which is sumof all years revenue ... so like that we make same columns of all query and union it
-- we make order it by yearwise desc and monthwise desc becase we want orders like monthwise records first then
-- yearwise and then across_all_year ... we intentionally put null values so when we order by asc any column
-- then null value is came at top of that respective records so we make year desc and month desc(so here across all
-- year result contains null in year and month so we it become at top when year asc, when year desc it bottom ,
-- when in yearwise it has null as months so when we says order by month asc then null at top of records of months
--(records) when desc the null as bottom of months(records)) so we make year desc , month desc so all null
-- values at bottom( acroos_all_year at very last because it has both year , month is null) , (yearwise will bottom
-- of months(which have month value like 1,2) records) , (monthwise is desc order like 12,11)


-- or 


select year(start_timestamp) as year , Month(start_timestamp) as Month ,  sum(total_paid) as Total_rental_revenue_by_months 
from rental
group by Month(start_timestamp) , year(start_timestamp) 

union 

select year(start_timestamp) as year , null as month , sum(Total_paid) as Total_revenue_by_year 
from rental group by year(start_timestamp) 

union 

select null as year , null as Month , sum(Total_paid) as Total_revenue_of_rental from  rental order by year desc ,
month desc ;


-- 6.Emily has asked you to get the total revenue from memberships for each
-- combination of year, month, and membership type.

select year(start_date)  as Year, 
       Month(start_date) as Month_no  , 
	   membership_type_name , 
	   sum(Total_paid) as Total_revenue
       from membership as m inner join membership_type as t 
	   on m.membership_type_id = t.membership_type_id
       group by year(start_date) , Month(start_date) , membership_type_name 
       order by year(start_date) asc , Month(start_date) asc



-- 7.Next, Emily would like data about memberships purchased in 2023, with subtotals and grand totals for 
-- all the different combinations of membership types and months.



select membership_type_name , 
       Month(start_date) as Month_no , 
	   sum(price) as Total_revenue 
	   from membership_type as t 
       inner join membership as m on t.membership_type_id = m.membership_type_id 
	   where year(start_date) = 2023
       group by membership_type_name , Month(start_date)
	   order by membership_type_name asc , Month(start_date) asc;


-- 8.Emily wants to segment customers based on the number of rentals and
-- see the count of customers in each segment. Use your SQL skills to get this!
-- Categorize customers based on their rental history as follows:
-- Customers who have had more than 10 rentals are categorized as 'more than 10' .
-- Customers who have had 5 to 10 rentals (inclusive) are categorized as 'between 5 and 10' .
-- Customers who have had fewer than 5 rentals should be categorized as 'fewer than 5' .
-- Calculate the number of customers in each category. Display two columns:
-- rental_count_category (the rental count category) and customer_count (the number of customers in each category).

-- (It asks how many times customer rents and categories it)
-- so simple make group by on customer_id and count of customer_id and ctegories the count by case statment
-- from rental table(becuse rental contains rent information)

select customer_id , 
       count(customer_id) as No_of_times_customer_rents , 
       case WHEN count(customer_id) > 10 THEN 'More Than 10'
            WHEN count(customer_id) between 5 and 10 THEN 'between 5 and 10'
	        WHEN count(customer_id) < 5 THEN 'Fewer Than 5'
      END as Rental_count_category
      from rental group by customer_id 
	  order by customer_id asc;