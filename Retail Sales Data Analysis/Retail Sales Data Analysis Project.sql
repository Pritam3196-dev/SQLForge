-- Create database 

create database Retail_Sales_Analysis;

-- Use that database

Use Retail_Sales_Analysis;

--- Create table

Create table Retail_Sales(transactions_id int primary key , 
                          Sale_Date Date , 
						  Sale_Time time , 
						  Customer_id int ,
						  Gender varchar(10),
						  Age int ,
						  Category varchar(30) ,
						  Quantity int ,
						  Price_Per_Unit int , 
						  Cogs int ,
						  Total_Sale int);


-- Check Table --

select * from Retail_Sales;



--- We change data type of cogs from int to decimal

Alter table Retail_Sales Alter column cogs TYPE decimal(10,2) Using cogs :: decimal(10,2)



--- Data is inserted by just upload the file byimport / Export Data option in pgadmin4 tool ;


-- Now check all data is perfectly inserted or not;

select * from Retail_Sales;



-- cehck how many records we have;

select count(*) from Retail_sales;


--- Check Null values in every columns ;


select * from Retail_Sales where Transactions_id is NULL

or 

Sale_Date is NULL

or

sale_time is NULL

or

customer_id is NULL

or

gender is NULL

or

age is NULL   --

or

category is NULL

or 

quantity is NULL  --

or

price_per_unit is NULL --

or 

cogs is NULL --

or

total_sale is NULL;




-- We get 13 records in whole data which is  having null values . so we dropped that records 


Delete from Retail_Sales where transactions_id is NULL

or 

Sale_Date is NULL

or

Sale_Time is NULL

or 

Customer_id is NULL

or

gender is NULL

or

age is NULL

or 

Category is NULL

or 

Quantity is NULL

or

Price_per_unit is NULL

or

cogs is NULL

or

Total_Sale is NULL;







--- After cleaning data 


select * from Retail_sales;


-- now we have 1987 records initially it was 2000 . we delete 13 records which was NULL;



-- 1. How many sales we have ? ( How many sales happened in terms of count)



select count(total_Sale) from Retail_Sales;

or 

select count(*) from Retail_Sales;


-- 2. How many uniuque customers we have ?

select count(distinct(customer_id)) as No_of_unique_customer from Retail_Sales;


-- 3.Write a SQL query to retrieve all columns for sales made on '2022-11-05';


select * from Retail_Sales where Sale_Date in 
             (select Sale_Date from Retail_Sales where Sale_date = '2022-11-05');


-- 4.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is 
-- more than 3 in the month of Nov-2022;


select * from Retail_Sales 
         where category in (select category from Retail_Sales where category = 'Clothing') 
		 and
         Quantity in (select quantity from Retail_Sales where Quantity > 3) 
         and  
		 extract(Month from sale_Date) = 11 and extract(year from Sale_Date) = 2022;


-- 3.Write a SQL query to calculate the total sales (total_sale) for each category

select category , 
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by Category 
	   order by Category asc;



-- 4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category


select cast(avg(age) As decimal(10,2)) as avg_age from Retail_Sales where Category = 'Beauty';


-- or


select cast(avg(age) AS decimal(10,2)) as average_age , 
       category from Retail_Sales 
	   where Category = 'Beauty' 
	   group by Category;



-- 5.Write a SQL query to find all transactions where the total_sale is greater than 1000.


select * from Retail_Sales where Total_Sale in (select Total_Sale from Retail_Sales where Total_Sale > 1000);

-- or


select transactions_id from Retail_Sales where Total_Sale in 
      (select Total_Sale from Retail_Sales where Total_sale > 1000);



-- 6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in 
-- each category.


select Category , 
       gender , 
	   count(transactions_id) as No_of_Transactions 
	   from Retail_Sales 
	   group by Category , gender 
	   order by Category asc;


-- 7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

--  avg sale for each month and find the best avg selling month


