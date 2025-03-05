-- Create database Customer Sales Analysis

create database Customer_Sales_Analysis;


-- Use Customer Sales Analysis Database

Use Customer_Sales_Analysis;

------ We have three tables Customer , Order and Product Table

-- Create Customer Table

create table Customer(

             CustomerID varchar(10) primary key ,
			 CustomerName varchar(20),
			 Segment varchar(20));




-- Create Product table

Create table Product(
                   ProductID varchar(10) primary key , 
				   ProductName varchar(30) ,
				   Category varchar(30),
				   SubCategory varchar(30));






-- Create Order Table

create table orders(
          
		      OrderID varchar(10) primary key , 
			  OrderDate Date , 
			  CustomerID varchar(10),  
			  Region varchar(10),
			  ProductID varchar(10),    
			  Sales int , 
			  Profit int ,
			  Discount float,
			  Quantity int , 
			  Category varchar(30) ,
			  foreign key (CustomerID) references Customer(CustomerID),
			  foreign key (ProductID) references Product(ProductID));



----- Check Table 

select * from customer;
select * from Product;
select * from Orders;

-- Rename the table name from order to Orders  ( We already perform that change at time of creation of table)

-- EXEC sp_rename 'order', 'Orders';


-- 1. Total Sales by Category


select Category,
       sum(Sales) as Total_Sales 
	   from Orders group by Category order by Total_Sales desc;


-- 2. Count the Number of Orders for Each Customer


select CustomerID , 
       count(OrderID) as No_Of_Orders 
	   from orders group by CustomerID 
       order by  No_Of_Orders desc;


-- 3.Sales by Region with Rank


select Region , 
       sum(Sales) as Total_Sales ,
       Rank() over(order by sum(Sales) desc) as Sales_rank_region
       from orders group by region order by sales_rank_region asc;


-- 4. Analyze Customer Profitability by Segment

-- they want in each segment profitable customers


select c.customerID,
       Segment , 
       cast(sum(profit) AS decimal(10,2)) as Total_profit 
	   from Customer as c
       inner join orders as o 
	   on C.CustomerID = o.CustomerID
       group by c.CustomerID ,Segment order by Total_Profit desc;



-- 5. Rank Products by Sales within Each Category


select o.category , 
       productName , 
	   sum(sales) as Total_Sales,
       Rank() over(partition by o.Category order by sum(Sales) desc) as Rank_on_Products
       from orders as o
       inner join product as p on o.productID = p.productID
       group by o.Category , ProductName
       order by category asc;



-- 6. Total Sales per Customer by Product Category (sale>500) for year 2024;


select P.category , 
       CustomerName , 
	   sum(Sales) as Total_Sales 
	   from Product as p
       inner join orders as o on p.ProductID = o.ProductID 
       inner join Customer as c on o.CustomerID = C.CustomerID
	   where orderDate between '2024-01-01' and '2024-12-31'
       group by P.category , CustomerName
       having sum(Sales) > 500
       order by Total_Sales desc;


-- 7.Find all orders placed by a specific customer.

select OrderID , 
       o.CustomerID , 
	   o.Category,
	   o.ProductID , 
	   ProductName,
	   Sales , 
	   Discount from  orders as o inner join customer as c
       on o.customerID = c.customerID
       inner join product as P on o.ProductID = P.ProductID
       where customerName = 'Patricia Davis'
       group by OrderID , o.CustomerID , o.Category , o.ProductID , ProductName , Sales , Discount;



-- 8.Find customers with no orders.

select customerID from customer where customerID not in (select customerID from orders)


-- 9.Show the total number of products in each category.


select category , 
       count(ProductID) as Total_no_of_products
	   from Product group by category;


-- 10.List all orders and the corresponding customer names.

select OrderID ,  
       o.CustomerID , 
       c.CustomerName ,
	   productName, 
	   Quantity
	   from orders as o inner join customer as c
       on o.customerID = c.customerID
	   inner join Product as p 
	   on o.productID = p.productID;


