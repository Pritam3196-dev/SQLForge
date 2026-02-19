-- Create database

create database User_Behaviour_And_Recomendation_System_Chatgpt;


Use User_Behaviour_And_Recomendation_System_Chatgpt;



-- Creat tables;


-- Create independent table first who don't have foreign key;


Create table Users(

          User_Id int primary key ,
		  User_Name varchar(30) Not null ,
		  Email varchar(40) not null

);


Insert into Users(User_Id , User_Name , Email)
            values
(1, 'Alice', 'alice@mail.com'),
(2, 'Bob', 'bob@mail.com'),
(3, 'Carol', 'carol@mail.com'),
(4, 'Dave', 'dave@mail.com'),
(5, 'Eva', 'eva@mail.com'),
(6, 'Frank', 'frank@mail.com'),
(7, 'Grace', 'grace@mail.com'),
(8, 'Henry', 'henry@mail.com'),
(9, 'Irene', 'irene@mail.com'),
(10, 'Jack', 'jack@mail.com'),
(11, 'Karen', 'karen@mail.com'),
(12, 'Leo', 'leo@mail.com'),
(13, 'Maya', 'maya@mail.com'),
(14, 'Nathan', 'nathan@mail.com'),
(15, 'Olivia', 'olivia@mail.com'),
(16, 'Peter', 'peter@mail.com'),
(17, 'Quinn', 'quinn@mail.com'),
(18, 'Rita', 'rita@mail.com'),
(19, 'Steve', 'steve@mail.com'),
(20, 'Tina', 'tina@mail.com');



-- Create product table


Create table Products(


          Product_id int primary key ,
		  Product_Name varchar(40) not null ,
		  Category varchar(30) not null ,
		  Price int 

);


Insert into Products( Product_id , Product_Name , Category , Price)
            values
(101, 'iPhone 13', 'Electronics', 799),
(102, 'Galaxy S21', 'Electronics', 699),
(103, 'Laptop Dell', 'Electronics', 950),
(104, 'Bluetooth Speaker', 'Electronics', 120),
(105, 'Novel - Fiction', 'Books', 20),
(106, 'Notebook', 'Books', 15),
(107, 'Python Guide', 'Books', 30),
(108, 'Jeans - Men', 'Clothing', 40),
(109, 'T-Shirt - Women', 'Clothing', 25),
(110, 'Jacket - Unisex', 'Clothing', 60),
(111, 'Smartwatch', 'Electronics', 150),
(112, 'Charger', 'Electronics', 25),
(113, 'Backpack', 'Clothing', 45),
(114, 'Comic Book', 'Books', 18),
(115, 'Tablet - 10"', 'Electronics', 450),
(116, 'Mystery Novel', 'Books', 22),
(117, 'Hoodie - Unisex', 'Clothing', 35),
(118, 'USB-C Cable', 'Electronics', 10),
(119, 'Wireless Mouse', 'Electronics', 35),
(120, 'Sunglasses', 'Clothing', 30);




-- orders table


Create table Orders(

       Order_id int primary key ,
	   user_id int not null ,
	   order_date Date not null ,
	   foreign key (user_id) references Users(User_id)
);


Insert into Orders(Order_id , User_id , Order_date)
            values
(1001, 1, '2024-06-01'),
(1002, 2, '2024-06-02'),
(1003, 1, '2024-06-05'),
(1004, 5, '2024-06-07'),
(1005, 6, '2024-06-07'),
(1006, 7, '2024-06-08'),
(1007, 8, '2024-06-10'),
(1008, 3, '2024-06-11'),
(1009, 4, '2024-06-12'),
(1010, 9, '2024-06-13'),
(1011, 10, '2024-06-14'),
(1012, 11, '2024-06-14'),
(1013, 12, '2024-06-15'),
(1014, 13, '2024-06-15'),
(1015, 14, '2024-06-16'),
(1016, 15, '2024-06-17'),
(1017, 16, '2024-06-17'),
(1018, 17, '2024-06-18'),
(1019, 18, '2024-06-19'),
(1020, 19, '2024-06-20'),
(1021, 20, '2024-06-20'),
(1022, 1, '2024-06-21'),
(1023, 2, '2024-06-22'),
(1024, 3, '2024-06-22'),
(1025, 4, '2024-06-23');