With best_avg_selling_month_each_year AS(

select extract(Year from Sale_Date) as Year ,
       extract(Month from Sale_Date) as Month , 
       cast(avg(Total_Sale) As decimal(10,2)) as avg_sale  , 
	   Dense_Rank() over(partition by extract(Year from Sale_Date) order by avg(Total_Sale) desc) as Rank_Month
	   from Retail_Sales 
	   group by  extract(Year from Sale_Date) ,extract(Month from Sale_Date) 


)


select * from best_avg_selling_month_each_year where Rank_Month <= 1;




-- Best selling month in each year



With Best_Selling_Month_Each_Year AS(

select extract(year from Sale_Date) as Year , 
       extract(Month from Sale_Date) as Month , 
	   sum(Total_Sale) as Total_Sale , 
	   Dense_Rank() over(partition by extract(Year from Sale_date) 
	   order by sum(Total_Sale) desc) as Rank_Months
       from Retail_Sales 
	   group by extract(Year from Sale_Date) , 
	   extract(Month from Sale_Date)

)

select * from Best_Selling_Month_Each_Year where Rank_Months <= 1;



-- 8.Write a SQL query to find the top 5 customers based on the highest total Sales


select customer_id , 
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales group by customer_id 
       order by Total_Sales desc LIMIT 3;


-- or  


With Top_three_customers_highest_total_sales AS(


                  select customer_id , 
						  sum(Total_sale) as Total_Sales ,
                          Dense_Rank() over(order by sum(Total_Sale) desc) as Rank_customer_id
                          from Retail_Sales 
						   group by customer_id

)

select * from Top_three_customers_highest_total_Sales where Rank_customer_id <= 3;



-- 9.Write a SQL query to find the number of unique customers who purchased items from each Category


select category , 
       count(distinct(customer_id)) as count_unique_customers
       from Retail_sales 
	   group by category  
	   order by category asc;



-- non distinct

select category , 
       count(customer_id) as No_of_customers 
	   from Retail_Sales group by Category 
       order by No_of_customers asc;



-- 10.Write a SQL query to create each shift and number of orders (Example Morning <=12, 
-- Afternoon Between 12 & 17, Evening >17)




select  case 
            WHEN extract(hour from Sale_time) < 12 THEN 'Morning' 
			WHEN extract(hour from sale_time) between 12 and 17  THEN 'Afternoon' 
			WHEN extract(hour from sale_time) > 17 THEN 'Evening'
		END as Shifts ,

		count(transactions_id) as No_of_orders

		from Retail_Sales group by  
		case 
            WHEN extract(hour from Sale_time) < 12 THEN 'Morning' 
			WHEN extract(hour from sale_time) between 12 and 17  THEN 'Afternoon' 
			WHEN extract(hour from sale_time) > 17 THEN 'Evening'
		END
		order by Shifts ;
		


-- 11 . Data Aggregation and Filtering
-- Q.1: Write an SQL query to calculate the total sales for each category and return only those categories 
-- where the total sales are greater than 5,000.


select category , 
       sum(Total_Sale) as Total_Sales 
       from Retail_Sales 
	   group by Category 
	   having sum(Total_Sale) >  5000
	   order by Category asc;


-- Q.2: For each gender, calculate the average age of the customer who made a purchase and 
-- the total quantity sold. Sort the result by total quantity sold in descending order.


select gender , 
       cast(avg(age) AS decimal(10,2)) as avg_age , 
	   sum(Quantity) as Total_Quantity_Sold
       from Retail_Sales 
	   group by gender 
	   order by Total_Quantity_Sold desc;




-- 12. Join Operations
-- Q.1: Write a query to find the Customer_id and Gender of customers who made purchases in 
-- both "Clothing" and "Beauty" categories. Assume there is no direct relationship between the transactions, 
-- but the same customer can appear in both categories.


With Clothing_customer AS(

select customer_id , gender  from Retail_Sales where category = 'Clothing' group by customer_id , 
gender , category 


) ,



