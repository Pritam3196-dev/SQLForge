
--- create database for this tables----
create database Ecommerce_User_recomendation_and_user_Behaviour_Analytics;

----- use database
use Ecommerce_User_recomendation_and_user_Behaviour_Analytics;


------------ creating product table -------------------

create table Products(ProductID int primary key , 
                      ProductName nvarchar(100),
					  Category nvarchar(50),
					  Price decimal(10,2),
					  Stock int);

------------- creating user table ------------------

create table Users(UserID int primary key ,
                   Name nvarchar(100),
				   Email nvarchar(100),
				   joinDate Date);


--------------------creating orders table -------------------

create table Orders(OrderID int primary key , 
                    UserID int , 
					OrderDate Date , 
					TotalAmount decimal(10,2),
					foreign key (UserID) references Users(UserID));


-------------------- creating orderdetails table -------------------------

create table OrderDetails(OrderDetailID int primary key , 
                          OrderID int,
						  ProductID int,
						  Quantity int,
						  Subtotal decimal(10,2),
						  foreign key (OrderID) references Orders(OrderID),
						  foreign key (ProductID) references Products(ProductID));



--------------------------- creating RecomendationAudit table -----------------------


create table RecomendationAudit( AuditID int primary key,
                                 UserID int , 
								 ProductID int,
								 RecomendedDate Date , 
								 AuditDate Datetime,
								 foreign key (UserID) references Users(UserID) , 
								 foreign key (ProductID) references Products(ProductID));

-------------------- creating ProductRecommendations Table -----------------

create Table ProductRecommendations(RecommendationID int Primary key,
                                   UserID int ,
								   ProductID int , 
								   RecommendedDate Date , 
								   foreign key (UserID) references Users(UserID) , 
								   foreign key (ProductID) references Products(ProductID));


---Alter table ProductRecommendations add constraint primay_key_ID primary key (RecommnedationID);



------------------------ DML Statments --------------------------------------------

--------------------------------------- Inserting Data in Users ----------------------------

insert into Users (UserID , Name , Email , joinDate) values
                  (1, 'Alice', 'alice@example.com', '2024-01-15'),
(2, 'Bob', 'bob@example.com', '2024-03-22'),
(3, 'Charlie', 'charlie@example.com', '2024-05-10'),
(4, 'Diana', 'diana@example.com', '2024-06-01'),
(5, 'Eve', 'eve@example.com', '2024-07-12'),
(6, 'Frank', 'frank@example.com', '2024-08-15'),
(7, 'Grace', 'grace@example.com', '2024-09-10'),
(8, 'Hank', 'hank@example.com', '2024-10-01'),
(9, 'Ivy', 'ivy@example.com', '2024-11-05'),
(10, 'Jack', 'jack@example.com', '2024-12-01');



--------------------------------------- Inserting Data in Products ----------------------------

insert into Products(ProductID , ProductName , Category , Price , Stock) values
                    (101, 'Laptop', 'Electronics', 700.00, 50),
(102, 'Headphones', 'Electronics', 50.00, 200),
(103, 'Coffee Maker', 'Appliances', 80.00, 75),
(104, 'Smartphone', 'Electronics', 500.00, 120),
(105, 'Blender', 'Appliances', 60.00, 90),
(106, 'Tablet', 'Electronics', 300.00, 100),
(107, 'Microwave', 'Appliances', 150.00, 40),
(108, 'Gaming Console', 'Electronics', 400.00, 30),
(109, 'Vacuum Cleaner', 'Appliances', 120.00, 60),
(110, 'Smartwatch', 'Electronics', 200.00, 150);


--------------------------------------- Inserting Data in Orders ----------------------------

insert into Orders(OrderID , UserID , OrderDate , TotalAmount) values 
                  (1, 1, '2024-06-10', 750.00),
(2, 2, '2024-07-05', 80.00),
(3, 3, '2024-07-15', 900.00),
(4, 4, '2024-08-01', 120.00),
(5, 5, '2024-08-20', 650.00),
(6, 6, '2024-09-05', 400.00),
(7, 7, '2024-09-25', 150.00),
(8, 8, '2024-10-10', 1000.00),
(9, 9, '2024-10-25', 200.00),
(10, 10, '2024-11-10', 750.00);