--orderdetails table

Create table orderdetails(

              order_id int not null ,
			  product_id int not null ,
			  quantity int not null ,
			  Total_price int not null ,
			  foreign key (order_id) references orders(order_id),
			  foreign key (product_id) references products(product_id)
);


insert into orderdetails(order_id , Product_id , Quantity , Total_price)
            values
(1001, 101, 1, 799),
(1001, 112, 1, 25),
(1002, 105, 2, 40),
(1003, 111, 1, 150),
(1003, 118, 2, 20),
(1004, 110, 1, 60),
(1005, 107, 1, 30),
(1005, 114, 1, 18),
(1006, 108, 2, 80),
(1007, 103, 1, 950),
(1008, 119, 1, 35),
(1009, 109, 2, 50),
(1010, 117, 1, 35),
(1011, 102, 1, 699),
(1012, 113, 1, 45),
(1013, 104, 1, 120),
(1014, 115, 1, 450),
(1015, 116, 1, 22),
(1016, 106, 2, 30),
(1017, 108, 1, 40),
(1018, 107, 1, 30),
(1019, 109, 1, 25),
(1020, 119, 1, 35),
(1021, 120, 1, 30),
(1022, 101, 1, 799),
(1022, 112, 1, 25);




-- Product Recomendations


Create table Product_recommendations(

           Base_product_id int not null ,
		   Recommended_product_id int not null ,
		   Reason varchar(100),
		   Primary key(Base_product_id , Recommended_product_id) ,
		   foreign key (Base_product_id) references Products(product_id) ,
		   foreign key (Recommended_product_id) references Products(product_id)

);



Insert into product_recommendations(Base_product_id , Recommended_product_id , Reason)
values
(101, 112, 'Bought together'),
(102, 118, 'Accessory'),
(103, 119, 'Also viewed'),
(104, 111, 'Bought together'),
(105, 116, 'Similar genre'),
(106, 107, 'Study material'),
(108, 117, 'Style match'),
(109, 120, 'Same category'),
(110, 113, 'Outfit match'),
(115, 118, 'Cable needed');




--Recommendation_audit


Create table Recommendation_audit(

          User_id int not null ,
		  Base_product_id int not null ,
		  Recommended_product_id int not null ,
		  Shown_at Date not null ,
		  Clicked BIT not null ,
		  Foreign key (User_id) references Users(User_id),
		  foreign key (Base_product_id) references Products(Product_id)

);


Insert into Recommendation_audit(User_id , Base_product_id ,Recommended_product_id , Shown_at , Clicked )
       values
(1, 101, 112, '2024-06-02', 1),
(2, 105, 116, '2024-06-03', 0),
(1, 111, 118, '2024-06-06', 1),
(5, 110, 113, '2024-06-08', 0),
(6, 107, 106, '2024-06-08', 1),
(3, 103, 119, '2024-06-12', 1),
(4, 109, 120, '2024-06-13', 0),
(9, 117, 108, '2024-06-14', 1),
(10, 102, 118, '2024-06-15', 0),
(13, 115, 118, '2024-06-16', 1);






-- Data Analysis start

-- 1. Select all users who have made at least one order.

select 
     U.User_id , 
	 User_name , 
	 count(order_id) as No_of_orders 
from 
     users 
as 
    u 
inner join 
    orders 
as 
    o
on 
    u.user_id = o.user_id 
group by 
    U.user_id , User_name 
having 
    count(order_id) >= 1;


-- 2. Find all products in the Electronics category.

select * from products where category = 'Electronics';


-- 3.List all orders placed in June 2024.

select 
      * 
from 
    orders 
where 
    Datename(month , order_date) = 'June' 
and 
    Datename(Year , order_date) = 2024;