Beauty_Customer AS(

select customer_id , gender from Retail_Sales where category = 'Beauty' 
group by customer_id , gender , category


)

select distinct c.customer_id , b.gender from Clothing_customer as c inner join 
Beauty_Customer as b on c.customer_id = b.customer_id




-- 3. Date and Time Functions
-- Q.1: Write an SQL query to find the top 5 most popular purchase hours (i.e., the hour portion of Sale_Time)
-- for all sales and return the number of sales made during each of these hours.


select extract(hour from sale_time) as hour , 
       count(transactions_id) as No_of_Sales 
	   from Retail_Sales 
	   group by
       extract(hour from sale_time) 
	   order by No_of_Sales desc LIMIT 6;


-- or 


With Top_five_customers_highest_sales AS(

select extract(hour from Sale_Time) as Hour , count(Transactions_id) as No_of_sales  ,
Dense_Rank() over(order by count(Transactions_id) desc) as Rank_hours
from Retail_Sales group by extract(Hour from Sale_Time) 

)


select * from Top_five_customers_highest_sales where Rank_hours <= 5;



-- Q.2: Calculate the total sales per month from the Sale_Date. What is the month with the highest sales? 
-- Write a query to get this result.



select extract(Month from Sale_Date) as Month , 
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by extract(Month from Sale_Date)
       order by Total_Sales desc LIMIT 1;


-- or 


With Highest_Month_Sales AS(

select extract(Month from Sale_Date) as Month , 
       sum(Total_Sale) as Total_Sales ,
       Dense_Rank() over(order by sum(Total_Sale) desc) as Rank_Months
       from Retail_Sales 
	   group by extract(Month from Sale_Date)


)

select * from Highest_Month_Sales where Rank_Months <= 1;




-- 4. Subqueries
-- Q.1: Write a query to find the customers who have made the highest number of purchases (quantity sold). 
-- List their Customer_id, Total_Sale, and the number of purchases made.




select customer_id , 
       sum(Total_Sale) as Total_Sale , 
	   sum(Quantity) as No_of_purchases from Retail_Sales 
       group by customer_id 
	   order by No_of_purchases desc LIMIT 1;


-- or 

With Highest_no_of_purchases_customer_id AS(

select customer_id , sum(Total_Sale) as Total_Sales , sum(Quantity) as No_of_purchases ,
Dense_Rank() over(order by sum(Quantity) desc) as Rank_customer_id
from Retail_Sales group by customer_id


)

select * from Highest_no_of_purchases_customer_id where Rank_customer_id <= 1;




--15. Window Functions

-- Q.1: Use the ROW_NUMBER() window function to rank transactions within each category by Total_Sale in 
-- descending order. Return the rank, Category, and Total_Sale.



select ROW_Number() over(order by sum(Total_Sale) desc) as Rank_Category , 
       Category , 
	   sum(Total_Sale) as Total_Sale 
       from Retail_Sales 
	   group by Category;


-- or 


select Dense_Rank() over(Order by sum(Total_Sale) desc) as Rank_Category , 
       Category , 
	   sum(Total_Sale) as Total_Sale
       from Retail_Sales group by Category;


	   

-- Q.2: Calculate the cumulative total sales for each category, starting from the earliest sale date to 
-- the most recent sale date.


With  Cumulative_Total_Sales AS(

select category , 
       sale_date , 
       -- sum(Total_Sale) as Total_Sales ,
       SUM(Total_Sale) over(partition by category order by Sale_date asc) as Cumulative_sum
	   from Retail_Sales group by category , sale_date , Total_Sale 


)


select category , cast(sum(cumulative_sum) As decimal(10,2)) as Total_cumulative_sum 
from Cumulative_Total_Sales group by category;




-- 16.Write an SQL query to find the categories where the average Price_Per_Unit is greater than 100. 
-- Return the category and the average price per unit.


