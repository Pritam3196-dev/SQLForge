-- Create database Employee_Trends;

Create database employee_trends;

-- Use Employee_trend database

Use Employee_Trends;


-- Create table Employee 


Create table Employee(Emp_no int primary key ,
                      Gender varchar(10),
					  Marital_status varchar(10) ,
					  age_band varchar(10) ,
					  age int ,
					  department varchar(20) ,
					  Education varchar(50) ,
					  Education_field varchar(20) ,
					  Job_Role varchar(50) ,
					  Business_travel varchar(50) ,
					  Employee_count int ,
					  Attrition varchar(10),
					  Attrition_label varchar(20) ,
					  Job_satisfaction int , 
					  active_employee int );


--- Check table 


select * from Employee;


-- 1.Count the number of employees in each department


select department , 
       count(emp_no) as No_of_Employees 
	   from employee 
	   group by department 
	   order by No_of_Employees desc;


-- 2.Calculate the average age for each department


select department , 
       avg(age) as avg_age_each_department 
	   from employee 
	   group by department 
	   order by department asc;


-- 3.Identify the most common job roles in each department


With Most_common_job_role AS(

select department , job_role , count(job_role) as No_of_job_roles , 
Dense_Rank() over(partition by  department order by count(job_role) desc) as Rank_employee
from employee group by department , job_role 

)


select * from Most_common_job_role where Rank_employee <= 1;




-- 4.Calculate the average job satisfaction for each education level 


select education , 
       avg(job_satisfaction) as avg_job_satisfaction 
	   from employee 
	   group by education;


-- 5.Determine the average age for employees with different levels of job satisfaction

select job_satisfaction , 
       avg(age) as avg_age 
	   from employee 
	   group by job_satisfaction;


-- 6.Calculate the attrition rate for each age band

With Attrition_rate_age_band AS(

select age_band , count(age_band) as no_of_age_band ,
(select count(age_band) from employee) as age_band_count
from employee where attrition = 'Yes' group by age_band

)


select  * , concat(cast((cast(no_of_age_band As decimal(10,2)) / age_band_count) * 100 As decimal(10,2)) , ' %')  
        as Attrition_rate 
        from Attrition_rate_age_band;



-- or 

With Attrition_rate_age_band AS(

select age_band ,
       SUM(
	         case
			     WHEN attrition = 'Yes' THEN 1
			 END) as No_of_attried_people , 

		(select count(age_band) from employee ) as count_age_band
		from employee group by age_band

)

select * , concat(cast(cast(No_of_attried_people AS decimal(10,2)) / count_age_band * 100 As decimal(10,2)) , ' %') as Attrition_percentage
from Attrition_rate_age_band order by age_band asc;



-- 7.Identify the departments with the highest average job satisfaction 

With Highest_job_satisfaction_department AS(

select department , avg(job_satisfaction) as avg_job_satisfaction , 
dense_rank() over(order by avg(job_satisfaction) desc) as Rank_department
from employee group by department

)

select * from Highest_job_satisfaction_department  where Rank_department <= 1;


-- or 

select Top 3 department , 
       avg(job_satisfaction) as avg_job_satisfaction
       from employee 
	   group by department 
	   order by avg_job_satisfaction desc;


-- 8.Find the age band with the highest attrition rate among employees with a specific education level



with age_band_with_highest_attrition_rate AS(

select age_band , 
       count(
	         case
			      WHEN attrition = 'Yes' THEN 1
			  END) as No_of_attried_people ,

		count(age_band) as count_age_band           
		from employee where education = 'Doctoral Degree'
		group by age_band


)

select Top 1 * , cast(cast(No_of_attried_people as decimal(10,2)) / count_age_band * 100 AS decimal(10,2))
as attrition_rate from age_band_with_highest_attrition_rate order by attrition_rate desc;


-- 25 - 34 age_band has highest attrition_rate about 21.43%



-- 9.Find the education level with the highest average job satisfaction among employees who travel frequently 

select Top 2 education , 
       avg(job_satisfaction) as avg_job_satisfaction 
	   from employee 
       where business_travel = 'Travel_Frequently' 
	   group by education 
	   order by avg_job_satisfaction desc;


-- or 

With education_level_of_highest_avg_job_satisfaction AS(

select education , avg(job_satisfaction) as avg_job_satisfaction  ,  
Dense_Rank() over(order by avg(job_satisfaction) desc) as Rank_education
from employee where business_travel = 'Travel_Frequently' group by education

)

select * from education_level_of_highest_avg_job_satisfaction where Rank_education <= 1;


-- 10.Identify the age band with the highest average job satisfaction among married employees

select  Top 5 age_band , 
        avg(job_satisfaction) as avg_job_satisfaction 
		from employee 
		where marital_status = 'Married'
        group by age_band 
		order by avg_job_satisfaction desc;


-- or 

With age_band_with_highest_job_satisfaction_married_employees AS(

select age_band , 
       avg(job_satisfaction) as avg_job_satisfaction  , 
       Dense_rank() over(order by avg(job_satisfaction) desc) as Rank_age_band from employee 
       where marital_status = 'Married' 
	   group by age_band
)

select * from age_band_with_highest_job_satisfaction_married_employees where Rank_age_band <= 1;


-- 11.Nth Highest Salary (salary column is not but if it is then this is the query)

With Highest_salary AS(

select * , 
       Dense_Rank() over(order by salary desc) as Rank_employee
       from employee

)

select * from Highest_salary where Rank_employee = 2;


-- 12.Find the age band with the highest attrition rate.