-- 4.Find all orders where the total price was more than \$500.

select 
     * 
from 
    orderdetails
where 
    Total_price 
in 
    (select Total_price from orderdetails where Total_price > 500);

-- 5.Get all users who never clicked any recommended product.

select 
     ra.user_id ,
	 User_name ,
	 Base_product_id ,
	 Recommended_product_id ,
	 clicked
	 from 
recommendation_audit 
as 
     ra 
inner join 
     users 
as 
     u 
on 
     ra.user_id = u.user_id 
where 
    clicked = 0;


-- 6.Find the top 5 most expensive products.

select Top 5 
       product_id , 
	   product_name , 
	   category , 
	   price
from 
       products 
order by 
       price desc;


-- or 

with Top_give_products AS(

select 
    product_id , 
	product_name , 
	category ,
    price ,
    Dense_Rank() over(order by price desc) as Rank_product
from 
    products

)


select * from Top_give_products where Rank_product <= 5;


-- 7.List users with email addresses ending in `.com`.

select 
     User_id , 
	 User_name , 
	 Email 
from 
     users 
where 
     email like '%.com';


-- 8.Find all products priced between \$20 and \$100.

select * from products where price between 20 and 100;

-- 9.Get all recommendations shown but never clicked.

select * from product_recommendations;


-- 10.List all orders made by user 'Alice'.

select 
    order_id ,
	o.user_id ,
	user_name  , 
	order_date 
from 
   orders 
as 
   o 
inner join 
   users 
as 
   u 
on 
   o.user_id = u.user_id
where 
   user_name = 'Alice';




-- 11. Count how many orders each user has made.


select 
    user_id , 
	count(order_id) 
as 
    No_of_orders 
from 
    orders 
group 
    by user_id
order by 
    user_id asc;



--  12. Find total sales amount per product.

select 
    p.product_id , 
	product_Name , 
	sum(Total_price * quantity) as Total_Sale
from 
    products  
as 
    p
inner join
    orderdetails 
as
    od
on 
    p.product_id = od.product_id
group by 
    p.product_id , product_name;


-- or 


with Total_Sale_per_product AS(

select 
    p.product_id , 
	product_Name , 
	quantity , 
	Total_price , 
	quantity * price as Sale
from 
    products 
as 
    p 
inner join 
    orderdetails 
as 
    od 
on 
    p.product_id = od.product_id


)



select 
    product_id , 
	product_Name , 
	Quantity , 
	Total_price , 
	sum(Sale) as Total_Sales
from 
    Total_Sale_per_product
group by 
    product_id , 
	product_name , 
	Quantity , 
	Total_price ;


-- 13. Find the average price of products by category.

select 
    product_id , 
	product_name , 
	avg(price) as avg_price_product 
from 
    products 
group by 
    product_id , product_name
order by 
    avg_price_product desc;


-- 14.Find the total quantity of each product ordered.

select 
   od.product_id , 
   product_Name , 
   sum(quantity) as Total_quantity_ordered 
from 
   orderdetails as od
inner join products as p
on od.product_id = p.product_id
group by 
   od.product_id ,
   product_name
order by 
   Total_quantity_ordered desc;


-- 15.Calculate the total revenue generated by each user.


select 
     o.User_id ,
	 user_name , 
	 sum(Quantity * Total_price) as Total_revenue
from 
     orderdetails 
as 
     od 
inner join 
     orders 
as 
     o 
on 
     od.order_id = o.order_id
inner join 
     users 
as 
     u 
on 
     o.user_id = u.user_id
group by 
     o.user_id , user_name
order by 
     Total_revenue desc;


-- 16.Find the number of times each recommended product was clicked.

select 
    Recommended_product_id , 
	count(clicked) as No_of_times_clicked
from 
    recommendation_audit 
where 
    clicked = 1 
group by 
    Recommended_product_id
order by 
    No_of_times_clicked desc;


--  or 


select Recommended_product_id ,
       sum(
            case
	            WHEN clicked = 1 THEN 1
		    END) as Total_clicks
