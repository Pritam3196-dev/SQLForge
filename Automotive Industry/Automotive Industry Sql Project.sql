----- Create Database 

Create database Automotive_Industry_Project;


-----  Use that database


Use Automotive_Industry_Project;


------ Create Table 


Create table car_data(


         Name varchar(60)  , 
		 year int , 
		 selling_price int , 
		 km_driven int , 
		 fuel varchar(10) , 
		 seller_type varchar(20) ,
		 transmission varchar(20) , 
		 owner varchar(20) , 
		 mileage float , 
		 engine varchar(20) ,
		 max_power varchar(20) , 
		 torque varchar(30) , 
		 seats int );



select * from car_data;

--- 1. Calculate the average selling price for cars with a manual transmission and owned by the 
-- first owner, for each fuel type. ---


select  fuel , 
        cast(avg(selling_price) AS decimal(10,2)) as Avg_Selling_Price
        from car_data where transmission = 'Manual' and owner = 'First Owner'
        group by fuel order by avg(selling_price) desc;


--- 2. Find the top 3 car models with the highest average mileage, considering only cars with
-- more than 5 seats.


select name , 
       avg(mileage) as avg_mileage from car_data 
	   where seats > 5 group by name 
	   order by avg(mileage) desc Limit 3;


-- or 


With car_avg_mileage AS(

          select name , 
		  avg(mileage) , 
		  Rank() over(order by avg(mileage) desc) as Rank_mileage
		  from car_data where seats > 5 
		  group by name 
		  order by avg(mileage) desc
		  
)

select *  from car_avg_mileage where Rank_mileage <= 3;


--- 3. Identify the car models where the difference between the maximum and minimum selling prices 
-- is greater than $10,000. ---



with models_selling_price AS(
                            
							select name , cast(max(selling_price) AS decimal(10,2)) as max_price , 
							cast(min(selling_price) AS decimal(10,2)) as min_price 
							from car_data group by name 
							
							)

select * , cast(max_price - min_price AS decimal(10,2)) as selling_price_difference 
from models_selling_price where max_price - min_price > 10000 order by selling_price_difference desc;


-- or


select name ,
       max(selling_price) as max_price_of_model , 
	   min(selling_price) as min_price_of_model , 
	   max(selling_price) - min(selling_price) as selling_price_difference
       from car_data group by name 
       having max(selling_price) - min(selling_price) > 10000 
       order by selling_price_difference desc;



--- 4. Retrieve the names of cars with a selling price above the overall 
--average selling price and a mileage below the overall average mileage. ---


select name , 
       selling_price , 
       cast((select avg(selling_price) from car_data) AS decimal(10,2)) as overall_avg_selling_price ,
	   mileage , 
       cast((select avg(mileage) from car_data) AS decimal(10,2)) as overall_avg_mileage
       from car_data
       where (selling_price > (select avg(selling_price) from car_data)) 
	   and (mileage < (select avg(mileage) from car_data)) group by name ,  selling_price , mileage;


--- 5. Calculate the cumulative sum of the selling prices over the years for each car model. ---


select name , 
       year , 
	   selling_price , 
	   sum(selling_price) over(partition by name order by year) as cumulative_sum  --- by windows function over() , partition by()
       from car_data group by year , name , selling_price
       order by name asc , year asc;



--- 6. Identify the car models that have a selling price within 10% of the average selling price. ---


With car_models AS(

                    select name , 
					       selling_price , 
						   cast((select avg(selling_price) from car_data) AS decimal(10,2)) as avg_selling_price
                          from car_data group by name , selling_price
						  
)

select * , 
       cast((avg_selling_price / 10) AS decimal(10,2)) as  Ten_percent_avg_selling_price, 
       cast(avg_selling_price + (avg_selling_price / 10) AS decimal(10,2)) as Upper_limit,
       cast(avg_selling_price - (avg_selling_price / 10) AS decimal(10,2)) as lower_limit from car_models
       where (selling_price > (avg_selling_price - (avg_selling_price / 10)) 
       and selling_price < (avg_selling_price + (avg_selling_price / 10)));



-- or

select name , 
       selling_price from car_data 
	   where selling_price > (select avg(selling_price) from car_data) * 0.9
      and selling_price < (select avg(selling_price) from car_data) * 1.1
      order by name;



--- 7. Calculate the exponential moving average (EMA) of the selling prices for each car model, 
-- considering a smoothing factor of 0.2. ---

With EMA AS(

           select name , 
                  year , 
				  selling_price , 
				  cast(avg(selling_price) over(partition by name order by year rows between 
				  unbounded preceding and current row) AS decimal(10,2)) as Moving_Average  ,
                  Row_number() over(order by name asc) as Row_number
                  from car_data group by name , year , selling_price 
				  order by name asc , year asc , selling_price asc
)

select * , 
       cast(case
                 WHEN row_number = 1 THEN moving_average
			     ELSE (selling_price * 0.2) + (LAG(moving_average) over(partition by name order by year asc) * (1- 0.2))
		    END AS decimal(10,2)) as EMA from EMA order by name , year;



--- 8. Identify the car models that have had a decrease in selling price from the previous year. ---

With decrease_sells AS(
select name , year , selling_price, 
LAG(selling_price) over(order by year asc) as previous_year_sales,
Rank() over(partition by name order by year asc) as rank_car
from car_data group by name ,year ,selling_price
order by name asc , year asc
)

select *  from decrease_sells;

