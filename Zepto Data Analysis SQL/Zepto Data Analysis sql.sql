-- Create database

Create database Zepto_project;


Use Zepto_project;

--drop table Zepto;


Create table zepto(

        sku_id int Identity(1,1) primary key ,
        Category varchar(100) Not null ,
        Name varchar(200) Not null ,
        mrp int Not null ,
        Discountpercent int Not null ,
        availableQuantity int not null ,
        DiscountSellingPrice int Not null ,
        weightInGms int Not null  ,
        Out_of_stock Bit Not null, 
        Quantity int Not null

)


-- Basically we just mention table code structure above but we inserted data by flat file option under the task
-- option in databasename under the object Explorer;
-- so we have primary column sku id which is we add externally by code 

Alter table Zepto add sku_id int identity(1,1) primary key;


select * from zepto;

--Exec sp_rename 'Zepto_V2' ,'Zepto';



-- Data Exploration


select count(*) from zepto;


-- check null values;


select * from zepto;

select * from zepto where category is null
or name is null 
or mrp is null 
or discount_percent is null 
or available_Quantity is null 
or discounted_Selling_Price is null 
or out_of_stock is null 
or quantity is null;


Exec sp_rename 'zepto.discountedSellingPrice' , 'discounted_Selling_Price';
Exec sp_rename 'zepto.discountpercent' , 'discount_percent';
Exec sp_rename 'zepto.availabel_Quantity' , 'available_Quantity';
Exec sp_rename 'zepto.weightInGms' , 'weightInGms';
Exec sp_rename 'Zepto.outofstock' , 'Out_of_stock';

select * from zepto;



-- Different Product Categories


select distinct(category) from zepto order by category asc;


-- How many products in stock and how many out of stock;

select * from zepto;

select Name , 
       count(
          case
		      when out_of_stock = 0 THEN 1
		  END) as Out_of_stock ,

		count(
		     case
			     WHEN out_of_stock = 1 THEN 1
			 END) as in_stock
		from zepto group by Name




-- How many


select 
      case
	      WHEN Out_of_stock = 0 THEN count(Name)
	  END as In_stock_count ,

	  case 
	      WHEN Out_of_stock = 1 THEN count(Name)
	  END as out_of_stock
	  from zepto group by out_of_Stock;

-- or 


select count(Name) as out_of_stock from zepto where out_of_stock = 0;
select count(Name) as out_of_stock from zepto where out_of_stock = 1;

-- or

select out_of_stock , 
       count(Name) as No_of_products
from 
    zepto
group by 
    out_of_stock;


-- product names present multiple times ;


select 
     name , 
     count(sku_id) as count_product_name 
from 
   zepto 
group by 
   name 
having
   count(sku_id) > 1
order by
   count_product_name desc;


-- or 

select 
    name , 
	count(name) as count_product_name 
from 
   zepto 
group by 
   name 
having 
   count(name) > 1
order by 
   count_product_name desc;




-- Data Cleaning;


-- product price = 0


select * from zepto where mrp = 0;


-- delete that record

delete from zepto where sku_id = 3607;


-- convert paise in rupees;



Update zepto set mrp = mrp / 100.0 , 
                 discounted_Selling_Price = discounted_Selling_Price / 100.0


select * from zepto;



-- 1. Top 10 best valued product based on discount_percentage;


With Top_ten_highest_percent_product AS(

select distinct name , mrp , discount_percent , 
Dense_Rank() over(order by discount_percent desc) as Rank_discount
from zepto

)

select * from Top_ten_highest_percent_product where Rank_discount <= 10
order by Rank_discount asc;



-- or 


select 
   Top 10 name , 
   mrp , 
   discount_percent 
from 
   zepto 
order by 
   discount_percent desc;

-- According to my understanding Top 10 means who are most earlest 10 products accroding to requirment lets take
-- example of here we have Top 10 by Rank means 10 diifferent discount percents and in Top 10 other query get Top 10
-- from overall query results means earliest 10 according to index numbers. It tsick on only 10 records only not on
-- 10 diiferent Rank records. so due to that getting different results .
-- According to my understanding Rank wise analysis is the more trusted that Top 10 .



-- 2. Which poducts have high mrp but out of stock;


With products_high_mrp_out_of_stock AS(

select 
   distinct name , 
   mrp , 
   out_of_stock , 
   Dense_Rank() over(order by mrp desc) as Rank_mrp
from 
   zepto where out_of_stock = 1 and mrp > 300

)

select * from products_high_mrp_out_of_stock order by Rank_mrp asc;



-- or 


select 
    distinct name ,
    mrp , 
	out_of_stock 
from 
   zepto 
where 
   out_of_stock = 1
and
   mrp > 300
order by 
   mrp desc;


-- 3. Calculated estimated revenue of each category;

With estimated_revenue AS(

select 
    category , 
	discounted_selling_price  , 
	availableQuantity ,  
    (discounted_selling_price * availableQuantity) as estimated_revenue
from 
   zepto

)

select 
    category , 
	sum(estimated_revenue) as estimated_revenue_per_category 
from 
   estimated_revenue
group by 
   category 
order by 
  estimated_revenue_per_category desc;


-- or 

select 
     category , 
     sum(availableQuantity * Discounted_selling_price) as estimated_revenue
from 
   zepto 
group by 
   category 
order by 
   estimated_revenue desc;

-- 4.Find the all products where mrp is greater than 500 and discount is less than 10% ?


select 
    distinct name , 
    mrp , 
	discount_percent 
from 
   zepto 
where 
   mrp > 500 
and 
   discount_percent < 10
order by
   mrp desc , discount_percent desc;


-- 5. Identifying Top 5 categories offering the highest average discount percentage 


With Top_five_categories_highest_avg AS(

select category ,
       avg(discount_percent) as avg_discount_percentage ,
	   Dense_Rank() over(order by avg(discount_percent) desc) as Rank_avg_discount_percent
	   from zepto
	   group by category

)

select * from Top_five_categories_highest_avg where Rank_avg_discount_percent <= 5;


-- or 


select 
    Top 10 category , 
    avg(discount_percent) as avg_discount_percent
from 
    zepto 
group by 
    category 
order by 
    avg_discount_percent desc;




-- 6.Find the price per gram for products above 100g and sort by best value

select 
   name , 
   discounted_selling_price  ,  
   weightingms  ,
   cast((cast(discounted_selling_price As decimal(10,2)) / weightingms) AS decimal(10,2)) as price_per_gram  
from 
  zepto
where weightingms != 0 
and  weightingms > 100
order by 
     price_per_gram asc;


-- 7.Group the products into categories like low , medium , bulk;

select 
    distinct Name , 
    weightingms ,
     case
	     WHEN weightingms >= 0 and weightingms <= 1000 THEN 'Low'
		 WHEN weightingms > 1000 and weightingms <= 5000  THEN 'Medium'
		 else  'Bulk'
	 END as group_weighwise
	 from zepto;


-- 8. What is total inventory weight per category;

select category , 
      sum(weightingms * availableQuantity) as Total_weight 
from 
   zepto
group by 
   category 
order by 
    Total_weight desc;