from 
    recommendation_audit
group by 
    Recommended_product_id
having  
    sum(
	    case
	        WHEN clicked = 1 THEN 1
		 END) is not null
order by Total_clicks desc;


-- or 



select Recommended_product_id ,
       count(
            case
	            WHEN clicked = 1 THEN 1
		    END) as Total_clicks
from 
    recommendation_audit
group by 
    Recommended_product_id
having  
    sum(
	    case
	        WHEN clicked = 1 THEN 1
		 END) is not null
order by Total_clicks desc;



-- 17.Count how many recommendations each base product has.

select 
    Base_product_id , 
	count(Recommended_product_id) as No_of_recommened_products
from 
    product_recommendations 
group by 
    Base_product_id;


-- 18.Find the maximum price of products in each category.


with CTE_max_price_products_in_category AS(

select Category ,
       product_name , 
	   price ,
	   Dense_Rank()over(partition by Category order by price desc) as Rank_product_price
	   from products

)

select * from CTE_max_price_products_in_category where Rank_product_price <= 1;


-- or 


select 
     category , 
	 max(price) as max_price 
from 
     products 
group by category;


-- 19.Calculate the average order value per user.


-- Here count and avg gives same result due to data 

With avg_order_value_per_user AS(

select 
     product_id , 
	 count(order_id) as avg_no_of_orders 
from 
     orderdetails 
group by product_id
)



select * from avg_order_value_per_user;


-- 20.Find the total number of orders per day in June 2024.


select 
     order_date,
     count(order_id) 
as 
     Total_no_of_orders
from 
     orders
where 
      Datename(Month , order_date) = 'June' 
and 
      Datename(Year , order_date) = 2024
group by 
      order_date
order by 
      order_date asc;



-- or 


select 
     count(distinct(order_id)) 
as 
    Total_no_of_orders 
from 
    orders 
where 
    Datename(month , order_date) = 'June'
and 
    Datename(Year , order_date) = 2024;



-- 21.List users with their orders (user + order details).

select 
    u.user_id , 
	user_name , 
	email , 
	od.order_id , 
	od.product_id , 
	product_name , 
	Quantity , 
	Total_price ,  
	category , 
	price 
from 
    orders 
as 
    o 
inner join 
    users 
as 
    u 
on 
    o.user_id = u.user_id
inner join 
    orderdetails 
as 
    od
on 
    o.order_id = od.order_id 
inner join 
    products 
as 
    p 
on 
   od.product_id = p.product_id;


-- 22.Get order details along with product names and categories.

select 
    order_id , 
	p.product_id , 
	product_name , 
	Category , 
	quantity , 
	Total_price
from 
    orderdetails 
as 
    od 
inner join 
    products 
as 
    p 
on 
    od.product_id = p.product_id;


-- 23.Find all users and the recommended products they clicked on.

select 
   u.user_id , 
   user_name , 
   Email , 
   Base_product_id , 
   Recommended_product_id , 
   Shown_at , 
   Clicked
from 
   users 
as 
   u 
inner join 
   recommendation_audit 
as 
   ra 
on 
   u.user_id = ra.user_id
where 
   clicked = 1 ;

-- 24.List all products along with their recommendations and reasons.

select 
    p1.product_id , 
	p1.product_name , 
	p1.category , 
	p1.price , 
	pr.Recommended_product_id  , 
	p2.product_name as Recommended_product_name ,
	p2.Category
	Reason 
from 
    products 
as 
    p1
inner join 
    product_recommendations 
as 
    pr 
on 
    p1.product_id = pr.Base_product_id
inner join 
    products 
as 
    p2
on
    p2.product_id = pr.recommended_product_id;
   


-- 25.Find users who bought products and got recommendations for those products.




-- 31. Find users who placed orders but never clicked recommendations.


select 
   distinct user_id 
from 
   orders 
where 
   user_id in (select user_id from recommendation_audit where clicked = 0);


-- 32.Get products that have never been recommended.

select 
    * 
