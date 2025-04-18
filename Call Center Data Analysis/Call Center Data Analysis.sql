-- Create database call_center

create database call_center;

-- Use call_center database;

Use call_center;


-- create Table 


Create table call_center(


    id varchar(30) primary key ,
	customer_name varchar(50) ,
	sentiment varchar(20) , 
	csat_score int , 
	Call_timestamp Date ,
	reason varchar(20) ,
	city varchar(30) ,
	state varchar(30) ,
	channel varchar(30) , 
	response_time varchar(30) ,
	call_duration_in_minutes int ,
	call_center varchar(30)

);



-- check data 



select * from call_center;



---  Data cleaning ;


-- First finding empty columns and make them null;


select * from call_center where csat_score is null;





--1.Count of num of rows and num of columns in table ---

select count(*) as Total_no_of_rows from call_center;


select count(*) from information_schema.columns where table_name = 'call_center';

-- information_schema.columns is provide info about schema its give whole table which contains multiple columns
-- about schema after that you need to filter out those records where your table name is prsesnt; 



-- 2.Retrieve all records from the call_center table.

select * from call_center;


-- 3.Count total number of calls logged in the dataset.


select count(*) from call_center;

-- or 

select count(id) from call_center;

-- 4.Get the list of distinct states from which calls were received.

select distinct state from call_center;

-- 51 distinct states 


-- 5.Get the number of calls per city.

select city , count(id) from call_center group by city order by city asc;

-- 6.List the calls that had a CSAT score below 5.


select * from call_center where csat_score < 5;


-- 7.Find all calls where sentiment is 'Negative' or 'Very Negative'.

select * from call_center where sentiment = 'Negative' or sentiment = 'Very Negative';

-- 8.Get the average CSAT score for each call_center.

select call_center ,                                                   
       avg(csat_score) as avg_csat_score 
	   from call_center
	   where csat_score is not null
       group by call_center ;

-- 9.Count how many calls were handled above or below SLA.


select  count(*) from call_center where response_time  = 'above SLA' or response_time =  'Below SLA';

-- 10.List all calls that happened in October 2020.


select * 
       from call_center 
	   where extract(Month from call_timestamp) = 10 
       and extract(Year from call_timestamp) = 2020;




-- 11.Get the average call duration for each channel.

-- Alter table call_center Rename column call_duration_uin_minutes to call_duration_in_minutes;


select channel , 
       avg(call_duration_in_minutes) as avg_call_duration_minutes
	   from call_center group by channel;




-- 12.Retrieve the top 5 cities with the highest number of negative sentiments.


select city ,
       count(
             case
				  WHEN sentiment = 'Negative' or  sentiment = 'Very Negative' THEN 1
			  END) as Total_no_of_negative_sentiments
		from call_center
		group by city 
		order by Total_no_of_negative_sentiments desc LIMIT 5;


-- or 



With Most_negative_sentiments_city AS(

select city  , sum(

                      case 
					       WHEN sentiment = 'Negative' or sentiment = 'Very Negative' THEN 1

                       END) as Total_no_of_negative_sentiments ,

				Dense_Rank() over(order by sum(
                                               case 
											        WHEN sentiment = 'Negative' or sentiment = 'Very Negative' 
													THEN 1
												 END) desc) as Rank_city
				from call_center group by city

)


select * from Most_negative_sentiments_city where Rank_city <= 5;
					   
					   

				
-- 13.List the total number of calls handled by each call center, sorted in descending order.


select call_center , 
       count(id) as Total_no_of_calls 
	   from call_center 
       group by call_center 
	   order by Total_no_of_calls desc;


-- or 


select call_center , 
       count(id) as No_of_calls  , 
       Dense_Rank() over(order by count(id) desc) as Rank_call_center
	   from call_center
	   group by call_center;


-- 14.Find the **average CSAT score per state** where the sentiment is not null.



select cast(avg(csat_score) AS decimal(10,2)) as avg_csat_score 
       from call_center 
	   where sentiment is not null;


-- 15.Identify the **longest call duration** and the details of that call.

