 
-- business_demand_overview_user  name of database / username
-- password system;
-- connection name Business_demand_overview_and_user_stories;



Create table Calender(

        Datekey number primary key ,
        FullDate  Date not null ,
        Day varchar(30) not null ,
        month varchar(30) not null ,
        monthshort varchar(30) not null ,
        monthno int not null ,
        Quarter int not null ,
        year number not null
        
);

select * from calender;

-- insrt data into calender table

--
--insert into Calender(Datekey , FullDate , Day , Month , monthshort , monthno , quarter , year)
--            values(20190101 , To_date('01-01-2019' , 'dd-mm-yyyy') , 'Tuesday' , 'January' , 'Jan' , 1 , 1 , 2019);
--Insert into calender(Datekey , FullDate , Day , Month , Monthshort , monthno , quarter , year)
--                 values (20190102 , To_date('02-01-2019' , 'dd-mm-yyyy') , 'Wednesday' , 'January' , 'Jan' , 1, 1, 2019);
--Insert into calender(Datekey , FullDate , Day , Month , Monthshort , monthno , quarter , year)
--                values (201901103, To_date('03-01-2019' , 'dd-mm-yyyy') , 'Thursday' , 'January' , 'Jan' , 1 ,1 , 2019);
--Insert into calender(Datekey , FullDate , Day , Month , Monthshort , monthno , quarter , year)
--            values(201901104 , To_date('04-01-2019' , 'dd-mm-yyyy') , 'Friday' , 'January' , 'Jan' , 1 , 1 , 2019);
--

--truncate table calender;

select * from calender;


-- Create table Customer;


Create table customer(


           Customerkey int primary key ,
           FirstName varchar(50) not null ,
           LastName varchar(50) not null ,
           Full_name varchar(100) not null ,
           Gender varchar(10) not null ,
           Datefirstpurchase Date not null ,
           Customer_city varchar(50) not null
           
           );
           
           
---- Insert data into customer table
--
--Insert into customer(Customerkey , FirstName , LastName , Full_name , Gender , Datefirstpurchase , Customer_city)
--values(11000 , 'Jon' , 'Yang' , 'Jon Yang' , 'Male'  , To_date('2018-01-19' , 'yyyy-mm-dd') , 'Rockhampton');
--
--Insert into customer(Customerkey , FirstName , LastName , Full_name , Gender , Datefirstpurchase , Customer_city)
--values(11001 , 'Eugene' , 'Huang' , 'Eugen Huang' , 'Male' , To_date('2018-01-15' , 'yyyy-mm-dd') , 'Seaford');
--
--
--select * from customer;
--truncate table customer;


select * from customer;


-- Some Manupulation ;


Insert into customer(Customerkey , FirstName , LastName , Full_name , Gender , Datefirstpurchase , customer_city )
            values(31010 , 'Alice' , 'smith' , 'Alice Smith' , 'Female' , to_date('2019-05-15' , 'yyyy-mm-dd') , 'Brisbane');


--change city 'sydeny';

update customer set customer_city = 'Sydney' where customerkey = 31010;

-- Remove all customers who made their first purchase before '2018-01-01'.



Delete from customer where datefirstpurchase < To_date('2018-01-01' , 'yyyy-mm-dd');

Rollback;

-- Update the month field in the Calender table to be in uppercase for all records in 2019.

update calender set month = upper(month) where year = 2019;

select * from calender;

Update calender set month = lower(month) where year = 2019;



--  Add a new date entry in the Calender table for January 5, 2019, with correct Datekey, Day, Month, monthshort, monthno, quarter, and year.

Insert into calender(Datekey , FullDate , Day , Month , Monthshort , MonthNo , Quarter , Year)
            values(40001 ,To_date('2019-01-05' , 'yyyy-mm-dd') , 'Thursday' , 'January' , 'Jan' , 1 , 1 , 2019);
            

-- Delete all calendar entries for the year 2017.

Delete from calender where year = 2017;

Rollback;