With age_band_with_highest_attrition_rate AS(

select age_band ,  
       count(
	        case
			     WHEN attrition = 'Yes' THEN 1
			END) as No_of_people_attried ,
		count(*) as No_of_people_in_each_age_band   -- instead count(age_band) if age_band is null then make issue
		from employee group by age_band

)


select Top 1  *  ,
cast(cast(No_of_people_attried AS decimal(10,2)) / No_of_people_in_each_age_band * 100 AS decimal(10,2)) 
as attrition_rate
from age_band_with_highest_attrition_rate order by attrition_rate desc;


-- Under 25 age band has most attrition rate which is 39.18 %.


-- 13.Which department has the highest number of active employees?

select Top 1 department , 
       count(
	        case
			    WHEN active_employee = 1 THEN 1
			END) as No_of_active_employees
		from employee
		group by department order by No_of_active_employees desc;
       

-- or


With Highest_active_employee_department AS(

select department , 
       sum(
	       case
		       WHEN active_employee = 1 THEN 1
			END) as No_of_active_employee , 
		Dense_Rank() over(order by sum(
	       case
		       WHEN active_employee = 1 THEN 1
			END) desc) as Rank_department
		from employee group by department

)

select * from Highest_active_employee_department where Rank_department <= 1;


-- or 


select Top 1 department , 
       count(active_employee) as No_of_active_employees 
	   from employee 
	   where active_employee = 1
       group by department 
	   order by No_of_active_employees desc;


-- R&D department has highest no of active employees. count of R&D is 828.



-- 14.Show the number of employees by education level and attrition status.

select education , 
       Attrition,
       count(*) as No_of_employees
	   from employee
	   group by education , Attrition;


-- or 


select education ,
       Attrition ,
       count(
	         case
			      WHEN Attrition = 'Yes' THEN 1
				  WHEN Attrition = 'No' THEN 1

			 END) as No_of_employees_in_education 
		from employee group by education , Attrition
		order by education asc , Attrition desc


-- 15.Which business travel category has the highest attrition rate?


With highest_attrition_rate_business_travel AS(

select Business_travel ,
       count(
	         case
			      WHEN Attrition = 'Yes' THEN 1
			 END) as No_of_employees_attried , 
		count(*) as No_of_employees_in_each_business_travel
		from employee group by Business_travel

)

select Top 1 *  , 
       cast(cast(No_of_employees_attried As decimal(10,2)) / No_of_employees_in_each_business_travel * 100 
	   As decimal(10,2)) as attrition_rate 
	   from highest_attrition_rate_business_travel 
	   order by attrition_rate desc;

-- or 

With Highest_attrition_rate_business_travel AS(

select e1.business_travel , 
       count(*) as No_of_employees_in_each_business_travel , 
	   (select count(*) from employee as e2 where attrition = 'Yes' and e1.business_travel = e2.business_travel
	    group by e2.business_travel) as no_of_attried_employees_in_each_business_travel
		from employee as e1
		group by e1.business_travel 

)

select Top 1 * , cast(cast(no_of_attried_employees_in_each_business_travel AS decimal(10,2)) / No_of_employees_in_each_business_travel * 100 As decimal(10,2))
as attrition_rate
from Highest_attrition_rate_business_travel order by attrition_rate desc;
       

-- 16.Get a list of job roles where more than 50% of employees have left (attrition = 'Yes').


With job_roles_more_than_50_percent_attrition AS(

select job_role , 
       count(
	        case 
			    WHEN attrition = 'Yes' THEN 1
			END) as No_of_employees_attried_in_each_role ,
		count(*) as No_of_employees_in_each_job_role 
		from employee
		group by job_role

)


select job_role from job_roles_more_than_50_percent_attrition 
where cast(cast(No_of_employees_attried_in_each_role As decimal(10,2)) / No_of_employees_in_each_job_role * 100 
As decimal(10,2)) > 50.00;


-- 17.Find the number of employees per marital status by gender.


select Gender , 
       marital_status , 
       count(*) as No_of_employees 
	   from employee 
	   group by gender , marital_status 
	   order by Gender asc;



-- 17.Compare attrition between males and females.


With attrition_rate_male_female AS(

select gender , 
       count(*) as No_of_employee_in_gender , 
	   count(
	         case
			      WHEN attrition = 'Yes' THEN 1
			 END) as no_of_attried_employee_in_gender
	   from employee
	   group by gender

)
select  * , cast(cast(no_of_attried_employee_in_gender AS decimal(10,2)) / No_of_employee_in_gender * 100 AS decimal(10,2))
as attrition_rate from attrition_rate_male_female;


-- Male has 17.01 % attrition_rate and female has 14.80 % attrition_rate;

-- 18.Find departments with zero attrition

With departments_with_zero_attrition AS(

select e1.department , 
       count(*) as No_of_employee_in_department , 
	   (select count(*) from employee as e2  where attrition = 'Yes' and e1.department = e2.department group by e2.department)
	   as count_of_attried_employee_in_department
	   from employee as e1
	   group by e1.department

)

select *  , cast(cast(count_of_attried_employee_in_department As decimal(10,2)) / No_of_employee_in_department * 100 AS decimal(10,2))
 as attrition_rate from departments_with_zero_attrition where 
 cast(cast(count_of_attried_employee_in_department As decimal(10,2)) / No_of_employee_in_department * 100 AS decimal(10,2))
 = 0.00



 -- or just 0 attrition(means 0 people leave)

 select department , 
        count(*) as No_of_people_attried
		from employee
		group by department
		having count(*) = 0

-- or 


select department , 
       count(
	         case
			     WHEN attrition = 'Yes' THEN 1
			 END) as No_of_attried_employee
		from employee
		group by department
		having count(
	         case
			     WHEN attrition = 'Yes' THEN 1
			 END) = 0;