select * 
       from call_center 
	   where call_duration_in_minutes =  (select max(call_duration_in_minutes) from call_center);


-- 16.Get the number of calls where `response_time` is **'Below SLA'** and `call_duration_in_minutes` 
--is **greater than 30**.


select * from call_center where response_time = 'Below SLA' and call_duration_in_minutes > 30;


-- 17.Which `state` had the **lowest average CSAT score**?

select state , 
       cast(avg(csat_score) AS decimal(10,2)) as avg_csat_score 
	   from call_center 
	   group by state 
       order by avg_csat_score asc LIMIT 1;


-- or 


With Lowest_avg_csat_score_state AS(
 
         select state , 
		        cast(avg(csat_score) AS decimal(10,2)) as avg_csat_score  , 
				Dense_Rank() over(order by avg(csat_score) asc) as Rank_state
                from call_center 
				group by state

)

select * from Lowest_avg_csat_score_state where Rank_state <= 1;


-- 18.Find all records where `csat_score` is null but sentiment is `Very Positive`.


select * from call_center where csat_score is null and sentiment = 'Very Positive';


-- 19.Get the **monthly trend** of calls (grouped by month and year).

select extract(Year from call_timestamp) as Year , 
       extract(Month from call_timestamp) as Month  , 
	   count(id) as No_of_calls
       from call_center 
	   group by extract(Year from call_timestamp) , extract(Month from call_timestamp) 
	   order by Month asc;


-- or 


select extract(Year from call_timestamp) as Year , 
       extract(Month from call_timestamp) as Month , 
	   count(id) as No_of_calls ,
       Row_number() over(partition by extract(Year from call_timestamp) 
	   order by extract(Month from call_timestamp) asc) as Row_number_month
       from call_center group by extract(Year from call_timestamp) , extract(Month from call_timestamp);


-- 20.Rank the cities by **number of calls**, and show their rank.


select city , 
       count(id) as No_of_calls , 
	   Dense_Rank() over(order by count(id) desc) as Rank_city
       from call_center group by city;


-- 21.Write a query to find the **correlation** between `call_duration_in_minutes` 
-- and `csat_score` (conceptual).


select csat_score , call_duration_in_minutes from call_center where csat_score is not null 
order by call_duration_in_minutes desc;

-- or 

select csat_score ,sum(call_duration_in_minutes) as call_duration from call_center
where csat_score is not null group by csat_score order by call_duration desc;


-- just copy the result of this query and go in powerBi of excel and create visualization of scatter plot
-- and understand how is correlation positive , negative or neutral 

-- 22.How would you identify patterns in call volume spikes 
-- by reason and city over time (e.g., billing questions in Detroit)?


select city , count(
                    case 
					     WHEN reason = 'Service Outage' THEN 1
					 END) as No_of_service_outage ,
				count(

                     case 
					      WHEN reason = 'Payments' THEN 1
					  END) as No_of_payemnets , 

				count(
				      case 
					      WHEN reason = 'Billing Question' THEN 1
					   END) as No_of_Billing_Questions

				from call_center
				group by city;




-- or 


select city , 
       count(
             case 
			      WHEN reason = 'Billing Question' THEN 1
			 END) as No_of_billing_questions
		from call_center group by city order by No_of_billing_questions desc;


-- Just plot that result data in excel or powerbi and make visualization of any plot and visualize data is
-- following any kind of pattern 


-- 23.Write a query to calculate the average csat_score for each state, only for calls that were resolved 
-- 'Within SLA' and lasted more than 20 minutes.


select city , 
       cast(avg(csat_score) AS decimal(10,2)) as avg_csat_score 
	   from call_center 
	   where response_time = 'Within SLA' and call_duration_in_minutes > 20 
	   group by city;

-- or 


select city , 
       cast(avg(csat_score) AS decimal(10,2)) as avg_csat_score 
	   from call_center 
	   where response_time in (select response_time from call_center where response_time = 'Within SLA') 
	   and call_duration_in_minutes in (select call_duration_in_minutes from call_center where call_duration_in_minutes > 20)
	   group by city order by avg_csat_score desc;


	