-- Fix the spelling of the city 'Seaford' to 'Seaford East' for all customers from that city.

-- select * from customer where customer_city = 'Seaford_East';

update customer set customer_city = 'Seaford_East' where customerkey in 
(select customerkey from customer where customer_city = 'Seaford');

--


update customer set customer_city = 'Seaford' where customerkey in 
(select customerkey from customer where customer_city = 'Seaford_East');


-- Insert multiple new customers in a single query (at least 3 customers).

select * from customer;

Insert all 
     into customer(Customerkey , FirstName , LastName , Full_Name , Gender , Datefirstpurchase , customer_city)
          values(50001 , 'Radha' , 'Krishn' , 'Radha Krishn' , 'Male' , To_date('2018-01-19' , 'yyyy-mm-dd') , 'vrindawan')
    into customer(customerkey , FirstName , LastName , FullName ,Gender , Datefirstpurchase , customer_city)
          values (50002 , 'Vrundawaneshwari' , 'krishnsanyuta' ,  'vrundawaneshwari krishnsanyuta', 'Female' , To_date('2019-01-19' , 'yyyy-mm-dd') , 'vrindawan'),
    into customer(customerkey , FirstName , LastName , FullName , Gender , Datefirstpurchase , customer_city)
          values(50003 ,'Satyabhama' , 'Raseshwari' , 'Satyabhama raseshwari' ,  'Female' , To_date('2019-01-21' , 'yyyy-mm-dd') , 'vrindawan');
select * from dual;




-- Set the Gender to 'Unknown' for customers whose gender is currently NULL or empty.

Update customer set gender = 'Unknown' where customerkey in

(select customerkey from customer where gender is null);


-- Delete customers who have the same first and last name.

Delete  from customer where customerkey in 
(select customerkey  from customer where firstname = lastname);

Rollback;


-- drop table Products;
-- Create products table;

select * from products;

Create table products(

       Productkey int primary key ,
       ProductItemCode varchar(30)  ,
       ProductName varchar(50)  ,
       SubCategory varchar(50) ,
       ProductCategory varchar(50)  ,
       Productcolor varchar(50)  ,
       ProductSize varchar(10)  ,
       Product_Line varchar(30)  ,
       Product_model_name varchar(100) ,
       Product_description varchar(200) ,
       Product_Status varchar(20)

);


-- insert data into it ;


Insert into products(Productkey , ProductItemCode , ProductName , Subcategory , ProductCategory , Productcolor , ProductSize , Product_Line ,
                          Product_Model_name , Product_description , Product_Status)
                 values(210 , 'FR-R92B-58' , 'HL Road Frame - Black, 58' , 'Road Frames' , 'Components' , 'Black' , 58 , 'R' , 'HL Road Frame' , 'Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.' , 'Current');
                      
Insert into Products(Productkey , ProductItemCode , ProductName , Subcategory , ProductCategory , Productcolor , ProductSize , Product_Line ,
                          Product_Model_name , Product_description , Product_Status)
            values(211 , 'FR-R92R-58' , 'HL Road Frame - Red, 58' , 'Road Frames' , 'Components' , 'Red' , 58 , 'R' , 'HL Road Frame' , 'Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.' , 'Current');
                 
                 
select * from products;

-- delete from products;


--drop table InternetSales;
-- Create Internet Sales table 

Create table InternetSales(


    productkey int  ,
    orderdatekey int  ,
    DueDatekey int ,
    ShipDatekey int ,
    Customerkey int ,
    Salesordernumber varchar(30) ,
    SalesAmount int , 
    foreign key (Productkey) references Products(productkey),
    foreign key (Customerkey) references Customer(Customerkey)
    
);


Alter Table InternetSales modify Salesordernumber varchar(20);

-- Insert data into table ;


Insert into InternetSales(Productkey , orderdatekey , dueDatekey , Shipdatekey ,Customerkey , Salesordernumber , SalesAmount)
            values(381 , 20190101 , 20190113 , 20190108 , 16942 , 'SO46700' , 1000.4375);
            