--------------------------------------- Inserting Data in OrderDetails ----------------------------

insert into Orderdetails(OrderDetailID , OrderID , ProductID , Quantity , Subtotal) values
                        (1, 1, 101, 1, 700.00),
(2, 1, 102, 1, 50.00),
(3, 2, 103, 1, 80.00),
(4, 3, 104, 1, 500.00),
(5, 3, 106, 2, 400.00),
(6, 4, 105, 2, 120.00),
(7, 5, 108, 1, 400.00),
(8, 5, 109, 2, 240.00),
(9, 6, 102, 8, 400.00),
(10, 7, 110, 1, 150.00);


--------------------------------------- Inserting Data in ProductRecomendations ----------------------------

insert into ProductRecommendations (RecommendationID , UserID , ProductID , RecommendedDate) values
(1, 1, 103, '2024-06-12'),
(2, 1, 104, '2024-06-15'),
(3, 2, 105, '2024-07-07'),
(4, 2, 106, '2024-07-09'),
(5, 3, 107, '2024-07-17'),
(6, 4, 108, '2024-08-05'),
(7, 5, 109, '2024-08-22'),
(8, 6, 110, '2024-09-07'),
(9, 7, 101, '2024-09-27'),
(10, 8, 102, '2024-10-12');


select * from Users;
select * from Products;
select * from Orders;
select * from Orderdetails;
select * from ProductRecommendations;
                   

------Q.1. fetch all orders placed by users who joined before march 2024 --------------------

select * from Orders;
select * from Users; 

select o.OrderID , o.UserID , O.TotalAmount ,o.OrderDate ,  u.joinDate from 
Orders as o inner join Users as u on o.UserID = u.UserID
where u.joinDate < ('2024-03-01');


--------------------- Q.2. List all products under the 'Electronics' category with price greater than $100;

select * from Products where Category = 'Electronics' and price > 100;

select * from products;


--------------------- Q.3. scaler function to calculate total revenue from all orders -------------------

--- scaler function is function to returns single value

select * from orders;

select sum(totalamount) from orders;


create function dbo.get_total_revenue()
Returns decimal(10,2) 
AS
Begin
        Declare @TotalRevenue decimal(10,2)
		select @TotalRevenue = sum(TotalAmount) from  orders;
		Return @TotalRevenue;

END;

select  dbo.get_total_revenue() as Total_Revenue;



--------------- Q. Function To return total products purchased by a specific user

create function dbo.get_total_products_user(@UserID int)
Returns int 
AS
Begin    

        Declare @total_products_user  int
        select @total_products_user = count(productID) from users as u inner join orders as o on u.userID = o.userID
        inner join orderdetails as od on o.orderID = od.orderID 
        where u.userID = @UserID;

		Return @total_products_user ;

end;

--drop function dbo.get_total_products_user;

Go
select  dbo.get_total_products_user(1) as total_products_by_user;


---- or

/*
Go
create function dbo.get_total_products_by_user(@userID INT)
Returns INT
AS
Begin
        Declare @total_products_ INT
        select @total_products_ = sum(Quantity) from orders as o inner join orderdetails as od 
        on o.orderID = od.orderID where o.userID = @userID;
		Return @total_products_;

End;


select dbo.get_total_products_by_user(2) as total_count_products_by_user;

*/



--------------- Q.4.Create function for most expensive product by sepcific user ?

Go
create function dbo.get_Most_Expensive_product_user(@userID INT)
Returns INT
AS
Begin
       Declare @most_expensive_product INT
       select Top 1  @most_expensive_product = p.productID from products as p inner join orderdetails as od 
	   on p.productID = od.productID
	   inner join orders as o on od.orderID = o.orderID
	   where UserID = @UserID order by price desc ;

	   Return @most_expensive_product

End;

--drop function dbo.get_Most_Expensive_product_user;

Go
select dbo.get_Most_expensive_product_user(5)as Most_Expensive_product;

/*
select top 1 p.productID , price from products as p inner join orderDetails as od 
on p.productID = od.productID
inner join orders as o on od.orderID = o.orderID
where userID = 5 order by p.price desc;
*/ 