--- Intermediate Analysis

-- 1.Find the average sales per order for each customer.

select orderID , 
       c.customerID,
	   CustomerName,
       cast(avg(Sales) AS decimal(10,2)) as average_sales_per_order 
	   from orders as o inner join customer as c
	   on o.CustomerID = c.customerID
	   group by orderID,c.customerID , customerName
       order by average_sales_per_order desc;

-- 2.Find the average sales for each customer.

select c.customerID , 
       customerName, 
	   avg(Sales) as average_Sales 
	   from customer as c inner join orders as o
      on c.customerID = o.customerID group by c.customerID, customerName
      order by average_Sales desc ;

-- 3.Show all products in a specific category.

select productID , 
       ProductName , 
	   Category 
	   from Product where category in 
	   (select category from product where category = 'Furniture');


-- 4.Find the total sales for each region.

select region , 
       sum(Sales) as Total_Sales 
	   from orders group by region;

-- 5.Get a list of customers who have made a purchase in a specific region (e.g., "North").

select o.customerID , 
       customerName , 
	   region 
	   from orders as o 
       inner join customer as c 
	   on o.customerID = c.customerID
       where region in 
	   (select region from orders where region = 'North')
       group by o.customerID , customerName , region;


-- 6.Find the product highly sold (based on sales).

select TOP 1 o.productID , 
       productName , 
	   sum(Sales) as Sales 
	   from product as p inner join orders as o
       on p.productID = o.ProductID group by o.ProductID , ProductName
       order by sales desc ;

-- or


With Highest_Selling_Product AS(

                     select p.productID , 
					        productName , 
							sum(sales) as Sales,
                            Rank() over(order by sum(Sales) desc) as Rank_Sales_amount
                            from product as p 
							inner join orders as o
                            on p.productID = o.productID 
							group by p.productID , ProductName
						)

select * from Highest_Selling_Product where Rank_Sales_amount <= 1;



-- 7.Show the top 5 customers by profit.

select Top 5 c.customerID , 
             CustomerName , 
			 sum(profit) as profit 
			 from customer as c inner join orders as o 
             on c.customerID = o.CustomerID
             group by c.customerID , customerName 
			 order by profit desc;


-- or

With highest_profit AS(
select o.customerID , CustomerName , sum(profit) as Profit , Dense_Rank() over(order by sum(profit) desc) as Rank_profit
from customer as c inner join orders as o
on c.customerID = o.customerID group by o.customerID  , CustomerName
)

select * from highest_profit where Rank_profit <=5;



--------- Advance Data Analysis



-- 1.Find the customer who generated the highest profit in the last month


select c.CustomerID , 
       CustomerName , 
	   sum(profit) as Profit 
	   from customer as c
       inner join Orders as o on c.customerID = o.orderID 
	   where (orderDate > Dateadd(Month , -1 , GETDATE())) and (OrderDate < GETDATE())
	   group by c.customerID , CustomerName order by profit desc;

--- It Gives results from 5-2-2025 to 4-2-2025;

-- 2.List the top 3 most popular products in each category based on sales quantity.


With Most_Poppular_Products AS(

                         select o.Category , 
                                P.ProductID , 
	                            ProductName , 
	                            sum(Quantity) as Quantity , 
                                Dense_Rank() over(partition by o.Category order by sum(Quantity) desc) as Dense_Rank_Quantity
                                from Product as P inner join
                                Orders as o on P.ProductID = o.ProductID
	                            group by o.Category , P.ProductID , ProductName 
)

select * from Most_poppular_Products where Dense_Rank_Quantity <= 3;


-- 3.Identify customers who bought products from multiple categories.


With multiple_category_Customer AS(

                                 select o.Category , 
                                        C.CustomerID , 
	                                    CustomerName  
	                                    from orders as o inner join customer as c
                                        on o.CustomerID = c.CustomerID 
										group by o.Category , c.customerID , CustomerName 
 
 
 )