Insert into InternetSales(Productkey , orderdatekey , dueDatekey , Shipdatekey , Customerkey , Salesordernumber , SalesAmount)
            values(375 , 20190101 , 20190113 , 20190108 , 15114 , 'SO46701' , 2181.5625);





select * from InternetSales;





--- Now tables are ready now ;



-- 1.Retrieve all customers who live in 'Sydney'.


select * from customer where customer_city = 'Sydney';


-- 2.Find all products that belong to the category 'Components'.

select * from products where ProductCategory = 'Components';

-- 3.List all sales (from InternetSales) where SalesAmount is greater than 1000.

select * from InternetSales where SalesAmount > 1000;

-- 4.Get the total sales amount grouped by Customerkey.

select * from customer;
select * from internetsales;


select Customerkey , sum(SalesAmount) as Total_Sales from internetSales group by Customerkey;
-- or 

select c.customerkey , sum(SalesAmount) as Total_Sales from customer  c inner join internetSales  i on c.customerkey = i.customerkey
group by c.customerkey;

-- Find the top 5 most expensive products by ProductName and ProductStatus.

select * from (
select i.productkey , productname , sum(SalesAmount) as Total_Sales from products   p inner join internetsales  i on p.productkey = i.productkey
group by i.productkey , productname order by Total_Sales desc)
where rownum <= 5;


-- or 

With CTE_Top_5_expensive_product AS(

select i.productkey , productname  , sum(SalesAmount) as Total_Sales ,
Dense_Rank() over(order by sum(SalesAmount) desc) as Rank_productkey
from products  p inner join internetsales  i on p.productkey = i.productkey group by i.productkey , productname

)


select * from CTE_Top_5_expensive_product where Rank_productkey <= 5;



-- Get all customers who made their first purchase in 2019.

select * from customer where Datefirstpurchase in
(select Datefirstpurchase from customer where To_char(datefirstpurchase , 'YYYY') = '2019'  );

-- List the number of sales orders per product.

select i.productkey , productname , count(orderdatekey) as Total_no_of_products from internetsales i inner join products  p on i.productkey = p.productkey
group by i.productkey , productname  order by Total_no_of_products desc;

-- Find customers who have not made any sales (i.e., no records in InternetSales).

select customerkey , Firstname  , lastname , Full_name from customer where customerkey not in
(select distinct customerkey from internetsales );


-- Update the SalesAmount by increasing it by 10% for orders with SalesAmount less than 500.

update internetsales set salesAmount = SalesAmount + (salesAmount * (10/100)) where SalesAmount < 500;


-- Delete all InternetSales records where ShipDatekey is before 20190101.


delete from internetsales where shipdatekey < 20190101;

Rollback;


-- 11.**Get a list of all sales with customer full name and product name.**

select Full_name , productname , sum(SalesAmount) as Total_Sales from customer  c inner join internetSales  i on c.customerkey = i.customerkey 
inner join products  p on p.productkey = i.productkey group by Full_name , productname;



-- 12.**Find total sales amount per month using `Calender` and `InternetSales` tables (join on orderdatekey = datekey).**

select To_char(FullDate ,  'Month') as MonthName ,
        To_char(FullDate , 'YYYY') as YearName ,
sum(SalesAmount) as Total_Sale from calender  c inner join internetsales  i
on c.Datekey = i.orderdatekey group by To_char(FullDate , 'Month') , 
To_char(FullDate , 'YYYY');


-- 13.**Show products that have never been sold (no entries in InternetSales).**

select * from products;

select productkey , productname from products  where productkey not in 
(select distinct productkey from internetsales);



-- 14.**List all customers along with their total purchase amount (if none, show 0).**

select c.customerkey , Full_Name , sum(SalesAmount) as Total_Amount from customer  c inner join internetsales  i on 
c.customerkey = i.customerkey group by c.customerkey , Full_Name order by Total_Amount desc;