from 
   products 
where 
   product_id 
not in (
  select 
      Distinct(Recommended_product_id) 
from 
   Recommendation_audit
);



-- 33.Find products recommended but never clicked by any user.


select * 
     from 
recommendation_audit 
     as 
ra 
     inner join 
products 
     as pr
on
    ra.Recommended_product_id = pr.Product_id
where 
    Recommended_product_id not in (

select 
    Recommended_product_id 
from 
    recommendation_audit 
where 
    clicked = 1
)

-- 34.Get the latest order date for each user.

With Latest_order_date AS(

select user_id , order_date ,
Dense_Rank() over(partition by user_id order by order_date desc) as Rank_order_date
from orders

)


select * from Latest_order_date where Rank_order_date <= 1;

-- or 

select 
   user_id , 
   max(order_date) as Latest_order_date 
from 
   orders 
group by 
   user_id;


-- 35.Find products with above-average sales price.

select 
     * from products where price  >
     (select avg(price) as avg_Sale_price from products)


-- 36.List users who made more than 3 orders in June 2024.

select 
    user_id , 
	count(order_id) 
as 
    No_of_orders 
from 
    orders 
where 
    Datename(month , order_date) = 'June'
and 
    Datename(year , order_date) = 2024 
group by 
    user_id having count(order_id) > 3;


-- or



select 
   user_id , 
   count(order_id) 
as 
   No_of_orders 
from 
   orders 
where 
   month(order_date) = 6
and 
   year(order_date) = 2024 
group by 
   user_id 
having count(order_id) > 3;


-- 37.Find users who clicked recommendations but never bought the recommended product.


select ra.user_id ,  ra.Recommended_product_id , clicked  from recommendation_audit as ra where clicked = 1
and not exists
(select od.product_id from orders as o inner join orderdetails as od on o.order_id = od.order_id
  where o.user_id = ra.user_id and od.product_id = ra.Recommended_product_id )


select  user_id  , product_id from orders as o inner join orderdetails as od on o.order_id = od.order_id



-- 38.Get the top 3 recommended products with the highest click rates.

select Recommended_product_id  , 
       count(
	         case
			     WHEN clicked = 1 THEN 1
			 END) as Total_no_of_clicks
		from recommendation_audit
		group by Recommended_product_id
		order by Total_no_of_clicks desc;


-- or 

With Top_three_no_of_clicks_product AS(

select Recommended_product_id  ,
count(
     case
	     WHEN Clicked = 1 THEN 1
		 END ) AS Total_no_of_clicks , 
Dense_Rank() over(order by 
                   count(
                        case
	                        WHEN Clicked = 1 THEN 1
		                 END ) desc) as Rank_no_clicks
from recommendation_audit group by Recommended_product_id 

)

select * from Top_three_no_of_clicks_product where Rank_no_clicks <= 3;



-- 40.Find the users who clicked a recommendation within 7 days of the product purchase.

With click_recommendation_within_7_days_product_purchase AS(

select 
   ra.user_id , 
   Base_product_id , 
   Recommended_product_id , 
   shown_at , 
   order_date , 
   product_id 
from 
   recommendation_audit 
as 
   ra
inner join 
   orderdetails 
as 
   od 
on 
   od.product_id = ra.Recommended_product_id
inner join 
   orders 
as 
   o 
on 
   o.order_id = od.order_id

where clicked = 1

)

,

Days_difference AS(

select  *  , 
   Datediff(Day , shown_at , order_date) as date_diff 
from 
   click_recommendation_within_7_days_product_purchase

)

select *  from Days_difference where date_diff between 0 and 7;




-- 41.Rank products by total sales revenue.

select 
   p.product_id , 
   product_name , 
   Category , 
   sum(quantity * price) as Total_price , 
   Dense_Rank() over(order by sum(quantity * price) desc) as Rank_total_price
from 
   products as p 
inner join 
   orderdetails as od
on 
   p.product_id = od.product_id
group by 
   p.product_id , product_name , category;


-- 42. Find running total of sales per day.

