-- Create database  Walmart

Create database Walmart;

-- Use database;

Use Walmart;




-- Create table 

Create table Walmart(Invoice_ID	varchar(50) primary key ,
                     Branch	varchar(50) not null ,
					 city varchar(50) not null ,
					 Customer_type varchar(50) not null ,
					 Gender varchar(50) not null ,
					 product_line varchar(50) not null ,
					 Unit_price float not null ,
                     Quantity int not null ,
					 Tax_5 float not null ,
                     Total float not null ,
					 Date Date not null ,
					 Time time not null,
					 Payment varchar(50) not null ,
					 cogs float not null ,
					 gross_margin_percentage float not null ,
					 gross_income float not null ,
					 Rating float not null
);




-- Check table

select * from walmart;



--- Feature Engineering


-- Exec sp_rename '[Walmart Sales Data]' , 'Walmart';  -- Change name of table


--Rename column name ;

--Exec sp_rename 'Walmart.Tax_5' , 'Tax_5_%';


-- We create one column which called time_of_day;

--Alter table walmart add time_of_day varchar(50);

select * from walmart;



-- We create column time_of_day this isnull just we update the values in it.

Update Walmart 
       set time_of_day = 

	   (case
	        WHEN time between '00:00:00.0000000' and '12:00:00.0000000' THEN 'Morning'
			WHEN time between '12:01:00.0000000' and '16:00:00.0000000' THEN 'Afternoon'
			ELSE 'Evening'
	    END);

-- Alter table walmart drop column time_of_day;



select * from Walmart;


-- Give names of day;


select DateName(weekday , Date) as Name_of_day from walmart;


Alter table walmart add day_name varchar(20);


Update walmart set day_name = datename(weekday , date);

select * from walmart;


-- Gives names of months


select Datename(Month , date) as Month_names from walmart;


Alter table walmart add Month_name varchar(50);


Update walmart set Month_name = Datename(Month , Date);


select * from walmart;



-- Data Analysis --

-- 1.How many distinct cities are present in the dataset?

select * from walmart;


select distinct city from walmart;


-- or 

-- if want count


select count(Distinct(city)) as No_of_city from walmart;


-- 2.In which city is each branch situated?


select city , 
       count(distinct(branch)) as No_of_branches 
	   from walmart group by city
       having count(distinct(branch)) = 3;



-- or


select  distinct city ,  branch from walmart;



-- 3.How many distinct product lines are there in the dataset?


select distinct product_line from walmart;


-- or 


-- if u want count


select count(distinct(product_line)) as Total_no_of_product_line from walmart;



-- 4.What is the most common payment method?


select TOP 1 payment , 
       count(Invoice_id) as No_of_times_used 
	   from walmart 
	   group by payment 
	   order by No_of_times_used desc;

-- or 


With Most_common_payment AS(

select payment , 
       count(payment) as No_of_times , 
	   Dense_Rank() over(order by count(payment) desc) as Rank_payment
	   from walmart group by payment
)

select * from Most_common_payment where Rank_payment <=1;



-- 5.What is the most selling product line?


select TOP 1 product_line , 
       count(Invoice_id) as No_of_times_buy
	   from walmart 
	   group by product_line
	   order by No_of_times_buy desc;

-- or 

With Most_selling_product_line AS(

select product_line , 
       count(product_line) as No_of_products ,
	   Dense_Rank() over(order by count(product_line) desc) as Rank_product_line
	   from walmart
	   group by product_line

)

select * from Most_selling_product_line where Rank_product_line <=1;


-- 6.What is the total revenue by month?


select Month_name , 
       sum(Total) as Total_revenue 
	   from walmart 
	   group by Month_name;


-- or 


-- mssql

select Datename(Month , date) as Month_name , 
       sum(Total) as Total_revenue 
	   from walmart 
	   group by Datename(Month , date);



-- postgrsql 


select extract(Month from Date) as Month_number   , 
       sum(Total) as Total_revenue 
	   from walmart 
	   group by extract(Month from date) 
	   order by Month_number asc;


-- or


-- mssql if multiple years;


select Datename(Year , Date) as Year_name , 
       Datename(Month , date) as Month_name , 
	   sum(Total) as Total_revenue from walmart group by 
	   Datename(Year , date) , Datename(Month , date)
	   order by Year_name asc , Month_name asc;


-- postgreql 