select category , 
       cast(avg(price_per_unit) AS decimal(10,2)) as avg_price_per_unit 
	   from Retail_Sales 
       group by category 
	   having avg(price_per_unit) > 100;



-- 17.Find the top 3 customers who have made the highest total sales. Use the Customer_id and 
-- Total_Sale fields.


select customer_id , 
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by Customer_id
       order by Total_Sales desc LIMIT 3;


-- or 


With Top_Three_customers_with_highest_sale AS(

               select customer_id , 
			          sum(Total_Sale) as Total_Sales ,
                      Dense_Rank() over(order by sum(Total_Sale) desc) as Rank_customer_id
                      from Retail_Sales 
					   group by customer_id 

)

select * from Top_Three_customers_with_highest_sale where Rank_customer_id <=3;


-- Q.18.: There is a chance that some of the data in Sale_Date has been entered in a non-standard format 
-- (e.g., MM-DD-YYYY vs YYYY-MM-DD). Write a query to standardize the Sale_Date format to YYYY-MM-DD.


Update Retail_Sales set Sale_Date = To_Date(Sale_Date , 'YYYY-MM-DD')
where sale_Date = To_date(Sale_Date , 'MM-DDD-YYYY') is not null;

---- or 


UPDATE Retail_Sales 
SET Sale_Date = TO_DATE(Sale_Date, 'MM-DD-YYYY')::DATE
WHERE Sale_Date ~ '^\d{2}-\d{2}-\d{4}$';



-- Q.19.Some records have a Total_Sale value that doesn't match Quantity * Price_Per_Unit. Write a query 
-- to find those records and calculate the correct Total_Sale.


With check_Total_Sales AS(

select transactions_id , 
       Sale_date , 
	   Customer_id , 
	   category ,
	   Quantity , 
	   Price_Per_unit , 
       Quantity * Price_per_unit as Total_Sales_by_manually ,
	   Total_Sale from Retail_Sales

)

select * from Check_Total_Sales where Total_Sales_by_manually != Total_Sale;


-- 20.Calculate the profit margin for each transaction

select transactions_id ,
       concat( cast(cast((Total_Sale - cogs) As Decimal(10,2)) / Total_Sale * 100 
	   As decimal(10,2)) , '%') as Profit_Margin  , category
       from Retail_Sales 
       order by Transactions_id asc;



-- 21.For each category, calculate the difference between the total sales (Total_Sale) and 
-- the total cost of goods sold (Cogs). Which category has the highest difference?



With Highest_difference_between_Total_Sales_and_Total_cogs AS(

select category , 
       sum(Total_Sale) as Total_Sales , 
	   sum(cogs) as Total_cost_of_goods_sold 
	   from Retail_Sales
       group by category

)

select category , 
(Total_Sales - Total_cost_of_goods_sold) as Difference
from Highest_difference_between_Total_Sales_and_Total_cogs;


-- Q.22: Write a query to determine if there is a correlation between the Age of the customer 
-- and the Total_Sale. You can group customers by age ranges (e.g., 18-25, 26-35) and calculate the total 
-- sales for each group.



select age , 
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by age 
	   order by Total_Sales desc;


-- Q.23: Given that Price_Per_Unit is a factor in sales, write a query to check if higher-priced items 
-- tend to be sold in higher quantities. You can calculate the correlation between Price_Per_Unit and Quantity.



select Quantity , price_per_unit from Retail_Sales order by price_per_unit desc , quantity desc


-- Whatever that results displayed by this query copy that data and check their visualization in powerbi or excel
-- by scatter plot because they want see correlation 


-- Q.24.Assume that the business is running a loyalty program. Customers who buy more than 3 items in a 
-- single transaction receive a 10% discount. Write a query to find out the total amount of discounts applied 
-- in each category, based on the number of items purchased.

With category_wise_total_Doscount AS(

select Transactions_id , 
       Total_Sale as original_amount , 
	   quantity , 
	   Category , 
       ((Total_Sale * 10) / (100)) as amount_after_Discount 
	   from Retail_Sales
       where Quantity > 3

)