select distinct order_date , sum(quantity * Total_price) as Total_Sale ,
sum(quantity * Total_price) over(order by order_date asc) as Running_total
from orders as o inner join orderdetails as od on o.order_id = od.order_id
group by order_date , Quantity , Total_price order by order_date


--or 


With order_date_wise_sale AS(

select order_date  , sum(quantity * Total_price) as Total_sale from orders as o inner join  orderdetails as od on
o.order_id = od.order_id group by order_date 

)


select order_date , Total_Sale , 
sum(Total_Sale) over(order by order_date asc) as Running_total
from order_date_wise_sale group by order_date , total_Sale;

 

-- 43.Calculate the click-through rate (CTR) for each recommended product.


With click_through_rate AS(

select Recommended_product_id , 
       count(
	         case
			     WHEN clicked = 1 THEN 1
			 END) AS No_of_clicks ,

	  count(clicked) as Total_no_of_times_recommended
	  from recommendation_audit
	  group by Recommended_product_id

)


select Recommended_product_id ,
       No_of_clicks ,
	   Total_no_of_times_recommended , 
	   concat(cast(No_of_clicks  * 100 / Total_no_of_times_recommended AS decimal(10,2)) , ' %')
	   as CTR_rate
	   from click_through_rate;



-- 44.Show each order with a rank of product quantity (most to least).


select 
     order_id , 
	 product_id , 
	 quantity , 
     Dense_Rank() over(partition by  order_id order by quantity desc) as Rank_product
from 
     orderdetails;



-- 45.Get cumulative revenue per user over time.

With Cummulative_revenue_per_user AS(

select u.user_id , user_name , order_date , quantity * total_price as Revenue 
from users as u inner join orders as o on u.user_id = o.user_id 
inner join orderdetails as od on o.order_id = od.order_id
group by u.user_id , user_name , order_date , quantity , total_price

)

,

summation_revenue AS(

select user_id , user_name , order_date , sum(Revenue) as Current_day_revenue
from cummulative_revenue_per_user
group by user_id , user_name , order_date

)


select * , sum(current_day_revenue) over(partition by user_id order by order_date asc) as cummlative_sum
from summation_revenue;




-- 46.Find the difference in days between order date and recommendation shown date for each user.



select 
    ra.user_id , 
	base_product_id , 
	order_date  ,
	recommended_product_id , 
	shown_at , 
    Datediff(day , order_date , shown_at)  as difference_in_days
from 
    orders 
as 
    o 
inner join 
    recommendation_audit 
as 
    ra 
on 
    o.user_id = ra.user_id;



-- 47.Calculate the average order size using a window function.


With avg_order_size AS(

select order_id , sum(quantity) as Total_quantity from orderdetails group by order_id

)

select avg(Total_quantity) over() as avg_order_size from avg_order_size;


-- 48.Find the top N users by total clicks on recommendations.



With Total_clicks_by_user AS(

select user_id,
count(
      case
	      WHEN clicked = 1 THEN 1
	  END) as Total_clicks
from recommendation_audit 
group by user_id

)
, 

Rank_total_clicks_user AS(

select * , Dense_Rank() over(order by Total_clicks desc) as Rank_total_clicks
from Total_clicks_by_user 
)

select * from Rank_total_clicks_user where Rank_total_clicks <= 3;


-- 49.Show the percentage contribution of each product to total sales.



With Sales_per_product_id AS(

select p.product_id , product_name , quantity * Total_price as Sale
from products as p inner join orderdetails as od on p.product_id = od.product_id

)
,

Sales_per_product AS(

select product_id , product_name , sum(Sale) as Total_Sale_of_product from Sales_per_product_id
group by product_id , product_name

)
,

Contribution_of_product_in_sale AS(

select * , (select sum(quantity * total_price) from orderdetails) as Total_Sale
from Sales_per_product

)

select * , concat(cast(total_Sale_of_product * 100 / Total_Sale AS decimal(10,0)) , '%') as Sale_contribution from contribution_of_product_in_sale;



