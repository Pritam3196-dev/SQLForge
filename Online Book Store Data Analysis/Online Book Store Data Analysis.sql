Create database Online_Book_Store;

use Online_Book_Store;

---------- Create Books  Table ----------------------

Create Table Books(

          Book_ID Int primary key , 
		  Title  varchar(70) , 
		  Author varchar(30) ,
		  Genre varchar(20) ,
		  Published_Year Int ,
		  Price Float ,
		  Stock Int
);



----------- Create Customers Table -------------------------

Create Table Customers(

          Customer_ID int primary key , 
		  Name varchar(30) , 
		  Email Varchar(38) , 
		  Phone Int , 
		  City Varchar(30) , 
		  Country Varchar(60) 

);

------------ Create Orders Table ----------------------------------------------

Create Table Orders(

          Order_ID Int , 
		  Customer_ID Int , 
		  Book_ID Int , 
		  Order_Date Date ,
		  Quantity Int , 
		  Total_Amount Float ,
		  Foreign Key (Customer_ID) references Books(Book_ID),
		  Foreign Key (Book_ID) references Customers(Customer_ID)

);



-------------- Complete DML Statements -------------------------------------


select * from Books;
select * from Customers;
select * from Orders


----------------------- Analysis Get Statrted ---------------------------------------------

--1 .Retrive all books in the "Fiction" genre;


select * from books where genre in (select Genre from books where Genre = 'Fiction');

-- 2) Find books published after the year 1950;

select * from books where published_year in 
           (select published_year from books where published_year = 1950);


-- 3) List all customers from the Canada;


select * from customers where country in 
         (select country from customers where country = 'Canada');


-- 4) Show orders placed in November 2023;


select * from orders where order_Date in 
     (select Order_Date from orders where order_Date >= '2023-11-01'
	 and Order_Date <= '2023-11-30');

-- Or

select * from orders where Order_Date in
    (select order_Date from orders where order_Date between '2023-11-01' and '2023-11-30');



-- 5) Retrieve the total stock of books available;


select sum(stock) as Total_stock_of_books from books;


-- 6) Find the details of the most expensive book;

select Title , 
       max(price)as Price 
	   from books group by Title order by max(price) desc Limit 1;

-- or

with Books_price AS(
select Title , 
       max(price) , 
	   Rank() over(order by max(price) desc) as Price_Rank
	   from books
	   group by Title order by max(price) desc
)

select * from Books_Price where Price_Rank <= 1;


-- 7) Show all customers who ordered more than 1 quantity of a book;


select * from orders where quantity > 1;


-- 8) Retrieve all orders where the total amount exceeds $20;


select * from orders where total_amount > 20;

-- or

select Order_id , 
       Customer_id , 
	   book_id , 
	   order_date , 
	   quantity , 
	   concat('$' , cast(total_amount AS decimal(10,2))) as Total_amount
       from orders where total_amount > 20;


-- 9) List all genres available in the Books table;

select Distinct Genre from books;


-- 10) Find the book with the lowest stock;

select * from books order by stock asc limit 5;

-- or 

With Books_stock AS (


      select Title ,
	         Stock , 
			 Rank() over(order by stock asc) as rank_stock
			 from books 
			 group by Title , Stock 
			 order by stock asc
)

select * from Books_stock where Rank_Stock <=1;


-- 11) Calculate the total revenue generated from all orders;


select concat('$' , cast(sum(Total_amount) AS decimal(10,2))) as Total_Revenue_of_all_orders 
from Orders;


-- Advance Questions 

-- 1) Retrieve the total number of books sold for each genre;


select Genre , 
       sum(Quantity) as Total_books_sold from books as b 
       inner join orders as o on b.book_id = o.book_id
       group by Genre order by sum(Quantity) desc;


-- 2) Find the average price of books in the "Fantasy" genre;

select Genre , 
       concat( '$' , cast(avg(price) AS decimal(10,2))) as average_price 
       from books where Genre IN (select Genre from books where Genre = 'Fantasy')
       Group by Genre order by avg(price) desc;


-- 3) List Customers who have placed atleast 2 orders;


select c.customer_id , 
       name , 
	   count(order_id) as Total_orders from customers as c 
       inner join orders as o on c.customer_id = o.customer_id 
       group by c.customer_id , name
       having count(order_id) >= 2
       order by count(order_id) desc;


-- 4) Find the most frequently ordered book;


with order_frequency AS(

          select b.book_id , 
		         Title ,
		         count(b.book_id) , 
				 Rank() over(order by count(b.book_id) desc) as Rank_orders
				 from orders as o inner join books as b
				 on o.book_id = b.book_id
				 group by b.book_id , Title
				 order by count(b.book_id) desc

)

select * from order_frequency where Rank_orders <= 1;


-- or


select o.book_id , 
       title,
       count(o.book_id) as frequency_orders 
       from orders as o inner join books as b 
	   on o.book_id = b.book_id
	   group by o.book_id  , Title
	   order by count(o.book_id) desc Limit 7;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre;


select book_id , title , price
       from books group by book_id , title , price
	   order by price desc limit 3;

-- or

With Books_price AS (


      select book_id ,
	         title ,
			 price , 
			 Rank() over(order by price desc) as Rank_Price
			 from books group by book_id , title , price
			 order by price desc
)

select * from books_price where Rank_Price <= 3;


-- 6) Retrieve the total quantity of books sold by each author;

select author , 
       sum(quantity) as Total_Quantity_Books 
	   from books as b inner join orders as o
       on b.book_id = o.book_id
       group by author order by sum(quantity) desc;


-- 7) List the cities where customers who spent over $30 are located;

select city , 
       concat('$' , cast(sum(Total_Amount) AS decimal(10,2))) as Total_Spent from orders as o 
       inner join customers as c on o.customer_id = c.customer_id
       group by city 
	   having sum(Total_Amount) > 30
	   order by sum(Total_Amount) desc;


-- 8) Find the customer who spent the most on orders(Who more spent it does not concern how much
--    orders);

select c.customer_id  , name , 
       concat('$' , cast(sum(Total_Amount) AS decimal(10,2))) AS Total_spent from customers as c
       inner join orders as o on c.customer_id = o.customer_id
       group by c.customer_id , name 
	   order by sum(Total_Amount) desc Limit 1;
	   
-- or

With customer_spent_on_orders AS (

      select c.customer_id , 
	         name ,
			 concat('$',cast(sum(Total_Amount)AS decimal(10,2))) as Total_spent , 
			 Rank() over(order by sum(Total_Amount) desc) as Rank_
			 from customers as c inner join orders as o
			 on c.customer_id = o.customer_id
			 group by c.customer_id  , name 
			 order by sum(Total_Amount) desc


)

select * from customer_spent_on_orders where Rank_ <= 1;


--9) Calculate the stock remaining after fulfilling all orders;


select b.book_id ,Title , sum(stock) as Stock , sum(Quantity) as Order_Quantity , 
stock - sum(Quantity) as Stock_Available_After_Fulfil_Orders
from books as b 
inner join orders as o on b.book_id = o.book_id
group by b.book_id , Title
order by b.book_id;