select category , sum((Total_sale * 10) / (100)) as Total_amount_discount from Retail_Sales group by category
order by Total_amount_discount desc;



-- Q.25: Write a query to find the top-selling product categories for each gender.
-- Include Gender, Category, and Total_Sale. Ensure that the results are sorted by Total_Sale in descending 
-- order.


With Highest_category_by_Gender AS(

select Gender , 
       category , 
	   sum(Total_Sale) as Total_Sale  ,
       Dense_Rank() over(partition by Gender order by sum(Total_Sale) desc) as Rank_Category
       from Retail_Sales 
	   group by Gender , Category
)

select * from Highest_category_by_Gender where Rank_Category <= 1;


-- Q.26.Suppose the Retail_Sales table has millions of rows. How would you optimize a query that calculates 
-- the total sales by Category? Mention any indexing strategies you would use.



create index index_category on Retail_Sales(category)   -- step first

-- Index on category which makes faster grouping . create indexingon group by column

select category ,                                      -- step second
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by Category 
	   order by Total_Sales desc;


-- Q.27: If the query to calculate the average age of customers for each gender is taking too long, what 
-- would be the steps to improve its performance?


Create index index_gender ON Retail_Sales(Gender , age);

-- Here as per problem statment it says it take too long for each gender avg_age so for that we make index on
-- Gender and age both so it make faster operations 
-- like Gender is group by column so it make faster grouping the records into gender group
-- and another column is age so it has aggrigation function so it make summation faster so it avoid too long
-- for each gender for avg_age

select gender , cast(avg(age) AS decimal(10,2)) as avg_age from Retail_Sales group by Gender;


-- Q.28: Write a query to find the customers who have made only one purchase in total. Return their 
-- Customer_id, Gender, and Total_Sale.


select customer_id , 
       gender , 
	   sum(Total_Sale) as Total_Sales 
       from Retail_Sales group by customer_id , gender
       having count(customer_id) = 1;


-- Q.29.Using Sale_Date, write a query to find the period (month/year) where the sales peak 
-- and identify how many transactions contributed to the peak.


select extract(Month from Sale_Date) as Month , 
       extract(Year from Sale_Date) as Year , 
       count(Transactions_id) as No_of_transactions from Retail_Sales
       group by extract(Month from Sale_Date)  , extract(Year from Sale_Date)
	   order by No_of_transactions desc LIMIT 1;

-- or 

With Peak_Month_Transactions AS(

select extract(Month from Sale_Date) as Month , extract(Year from Sale_date) as Year , count(Transactions_id)
as No_of_transactions, 
Dense_Rank() over(order by count(Transactions_id) desc) as Rank_Months
from Retail_Sales
group by extract(Month from Sale_Date) , extract(Year from Sale_Date)

)

select * from Peak_Month_Transactions where Rank_Months <= 1;



-- or

-- Yearwise Peak Sales Transactions

With peak_Sales AS(

select extract(Year from Sale_Date) as Year , 
       extract(Month from Sale_Date) as Month ,
       count(transactions_id) as No_of_Transactions , 
       Dense_Rank() over(partition by extract(Year from Sale_Date) order by count(transactions_id) desc) as Rank_Month
	   from Retail_Sales group by extract(Year from Sale_Date) , extract(Month from Sale_Date) 
)

select * from peak_Sales where Rank_Month <= 1;




-- Q.30.Write a query to find the total sales for each week (consider the week starting from Sunday). 
-- Use Sale_Date to determine the week and return the week number along with total sales.


select extract(Year from Sale_Date) as Year , 
       extract(Month from Sale_Date) as Month ,
       extract(Week from Sale_date) as Week  , 
	   sum(Total_Sale) as Total_sales , 
	   Row_number() over(partition by extract(Year from Sale_Date) order by 
	   extract(week from Sale_Date) asc) as Row_number_Month
       from Retail_Sales
	   group by
	   extract(Year from Sale_Date) ,
       extract(Month from Sale_Date) ,
       extract(Week from Sale_date)
	   