-- 15.Find sales where the product color is 'Black' and sales amount is above 1000.**

select p.productkey , productname , productcolor , sum(SalesAmount) as Total_Sale
from products  p inner join internetsales  i on p.productkey = i.productkey
where productcolor = 'Black' 
group by p.productkey , productname , productcolor
having sum(SalesAmount) < 1000;


-- 16.**Find average SalesAmount per product category.**

select productcategory , cast(avg(SalesAmount) AS decimal(10,2)) as avg_SalesAmount_product from products  p inner join internetSales  i on 
p.productkey = i.productkey group by productcategory;


-- 17.**Get the total number of customers per city.**

select customer_city , count(customerkey) as No_of_customers from customer group by customer_city order by No_of_customers desc;


-- 18.Show the highest SalesAmount and lowest SalesAmount in the InternetSales table.** 

select min(SalesAmount) as Min_SalesAmount , max(SalesAmount) as Max_SalesAmount from InternetSales;


-- product along with Amount;

select * from (
select p.productkey , productname , min(SalesAmount) as Total_Sales from products  p inner join internetSales  i on p.productkey
= i.productkey group by  p.productkey , productname order by Total_Sales asc
)
where rownum <= 1

union 

select * from (
select p.productkey , productname , sum(SalesAmount) as Total_Sales from products  p inner join internetsales  i
on p.productkey = i.productkey group by p.productkey , productname order by Total_Sales desc
)
where rownum <= 1;


-- 



with CTE_min_salesamount AS(

select p.productkey , productname , min(SalesAmount) as Total_Sales , 
Dense_Rank() over(order by min(SalesAmount) asc) as Rank_min_Sale
from products  p inner join internetSales  i on p.productkey
= i.productkey group by  p.productkey , productname 

)
,

CTE_Max_SalesAmount AS(

select p.productkey , productname , sum(SalesAmount) as Total_Sales , 
Dense_Rank() over(order by sum(SalesAmount) desc) as Rank_max_Sale
from products  p inner join internetsales  i
on p.productkey = i.productkey group by p.productkey , productname

)


select * from CTE_Min_SalesAmount where Rank_min_Sale <= 1
union
select * from CTE_Max_SalesAmount where Rank_max_Sale <= 1;



-- 19.**Count how many sales orders were placed each quarter in 2019.**


select concat('Q' , Quarter) as Quarter , Year , count(Productkey) as Total_orders from calender  c inner join InternetSales  I on
c.Datekey  = I.orderdatekey  where year = 2019
group by Quarter , Year order by Quarter asc;


-- or



With CTE_Quarterwise_orders AS(

select concat('Q' , To_char(FullDate, 'Q')) as Monthss , To_Char(FullDate , 'YYYY') as Yearss , count(productkey) as No_of_orders
from InternetSales  I inner join Calender  c on I.OrderDatekey  = c.Datekey
where To_Char(FullDate , 'YYYY') = 2019
group by To_Char(FullDate , 'Q') , To_Char(FullDate , 'YYYY')


)


select * from CTE_Quarterwise_orders order by Monthss asc;