select extract(Year from date) as Year , 
       extract(Month from date) as Month_name , 
	   sum(Total) as Total_revenue 
	   from walmart 
	   group by extract(Year from date) , extract(Month from date)
	   order by Year asc , Month asc;



-- 7.Which month recorded the highest Cost of Goods Sold (COGS)?


select Datename(Month , date) as Month_name , 
       cast(sum(cogs) AS decimal(10,2)) as Total_cogs
	   from walmart
	   group by Datename(month , date)
	   order by Total_cogs desc;


-- or 

With Month_of_highest_cogs AS(

select Datename(Month , date) as Month_name  ,
       cast(sum(cogs) AS decimal(10,2)) as Total_cogs ,
	   Dense_Rank() over( order by sum(cogs) desc) as Rank_Month_name
	   from walmart
	   group by Datename(Month  ,date) 

)


select * from Month_of_highest_cogs where Rank_Month_name <= 1;


-- 8.Which product line generated the highest revenue?

select Top 1 product_line , 
       sum(Total) as Total_revenue 
       from walmart 
	   group by product_line 
	   order by Total_revenue desc;


-- or 

With Most_revenued_product_line AS(

select product_line ,
      cast(sum(Total) AS decimal(10,2)) as Total_revenue ,
	  Dense_Rank() over(order by sum(Total) desc) as Rank_product_line
	  from walmart
	  group by product_line

)

select * from Most_revenued_product_line where Rank_product_line <= 1;
	 

-- 9.Which city has the highest revenue?

select Top 1 city , 
       sum(Total) as Total_revenue 
       from walmart 
	   group by city 
	   order by Total_revenue desc; 

-- or 


With Most_revenued_city AS(

select city ,
       cast(sum(Total) AS decimal(10,2)) as Total_revenue ,
       Dense_Rank() over(order by sum(Total) desc) as Rank_Total
	   from walmart
	   group by city

)

select * from Most_revenued_city where Rank_Total <= 1;




-- 10.Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad',based on whether 
-- its sales are above the average.

Alter table walmart Add Product_category varchar(20);   -- Add column



-- Update the values in column

Update walmart set product_category = 

        case 
		     WHEN Total > (select avg(Total) from walmart) THEN 'Good'
			 ELSE 'Bad'
		END;


-- 11.Which branch sold more products than average product sold?



select branch , 
       sum(Quantity) as Total_quantity , 
	   (select avg(Quantity) from walmart) as avg_Quantity
       from walmart 
	   group by branch 
	   having sum(Quantity) > (select avg(Quantity) from walmart);

-- or 


select branch , 
       sum(Quantity) as Total_quantity , 
	   avg(Quantity) as avg_Quantity
       from walmart 
	   group by branch 
	   having sum(Quantity) >  avg(Quantity); 



-- 12.What is the most common product line by gender?


With Most_common_product_line_by_gender AS(

select Gender , 
       Product_line , 
	   count(product_line) as No_of_product_line ,
       Dense_Rank() over(partition by Gender order by count(product_line) desc) as Rank_product_line
       from walmart 
	   group by Gender , Product_line

)

select * from Most_common_product_line_by_gender where Rank_product_line <= 1;


-- 13.What is the average rating of each product line?

select Product_line , 
       cast(avg(rating) AS decimal(10,2)) as avg_rating 
	   from walmart
	   group by Product_line 
	   order by Product_line;

	   
-- 14.Number of sales made in each time of the day per weekday (no_of_orders)


select Datename(weekday , date) as Day_name , 
       count(Invoice_id) as No_sales 
	   from walmart 
	   group by Datename(weekday , date)
       having Datename(weekday , date) not in ('Sunday' , 'Saturday')
       order by Day_name asc;


-- or


select datename(weekday , date) as day_name , 
       count(Invoice_id) as No_of_orders 
	   from walmart
       where Datename(weekday , date) not in ('Sunday' , 'Saturday') 
	   group by datename(weekday , date)
       order by day_name asc;



-- 15.Identify the customer type that generates the highest revenue.



select Top 1 customer_type , 
       cast(sum(Total) AS decimal(10,2)) as Total_revenue
       from walmart 
	   group by customer_type order by Total_revenue desc;


-- or 