------------------ Q.5.Average Order Value of a User ------------------------
Go
create function dbo.avg_order_value(@UserID INT)
Returns decimal(10,2)
As
Begin
      Declare @Avg_order_value  decimal(10,2)
	  select @Avg_order_value = avg(TotalAmount) from orders where userID = @UserID;
	  Return @Avg_order_value;

END;

Go
select dbo.avg_order_value(5) as avg_order_value_user;

-------------------------- Q.6. Number of Products Recommended to a User ------------------------------------


Go
create function dbo.product_Recommendation_count_user(@UserID INT)
Returns int
As
Begin 
       Declare @count_productID INT
       select @count_productID = count(productID) from productRecommendations as pr inner join users as u
       on pr.userID = u.userID where u.UserID = @UserID; 
	   Return @count_productID;
End;



Go
select dbo.product_Recommendation_count_user(1); 


------ Table valued  functions
---------------- Q.1. Total amount spent by each user in August 2024. -------------------


--select UserID , sum(TotalAmount) from orders  group by UserID  ;

--select orderID , TotalAmount from orders where userID = 3


--- *****Here no sny repeated orders by user so each user order at once so there is no need to group by and sum here

Go
create function dbo.total_amount_user_aug(@Month int ,   @Year int)
Returns Table
AS
Return
(

select UserID , TotalAmount from orders where (month(orderDate) = @Month and YEAR(orderDate) = @Year));


--select * from orders;


--drop function dbo.total_amount_user_aug;
Go
select * from dbo.total_amount_user_aug(8 , 2024);


---- 2. Products recommended to users who made a purchase in September 2024

Go
create function dbo.products_recommended_sep(@Month INT , @Year INT)
Returns Table
AS
Return 
(
select ProductID , pr.UserID , RecommendedDate  , OrderDate from ProductRecommendations as pr inner join Orders as o 
on pr.UserID = o.UserID 
where (month(OrderDate) = @Month  and  Year(OrderDate) = @Year)

);

--drop function dbo.products_recommended_sep;
select * from dbo.products_recommended_sep(9 , 2024); 


-------------3. Average price of products in the 'Electronics' category that have been purchased at least once


Go
create function dbo.Avg_price_category(@Category nvarchar(50))
Returns Table
AS
Return
(
select  Category , avg(price) as avg_price  from products as p inner join OrderDetails as od 
on p.productID = od.productID 
inner join orders as o on od.orderID = o.orderID
where category = @Category group by Category having count(Quantity) >= 1

);


select * from dbo.Avg_price_category('Electronics');


------- 4. Total number of products purchased by each user (only those who bought more than 3 items)

Go
create function dbo.number_products_purchased_user()
Returns Table
AS
Return
(
select UserID , sum(Quantity) as product_per_user from products as p inner join orderdetails as od 
on p.productID = od.productID
inner join orders as o on od.orderID = o.orderID group by userID having sum(Quantity) > 3

);



select* from  dbo.number_products_purchased_user();


----------------- 5. Most expensive product purchased by each user 


--- Wrong

(select userID , max(price) from products as p inner join orderdetails as od
on p.productID = od.productID
inner join orders as o
on od.orderID = o.orderID
group by userID);



--- 6.Function to Calculate Total Order Amount for a User

Go
create function dbo.total_order_amount_user(@UserID INT)
Returns Decimal(10,2)
AS
Begin 
      Declare @total_order_amount_user decimal(10,2)
      select @total_order_amount_user = sum(totalamount) from orders where userID = @UserID;
	  Return @total_order_amount_user;
End;


select  dbo.total_order_amount_user(6); 





----------      7.Function to Calculate Average Order Value of a User


Go
create function dbo.Avg_order_user(@UserID INT)
Returns decimal(10,2)
AS
Begin

     Declare @Avg_order_user decimal(10,2)
     select @Avg_order_user =  avg(TotalAmount) from orders where userID = @UserID  group by UserID;
	 Return @Avg_order_user;

END;

select dbo.Avg_order_user(2);


select  userID , totalamount from orders;



------- 8.Function to Get Product Price by Product Name 