-- 20.Find the month with the highest sales in 2019.

 
 select * from 
 (
 select To_Char(FullDate , 'Month') as Month , To_char(FullDate , 'YYYY') as Year  , sum(SalesAmount) as Total_Sales
 from internetSales  I inner join Calender  c on I.OrderDatekey = c.Datekey 
 where year = 2019 group by To_char(FullDate , 'Month') , To_char(FullDate , 'YYYY')
 order by Total_Sales desc
 
 )
 
 where Rownum <= 1;
 
 
 -- or 
 
 With Highest_Sale_Month_2019 AS(
 
 select To_Char(FullDate , 'Month') as Month , To_char(FullDate , 'YYYY') as Year  , sum(SalesAmount) as Total_Sales ,
 Dense_Rank() over(partition by To_char(FullDate , 'YYYY') order by sum(SalesAmount) desc) as Rank_Salesamount
 from internetSales  I inner join Calender  c on I.OrderDatekey = c.Datekey 
 where year = 2019 group by To_char(FullDate , 'Month') , To_char(FullDate , 'YYYY')
 
 )
 
 select * from Highest_Sale_Month_2019 where Rank_Salesamount <= 1;
 
 
 commit;
 
 
 
 -- 22. Write a query to **find duplicate customer records** (same FirstName, LastName, and Datefirstpurchase).

 
 select FirstName , LastName , DateFirstpurchase , count(*) as duplicate_record
 from customer group by FirstName , LastName , Datefirstpurchase 
 having count(*) > 1;
 
 
 -- 24.Find all customers with missing or NULL gender and update it to 'Unknown'.
 
 update customer set gender = 'Unknown' where Gender in(
 select Gender from customer where Gender is null
 )
 
 
 
 -- 25.Write a query to find sales records where the product key does not exist in the Products table (data integrity check).
 
select * from internetSales where productkey not in (select productkey from products);

-- 26.Identify records in InternetSales where SalesAmount is NULL or zero.

select * from internetsales where salesamount is null or salesamount = 0;

-- 27.Check for any calendar dates that have invalid day names (e.g., Day NOT IN (‘Monday’, ‘Tuesday’, ...)).

select * from calender where Day not in ('Tuesday' , 'Wednesday' , 'Thursday' , 'Friday' , 'Saturday' , 'Sunday' , 'Monday');

-- 28.How do you find all customers who have never made a purchase?


select * from customer where customerkey not in (select distinct customerkey from internetsales)

-- 29.Write a query to find sales orders that have orderdatekey after dueDatekey (logical inconsistency).


select * from internetsales where orderDatekey > DueDatekey;

-- 30.Find sales where ShipDatekey is earlier than orderdatekey (shipping before order — likely error).

select * from internetsales where shipdatekey < orderdatekey;


-- 31.Find the top 3 customers with the highest total sales amount.


select * from (

select c.customerkey , FirstName , LastName , sum(SalesAmount) as Total_Sales 
from customer  c inner join InternetSales  I on c.customerkey = I.customerkey
group by c.customerkey , FirstName , LastName order by Total_Sales desc
)

where rownum <= 3;



-- or 

With CTE_Top_3_customers AS(

select c.customerkey , FirstName , LastName , sum(SalesAmount) as Total_Sales  , 
Dense_Rank() over(order by sum(SalesAmount) desc) as Rank_SalesAmount
from customer  c inner join InternetSales  I on c.customerkey = I.customerkey
group by c.customerkey , FirstName , LastName


)


select * from CTE_Top_3_customers where Rank_SalesAmount <= 3;



-- 32.Write a query to identify products with inconsistent sizes (e.g., ProductSize is NULL or empty).


select * from products where productsize  is null;


-- 33.Write a query to find the customer who spent the most money in each quarter of 2019.**

With CTE_highest_paid_customer AS(

select c.customerkey , Full_Name , concat('Q' , To_char(FullDate , 'Q')) as Quarter ,To_Char(FullDate , 'YYYY') as Year ,  sum(SalesAmount) , 
Dense_Rank() over(partition by To_Char(FullDate , 'Q') order by sum(SalesAmount) desc) as Rank_quarter_max_sale
from customer  c inner join InternetSales  I on c.customerkey = I.customerkey
inner join calender  cl on cl.Datekey = I.OrderDatekey
where To_Char(FullDate , 'YYYY') = 2019
group by c.customerkey , Full_Name , To_Char(FullDate , 'Q') , To_char(FullDate , 'YYYY')

)

select * from CTE_highest_paid_customer where Rank_quarter_max_sale <= 1;

commit;



-- 34 . Total Sales per Year


select To_Char(FullDate , 'YYYY') as Year , sum(SalesAmount) as Total_Sales from calender  c inner join internetsales  i on 
c.Datekey = i.orderdatekey group by To_Char(FullDate , 'YYYY') order by year asc;