-- 50. Find the first and last recommendation clicked by user.


select Top 1 user_id , shown_at , clicked , 
Dense_Rank() over(order by shown_at asc) as Rank_shown_at
from recommendation_audit where clicked = 1

union

select Top 1 user_id , shown_at , clicked , 
Dense_Rank() over(order by shown_at desc) as Rank_shown_at
from recommendation_audit where clicked = 1


-- 51.Write a query to update the reason for a recommendation.

update 
   product_recommendations 
set 
   Reason = 'Accessory' 
where Base_product_id = 102;


-- 52.Delete recommendations that have never been clicked.


delete from recommendation_audit where clicked = 0;


-- 53.Insert a new product and its recommendations.

insert into product_Recommendations(Base_product_id , Recommended_product_id , Reason)
values(115 , 120 , 'buy it');

-- 54.Find the most common reason for recommendations clicked.

select 
    Top 1 Reason , 
	count(Reason) as No_of_times_reason_come 
from 
    product_Recommendations
group by 
    Reason 
order by 
    No_of_times_reason_come desc;


-- 55.Optimize a query to find users with no orders and no clicks.

select 
    u.user_id , 
	order_id , 
	clicked 
from 
    users 
as 
   u 
left join  
   orders 
as 
   o 
on 
   u.user_id = o.user_id
left join 
   recommendation_audit 
as 
   ra 
on 
   u.user_id = ra.user_id 
and 
   clicked = 0
where 
   order_id is null 
and 
   clicked is null;


-- 56.Identify users with suspiciously high numbers of clicks but no purchases.


With High_clicks_but_no_purchase AS(

select 
    user_id , 
	count(clicked) 
as 
    No_of_clicks 
from 
    recommendation_audit 
where 
    clicked = 1 
group by 
    user_id 

)


select 
   User_id 
from 
   High_clicks_but_no_purchase 
where 
   user_id not in (select distinct user_id from orders)

-- or 

With High_clicks_but_no_placed_order AS(

select 
   user_id , 
   count(clicked) as No_of_clicks ,
   Dense_Rank() over(order by count(clicked) desc ) as Rank_clicks
from 
   recommendation_audit 
where 
   clicked = 1
group by 
   user_id

)

select * from High_clicks_but_no_placed_order where Rank_clicks = 1 and 
user_id not in (select distinct user_id from orders)




-- 57.Write a query to find orders with inconsistent total prices (manual calculation mismatch).


With CTE_orders_with_inconsistant_total_prices AS(
select 
    order_id , 
	od.product_id , 
	quantity , 
	price  , 
	(quantity * price) 
as 
    Total_price_q_p , 
    Total_price
from 
    orderdetails 
as 
    od 
inner join 
    products 
as 
    p  
on 
    od.product_id = p.product_id

)

select * from CTE_orders_with_inconsistant_total_prices where Total_price_q_p != Total_price;



-- 58.Generate a monthly sales report grouped by category and product.


select 
   category , 
   p.product_id , 
   product_name , 
   Datename(Month , order_date) as Month , 
   Datename(Year , order_date) as Year , 
   sum(Total_price) 
as 
   Total_price  
from 
   orderdetails 
as 
  od 
inner join 
  orders 
as 
  o 
on 
  od.order_id = o.order_id
inner join 
  products 
as 
  p on 
p.product_id = od.product_id
group by 
  Category , 
  p.product_id, 
  product_name , 
  Datename(Month , order_date) , 
  Datename(Year , order_date);



-- or 


select 
   category , 
   p.product_id , 
   product_name , 
   format(order_date , 'yyyy-MM') as Month_year, 
   sum(Total_price) as Total_price  
from 
   orderdetails 
as 
   od 
inner join 
   orders 
as 
   o 
on 
   od.order_id = o.order_id
inner join 
   products 
as 
   p 
on 
   p.product_id = od.product_id
group by 
   Category , 
   p.product_id, 
   product_name , 
   format(order_date , 'yyyy-MM');

