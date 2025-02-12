-- Create database

create database blinkitdb;

--- Use that database

Use blinkitdb;

----------- start the DML statements ----------------------

-- check data is in proper manner in table

select * from blinkit_data;

-- check count

select count(*) as Total_Records from blinkit_data;

-- We want some Data cleaning in dataset

-- In  Item_Fat_content contains some incorrect or irreguar data


-- Regular and reg are same and Low Fat and LF are same 

select Item_Fat_Content , count(Item_Fat_Content) from blinkit_data group by Item_Fat_Content;
--Low Fat	5201
--Regular	2889
--reg	117
--LF	316

update blinkit_data set Item_Fat_Content = 'Regular' where Item_Fat_content = 'reg';
update blinkit_data set Item_Fat_Content = 'Low Fat' where Item_Fat_Content = 'LF';
Update blinkit_data set Item_Fat_Content = 'Low Fat' where Item_Fat_Content = 'low fat';

-- or

Update blinkit_data set Item_Fat_Content =  
case   

    WHEN Item_Fat_Content ='LF' THEN 'Low Fat' 

	WHEN Item_Fat_Content = 'reg' THEN 'Regular'

	WHEN Item_Fat_Content = 'low fat' THEN 'Low Fat'

	else Item_Fat_Content

END;

-- or

Update blinkit_data set Item_Fat_Content = 
case 

    WHEN Item_fat_Content IN ('low fat' , 'LF') THEN 'Low Fat'
	
	WHEN Item_fat_Content = 'reg' THEN 'Regular'

	else Item_Fat_Content

END;

-- To check

select Item_fat_Content as Category , 
       count(Item_fat_Content) as category_count
       from blinkit_data group by Item_fat_content;

--Low Fat	5517
--Regular	3006


-- 1.Total Sales

select * from blinkit_data;

select sum(total_Sales) as Total_Sales from blinkit_data;

--or

select round(sum(total_Sales) , 2) as Total_Sales from blinkit_data;

select cast(sum(Total_sales) / 1000000 AS decimal(10,2)) as Total_Sales_in_millions from blinkit_data;

select sum(Total_sales) / 1000000 as Total_Sales_in_millions from blinkit_data;

select round(sum(Total_sales) / 1000000 , 2) as Total_Sales_in_millions from blinkit_data

select concat(cast(sum(total_sales) / 1000000 as decimal(10,2)) , ' million') as Total_sales from blinkit_data;


-- 2.Average Sales

select cast(avg(Total_sales) AS decimal(10,1)) as 'Average_Sales' from blinkit_data;

-- 3.No Of Items


select count(Item_Type) as 'Total_no_of_items' from blinkit_data;

-- Total Sales for Low Fat

select Cast(sum(total_sales) AS decimal(10,2)) as 'Total Sales' 
       from blinkit_data 
       where Item_Fat_Content in (select Item_Fat_Content from blinkit_data where Item_Fat_Content = 'Low Fat');

-- or

select Cast(sum(total_sales) / 1000000 AS decimal(10,2)) as 'Total Sales in millions' 
       from blinkit_data 
       where Item_Fat_Content in (select Item_Fat_Content from blinkit_data where Item_Fat_Content = 'Low Fat');


-- Total sales for year 2022;


select Cast(sum(total_sales) / 1000000 AS decimal(10,2)) as 'Total Sales in millions' 
      from blinkit_data where Outlet_Establishment_Year in 
	  (select Outlet_Establishment_Year from blinkit_data where Outlet_Establishment_Year = 2022);

-- 4.Average Rating

select cast(avg(Rating)AS decimal(10,2)) as Average_Rating from blinkit_data;

-- 5. Total Sales by Fat Content:

select Item_Fat_Content , 
       cast(sum(total_sales) AS decimal(10,2)) AS Total_sales_by_Fat from blinkit_data group by Item_Fat_Content
       order by sum(total_sales) desc;

-- Average Sale by Fat Content

select Item_Fat_Content , 
       avg(total_sales) as Average_Sales_by_Fat from blinkit_data group by Item_Fat_Content
       order by avg(total_sales) desc;

-- No Of Items by Fat Content

select Item_Fat_Content , 
       count(Item_type) AS NO_Of_Items_by_Fat from blinkit_data group by Item_Fat_Content 
	   order by count(Item_type) desc;

-- Average rating by Fat Content

select Item_Fat_Content , 
       cast(avg(rating) AS decimal(10,2)) from blinkit_data group by Item_Fat_content
       order by avg(rating);

-- or

select Item_Fat_Content  , 
       cast(sum(Total_sales) As decimal(10,2)) as Total_sales ,
	   cast(avg(Total_sales) AS decimal(10,2)) as average_sales , 
	   cast(count(Item_type) AS decimal(10,2)) as No_of_Items , 
	   cast(avg(Rating) AS decimal(10,2)) as avg_Rating
	   from blinkit_data group by Item_Fat_content
	   order by Total_sales desc;


-- for year 2022;

select Item_Fat_Content  , 
       concat(cast(sum(total_sales) / 1000 AS Decimal(10,2)) , ' K')  as Total_sales_in_thousands ,
	   concat(cast(avg(Total_sales) / 1000 AS decimal(10,2)) , ' K') as average_sales_in_thousands , 
	   cast(count(Item_type) AS decimal(10,2)) as No_of_Items ,
	   cast(avg(Rating) AS decimal(10,2)) as avg_Rating
	   from blinkit_data where outlet_establishment_year = 2022
	   group by Item_Fat_content
	   order by Total_sales_in_thousands desc;