-- 35.Customers with More Than 1 Purchase

select c.customerkey , FirstName , LastName , Full_Name , count(productkey) as Total_Purchase from customer  c inner join internetsales  i
on c.customerkey = i.customerkey group by c.customerkey , FirstName , LastName , Full_Name 
having count(productkey) > 1 order by Total_Purchase desc;

-- 36.Top 3 Cities by Customer Count

select * from (
select customer_city , count(distinct customerkey) as Total_no_of_customers from customer group by customer_city 
order by Total_no_of_customers desc
)
where Rownum <= 3;


-- or 


select * from (

select customer_city , count(customerkey) as Total_no_of_customers ,
Dense_Rank() over(order by count(customerkey) desc) as Rank_customerkey
from customer group by customer_city 

)

where rownum <= 3;


-- 37.Sales Trend by Month

select To_Char(FullDate , 'month') as Month , To_Char(fullDate , 'YYYY') as Year , sum(SalesAmount) as Total_Sales
from calender  c inner join internetsales  i on c.Datekey = i.orderdatekey
group by To_Char(FullDate , 'month') , To_Char(fullDate , 'YYYY');


-- 38.Most Sold Products by Revenue

select * from products;
select * from InternetSales;


select p.productkey , productname , sum(SalesAmount) as Total_revenue from products  p inner join internetsales  i on 
p.productkey = i.productkey group by p.productkey , productname order by Total_revenue desc;




-- 39.First Purchase Date per Customer

select customerkey , FirstName ,LastName , DateFirstpurchase from customer;

-- 40.Products Not Sold

select * from products where productkey not in
(select productkey from internetsales)

-- 41.Sales Distribution by Quarter**

select To_char(FullDate , 'Q') as Quarter , To_Char(FullDate , 'YYYY') as Year , sum(SalesAmount) as Total_Sales
from internetsales  i inner join calender  c on c.Datekey = i.orderdatekey group by To_Char(FullDate , 'Q') , 
To_char(FullDate , 'YYYY');



-- 42.Count of Male vs Female Customers


select Gender , count(*) as Total_no_of_customers from customer group by Gender;

-- or 

select Gender , 
       count(
            case
            
                   WHEN Gender = 'Male' THEN 1
                   WHEN Gender = 'Female' THEN 0
             END
             ) as Total_Customers
        from Customer group by Gender;
            



-- 43.Find all customers who made their first purchase on the latest date recorded in the customer table.


select customerkey , Full_Name , max(DateFirstPurchase) as latest_purchase from customer group by customerkey , Full_Name;



-- 44.Find the customers who made their first purchase later than the average first purchase date across all customers.

select * from customer where DateFirstPurchase > (select avg(DateFirstPurchase) from customer);


-- 45.Show customers who have not made any purchases yet.


select * from customer where customerkey not in (select customerkey from internetsales);

-- 46.List calendar dates where sales occurred but the total sales were below the average sales of all order dates.

with CTE_Date_Total_Sales AS(
select FullDate , sum(SalesAmount) as Total_Sales from calender  c inner join internetsales  i on c.datekey = 
i.orderdatekey group by FullDate

)


select * from CTE_Date_Total_Sales where Total_Sales < (select avg(Total_Sales) as avg_Sales from InternetSales);


-- 47.Find the product(s) that generated the highest total sales across all transactions.


select * from (
select p.productkey , productname ,  sum(SalesAmount) as Total_Sales from products  p inner join internetSales  i on
p.productkey = i.productkey group by p.productkey , productname order by Total_Sales desc

)

where rownum <= 1;


-- or

With Highest_Sales AS(

select p.productkey , productname , sum(SalesAmount) as Total_Sales ,
Dense_Rank() over(order by sum(SalesAmount) desc) as Rank_product_Sales
from products  p inner join internetsales  i on p.productkey
= i.productkey group by p.productkey , productname

)

select * from Highest_Sales where Rank_product_Sales <= 1;