-- 24.Write a query to list the top 5 cities with the highest number of 'Very Negative' sentiments, 
-- where csat_score is less than 3.


select city , 
       count(
             case 
			     WHEN sentiment = 'Very Negative' THEN 1
			 END) as No_of_negative_sentiments
	   from call_center where csat_score < 3
	   group by city order by No_of_negative_sentiments desc LIMIT 7;


-- or 


With Most_negative_sentiment_city_with_csat_score_less_than_three AS(

select city , 
       count(
             case 
			      WHEN sentiment = 'Very Negative' THEN 1
			 END) as No_of_negative_sentiments ,

	   Dense_rank() over(order by count(
	                                   case 
			                               WHEN sentiment = 'Very Negative' THEN 1
			                            END) desc) as Rank_city
		from call_center where csat_score < 3 group by city 

)

select * from Most_negative_sentiment_city_with_csat_score_less_than_three where Rank_city <= 5;


-- 25.Write a query to get the monthly call volume trend (grouped by month and year) for each channel.

select extract(Year from call_timestamp) as Year ,
       extract(Month from call_timestamp) as Month ,
	   channel , 
	   count(id) as No_of_calls
	   from call_center 
	   group by extract(Year from call_timestamp) , extract(Month from call_timestamp) , channel
	   order by Month asc;

-- or 

select channel , 
       extract(year from call_timestamp) as Year , 
	   extract(month from call_timestamp) as Month ,
	   count(id) as No_of_calls
	   from call_center
	   group by extract(Year from call_timestamp) ,
	   extract(Month from call_timestamp)  ,
	   channel order by Month asc;


-- 26.How would you write a query to rank call_center locations by their overall average CSAT score, 
-- excluding calls with NULL CSAT?


select call_center , 
       cast(avg(csat_score) As decimal(10,2)) as avg_csat_score,
       Dense_Rank() over(order by avg(csat_score) desc) as Rank_call_center
       from call_center 
	   where csat_score is not null
	   group by call_center;


-- 27.Write a query to find the percentage of calls from each state that were 'Above SLA'.

With calls_per_state AS(
              
			  select state , 
			         count(id) as No_of_calls 
					 from call_center 
					 where response_time = 'Above SLA' 
					 group by state
)


select state , 
       No_of_calls , 
      (select count(id) from call_center where response_time = 'Above SLA') as overall_calls ,
       concat(cast(cast(No_of_calls As decimal(10,2)) / (select count(id) from call_center 
	   where response_time = 'Above SLA') * 100 AS decimal(10,2))  , ' %')
	   as percentage_of_calls_of_state_above_SLA
	   from calls_per_state;

-- 28.Create a query to return the average call_duration_in_minutes by reason, ordered by highest to 
-- lowest duration.


select reason , 
        cast(avg(call_duration_in_minutes) AS decimal(10,2)) as avg_call_duration 
        from call_center 
		group by reason 
		order by avg_call_duration desc;


-- or 


select reason , 
       cast(avg(call_duration_in_minutes) AS decimal(10,2)) as avg_call_duration,
	   Dense_Rank() over(order by avg(call_duration_in_minutes) desc) as Rank_reason
	   from call_center group by reason;



-- 30.Write a query to find the number of calls per channel where response_time was 'Below SLA' 
-- and sentiment was either 'Negative' or 'Very Negative'.


select channel , 
       count(id) as No_of_calls 
	   from call_center 
	   where response_time = 'Below SLA' and 
       (sentiment = 'Negative' or sentiment = 'Very Negative') 
	   group by Channel;



-- 31.Write a query to get the average CSAT score by sentiment category, and order it from highest to lowest.


select sentiment , 
       cast(avg(csat_score) AS decimal(10,2)) as avg_csat_score 
	   from call_center group by sentiment
	   order by avg_csat_score desc;



-- 32.Write a query to find all records where the Call_timestamp is either incorrectly formatted or 
-- not a valid date.


select column_name , data_type from information_schema.columns where 
table_name = 'call_center' and column_name = 'call_timestamp';



-- its not satisfy the requirment of problem statment but it shows whole column haveing date data type;