Go
create function dbo.get_product_name_price(@product_name nvarchar(100))
Returns decimal(10,2)
AS
Begin
       Declare @product_price  decimal(10,2)
       select @product_price =  ISNULL(price , 0) from products where ProductName = @product_name;
	   Return @product_price;

End;

---- if product not found then it return null;

select dbo.get_product_name_price('Laptop') as price_of_product ;


--drop function get_product_name_price;



----- 9. Function to Check if User Has Purchased a Specific Product

Go
create function dbo.Get_user_purchase_specific_product(@productID INT , @UserID  INT)
Returns INT
AS
Begin 

       Declare @Has_product_purchase INT;

	   if exists(
	   select 1 from orders as o inner join orderdetails as od on o.orderID = od.orderID
	   inner join products as p  on od.productID = p.productID where od.productID = @productID and UserID = @UserID)

	   Begin 
	           SET @Has_product_purchase = 1;

		End

		ELSE 

		Begin 

		        SET @Has_product_purchase = 0;

		End 

		Return @Has_product_purchase;
End;



select dbo.Get_user_purchase_specific_product(105 , 4) as HasPurchase;



select userID , p.productID from orders as o inner join orderdetails as od on o.orderID = od.orderID
inner join products as p  on od.productID = p.productID;




--------------------------------------- Table Valued Function ---------------------------------------

-- 10.Function to Get All Orders by User

select * from orders;

Go
create function dbo.All_orders_by_user(@UserID INT)
Returns Table
AS
Return
(

select  UserID , count(orderID) as count_all_order_by_user from orders where UserID = @UserID group by UserID

);

Go
select * from dbo.All_orders_by_user(1); 



-------- 11.Function to Get Products Purchased by User

create function dbo.Get_products_purchased_by_user(@UserID INT)
Returns Table
AS
Return
(
select UserID , productname , Quantity  from orders as o inner join orderdetails as od on o.orderID = od.orderID
inner join products as p  on od.productID = p.productID where UserID = @userID 

);

select * from Get_products_purchased_by_user(6);




-- 12.Function to Get Users Who Bought a Specific Product

-- Create a table-valued function GetUsersWhoBoughtProduct(ProductID INT) that returns a list of 
--users who have purchased a particular product. The output should include the UserID, Name, and OrderDate.

Go
create function dbo.specific_product(@productID INT)
Returns Table
AS
Return
(
select o.UserID , Name , orderDate from users as u inner join orders as o on u.userID = o.userID
inner join orderdetails as od on o.orderID = od.orderID where productID = @productID 

);

select * from specific_product(102);


-- 13.Function to Get Orders for Products in a Category

-- Problem Statement:
--Create a table-valued function GetOrdersForCategory(CategoryName VARCHAR) that returns a list of orders containing 
--products from a specific category. The output should include the OrderID, UserID, OrderDate, and ProductName.


Go
create function dbo.orders_products_category(@category nvarchar(50))
Returns Table
AS
Return
(
select o.orderID , UserID , OrderDate , productName from orders as o inner join orderdetails as od on o.orderID = od.orderID 
inner join products as p on od.productID = p.productID where category = @category

);

select * from orders_products_category('Electronics');



-- 14.Function to Get Product Recommendations for a User 

select * from ProductRecommendations;

Go
create function dbo.Get_productRecommendation_User(@UserID INT)
Returns Table
AS
Return
(
select UserID , pr.productID , productName  , RecommendedDate  from ProductRecommendations as pr inner join products as p 
on pr.productID = p.productID where UserID = @UserID

);

select * from Get_productRecommendation_User(1);



--------------------======================= Day 2 ============================================------------------------------

---- 1.Transaction to place an order ensuring consistency   

BEGIN TRANSACTION;

BEGIN TRY 

          --- Insert a record of new order

		  INSERT INTO ORDERS(OrderID , UserID , OrderDate , TotalAmount) values
		  (12 , 2 , '2014-07-12' , 700);


		  --- Insert  a new record related to this order in orderdetails 

		  INSERT INTO OrderDetails(OrderDetailID , OrderID , productID , Quantity ,Subtotal) values
		  (12 , 13 , 101 , 1 , 700);


		  --- Update this details in product table because of we need to make consistancy in a table

		  Update Products set Stock = Stock - 1 where ProductID = 101;