---- or 

SELECT 
    EXTRACT(YEAR FROM Sale_Date) AS Year,
    EXTRACT(MONTH FROM Sale_Date) AS Month,
    EXTRACT(WEEK FROM Sale_Date) AS Week,
    SUM(Total_Sale) AS Total_Sales,
    ROW_NUMBER() OVER (
        PARTITION BY EXTRACT(YEAR FROM Sale_Date), EXTRACT(MONTH FROM Sale_Date)
        ORDER BY EXTRACT(WEEK FROM Sale_Date)
    ) AS Week_Number_In_Month
FROM Retail_Sales
GROUP BY 
    EXTRACT(YEAR FROM Sale_Date),
    EXTRACT(MONTH FROM Sale_Date),
    EXTRACT(WEEK FROM Sale_Date)
ORDER BY Year, Month, Week;




-- Q.31.Using Sale_Date and Total_Sale, find the quarterly growth in sales. 
-- Compare the total sales in Q1 and Q2, and determine the percentage change.


With percentage_change AS(

select extract(Year from Sale_Date) as Year , 
       extract(Quarter from Sale_Date) as Quarter  ,
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by extract(Year from Sale_Date) , 
       extract(Quarter from Sale_Date) 
	   order by Year asc , Quarter asc

)

select l.Year , l.total_Sales as Q1_total_Sales , r.total_Sales as Q2_total_Sales ,
concat(cast(cast(((r.total_Sales) - (l.total_Sales)) AS decimal(10,2)) / (l.total_Sales) * 100  
AS decimal(10,2)) , ' %')
from percentage_change as l
inner join percentage_change as r on l.year = r.year and l.quarter = 1 and r.quarter = 2;



-- Q.32.Find the top 5 customers who have made the highest total sales.

select customer_id , 
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by customer_id 
	   order by Total_Sales desc LIMIT 5;


-- or 


With Top_five_customers_highest_sales AS(

select customer_id , 
       sum(Total_Sale) as Total_Sales , 
       Dense_Rank() over(order by sum(Total_Sale) desc) as Rank_customer_id
       from Retail_Sales 
	   group by customer_id 

)


select * from Top_five_customers_highest_sales where Rank_customer_id <= 5;


-- Q.33.Calculate the total sales for each product category and return only those categories where 
-- the total sales exceed 5,000.


select category , 
       sum(Total_Sale) as Total_Sales 
	   from Retail_Sales 
	   group by category
       having sum(Total_Sale) > 5000;



-- Q.34.Find the average age of customers who made a purchase in the 'Clothing' category.

select category , 
       cast(avg(age) AS decimal(10,2)) as average_age 
	   from Retail_Sales 
	   where category in (select category from Retail_Sales where category = 'Clothing')
       group by category;


-- Q.35.What is the total quantity sold for each product category in 2022?

select category , 
       sum(Quantity) as No_of_quantities  , 
	   extract(Year from Sale_date) as Year
	   from Retail_Sales 
	   where extract (Year from sale_date) = 2022
	   group by category  , extract(Year from sale_date)
	   order by No_of_quantities desc; 


-- Q.36.Identify the best-selling month (highest total sales) for each year.


With Best_Selling_Month_For_Each_Year AS(

select extract(Year from Sale_Date) as Year , 
       extract(Month from Sale_Date) as Month ,
	   sum(Total_Sale) as Total_Sales , 
	   Dense_Rank() over(partition by extract(Year from Sale_Date)  order by sum(Total_Sale) desc) as Rank_month
	   from Retail_Sales group by extract(Year from Sale_Date) , extract(Month from Sale_date)

)

select * from Best_Selling_Month_For_Each_Year where Rank_Month <= 1;
	   