select customerID , 
       CustomerName , 
	   count(category) as No_of_Categories 
	   from Multiple_Category_Customer
       group by CustomerID , CustomerName  having count(Category) > 1
       order by CustomerID , CustomerName ;



-- 4.Calculate the total discount given to each customer.


select C.CustomerID , 
       CustomerName , 
	   Cast(sum(Discount) * 100 AS Decimal(10,2)) as Total_Discount_in_Percentage
	   from orders as o inner join customer as c
       on o.CustomerID = C.CustomerID 
	   group by C.CustomerID , CustomerName 
	   order by Total_Discount_in_percentage desc;



-- 5.Find the products that have never been sold (i.e., not in any order).

select ProductID from Product where ProductID not in (
                   select ProductID from Orders group by ProductID);


-- 6.Find the average discount per order per product.

select OrderID ,
       P.ProductID , 
       ProductName , 
	   cast(avg(Discount) * 100 AS Decimal(10,2)) as average_Discount_Per_product_per_order_in_percentage
	   from orders as o inner join Product as P
       on o.ProductID = P.ProductID 
       group by OrderID , P.ProductID , ProductName 
	   order by OrderID , ProductID , ProductName;


-- 7.Find customers who ordered more than 1000 units in total across all orders.

select C.CustomerID , 
       CustomerName , 
	   sum(Quantity) as Total_units 
	   from customer as c inner join Orders as o
       on c.CustomerID = o.CustomerID 
	   group by c.customerID , CustomerName
       having sum(Quantity) > 1000 
	   order by Total_Units desc;


-- 8.List the top 5 products with the highest profit margin (i.e., profit divided by sales).

select Top 1 P.ProductID , 
           P.ProductName ,
		   sum(Profit) as Total_profit , 
		   sum(Sales) as Total_Sales,
           cast(cast(sum(Profit) AS decimal(10,2)) / Sum(Sales) * 100 AS decimal(10,2)) as Profit_margin
           from Product as p Inner join Orders as o on P.ProductID = O.ProductID
           group by P.ProductID , P.ProductName 
		   order by Profit_margin desc;

-- or

With Highest_Profit_Margin AS (
                          
						      select P.ProductID , 
							         ProductName , 
									 sum(Profit) as Total_Profit , 
									 sum(Sales) as Total_Sales,
                                     cast(cast(sum(Profit) AS decimal(10,2)) / sum(Sales) * 100 AS decimal(10,2)) as Profit_Margin , 
                                     Rank() over(order by cast(cast(sum(Profit) AS decimal(10,2)) / sum(Sales) * 100 AS decimal(10,2)) desc) as Rank_Profit_margin 
                                     from Product as P inner join Orders as O on P.ProductID = O.ProductID
                                     group by P.ProductID , ProductName 

)

select * from Highest_Profit_Margin where Rank_Profit_Margin <= 1;



-- 9.Find the most profitable region.

select Top 1 region , 
       sum(Profit) as Total_Profit 
	   from Orders group by region order by Total_Profit desc;

-- or


With Most_Profitable_Region AS(
                       
					         select region , 
							 sum(Profit) as Total_Profit  , 
							 Rank() over(order by sum(Profit) desc) as Rank_Total_Profit
                             from orders group by region 

)

select * from Most_Profitable_Region where Rank_Total_Profit <= 1;


-- 10.Show the monthly sales trend for the past year.


select Month(OrderDate) as Month , 
       sum(Sales) as Total_Sales_for_Month from orders
       where Year(OrderDate) = Year(Dateadd(Year , -1 , GETDATE()))
       group by Month(OrderDate) order by Month asc;


-- or


select Month(OrderDate)  as Month, 
       sum(Sales) as Total_Sales_for_Month
	   from Orders 
       where year(OrderDate) =  Year(GETDATE()) -1 
       group by Month(OrderDate)  order by Month asc;