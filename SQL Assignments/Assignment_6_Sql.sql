-- Q-1. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from worker where month(join_date) = 2 and year(join_date) = 2014;     -- mysql

select * from worker where extract (Month from joined_date) = 2 and extract (year from joined_date) = 2014;    -- Postgresql

select * from worker where Month(joined_date) = 2 and Year(joined_date) = 2014;             -- SSMS 



-- Q-2. Write an SQL query to fetch duplicate records having matching data in some fields of a table.


With duplicate_records AS(

select worker_id , 
       name, 
	   Row_number() over(partition by worker_id order by worker_id asc) as Row_number_name
       from worker group by worker_id , name
	   
	   
)

select * from duplicate_records where Row_number_name >= 2;



-- Q-3. How to remove duplicate rows from Employees table.


With Remove_duplicate_records AS(


select Employee_id , 
       name , 
	   Row_number() over(partition by Employee_id order by Employee_id asc) as Row_number_worker
       from Employee group by Employee_id , name

)

delete * from Remove_duplicate_records where Row_number_worker > 1;