END TRY

BEGIN CATCH

            RollBACK TRANSACTION;
			THROW;

END CATCH 


commit ;


select * from orders;
select * from OrderDetails;
select * from Products;



------- Stored Procedure 
-------- Q....Create store procedure add new user and recomend random product to user.

---- Basically it want insert new record in user table if userID is new and give recommendation means insert new record in
--- product recommendation table along with random product


Go

Create procedure Adduserandrecommendproduct
@UserID INT,
@Name nvarchar(100),
@Email nvarchar(100),
@JoinDate Date

AS

BEGIN

       ---- First we need to check is the user is already available 

	   IF EXISTS (select UserID from Users where UserID = @UserID)
	   BEGIN
	         
			 print 'Error : User is already exists'
			 Return
       END


	   DECLARE @ProductID INT
	   DECLARE @RecommendationID INT



	   ---- Now we inserting new user in user table because we are confirming user is not registered

	   Insert into Users (UserID , Name , Email , JoinDate) values
	                     (@UserID , @Name , @Email , @JoinDate);

	   
	   ----- Now we will create RecommendationID , Here we don't perform autoincreaments so we will manually increase count of
	    ---- index of next row


		select @RecommendationID = ISNULL(max(RecommendationID) , 0) + 1 from ProductRecommendations ;

		---- Here get next id of recoommendation table ... isnull() check is column is null.. if null then 0 else max(id)


		----- Now we want to recommend product so we will take random prodct from product table

		select TOP 1  @ProductID = productID from products order by NewID();
		---- NEWID() is the create randomness data and we choose very first data from that randomness data

		----- Now our data is ready for insert into ProductRecomendation table

		INSERT INTO ProductRecommendations(RecommendationID  , UserID ,ProductID , RecommendedDate) values
		                     (@RecommendationID , @UserID , @ProductID , GetDate())


		print 'New User and Its Recommened Products are added Successfully'



End; 


--drop procedure Add_user_and_recommend_product;
----- Adding ID 401

EXEC Adduserandrecommendproduct
     @UserID = 401,
     @Name = 'David Cleark',
     @Email = 'David.cleark@example.com',
     @JoinDate = '2024-12-06'



-- Adding 402;

EXEC Adduserandrecommendproduct
@UserID = 402 ,
@Name = 'Emma Taylor' ,
@Email = 'Emma.taylor@example.com'  ,
@JoinDate = '2024-12-07'

select * from Users;
select * from ProductRecommendations;

EXEC Adduserandrecommendproduct
@UserID = 409,
@Name = 'Ana',
@Email = 'Ana@example.com',
@JoinDate = '2024 - 12 - 08';


---- Analytical Questions 


---1.Fetch the total revenue grouped by product categories;

select category , sum(subtotal) as Total_revenue_per_category from products as p inner join orderdetails as od 
on p.productID = od.productID group by category order by total_revenue_per_category desc;


--- 2.Identifying TOP 2 User name , ID , totalamount  with the highest spending;


select * from orders;


select TOP 2 totalamount , UserID  from orders order by TotalAmount desc;

select Top 2 U.UserID ,  name , sum(totalamount) as highest_spending  
from users as u inner join orders as o on u.userID = o.userID group by U.UserID , name order by sum(totalamount) desc;



----- 3.Suggest products not yet purchased by specific user;

select p.productID , productName , category from products as p  where productID not in 
(select od.productID from products as p  inner join orderdetails as od 
on p.productID = od.productID 
inner join orders as o 
on od.orderID = o.orderID where userID = 1);




--------- 4.Create function Suggest products not yet purchased by specific user;

Go
create  function dbo.Get_products_not_purchased_by_user(@UserID INT)
Returns Table
AS
Return 
(
select p.productID , productName , category from products as p  where productID not in 
(select od.productID from products as p  inner join orderdetails as od 
on p.productID = od.productID 
inner join orders as o 
on od.orderID = o.orderID where userID = @UserID)
);


select * from dbo.Get_products_not_purchased_by_user(5);










