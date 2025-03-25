-- Q-1. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select replace(first_Name , 'a', 'A') from worker;

-- Q-2. Write an SQL query to print all Worker details from the Worker table order by
-- FIRST_NAME Ascending and DEPARTMENT Descending.


select * from worker order by First_name asc , Department desc;


-- Q-3. Write an SQL query to fetch the names of workers who earn the highest salary in department.



with max_salary_per_department AS(

          select Name , 
		         salary , 
				 department ,
				 Rank() over(partition by department order by salary desc) as Rank_sal
		        from worker
				 
)

select * from max_salary_per_department where Rank_sal <=1;