-- 6.Total Sales by Item Type

select Item_type , 
       cast(sum(total_sales) as decimal(10,2)) AS Total_Sales_In_Item_Type,
	   cast(avg(Total_sales) AS decimal(10,2)) as Avg_Sales ,
	   count(Item_type) as Total_No_Of_Item , 
	   cast(avg(Rating)AS decimal(10,2)) as Avg_Rating
	   from blinkit_data 
	   group by Item_Type 
	   order by Total_Sales_In_Item_Type desc;



-- Top 5 from above

select Top 5 
       Item_type , 
       cast(sum(total_sales) as decimal(10,2)) AS Total_Sales_In_Item_Type,
	   cast(avg(Total_sales) AS decimal(10,2)) as Avg_Sales ,
	   count(Item_type) as Total_No_Of_Item , 
	   cast(avg(Rating)AS decimal(10,2)) as Avg_Rating
	   from blinkit_data 
	   group by Item_Type 
	   order by Total_Sales_In_Item_Type desc;

-- 7.Fat Content by Outlet for Total Sales

select Outlet_Location_Type , 
       Item_Fat_content , 
	   concat(cast(sum(Total_sales) / 1000 as decimal(10,2)) , ' k') as Total_sales_In_Thousands,
       cast(avg(Total_sales) AS decimal(10,2)) as Avg_sales,
	   count(Item_type)  as Count_of_Items,
       cast(avg(Rating) AS decimal(10,2)) as Average_rating
       from blinkit_data 
       group by Outlet_Location_Type , Item_Fat_Content
	   order by Total_Sales_In_Thousands desc ;

---- Just I want like Outlet_Location_Type , Low_Fat , Regular (column name) contains total Sales

select Outlet_Location_Type , 

       cast(sum(CASE 
	       WHEN Item_Fat_Content = 'Low Fat' THEN Total_Sales 
		   END) AS decimal(10,2)) AS Low_Fat , 

		 cast(sum(CASE
		   WHEN Item_Fat_Content = 'Regular' THEN  Total_Sales 
		END )AS decimal(10,2)) AS Regular

		from blinkit_data group by Outlet_Location_Type
		order by sum(Total_sales) desc;



-- 8.Total Sales by Outlet Establishment


select Outlet_Establishment_Year , 
       cast(sum(Total_sales)  AS decimal(10,2)) as Total_sales  , 
	   cast(avg(Total_Sales) AS decimal(10,2)) as Avg_sales,
	   cast(count(Item_type) AS decimal(10,0)) as Total_count_Items,
	   cast(avg(rating) AS decimal(10,2)) as Avg_Rating
       from blinkit_data group by Outlet_Establishment_Year order by Total_sales desc;


-- 9.Percentage of Sales by Outlet Size

select Outlet_Size , 
       cast(sum(Total_Sales) AS decimal(10,2))as Total_Sales_by_outlet_size , 
       cast((select sum(total_sales) from blinkit_data) AS decimal(10,2)) as Overall_sales ,
       concat(cast(sum(Total_sales) / (select sum(total_sales) from blinkit_data)  * 100 As decimal(10,2)) , ' %')
       As Sales_Percentage 
	   from blinkit_data 
       group by Outlet_Size order by Sales_Percentage desc ;

-- 10. Percentage Sales By Outlet Location 

select Outlet_Location_Type , 
       cast(sum(Total_sales) AS decimal(10,2)) as Total_sales_by_outlet,
       cast((select sum(total_sales) from blinkit_data) AS decimal(10,2)) as Overall_Sales ,
       concat(cast(sum(Total_sales) / (select sum(Total_Sales) from  blinkit_data) * 100 AS decimal(10,2)) , ' %')
       as Sales_Percentage_by_Outlet_Location
       from blinkit_data group by Outlet_Location_Type
       order by Sales_Percentage_by_Outlet_Location desc;

-- 11. Sales By Outlet Location

select Outlet_Location_Type , 
       cast(sum(Total_sales) AS decimal(10,2)) as Total_sales_by_outlet
       from blinkit_data group by Outlet_Location_Type
       order by Total_sales_by_outlet desc;

-- 12. All metrics by Outlet Type 

select Outlet_Type ,
       cast(sum(Total_Sales) AS decimal(10,2)) as Total_Sales_By_Outlet_Type ,
       (select sum(Total_Sales) from blinkit_data) as Overall_Sales ,
	concat(cast(sum(Total_Sales) / (select sum(Total_Sales) from blinkit_data) * 100 AS decimal(10,2)) , ' %')
	as Sales_Percentage_By_Outlet_Type,
	cast(avg(Total_Sales) AS decimal(10,2)) as Avg_Sales_By_Outlet_Type , 
	cast(count(Item_Type) AS decimal(10,0)) as Count_Item_Type_By_Outlet_Type , 
	cast(avg(Rating) AS decimal(10,2)) as Average_Rating from blinkit_data
	group by Outlet_Type order by Total_Sales_By_Outlet_Type desc;