With Highest_revenue_customer_type AS(

select customer_type ,
       cast(sum(Total) AS decimal(10,2)) as Total_revenue , 
	   Dense_Rank() over(order by sum(Total) desc) as Rank_customer_type
	   from walmart
	   group by customer_type

)

select * from Highest_revenue_customer_type where Rank_customer_type <= 1;


-- 16.How many unique customer types does the data have?

select count(distinct(customer_type)) as No_of_unique_customers from walmart;

-- or 

select distinct customer_type from walmart;

-- 17.How many unique payment methods does the data have?


select count(distinct(payment)) as No_of_payment_mehod from walmart;

-- or

select  distinct  payment from walmart;

--18.Which is the most common customer type?


With Most_common_customer_type AS(

select customer_type ,
      count(customer_type) as No_of_customers ,
	  Dense_Rank() over(order by count(customer_type) desc) as Rank_customer_type
	  from walmart
	  group by customer_type

)

select * from Most_common_customer_type where Rank_customer_type <= 1;



-- 19.Which customer type buys / revenue the most?


select Top 1 customer_type ,
       cast(sum(Total) AS decimal(10,2)) as Total_revenue
	   from walmart
	   group by customer_type
	   order by Total_revenue desc;


-- or 

With Most_revenue_customer_type AS(

select customer_type , 
        cast(sum((unit_price * Quantity) + Tax_5_percent) AS decimal(10,2)) as Total_revenue ,
		Dense_Rank() over(order by sum( unit_price * Quantity) desc) as Rank_customer_type
		from walmart group by customer_type

)

select * from Most_revenue_customer_type where Rank_customer_type <= 1;



-- 20.What is the gender of most of the customers?
	 

select Top 1 Gender , 
       count(gender) as No_of_customers_gender 
       from walmart 
	   group by gender 
	   order by No_of_customers_gender desc;


-- or 

With Most_customers_gender AS(

select Gender , 
       count(gender) as No_of_customers_Gender ,
	   Dense_Rank() over(order by count(gender) desc) as Rank_gender
	   from walmart
	   group by gender

)


select * from Most_customers_gender where Rank_gender <= 1;
	 


-- 21.What is the gender distribution per branch?

select Branch ,
       Gender ,
       count(Gender) as No_of_genders 
	   from walmart 
	   group by branch , Gender
	   order by Branch asc;


-- 22.Which time of the day do customers give most ratings?


select Top 1 Time_of_day ,
       count(Rating) as No_of_Ratings
	   from walmart
	   group by Time_of_day
	   order by No_of_Ratings desc;


-- or 

With Most_ratings_time AS(

select Time_of_day , 
       count(Rating) as No_of_ratings , 
	   Dense_Rank() over(order by count(Rating) desc) as Rank_Time_of_day
	   from walmart
	   group by Time_of_day
	  
)

select * from Most_ratings_time where Rank_Time_of_day <= 1;
       

-- 23.Which time of the day do customers give most ratings per branch?


With Most_ratings_time_per_branch AS(

select Branch , 
       Time_of_day , 
	   count(Rating) as count_rating , 
	   Dense_Rank() over(partition by branch order by count(Rating) desc) as Rank_Time_of_day
	   from walmart
	   group by branch , Time_of_day
       
)

select * from Most_ratings_time_per_branch where Rank_Time_of_day <= 1;

-- In evening , give most no of ratings per branch;

-- 24.Which day of the week has the best avg ratings?


With Best_avg_ratings_day AS(

select Datename(weekday , date) as day_name , 
       cast(avg(rating) AS decimal(10,2)) as avg_rating , 
	   Dense_Rank() over(order by avg(rating) desc) as Rank_day_name
	   from walmart group by datename(weekday , date) 
)

select * from best_avg_ratings_day where Rank_day_name <= 1;


-- or 



select Top 1 Datename(weekday , date) as day_name , 
       cast(avg(rating) AS decimal(10,2)) as avg_rating 
	   from walmart group by datename(weekday , date)
	   order by avg_rating desc;


-- 25.Which day of the week has the best average ratings per branch?

With best_avg_ratings_day_per_branch AS(

select branch , 
       Datename(weekday , date) as Day_name ,
	   avg(Rating) as avg_rating ,
	   Dense_Rank() over(partition by branch order by avg(rating) desc) as Rank_day_name
	   from walmart group by branch , Datename(weekday , date)

)

select * from best_avg_ratings_day_per_branch where Rank_day_name <= 1;
